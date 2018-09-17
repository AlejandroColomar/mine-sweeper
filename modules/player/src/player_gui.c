/******************************************************************************
 *	Copyright (C) 2015	Alejandro Colomar Andrés		      *
 ******************************************************************************/


/******************************************************************************
 ******* headers **************************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Standard	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
	#include <gtk/gtk.h>
		/* true & false */
	#include <stdbool.h>
		/* strcpy() */
	#include <string.h>

/*	*	*	*	*	*	*	*	*	*
 *	*	* Other	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
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
	# define	REFRESH_TIME_MS		(100)


/******************************************************************************
 ******* enums ****************************************************************
 ******************************************************************************/
enum	Buttons {
	BTN_CH_OFF = 0,
	BTN_CH_1,
	BTN_CH_2,
	BTN_PAUSE,
	BTN_SAVE,
	BTN_QUIT,
	BTN_QTTY
};


/******************************************************************************
 ******* structs **************************************************************
 ******************************************************************************/
struct	Field_Data {
	GtkWidget	*ptr;
	char		ch;
	int		r;
	int		c;
	int		*row;
	int		*col;
	int		*act;
};

struct	Button_Data {
	GtkWidget	*ptr;
	char		text [80];
	int		val;
	int		val2;
	int		*act;
};

struct	Label_Data {
	GtkWidget	*ptr;
	char		text [80];
};


/******************************************************************************
 ******* variables ************************************************************
 ******************************************************************************/
static	struct Field_Data	field [ROWS_GUI_MAX] [COLS_GUI_MAX];
static	struct Button_Data	button [BTN_QTTY];
static	GtkWidget	*box;
static	GtkWidget	*box_board;
static	GtkWidget	*box_board_in;
static	GtkWidget	*box_board_tit;
static	GtkWidget	*box_board_tit_in;
static	GtkWidget	*box_board_tab;
static	GtkWidget	*box_board_stit;
static	GtkWidget	*box_board_stit_in;
static	GtkWidget	*table_board;
static	GtkWidget	*box_help;
static	GtkWidget	*box_help_in;
static	int		last_help;


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
	/* Start */
static	void	board_init	(struct Player_Iface_Position		*position);
static	void	show_board_start(struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle);

static	void	board_loop_start(struct Player_Iface_Position		*position);

	/* Play */
static	void	show_board	(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle);

static	void	board_loop	(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position);

static	char	set_char	(int game_iface_visible);
static	void	show_char	(struct Field_Data			*field);
	/* Help */
static	void	help_init		(int				*action);
static	void	show_help		(const struct Game_Iface_Out	*board);
static	void	show_help_start		(void);
static	void	show_help_play		(void);
static	void	show_help_pause		(void);
static	void	show_help_xyzzy		(void);
static	void	show_help_cheat		(void);
static	void	show_help_safe		(void);
static	void	show_help_gameover	(void);
	/* Input */
static	gboolean	callback_field	(GtkWidget			*widget,
					GdkEventButton			*event,
					void				*data);
static	gboolean	callback_button	(GtkWidget			*widget,
					GdkEventButton			*event,
					void				*data);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	player_gui_init		(struct Player_Iface_Position		*position,
				int					*action)
{
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
	board_init(position);

	/* Board fields */
	int	i;
	int	j;
	for (i = 0; i < position->rows; i++) {
		for (j = 0; j < position->cols; j++) {
			field[i][j].r	= i;
			field[i][j].c	= j;
			field[i][j].row	= &(position->row);
			field[i][j].col	= &(position->col);
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

int	player_gui_start	(struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle)
{
	show_help_start();
	show_board_start(position, title, subtitle);

	/* Refresh */
	gtk_widget_show(box);
	gtk_widget_show(window_gui);

	gtk_main();

	return	0;
}

int	player_gui		(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle)
{
	show_help(board);
	show_board(board, position, title, subtitle);

	/* Refresh */
	gtk_widget_show(box);
	gtk_widget_show(window_gui);

	gtk_main();

	return	0;
}

void	player_gui_save_name	(const char *filepath, char *filename)
{
#if 0
	/* Input box */
	int	w;
	int	r;
	w	= 60;
	r	= 10;

	/* Request name */
	alx_w_getfname(filepath, filename, false, w, r, "File name:", NULL);
#endif
}

void	player_gui_score_name	(char *player_name)
{
#if 0
	/* Input box */
	int	w;
	int	r;
	w	= 60;
	r	= 10;

	/* Request name */
	alx_w_getstr(player_name, w, r, "Your name:", NULL);
#endif
}

void	player_gui_cleanup	(void)
{
	/* Del box */
	gtk_widget_destroy(box);
}


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
/*	*	*	*	*	*	*	*	*	*
 *	*	* Start	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	board_init	(struct Player_Iface_Position		*position)
{
	GtkWidget		*separator[2];
	struct Label_Data	label[2];

	/* Box */
	box_board_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board), box_board_in, true, true, 5);

	/* Title */
	box_board_tit		= gtk_vbox_new(false, 0);
	box_board_tit_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_in), box_board_tit, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_tit), box_board_tit_in, false, false, 0);
	label[0].ptr	= gtk_label_new("NEW");
	gtk_box_pack_start(GTK_BOX(box_board_tit_in), label[0].ptr, false, false, 0);

	/* Separator */
	separator[0]	= gtk_hseparator_new();
	gtk_box_pack_start(GTK_BOX(box_board_in), separator[0], false, false, 5);

	/* Board */
	box_board_tab	= gtk_vbox_new(true, 0);
	gtk_box_pack_start(GTK_BOX(box_board_in), box_board_tab, true, true, 0);
	table_board	= gtk_table_new(position->rows, position->cols, true);
	gtk_box_pack_start(GTK_BOX(box_board_tab), table_board, true, true, 5);

	/* Separator */
	separator[1]	= gtk_hseparator_new();
	gtk_box_pack_start(GTK_BOX(box_board_in), separator[1], false, false, 5);

	/* Subtitle */
	box_board_stit		= gtk_vbox_new(false, 0);
	box_board_stit_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_in), box_board_stit, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_stit), box_board_stit_in, false, false, 0);
	label[1].ptr	= gtk_label_new("NEW");
	gtk_box_pack_start(GTK_BOX(box_board_stit_in), label[1].ptr, false, false, 0);

	/* Refresh */
	gtk_widget_show_all(box_board);
}

static	void	show_board_start(struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle)
{
	struct Label_Data	label[2];

	/* Clear */
	gtk_widget_destroy(box_board_tit_in);
	gtk_widget_destroy(box_board_stit_in);

	/* Title */
	box_board_tit_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_tit), box_board_tit_in, false, false, 0);
	strcpy(label[0].text, title);
	label[0].ptr	= gtk_label_new(label[0].text);
	gtk_box_pack_start(GTK_BOX(box_board_tit_in), label[0].ptr, false, false, 0);

	/* Board */
	board_loop_start(position);

	/* Subtitle */
	box_board_stit_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_stit), box_board_stit_in, false, false, 0);
	strcpy(label[1].text, subtitle);
	label[1].ptr	= gtk_label_new(label[1].text);
	gtk_box_pack_start(GTK_BOX(box_board_stit_in), label[1].ptr, false, false, 0);

	/* Refresh */
	gtk_widget_show_all(box_board);
}

static	void	board_loop_start(struct Player_Iface_Position		*position)
{
	int			i;
	int			j;
	char			ch;

	ch	= PLAYER_GUI_CHAR_HIDDEN_FIELD;

	for (i = 0; i < position->rows; i++) {
		for (j = 0; j < position->cols; j++) {
			field[i][j].ch	= ch;
			show_char(&field[i][j]);
		}
	}
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Play	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	show_board	(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle)
{
	struct Label_Data	label[2];

	/* Clear */
	gtk_widget_destroy(box_board_tit_in);
	gtk_widget_destroy(box_board_stit_in);

	/* Title */
	box_board_tit_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_tit), box_board_tit_in, false, false, 0);
	strcpy(label[0].text, title);
	label[0].ptr	= gtk_label_new(label[0].text);
	gtk_box_pack_start(GTK_BOX(box_board_tit_in), label[0].ptr, false, false, 0);

	/* Board */
	board_loop(board, position);

	/* Subtitle */
	box_board_stit_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board_stit), box_board_stit_in, false, false, 0);
	strcpy(label[1].text, subtitle);
	label[1].ptr	= gtk_label_new(label[1].text);
	gtk_box_pack_start(GTK_BOX(box_board_stit_in), label[1].ptr, false, false, 0);

	/* Refresh */
	gtk_widget_show_all(box_board);
}

static	void	board_loop	(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position)
{
	int			i;
	int			j;

	for (i = 0; i < board->rows; i++) {
		for (j = 0; j < board->cols; j++) {
			field[i][j].ch	= set_char(board->visible[i][j]);
			show_char(&field[i][j]);
		}
	}
}

static	char	set_char	(int game_iface_visible)
{
	char	ch;
	switch (game_iface_visible) {
	case GAME_IFACE_VIS_KBOOM:
		ch =	PLAYER_GUI_CHAR_KBOOM;
		break;

	case GAME_IFACE_VIS_HIDDEN_FIELD:
		ch =	PLAYER_GUI_CHAR_HIDDEN_FIELD;
		break;

	case GAME_IFACE_VIS_HIDDEN_MINE:
		ch =	PLAYER_GUI_CHAR_HIDDEN_MINE;
		break;

	case GAME_IFACE_VIS_HIDDEN_SAFE:
		ch =	PLAYER_GUI_CHAR_HIDDEN_SAFE;
		break;

	case GAME_IFACE_VIS_SAFE_MINE:
		ch =	PLAYER_GUI_CHAR_SAFE_MINE;
		break;

	case GAME_IFACE_VIS_0:
		ch =	PLAYER_GUI_CHAR_0;
		break;

	case GAME_IFACE_VIS_1:
		ch =	PLAYER_GUI_CHAR_1;
		break;

	case GAME_IFACE_VIS_2:
		ch =	PLAYER_GUI_CHAR_2;
		break;

	case GAME_IFACE_VIS_3:
		ch =	PLAYER_GUI_CHAR_3;
		break;

	case GAME_IFACE_VIS_4:
		ch =	PLAYER_GUI_CHAR_4;
		break;

	case GAME_IFACE_VIS_5:
		ch =	PLAYER_GUI_CHAR_5;
		break;

	case GAME_IFACE_VIS_6:
		ch =	PLAYER_GUI_CHAR_6;
		break;

	case GAME_IFACE_VIS_7:
		ch =	PLAYER_GUI_CHAR_7;
		break;

	case GAME_IFACE_VIS_8:
		ch =	PLAYER_GUI_CHAR_8;
		break;

	case GAME_IFACE_VIS_FLAG:
		ch =	PLAYER_GUI_CHAR_FLAG;
		break;

	case GAME_IFACE_VIS_FLAG_FALSE:
		ch =	PLAYER_GUI_CHAR_FLAG_FALSE;
		break;

	case GAME_IFACE_VIS_POSSIBLE:
		ch =	PLAYER_GUI_CHAR_POSSIBLE;
		break;

	case GAME_IFACE_VIS_POSSIBLE_FALSE:
		ch =	PLAYER_GUI_CHAR_POSSIBLE_FALSE;
		break;
	}

	return	ch;
}

static	void	show_char	(struct Field_Data			*field)
{
	char	text [2];
	sprintf(text, "%c", field->ch);
	gtk_button_set_label(GTK_BUTTON(field->ptr), text);
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Help	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	help_init		(int				*action)
{
	/* Box */
	box_help_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_help), box_help_in, false, false, 5);

	/* Text */
	sprintf(button[BTN_CH_OFF].text, "Cheats off");
	sprintf(button[BTN_CH_1].text, "Cheat 1");
	sprintf(button[BTN_CH_2].text, "Cheat 2");
	sprintf(button[BTN_PAUSE].text, "Pause");
	sprintf(button[BTN_SAVE].text, "Save");
	sprintf(button[BTN_QUIT].text, "Quit");

	/* Data */
		/* L click */
	button[BTN_CH_OFF].val	= PLAYER_IFACE_ACT_XYZZY_OFF;
	button[BTN_CH_1].val	= PLAYER_IFACE_ACT_XYZZY_LIN;
	button[BTN_CH_2].val	= PLAYER_IFACE_ACT_XYZZY_P;
	button[BTN_PAUSE].val	= PLAYER_IFACE_ACT_PAUSE;
	button[BTN_SAVE].val	= PLAYER_IFACE_ACT_SAVE;
	button[BTN_QUIT].val	= PLAYER_IFACE_ACT_QUIT;
		/* R click */
	button[BTN_CH_OFF].val2	= PLAYER_IFACE_ACT_FOO;
	button[BTN_CH_1].val2	= PLAYER_IFACE_ACT_FOO;
	button[BTN_CH_2].val2	= PLAYER_IFACE_ACT_FOO;
	button[BTN_PAUSE].val2	= PLAYER_IFACE_ACT_FOO;
	button[BTN_SAVE].val2	= PLAYER_IFACE_ACT_XYZZY_ON;
	button[BTN_QUIT].val2	= PLAYER_IFACE_ACT_FOO;

	/* Action */
	button[BTN_CH_OFF].act	= action;
	button[BTN_CH_1].act	= action;
	button[BTN_CH_2].act	= action;
	button[BTN_PAUSE].act	= action;
	button[BTN_SAVE].act	= action;
	button[BTN_QUIT].act	= action;

	/* Generate widgets */
	button[BTN_CH_OFF].ptr	= gtk_button_new_with_label(button[BTN_CH_OFF].text);
	button[BTN_CH_1].ptr	= gtk_button_new_with_label(button[BTN_CH_1].text);
	button[BTN_CH_2].ptr	= gtk_button_new_with_label(button[BTN_CH_2].text);
	button[BTN_PAUSE].ptr	= gtk_button_new_with_label(button[BTN_PAUSE].text);
	button[BTN_SAVE].ptr	= gtk_button_new_with_label(button[BTN_SAVE].text);
	button[BTN_QUIT].ptr	= gtk_button_new_with_label(button[BTN_QUIT].text);

	/* Events */
	g_signal_connect(button[BTN_CH_OFF].ptr, "button-press-event",
			G_CALLBACK(callback_button), (void *)&button[BTN_CH_OFF]);
	g_signal_connect(button[BTN_CH_1].ptr, "button-press-event",
			G_CALLBACK(callback_button), (void *)&button[BTN_CH_1]);
	g_signal_connect(button[BTN_CH_2].ptr, "button-press-event",
			G_CALLBACK(callback_button), (void *)&button[BTN_CH_2]);
	g_signal_connect(button[BTN_PAUSE].ptr, "button-press-event",
			G_CALLBACK(callback_button), (void *)&button[BTN_PAUSE]);
	g_signal_connect(button[BTN_SAVE].ptr, "button-press-event",
			G_CALLBACK(callback_button), (void *)&button[BTN_SAVE]);
	g_signal_connect(button[BTN_QUIT].ptr, "button-press-event",
			G_CALLBACK(callback_button), (void *)&button[BTN_QUIT]);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_CH_OFF].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_CH_1].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_CH_2].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_PAUSE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_SAVE].ptr, false, false, 0);
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
	gtk_widget_hide(button[BTN_PAUSE].ptr);
	gtk_widget_hide(button[BTN_SAVE].ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);

	/* Update last_help */
	last_help	= GAME_IFACE_STATE_FOO;

	/* Refresh */
	gtk_widget_show(box_help_in);
	gtk_widget_show(box_help);
}

static	void	show_help_play		(void)
{
	/* Text */
	sprintf(button[BTN_PAUSE].text, "Pause");
	gtk_button_set_label(GTK_BUTTON(button[BTN_PAUSE].ptr), button[BTN_PAUSE].text);

	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_show(button[BTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_pause		(void)
{
	/* Text */
	sprintf(button[BTN_PAUSE].text, "Continue");
	gtk_button_set_label(GTK_BUTTON(button[BTN_PAUSE].ptr), button[BTN_PAUSE].text);

	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_show(button[BTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_xyzzy		(void)
{
	/* Show & hide */
	gtk_widget_show(button[BTN_CH_OFF].ptr);
	gtk_widget_show(button[BTN_CH_1].ptr);
	gtk_widget_show(button[BTN_CH_2].ptr);
	gtk_widget_hide(button[BTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_cheat		(void)
{
	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_hide(button[BTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_safe		(void)
{
	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_hide(button[BTN_PAUSE].ptr);
	gtk_widget_show(button[BTN_SAVE].ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

static	void	show_help_gameover	(void)
{
	/* Show & hide */
	gtk_widget_hide(button[BTN_CH_OFF].ptr);
	gtk_widget_hide(button[BTN_CH_1].ptr);
	gtk_widget_hide(button[BTN_CH_2].ptr);
	gtk_widget_hide(button[BTN_PAUSE].ptr);
	gtk_widget_hide(button[BTN_SAVE].ptr);
	gtk_widget_show(button[BTN_QUIT].ptr);
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Input	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	gboolean	callback_field	(GtkWidget			*widget,
					GdkEventButton			*event,
					void				*data)
{
	struct Field_Data	*field_ij;
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

static	gboolean	callback_button	(GtkWidget			*widget,
					GdkEventButton			*event,
					void				*data)
{
	struct Button_Data	*button;
	button			= ((struct Button_Data *)data);

	switch (event->button) {
	case 1:
		//1 is left mouse btn
		if (event->type == GDK_BUTTON_PRESS) {
			*(button->act)		= button->val;
		} else if (event->type == GDK_2BUTTON_PRESS) {
		}
		break;

	case 3:
		//3 is right mouse btn
		*(button->act)		= button->val2;
		break;
	}

	gtk_main_quit();
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
