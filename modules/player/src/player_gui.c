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
static	GtkWidget	*box_board_tab;
static	GtkWidget	*table_board;
static	GtkWidget	*box_help;
static	GtkWidget	*box_help_in;
static	int		last_help;


/******************************************************************************
 ******* static functions *****************************************************
 ******************************************************************************/
	/* Start */
static	void	show_board_start(struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle,
				int					*action);

static	void	board_loop_start(struct Player_Iface_Position		*position,
				int					*action);

	/* Play */
static	void	show_board	(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle,
				int					*action);

static	void	board_loop	(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position,
				int					*action);

static	char	set_char	(int game_iface_visible);
static	void	show_char	(struct Field_Data			*field);
	/* Input */
static	gboolean callback_field	(GtkWidget				*widget,
				GdkEventButton				*event,
				void					*data);
static	void	callback_button	(GtkWidget				*widget,
				void					*data);
#if 0
static	int	usr_input	(void);
#endif
	/* Help */
static	void	show_help		(const struct Game_Iface_Out	*board,
					int				*action);
static	void	show_help_start		(int *action);
static	void	show_help_play		(int *action);
static	void	show_help_pause		(int *action);
static	void	show_help_xyzzy		(int *action);
static	void	show_help_cheat		(int *action);
static	void	show_help_safe		(int *action);
static	void	show_help_gameover	(int *action);


/******************************************************************************
 ******* main *****************************************************************
 ******************************************************************************/
void	player_gui_init		(void)
{
	GtkWidget	*separator;

	box		= gtk_hbox_new(false, 0);
	gtk_container_add(GTK_CONTAINER(window_gui), box);

	/* Text */
	sprintf(button[BTN_CH_OFF].text, "Cheats off");
	sprintf(button[BTN_CH_1].text, "Cheat 1");
	sprintf(button[BTN_CH_2].text, "Cheat 2");
	sprintf(button[BTN_PAUSE].text, "Pause");
	sprintf(button[BTN_SAVE].text, "Save");
	sprintf(button[BTN_QUIT].text, "Quit");

	/* Data */
	button[BTN_CH_OFF].val	= PLAYER_IFACE_ACT_XYZZY_OFF;
	button[BTN_CH_1].val	= PLAYER_IFACE_ACT_XYZZY_LIN;
	button[BTN_CH_2].val	= PLAYER_IFACE_ACT_XYZZY_P;
	button[BTN_PAUSE].val	= PLAYER_IFACE_ACT_PAUSE;
	button[BTN_SAVE].val	= PLAYER_IFACE_ACT_SAVE;
	button[BTN_QUIT].val	= PLAYER_IFACE_ACT_QUIT;

	box_help	= gtk_vbox_new(true, 0);
	box_help_in	= gtk_vbox_new(false, 0);
	separator	= gtk_vseparator_new();
	box_board	= gtk_vbox_new(false, 0);
	box_board_in	= gtk_vbox_new(false, 0);

	gtk_box_pack_start(GTK_BOX(box), box_help, false, false, 5);
	gtk_box_pack_start(GTK_BOX(box_help), box_help_in, false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), separator, false, false, 5);
	gtk_box_pack_start(GTK_BOX(box), box_board, true, true, 5);
	gtk_box_pack_start(GTK_BOX(box_board), box_board_in, true, true, 5);

	/* Refresh */
	gtk_widget_show_all(window_gui);


//	wtimeout(win_board, REFRESH_TIME_MS);
}

int	player_gui_start	(struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle,
				int					*action)
{
	show_help_start(action);
	show_board_start(position, title, subtitle, action);

	/* Refresh */
	gtk_widget_show_all(window_gui);

	gtk_main();

	return	0;
}

int	player_gui		(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle,
				int					*action)
{
	show_help(board, action);
	show_board(board, position, title, subtitle, action);

	/* Refresh */
	gtk_widget_show_all(window_gui);

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
static	void	show_board_start(struct Player_Iface_Position		*position,
				const char				*title,
				const char				*subtitle,
				int					*action)
{
	GtkWidget		*separator[2];
	struct Label_Data	label[2];

	/* Clear */
	gtk_widget_destroy(box_board_in);

	/* Box */
	box_board_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board), box_board_in, false, false, 5);

	/* Title */
	strcpy(label[0].text, title);
	label[0].ptr	= gtk_label_new(label[0].text);
	gtk_box_pack_start(GTK_BOX(box_board_in), label[0].ptr, false, false, 0);

	/* Separator */
	separator[0]	= gtk_hseparator_new();
	gtk_box_pack_start(GTK_BOX(box_board_in), separator[0], false, false, 5);

	/* Board */
	table_board	= gtk_table_new(position->rows, position->cols, true);
	gtk_box_pack_start(GTK_BOX(box_board_in), table_board, true, true, 5);
	board_loop_start(position, action);

	/* Separator */
	separator[1]	= gtk_hseparator_new();
	gtk_box_pack_start(GTK_BOX(box_board_in), separator[1], false, false, 5);

	/* Subtitle */
	strcpy(label[1].text, subtitle);
	label[1].ptr	= gtk_label_new(label[1].text);
	gtk_box_pack_start(GTK_BOX(box_board_in), label[1].ptr, false, false, 0);
}

static	void	board_loop_start(struct Player_Iface_Position		*position,
				int					*action)
{
	int			i;
	int			j;
	char			ch;

	ch	= PLAYER_GUI_CHAR_HIDDEN_FIELD;

	for (i = 0; i < position->rows; i++) {

		/* hidden */
		for (j = 0; j < position->cols; j++) {
			field[i][j].r	= i;
			field[i][j].c	= j;
			field[i][j].row	= &(position->row);
			field[i][j].col	= &(position->col);
			field[i][j].act	= action;

			field[i][j].ch	= ch;

			/* Show char*/
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
				const char				*subtitle,
				int					*action)
{
	GtkWidget		*separator[2];
	struct Label_Data	label[2];

	/* Clear */
	gtk_widget_destroy(box_board_in);

	/* Box */
	box_board_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_board), box_board_in, false, false, 5);

	/* Title */
	strcpy(label[0].text, title);
	label[0].ptr	= gtk_label_new(label[0].text);
	gtk_box_pack_start(GTK_BOX(box_board_in), label[0].ptr, false, false, 0);

	/* Separator */
	separator[0]	= gtk_hseparator_new();
	gtk_box_pack_start(GTK_BOX(box_board_in), separator[0], false, false, 5);

	/* Board */
	table_board	= gtk_table_new(position->rows, position->cols, true);
	gtk_box_pack_start(GTK_BOX(box_board_in), table_board, true, true, 5);
	board_loop(board, position, action);

	/* Separator */
	separator[1]	= gtk_hseparator_new();
	gtk_box_pack_start(GTK_BOX(box_board_in), separator[1], false, false, 5);

	/* Subtitle */
	strcpy(label[1].text, subtitle);
	label[1].ptr	= gtk_label_new(label[1].text);
	gtk_box_pack_start(GTK_BOX(box_board_in), label[1].ptr, false, false, 0);
}

static	void	board_loop	(const struct Game_Iface_Out		*board,
				struct Player_Iface_Position		*position,
				int					*action)
{
	int			i;
	int			j;

	for (i = 0; i < board->rows; i++) {
		for (j = 0; j < board->cols; j++) {
			field[i][j].r	= i;
			field[i][j].c	= j;
			field[i][j].row	= &(position->row);
			field[i][j].col	= &(position->col);
			field[i][j].act	= action;

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
	field->ptr	= gtk_button_new_with_label(text);
	g_signal_connect(field->ptr, "button-press-event",
			G_CALLBACK(callback_field), (void *)field);
	gtk_table_attach_defaults(GTK_TABLE(table_board), field->ptr,
			field->c, field->c + 1, field->r, field->r + 1);
}

/*	*	*	*	*	*	*	*	*	*
 *	*	* Input	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	gboolean callback_field	(GtkWidget				*widget,
				GdkEventButton				*event,
				void					*data)
{
	struct Field_Data	*field_ij;
	field_ij		= ((struct Field_Data *)data);

	*(field_ij->row)	= field_ij->r;
	*(field_ij->col)	= field_ij->c;

	if (event->type == GDK_BUTTON_PRESS  &&  event->button == 3) {
		//3 is right mouse btn
		*(field_ij->act)	= PLAYER_IFACE_ACT_FLAG;

	} else if (event->type == GDK_BUTTON_PRESS  &&  event->button == 1) {
		//1 is left mouse btn
		*(field_ij->act)	= PLAYER_IFACE_ACT_STEP;
	}

	gtk_main_quit();

	return	false;
}

static	void	callback_button	(GtkWidget				*widget,
				void					*data)
{
	struct Button_Data	*button;
	button			= ((struct Button_Data *)data);

	*(button->act)		= button->val;

	gtk_main_quit();
}

#if 0
static	int	usr_input	(void)
{
	char	ch;
	ch = wgetch(win_board);

	int	action;

	switch (ch) {
	case '+':
	case '\r':
	case '\n':
		action	= PLAYER_IFACE_ACT_STEP;
		break;

	case ' ':
		action	= PLAYER_IFACE_ACT_FLAG;
		break;

	case 'f':
		action	= PLAYER_IFACE_ACT_FLAG_POSSIBLE;
		break;

		/* ASCII 0x08 is BS */
	case KEY_BACKSPACE:
	case 0x08:
		action	= PLAYER_IFACE_ACT_RM_FLAG;
		break;


	case KEY_BREAK:
	case 'p':
		action	= PLAYER_IFACE_ACT_PAUSE;
		break;

	case 's':
		action	= PLAYER_IFACE_ACT_SAVE;
		break;

	case 'x':
		/* Wait for special sequence "xyzzy" */
		wtimeout(win_board, 1000);

		ch = wgetch(win_board);
		if (ch == 'y') {
			ch = wgetch(win_board);
			if (ch == 'z') {

			ch = wgetch(win_board);
			if (ch == 'z') {

			ch = wgetch(win_board);
			if (ch == 'y') {
				action	= PLAYER_IFACE_ACT_XYZZY_ON;
			}
			}
			}
		}

		/* Resume */
		wtimeout(win_board, REFRESH_TIME_MS);
		break;

	case '0':
		action	= PLAYER_IFACE_ACT_XYZZY_OFF;
		break;

	case '1':
		action	= PLAYER_IFACE_ACT_XYZZY_LIN;
		break;

	case '2':
		action	= PLAYER_IFACE_ACT_XYZZY_P;
		break;

	case '3':
		action	= PLAYER_IFACE_ACT_XYZZY_NP;
		break;

	case 'q':
		action	= PLAYER_IFACE_ACT_QUIT;
		break;


	case KEY_LEFT:
	case 'h':
		action	= PLAYER_IFACE_ACT_MOVE_LEFT;
		break;

	case KEY_DOWN:
	case 'j':
		action	= PLAYER_IFACE_ACT_MOVE_DOWN;
		break;

	case KEY_UP:
	case 'k':
		action	= PLAYER_IFACE_ACT_MOVE_UP;
		break;

	case KEY_RIGHT:
	case 'l':
		action	= PLAYER_IFACE_ACT_MOVE_RIGHT;
		break;

	case 'c':
		action	= PLAYER_IFACE_ACT_HIGHLIGHT;
		break;

	default:
		action	= PLAYER_IFACE_ACT_FOO;
		break;
	}

	return	action;
}
#endif

/*	*	*	*	*	*	*	*	*	*
 *	*	* Help	*	*	*	*	*	*	*
 *	*	*	*	*	*	*	*	*	*/
static	void	show_help		(const struct Game_Iface_Out	*board,
					int				*action)
{
	if (last_help != board->state) {
		/* Clear */
		gtk_widget_destroy(box_help_in);

		/* Box help */
		box_help_in	= gtk_vbox_new(false, 0);
		gtk_box_pack_start(GTK_BOX(box_help), box_help_in, false, false, 5);

		switch (board->state) {
		case GAME_IFACE_STATE_PLAYING:
			show_help_play(action);
			break;

		case GAME_IFACE_STATE_PAUSE:
			show_help_pause(action);
			break;

		case GAME_IFACE_STATE_XYZZY:
			show_help_xyzzy(action);
			break;

		case GAME_IFACE_STATE_CHEATED:
			show_help_cheat(action);
			break;

		case GAME_IFACE_STATE_SAFE:
			show_help_safe(action);
			break;

		case GAME_IFACE_STATE_GAMEOVER:
			show_help_gameover(action);
			break;
		}

		/* Update last_help */
		last_help	= board->state;
	}
}

static	void	show_help_start		(int *action)
{
	GtkWidget		*separator [5];

	/* Clear */
	gtk_widget_destroy(box_help_in);

	/* Box help */
	box_help_in	= gtk_vbox_new(false, 0);
	gtk_box_pack_start(GTK_BOX(box_help), box_help_in, false, false, 5);

	/* Data */
	button[BTN_QUIT].act	= action;

	/* Generate widgets */
	separator[0]		= gtk_hseparator_new();
	separator[1]		= gtk_hseparator_new();
	separator[2]		= gtk_hseparator_new();
	separator[3]		= gtk_hseparator_new();
	separator[4]		= gtk_hseparator_new();
	button[BTN_QUIT].ptr	= gtk_button_new_with_label(button[BTN_QUIT].text);

	/* Events */
	g_signal_connect(button[BTN_QUIT].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_QUIT]);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[0], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[1], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[2], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[3], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[4], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_QUIT].ptr, false, false, 0);

	/* Show */
	gtk_widget_show(separator[0]);
	gtk_widget_show(separator[1]);
	gtk_widget_show(separator[2]);
	gtk_widget_show(separator[3]);
	gtk_widget_show(separator[4]);
	gtk_widget_show(button[BTN_QUIT].ptr);

	/* Update last_help */
	last_help	= GAME_IFACE_STATE_FOO;
}

static	void	show_help_play		(int *action)
{
	GtkWidget		*separator [3];

	/* Text */
	sprintf(button[BTN_PAUSE].text, "Pause");

	/* Data */
	button[BTN_PAUSE].act	= action;
	button[BTN_SAVE].act	= action;
	button[BTN_QUIT].act	= action;

	/* Generate widgets */
	separator[0]		= gtk_hseparator_new();
	separator[1]		= gtk_hseparator_new();
	separator[2]		= gtk_hseparator_new();
	button[BTN_PAUSE].ptr	= gtk_button_new_with_label(button[BTN_PAUSE].text);
	button[BTN_SAVE].ptr	= gtk_button_new_with_label(button[BTN_SAVE].text);
	button[BTN_QUIT].ptr	= gtk_button_new_with_label(button[BTN_QUIT].text);

	/* Events */
	g_signal_connect(button[BTN_PAUSE].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_PAUSE]);
	g_signal_connect(button[BTN_SAVE].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_SAVE]);
	g_signal_connect(button[BTN_QUIT].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_QUIT]);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[0], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[1], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[2], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_PAUSE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_SAVE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_QUIT].ptr, false, false, 0);
}

static	void	show_help_pause		(int *action)
{
	GtkWidget		*separator [3];

	/* Text */
	sprintf(button[BTN_PAUSE].text, "Continue");

	/* Data */
	button[BTN_PAUSE].act	= action;
	button[BTN_SAVE].act	= action;
	button[BTN_QUIT].act	= action;

	/* Generate widgets */
	separator[0]		= gtk_hseparator_new();
	separator[1]		= gtk_hseparator_new();
	separator[2]		= gtk_hseparator_new();
	button[BTN_PAUSE].ptr	= gtk_button_new_with_label(button[BTN_PAUSE].text);
	button[BTN_SAVE].ptr	= gtk_button_new_with_label(button[BTN_SAVE].text);
	button[BTN_QUIT].ptr	= gtk_button_new_with_label(button[BTN_QUIT].text);

	/* Events */
	g_signal_connect(button[BTN_PAUSE].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_PAUSE]);
	g_signal_connect(button[BTN_SAVE].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_SAVE]);
	g_signal_connect(button[BTN_QUIT].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_QUIT]);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[0], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[1], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[2], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_PAUSE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_SAVE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_QUIT].ptr, false, false, 0);
}

static	void	show_help_xyzzy		(int *action)
{
	GtkWidget		*separator;

	/* Data */
	button[BTN_CH_OFF].act	= action;
	button[BTN_CH_1].act	= action;
	button[BTN_CH_2].act	= action;
	button[BTN_SAVE].act	= action;
	button[BTN_QUIT].act	= action;

	/* Generate widgets */
	button[BTN_CH_OFF].ptr	= gtk_button_new_with_label(button[BTN_CH_OFF].text);
	button[BTN_CH_1].ptr	= gtk_button_new_with_label(button[BTN_CH_1].text);
	button[BTN_CH_2].ptr	= gtk_button_new_with_label(button[BTN_CH_2].text);
	separator		= gtk_hseparator_new();
	button[BTN_SAVE].ptr	= gtk_button_new_with_label(button[BTN_SAVE].text);
	button[BTN_QUIT].ptr	= gtk_button_new_with_label(button[BTN_QUIT].text);

	/* Events */
	g_signal_connect(button[BTN_CH_OFF].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_CH_OFF]);
	g_signal_connect(button[BTN_CH_1].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_CH_1]);
	g_signal_connect(button[BTN_CH_2].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_CH_2]);
	g_signal_connect(button[BTN_SAVE].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_SAVE]);
	g_signal_connect(button[BTN_QUIT].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_QUIT]);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_CH_OFF].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_CH_1].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_CH_2].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator, false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_SAVE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_QUIT].ptr, false, false, 0);
}

static	void	show_help_cheat		(int *action)
{
	GtkWidget		*separator [4];

	/* Data */
	button[BTN_SAVE].act	= action;
	button[BTN_QUIT].act	= action;

	/* Generate widgets */
	separator[0]		= gtk_hseparator_new();
	separator[1]		= gtk_hseparator_new();
	separator[2]		= gtk_hseparator_new();
	separator[3]		= gtk_hseparator_new();
	button[BTN_SAVE].ptr	= gtk_button_new_with_label(button[BTN_SAVE].text);
	button[BTN_QUIT].ptr	= gtk_button_new_with_label(button[BTN_QUIT].text);

	/* Events */
	g_signal_connect(button[BTN_SAVE].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_SAVE]);
	g_signal_connect(button[BTN_QUIT].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_QUIT]);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[0], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[1], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[2], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[3], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_SAVE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_QUIT].ptr, false, false, 0);
}

static	void	show_help_safe		(int *action)
{
	GtkWidget		*separator [4];

	/* Data */
	button[BTN_SAVE].act	= action;
	button[BTN_QUIT].act	= action;

	/* Generate widgets */
	separator[0]		= gtk_hseparator_new();
	separator[1]		= gtk_hseparator_new();
	separator[2]		= gtk_hseparator_new();
	separator[3]		= gtk_hseparator_new();
	button[BTN_SAVE].ptr	= gtk_button_new_with_label(button[BTN_SAVE].text);
	button[BTN_QUIT].ptr	= gtk_button_new_with_label(button[BTN_QUIT].text);

	/* Events */
	g_signal_connect(button[BTN_SAVE].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_SAVE]);
	g_signal_connect(button[BTN_QUIT].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_QUIT]);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[0], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[1], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[2], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[3], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_SAVE].ptr, false, false, 0);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_QUIT].ptr, false, false, 0);
}

static	void	show_help_gameover	(int *action)
{
	GtkWidget		*separator [5];

	/* Data */
	button[BTN_QUIT].act	= action;

	/* Generate widgets */
	separator[0]		= gtk_hseparator_new();
	separator[1]		= gtk_hseparator_new();
	separator[2]		= gtk_hseparator_new();
	separator[3]		= gtk_hseparator_new();
	separator[4]		= gtk_hseparator_new();
	button[BTN_QUIT].ptr	= gtk_button_new_with_label(button[BTN_QUIT].text);

	/* Events */
	g_signal_connect(button[BTN_QUIT].ptr, "clicked",
			G_CALLBACK(callback_button), (void *)&button[BTN_QUIT]);

	/* Box */
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[0], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[1], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[2], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[3], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), separator[4], false, false, 25);
	gtk_box_pack_start(GTK_BOX(box_help_in), button[BTN_QUIT].ptr, false, false, 0);
}


/******************************************************************************
 ******* end of file **********************************************************
 ******************************************************************************/
