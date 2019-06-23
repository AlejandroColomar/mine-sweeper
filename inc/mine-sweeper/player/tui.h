/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
#ifndef MSW_PLAYER_TUI_H
#define MSW_PLAYER_TUI_H


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>

#include "mine-sweeper/game/iface.h"
#include "mine-sweeper/player/iface.h"


/******************************************************************************
 ******* enums ****************************************************************
 ******************************************************************************/
	enum	Player_TUI_Char {
		PLAYER_TUI_CHAR_ERROR		= 'X',
		PLAYER_TUI_CHAR_KBOOM		= '#',
		PLAYER_TUI_CHAR_HIDDEN_FIELD	= '+',
		PLAYER_TUI_CHAR_HIDDEN_MINE	= '*',
		PLAYER_TUI_CHAR_HIDDEN_SAFE	= '-',
		PLAYER_TUI_CHAR_SAFE_MINE	= 'v',
		PLAYER_TUI_CHAR_0		= ' ',
		PLAYER_TUI_CHAR_1		= '1',
		PLAYER_TUI_CHAR_2		= '2',
		PLAYER_TUI_CHAR_3		= '3',
		PLAYER_TUI_CHAR_4		= '4',
		PLAYER_TUI_CHAR_5		= '5',
		PLAYER_TUI_CHAR_6		= '6',
		PLAYER_TUI_CHAR_7		= '7',
		PLAYER_TUI_CHAR_8		= '8',
		PLAYER_TUI_CHAR_FLAG		= '!',
		PLAYER_TUI_CHAR_FLAG_FALSE	= 'F',
		PLAYER_TUI_CHAR_POSSIBLE	= '?',
		PLAYER_TUI_CHAR_POSSIBLE_FALSE	= 'f'
	};

	enum	Color_Pairs {
		/* Clear */
		PAIR_1 = 1,
		PAIR_2,
		PAIR_3,
		PAIR_4,
		PAIR_5,
		PAIR_6,
		PAIR_7,
		PAIR_8,
		PAIR_BLANK,
		/* Hidden */
		PAIR_MINE,
		PAIR_HIDDEN,
		/* Possible */
		PAIR_fail,
		PAIR_POSSIBLE,
		/* Flag */
		PAIR_FAIL,
		PAIR_FLAG,
		/* kboom */
		PAIR_KBOOM,
		/* Highlight */
		PAIR_HILITE,

		/* Terminal colors */
		PAIR_TERM
	};


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
extern	bool	flag_color;


/******************************************************************************
 ******* functions ************************************************************
 ******************************************************************************/
void	player_tui_init		(ptrdiff_t rows, ptrdiff_t cols);

int	player_tui_start	(const struct Player_Iface_Position	*position,
				const char *title, const char *subtitle,
				int *action);

int	player_tui		(const struct Game_Iface_Out		*board,
				const struct Player_Iface_Position	*position,
				const char *title, const char *subtitle,
				int *action);

void	player_tui_save_name	(const char *fpath,
				char fname[static restrict FILENAME_MAX]);
void	player_tui_score_name	(char player_name[static restrict BUFSIZ]);
void	player_tui_cleanup	(void);


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
# endif			/* player_tui.h */


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
