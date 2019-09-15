/******************************************************************************
 *	Copyright (C) 2018	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
#ifndef MSW_XYZZY_H
#define MSW_XYZZY_H


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include "mine-sweeper/game/iface.h"


/******************************************************************************
 ******* functions ************************************************************
 ******************************************************************************/
void	xyzzy_init	(void);
int	xyzzy_lin	(const struct Game_Iface_Out	*out,
			struct Game_Iface_In		*in);
int	xyzzy_p		(const struct Game_Iface_Out	*out,
			struct Game_Iface_In		*in);


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
# endif			/* xyzzy.h */


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/