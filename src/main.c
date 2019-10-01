/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include <stdio.h>

#include <libalx/extra/ncurses/common.h>

#include "mine-sweeper/about/about.h"
#include "mine-sweeper/ctrl/start.h"
#include "mine-sweeper/game/core.h"
#include "mine-sweeper/menu/iface.h"
#include "mine-sweeper/menu/parser.h"
#include "mine-sweeper/player/iface.h"
#include "mine-sweeper/save/save.h"
#include "mine-sweeper/save/score.h"


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	init_all	(int *argc, char *(*argv[]));
static	void	cleanup		(void);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
int	main	(int argc, char *argv[])
{
	init_all(&argc, &argv);

	print_share_file(SHARE_COPYRIGHT);

	start_switch();

	menu_iface();

	cleanup();

	return	0;
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	init_all	(int *argc, char *(*argv[]))
{

	alx_ncurses_init();
	alx_ncurses_pause();

	/* Init modules */
	menu_iface_init();
	game_init();
	save_init();

	/* Modes */
	start_mode		= START_FOO;
	flag_exit		= false;
	menu_iface_mode		= MENU_IFACE_TUI;
	player_iface_mode	= PLAYER_IFACE_TUI;

	/* Parse command line options */
	parser(*argc, *argv);
}

static	void	cleanup		(void)
{

	alx_ncurses_resume();
	alx_ncurses_deinit();
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
