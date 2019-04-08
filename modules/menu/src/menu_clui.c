/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
	#include <math.h>
	#include <stdlib.h>

	#include "libalx/io/alx_input.h"

	#include "about.h"
	#include "game_iface.h"
//	#include "save.h"
	#include "start.h"
	#include "menu_iface.h"

	#include "menu_clui.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
#define ROWS_CLUI_MAX		(99)
#if (ROWS_CLUI_MAX > ROWS_MAX)
	#error "rows max (clui)"
#endif

#define COLS_CLUI_MAX		(26)
#if (COLS_CLUI_MAX > COLS_MAX)
	#error "cols max (clui)"
#endif

#define BUFF_SIZE		(1024)


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	menu_clui_rand		(void);
static	void	menu_clui_custom	(void);
static	void	menu_clui_load		(void);
static	void	menu_clui_start		(void);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	menu_clui	(void)
{
	char	buff [BUFF_SIZE];
	char	c;

	c	= 'n';
	printf("Read 'Disclaimer of warranty'? (yes/NO): ");
	if (!fgets(buff, BUFF_SIZE, stdin))
		goto err_fgets;
	if (sscanf(buff, " %c", &c) != 1)
		goto err_sscanf;
	if (c == 'y' || c == 'Y') {
		printf(" >yes\n");
		print_share_file(SHARE_DISCLAIMER);
	} else {
		printf(" >NO\n");
	}

	c	= 'n';
	printf("Read 'License'? (yes/NO): ");
	if (!fgets(buff, BUFF_SIZE, stdin))
		goto err_fgets;
	if (sscanf(buff, " %c", &c) != 1)
		goto err_sscanf;
	if (c == 'y' || c == 'Y') {
		printf(" >yes\n");
		print_share_file(SHARE_LICENSE);
	} else {
		printf(" >NO\n");
	}
#if 0
	printf("Game interface? (NCURSES/text): ");
	scanf(" %c%*s ", &c);
	if (c == 't' || c == 'T') {
		printf(" >text\n");
		// FIXME
	} else {
		printf(" >NCURSES\n");
		// FIXME
	}
#endif
	c	= 'n';
	printf("New game or load game? (NEW/load): ");
	if (!fgets(buff, BUFF_SIZE, stdin))
		goto err_fgets;
	if (sscanf(buff, " %c", &c) != 1)
		goto err_sscanf;
	if (c == 'l' || c == 'L') {
		printf(" >load\n");
		menu_clui_load();
	} else {
		printf(" >NEW\n");
		menu_clui_rand();
	}

	return;


err_fgets:
	printf("fgets() error\n");
	exit(EXIT_FAILURE);
err_sscanf:
	printf("sscanf() error\n");
	exit(EXIT_FAILURE);
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	menu_clui_rand		(void)
{
	int	seed;
	char	buff [BUFF_SIZE];
	char	c;

	/* Random */
	start_mode	= START_RAND;

	c	= 'n';
	printf("Set seed for random generator? (yes/NO): ");
	if (!fgets(buff, BUFF_SIZE, stdin))
		goto err_fgets;
	if (sscanf(buff, " %c", &c) != 1)
		goto err_sscanf;
	if (c == 'y' || c == 'Y') {
		printf(" >yes\n");
		seed	= alx_getint(-INFINITY, 1, INFINITY, "Seed:", NULL);
		srand(seed);
	} else {
		printf(" >NO\n");
	}

	c	= 'b';
	printf("Level? (BEGINNER/intermediate/(expert)/custom): ");
	if (!fgets(buff, BUFF_SIZE, stdin))
		goto err_fgets;
	if (sscanf(buff, " %c", &c) != 1)
		goto err_sscanf;
	if (c == 'i' || c == 'I') {
		printf(" >intermediate\n");
		menu_iface_variables.level	= GAME_IFACE_LEVEL_INTERMEDIATE;
		menu_clui_start();
	} else if (c == 'e' || c == 'E') {
		printf(" >expert\n");
		menu_iface_variables.level	= GAME_IFACE_LEVEL_EXPERT_INV;
		menu_clui_start();
	} else if (c == 'c' || c == 'C') {
		printf(" >custom\n");
		menu_iface_variables.level	= GAME_IFACE_LEVEL_CUSTOM;
		menu_clui_custom();
	} else {
		printf(" >BEGINNER\n");
		menu_iface_variables.level	= GAME_IFACE_LEVEL_BEGINNER;
		menu_clui_start();
	}

	return;


err_fgets:
	printf("fgets() error\n");
	exit(EXIT_FAILURE);
err_sscanf:
	printf("sscanf() error\n");
	exit(EXIT_FAILURE);
}

static	void	menu_clui_custom	(void)
{

	start_mode	= START_RAND;

	menu_iface_variables.rows	= alx_getint(2, menu_iface_variables.rows, ROWS_CLUI_MAX, "Rows:", NULL);
	menu_iface_variables.cols	= alx_getint(2, menu_iface_variables.cols, COLS_CLUI_MAX, "Columns:", NULL);
	menu_iface_variables.p		= alx_getdbl(0, menu_iface_variables.p, 1, "Proportion:", NULL);

	menu_clui_start();
}

static	void	menu_clui_load		(void)
{

	start_mode	= START_LOAD;
#if 0
	/* File name */ // FIXME
	alx_w_getfname(USER_SAVED_DIR, saved_name, "File name:", saved_name, NULL);
#endif
	menu_clui_start();
}

static	void	menu_clui_start		(void)
{
	char	buff [BUFF_SIZE];
	char	c;

	printf(" >>START:\n");
	start_switch();

	c	= 'm';
	printf("Play again? (MENU/play/exit): ");
	if (!fgets(buff, BUFF_SIZE, stdin))
		goto err_fgets;
	if (sscanf(buff, " %c", &c) != 1)
		goto err_sscanf;
	if (c == 'p' || c == 'P') {
		printf(" >play\n");
		menu_clui_start();
	} else if (c == 'e' || c == 'E') {
		printf(" >exit!\n");
	} else {
		printf(" >MENU\n");
		menu_clui();
	}

	return;


err_fgets:
	printf("fgets() error\n");
	exit(EXIT_FAILURE);
err_sscanf:
	printf("sscanf() error\n");
	exit(EXIT_FAILURE);
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
