# -*- MakeFile -*-

# MACRO = substitute with this

# directories

ABOUT_TMP_DIR	= $(ABOUT_DIR)/tmp/
CTRL_TMP_DIR	= $(CTRL_DIR)/tmp/
GAME_TMP_DIR	= $(GAME_DIR)/tmp/
MENU_TMP_DIR	= $(MENU_DIR)/tmp/
PLAY_TMP_DIR	= $(PLAY_DIR)/tmp/
SAVE_TMP_DIR	= $(SAVE_DIR)/tmp/
XYZZY_TMP_DIR	= $(XYZZY_DIR)/tmp/

# dependencies

ALL = modules.o

MODS_OBJ_ABOUT	= about_mod.o
MODS_OBJ_CTRL	= ctrl_mod.o
MODS_OBJ_GAME	= game_mod.o
MODS_OBJ_MENU	= menu_mod.o
MODS_OBJ_PLAY	= player_mod.o
MODS_OBJ_SAVE	= save_mod.o
MODS_OBJ_XYZZY	= xyzzy_mod.o
MODS_OBJS	= $(patsubst %,$(ABOUT_TMP_DIR)/%,$(MODS_OBJ_ABOUT)) \
			$(patsubst %,$(CTRL_TMP_DIR)/%,$(MODS_OBJ_CTRL)) \
			$(patsubst %,$(GAME_TMP_DIR)/%,$(MODS_OBJ_GAME)) \
			$(patsubst %,$(MENU_TMP_DIR)/%,$(MODS_OBJ_MENU)) \
			$(patsubst %,$(PLAY_TMP_DIR)/%,$(MODS_OBJ_PLAY)) \
			$(patsubst %,$(SAVE_TMP_DIR)/%,$(MODS_OBJ_SAVE)) \
			$(patsubst %,$(XYZZY_TMP_DIR)/%,$(MODS_OBJ_XYZZY))

# target: dependencies
#	action

all: $(ALL)


modules.o: $(MODS_OBJS)
	$(Q)$(LD) -r $^ -o $@
	@echo  "	LD	$@"
	@echo  ""


clean:
	$(Q)rm -f *.o
