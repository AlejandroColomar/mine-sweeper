/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/

		/* fscanf() & fprintf() & FILE & FILENAME_MAX */
	#include <stdio.h>
		/* strcpy() & strcat() */
	#include <string.h>

	#include "data.h"

	#include "save.h"


static	FILE	*fp;

/*----------------------------------------------------------------------------*/

	/*
	 * Load from a file.
	 */
int	load_game_file	(void)
{
	int	i;
	int	j;
	int	err;

	strcpy(file_path, SAVE_DIR);
	strcat(file_path, file_name);

	fp =	fopen(file_path, "r");
	if (fp) {
		fscanf(fp, "mine_sweeper saved game");
		fscanf(fp, " rows %i", &board.rows);
		fscanf(fp, " cols %i", &board.cols);
		fscanf(fp, " mines %i", &board.mines);
		fscanf(fp, " gnd");
		for (i = 0; i < board.rows; i++) {
			fscanf(fp, " %i", &board.gnd[i][0]);
			for (j = 1; j < board.cols; j++) {
				fscanf(fp, ",%i", &board.gnd[i][j]);
			}
		}
		fscanf(fp, " usr");
		for (i = 0; i < board.rows; i++) {
			fscanf(fp, " %i", &board.usr[i][0]);
			for (j = 1; j < board.cols; j++) {
				fscanf(fp, ",%i", &board.usr[i][j]);
			}
		}
		fscanf(fp, " flags %i", &board.flags);
		fscanf(fp, " cleared %i", &board.cleared);

		fclose(fp);
		err =	ERR_OK;

		board.time =	CHEATED;
		board.clicks =	CHEATED;
		board.state =	GAME_CHEATED;
	} else {
		err =	ERR_FILENAME;
	}

	return	err;
}

	/*
	 * Save into a file.
	 */
int	save_game_file	(void)
{
	/* Look for an unused name of the type 'saved_XXX.mine'. */
	int	i;
	bool	x;
	x =	true;
	strcpy(file_name, DEFAULT_SAVE);
	for (i = 0; x; i++) {
		strcpy(file_path, SAVE_DIR);
		strcat(file_path, file_name);

		fp =	fopen(file_path, "r");
		if (fp) {
			fclose(fp);
			file_name[6] =	'0' + ((i / 100) % 10);
			file_name[7] =	'0' + ((i / 10) % 10);
			file_name[8] =	'0' + (i % 10);
		} else {
			x = false;
		}
	}

	/* Write to a new file */
	int	err;
	int	j;
	fp = fopen(file_path, "w");
	if (fp) {
		fprintf(fp, "mine_sweeper saved game\n");
		fprintf(fp, "rows %i\n", board.rows);
		fprintf(fp, "cols %i\n", board.cols);
		fprintf(fp, "mines %i\n", board.mines);
		fprintf(fp, "gnd\n");
		for (i = 0; i < board.rows; i++) {
			fprintf(fp, "%i", board.gnd[i][0]);
			for (j = 1; j < board.cols; j++) {
				fprintf(fp, ",%i", board.gnd[i][j]);
			}
			fprintf(fp, "\n");
		}
		fprintf(fp, "usr\n");
		for (i = 0; i < board.rows; i++) {
			fprintf(fp, "%i", board.usr[i][0]);
			for (j = 1; j < board.cols; j++) {
				fprintf(fp, ",%i", board.usr[i][j]);
			}
			fprintf(fp, "\n");
		}
		fprintf(fp, "flags %i\n", board.flags);
		fprintf(fp, "cleared %i\n", board.cleared);

		fclose(fp);
		err =	ERR_OK;
	} else {
		err =	ERR_FILENAME;
	}

	return	err;
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
