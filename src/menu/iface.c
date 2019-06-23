/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include "mine-sweeper/menu/iface.h"

#include <stdbool.h>
#include <stddef.h>

#include "mine-sweeper/game/iface.h"
#include "mine-sweeper/ctrl/start.h"
#include "mine-sweeper/menu/clui.h"
#include "mine-sweeper/menu/tui.h"


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
bool				flag_exit;
int				menu_iface_mode;
struct Menu_Iface_Variables	menu_iface_variables;


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	menu_iface_init		(void)
{

	menu_iface_variables.level	= GAME_IFACE_LVL_BEGINNER;
	menu_iface_variables.rows	= 8;
	menu_iface_variables.cols	= 8;
	menu_iface_variables.p		= 0.16;
}

void	menu_iface_board	(int *level, ptrdiff_t *rows, ptrdiff_t *cols, int *mines)
{

	*level	= menu_iface_variables.level;

	/* size & number of mines */
	switch (*level) {
	case GAME_IFACE_LVL_BEGINNER:
		*rows	= GAME_IFACE_LVL_BEGINNER_ROWS;
		*cols	= GAME_IFACE_LVL_BEGINNER_COLS;
		*mines	= GAME_IFACE_LVL_BEGINNER_MINES;
		break;
	case GAME_IFACE_LVL_INTERMEDIATE:
		*rows	= GAME_IFACE_LVL_INTERMEDIATE_ROWS;
		*cols	= GAME_IFACE_LVL_INTERMEDIATE_COLS;
		*mines	= GAME_IFACE_LVL_INTERMEDIATE_MINES;
		break;
	case GAME_IFACE_LVL_EXPERT:
		*rows	= GAME_IFACE_LVL_EXPERT_ROWS;
		*cols	= GAME_IFACE_LVL_EXPERT_COLS;
		*mines	= GAME_IFACE_LVL_EXPERT_MINES;
		break;
	case GAME_IFACE_LVL_EXPERT_INV:
		*rows	= GAME_IFACE_LVL_EXPERT_COLS;
		*cols	= GAME_IFACE_LVL_EXPERT_ROWS;
		*mines	= GAME_IFACE_LVL_EXPERT_MINES;
		break;
	case GAME_IFACE_LVL_CUSTOM:
		*rows	= menu_iface_variables.rows;
		*cols	= menu_iface_variables.cols;
		*mines	= menu_iface_variables.p * (*rows) * (*cols);
		/* at least one safe field */
		if ((*mines) == (*rows) * (*cols))
			(*mines)--;
		break;
	}
}

void	menu_iface		(void)
{

	start_mode	= START_RAND;

	if (flag_exit)
		return;

	switch (menu_iface_mode) {
	case MENU_IFACE_FOO:
		break;
	case MENU_IFACE_CLUI:
		menu_clui();
		break;
	case MENU_IFACE_TUI:
		menu_tui();
		break;
	}
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
