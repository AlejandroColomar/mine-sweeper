/******************************************************************************
 *	Copyright (C) 2018	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
/* Standard C ----------------------------------------------------------------*/
	#include <stdbool.h>
/* Project -------------------------------------------------------------------*/
	#include "game_iface.h"

	#include "xyzzy.h"


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
static	int	x;
static	bool	step_notflag;


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	xyzzy_step_all	(const struct Game_Iface_Out	*out,
				struct Game_Iface_In		*in);
static	void	xyzzy_flag_all	(const struct Game_Iface_Out	*out,
				struct Game_Iface_In		*in);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	xyzzy_init	(void)
{

	x		= 0;
	step_notflag	= true;
}

int	xyzzy_lin	(const struct Game_Iface_Out	*out,
			struct Game_Iface_In		*in)
{

	if (!x) {
		x	= 1;
	}

	if (step_notflag) {
		xyzzy_step_all(out, in);
	} else {
		xyzzy_flag_all(out, in);
		x--;
	}

	step_notflag	= !step_notflag;

	return	x;
}

int	xyzzy_p		(const struct Game_Iface_Out	*out,
			struct Game_Iface_In		*in)
{

	if (!x) {
		x	= (out->rows * out->cols) / 2;
	}

	xyzzy_lin(out, in);

	return	x;
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	xyzzy_step_all	(const struct Game_Iface_Out	*out,
				struct Game_Iface_In		*in)
{
	int	i;
	int	j;

	for (i = 0; i < out->rows; i++) {
	for (j = 0; j < out->cols; j++) {
		if (out->usr[i][j] == GAME_IFACE_USR_CLEAR) {
			in->act_game[i][j]	= GAME_IFACE_GAME_ACT_STEP;
		}
	}
	}
}

static	void	xyzzy_flag_all	(const struct Game_Iface_Out	*out,
				struct Game_Iface_In		*in)
{
	int	i;
	int	j;

	for (i = 0; i < out->rows; i++) {
	for (j = 0; j < out->cols; j++) {
		if (out->usr[i][j] == GAME_IFACE_USR_CLEAR) {
			in->act_game[i][j]	= GAME_IFACE_GAME_ACT_FLAG;
		}
	}
	}
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
