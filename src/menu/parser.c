/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include "mine-sweeper/menu/parser.h"

#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

#define ALX_NO_PREFIX
#include <libalx/base/stdio/printf/sbprintf.h>
#include <libalx/base/stdlib/seed.h>
#include <libalx/base/stdlib/strto/strtof_s.h>
#include <libalx/base/stdlib/strto/strtoi_s.h>

#include "mine-sweeper/about/about.h"
#include "mine-sweeper/ctrl/start.h"
#include "mine-sweeper/game/iface.h"
#include "mine-sweeper/menu/iface.h"
#include "mine-sweeper/player/iface.h"
#include "mine-sweeper/save/save.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
#define OPT_LIST	"xhLuv""a:b:f:i:p:r:s:"


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	parse_rows		(const char *argument);
static	void	parse_columns		(const char *argument);
static	void	parse_file		(const char *argument);
static	void	parse_iface		(const char *argument);
static	void	parse_proportion	(const char *argument);
#if 0
static	void	parse_rand_seed		(const char *argument);
#endif
static	void	parse_start		(const char *argument);


/******************************************************************************
 ******* global functions *****************************************************
 ******************************************************************************/
void	parser	(int argc, char *argv[])
{
	int	opt		= 0;
	int	opt_index	= 0;

	const struct option	long_options[]	= {
		/* Standard */
		{"exit",		no_argument,		0,	'x'},
		{"help",		no_argument,		0,	'h'},
		{"license",		no_argument,		0,	'L'},
		{"usage",		no_argument,		0,	'u'},
		{"version",		no_argument,		0,	'v'},
		/* Non-standard */
		{"rows",		required_argument,	0,	'a'},
		{"columns",		required_argument,	0,	'b'},
		{"file",		required_argument,	0,	'f'},
		{"iface",		required_argument,	0,	'i'},
		{"proportion",		required_argument,	0,	'p'},
//		{"rand-seed",		required_argument,	0,	'r'},
		{"start",		required_argument,	0,	's'},
		/* Null */
		{0,			0,			0,	0}
	};

	while ((opt = getopt_long(argc, argv, OPT_LIST, long_options,
						&opt_index)) != -1) {

		switch (opt) {
		/* Standard */
		case 'x':
			flag_exit	= true;
			break;
		case 'h':
			print_share_file(SHARE_HELP);
			exit(EXIT_SUCCESS);
		case 'L':
			print_share_file(SHARE_LICENSE);
			exit(EXIT_SUCCESS);
		case 'u':
			print_share_file(SHARE_USAGE);
			exit(EXIT_SUCCESS);
		case 'v':
			print_version();
			exit(EXIT_SUCCESS);

		/* Non-standard */
		case 'a':
			parse_rows(optarg);
			break;
		case 'b':
			parse_columns(optarg);
			break;
		case 'f':
			parse_file(optarg);
			break;
		case 'i':
			parse_iface(optarg);
			break;
		case 'p':
			parse_proportion(optarg);
			break;
# if 0
// for DEVEL
		case 'r':
			parse_rand_seed(optarg);
			break;
# endif
		case 's':
			parse_start(optarg);
			break;
		case '?':
			/* getopt_long already printed an error message. */
		default:
			print_share_file(SHARE_USAGE);
			exit(EXIT_FAILURE);
		}
	}
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
static	void	parse_rows		(const char *argument)
{

	if (strtoi64_s(&menu_iface_variables.rows, argument, 0, NULL))
		goto err;
	if ((menu_iface_variables.rows < 2)  ||
			(menu_iface_variables.rows > ROWS_MAX))
		goto err;
	return;
err:
	printf("--rows argument not valid\n");
	printf("It must be an integer [%i U %i]\n", 2, ROWS_MAX);
	exit(EXIT_FAILURE);
}

static	void	parse_columns		(const char *argument)
{

	if (strtoi64_s(&menu_iface_variables.cols, argument, 0, NULL))
		goto err;
	if ((menu_iface_variables.cols < 2)  ||
			(menu_iface_variables.cols > COLS_MAX))
		goto err;
	return;
err:
	printf("--columns argument not valid\n");
	printf("It must be an integer [%i U %i]\n", 2, COLS_MAX);
	exit(EXIT_FAILURE);
}

static	void	parse_file		(const char *argument)
{
	FILE	*fp;

	// FIXME
	fp	= fopen(argument, "r");
	if (!fp)
		goto err;
	fclose(fp);

	saved_path[0]	= '\0';
	if (sbprintf(saved_name, NULL, "%s", argument))
		goto err;

	return;

err:
	printf("--file argument not valid\n");
	printf("It must be a valid file name (relative to saved dir)\n");
	exit(EXIT_FAILURE);
}

static	void	parse_iface		(const char *argument)
{

	if (strtoi32_s(&menu_iface_mode, argument, 0, NULL))
		goto err;
	player_iface_mode	= menu_iface_mode;
	if ((menu_iface_mode < MENU_IFACE_CLUI)  ||
					(menu_iface_mode > MENU_IFACE_GUI))
		goto err;
	return;
err:
	printf("--iface argument not valid\n");
	printf("It must be an integer [%i U %i]\n",
					MENU_IFACE_CLUI, MENU_IFACE_GUI);
	exit(EXIT_FAILURE);
}

static	void	parse_proportion	(const char *argument)
{

	if (strtod_s(&menu_iface_variables.p, argument, NULL))
		goto err;
	if ((menu_iface_variables.p < 0)  ||  (menu_iface_variables.p > 1))
		goto err;
	return;
err:
	printf("--proportion argument not valid\n");
	printf("It must be a real [0 U 1]\n");
	exit(EXIT_FAILURE);
}
#if 0
static	void	parse_rand_seed		(const char *argument)
{
	int	seed;

	seed	= atof(argument);
	srand(seed);
}
#endif
static	void	parse_start		(const char *argument)
{

	if (strtoi32_s(&start_mode, argument, 0, NULL))
		goto err;
	if ((start_mode < START_FOO)  ||  (start_mode > START_LOAD))
		goto err;
	return;
err:
	printf("--start argument not valid\n");
	printf("It must be an integer [%i U %i]\n", START_FOO, START_LOAD);
	exit(EXIT_FAILURE);
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
