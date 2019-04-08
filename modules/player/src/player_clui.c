/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
	#include <stdbool.h>
	#include <stdio.h>

	#include "game_iface.h"
	#include "player_iface.h"

	#include "player_clui.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
	# define	BUFF_SIZE	(1024)


/******************************************************************************
 ******* enums ****************************************************************
 ******************************************************************************/


/******************************************************************************
 ******* structs **************************************************************
 ******************************************************************************/


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
/* Global --------------------------------------------------------------------*/
/* Static --------------------------------------------------------------------*/
static	int	oldaction;


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
	/* Start */
static	void	show_board_start(const struct Player_Iface_Position  *position,
				const char *title, const char *subtitle);

static	void	board_loop_start(const struct Player_Iface_Position  *position);

	/* Play */
static	void	show_board	(const struct Game_Iface_Out  *board,
				const struct Player_Iface_Position  *position,
				const char *title, const char *subtitle);

static	void	board_loop	(const struct Game_Iface_Out  *board,
				const struct Player_Iface_Position  *position);

static	char	set_char	(int game_iface_visible);
	/* Input */
static	int	usr_input	(void);
	/* Help */
static	void	show_help		(const struct Game_Iface_Out  *board);
static	void	show_help_start		(void);
static	void	show_help_play		(void);
static	void	show_help_pause		(void);
static	void	show_help_xyzzy		(void);
static	void	show_help_cheat		(void);
static	void	show_help_safe		(void);
static	void	show_help_gameover	(void);


/******************************************************************************
 ******* global functions *****************************************************
 ******************************************************************************/
void	player_clui_start	(const struct Player_Iface_Position  *position,
				const char *title, const char *subtitle,
				int *action)
{

	show_help_start();
	show_board_start(position, title, subtitle);
	*action		= usr_input();
	oldaction	= *action;
}

void	player_clui		(const struct Game_Iface_Out  *board,
				const struct Player_Iface_Position  *position,
				const char *title, const char *subtitle,
				int *action)
{

	if (oldaction != PLAYER_IFACE_ACT_FOO) {
		show_help(board);
		show_board(board, position, title, subtitle);
	}
	*action		= usr_input();
	oldaction	= *action;
}

void	player_clui_save_name	(const char *fpath, char *fname, int destsize)
{

	(void)fpath;

	printf("File name:\n");
	fgets(fname, destsize, stdin);
}

void	player_clui_score_name	(char *player_name, int destsize)
{

	printf("Your name:\n");
	fgets(player_name, destsize, stdin);
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Start	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	show_board_start(const struct Player_Iface_Position  *position,
				const char *title, const char *subtitle)
{

	printf("________________________________________________________________________________\n");
	board_loop_start(position);
	printf("%s	-	%s\n", subtitle, title);
	printf("--------------------------------------------------------------------------------\n");
}

static	void	board_loop_start(const struct Player_Iface_Position  *position)
{
	int	i;
	int	j;
	char	c;

	putchar('\n');
	for (i = 0; i < position->rows; i++) {
		for (j = 0; j < position->cols; j++) {
			c =	PLAYER_CLUI_CHAR_HIDDEN_FIELD;

			/* Print char */
			if (i == position->row && j == position->col) {
				putchar('<');
				putchar(c);
				putchar('>');
			} else {
				putchar(' ');
				putchar(c);
				putchar(' ');
			}
		}
		putchar('\n');
	}
	putchar('\n');
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Play	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	show_board	(const struct Game_Iface_Out  *board,
				const struct Player_Iface_Position  *position,
				const char *title, const char *subtitle)
{

	printf("________________________________________________________________________________\n");
	board_loop(board, position);
	printf("%s	-	%s\n", subtitle, title);
	printf("--------------------------------------------------------------------------------\n");

}

static	void	board_loop	(const struct Game_Iface_Out  *board,
				const struct Player_Iface_Position  *position)
{
	int	i;
	int	j;
	char	c;

	putchar('\n');
	for (i = 0; i < board->rows; i++) {
		for (j = 0; j < board->cols; j++) {
			c =	set_char(board->visible[i][j]);

			/* Print char */
			if (i == position->row && j == position->col) {
				putchar('<');
				putchar(c);
				putchar('>');
			} else {
				putchar(' ');
				putchar(c);
				putchar(' ');
			}
		}
		putchar('\n');
	}
	putchar('\n');
}

static	char	set_char	(int game_iface_visible)
{
	char	c;

	switch (game_iface_visible) {
	case GAME_IFACE_VIS_KBOOM:
		c	= PLAYER_CLUI_CHAR_KBOOM;
		break;
	case GAME_IFACE_VIS_HIDDEN_FIELD:
		c	= PLAYER_CLUI_CHAR_HIDDEN_FIELD;
		break;
	case GAME_IFACE_VIS_HIDDEN_MINE:
		c	= PLAYER_CLUI_CHAR_HIDDEN_MINE;
		break;
	case GAME_IFACE_VIS_HIDDEN_SAFE:
		c	= PLAYER_CLUI_CHAR_HIDDEN_SAFE;
		break;
	case GAME_IFACE_VIS_SAFE_MINE:
		c	= PLAYER_CLUI_CHAR_SAFE_MINE;
		break;
	case GAME_IFACE_VIS_0:
		c	= PLAYER_CLUI_CHAR_0;
		break;
	case GAME_IFACE_VIS_1:
		c	= PLAYER_CLUI_CHAR_1;
		break;
	case GAME_IFACE_VIS_2:
		c	= PLAYER_CLUI_CHAR_2;
		break;
	case GAME_IFACE_VIS_3:
		c	= PLAYER_CLUI_CHAR_3;
		break;
	case GAME_IFACE_VIS_4:
		c	= PLAYER_CLUI_CHAR_4;
		break;
	case GAME_IFACE_VIS_5:
		c	= PLAYER_CLUI_CHAR_5;
		break;
	case GAME_IFACE_VIS_6:
		c	= PLAYER_CLUI_CHAR_6;
		break;
	case GAME_IFACE_VIS_7:
		c	= PLAYER_CLUI_CHAR_7;
		break;
	case GAME_IFACE_VIS_8:
		c	= PLAYER_CLUI_CHAR_8;
		break;
	case GAME_IFACE_VIS_FLAG:
		c	= PLAYER_CLUI_CHAR_FLAG;
		break;
	case GAME_IFACE_VIS_FLAG_FALSE:
		c	= PLAYER_CLUI_CHAR_FLAG_FALSE;
		break;
	case GAME_IFACE_VIS_POSSIBLE:
		c	= PLAYER_CLUI_CHAR_POSSIBLE;
		break;
	case GAME_IFACE_VIS_POSSIBLE_FALSE:
		c	= PLAYER_CLUI_CHAR_POSSIBLE_FALSE;
		break;
	default:
		c	= PLAYER_CLUI_CHAR_ERROR;
		break;
	}

	return	c;
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Input	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	int	usr_input	(void)
{
	char	buff [BUFF_SIZE];
	char	c;
	int	action;
	char	*p;

	action	= PLAYER_IFACE_ACT_FOO;

	/* Wait for input */
	buff[0]	= '\0';
	c	= '\0';
	if (!fgets(buff, BUFF_SIZE, stdin))
		goto err_fgets;
	p	= buff;

	/* Interpret input */
	if (sscanf(p, "%c", &c) != 1)
		goto err_sscanf;
	p++;
	switch (c) {
		/* Escape sequence */
	case 27:
			/* Arrows */
		if (sscanf(p, "%c", &c) != 1)
			goto err_sscanf;
		p++;
		switch (c) {
		case 91:
			if (sscanf(p, "%c", &c) != 1)
				goto err_sscanf;
			p++;
			switch (c) {
			case 65:
				action	= PLAYER_IFACE_ACT_MOVE_UP;
				break;

			case 66:
				action	= PLAYER_IFACE_ACT_MOVE_DOWN;
				break;

			case 67:
				action	= PLAYER_IFACE_ACT_MOVE_RIGHT;
				break;

			case 68:
				action	= PLAYER_IFACE_ACT_MOVE_LEFT;
				break;
			}
			break;
		}
		break;

	case 'h':
		action	= PLAYER_IFACE_ACT_MOVE_LEFT;
		break;

	case 'j':
		action	= PLAYER_IFACE_ACT_MOVE_DOWN;
		break;

	case 'k':
		action	= PLAYER_IFACE_ACT_MOVE_UP;
		break;

	case 'l':
		action	= PLAYER_IFACE_ACT_MOVE_RIGHT;
		break;

	case '+':
		action	= PLAYER_IFACE_ACT_STEP;
		break;

	case ' ':
		action	= PLAYER_IFACE_ACT_FLAG;
		break;

	case 'f':
		action	= PLAYER_IFACE_ACT_FLAG_POSSIBLE;
		break;

		/* ASCII 0x08 is BS */
	case 0x7F:
	case 0x08:
		action	= PLAYER_IFACE_ACT_RM_FLAG;
		break;

	case 'p':
		action	= PLAYER_IFACE_ACT_PAUSE;
		break;

	case 's':
		action	= PLAYER_IFACE_ACT_SAVE;
		break;

	case 'x':
		/* Special sequence "xyzzy" */
		if (sscanf(p, "%c", &c) != 1)
			goto err_sscanf;
		p++;
		if (c == 'y') {
			if (sscanf(p, "%c", &c) != 1)
				goto err_sscanf;
			p++;
			if (c == 'z') {
				if (sscanf(p, "%c", &c) != 1)
					goto err_sscanf;
				p++;
				if (c == 'z') {
					if (sscanf(p, "%c", &c) != 1)
						goto err_sscanf;
					p++;
					if (c == 'y')
						action	= PLAYER_IFACE_ACT_XYZZY_ON;
				}
			}
		}
		break;

	case '0':
		action	= PLAYER_IFACE_ACT_XYZZY_OFF;
		break;

	case '1':
		action	= PLAYER_IFACE_ACT_XYZZY_LIN;
		break;

	case '2':
		action	= PLAYER_IFACE_ACT_XYZZY_P;
		break;

	case '3':
		action	= PLAYER_IFACE_ACT_XYZZY_NP;
		break;

	case 'q':
		action	= PLAYER_IFACE_ACT_QUIT;
		break;
	}


err_sscanf:
err_fgets:
	return	action;
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Help	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	show_help		(const struct Game_Iface_Out  *board)
{

	switch (board->state) {
	case GAME_IFACE_STATE_PLAYING:
		show_help_play();
		break;
	case GAME_IFACE_STATE_PAUSE:
		show_help_pause();
		break;
	case GAME_IFACE_STATE_XYZZY:
		show_help_xyzzy();
		break;
	case GAME_IFACE_STATE_CHEATED:
		show_help_cheat();
		break;
	case GAME_IFACE_STATE_SAFE:
		show_help_safe();
		break;
	case GAME_IFACE_STATE_GAMEOVER:
		show_help_gameover();
		break;
	}
}

static	void	show_help_start		(void)
{

	printf("Move      |Step |Quit |Confirm\n");
	printf(" hjkl <v^>| +   | q   | Enter\n");
}

static	void	show_help_play		(void)
{

	printf("Move      |Step |Flag  |? |Remove |Pause |Save |Quit |Confirm\n");
	printf(" hjkl <v^>| +   | Space| f| BS    | p    | s   | q   | Enter\n");
}

static	void	show_help_pause		(void)
{

	printf("Continue |Save |Quit |Confirm\n");
	printf(" p       | s   | q   | Enter");
}

static	void	show_help_xyzzy		(void)
{

	printf("XYZZY |Move      |Step |Flag  |? |Remove |Save |Quit |Confirm\n");
	printf(" 0 1 2| hjkl <v^>| +   | Space| f| BS    | s   | q   | Enter\n");
}

static	void	show_help_cheat		(void)
{

	printf("Move      |Step |Flag  |? |Remove |Save |Quit |Confirm\n");
	printf(" hjkl <v^>| +   | Space| f| BS    | s   | q   | Enter\n");
}

static	void	show_help_safe		(void)
{

	printf("Save |Quit |Confirm\n");
	printf(" s   | q   | Enter\n");
}

static	void	show_help_gameover	(void)
{

	printf("Quit |Confirm\n");
	printf(" q   | Enter\n");
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
