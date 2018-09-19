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
	snprintf(share_path, FILENAME_MAX, "%s/%s/", INSTALL_SHARE_DIR, SHARE_DIR);
}

void	print_cpright		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	snprintf(file_name, FILENAME_MAX, "%s/%s", share_path, "COPYRIGHT.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_disclaim		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	snprintf(file_name, FILENAME_MAX, "%s/%s", share_path, "DISCLAIMER.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_help		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	snprintf(file_name, FILENAME_MAX, "%s/%s", share_path, "HELP.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_license		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	snprintf(file_name, FILENAME_MAX, "%s/%s", share_path, "LICENSE.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_usage		(void)
{
	char	file_name [FILENAME_MAX];
	char	str [BUFF_SIZE_TEXT];

	snprintf(file_name, FILENAME_MAX, "%s/%s", share_path, "USAGE.txt");

	alx_snprint_file(str, BUFF_SIZE_TEXT, file_name);

	printf(BEGINNING);
	printf("%s", str);
	printf(ENDING);
}

void	print_version		(void)
{
	printf("" PROG_NAME " " PROG_VERSION "\n\n");
}
