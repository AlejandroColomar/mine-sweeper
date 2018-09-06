/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
# ifndef		MSW_SAVE_H
	# define	MSW_SAVE_H


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
		/* bool */
	#include <stdbool.h>
		/* FILENAME_MAX */
	#include <stdio.h>


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
	# if defined (OS_LINUX)
	#	define		ENV_HOME		"HOME"
	# elif defined (OS_WIN)
	#	define		ENV_HOME		"USERPROFILE"
	# endif

	# define		USER_GAME_DIR		".mine-sweeper/"
	# define		USER_SAVED_DIR		".mine-sweeper/saved/"
	# define		SAVED_NAME_DEFAULT	"saved"
	# define		FILE_EXTENSION		".mine"


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
extern	char	home_path [FILENAME_MAX];
extern	char	user_game_path [FILENAME_MAX];
extern	char	saved_path [FILENAME_MAX];
extern	char	saved_name [FILENAME_MAX];


/******************************************************************************
 ******* functions ************************************************************
 ******************************************************************************/
void	save_init	(void);
void	save_clr	(void);
void	load_game_file	(void);
void	save_game_file	(char *filepath);


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
# endif				/* save.h */


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
