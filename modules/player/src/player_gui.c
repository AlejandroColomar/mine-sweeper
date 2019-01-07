/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
/* Standard C ----------------------------------------------------------------*/
	#include <gtk/gtk.h>
		/* fmod */
	#include <math.h>
		/* true & false */
	#include <stdbool.h>
		/* snprintf() */
	#include <stdio.h>

/* libalx ------------------------------------------------------------------*/
		/* alx_sscan_fname() */
	#include "alx_input.h"

/* Project -------------------------------------------------------------------*/
		/* struct Game_Iface_Out */
	#include "game_iface.h"
		/* window_gui */
	#include "menu_gui.h"

		/* struct Player_Iface_Position */
	#include "player_iface.h"

	#include "player_gui.h"


/******************************************************************************
 ******* macros ***************************************************************
 ******************************************************************************/
	# define	LINE_SIZE		(80)
	# define	REFRESH_TIME_MS		(100)


/******************************************************************************
 ******* enums ****************************************************************
 ******************************************************************************/
	enum	Buttons {
		BTN_CH_OFF = 0,
		BTN_CH_1,
		BTN_CH_2,
		BTN_SAVE,
		BTN_QUIT,
		BTN_QTTY
	};

	enum	TButtons {
		TBTN_PAUSE,
		TBTN_QTTY
	};


/******************************************************************************
 ******* structs **************************************************************
 ******************************************************************************/
	struct	Label_Data {
		GtkWidget	*ptr;
		char	text [LINE_SIZE];
	};

	struct	Field_Data {
		GtkWidget	*ptr;
		char	ch;
		int	r;
		int	c;
		int	*row;
		int	*col;
		int	*act;
	};

	struct	Button_Data {
		GtkWidget	*ptr;
		char	text [LINE_SIZE];
		int	val;
		int	*act;
	};

	struct	TButton_Data {
		GtkWidget	*ptr;
		char	text [LINE_SIZE];
		char	text2 [LINE_SIZE];
		int	val;
		int	val2;
		int	*act;
	};

	struct	Entry_fname_Data {
		GtkWidget		*ptr;
		struct Label_Data	lbl;
		const char	*fpath;
		char		*fname;
	};

	struct	Entry_str_Data {
		GtkWidget		*ptr;
		struct Label_Data	lbl;
		char	*str;
		int	strsize;
	};

	struct	PBar_Data {
		GtkWidget	*ptr;
		double	frac;
		char	text [LINE_SIZE];
	};

	struct	EBox_Data {
		GtkWidget	*ptr;
		int	val;
		int	*act;
	};

	struct	Timeout_Data {
		int	id;
		int	val;
		int	*act;
	};


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
static	GtkWidget		*box;
static	GtkWidget		*box_help;
static	GtkWidget		*box_help_in;
static	struct Button_Data	button [BTN_QTTY];
static	struct TButton_Data	tbutton [TBTN_QTTY];
static	struct Entry_str_Data	entry_name;
static	struct Entry_fname_Data	entry_fname;
static	GtkWidget		*box_board;
static	GtkWidget		*box_board_in;
static	struct	PBar_Data	pbar_board_tit;
//	static	GtkWidget	*box_board_tit;
static	GtkWidget		*box_board_tab;
static	GtkWidget		*table_board;
static	struct Field_Data	field [ROWS_GUI_MAX] [COLS_GUI_MAX];
static	struct EBox_Data	ebox_cheat;
//	static	GtkWidget	*box_board_stit;
static	struct Label_Data	label_stit;
static	int			last_help;
static	struct Timeout_Data	timeout;

static	int			state;


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
	/* Start */
static	void	board_init	(const struct Player_Iface_Position  *pos,
				int *action);
static	void	show_board_start(const struct Player_Iface_Position  *pos,
				const char *title, const char *subtitle);

static	void	board_loop_start(const struct Player_Iface_Position  *pos);

	/* Play */
static	void	show_board	(const struct Game_Iface_Out	*board,
				const char *title, const char *subtitle);

static	void	board_loop	(const struct Game_Iface_Out	*board);

static	char	set_char	(int game_iface_visible);
static	void	show_char	(const struct Field_Data  *field);
	/* Help */
static	void	help_init		(int *action);
static	void	show_help		(const struct Game_Iface_Out  *board);
static	void	show_help_start		(void);
static	void	show_help_play		(void);
static	void	show_help_pause		(void);
static	void	show_help_xyzzy		(void);
static	void	show_help_cheat		(void);
static	void	show_help_safe		(void);
static	void	show_help_gameover	(void);
	/* Input */
static	gboolean	callback_field		(GtkWidget *widget,
						GdkEventButton *event,
						void *data);
static	gboolean	callback_ebox		(GtkWidget *widget,
						GdkEventButton *event,
						void *data);
static	void		callback_button		(GtkWidget *widget, void *data);
static	gboolean	callback_tbutton	(GtkWidget *widget, void *data);
static	void		callback_entry_fname	(GtkWidget *widget, void *data);
static	void		callback_entry_str	(GtkWidget *widget, void *data);
static	gboolean	callback_timeout	(void *data);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	player_gui_init		(struct Player_Iface_Position	*pos,
				int *action)
{
	int	i;
	int	j;

	box		= gtk_hbox_new(false, 0);
	gtk_container_add(GTK_CONTAINER(window_gui), box);

	/* Structure */
	GtkWidget	*separator;
	box_help	= gtk_vbox_new(true, 0);
	separator	= gtk_vseparator_new();
	box_board	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box), box_help, false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), separator, false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), box_board, true, true, 5);

	help_init(action);
	board_init(pos, action);

	/* Board fields */
	for (i = 0; i < pos->rows; i++) {
		for (j = 0; j < pos->cols; j++) {
			field[i][j].r	= i;
			field[i][j].c	= j;
			field[i][j].row	= &(pos->row);
			field[i][j].col	= &(pos->col);
			field[i][j].act	= action;
			field[i][j].ptr	= gtk_button_new_with_label("NEW");
			g_signal_connect(field[i][j].ptr, "button-press-event",
					G_CALLBACK(callback_field), (void *)&field[i][j]);
			gtk_table_attach_defaults(GTK_TABLE(table_board), field[i][j].ptr,
					field[i][j].c, field[i][j].c + 1,
					field[i][j].r, field[i][j].r + 1);
		}
	}

	/* Refresh */
	gtk_widget_show_all(window_gui);
}

int	player_gui_start	(const struct Player_Iface_Position  *pos,
				const char *title, const char *subtitle)
{

	show_help_start();
	show_board_start(pos, title, subtitle);

	/* Refresh */
	gtk_widget_show(box);
	gtk_widget_show(window_gui);

	gtk_main();

	return	0;
}

int	player_gui		(const struct Game_Iface_Out  *board,
				const struct Player_Iface_Position  *pos,
				const char *title, const char *subtitle)
{

	state	= board->state;

	show_help(board);
	show_board(board, title, subtitle);

	/* Refresh */
	gtk_widget_show(box);
	gtk_widget_show(window_gui);

	gtk_main();

	return	0;
}

void	player_gui_save_name	(const char *fpath, char *fname, int destsize)
{

	entry_fname.fpath	= fpath;
	entry_fname.fname	= fname;

	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_hide(tbutton[TBTN_PAUSE].ptr);
	gtk_widget_hide(button[BTN_SAVE].ptr);
	gtk_widget_show(entry_fname.lbl.ptr);
	gtk_widget_show(entry_fname.ptr);
	gtk_widget_hide(button[BTN_QUIT].ptr);

	gtk_widget_hide(box_board);

	gtk_main();

	gtk_widget_show(box_board);

	gtk_widget_hide(entry_fname.lbl.ptr);
	gtk_widget_hide(entry_fname.ptr);

	/* Update last_help */
	last_help	= GAME_IFACE_STATE_FOO;
}

void	player_gui_score_name	(char *player_name, int destsize)
{

	entry_name.str		= player_name;
	entry_name.strsize	= destsize;

	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_hide(tbutton[TBTN_PAUSE].ptr);
	gtk_widget_hide(button[BTN_SAVE].ptr);
	gtk_widget_show(entry_name.lbl.ptr);
	gtk_widget_show(entry_name.ptr);
	gtk_widget_hide(button[BTN_QUIT].ptr);

	gtk_widget_hide(box_board);

	gtk_main();

	gtk_widget_show(box_board);

	gtk_widget_hide(entry_name.lbl.ptr);
	gtk_widget_hide(entry_name.ptr);

	/* Update last_help */
	last_help	= GAME_IFACE_STATE_FOO;
}

void	player_gui_cleanup	(void)
{

	gtk_widget_destroy(box);
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Start	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	board_init	(const struct Player_Iface_Position	*pos,
				int *action)
{
	GtkWidget	*separator[2];

	/* Box */
	box_board_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board), box_board_in, true, true, 5);

	/* Title (with progress bar) */
	pbar_board_tit.ptr	= gtk_progress_bar_new();
//	box_board_tit		= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_in), pbar_board_tit.ptr, false, false, 0);
//	gtk_box_pack_start(GTK_BOX(box_board_in), box_board_tit, false, false, 0);
	gtk_progress_bar_set_text(GTK_PROGRESS_BAR(pbar_board_tit.ptr), "NEW");
//	gtk_box_pack_start(GTK_BOX(box_board_tit), label[0].ptr, false, false, 0);

	/* Pogress bar */
	gtk_progress_bar_set_orientation(GTK_PROGRESS_BAR(pbar_board_tit.ptr), GTK_PROGRESS_LEFT_TO_RIGHT);

	/* Separator */
	separator[0]	= gtk_hseparator_new();
	gtk_box_pack_start(GTK_BOX(box_board_in), separator[0], false, false, 5);

	/* Board */
	box_board_tab	= gtk_vbox_new(true, 0);
	gtk_box_pack_start(GTK_BOX(box_board_in), box_board_tab, true, true, 0);
	table_board	= gtk_table_new(pos->rows, pos->cols, true);
	gtk_box_pack_start(GTK_BOX(box_board_tab), table_board, true, true, 5);

	/* Separator */
	separator[1]	= gtk_hseparator_new();
	gtk_box_pack_start(GTK_BOX(box_board_in), separator[1], false, false, 5);

	/* Subtitle (with cheats) */
	ebox_cheat.ptr	= gtk_event_box_new();
//	box_board_stit	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_in), ebox_cheat.ptr, false, false, 0);
//	gtk_box_pack_start(GTK_BOX(box_board_in), box_board_stit, false, false, 0);
	label_stit.ptr	= gtk_label_new("NEW");
	gtk_container_add(GTK_CONTAINER(ebox_cheat.ptr), label_stit.ptr);
//	gtk_box_pack_start(GTK_BOX(box_board_stit), label_stit.ptr, false, false, 0);

	/* Cheats */
	ebox_cheat.val	= PLAYER_IFACE_ACT_XYZZY_ON;
	ebox_cheat.act	= action;
	g_signal_connect(ebox_cheat.ptr, "button-press-event",
				G_CALLBACK(callback_ebox), (void *)&ebox_cheat);

	/* Timeout */
	timeout.val	= PLAYER_IFACE_ACT_FOO;
	timeout.act	= action;
	timeout.id	= 0;

	/* Refresh */
	gtk_widget_show_all(box_board);
}

static	void	show_board_start(const struct Player_Iface_Position  *pos,
				const char *title, const char *subtitle)
{

	/* Title */
	snprintf(pbar_board_tit.text, LINE_SIZE, title);
	gtk_progress_bar_set_text(GTK_PROGRESS_BAR(pbar_board_tit.ptr), pbar_board_tit.text);

	/* Progress bar */
	pbar_board_tit.frac	= 0;
	gtk_progress_bar_set_fraction(GTK_PROGRESS_BAR(pbar_board_tit.ptr), pbar_board_tit.frac);

	/* Board */
	board_loop_start(pos);

	/* Subtitle */
	snprintf(label_stit.text, LINE_SIZE, subtitle);
	gtk_label_set_text(GTK_LABEL(label_stit.ptr), label_stit.text);

	/* Refresh */
	gtk_widget_show_all(box_board);
}

static	void	board_loop_start(const struct Player_Iface_Position  *pos)
{
	int	i;
	int	j;
	char	c;

	c	= PLAYER_GUI_CHAR_HIDDEN_FIELD;

	for (i = 0; i < pos->rows; i++) {
		for (j = 0; j < pos->cols; j++) {
			field[i][j].ch	= c;
			show_char(&field[i][j]);
		}
	}
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Play	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	show_board	(const struct Game_Iface_Out  *board,
				const char *title, const char *subtitle)
{
	/* Title */
	snprintf(pbar_board_tit.text, LINE_SIZE, title);
	gtk_progress_bar_set_text(GTK_PROGRESS_BAR(pbar_board_tit.ptr), pbar_board_tit.text);

	/* Progress bar */
	if (board->flags % board->mines) {
		/* This is a trick to have (frac <= 1) instead of (frac < 1) */
		pbar_board_tit.frac	= ((double)board->flags) / ((double)board->mines);
		pbar_board_tit.frac	= fmod(pbar_board_tit.frac, 1);
	} else if (board->flags) {
		pbar_board_tit.frac	= 1;
	} else {
		pbar_board_tit.frac	= 0;
	}
	gtk_progress_bar_set_fraction(GTK_PROGRESS_BAR(pbar_board_tit.ptr), pbar_board_tit.frac);

	/* Board */
	board_loop(board);

	/* Subtitle */
	snprintf(label_stit.text, LINE_SIZE, subtitle);
	gtk_label_set_text(GTK_LABEL(label_stit.ptr), label_stit.text);

	/* Timeout */
	if (board->state == GAME_IFACE_STATE_PLAYING) {
		timeout.id	= g_timeout_add_seconds(1, callback_timeout, (void *)&timeout);
	}

	/* Refresh */
	gtk_widget_show_all(box_board);
}

static	void	board_loop	(const struct Game_Iface_Out  *board)
{
	int	i;
	int	j;

	for (i = 0; i < board->rows; i++) {
		for (j = 0; j < board->cols; j++) {
			field[i][j].ch	= set_char(board->visible[i][j]);
			show_char(&field[i][j]);
		}
	}
}

static	char	set_char	(int game_iface_visible)
{
	char	c;

	switch (game_iface_visible) {
	case GAME_IFACE_VIS_KBOOM:
		c =	PLAYER_GUI_CHAR_KBOOM;
		break;
	case GAME_IFACE_VIS_HIDDEN_FIELD:
		c =	PLAYER_GUI_CHAR_HIDDEN_FIELD;
		break;
	case GAME_IFACE_VIS_HIDDEN_MINE:
		c =	PLAYER_GUI_CHAR_HIDDEN_MINE;
		break;
	case GAME_IFACE_VIS_HIDDEN_SAFE:
		c =	PLAYER_GUI_CHAR_HIDDEN_SAFE;
		break;
	case GAME_IFACE_VIS_SAFE_MINE:
		c =	PLAYER_GUI_CHAR_SAFE_MINE;
		break;
	case GAME_IFACE_VIS_0:
		c =	PLAYER_GUI_CHAR_0;
		break;
	case GAME_IFACE_VIS_1:
		c =	PLAYER_GUI_CHAR_1;
		break;
	case GAME_IFACE_VIS_2:
		c =	PLAYER_GUI_CHAR_2;
		break;
	case GAME_IFACE_VIS_3:
		c =	PLAYER_GUI_CHAR_3;
		break;
	case GAME_IFACE_VIS_4:
		c =	PLAYER_GUI_CHAR_4;
		break;
	case GAME_IFACE_VIS_5:
		c =	PLAYER_GUI_CHAR_5;
		break;
	case GAME_IFACE_VIS_6:
		c =	PLAYER_GUI_CHAR_6;
		break;
	case GAME_IFACE_VIS_7:
		c =	PLAYER_GUI_CHAR_7;
		break;
	case GAME_IFACE_VIS_8:
		c =	PLAYER_GUI_CHAR_8;
		break;
	case GAME_IFACE_VIS_FLAG:
		c =	PLAYER_GUI_CHAR_FLAG;
		break;
	case GAME_IFACE_VIS_FLAG_FALSE:
		c =	PLAYER_GUI_CHAR_FLAG_FALSE;
		break;
	case GAME_IFACE_VIS_POSSIBLE:
		c =	PLAYER_GUI_CHAR_POSSIBLE;
		break;
	case GAME_IFACE_VIS_POSSIBLE_FALSE:
		c =	PLAYER_GUI_CHAR_POSSIBLE_FALSE;
		break;
	default:
		c	= PLAYER_GUI_CHAR_ERROR;
		break;
	}

	return	c;
}

static	void	show_char	(const struct Field_Data *field)
{
	char	text [2];

	sprintf(text, "%c", field->ch);
	gtk_button_set_label(GTK_BUTTON(field->ptr), text);
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Help	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	help_init		(int *action)
{

	/* Box */
	box_help_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_help), box_help_in, false, false, 5);

	/* Text */
	snprintf(button[BTN_CH_OFF].text, LINE_SIZE, "[_0] Cheats off");
	snprintf(button[BTN_CH_1].text, LINE_SIZE, "Cheat _1");
	snprintf(button[BTN_CH_2].text, LINE_SIZE, "Cheat _2");
	snprintf(tbutton[TBTN_PAUSE].text, LINE_SIZE, "_Pause");
	snprintf(tbutton[TBTN_PAUSE].text2, LINE_SIZE, "[_P] Continue");
	snprintf(button[BTN_SAVE].text, LINE_SIZE, "_Save");
	snprintf(entry_fname.lbl.text, LINE_SIZE, "File name:");
	snprintf(entry_name.lbl.text, LINE_SIZE, "Your name:");
	snprintf(button[BTN_QUIT].text, LINE_SIZE, "_Quit");

	/* Data */
		/* L click */
	button[BTN_CH_OFF].val	= PLAYER_IFACE_ACT_XYZZY_OFF;
	button[BTN_CH_1].val	= PLAYER_IFACE_ACT_XYZZY_LIN;
	button[BTN_CH_2].val	= PLAYER_IFACE_ACT_XYZZY_P;
	tbutton[TBTN_PAUSE].val	= PLAYER_IFACE_ACT_PAUSE;
	button[BTN_SAVE].val	= PLAYER_IFACE_ACT_SAVE;
	button[BTN_QUIT].val	= PLAYER_IFACE_ACT_QUIT;
		/* R click */
	tbutton[TBTN_PAUSE].val2	= PLAYER_IFACE_ACT_PAUSE;

	/* Action */
	button[BTN_CH_OFF].act	= action;
	button[BTN_CH_1].act	= action;
	button[BTN_CH_2].act	= action;
	tbutton[TBTN_PAUSE].act	= action;
	button[BTN_SAVE].act	= action;
	button[BTN_QUIT].act	= action;

	/* Generate widgets */
	button[BTN_CH_OFF].ptr	= gtk_button_new_with_mnemonic(button[BTN_CH_OFF].text);
	button[BTN_CH_1].ptr	= gtk_button_new_with_mnemonic(button[BTN_CH_1].text);
	button[BTN_CH_2].ptr	= gtk_button_new_with_mnemonic(button[BTN_CH_2].text);
	tbutton[TBTN_PAUSE].ptr	= gtk_toggle_button_new_with_mnemonic(tbutton[TBTN_PAUSE].text);
	button[BTN_SAVE].ptr	= gtk_button_new_with_mnemonic(button[BTN_SAVE].text);
	entry_fname.lbl.ptr	= gtk_label_new(entry_fname.lbl.text);
	entry_fname.ptr		= gtk_entry_new();
	entry_name.lbl.ptr	= gtk_label_new(entry_name.lbl.text);
	entry_name.ptr		= gtk_entry_new();
	button[BTN_QUIT].ptr	= gtk_button_new_with_mnemonic(button[BTN_QUIT].text);

	/* Toggle buttons */
	gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(tbutton[TBTN_PAUSE].ptr), false);

	/* Events */
	g_signal_connect(button[BTN_CH_OFF].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_CH_OFF]);
	g_signal_connect(button[BTN_CH_1].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_CH_1]);
	g_signal_connect(button[BTN_CH_2].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_CH_2]);
	g_signal_connect(tbutton[TBTN_PAUSE].ptr, "toggled",
			G_CALLBACK(callback_tbutton), (void *)&tbutton[TBTN_PAUSE]);
	g_signal_connect(button[BTN_SAVE].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_SAVE]);
	g_signal_connect(entry_fname.ptr, "activate",
			G_CALLBACK(callback_entry_fname), (void *)&entry_fname);
	g_signal_connect(entry_name.ptr, "activate",
			G_CALLBACK(callback_entry_str), (void *)&entry_name);
	g_signal_connect(button[BTN_QUIT].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_QUIT]);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_CH_OFF].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_CH_1].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_CH_2].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), tbutton[TBTN_PAUSE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_SAVE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), entry_fname.lbl.ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), entry_fname.ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), entry_name.lbl.ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), entry_name.ptr, true, true, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_QUIT].ptr, false, false, 0);
}

static	void	show_help		(const struct Game_Iface_Out	*board)
{

	if (last_help != board->state) {
		switch (board->state) {
		case GAME_IFACE_STATE_PLAYING:
			show_help_play();
			break;

		case GAME_IFACE_STATE_PAUSE:
			show_help_pause();
			break;

		case GAME_IFACE_STATE_XYZZY:
			show_help_xyzzy();
			break;

		case GAME_IFACE_STATE_CHEATED:
			show_help_cheat();
			break;

		case GAME_IFACE_STATE_SAFE:
			show_help_safe();
			break;

		case GAME_IFACE_STATE_GAMEOVER:
			show_help_gameover();
			break;
		}

		/* Update last_help */
		last_help	= board->state;

		/* Refresh */
		gtk_widget_show(box_help_in);
		gtk_widget_show(box_help);
	}
}

static	void	show_help_start		(void)
{

	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_hide(tbutton[TBTN_PAUSE].ptr);
	gtk_widget_hide(button[BTN_SAVE].ptr);
	gtk_widget_hide(entry_fname.lbl.ptr);
	gtk_widget_hide(entry_fname.ptr);
	gtk_widget_hide(entry_name.lbl.ptr);
	gtk_widget_hide(entry_name.ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);

	/* Update last_help */
	last_help	= GAME_IFACE_STATE_FOO;

	/* Refresh */
	gtk_widget_show(box_help_in);
	gtk_widget_show(box_help);
}

static	void	show_help_play		(void)
{

	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_show(tbutton[TBTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_hide(entry_fname.lbl.ptr);
	gtk_widget_hide(entry_fname.ptr);
	gtk_widget_hide(entry_name.lbl.ptr);
	gtk_widget_hide(entry_name.ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_pause		(void)
{

	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_show(tbutton[TBTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_hide(entry_fname.lbl.ptr);
	gtk_widget_hide(entry_fname.ptr);
	gtk_widget_hide(entry_name.lbl.ptr);
	gtk_widget_hide(entry_name.ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_xyzzy		(void)
{

	/* Show & hide */
	gtk_widget_show(button[BTN_CH_OFF].ptr);
	gtk_widget_show(button[BTN_CH_1].ptr);
	gtk_widget_show(button[BTN_CH_2].ptr);
	gtk_widget_hide(tbutton[TBTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_hide(entry_fname.lbl.ptr);
	gtk_widget_hide(entry_fname.ptr);
	gtk_widget_hide(entry_name.lbl.ptr);
	gtk_widget_hide(entry_name.ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_cheat		(void)
{

	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_hide(tbutton[TBTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_hide(entry_fname.lbl.ptr);
	gtk_widget_hide(entry_fname.ptr);
	gtk_widget_hide(entry_name.lbl.ptr);
	gtk_widget_hide(entry_name.ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_safe		(void)
{

	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_hide(tbutton[TBTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_hide(entry_fname.lbl.ptr);
	gtk_widget_hide(entry_fname.ptr);
	gtk_widget_hide(entry_name.lbl.ptr);
	gtk_widget_hide(entry_name.ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_gameover	(void)
{

	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_hide(tbutton[TBTN_PAUSE].ptr);
	gtk_widget_hide(button[BTN_SAVE].ptr);
	gtk_widget_hide(entry_fname.lbl.ptr);
	gtk_widget_hide(entry_fname.ptr);
	gtk_widget_hide(entry_name.lbl.ptr);
	gtk_widget_hide(entry_name.ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Input	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	gboolean	callback_field		(GtkWidget *widget,
						GdkEventButton *event,
						void *data)
{
	struct Field_Data	*field_ij;

	if (state == GAME_IFACE_STATE_PLAYING && timeout.id) {
		g_source_remove(timeout.id);
	}

	field_ij		= ((struct Field_Data *)data);
	*(field_ij->row)	= field_ij->r;
	*(field_ij->col)	= field_ij->c;

	switch (event->button) {
	case 1:
		//1 is left mouse btn
		if (event->type == GDK_BUTTON_PRESS) {
			*(field_ij->act)	= PLAYER_IFACE_ACT_STEP;
		}
		break;

	case 3:
		//3 is right mouse btn
		if (event->type == GDK_BUTTON_PRESS) {
			*(field_ij->act)	= PLAYER_IFACE_ACT_FLAG;
		}
		break;
	}

	gtk_main_quit();

	return	false;
}

static	gboolean	callback_ebox		(GtkWidget *widget,
						GdkEventButton *event,
						void *data)
{
	struct EBox_Data	*ebox;

	if ((state == GAME_IFACE_STATE_PLAYING)  &&  timeout.id) {
		g_source_remove(timeout.id);
	}

	ebox	= ((struct EBox_Data *)data);

	switch (event->button) {
	case 1:
		//1 is left mouse btn
		if (event->type == GDK_BUTTON_PRESS) {
			*(ebox->act)		= ebox->val;
		} else if (event->type == GDK_2BUTTON_PRESS) {
		}
		break;

	case 3:
		//3 is right mouse btn
		break;
	}

	gtk_main_quit();

	return	false;
}

static	void		callback_button		(GtkWidget *widget, void *data)
{
	struct Button_Data	*button;

	if ((state == GAME_IFACE_STATE_PLAYING)  &&  timeout.id) {
		g_source_remove(timeout.id);
	}

	button		= ((struct Button_Data *)data);
	*(button->act)	= button->val;

	gtk_main_quit();

}

static	gboolean	callback_tbutton	(GtkWidget *widget, void *data)
{
	struct TButton_Data	*tbutton;

	if ((state == GAME_IFACE_STATE_PLAYING)  &&  timeout.id) {
		g_source_remove(timeout.id);
	}

	tbutton	= ((struct TButton_Data *)data);

	if (gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(widget))) {
		/* If control reaches here, the toggle button is down */
		*(tbutton->act)		= tbutton->val;
		gtk_button_set_label(GTK_BUTTON(tbutton[TBTN_PAUSE].ptr), tbutton[TBTN_PAUSE].text2);
	} else {
		/* If control reaches here, the toggle button is up */
		*(tbutton->act)		= tbutton->val2;
		gtk_button_set_label(GTK_BUTTON(tbutton[TBTN_PAUSE].ptr), tbutton[TBTN_PAUSE].text);
	}

	gtk_main_quit();

	return	false;
}

static	void		callback_entry_fname	(GtkWidget *widget, void *data)
{
	struct Entry_fname_Data	*entry;
	const char		*str;
	int			err;
	char			buff [LINE_SIZE];

	entry	= ((struct Entry_fname_Data *)data);
	str	= gtk_entry_get_text(GTK_ENTRY(entry->ptr));
	err	= alx_sscan_fname(entry->fpath, entry->fname, false, str);

	if (err) {
		snprintf(buff, LINE_SIZE, "Error %i", err);
		gtk_entry_set_text(GTK_ENTRY(entry->ptr), buff);
		gtk_editable_select_region(GTK_EDITABLE(entry->ptr),
					0, GTK_ENTRY(entry->ptr)->text_length);
	}

	gtk_main_quit();
}

static	void		callback_entry_str	(GtkWidget *widget, void *data)
{
	struct Entry_str_Data	*entry;
	const char		*str;

	entry	= ((struct Entry_str_Data *)data);
	str	= gtk_entry_get_text(GTK_ENTRY(entry->ptr));
	snprintf(entry->str, entry->strsize, "%s", str);

	gtk_main_quit();
}

static	gboolean	callback_timeout	(void *data)
{
	struct Timeout_Data	*tout;

	tout		= ((struct Timeout_Data *)data);
	*(tout->act)	= tout->val;

	gtk_main_quit();

	return	false;
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
