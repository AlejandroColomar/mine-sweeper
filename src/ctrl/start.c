/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include "mine-sweeper/ctrl/start.h"

#include <errno.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#define ALX_NO_PREFIX
#include <libalx/base/errno.h>

#include "mine-sweeper/game/core.h"
#include "mine-sweeper/game/iface.h"
#include "mine-sweeper/menu/iface.h"
#include "mine-sweeper/player/iface.h"


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
int	start_mode;


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	start_foo	(void);
static	void	start_rand	(void);
static	void	start_load	(void);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	start_switch	(void)
{

	switch (start_mode) {
	case START_FOO:
		start_foo();
		break;
	case START_RAND:
		start_rand();
		break;
	case START_LOAD:
		start_load();
		break;
	}
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	start_foo	(void)
{
}

static	void	start_rand	(void)
{
	int		level;
	ptrdiff_t	rows, cols;
	int		mines;
	ptrdiff_t	r, c;

	menu_iface_board(&level, &rows, &cols, &mines);
	player_iface_init(rows, cols);
	if (player_iface_start(&r, &c))
		goto err;
	game_init_rand(rows, cols, mines, r, c);
	game_iface_init_rand(level, r, c);

	/* game loop */
	game_iface();

err:
	player_iface_cleanup();
}

static	void	start_load	(void)
{
	ptrdiff_t	rows, cols;

	/* size & game init (sets errno) */
	errno	= 0;
	if (game_init_load(&rows, &cols))
		goto err;

	player_iface_init(rows, cols);
	game_iface_init_load();

	/* game loop */
	game_iface();

	player_iface_cleanup();
	return;
err:
	perrorx("game_init_load");
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
