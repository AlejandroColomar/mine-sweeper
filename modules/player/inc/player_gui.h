/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
# ifndef		MSW_PLAYER_GUI_H
	# define	MSW_PLAYER_GUI_H


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
		/* struct Game_Iface_... */
	#include "game_iface.h"

	#include "player_iface.h"


/******************************************************************************
 ******* enums ****************************************************************
 ******************************************************************************/
	enum	Player_GUI_Char {
		PLAYER_GUI_CHAR_ERROR		= 'X',
		PLAYER_GUI_CHAR_KBOOM		= '#',
		PLAYER_GUI_CHAR_HIDDEN_FIELD	= '+',
		PLAYER_GUI_CHAR_HIDDEN_MINE	= '*',
		PLAYER_GUI_CHAR_HIDDEN_SAFE	= '-',
		PLAYER_GUI_CHAR_SAFE_MINE	= 'v',
		PLAYER_GUI_CHAR_0		= ' ',
		PLAYER_GUI_CHAR_1		= '1',
		PLAYER_GUI_CHAR_2		= '2',
		PLAYER_GUI_CHAR_3		= '3',
		PLAYER_GUI_CHAR_4		= '4',
		PLAYER_GUI_CHAR_5		= '5',
		PLAYER_GUI_CHAR_6		= '6',
		PLAYER_GUI_CHAR_7		= '7',
		PLAYER_GUI_CHAR_8		= '8',
		PLAYER_GUI_CHAR_FLAG		= '!',
		PLAYER_GUI_CHAR_FLAG_FALSE	= 'F',
		PLAYER_GUI_CHAR_POSSIBLE	= '?',
		PLAYER_GUI_CHAR_POSSIBLE_FALSE	= 'f'
	};


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/


/******************************************************************************
 ******* functions ************************************************************
 ******************************************************************************/
void	player_gui_init		(struct Player_Iface_Position		*position,
				int					*action);

int	player_gui_start	(struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle);

int	player_gui		(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle);

void	player_gui_save_name	(const char *filepath, char *filename, int destsize);
void	player_gui_score_name	(char *player_name, int destsize);
void	player_gui_cleanup	(void);


/******************************************************************************
 ******* include guard ********************************************************
 ******************************************************************************/
# endif			/* player_gui.h */


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
