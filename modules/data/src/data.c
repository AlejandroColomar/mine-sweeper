/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/

		/* errors */
	#include <errno.h>
		/* has_colors() & start_color() & init_pair() */
	#include <ncurses.h>
		/* mkdir */
	#include <sys/stat.h>
		/* bool */
	#include <stdbool.h>
		/* srand() */
	#include <stdlib.h>
		/* strcpy() */
	#include <string.h>
		/* time_t & clock() & time() */
	#include <time.h>
		/* getpid() */
	#include <unistd.h>

		/* seedf() */
	#include "alx_seed.h"

	#include "data.h"


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
char		prog_name[FILENAME_MAX];

struct Board	board;

enum Flag_s	flag_s;
enum Flag_V	flag_V;
enum Flag_Iface	flag_iface;
bool		flag_exit;
bool		flag_color;

char		share_path [FILENAME_MAX];

char		home_path [FILENAME_MAX];
char		user_game_path [FILENAME_MAX];

char		saved_path [FILENAME_MAX];
char		saved_name [FILENAME_MAX];

int		seed;

time_t		tim_ini;

bool		highlight;


/******************************************************************************
 ******* static ***************************************************************
 ******************************************************************************/
static	void	init_values_home	(void);
static	void	init_values_color	(void);


/******************************************************************************
 ******* functions ************************************************************
 ******************************************************************************/
void	init_values	(void)
{
	strcpy(share_path, INSTALL_SHARE_DIR);
	strcat(share_path, "/");
	strcat(share_path, SHARE_DIR);
	strcat(share_path, "/");

	strcpy(saved_name, SAVED_NAME_DEFAULT);

	board.p =	0.16;
	board.rows =	8;
	board.cols =	8;

	flag_s =	START_FOO;
	flag_V =	1;
	flag_iface =	IFACE_TUI;
	flag_exit =	false;

	seed =		seedf(clock(), time(NULL), getpid());
	srand(seed);

	init_values_home();
	init_values_color();
}


/******************************************************************************
 ******* static ***************************************************************
 ******************************************************************************/
static	void	init_values_home	(void)
{
	int	err;

	strcpy(home_path, getenv(ENV_HOME));

	strcpy(user_game_path, home_path);
	strcat(user_game_path, "/");
	strcat(user_game_path, USER_GAME_DIR);
	strcat(user_game_path, "/");

	strcpy(saved_path, home_path);
	strcat(saved_path, "/");
	strcat(saved_path, USER_SAVED_DIR);
	strcat(saved_path, "/");

	strcpy(saved_name, SAVED_NAME_DEFAULT);

#if defined	OS_LINUX
	err	= mkdir(user_game_path, 0700);
#elif defined	OS_WIN
	err	= mkdir(user_game_path);
#endif

	if (!err) {
#if defined	OS_LINUX
		mkdir(user_game_path, 0700);
#elif defined	OS_WIN
		mkdir(user_game_path);
#endif
	} else {

		switch (errno) {
		case EACCES:
			printf("err = EACCES");
			break;

		case EEXIST:
			/* OK */
			break;
/* fails on mingw
		case ELOOP:
			printf("err = ELOOP");
			break;
*/
		case EMLINK:
			printf("err = EMLINK");
			break;

		case ENAMETOOLONG:
			printf("err = ENAMETOOLONG");
			break;

		case ENOENT:
			printf("err = ENOENT");
			break;

		case ENOSPC:
			printf("err = ENOSPC");
			break;

		case ENOTDIR:
			printf("err = ENOTDIR");
			break;

		case EROFS:
			printf("err = EROFS");
			break;

		default:
			printf("err = other");
			break;
		}
	}
}

static	void	init_values_color	(void)
{
	flag_color = false;
	if (has_colors()) {
		flag_color = true;
		/* Clear */
		init_pair(PAIR_1, COLOR_BLUE, COLOR_WHITE);
		init_pair(PAIR_2, COLOR_GREEN, COLOR_WHITE);
		init_pair(PAIR_3, COLOR_RED, COLOR_WHITE);
		init_pair(PAIR_4, COLOR_BLUE, COLOR_WHITE);
		init_pair(PAIR_5, COLOR_RED, COLOR_WHITE);
		init_pair(PAIR_6, COLOR_CYAN, COLOR_WHITE);
		init_pair(PAIR_7, COLOR_BLACK, COLOR_WHITE);
		init_pair(PAIR_8, COLOR_BLACK, COLOR_WHITE);
		init_pair(PAIR_BLANK, COLOR_BLACK, COLOR_WHITE);
		/* Hidden */
		init_pair(PAIR_MINE, COLOR_WHITE, COLOR_BLACK);
		init_pair(PAIR_HIDDEN, COLOR_WHITE, COLOR_BLACK);
		/* Possible */
		init_pair(PAIR_fail, COLOR_RED, COLOR_BLACK);
		init_pair(PAIR_POSSIBLE, COLOR_BLUE, COLOR_BLACK);
		/* Flag */
		init_pair(PAIR_FAIL, COLOR_RED, COLOR_BLACK);
		init_pair(PAIR_FLAG, COLOR_RED, COLOR_BLACK);
		/* Kboom */
		init_pair(PAIR_KBOOM, COLOR_BLACK, COLOR_RED);
		/* Highlight */
		init_pair(PAIR_HILITE, COLOR_YELLOW, COLOR_RED);

		init_pair(PAIR_TERM, -1, -1);
	}
}


/******************************************************************************
 ******************************************************************************
 **** END OF FILE *************************************************************
 ******************************************************************************
 ******************************************************************************/

/******************************************************************************
 ******************************************************************************
 **** END OF FILE *************************************************************
 ******************************************************************************
 ******************************************************************************/
