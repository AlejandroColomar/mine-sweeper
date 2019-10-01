/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include "mine-sweeper/game/core.h"

#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>

#define ALX_NO_PREFIX
#include <libalx/base/stdlib/seed.h>

#include "mine-sweeper/save/save.h"


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
/* Global --------------------------------------------------------------------*/
	struct Game_Board	game_board;
/* Static --------------------------------------------------------------------*/


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
	/* Init */
static	void	game_init_clr		(void);
static	void	game_init_mines		(ptrdiff_t pos_row, ptrdiff_t pos_col);
static	void	game_init_adjnums	(void);
	/* Step */
static	void	game_step		(ptrdiff_t r, ptrdiff_t c);
static	void	game_discover		(ptrdiff_t r, ptrdiff_t c);
static	void	game_discover_recursive	(ptrdiff_t r, ptrdiff_t c);
static	void	game_big_step		(ptrdiff_t r, ptrdiff_t c);
static	int	game_count_flags	(ptrdiff_t r, ptrdiff_t c);
static	void	game_step_recursive	(ptrdiff_t r, ptrdiff_t c);
	/* Flag */
static	void	game_flag		(ptrdiff_t r, ptrdiff_t c);
static	void	game_possible		(ptrdiff_t r, ptrdiff_t c);
static	void	game_rmflag		(ptrdiff_t r, ptrdiff_t c);
static	void	game_all_flags		(ptrdiff_t r, ptrdiff_t c);
static	int	game_count_nclear	(ptrdiff_t r, ptrdiff_t c);
static	void	game_flag_recursive	(ptrdiff_t r, ptrdiff_t c);


/******************************************************************************
 ******* global functions *****************************************************
 ******************************************************************************/
void	game_init	(void)
{

	prsrand();
}

void	game_init_rand	(ptrdiff_t rows, ptrdiff_t cols, int mines,
					ptrdiff_t pos_row, ptrdiff_t pos_col)
{

	/* size & mines */
	game_board.rows		= rows;
	game_board.cols		= cols;
	game_board.mines	= mines;

	/* clear */
	game_init_clr();

	/* place mines */
	game_init_mines(pos_row, pos_col);

	/* calc adjacency numbers */
	game_init_adjnums();
}

int	game_init_load	(ptrdiff_t *rows, ptrdiff_t *cols)
{

	if (load_game_file())
		return	-1;
	game_board.state	= GAME_STATE_PLAYING;
	*rows	= game_board.rows;
	*cols	= game_board.cols;

	return	0;
}

void	game_action	(int action, ptrdiff_t row, ptrdiff_t col)
{

	switch (action) {
	case GAME_ACT_STEP:
		game_step(row, col);
		break;
	case GAME_ACT_FLAG:
		game_flag(row, col);
		break;
	case GAME_ACT_FLAG_POSSIBLE:
		game_possible(row, col);
		break;
	case GAME_ACT_RM_FLAG:
		game_rmflag(row, col);
		break;
	}
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Init	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	game_init_clr		(void)
{

	for (ptrdiff_t i = 0; i < game_board.rows; i++) {
		for (ptrdiff_t j = 0; j < game_board.cols; j++) {
			game_board.gnd[i][j]	= GAME_MINE_NO;
			game_board.usr[i][j]	= GAME_USR_HIDDEN;
		}
	}
	game_board.flags	= 0;
	game_board.clr		= 0;
	game_board.state	= GAME_STATE_PLAYING;
}

static	void	game_init_mines		(ptrdiff_t pos_row, ptrdiff_t pos_col)
{
	/* place mines */
	int		i;
	ptrdiff_t	r;
	ptrdiff_t	c;

	i	= 0;
	while (i < game_board.mines) {
		r	= (rand() % game_board.rows);
		c	= (rand() % game_board.cols);

		if (game_board.gnd[r][c] == GAME_MINE_NO) {
			/* first step is safe */
			if (!((r == pos_row) && (c == pos_col))) {
				game_board.gnd[r][c]	= GAME_MINE_YES;
				i++;
			}
		}
	}
}

static	void	game_init_adjnums	(void)
{

	for (ptrdiff_t r = 0; r < game_board.rows; r++) {
	for (ptrdiff_t c = 0; c < game_board.cols; c++) {
		if (game_board.gnd[r][c] >= GAME_MINE_YES) {
			for (ptrdiff_t i = r-1; i < r+2; i++) {
			for (ptrdiff_t j = c-1; j < c+2; j++) {
				if (i >= 0 && i < game_board.rows) {
				if (j >= 0 && j < game_board.cols) {
					game_board.gnd[i][j]++;
				}
				}
			}
			}
		}
	}
	}
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Step	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	game_step		(ptrdiff_t r, ptrdiff_t c)
{

	switch (game_board.usr[r][c]) {
	case GAME_USR_HIDDEN:
	case GAME_USR_POSSIBLE:
		game_discover(r, c);
		break;
	case GAME_USR_CLEAR:
		game_big_step(r, c);
		break;
	}
}

static	void	game_discover		(ptrdiff_t r, ptrdiff_t c)
{
	int	safe_fields;

	safe_fields = (game_board.rows * game_board.cols) - game_board.mines;
	if (game_board.gnd[r][c] >= GAME_MINE_YES) {
		game_board.usr[r][c]	= GAME_USR_KBOOM;
		game_board.state	= GAME_STATE_GAMEOVER;

	} else if (game_board.usr[r][c] != GAME_USR_CLEAR) {
		game_board.usr[r][c]	= GAME_USR_CLEAR;
		game_board.clr++;

		if (game_board.clr == safe_fields)
			game_board.state	= GAME_STATE_SAFE;
		else if (game_board.gnd[r][c] == GAME_MINE_NO)
			game_discover_recursive(r, c);
	}
}

static	void	game_discover_recursive	(ptrdiff_t r, ptrdiff_t c)
{

	for (ptrdiff_t i = r - 1; i < r + 2; i++) {
	for (ptrdiff_t j = c - 1; j < c + 2; j++) {
		if (i >= 0 && i < game_board.rows) {
		if (j >= 0 && j < game_board.cols) {
			game_discover(i, j);
		}
		}
	}
	}
}

static	void	game_big_step		(ptrdiff_t r, ptrdiff_t c)
{
	int	cnt;

	cnt	= game_count_flags(r, c);
	if (cnt && (game_board.gnd[r][c] == cnt))
		game_step_recursive(r, c);
}

static	int	game_count_flags	(ptrdiff_t r, ptrdiff_t c)
{
	int	cnt;

	cnt =	0;
	for (ptrdiff_t i = r - 1; i < r + 2; i++) {
	for (ptrdiff_t j = c - 1; j < c + 2; j++) {
		if (i >= 0 && i < game_board.rows) {
		if (j >= 0 && j < game_board.cols) {
			if (game_board.usr[i][j] == GAME_USR_FLAG)
				cnt++;
		}
		}
	}
	}

	return	cnt;
}

static	void	game_step_recursive	(ptrdiff_t r, ptrdiff_t c)
{

	for (ptrdiff_t i = r - 1; i < r + 2; i++) {
	for (ptrdiff_t j = c - 1; j < c + 2; j++) {
		if (i >= 0 && i < game_board.rows) {
		if (j >= 0 && j < game_board.cols) {
			switch (game_board.usr[i][j]) {
			case GAME_USR_HIDDEN:
			case GAME_USR_POSSIBLE:
				game_discover(i, j);
				break;
			}
		}
		}
	}
	}
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Flag	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	game_flag		(ptrdiff_t r, ptrdiff_t c)
{

	switch (game_board.usr[r][c]) {
	case GAME_USR_HIDDEN:
		game_board.usr[r][c]	= GAME_USR_FLAG;
		game_board.flags++;
		break;

	case GAME_USR_FLAG:
		game_board.usr[r][c]	= GAME_USR_POSSIBLE;
		game_board.flags--;
		break;

	case GAME_USR_POSSIBLE:
		game_rmflag(r, c);
		break;

	case GAME_USR_CLEAR:
		game_all_flags(r, c);
		break;
	}
}

static	void	game_possible		(ptrdiff_t r, ptrdiff_t c)
{

	switch (game_board.usr[r][c]) {
	case GAME_USR_HIDDEN:
		game_board.usr[r][c]	= GAME_USR_POSSIBLE;
		break;

	case GAME_USR_POSSIBLE:
		game_rmflag(r, c);
		break;
	}
}

static	void	game_rmflag		(ptrdiff_t r, ptrdiff_t c)
{

	switch (game_board.usr[r][c]) {
	case GAME_USR_FLAG:
		game_board.usr[r][c]	= GAME_USR_HIDDEN;
		game_board.flags--;
		break;

	case GAME_USR_POSSIBLE:
		game_board.usr[r][c]	= GAME_USR_HIDDEN;
		break;
	}
}

static	void	game_all_flags		(ptrdiff_t r, ptrdiff_t c)
{
	int	cnt;

	cnt =	game_count_nclear(r, c);
	if (cnt && (game_board.gnd[r][c] == cnt))
		game_flag_recursive(r, c);
}

static	int	game_count_nclear	(ptrdiff_t r, ptrdiff_t c)
{
	int	cnt;

	cnt =	0;
	for (ptrdiff_t i = r - 1; i < r + 2; i++) {
	for (ptrdiff_t j = c - 1; j < c + 2; j++) {
		if (i >= 0 && i < game_board.rows) {
		if (j >= 0 && j < game_board.cols) {
			if (game_board.usr[i][j] != GAME_USR_CLEAR)
				cnt++;
		}
		}
	}
	}

	return	cnt;
}

static	void	game_flag_recursive	(ptrdiff_t r, ptrdiff_t c)
{

	for (ptrdiff_t i = r - 1; i < r + 2; i++) {
	for (ptrdiff_t j = c - 1; j < c + 2; j++) {
		if (i >= 0 && i < game_board.rows) {
		if (j >= 0 && j < game_board.cols) {
			switch (game_board.usr[i][j]) {
			case GAME_USR_HIDDEN:
			case GAME_USR_POSSIBLE:
				game_board.usr[i][j]	= GAME_USR_FLAG;
				game_board.flags++;
				break;
			}
		}
		}
	}
	}
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
