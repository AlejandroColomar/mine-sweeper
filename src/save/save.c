/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 *	SPDX-License-Identifier:	GPL-2.0-only			      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
#include "mine-sweeper/save/save.h"

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include <sys/stat.h>

#include "libalx/base/errno/error.h"
#include "libalx/base/stdio/seekc.h"

#include "mine-sweeper/game/core.h"
#include "mine-sweeper/player/iface.h"


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

	if (snprintf(home_path, sizeof(home_path), "%s/",
				getenv(ENV_HOME))  >=  FILENAME_MAX) {
		goto err_path;
	}
	if (snprintf(user_game_path, sizeof(user_game_path), "%s/%s/",
				home_path, USER_GAME_DIR)  >=  FILENAME_MAX) {
		goto err_path;
	}
	if (snprintf(saved_path, sizeof(saved_path), "%s/%s/",
				home_path, USER_SAVED_DIR)  >=  FILENAME_MAX) {
		goto err_path;
	}
	saved_name[0]	= '\0';

	if (mkdir(user_game_path, 0700)) {
		if (errno != EEXIST)
			goto err_mkdir;
	}
	if (mkdir(saved_path, 0700)) {
		if (errno != EEXIST)
			goto err_mkdir;
		return;
	}

	return;

err_path:
	alx_perror("Path is too large and has been truncated");
	exit(EXIT_FAILURE);
err_mkdir:
	alx_perror(NULL);
}

void	save_clr	(void)
{

	if (snprintf(saved_path, sizeof(saved_path), "%s/%s/",
				home_path, USER_SAVED_DIR)  >=  FILENAME_MAX) {
		goto err_path;
	}

	return;


err_path:
	alx_perror("Path is too large and has been truncated");
	exit(EXIT_FAILURE);
}

int	load_game_file	(void)
{
	char	fname[FILENAME_MAX];
	FILE	*fp;
	int	i;
	int	j;

	if (snprintf(fname, sizeof(fname), "%s/%s",
				saved_path, saved_name)  >=  FILENAME_MAX) {
		goto err_path;
	}

	fp	= fopen(fname, "r");
	if (!fp)
		return	-1;
	fscanf(fp, "mine-sweeper saved game");
	fscanf(fp, " rows %ti", &game_board.rows);
	fscanf(fp, " cols %ti", &game_board.cols);
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

	return	0;


err_path:
	alx_perror("Path is too large and has been truncated");
	alx_wait4enter();
	exit(EXIT_FAILURE);
}

void	save_game_file	(char fpath[static restrict FILENAME_MAX])
{
	char	fname[FILENAME_MAX];
	char	tmp[FILENAME_MAX];
	char	old_saved[FILENAME_MAX];
	char	file_num[6];
	FILE	*fp;
	int	i;
	int	j;
	bool	x;

	/* Don't change saved_name variable if not in default dir */
	if (fpath)
		snprintf(old_saved, sizeof(old_saved), "%s", saved_name);

	/* Default path & name */
	save_clr();
	snprintf(saved_name, sizeof(saved_name), "%s", SAVED_NAME_DEFAULT);
	file_num[0]	= '\0';

	/* Request file name */
	player_iface_save_name(fpath, saved_name);

	/* Look for an unused name of the type 'name_XXX.mine'. */
	x	= true;
	for (i = 0; x; i++) {
		if (!fpath) {
			if (snprintf(fname, sizeof(fname), "%s/%s%s%s",
					saved_path, saved_name, file_num,
					FILE_EXTENSION)  >=  FILENAME_MAX) {
				goto err_path;
			}
		} else {
			if (snprintf(fname, sizeof(fname), "%s/%s%s%s",
					fpath, saved_name, file_num,
					FILE_EXTENSION)  >=  FILENAME_MAX) {
				goto err_path;
			}
		}

		fp =	fopen(fname, "r");
		if (fp) {
			fclose(fp);
			file_num[0] =	'_';
			file_num[1] =	'0' + ((i / 100) % 10);
			file_num[2] =	'0' + ((i / 10) % 10);
			file_num[3] =	'0' + (i % 10);
			file_num[4] =	'\0';
		} else {
			x	= false;
			if (snprintf(tmp, sizeof(tmp), "%s%s%s",
					saved_name, file_num,
					FILE_EXTENSION)  >=  FILENAME_MAX) {
				goto err_path;
			}
			snprintf(saved_name, sizeof(saved_name), "%s", tmp);
		}
	}

	/* Write to a new file */
	fp	= fopen(fname, "w");
	if (!fp) {
		alx_perror(fname);
		goto err_fopen;
	}
	fprintf(fp, "mine-sweeper saved game\n");
	fprintf(fp, "rows %ti\n", game_board.rows);
	fprintf(fp, "cols %ti\n", game_board.cols);
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
err_fopen:
	/* Don't change saved_name if saving in non-default dir */
	if (fpath)
		snprintf(saved_name, sizeof(saved_name), "%s", old_saved);

	return;


err_path:
	alx_perror("Path is too large and has been truncated");
	alx_wait4enter();
	exit(EXIT_FAILURE);
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
