/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
# ifndef		MSW_START_H
	# define	MSW_START_H


/******************************************************************************
 ******* enums ****************************************************************
 ******************************************************************************/
	enum	Start_Mode {
		START_FOO = 0,
		START_RAND,
		START_LOAD
	};


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
extern	int	start_mode;


/******************************************************************************
 ******* functions ************************************************************
 ******************************************************************************/
	void	start_switch	(void);


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
# endif			/* start.h */


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/