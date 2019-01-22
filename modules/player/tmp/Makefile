# -*- MakeFile -*-

# MACRO = substitute with this

# directories

LIBALX_INC_DIR	= $(LIBALX_DIR)/inc/

GAME_INC_DIR	= $(GAME_DIR)/inc/
MENU_INC_DIR	= $(MENU_DIR)/inc/

INC_DIR	= $(PLAY_DIR)/inc/
SRC_DIR	= $(PLAY_DIR)/src/

# dependencies

_ALL	= player_iface.o player_clui.o player_tui.o player_gui.o
ALL	= $(_ALL) player_mod.o

PLAYI_INC_GAME		= game_iface.h
PLAYI_INC		= player_iface.h	player_clui.h player_tui.h player_gui.h
PLAYI_DEPS		= $(SRC_DIR)/player_iface.c \
				$(patsubst %,$(INC_DIR)/%,$(PLAYI_INC)) \
				$(patsubst %,$(GAME_INC_DIR)/%,$(PLAYI_INC_GAME))
PLAYI_INC_DIRS		= -I $(INC_DIR) \
				-I $(GAME_INC_DIR)

PLAYCLUI_INC_GAME	= game_iface.h
PLAYCLUI_INC		= player_clui.h	player_iface.h
PLAYCLUI_DEPS		= $(SRC_DIR)/player_clui.c \
				$(patsubst %,$(INC_DIR)/%,$(PLAYCLUI_INC)) \
				$(patsubst %,$(GAME_INC_DIR)/%,$(PLAYCLUI_INC_GAME))
PLAYCLUI_INC_DIRS	= -I $(INC_DIR) \
				-I $(GAME_INC_DIR)

PLAYTUI_INC_LIBALX	= libalx/curses/alx_ncur.h
PLAYTUI_INC_GAME	= game_iface.h
PLAYTUI_INC		= player_tui.h	player_iface.h
PLAYTUI_DEPS		= $(SRC_DIR)/player_tui.c \
				$(patsubst %,$(INC_DIR)/%,$(PLAYTUI_INC)) \
				$(patsubst %,$(LIBALX_INC_DIR)/%,$(PLAYTUI_INC_LIBALX)) \
				$(patsubst %,$(GAME_INC_DIR)/%,$(PLAYTUI_INC_GAME))
PLAYTUI_INC_DIRS	= -I $(INC_DIR) \
				-I $(LIBALX_INC_DIR) \
				-I $(GAME_INC_DIR)

PLAYGUI_INC_LIBALX	= libalx/io/alx_input.h
PLAYGUI_INC_GAME	= game_iface.h
PLAYGUI_INC_MENU	= menu_gui.h
PLAYGUI_INC		= player_gui.h	player_iface.h
PLAYGUI_DEPS		= $(SRC_DIR)/player_gui.c \
				$(patsubst %,$(INC_DIR)/%,$(PLAYGUI_INC)) \
				$(patsubst %,$(LIBALX_INC_DIR)/%,$(PLAYGUI_INC_LIBALX)) \
				$(patsubst %,$(GAME_INC_DIR)/%,$(PLAYGUI_INC_GAME)) \
				$(patsubst %,$(MENU_INC_DIR)/%,$(PLAYGUI_INC_MENU))
PLAYGUI_INC_DIRS	= -I $(INC_DIR) \
				-I $(LIBALX_INC_DIR) \
				-I $(GAME_INC_DIR) \
				-I $(MENU_INC_DIR)

# target: dependencies
#	action

all: $(ALL)


player_mod.o: $(_ALL)
	@echo	"	LD	$@"
	$(Q)$(LD) -r $^ -o $@


player_iface.s: $(PLAYI_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(PLAYI_INC_DIRS) -S $< -o $@
player_iface.o: player_iface.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@

player_clui.s: $(PLAYCLUI_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(PLAYCLUI_INC_DIRS) -S $< -o $@
player_clui.o: player_clui.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@

player_tui.s: $(PLAYTUI_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(PLAYTUI_INC_DIRS) -S $< -o $@
player_tui.o: player_tui.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@

player_gui.s: $(PLAYGUI_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(PLAYGUI_INC_DIRS) -S $< -o $@
player_gui.o: player_gui.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@


clean:
	$(Q)rm -f *.o *.s
