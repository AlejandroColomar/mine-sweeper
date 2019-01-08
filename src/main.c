/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
	#include <stdio.h>

	#include <gtk/gtk.h>

	#include "libalx/alx_ncur.h"

	#include "about.h"
	#include "game.h"
	#include "menu_iface.h"
	#include "player_iface.h"
	#include "parser.h"
	#include "save.h"
	#include "score.h"
	#include "start.h"


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
void	init_all	(int *argc, char *(*argv[]));
void	cleanup		(void);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
int	main	(int argc, char *argv[])
{
	init_all(&argc, &argv);

	/* Print copyright () and wait for any key to continue */
	print_share_file(SHARE_COPYRIGHT);
	getchar();

	/* Start () */
	start_switch();

	/* Menu () */
	menu_iface();

	cleanup();

	return	0;
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
void	init_all	(int *argc, char *(*argv[]))
{
	/* Init gtk & curses */
	gtk_init_check(argc, argv);
	alx_start_curses();
	alx_pause_curses();

	/* Init modules */
	menu_iface_init();
	game_init();
	about_init();
	save_init();
	score_init();

	/* Modes */
	start_mode		= START_FOO;
	flag_exit		= false;
	menu_iface_mode		= MENU_IFACE_TUI;
	player_iface_mode	= PLAYER_IFACE_TUI;

	/* Parse command line options */
	parser(*argc, *argv);

	/* Init iface */
	menu_iface_init_iface();
}

void	cleanup		(void)
{
	/* Clean iface */
	menu_iface_cleanup();

	/* End curses */
	alx_resume_curses();
	alx_end_curses();
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
