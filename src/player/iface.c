/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include "mine-sweeper/player/iface.h"

#include <stddef.h>
#include <stdio.h>

#include <libalx/base/compiler/unused.h>
#include <libalx/base/stdio/printf/sbprintf.h>

#include "mine-sweeper/game/iface.h"
#include "mine-sweeper/player/clui.h"
#include "mine-sweeper/player/tui.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
#define TITLE_SIZE	(20)


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
/* Global --------------------------------------------------------------------*/
	int	player_iface_mode;
/* Static --------------------------------------------------------------------*/
static	struct Player_Iface_Position	player_iface_position;
static	int				player_action;


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
	/* Actions */
static	void	player_iface_act	(struct Game_Iface_In	*in);

	/* Actions:  game iface */
static	void	player_iface_act_start	(void);
static	void	player_iface_act_play	(struct Game_Iface_In	*in);
static	void	player_iface_act_game	(struct Game_Iface_In	*in);

	/* Actions:  player iface */
static	void	player_iface_move_up	(void);
static	void	player_iface_move_down	(void);
static	void	player_iface_move_right	(void);
static	void	player_iface_move_left	(void);
static	void	highlight_cursor	(void);


/******************************************************************************
 ******* global functions *****************************************************
 ******************************************************************************/
void	player_iface_init	(ptrdiff_t rows, ptrdiff_t cols)
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

int	player_iface_start	(ptrdiff_t *row, ptrdiff_t *col)
{
	char	title[TITLE_SIZE];
	char	subtitle[TITLE_SIZE];
	int	fail;

	UNUSED(alx_sbprintf(title, NULL, "Start:"));
	UNUSED(alx_sbprintf(subtitle, NULL, "00:00 | 0"));

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
	} while ((player_action != PLAYER_IFACE_ACT_STEP)  &&
				(player_action != PLAYER_IFACE_ACT_QUIT));

	*row	= player_iface_position.row;
	*col	= player_iface_position.col;

	switch (player_action) {
	case PLAYER_IFACE_ACT_STEP:
		fail	= 0;
		break;

	case PLAYER_IFACE_ACT_QUIT:
		fail	= -1;
		break;

	default:
		fail	= -2;
		break;
	}
	return	fail;
}

void	player_iface		(const	struct Game_Iface_Out	*out,
				const	struct Game_Iface_Score	*score,
					struct Game_Iface_In	*in)
{
	char	title[TITLE_SIZE];
	char	subtitle[TITLE_SIZE];
	int	hours;
	int	mins;
	int	secs;

	/* Title */
	switch (out->state) {
	case GAME_IFACE_STATE_XYZZY:
	case GAME_IFACE_STATE_CHEATED:
	case GAME_IFACE_STATE_PLAYING:
	case GAME_IFACE_STATE_PAUSE:
		UNUSED(alx_sbprintf(title, NULL, "Mines: %i/%i",
						out->flags, out->mines));
		break;

	case GAME_IFACE_STATE_GAMEOVER:
		UNUSED(alx_sbprintf(title, NULL, "GAME OVER"));
		break;

	case GAME_IFACE_STATE_SAFE:
		UNUSED(alx_sbprintf(title, NULL, "You win!"));
		break;
	}
	/* Subtitle */
	if (score->time != CHEATED) {
		hours	= ((int)score->time / 3600);
		mins	= (((int)score->time % 3600) / 60);
		secs	= ((int)score->time % 60);

		if (score->time >= 3600) {
			UNUSED(alx_sbprintf(subtitle,NULL,"%02i:%02i:%02i | %i",
					hours, mins, secs, score->clicks));
		} else {
			UNUSED(alx_sbprintf(subtitle, NULL, "%02i:%02i | %i",
					mins, secs, score->clicks));
		}
	} else {
		UNUSED(alx_sbprintf(subtitle, NULL, "N/A"));
	}

	/* Request player action */
	switch (player_iface_mode) {
	case PLAYER_IFACE_CLUI:
		player_clui(out, &player_iface_position, title, subtitle,
					&player_action);
		break;
	case PLAYER_IFACE_TUI:
		player_tui(out, &player_iface_position, title, subtitle,
					&player_action);
		break;
	}

	player_iface_act(in);
}

void	player_iface_save_name	(const char *fpath,
				char fname[static restrict FILENAME_MAX])
{

	switch (player_iface_mode) {
	case PLAYER_IFACE_CLUI:
		player_clui_save_name(fpath, fname);
		break;
	case PLAYER_IFACE_TUI:
		player_tui_save_name(fpath, fname);
		break;
	}
}

void	player_iface_score_name	(char player_name[static restrict BUFSIZ])
{

	switch (player_iface_mode) {
	case PLAYER_IFACE_CLUI:
		player_clui_score_name(player_name);
		break;
	case PLAYER_IFACE_TUI:
		player_tui_score_name(player_name);
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
static	void	player_iface_act	(struct Game_Iface_In	*in)
{

	switch (player_action) {
	case PLAYER_IFACE_ACT_STEP:
	case PLAYER_IFACE_ACT_FLAG:
	case PLAYER_IFACE_ACT_FLAG_POSSIBLE:
	case PLAYER_IFACE_ACT_RM_FLAG:
		player_iface_act_play(in);
		break;
	case PLAYER_IFACE_ACT_PAUSE:
	case PLAYER_IFACE_ACT_SAVE:
	case PLAYER_IFACE_ACT_XYZZY_ON:
	case PLAYER_IFACE_ACT_XYZZY_OFF:
	case PLAYER_IFACE_ACT_XYZZY_LIN:
	case PLAYER_IFACE_ACT_XYZZY_P:
	case PLAYER_IFACE_ACT_XYZZY_NP:
	case PLAYER_IFACE_ACT_QUIT:
		player_iface_act_game(in);
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
static	void	player_iface_act_play	(struct Game_Iface_In	*in)
{
	const int	r = player_iface_position.row;
	const int	c = player_iface_position.col;

	switch (player_action) {
	case PLAYER_IFACE_ACT_STEP:
		in->act_game[r][c]	= GAME_IFACE_GAME_ACT_STEP;
		break;
	case PLAYER_IFACE_ACT_FLAG:
		in->act_game[r][c]	= GAME_IFACE_GAME_ACT_FLAG;
		break;
	case PLAYER_IFACE_ACT_FLAG_POSSIBLE:
		in->act_game[r][c]	= GAME_IFACE_GAME_ACT_FLAG_POSSIBLE;
		break;
	case PLAYER_IFACE_ACT_RM_FLAG:
		in->act_game[r][c]	= GAME_IFACE_GAME_ACT_RM_FLAG;
		break;
	}

	in->action	= GAME_IFACE_ACT_PLAY;
}

static	void	player_iface_act_game	(struct Game_Iface_In	*in)
{

	switch (player_action) {
	case PLAYER_IFACE_ACT_PAUSE:
		in->action	= GAME_IFACE_ACT_PAUSE;
		break;
	case PLAYER_IFACE_ACT_SAVE:
		in->action	= GAME_IFACE_ACT_SAVE;
		break;
	case PLAYER_IFACE_ACT_XYZZY_ON:
		in->action	= GAME_IFACE_ACT_XYZZY_ON;
		break;
	case PLAYER_IFACE_ACT_XYZZY_OFF:
		in->action	= GAME_IFACE_ACT_XYZZY_OFF;
		break;
	case PLAYER_IFACE_ACT_XYZZY_LIN:
		in->action	= GAME_IFACE_ACT_XYZZY_LIN;
		break;
	case PLAYER_IFACE_ACT_XYZZY_P:
		in->action	= GAME_IFACE_ACT_XYZZY_P;
		break;
	case PLAYER_IFACE_ACT_XYZZY_NP:
		in->action	= GAME_IFACE_ACT_XYZZY_NP;
		break;
	case PLAYER_IFACE_ACT_QUIT:
		in->action	= GAME_IFACE_ACT_QUIT;
		break;
	}
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Actions:  player iface	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	player_iface_move_up	(void)
{

	if (player_iface_position.row)
		(player_iface_position.row)--;
	else
		player_iface_position.row	= player_iface_position.rows - 1;
}

static	void	player_iface_move_down	(void)
{

	if (player_iface_position.row != player_iface_position.rows - 1)
		(player_iface_position.row)++;
	else
		player_iface_position.row	= 0;
}

static	void	player_iface_move_right	(void)
{

	if (player_iface_position.col != player_iface_position.cols - 1)
		(player_iface_position.col)++;
	else
		player_iface_position.col	= 0;
}

static	void	player_iface_move_left	(void)
{

	if (player_iface_position.col)
		(player_iface_position.col)--;
	else
		player_iface_position.col	= player_iface_position.cols - 1;
}

static	void	highlight_cursor	(void)
{

	player_iface_position.highlight	= !player_iface_position.highlight;
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
