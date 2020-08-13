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

#define ALX_NO_PREFIX
#include <libalx/base/compiler.h>
#include <libalx/base/errno.h>
#include <libalx/base/stdio.h>
#include <libalx/base/stdio.h>

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

	if (sbprintf(home_path, NULL, "%s/", getenv(ENV_HOME)))
		goto err_path;
	if (sbprintf(user_game_path, NULL, "%s/%s/", home_path, USER_GAME_DIR))
		goto err_path;
	if (sbprintf(saved_path, NULL, "%s/%s/", home_path, USER_SAVED_DIR))
		goto err_path;
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
	perrorx(getenv(ENV_HOME));
	exit(EXIT_FAILURE);
err_mkdir:
	perrorx(home_path);
}

void	save_clr	(void)
{

	if (sbprintf(saved_path, NULL, "%s/%s/", home_path, USER_SAVED_DIR))
		goto err;
	return;

err:
	perrorx(home_path);
	exit(EXIT_FAILURE);
}

int	load_game_file	(void)
{
	char	fname[FILENAME_MAX];
	FILE	*fp;
	int	i;
	int	j;

	if (sbprintf(fname, NULL, "%s/%s", saved_path, saved_name))
		goto err_path;

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
	perrorx(saved_name);
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
		ALX_UNUSED(sbprintf(old_saved, NULL, "%s", saved_name));

	/* Default path & name */
	save_clr();
	ALX_UNUSED(sbprintf(saved_name, NULL, "%s", SAVED_NAME_DEFAULT));
	file_num[0]	= '\0';

	/* Request file name */
	player_iface_save_name(fpath, saved_name);

	/* Look for an unused name of the type 'name_XXX.mine'. */
	x	= true;
	for (i = 0; x; i++) {
		if (!fpath) {
			if (sbprintf(fname, NULL, "%s/%s%s%s", saved_path,
					saved_name, file_num, FILE_EXTENSION)) {
				goto err_path;
			}
		} else {
			if (sbprintf(fname, NULL, "%s/%s%s%s", fpath,
					saved_name, file_num, FILE_EXTENSION)) {
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
			if (sbprintf(tmp, NULL, "%s%s%s",
					saved_name, file_num, FILE_EXTENSION)) {
				goto err_path;
			}
			ALX_UNUSED(sbprintf(saved_name, NULL, "%s", tmp));
		}
	}

	/* Write to a new file */
	fp	= fopen(fname, "w");
	if (!fp) {
		perrorx(fname);
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
		ALX_UNUSED(sbprintf(saved_name, NULL, "%s", old_saved));

	return;


err_path:
	perrorx(fname);
	alx_wait4enter();
	exit(EXIT_FAILURE);
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
