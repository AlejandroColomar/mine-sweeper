/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Standard	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
		/* snprintf() & fflush() */
	#include <stdio.h>

/*	*	*	*	*	*	*	*	*	*
 *	*	* Other	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
		/* struct Game_Iface_... */
	#include "game_iface.h"

		/* game_tui() */
	#include "player_clui.h"
		/* game_tui() */
	#include "player_tui.h"

	#include "player_iface.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
	# define	TITLE_SIZE	(20)


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Global	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
int	player_iface_mode;

/*	*	*	*	*	*	*	*	*	*
 *	*	* Static	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	struct Player_Iface_Position	player_iface_position;
static	int				player_action;


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
	/* Actions */
static	void	player_iface_act	(struct Game_Iface_In	*game_iface_in);

	/* Actions:  game iface */
static	void	player_iface_act_start	(void);
static	void	player_iface_act_play	(struct Game_Iface_In	*game_iface_in);
static	void	player_iface_act_game	(struct Game_Iface_In	*game_iface_in);

	/* Actions:  player iface */
static	void	player_iface_move_up	(void);
static	void	player_iface_move_down	(void);
static	void	player_iface_move_right	(void);
static	void	player_iface_move_left	(void);
static	void	highlight_cursor	(void);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	player_iface_init	(int rows, int cols)
{
	player_iface_position.rows	= rows;
	player_iface_position.cols	= cols;

	switch (player_iface_mode) {
	case PLAYER_IFACE_CLUI:
		break;

	case PLAYER_IFACE_TUI:
		player_tui_init(rows, cols);
		break;
	}
}

int	player_iface_start	(int *pos_row, int *pos_col)
{
	/* Title */
	char	title[TITLE_SIZE];
	snprintf(title, TITLE_SIZE, "Start:");
	/* Subtitle */
	char	subtitle[TITLE_SIZE];
	snprintf(subtitle, TITLE_SIZE, "00:00 | 0");

	/* Start position */
	player_iface_position.row	= 0;
	player_iface_position.col	= 0;
	player_iface_position.highlight	= false;

	/* Loop until first step */
	do {
		switch (player_iface_mode) {
		case PLAYER_IFACE_CLUI:
			player_clui_start(&player_iface_position,
						title, subtitle, &player_action);
			break;

		case PLAYER_IFACE_TUI:
			player_tui_start(&player_iface_position,
						title, subtitle, &player_action);
			break;
		}

		player_iface_act_start();
	} while (player_action != PLAYER_IFACE_ACT_STEP &&
					player_action != PLAYER_IFACE_ACT_QUIT);

	*pos_row	= player_iface_position.row;
	*pos_col	= player_iface_position.col;

	int	fail;
	switch (player_action) {
	case PLAYER_IFACE_ACT_STEP:
		fail	= 0;
		break;

	case PLAYER_IFACE_ACT_QUIT:
		fail	= -1;
		break;
	}
	return	fail;
}

void	player_iface		(const	struct Game_Iface_Out	*game_iface_out,
				const	struct Game_Iface_Score	*game_iface_score,
					struct Game_Iface_In	*game_iface_in)
{
	/* Title */
	char	title[TITLE_SIZE];
	switch (game_iface_out->state) {
	case GAME_IFACE_STATE_XYZZY:
	case GAME_IFACE_STATE_CHEATED:
	case GAME_IFACE_STATE_PLAYING:
	case GAME_IFACE_STATE_PAUSE:
		snprintf(title, TITLE_SIZE, "Mines: %i/%i", game_iface_out->flags, game_iface_out->mines);
		break;

	case GAME_IFACE_STATE_GAMEOVER:
		snprintf(title, TITLE_SIZE, "GAME OVER");
		break;

	case GAME_IFACE_STATE_SAFE:
		snprintf(title, TITLE_SIZE, "You win!");
		break;
	}
	/* Subtitle */
	char	subtitle[TITLE_SIZE];
	int	hours;
	int	mins;
	int	secs;
	if (game_iface_score->time != CHEATED) {
		hours	= ((int)game_iface_score->time / 3600);
		mins	= (((int)game_iface_score->time % 3600) / 60);
		secs	= ((int)game_iface_score->time % 60);

		if (game_iface_score->time >= 3600) {
			snprintf(subtitle, TITLE_SIZE, "%02i:%02i:%02i | %i", hours, mins, secs, game_iface_score->clicks);
		} else {
			snprintf(subtitle, TITLE_SIZE, "%02i:%02i | %i", mins, secs, game_iface_score->clicks);
		}
	} else {
		snprintf(subtitle, TITLE_SIZE, "N/A");
	}

	/* Request player action */
	switch (player_iface_mode) {
	case PLAYER_IFACE_CLUI:
		player_clui(game_iface_out, &player_iface_position,
					title, subtitle, &player_action);
		break;

	case PLAYER_IFACE_TUI:
		player_tui(game_iface_out, &player_iface_position,
					title, subtitle, &player_action);
		break;
	}

	player_iface_act(game_iface_in);
}

void	player_iface_save_name	(const char *filepath, char *filename, int destsize)
{
	switch (player_iface_mode) {
	case PLAYER_IFACE_CLUI:
		player_clui_save_name(filepath, filename, destsize);
		break;

	case PLAYER_IFACE_TUI:
		player_tui_save_name(filepath, filename, destsize);
		break;
	}
}

void	player_iface_score_name	(char *player_name, int destsize)
{
	switch (player_iface_mode) {
	case PLAYER_IFACE_CLUI:
		player_clui_score_name(player_name, destsize);
		break;

	case PLAYER_IFACE_TUI:
		player_tui_score_name(player_name, destsize);
		break;
	}
}

void	player_iface_cleanup	(void)
{
	switch (player_iface_mode) {
	case PLAYER_IFACE_CLUI:
		break;

	case PLAYER_IFACE_TUI:
		player_tui_cleanup();
		break;
	}
	fflush(stdout);
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Actions	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	player_iface_act	(struct Game_Iface_In	*game_iface_in)
{
	switch (player_action) {
	case PLAYER_IFACE_ACT_STEP:
	case PLAYER_IFACE_ACT_FLAG:
	case PLAYER_IFACE_ACT_FLAG_POSSIBLE:
	case PLAYER_IFACE_ACT_RM_FLAG:
		player_iface_act_play(game_iface_in);
		break;

	case PLAYER_IFACE_ACT_PAUSE:
	case PLAYER_IFACE_ACT_SAVE:
	case PLAYER_IFACE_ACT_XYZZY_ON:
	case PLAYER_IFACE_ACT_XYZZY_OFF:
	case PLAYER_IFACE_ACT_XYZZY_LIN:
	case PLAYER_IFACE_ACT_XYZZY_P:
	case PLAYER_IFACE_ACT_XYZZY_NP:
	case PLAYER_IFACE_ACT_QUIT:
		player_iface_act_game(game_iface_in);
		break;

	case PLAYER_IFACE_ACT_MOVE_UP:
		player_iface_move_up();
		break;

	case PLAYER_IFACE_ACT_MOVE_DOWN:
		player_iface_move_down();
		break;

	case PLAYER_IFACE_ACT_MOVE_RIGHT:
		player_iface_move_right();
		break;

	case PLAYER_IFACE_ACT_MOVE_LEFT:
		player_iface_move_left();
		break;

	case PLAYER_IFACE_ACT_HIGHLIGHT:
		highlight_cursor();
		break;
	}
}

static	void	player_iface_act_start	(void)
{
	switch (player_action) {
	case PLAYER_IFACE_ACT_STEP:
	case PLAYER_IFACE_ACT_QUIT:
		break;

	case PLAYER_IFACE_ACT_MOVE_UP:
		player_iface_move_up();
		break;

	case PLAYER_IFACE_ACT_MOVE_DOWN:
		player_iface_move_down();
		break;

	case PLAYER_IFACE_ACT_MOVE_RIGHT:
		player_iface_move_right();
		break;

	case PLAYER_IFACE_ACT_MOVE_LEFT:
		player_iface_move_left();
		break;

	case PLAYER_IFACE_ACT_HIGHLIGHT:
		highlight_cursor();
		break;
	}
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Actions:  game iface	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	player_iface_act_play	(struct Game_Iface_In	*game_iface_in)
{
	switch (player_action) {
	case PLAYER_IFACE_ACT_STEP:
		game_iface_in->act_game[player_iface_position.row][player_iface_position.col]	=
					GAME_IFACE_GAME_ACT_STEP;
		break;

	case PLAYER_IFACE_ACT_FLAG:
		game_iface_in->act_game[player_iface_position.row][player_iface_position.col]	=
					GAME_IFACE_GAME_ACT_FLAG;
		break;

	case PLAYER_IFACE_ACT_FLAG_POSSIBLE:
		game_iface_in->act_game[player_iface_position.row][player_iface_position.col]	=
					GAME_IFACE_GAME_ACT_FLAG_POSSIBLE;
		break;

	case PLAYER_IFACE_ACT_RM_FLAG:
		game_iface_in->act_game[player_iface_position.row][player_iface_position.col]	=
					GAME_IFACE_GAME_ACT_RM_FLAG;
		break;
	}

	game_iface_in->action	= GAME_IFACE_ACT_PLAY;
}

static	void	player_iface_act_game	(struct Game_Iface_In	*game_iface_in)
{
	switch (player_action) {
	case PLAYER_IFACE_ACT_PAUSE:
		game_iface_in->action	= GAME_IFACE_ACT_PAUSE;
		break;

	case PLAYER_IFACE_ACT_SAVE:
		game_iface_in->action	= GAME_IFACE_ACT_SAVE;
		break;

	case PLAYER_IFACE_ACT_XYZZY_ON:
		game_iface_in->action	= GAME_IFACE_ACT_XYZZY_ON;
		break;

	case PLAYER_IFACE_ACT_XYZZY_OFF:
		game_iface_in->action	= GAME_IFACE_ACT_XYZZY_OFF;
		break;

	case PLAYER_IFACE_ACT_XYZZY_LIN:
		game_iface_in->action	= GAME_IFACE_ACT_XYZZY_LIN;
		break;

	case PLAYER_IFACE_ACT_XYZZY_P:
		game_iface_in->action	= GAME_IFACE_ACT_XYZZY_P;
		break;

	case PLAYER_IFACE_ACT_XYZZY_NP:
		game_iface_in->action	= GAME_IFACE_ACT_XYZZY_NP;
		break;

	case PLAYER_IFACE_ACT_QUIT:
		game_iface_in->action	= GAME_IFACE_ACT_QUIT;
		break;
	}
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Actions:  player iface	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	player_iface_move_up	(void)
{
	if (player_iface_position.row) {
		(player_iface_position.row)--;
	} else {
		player_iface_position.row	= player_iface_position.rows - 1;
	}
}

static	void	player_iface_move_down	(void)
{
	if (player_iface_position.row != player_iface_position.rows - 1) {
		(player_iface_position.row)++;
	} else {
		player_iface_position.row	= 0;
	}
}

static	void	player_iface_move_right	(void)
{
	if (player_iface_position.col != player_iface_position.cols - 1) {
		(player_iface_position.col)++;
	} else {
		player_iface_position.col	= 0;
	}
}

static	void	player_iface_move_left	(void)
{
	if (player_iface_position.col) {
		(player_iface_position.col)--;
	} else {
		player_iface_position.col	= player_iface_position.cols - 1;
	}
}

static	void	highlight_cursor	(void)
{
	player_iface_position.highlight	= !player_iface_position.highlight;
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
