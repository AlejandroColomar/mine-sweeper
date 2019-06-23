/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 *	SPDX-License-Identifier:	GPL-2.0-only			      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include "mine-sweeper/save/score.h"

#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "libalx/base/errno/perror.h"
#include "libalx/base/stddef/size.h"
#include "libalx/base/stdio/wait.h"

#include "mine-sweeper/game/core.h"
#include "mine-sweeper/game/iface.h"
#include "mine-sweeper/player/iface.h"
#include "mine-sweeper/save/save.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/


/******************************************************************************
 ******* global functions *****************************************************
 ******************************************************************************/
void	save_score	(const struct Game_Iface_Score  *game_iface_score)
{
	struct tm	*date_format;
	char		*fname;
	char		player_name[BUFSIZ];
	FILE		*fp;
	time_t		date_secs;

	/* File name */
	switch (game_iface_score->level) {
	case GAME_IFACE_LVL_BEGINNER:
		fname	= HISCORES_BEGINNER_FILE;
		break;
	case GAME_IFACE_LVL_INTERMEDIATE:
		fname	= HISCORES_INTERMEDIATE_FILE;
		break;
	case GAME_IFACE_LVL_EXPERT:
		fname	= HISCORES_EXPERT_FILE;
		break;
	}

	/* Date & time */
	date_secs	= time(NULL);
	date_format	= localtime(&date_secs);

	/* Player name (foo is default) */
	player_iface_score_name(player_name);

	/* Write to file (append) */
	errno	= 0;
	fp	= fopen(fname, "a");
	if (!fp)
		goto err_fp;
	fprintf(fp, "\n");
	fprintf(fp, "name	%s\n", player_name);
	fprintf(fp, "date	%i\n", (int)date_secs);
	fprintf(fp, "{\n");
	fprintf(fp, "	isdst	%i\n", date_format->tm_isdst);
	fprintf(fp, "	yday	%i\n", date_format->tm_yday);
	fprintf(fp, "	wday	%i\n", date_format->tm_wday);
	fprintf(fp, "	year	%i\n", date_format->tm_year);
	fprintf(fp, "	mon	%i\n", date_format->tm_mon);
	fprintf(fp, "	mday	%i\n", date_format->tm_mday);
	fprintf(fp, "	hour	%i\n", date_format->tm_hour);
	fprintf(fp, "	min	%i\n", date_format->tm_min);
	fprintf(fp, "	sec	%i\n", date_format->tm_sec);
	fprintf(fp, "}\n");
	fprintf(fp, "time	%i\n", game_iface_score->time);
	fprintf(fp, "clicks	%i\n", game_iface_score->clicks);
	fprintf(fp, "file	%s\n", saved_name);
	fclose(fp);

	return;

err_fp:
	alx_perror("Score could not be saved");
}

void	print_scores	(void)
{
	char	cmd[_POSIX_ARG_MAX];

	if (snprintf(cmd, sizeof(cmd), "less %s %s %s",
				HISCORES_BEGINNER_FILE,
				HISCORES_INTERMEDIATE_FILE,
				HISCORES_EXPERT_FILE)  >=  SSIZEOF(cmd)) {
		goto err;
	}
	if (system(cmd))
		alx_perror(NULL);
	return;
err:
	alx_perror("Path is too large and has been truncated");
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
