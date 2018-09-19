/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Standard	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
		/* printf() */
	#include <stdio.h>
		/* strcpy() & strcat() */
	#include <string.h>

/*	*	*	*	*	*	*	*	*	*
 *	*	* Other	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
		/* alx_prn_file() */
	#include "alx_file.h"

	#include "about.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
	# define	BUFF_SIZE_TEXT	(1048576)

#if defined	OS_LINUX
	# define	BEGINNING	"\n┌──────────────────────────────────────────────────────────────────────────────┐\n"
	# define	ENDING		"└──────────────────────────────────────────────────────────────────────────────┘\n\n"
#elif defined	OS_WIN
	# define	BEGINNING	"\n________________________________________________________________________________\n"
	# define	ENDING		"________________________________________________________________________________\n\n"
#endif


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
char	share_path [FILENAME_MAX];


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	about_init		(void)
{
	strcpy(share_path, INSTALL_SHARE_DIR);
	strcat(share_path, "/");
	strcat(share_path, SHARE_DIR);
	strcat(share_path, "/");
}

void	print_cpright		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	strcpy(file_name, share_path);
	strcat(file_name, "/");
	strcat(file_name, "COPYRIGHT.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_disclaim		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	strcpy(file_name, share_path);
	strcat(file_name, "/");
	strcat(file_name, "DISCLAIMER.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_help		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	strcpy(file_name, share_path);
	strcat(file_name, "/");
	strcat(file_name, "HELP.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_license		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	strcpy(file_name, share_path);
	strcat(file_name, "/");
	strcat(file_name, "LICENSE.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_usage		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	strcpy(file_name, share_path);
	strcat(file_name, "/");
	strcat(file_name, "USAGE.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_version		(void)
{
	printf("" PROG_NAME " " PROG_VERSION "\n\n");
}
