# -*- MakeFile -*-

# MACRO = substitute with this

# directories

ABOUT_DIR = $(MODULES_DIR)/about/
CTRL_DIR = $(MODULES_DIR)/ctrl/
GAME_DIR = $(MODULES_DIR)/game/
MENU_DIR = $(MODULES_DIR)/menu/
PLAY_DIR = $(MODULES_DIR)/player/
SAVE_DIR = $(MODULES_DIR)/save/
XYZZY_DIR = $(MODULES_DIR)/xyzzy/

TMP_DIR = $(MODULES_DIR)/tmp/

export	ABOUT_DIR
export	CTRL_DIR
export	GAME_DIR
export	MENU_DIR
export	PLAY_DIR
export	SAVE_DIR
export	XYZZY_DIR

# dependencies


# target: dependencies
#	action

PHONY := all
all:
	@echo	'	MAKE	modules:	about'
	$(Q)$(MAKE) -C $(ABOUT_DIR)
	@echo	'	MAKE	modules:	ctrl'
	$(Q)$(MAKE) -C $(CTRL_DIR)
	@echo	'	MAKE	modules:	game'
	$(Q)$(MAKE) -C $(GAME_DIR)
	@echo	'	MAKE	modules:	menu'
	$(Q)$(MAKE) -C $(MENU_DIR)
	@echo	'	MAKE	modules:	play'
	$(Q)$(MAKE) -C $(PLAY_DIR)
	@echo	'	MAKE	modules:	save'
	$(Q)$(MAKE) -C $(SAVE_DIR)
	@echo	'	MAKE	modules:	xyzzy'
	$(Q)$(MAKE) -C $(XYZZY_DIR)
	@echo	'	MAKE	modules:	tmp'
	$(Q)$(MAKE) -C $(TMP_DIR)


PHONY += clean
clean:
	@echo	'	RM	*.o *.s *.a'
	$(Q)find . -type f -name '*.o' -exec rm '{}' '+'
	$(Q)find . -type f -name '*.s' -exec rm '{}' '+'
	$(Q)find . -type f -name '*.a' -exec rm '{}' '+'

################################################################################
# Declare the contents of the .PHONY variable as phony.
.PHONY: $(PHONY)




################################################################################
######## End of file ###########################################################
################################################################################
