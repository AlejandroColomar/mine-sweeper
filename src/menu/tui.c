/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include "mine-sweeper/menu/tui.h"

#include <limits.h>
#include <math.h>
#include <stdbool.h>
#include <stdlib.h>

#include <ncurses.h>

#include <libalx/base/compiler.h>
#include <libalx/base/stdio.h>
#include <libalx/extra/ncurses/ncurses.h>

#include "mine-sweeper/about/about.h"
#include "mine-sweeper/game/iface.h"
#include "mine-sweeper/save/save.h"
#include "mine-sweeper/save/score.h"
#include "mine-sweeper/ctrl/start.h"
#include "mine-sweeper/menu/iface.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
#define ROWS_TUI_MAX		(22)
#if (ROWS_TUI_MAX > ROWS_MAX)
	#error	"rows max (tui)"
#endif

#define COLS_TUI_MAX		(33)
#if (COLS_TUI_MAX > COLS_MAX)
	#error	"cols max (tui)"
#endif

#define BUFF_SIZE_TEXT		(1048576)


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	menu_tui_continue	(void);
static	void	menu_tui_select		(void);
static	void	menu_tui_level		(void);
static	void	menu_tui_custom		(void);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	menu_tui		(void)
{
	int	h;
	int	w;
	bool	wh;
	int	sw;

	alx_ncurses_resume();

	/* Menu dimensions & options */
	h	= 10;
	w	= 34;
	static	const struct Alx_Ncurses_Menu	mnu[]	= {
		{7, 4, "[0]	Exit program"},
		{2, 4, "[1]	Continue"},
		{4, 4, "[2]	Disclaimer of warranty"},
		{5, 4, "[3]	Terms and conditions"}
	};

	/* Menu */
	wh	= true;
	while (wh) {
		/* Menu loop */
		sw	= alx_ncurses_menu(h, w, ARRAY_SIZE(mnu), mnu, "MENU:");

		/* Selection */
		switch (sw) {
		case 0:
			wh	= false;
			break;
		case 1:
			menu_tui_continue();
			break;
		case 2:
			alx_ncurses_pause();
			print_share_file(SHARE_DISCLAIMER);
			alx_ncurses_resume();
			break;
		case 3:
			alx_ncurses_pause();
			print_share_file(SHARE_LICENSE);
			alx_ncurses_resume();
			break;
		}
	}

	alx_ncurses_pause();
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	menu_tui_continue	(void)
{
	WINDOW		*win;
	int_fast8_t	h, w;
	int_fast8_t	r, c;
	int_fast8_t	w2, r2;
	bool		wh;
	int_fast8_t	sw;

	/* Menu dimensions & options */
	h	= 18;
	w	= 50;
	r	= 1;
	c	= (80 - w) / 2;
	static	const struct Alx_Ncurses_Menu	mnu[]	= {
		{11, 4, "[0]	Back"},
		{2, 4, "[1]	Start"},
		{4, 4, "[2]	Select map"},
		{5, 4, "[3]	Change difficulty"},
		{6, 4, "[4]	Change file name"},
		{7, 4, "[5]	Hi scores"}/*,
		{9, 4, "[6]	DEVEL"}*/
	};

	/* Input box */
	w2	= w - 8;
	r2	= r + h - 5;
	static	const char	*const txt[]	= {"File name:"};

	wh	= true;
	while (wh) {
		win	= newwin(h, w, r, c);
		mvwprintw(win, mnu[4].r, mnu[4].c, "%s (File: \"%s\")",
							mnu[4].t, saved_name);
		sw = alx_ncurses_menu_w(win, ARRAY_SIZE(mnu), mnu, "CONTINUE:");

		switch (sw) {
		case 0:
			alx_ncurses_delwin(win);
			wh	= false;
			break;
		case 1:
			alx_ncurses_delwin(win);
			alx_ncurses_pause();
			start_switch();
			alx_ncurses_resume();
			break;
		case 2:
			alx_ncurses_delwin(win);
			menu_tui_select();
			break;
		case 3:
			alx_ncurses_delwin(win);
			menu_tui_level();
			break;
		case 4:
			save_clr();
			alx_ncurses_get_fname(saved_path, saved_name, true,
						w2, r2, txt[0], NULL, 2);
			alx_ncurses_delwin(win);
			break;
		case 5:
			alx_ncurses_delwin(win);
			alx_ncurses_pause();
			print_scores();
			alx_ncurses_resume();
			break;
/*
		case 6:
			alx_ncurses_delwin(win);
			menu_tui_devel();
			break;
*/
		}
	}
}

static	void	menu_tui_select	(void)
{
	static	const struct Alx_Ncurses_Menu	mnu[]	= {
		{6, 4, "[0]	Back"},
		{2, 4, "[1]	New map"},
		{4, 4, "[2]	Load map"}
	};
	WINDOW	*win;
	int	h;
	int	w;
	int	r;
	int	c;
	int	sw;

	/* Menu dimensions & options */
	h	= 9;
	w	= 70;
	r	= 1;
	c	= (80 - w) / 2;

	/* Menu loop */
	win	= newwin(h, w, r, c);
	mvwprintw(win, mnu[2].r, mnu[2].c, "%s (File: \"%s\")", mnu[1].t,
								saved_name);
	sw	= alx_ncurses_menu_w(win, ARRAY_SIZE(mnu), mnu, "SELECT MAP:");
	alx_ncurses_delwin(win);

	/* Selection */
	switch (sw) {
	case 1:
		start_mode =	START_RAND;
		break;
	case 2:
		start_mode =	START_LOAD;
		break;
	}
}

static	void	menu_tui_level	(void)
{
	static	const struct Alx_Ncurses_Menu	mnu[]	= {
		{7, 4, "[0]	Back"},
		{2, 4, "[1]	Beginner"},
		{3, 4, "[2]	Intermediate"},
		{4, 4, "[3]	Expert"},
		{5, 4, "[4]	Custom"}
	};
	int	h;
	int	w;
	int	sw;

	h	= 10;
	w	= 70;


	sw	= alx_ncurses_menu(h, w, ARRAY_SIZE(mnu), mnu, "SELECT LEVEL:");

	switch (sw) {
	case 1:
		menu_iface_variables.level	= GAME_IFACE_LVL_BEGINNER;
		break;
	case 2:
		menu_iface_variables.level	= GAME_IFACE_LVL_INTERMEDIATE;
		break;
	case 3:
		menu_iface_variables.level	= GAME_IFACE_LVL_EXPERT;
		break;
	case 4:
		menu_iface_variables.level	= GAME_IFACE_LVL_CUSTOM;
		menu_tui_custom();
		break;
	}

}

static	void	menu_tui_custom	(void)
{
	static	const struct Alx_Ncurses_Menu	mnu[]	= {
		{8, 4, "[0]	Back"},
		{2, 4, "[1]	Change rows:"},
		{4, 4, "[2]	Change columns:"},
		{6, 4, "[3]	Change proportion of mines:"}
	};
	static	const char	*const txt[]	= {
		"Rows:",
		"Columns:",
		"Proportion:"
	};
	WINDOW		*win;
	int_fast8_t	h, w;
	int_fast8_t	r, c;
	int_fast8_t	w2, r2;
	bool		wh;
	int_fast8_t	sw;

	/* Menu dimensions & options */
	h	= 16;
	w	= 76;
	r	= 1;
	c	= (80 - w) / 2;

	/* Input box */
	w2	= w - 8;
	r2	= r + h - 5;

	/* Menu */
	win	= newwin(h, w, r, c);

	/* Menu loop */
	wh	= true;
	while (wh) {
		mvwprintw(win, mnu[1].r, mnu[1].c, "%s rows\t\t(%i)",
					mnu[1].t, menu_iface_variables.rows);
		mvwprintw(win, mnu[2].r, mnu[2].c, "%s cols\t\t(%i)",
					mnu[2].t, menu_iface_variables.cols);
		mvwprintw(win, mnu[3].r, mnu[3].c, "%s p\t(%lf)",
					mnu[3].t, menu_iface_variables.p);
		wrefresh(win);

		/* Selection */
		sw	= alx_ncurses_menu_w(win, ARRAY_SIZE(mnu), mnu, "Custom:");

		switch (sw) {
		case 0:
			wh	= false;
			break;
		case 1:
			menu_iface_variables.rows = alx_ncurses_get_pdif(
					2, menu_iface_variables.rows, ROWS_TUI_MAX,
					w2, r2, txt[sw - 1], NULL, 2);
			break;
		case 2:
			menu_iface_variables.cols = alx_ncurses_get_pdif(
					2, menu_iface_variables.cols, COLS_TUI_MAX,
					w2, r2, txt[sw - 1], NULL, 2);
			break;
		case 3:
			menu_iface_variables.p	= alx_ncurses_get_dbl(
					0.0, menu_iface_variables.p, 1.0,
					w2, r2, txt[sw - 1],  NULL, 2);
			break;
		}

	}

	alx_ncurses_delwin(win);
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
