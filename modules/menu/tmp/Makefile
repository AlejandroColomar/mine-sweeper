# -*- MakeFile -*-

# MACRO = substitute with this

# directories

LIBALX_INC_DIR	= $(LIBALX_DIR)/inc/

ABOUT_INC_DIR	= $(ABOUT_DIR)/inc/
CTRL_INC_DIR	= $(CTRL_DIR)/inc/
GAME_INC_DIR	= $(GAME_DIR)/inc/
PLAY_INC_DIR	= $(PLAY_DIR)/inc/
SAVE_INC_DIR	= $(SAVE_DIR)/inc/

INC_DIR	= $(MENU_DIR)/inc/
SRC_DIR	= $(MENU_DIR)/src/

# dependencies

_ALL	= parser.o menu_iface.o menu_clui.o menu_tui.o menu_gui.o
ALL	= $(_ALL) menu_mod.o

PARS_INC_LIBALX		= libalx/alx_seed.h
PARS_INC_ABOUT		= about.h
PARS_INC_CTRL		= start.h
PARS_INC_GAME		= game_iface.h
PARS_INC_PLAY		= player_iface.h
PARS_INC_SAVE		= save.h
PARS_INC		= parser.h	menu_iface.h
PARS_DEPS	= $(SRC_DIR)/parser.c \
			$(patsubst %,$(INC_DIR)/%,$(PARS_INC)) \
			$(patsubst %,$(LIBALX_INC_DIR)/%,$(PARS_INC_LIBALX)) \
			$(patsubst %,$(ABOUT_INC_DIR)/%,$(PARS_INC_ABOUT)) \
			$(patsubst %,$(CTRL_INC_DIR)/%,$(PARS_INC_CTRL)) \
			$(patsubst %,$(GAME_INC_DIR)/%,$(PARS_INC_GAME)) \
			$(patsubst %,$(PLAY_INC_DIR)/%,$(PARS_INC_PLAY)) \
			$(patsubst %,$(SAVE_INC_DIR)/%,$(PARS_INC_SAVE))
PARS_INC_DIRS	= -I $(INC_DIR) \
			-I $(LIBALX_INC_DIR) \
			-I $(ABOUT_INC_DIR) \
			-I $(CTRL_INC_DIR) \
			-I $(GAME_INC_DIR) \
			-I $(PLAY_INC_DIR) \
			-I $(SAVE_INC_DIR)

MENUI_INC_CTRL		= start.h
MENUI_INC_GAME		= game_iface.h
MENUI_INC		= menu_iface.h	menu_clui.h menu_tui.h menu_gui.h
MENUI_DEPS		= $(SRC_DIR)/menu_iface.c \
			$(patsubst %,$(INC_DIR)/%,$(MENUI_INC)) \
			$(patsubst %,$(CTRL_INC_DIR)/%,$(MENUI_INC_CTRL)) \
			$(patsubst %,$(GAME_INC_DIR)/%,$(MENUI_INC_GAME))
MENUI_INC_DIRS	= -I $(INC_DIR) \
			-I $(CTRL_INC_DIR) \
			-I $(GAME_INC_DIR)

MENUCLUI_INC_LIBALX	= libalx/alx_input.h
MENUCLUI_INC_ABOUT	= about.h
MENUCLUI_INC_CTRL	= start.h
MENUCLUI_INC_GAME	= game_iface.h
MENUCLUI_INC_SAVE	= save.h
MENUCLUI_INC		= menu_clui.h	menu_iface.h
MENUCLUI_DEPS	= $(SRC_DIR)/menu_clui.c \
			$(patsubst %,$(INC_DIR)/%,$(MENUCLUI_INC)) \
			$(patsubst %,$(LIBALX_INC_DIR)/%,$(MENUCLUI_INC_LIBALX)) \
			$(patsubst %,$(ABOUT_INC_DIR)/%,$(MENUCLUI_INC_ABOUT)) \
			$(patsubst %,$(GAME_INC_DIR)/%,$(MENUCLUI_INC_GAME)) \
			$(patsubst %,$(CTRL_INC_DIR)/%,$(MENUCLUI_INC_CTRL)) \
			$(patsubst %,$(SAVE_INC_DIR)/%,$(MENUCLUI_INC_SAVE))
MENUCLUI_INC_DIRS	= -I $(INC_DIR) \
			-I $(LIBALX_INC_DIR) \
			-I $(ABOUT_INC_DIR) \
			-I $(CTRL_INC_DIR) \
			-I $(GAME_INC_DIR) \
			-I $(SAVE_INC_DIR)

MENUTUI_INC_LIBALX	= libalx/alx_ncur.h
MENUTUI_INC_ABOUT	= about.h
MENUTUI_INC_CTRL	= start.h
MENUTUI_INC_GAME	= game_iface.h
MENUTUI_INC_SAVE	= save.h score.h
MENUTUI_INC		= menu_tui.h	menu_iface.h
MENUTUI_DEPS	= $(SRC_DIR)/menu_tui.c \
			$(patsubst %,$(INC_DIR)/%,$(MENUTUI_INC)) \
			$(patsubst %,$(LIBALX_INC_DIR)/%,$(MENUTUI_INC_LIBALX)) \
			$(patsubst %,$(ABOUT_INC_DIR)/%,$(MENUTUI_INC_ABOUT)) \
			$(patsubst %,$(GAME_INC_DIR)/%,$(MENUTUI_INC_GAME)) \
			$(patsubst %,$(CTRL_INC_DIR)/%,$(MENUTUI_INC_CTRL)) \
			$(patsubst %,$(SAVE_INC_DIR)/%,$(MENUTUI_INC_SAVE))
MENUTUI_INC_DIRS	= -I $(INC_DIR) \
			-I $(LIBALX_INC_DIR) \
			-I $(ABOUT_INC_DIR) \
			-I $(CTRL_INC_DIR) \
			-I $(GAME_INC_DIR) \
			-I $(SAVE_INC_DIR)

MENUGUI_INC_LIBALX	= libalx/alx_input.h
MENUGUI_INC_ABOUT	= about.h
MENUGUI_INC_CTRL	= start.h
MENUGUI_INC_GAME	= game_iface.h
MENUGUI_INC_SAVE	= save.h score.h
MENUGUI_INC		= menu_gui.h	menu_iface.h
MENUGUI_DEPS	= $(SRC_DIR)/menu_gui.c \
			$(patsubst %,$(INC_DIR)/%,$(MENUGUI_INC)) \
			$(patsubst %,$(LIBALX_INC_DIR)/%,$(MENUGUI_INC_LIBALX)) \
			$(patsubst %,$(ABOUT_INC_DIR)/%,$(MENUGUI_INC_ABOUT)) \
			$(patsubst %,$(GAME_INC_DIR)/%,$(MENUGUI_INC_GAME)) \
			$(patsubst %,$(CTRL_INC_DIR)/%,$(MENUGUI_INC_CTRL)) \
			$(patsubst %,$(SAVE_INC_DIR)/%,$(MENUGUI_INC_SAVE))
MENUGUI_INC_DIRS	= -I $(INC_DIR) \
			-I $(LIBALX_INC_DIR) \
			-I $(ABOUT_INC_DIR) \
			-I $(CTRL_INC_DIR) \
			-I $(GAME_INC_DIR) \
			-I $(SAVE_INC_DIR)

# target: dependencies
#	action

all: $(ALL)


menu_mod.o: $(_ALL)
	@echo	"	LD	$@"
	$(Q)$(LD) -r $^ -o $@


parser.s: $(PARS_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(PARS_INC_DIRS) -S $< -o $@
parser.o: parser.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@

menu_iface.s: $(MENUI_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(MENUI_INC_DIRS) -S $< -o $@
menu_iface.o: menu_iface.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@

menu_clui.s: $(MENUCLUI_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(MENUCLUI_INC_DIRS) -S $< -o $@
menu_clui.o: menu_clui.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@

menu_tui.s: $(MENUTUI_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(MENUTUI_INC_DIRS) -S $< -o $@
menu_tui.o: menu_tui.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@

menu_gui.s: $(MENUGUI_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(MENUGUI_INC_DIRS) -S $< -o $@
menu_gui.o: menu_gui.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@


clean:
	$(Q)rm -f *.o *.s
