#! /usr/bin/make -f

################################################################################
# Copyright (C) 2019	Alejandro Colomar Andrés
# SPDX-License-Identifier:	GPL-2.0-only
################################################################################
# *AUTHOR*
# FULL NAME	"Alejandro Colomar Andrés"
# EMAIL		"1903716@gmail.com"
################################################################################

################################################################################
# dependencies

OBJ		=							\
		main.o

MAIN_INC	=							\
		$(INC_DIR)/mine-sweeper/about/about.h			\
		$(INC_DIR)/mine-sweeper/ctrl/start.h			\
		$(INC_DIR)/mine-sweeper/game/core.h			\
		$(INC_DIR)/mine-sweeper/menu/iface.h			\
		$(INC_DIR)/mine-sweeper/menu/parser.h			\
		$(INC_DIR)/mine-sweeper/player/iface.h			\
		$(INC_DIR)/mine-sweeper/save/save.h			\
		$(INC_DIR)/mine-sweeper/save/score.h
MAIN_SRC	=							\
		$(SRC_DIR)/main.c


# target: dependencies
#	action

PHONY := all
all: $(OBJ) about ctrl game menu player save xyzzy


PHONY += about
about:
	@echo	"	MAKE	tmp/$@"
	$(Q)$(MAKE)	-C $(TMP_DIR)/$@/

PHONY += ctrl
ctrl:
	@echo	"	MAKE	tmp/$@"
	$(Q)$(MAKE)	-C $(TMP_DIR)/$@/

PHONY += game
game:
	@echo	"	MAKE	tmp/$@"
	$(Q)$(MAKE)	-C $(TMP_DIR)/$@/

PHONY += menu
menu:
	@echo	"	MAKE	tmp/$@"
	$(Q)$(MAKE)	-C $(TMP_DIR)/$@/

PHONY += player
player:
	@echo	"	MAKE	tmp/$@"
	$(Q)$(MAKE)	-C $(TMP_DIR)/$@/

PHONY += save
save:
	@echo	"	MAKE	tmp/$@"
	$(Q)$(MAKE)	-C $(TMP_DIR)/$@/

PHONY += xyzzy
xyzzy:
	@echo	"	MAKE	tmp/$@"
	$(Q)$(MAKE)	-C $(TMP_DIR)/$@/


main.s: $(MAIN_SRC) $(MAIN_INC)
	@echo	"	CC	mine-sweeper/tmp/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
main.o: main.s
	@echo	"	AS	mine-sweeper/tmp/$@"
	$(Q)$(AS) $< -o $@


PHONY += clean
clean:
	@echo	"	RM	*.o *.s"
	$(Q)rm -f	*.o *.s

################################################################################
# Declare the contents of the .PHONY variable as phony.
.PHONY: $(PHONY)


################################################################################
######## End of file ###########################################################
################################################################################
