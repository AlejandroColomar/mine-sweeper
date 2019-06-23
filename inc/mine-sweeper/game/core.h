/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 *	SPDX-License-Identifier:	GPL-2.0-only			      *
 ******************************************************************************/


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
#ifndef MSW_GAME_CORE_H
#define MSW_GAME_CORE_H


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include <stdbool.h>
#include <stddef.h>

#include "mine-sweeper/game/iface.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/


/******************************************************************************
 ******* enums ****************************************************************
 ******************************************************************************/
enum	Game_Mine_Board {
	GAME_MINE_NO = 0,
	GAME_MINE_YES = 9
};

enum	Game_Usr_Board {
	GAME_USR_KBOOM = -1,
	GAME_USR_HIDDEN,
	GAME_USR_CLEAR,
	GAME_USR_FLAG,
	GAME_USR_POSSIBLE
};

enum	Game_Action {
	GAME_ACT_FOO = 0,
	GAME_ACT_STEP,
	GAME_ACT_FLAG,
	GAME_ACT_FLAG_POSSIBLE,
	GAME_ACT_RM_FLAG
};

enum	Game_State {
	GAME_STATE_PLAYING = 0,
	GAME_STATE_SAFE,
	GAME_STATE_GAMEOVER
};



/******************************************************************************
 ******* structs / unions *****************************************************
 ******************************************************************************/
struct	Game_Board {
	ptrdiff_t	rows;
	ptrdiff_t	cols;
	int		mines;
	int		gnd [ROWS_MAX] [COLS_MAX];
	int		usr [ROWS_MAX] [COLS_MAX];
	int		flags;
	int		clr;
	int		state;
};


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
extern	struct Game_Board	game_board;


/******************************************************************************
 ******* extern functions *****************************************************
 ******************************************************************************/
void	game_init	(void);
void	game_init_rand	(ptrdiff_t rows, ptrdiff_t cols, int mines,
					ptrdiff_t pos_row, ptrdiff_t pos_col);
int	game_init_load	(ptrdiff_t *rows, ptrdiff_t *cols);
void	game_action	(int action, ptrdiff_t row, ptrdiff_t col);


/******************************************************************************
 ******* static inline functions (prototypes) *********************************
 ******************************************************************************/


/******************************************************************************
 ******* static inline functions (definitions) ********************************
 ******************************************************************************/


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
#endif		/* mine-sweeper/game/core.h */


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
