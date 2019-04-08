/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 *	SPDX-License-Identifier:	GPL-2.0-only			      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
	#include <errno.h>
	#include <stdbool.h>
	#include <stdio.h>
	#include <stdlib.h>

		/* mkdir */
	#include <sys/stat.h>

	#include "game.h"
	#include "player_iface.h"

	#include "save.h"


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
	char	home_path [FILENAME_MAX];
	char	user_game_path [FILENAME_MAX];
	char	saved_path [FILENAME_MAX];
	char	saved_name [FILENAME_MAX];


/******************************************************************************
 ******* global functions *****************************************************
 ******************************************************************************/
void	save_init	(void)
{

	if (snprintf(home_path, FILENAME_MAX, "%s/",
				getenv(ENV_HOME))  >=  FILENAME_MAX) {
		goto err_path;
	}
	if (snprintf(user_game_path, FILENAME_MAX, "%s/%s/",
				home_path, USER_GAME_DIR)  >=  FILENAME_MAX) {
		goto err_path;
	}
	if (snprintf(saved_path, FILENAME_MAX, "%s/%s/",
				home_path, USER_SAVED_DIR)  >=  FILENAME_MAX) {
		goto err_path;
	}
	saved_name[0]	= '\0';

	if (mkdir(user_game_path, 0700)) {
		switch (errno) {
		case EACCES:
			printf("err = EACCES");
			exit(EXIT_FAILURE);
		case EEXIST:
			/* OK */
			return;
		default:
			printf("WTF?!");
			exit(EXIT_FAILURE);
		}
	}
	if (mkdir(saved_path, 0700)) {
		switch (errno) {
		case EACCES:
			printf("err = EACCES");
			exit(EXIT_FAILURE);
		case EEXIST:
			/* OK */
			return;
		default:
			printf("WTF?!");
			exit(EXIT_FAILURE);
		}
	}

	return;


err_path:
	printf("Path is too large and has been truncated\n");
	getchar();
	exit(EXIT_FAILURE);
}

void	save_clr	(void)
{

	if (snprintf(saved_path, FILENAME_MAX, "%s/%s/",
				home_path, USER_SAVED_DIR)  >=  FILENAME_MAX) {
		goto err_path;
	}

	return;


err_path:
	printf("Path is too large and has been truncated\n");
	getchar();
	exit(EXIT_FAILURE);
}

void	load_game_file	(void)
{
	char	file_name [FILENAME_MAX];
	FILE	*fp;
	int	i;
	int	j;

	if (snprintf(file_name, FILENAME_MAX, "%s/%s",
				saved_path, saved_name)  >=  FILENAME_MAX) {
		goto err_path;
	}

	fp	= fopen(file_name, "r");
	if (fp) {
		fscanf(fp, "mine-sweeper saved game");
		fscanf(fp, " rows %i", &game_board.rows);
		fscanf(fp, " cols %i", &game_board.cols);
		fscanf(fp, " mines %i", &game_board.mines);
		fscanf(fp, " gnd");
		for (i = 0; i < game_board.rows; i++) {
			fscanf(fp, " %i", &game_board.gnd[i][0]);
			for (j = 1; j < game_board.cols; j++)
				fscanf(fp, ",%i", &game_board.gnd[i][j]);
		}
		fscanf(fp, " usr");
		for (i = 0; i < game_board.rows; i++) {
			fscanf(fp, " %i", &game_board.usr[i][0]);
			for (j = 1; j < game_board.cols; j++)
				fscanf(fp, ",%i", &game_board.usr[i][j]);
		}
		fscanf(fp, " flags %i", &game_board.flags);
		fscanf(fp, " cleared %i", &game_board.clr);

		fclose(fp);
	}

	return;


err_path:
	printf("Path is too large and has been truncated\n");
	getchar();
	exit(EXIT_FAILURE);
}

void	save_game_file	(char *filepath)
{
	char	file_name [FILENAME_MAX];
	char	tmp [FILENAME_MAX];
	char	old_saved [FILENAME_MAX];
	char	file_num [6];
	FILE	*fp;
	int	i;
	int	j;
	bool	x;

	/* Don't change saved_name variable if not in default dir */
	if (filepath)
		snprintf(old_saved, FILENAME_MAX, "%s", saved_name);

	/* Default path & name */
	save_clr();
	snprintf(saved_name, FILENAME_MAX, "%s", SAVED_NAME_DEFAULT);
	file_num[0]	= '\0';

	/* Request file name */
	player_iface_save_name(filepath, saved_name, FILENAME_MAX);

	/* Look for an unused name of the type 'name_XXX.mine'. */
	x	= true;
	for (i = 0; x; i++) {
		if (filepath == NULL) {
			if (snprintf(file_name, FILENAME_MAX, "%s/%s%s%s",
					saved_path,
					saved_name, file_num,
					FILE_EXTENSION)  >=  FILENAME_MAX) {
				goto err_path;
			}
		} else {
			if (snprintf(file_name, FILENAME_MAX, "%s/%s%s%s",
					filepath,
					saved_name, file_num,
					FILE_EXTENSION)  >=  FILENAME_MAX) {
				goto err_path;
			}
		}

		fp =	fopen(file_name, "r");
		if (fp) {
			fclose(fp);
			file_num[0] =	'_';
			file_num[1] =	'0' + ((i / 100) % 10);
			file_num[2] =	'0' + ((i / 10) % 10);
			file_num[3] =	'0' + (i % 10);
			file_num[4] =	'\0';
		} else {
			x	= false;
			if (snprintf(tmp, FILENAME_MAX, "%s%s%s",
					saved_name, file_num,
					FILE_EXTENSION)  >=  FILENAME_MAX) {
				goto err_path;
			}
			snprintf(saved_name, FILENAME_MAX, "%s", tmp);
		}
	}

	/* Write to a new file */
	fp	= fopen(file_name, "w");
	if (fp) {
		fprintf(fp, "mine-sweeper saved game\n");
		fprintf(fp, "rows %i\n", game_board.rows);
		fprintf(fp, "cols %i\n", game_board.cols);
		fprintf(fp, "mines %i\n", game_board.mines);
		fprintf(fp, "gnd\n");
		for (i = 0; i < game_board.rows; i++) {
			fprintf(fp, "%i", game_board.gnd[i][0]);
			for (j = 1; j < game_board.cols; j++)
				fprintf(fp, ",%i", game_board.gnd[i][j]);
			fprintf(fp, "\n");
		}
		fprintf(fp, "usr\n");
		for (i = 0; i < game_board.rows; i++) {
			fprintf(fp, "%i", game_board.usr[i][0]);
			for (j = 1; j < game_board.cols; j++)
				fprintf(fp, ",%i", game_board.usr[i][j]);
			fprintf(fp, "\n");
		}
		fprintf(fp, "flags %i\n", game_board.flags);
		fprintf(fp, "cleared %i\n", game_board.clr);

		fclose(fp);
	}

	/* Don't change saved_name if saving in non-default dir */
	if (filepath)
		snprintf(saved_name, FILENAME_MAX, "%s", old_saved);

	return;


err_path:
	printf("Path is too large and has been truncated\n");
	getchar();
	exit(EXIT_FAILURE);
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
