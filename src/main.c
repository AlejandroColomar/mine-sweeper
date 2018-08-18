/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/

	#include "alx_ncur.h"

	#include "about.h"
	#include "clui.h"
	#include "data.h"
	#include "init.h"
	#include "tui.h"
	#include "print.h"
	#include "start.h"


int	main	(int argc, char *argv[])
{
	alx_start_curses();
	init_values();
	parser(argc, argv);

	alx_pause_curses();
								print_verbose(1, print_cpright, -1);
	getchar();
	alx_resume_curses();

	start_switch();
	if (!flag_x) {
		menu_main();
	}

	alx_end_curses();

	return	0;
}

/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/*--| END OF FILE |-----------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/*--| END OF FILE |-----------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
