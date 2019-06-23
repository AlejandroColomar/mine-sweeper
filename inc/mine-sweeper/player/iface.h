/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 *	SPDX-License-Identifier:	GPL-2.0-only			      *
 ******************************************************************************/


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
#ifndef MSW_PLAYER_IFACE_H
#define MSW_PLAYER_IFACE_H


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include <stddef.h>
#include <stdio.h>

#include "mine-sweeper/game/iface.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/


/******************************************************************************
 ******* enums ****************************************************************
 ******************************************************************************/
enum	Player_Iface_Mode {
	PLAYER_IFACE_FOO = 0,
	PLAYER_IFACE_CLUI,
	PLAYER_IFACE_TUI,
	PLAYER_IFACE_GUI
};

enum	Player_Iface_Action {
	PLAYER_IFACE_ACT_FOO,
	PLAYER_IFACE_ACT_STEP,
	PLAYER_IFACE_ACT_FLAG,
	PLAYER_IFACE_ACT_FLAG_POSSIBLE,
	PLAYER_IFACE_ACT_RM_FLAG,

	PLAYER_IFACE_ACT_PAUSE,
	PLAYER_IFACE_ACT_SAVE,
	PLAYER_IFACE_ACT_XYZZY_ON,
	PLAYER_IFACE_ACT_XYZZY_OFF,
	PLAYER_IFACE_ACT_XYZZY_LIN,
	PLAYER_IFACE_ACT_XYZZY_P,
	PLAYER_IFACE_ACT_XYZZY_NP,
	PLAYER_IFACE_ACT_QUIT,

	PLAYER_IFACE_ACT_MOVE_UP,
	PLAYER_IFACE_ACT_MOVE_DOWN,
	PLAYER_IFACE_ACT_MOVE_RIGHT,
	PLAYER_IFACE_ACT_MOVE_LEFT,
	PLAYER_IFACE_ACT_HIGHLIGHT
};


/******************************************************************************
 ******* structs / unions *****************************************************
 ******************************************************************************/
struct	Player_Iface_Position {
	int	rows;
	int	cols;
	int	row;
	int	col;
	int	highlight;
};


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
extern	int	player_iface_mode;


/******************************************************************************
 ******* extern functions *****************************************************
 ******************************************************************************/
void	player_iface_init	(ptrdiff_t rows, ptrdiff_t cols);
int	player_iface_start	(ptrdiff_t *row, ptrdiff_t *col);
void	player_iface		(const	struct Game_Iface_Out	*out,
				const	struct Game_Iface_Score	*score,
					struct Game_Iface_In	*in);
void	player_iface_save_name	(const char *fpath,
				char fname[static restrict FILENAME_MAX]);
void	player_iface_score_name	(char player_name[static restrict BUFSIZ]);
void	player_iface_cleanup	(void);


/******************************************************************************
 ******* static inline functions (prototypes) *********************************
 ******************************************************************************/


/******************************************************************************
 ******* static inline functions (definitions) ********************************
 ******************************************************************************/


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
#endif		/* mine-sweeper/player/iface.h */


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
