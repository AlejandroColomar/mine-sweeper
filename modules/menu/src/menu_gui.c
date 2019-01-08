/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
/* Standard C ----------------------------------------------------------------*/
	#include <gtk/gtk.h>
	#include <math.h>
	#include <stdbool.h>
	#include <stdio.h>
	#include <stdlib.h>
/* libalx --------------------------------------------------------------------*/
	#include "libalx/alx_input.h"
/* Project -------------------------------------------------------------------*/
	#include "about.h"
	#include "game_iface.h"
	#include "save.h"
	#include "score.h"
	#include "start.h"
	#include "menu_iface.h"

	#include "menu_gui.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
	# define	LINE_SIZE	(80)
	# define	BUFF_SIZE_TEXT	(1048576)


/******************************************************************************
 ******* structs **************************************************************
 ******************************************************************************/
struct	Button_Data {
	GtkWidget	*ptr;
	char		text [LINE_SIZE];
	int		num;
	int		*sw;
};

struct	Label_Data {
	GtkWidget	*ptr;
	char		text [LINE_SIZE];
};

struct	Entry_dbl_Data {
	GtkWidget		*ptr;
	struct Label_Data	lbl;
	double			*num;
	double			min;
	double			def;
	double			max;
};

struct	Entry_int_Data {
	GtkWidget		*ptr;
	struct Label_Data	lbl;
	int			*num;
	double			min;
	int64_t			def;
	double			max;
};

struct	Entry_fname_Data {
	GtkWidget		*ptr;
	struct Label_Data	lbl;
	const char		*fpath;
	char			*fname;
};


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Global	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
	GtkWidget	*window_gui;

/*	*	*	*	*	*	*	*	*	*
 *	*	* Static	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	GtkWidget	*box;


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
	/* Init & cleanup */
static	gboolean	delete_window		(GtkWidget	*widget,
						GdkEvent	*event,
						void		*data);
static	void		destroy_window		(GtkWidget	*widget,
						void		*data);
	/* Selection */
static	void		callback_button		(GtkWidget	*widget,
						void		*data);
	/* Entries */
static	void		callback_entry_dbl	(GtkWidget	*widget,
						void		*data);
static	void		callback_entry_int	(GtkWidget	*widget,
						void		*data);
	/* Text */
static	void		menu_gui_disclaim	(void);
static	void		menu_gui_license	(void);
static	void		menu_gui_hiscores	(void);
	/* Submenus */
static	void		menu_gui_continue	(void);
static	void		menu_gui_select		(void);
static	void		menu_gui_level		(void);
static	void		menu_gui_custom		(void);
static	void		menu_gui_devel		(void);
#if 0
static	void		menu_gui_verbose	(void);
#endif


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	menu_gui_init		(void)
{
	char		title [LINE_SIZE];

	window_gui	= gtk_window_new(GTK_WINDOW_TOPLEVEL);

	g_signal_connect(window_gui, "delete-event", G_CALLBACK(delete_window), NULL);
	g_signal_connect(window_gui, "destroy", G_CALLBACK(destroy_window), NULL);

	/* Title.  PROG_VERSION defined in Makefile */
	(void)snprintf(title, LINE_SIZE, "mine-sweeper %s", PROG_VERSION);
	gtk_window_set_title(GTK_WINDOW(window_gui), title);
	gtk_container_set_border_width(GTK_CONTAINER(window_gui), 20);
}

void	menu_gui_cleanup	(void)
{

	gtk_widget_destroy(window_gui);
}

void	menu_gui		(void)
{
	bool			wh;
	int			sw;
	GtkWidget		*separator[3];
	struct Label_Data	label;
	struct Button_Data	button [4];

	/* Text */
	(void)snprintf(label.text, LINE_SIZE, "Main menu");
	(void)snprintf(button[1].text, LINE_SIZE, "[_1] Continue");
	(void)snprintf(button[2].text, LINE_SIZE, "[_2] Disclaimer of warranty");
	(void)snprintf(button[3].text, LINE_SIZE, "[_3] Terms and conditions");
	(void)snprintf(button[0].text, LINE_SIZE, "[_0] Exit program");

	/* Data */
	button[1].num	= 1;
	button[2].num	= 2;
	button[3].num	= 3;
	button[0].num	= 0;
	button[1].sw	= &sw;
	button[2].sw	= &sw;
	button[3].sw	= &sw;
	button[0].sw	= &sw;

	/* Menu loop */
	wh	= true;
	while (wh) {

		/* Generate widgets */
		box		= gtk_vbox_new(false, 0);
		label.ptr	= gtk_label_new(label.text);
		separator[0]	= gtk_hseparator_new();
		button[1].ptr	= gtk_button_new_with_mnemonic(button[1].text);
		separator[1]	= gtk_hseparator_new();
		button[2].ptr	= gtk_button_new_with_mnemonic(button[2].text);
		button[3].ptr	= gtk_button_new_with_mnemonic(button[3].text);
		separator[2]	= gtk_hseparator_new();
		button[0].ptr	= gtk_button_new_with_mnemonic(button[0].text);

		/* Events */
		g_signal_connect(button[1].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[1]);
		g_signal_connect(button[2].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[2]);
		g_signal_connect(button[3].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[3]);
		g_signal_connect(button[0].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[0]);

		/* Container */
		gtk_container_add(GTK_CONTAINER(window_gui), box);

		/* Box */
		gtk_box_pack_start(GTK_BOX(box), label.ptr, false, false, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[0], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), button[1].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[1], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), button[2].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), button[3].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[2], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), button[0].ptr, true, true, 0);

		/* Refresh */
		gtk_widget_show_all(window_gui);

		/* GTK loop */
		sw	= -1;
		gtk_main();

		/* Clear window */
		gtk_widget_destroy(box);

		/* Selection */
		switch (sw) {
		case 0:
			wh	= false;
			break;
		case 1:
			menu_gui_continue();
			break;
		case 2:
			menu_gui_disclaim();
			break;
		case 3:
			menu_gui_license();
			break;
		}
	}
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	Cleanup	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	gboolean	delete_window	(GtkWidget	*widget,
					GdkEvent	*event,
					void		*data)
{

	gtk_main_quit();

	/* false: send destroy signal */
	return	false;
}

static	void		destroy_window	(GtkWidget	*widget,
					void		*data)
{

	exit(EXIT_SUCCESS);
}

/*	*	*	*	*	*	*	*	*	*
 *	*	Selection	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void		callback_button		(GtkWidget	*widget,
						void		*data)
{
	struct Button_Data	*button;

	button	= ((struct Button_Data *)data);

	*(button->sw)	= button->num;

	gtk_main_quit();
}

/*	*	*	*	*	*	*	*	*	*
 *	*	Entries	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void		callback_entry_dbl	(GtkWidget	*widget,
						void		*data)
{
	struct Entry_dbl_Data	*entry;
	const char		*str;
	int			err;
	char			buff [LINE_SIZE];

	entry	= ((struct Entry_dbl_Data *)data);

	str	= gtk_entry_get_text(GTK_ENTRY(entry->ptr));
	err	= alx_sscan_dbl(entry->num, entry->min, entry->def, entry->max, str);

	if (err) {
		(void)snprintf(buff, LINE_SIZE, "Error %i", err);
		gtk_entry_set_text(GTK_ENTRY(entry->ptr), buff);
		gtk_editable_select_region(GTK_EDITABLE(entry->ptr),
					0, GTK_ENTRY(entry->ptr)->text_length);
	}

	gtk_main_quit();
}

static	void		callback_entry_int	(GtkWidget	*widget,
						void		*data)
{
	struct Entry_int_Data	*entry;
	const char		*str;
	int			err;
	int64_t			Z;
	char			buff [LINE_SIZE];

	entry	= ((struct Entry_int_Data *)data);

	str	= gtk_entry_get_text(GTK_ENTRY(entry->ptr));
	err	= alx_sscan_i64(&Z, entry->min, entry->def, entry->max, str);

	if (err) {
		(void)snprintf(buff, LINE_SIZE, "Error %i", err);
		gtk_entry_set_text(GTK_ENTRY(entry->ptr), buff);
		gtk_editable_select_region(GTK_EDITABLE(entry->ptr),
					0, GTK_ENTRY(entry->ptr)->text_length);
	} else {
		*(entry->num)	= Z;
	}

	gtk_main_quit();
}

static	void		callback_entry_fname	(GtkWidget	*widget,
						void		*data)
{
	struct Entry_fname_Data	*entry;
	const char		*str;
	int			err;
	char			buff [LINE_SIZE];

	entry	= ((struct Entry_fname_Data *)data);

	str	= gtk_entry_get_text(GTK_ENTRY(entry->ptr));
	err	= alx_sscan_fname(entry->fpath, entry->fname, true, str);

	if (err) {
		snprintf(buff, LINE_SIZE, "Error %i", err);
		gtk_entry_set_text(GTK_ENTRY(entry->ptr), buff);
		gtk_editable_select_region(GTK_EDITABLE(entry->ptr),
					0, GTK_ENTRY(entry->ptr)->text_length);
	}

	gtk_main_quit();
}

/*	*	*	*	*	*	*	*	*	*
 *	*	Text	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	menu_gui_disclaim	(void)
{
	int			sw;
	GtkWidget		*separator[2];
	struct Label_Data	label;
	struct Button_Data	button [1];
	GtkWidget		*label_file;
	char			label_file_txt [BUFF_SIZE_TEXT];

	/* Text */
	(void)snprintf(label.text, LINE_SIZE, "Disclaimer of warranty");
	snprint_share_file(label_file_txt, BUFF_SIZE_TEXT, SHARE_DISCLAIMER);
	(void)snprintf(button[0].text, LINE_SIZE, "[_0] Back");

	/* Data */
	button[0].num	= 0;
	button[0].sw	= &sw;

	/* Generate widgets */
	box		= gtk_vbox_new(false, 0);
	label.ptr	= gtk_label_new(label.text);
	separator[0]	= gtk_hseparator_new();
	label_file	= gtk_label_new(label_file_txt);
	separator[1]	= gtk_hseparator_new();
	button[0].ptr	= gtk_button_new_with_mnemonic(button[0].text);

	/* Events */
	g_signal_connect(button[0].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[0]);

	/* Container */
	gtk_container_add(GTK_CONTAINER(window_gui), box);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box), label.ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[0], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), label_file, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[1], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), button[0].ptr, true, true, 0);

	/* Refresh */
	gtk_widget_show_all(window_gui);

	/* GTK loop */
	gtk_main();

	/* Clear window */
	gtk_widget_destroy(box);
}

static	void	menu_gui_license	(void)
{
	int			sw;
	GtkWidget		*separator[2];
	struct Label_Data	label;
	struct Button_Data	button [1];
	GtkWidget		*label_file;
	char			label_file_txt [BUFF_SIZE_TEXT];

	/* Text */
	(void)snprintf(label.text, LINE_SIZE, "Terms and conditions");
	snprint_share_file(label_file_txt, BUFF_SIZE_TEXT, SHARE_LICENSE);
	(void)snprintf(button[0].text, LINE_SIZE, "[_0] Back");

	/* Data */
	button[0].num	= 0;
	button[0].sw	= &sw;

	/* Generate widgets */
	box		= gtk_vbox_new(false, 0);
	label.ptr	= gtk_label_new(label.text);
	separator[0]	= gtk_hseparator_new();
	label_file	= gtk_label_new(label_file_txt);
	separator[1]	= gtk_hseparator_new();
	button[0].ptr	= gtk_button_new_with_mnemonic(button[0].text);

	/* Events */
	g_signal_connect(button[0].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[0]);

	/* Container */
	gtk_container_add(GTK_CONTAINER(window_gui), box);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box), label.ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[0], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), label_file, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[1], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), button[0].ptr, true, true, 0);

	/* Refresh */
	gtk_widget_show_all(window_gui);

	/* GTK loop */
	gtk_main();

	/* Clear window */
	gtk_widget_destroy(box);
}

static	void	menu_gui_hiscores	(void)
{
	int			sw;
	GtkWidget		*separator[2];
	struct Label_Data	label;
	struct Button_Data	button [1];
	GtkWidget		*label_file;
	char			label_file_txt [BUFF_SIZE_TEXT];

	/* Text */
	(void)snprintf(label.text, LINE_SIZE, "Hi scores");
	snprint_scores(label_file_txt, BUFF_SIZE_TEXT);
	(void)snprintf(button[0].text, LINE_SIZE, "[_0] Back");

	/* Data */
	button[0].num	= 0;
	button[0].sw	= &sw;

	/* Generate widgets */
	box		= gtk_vbox_new(false, 0);
	label.ptr	= gtk_label_new(label.text);
	separator[0]	= gtk_hseparator_new();
	label_file	= gtk_label_new(label_file_txt);
	separator[1]	= gtk_hseparator_new();
	button[0].ptr	= gtk_button_new_with_mnemonic(button[0].text);

	/* Events */
	g_signal_connect(button[0].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[0]);

	/* Container */
	gtk_container_add(GTK_CONTAINER(window_gui), box);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box), label.ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[0], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), label_file, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[1], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), button[0].ptr, true, true, 0);

	/* Refresh */
	gtk_widget_show_all(window_gui);

	/* GTK loop */
	gtk_main();

	/* Clear window */
	gtk_widget_destroy(box);
}

/*	*	*	*	*	*	*	*	*	*
 *	*	Submenus	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	menu_gui_continue	(void)
{
	bool			wh;
	int			sw;
	GtkWidget		*separator[4];
	struct Label_Data	label;
	struct Button_Data	button [6];
	struct Entry_fname_Data	entry_fname[1];

	/* Text */
	(void)snprintf(label.text, LINE_SIZE, "Game menu");
	(void)snprintf(button[1].text, LINE_SIZE, "[_1] Start");
	(void)snprintf(button[2].text, LINE_SIZE, "[_2] Select map");
	(void)snprintf(button[3].text, LINE_SIZE, "[_3] Change difficulty");
	(void)snprintf(button[4].text, LINE_SIZE, "[_4] Hi scores");
	(void)snprintf(button[5].text, LINE_SIZE, "[_5] DEVEL");
	(void)snprintf(button[0].text, LINE_SIZE, "[_0] Back");

	/* Data */
	button[1].num		= 1;
	button[2].num		= 2;
	button[3].num		= 3;
	button[4].num		= 4;
	button[5].num		= 5;
	button[0].num		= 0;
	button[1].sw		= &sw;
	button[2].sw		= &sw;
	button[3].sw		= &sw;
	entry_fname[0].fpath	= saved_path;
	entry_fname[0].fname	= saved_name;
	button[4].sw		= &sw;
	button[5].sw		= &sw;
	button[0].sw		= &sw;

	/* Menu loop */
	wh	= true;
	while (wh) {
		/* Text */
		(void)snprintf(entry_fname[0].lbl.text, LINE_SIZE,
				"Change file name (File: \"%s\")", saved_name);

		/* Generate widgets */
		box			= gtk_vbox_new(false, 0);
		label.ptr		= gtk_label_new(label.text);
		separator[0]		= gtk_hseparator_new();
		button[1].ptr		= gtk_button_new_with_mnemonic(button[1].text);
		separator[1]		= gtk_hseparator_new();
		button[2].ptr		= gtk_button_new_with_mnemonic(button[2].text);
		button[3].ptr		= gtk_button_new_with_mnemonic(button[3].text);
		entry_fname[0].lbl.ptr	= gtk_label_new(entry_fname[0].lbl.text);
		entry_fname[0].ptr	= gtk_entry_new();
		button[4].ptr		= gtk_button_new_with_mnemonic(button[4].text);
		separator[2]		= gtk_hseparator_new();
		button[5].ptr		= gtk_button_new_with_mnemonic(button[5].text);
		separator[3]		= gtk_hseparator_new();
		button[0].ptr		= gtk_button_new_with_mnemonic(button[0].text);

		/* Events */
		g_signal_connect(button[1].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[1]);
		g_signal_connect(button[2].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[2]);
		g_signal_connect(button[3].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[3]);
		g_signal_connect(entry_fname[0].ptr, "activate",
				G_CALLBACK(callback_entry_fname), (void *)&entry_fname[0]);
		g_signal_connect(button[4].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[4]);
		g_signal_connect(button[5].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[5]);
		g_signal_connect(button[0].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[0]);

		/* Container */
		gtk_container_add(GTK_CONTAINER(window_gui), box);

		/* Box */
		gtk_box_pack_start(GTK_BOX(box), label.ptr, false, false, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[0], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), button[1].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[1], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), button[2].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), button[3].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), entry_fname[0].lbl.ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), entry_fname[0].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), button[4].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[2], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), button[5].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[3], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), button[0].ptr, true, true, 0);

		/* Refresh */
		gtk_widget_show_all(window_gui);

		/* GTK loop */
		sw	= -1;
		gtk_main();

		/* Clear window */
		gtk_widget_destroy(box);

		/* Selection */
		switch (sw) {
		case 0:
			wh	= false;
			break;
		case 1:
			start_switch();
			break;
		case 2:
			menu_gui_select();
			break;
		case 3:
			menu_gui_level();
			break;
		case 4:
			menu_gui_hiscores();
			break;
		case 5:
			menu_gui_devel();
			break;
		}
	}
}

static	void	menu_gui_select	(void)
{
	int			sw;
	GtkWidget		*separator[3];
	struct Label_Data	label;
	struct Button_Data	button [3];

	/* Text */
	(void)snprintf(label.text, LINE_SIZE, "Select map");
	(void)snprintf(button[1].text, LINE_SIZE, "[_1] New map");
	(void)snprintf(button[2].text, LINE_SIZE, "[_2] Load map (File: \"%s\")",
								saved_name);
	(void)snprintf(button[0].text, LINE_SIZE, "[_0] Back");

	/* Data */
	button[1].num	= 1;
	button[2].num	= 2;
	button[0].num	= 0;
	button[1].sw	= &sw;
	button[2].sw	= &sw;
	button[0].sw	= &sw;

	/* Generate widgets */
	box		= gtk_vbox_new(false, 0);
	label.ptr	= gtk_label_new(label.text);
	separator[0]	= gtk_hseparator_new();
	button[1].ptr	= gtk_button_new_with_mnemonic(button[1].text);
	separator[1]	= gtk_hseparator_new();
	button[2].ptr	= gtk_button_new_with_mnemonic(button[2].text);
	separator[2]	= gtk_hseparator_new();
	button[0].ptr	= gtk_button_new_with_mnemonic(button[0].text);

	/* Events */
	g_signal_connect(button[1].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[1]);
	g_signal_connect(button[2].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[2]);
	g_signal_connect(button[0].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[0]);

	/* Container */
	gtk_container_add(GTK_CONTAINER(window_gui), box);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box), label.ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[0], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), button[1].ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[1], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), button[2].ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[2], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), button[0].ptr, true, true, 0);

	/* Refresh */
	gtk_widget_show_all(window_gui);

	/* GTK loop */
	sw	= -1;
	gtk_main();

	/* Clear window */
	gtk_widget_destroy(box);

	/* Selection */
	switch (sw) {
	case 0:
		break;
	case 1:
		start_mode =	START_RAND;
		break;
	case 2:
		start_mode =	START_LOAD;
		break;
	}
}

static	void	menu_gui_level	(void)
{
	int			sw;
	GtkWidget		*separator[3];
	struct Label_Data	label;
	struct Button_Data	button [5];

	/* Text */
	(void)snprintf(label.text, LINE_SIZE, "Select level");
	(void)snprintf(button[1].text, LINE_SIZE, "[_1] Beginner");
	(void)snprintf(button[2].text, LINE_SIZE, "[_2] Intermediate");
	(void)snprintf(button[3].text, LINE_SIZE, "[_3] Expert");
	(void)snprintf(button[4].text, LINE_SIZE, "[_4] Custom");
	(void)snprintf(button[0].text, LINE_SIZE, "[_0] Back");

	/* Data */
	button[1].num	= 1;
	button[2].num	= 2;
	button[3].num	= 3;
	button[4].num	= 4;
	button[0].num	= 0;
	button[1].sw	= &sw;
	button[2].sw	= &sw;
	button[3].sw	= &sw;
	button[4].sw	= &sw;
	button[0].sw	= &sw;

	/* Generate widgets */
	box		= gtk_vbox_new(false, 0);
	label.ptr	= gtk_label_new(label.text);
	separator[0]	= gtk_hseparator_new();
	button[1].ptr	= gtk_button_new_with_mnemonic(button[1].text);
	button[2].ptr	= gtk_button_new_with_mnemonic(button[2].text);
	button[3].ptr	= gtk_button_new_with_mnemonic(button[3].text);
	separator[1]	= gtk_hseparator_new();
	button[4].ptr	= gtk_button_new_with_mnemonic(button[4].text);
	separator[2]	= gtk_hseparator_new();
	button[0].ptr	= gtk_button_new_with_mnemonic(button[0].text);

	/* Events */
	g_signal_connect(button[1].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[1]);
	g_signal_connect(button[2].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[2]);
	g_signal_connect(button[3].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[3]);
	g_signal_connect(button[4].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[4]);
	g_signal_connect(button[0].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[0]);

	/* Container */
	gtk_container_add(GTK_CONTAINER(window_gui), box);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box), label.ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[0], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), button[1].ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box), button[2].ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box), button[3].ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[1], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), button[4].ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box), separator[2], false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), button[0].ptr, true, true, 0);

	/* Refresh */
	gtk_widget_show_all(window_gui);

	/* GTK loop */
	sw	= -1;
	gtk_main();

	/* Clear window */
	gtk_widget_destroy(box);

	/* Selection */
	switch (sw) {
	case 1:
		menu_iface_variables.level	= GAME_IFACE_LEVEL_BEGINNER;
		break;
	case 2:
		menu_iface_variables.level	= GAME_IFACE_LEVEL_INTERMEDIATE;
		break;
	case 3:
		menu_iface_variables.level	= GAME_IFACE_LEVEL_EXPERT;
		break;
	case 4:
		menu_iface_variables.level	= GAME_IFACE_LEVEL_CUSTOM;
		menu_gui_custom();
		break;
	}
}

static	void	menu_gui_custom	(void)
{
	bool			wh;
	int			sw;
	GtkWidget		*separator[3];
	struct Label_Data	label;
	struct Button_Data	button [1];
	struct Entry_int_Data	entry_int[2];
	struct Entry_dbl_Data	entry_dbl[1];

	/* Text */
	(void)snprintf(label.text, LINE_SIZE, "Custom");
	(void)snprintf(button[0].text, LINE_SIZE, "[_0] Back");

	/* Data */
	entry_int[0].num	= &menu_iface_variables.rows;
	entry_int[0].min	= 2;
	entry_int[0].def	= menu_iface_variables.rows;
	entry_int[0].max	= ROWS_GUI_MAX;
	entry_int[1].num	= &menu_iface_variables.cols;
	entry_int[1].min	= 2;
	entry_int[1].def	= menu_iface_variables.cols;
	entry_int[1].max	= COLS_GUI_MAX;
	entry_dbl[0].num	= &menu_iface_variables.p;
	entry_dbl[0].min	= 0;
	entry_dbl[0].def	= menu_iface_variables.p;
	entry_dbl[0].max	= 1;
	button[0].num		= 0;
	button[0].sw		= &sw;

	/* Menu loop */
	wh	= true;
	while (wh) {

		/* Text */
		(void)snprintf(entry_int[0].lbl.text, LINE_SIZE,
				"Change rows: rows\t\t(%i)\n"
				"Introduce an integer number [%i U %i]",
				menu_iface_variables.rows, 2, ROWS_GUI_MAX);
		(void)snprintf(entry_int[1].lbl.text, LINE_SIZE,
				"Change columns: cols\t(%i)\n"
				"Introduce an integer number [%i U %i]",
				menu_iface_variables.cols, 2, COLS_GUI_MAX);
		(void)snprintf(entry_dbl[0].lbl.text, LINE_SIZE,
				"Change proportion of mines: p\t(%lf)\n"
				"Introduce a Real number [%i U %i]",
				menu_iface_variables.p, 0, 1);

		/* Generate widgets */
		box			= gtk_vbox_new(false, 0);
		label.ptr		= gtk_label_new(label.text);
		separator[0]		= gtk_hseparator_new();
		entry_int[0].lbl.ptr	= gtk_label_new(entry_int[0].lbl.text);
		entry_int[0].ptr	= gtk_entry_new();
		entry_int[1].lbl.ptr	= gtk_label_new(entry_int[1].lbl.text);
		entry_int[1].ptr	= gtk_entry_new();
		separator[1]		= gtk_hseparator_new();
		entry_dbl[0].lbl.ptr	= gtk_label_new(entry_dbl[0].lbl.text);
		entry_dbl[0].ptr	= gtk_entry_new();
		separator[2]		= gtk_hseparator_new();
		button[0].ptr		= gtk_button_new_with_mnemonic(button[0].text);

		/* Events */
		g_signal_connect(entry_int[0].ptr, "activate",
				G_CALLBACK(callback_entry_int), (void *)&entry_int[0]);
		g_signal_connect(entry_int[1].ptr, "activate",
				G_CALLBACK(callback_entry_int), (void *)&entry_int[1]);
		g_signal_connect(entry_dbl[0].ptr, "activate",
				G_CALLBACK(callback_entry_dbl), (void *)&entry_dbl[0]);
		g_signal_connect(button[0].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[0]);

		/* Container */
		gtk_container_add(GTK_CONTAINER(window_gui), box);

		/* Box */
		gtk_box_pack_start(GTK_BOX(box), label.ptr, false, false, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[0], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), entry_int[0].lbl.ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), entry_int[0].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), entry_int[1].lbl.ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), entry_int[1].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[1], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), entry_dbl[0].lbl.ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), entry_dbl[0].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[2], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), button[0].ptr, true, true, 0);

		/* Refresh */
		gtk_widget_show_all(window_gui);

		/* GTK loop */
		sw	= -1;
		gtk_main();

		/* Selection */
		switch (sw) {
		case 0:
			wh	= false;
			break;

		default:
			break;
		}

		/* Clear window */
		gtk_widget_destroy(box);
	}
}

static	void	menu_gui_devel	(void)
{
	bool			wh;
	int			sw;
	GtkWidget		*separator[2];
	struct Label_Data	label;
	struct Button_Data	button [1];
	struct Entry_int_Data	entry_int[1];
	int			seed;

	/* Text */
	(void)snprintf(label.text, LINE_SIZE, "DEVELOPER OPTIONS");
	(void)snprintf(entry_int[0].lbl.text, LINE_SIZE, "Change seed (srand)");
	(void)snprintf(button[0].text, LINE_SIZE, "[_0] Back");

	/* Data */
	entry_int[0].num	= &seed;
	entry_int[0].min	= -INFINITY;
	entry_int[0].def	= 1;
	entry_int[0].max	= INFINITY;
	button[0].num	= 0;
	button[0].sw	= &sw;

	/* Text */

	/* Menu loop */
	wh	= true;
	while (wh) {
		/* Generate widgets */
		box			= gtk_vbox_new(false, 0);
		label.ptr		= gtk_label_new(label.text);
		separator[0]		= gtk_hseparator_new();
		entry_int[0].lbl.ptr	= gtk_label_new(entry_int[0].lbl.text);
		entry_int[0].ptr	= gtk_entry_new();
		separator[1]		= gtk_hseparator_new();
		button[0].ptr		= gtk_button_new_with_mnemonic(button[0].text);

		/* Events */
		g_signal_connect(entry_int[0].ptr, "activate",
				G_CALLBACK(callback_entry_int), (void *)&entry_int[0]);
		g_signal_connect(button[0].ptr, "clicked",
				G_CALLBACK(callback_button), (void *)&button[0]);

		/* Container */
		gtk_container_add(GTK_CONTAINER(window_gui), box);

		/* Box */
		gtk_box_pack_start(GTK_BOX(box), label.ptr, false, false, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[0], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), entry_int[0].lbl.ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), entry_int[0].ptr, true, true, 0);
		gtk_box_pack_start(GTK_BOX(box), separator[1], false, false, 5);
		gtk_box_pack_start(GTK_BOX(box), button[0].ptr, true, true, 0);

		/* Refresh */
		gtk_widget_show_all(window_gui);

		/* GTK loop */
		sw	= -1;
		gtk_main();

		/* Selection */
		switch (sw) {
		case 0:
			wh	= false;
			break;
		default:
			srand(seed);
			break;
		}

		/* Clear window */
		gtk_widget_destroy(box);
	}
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
