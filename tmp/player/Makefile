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
		clui.o							\
		tui.o							\
		iface.o

CLUI_INC	=							\
		$(INC_DIR)/mine-sweeper/player/clui.h			\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(INC_DIR)/mine-sweeper/player/iface.h
CLUI_SRC	=							\
		$(SRC_DIR)/player/clui.c

TUI_INC		=							\
		$(INC_DIR)/mine-sweeper/player/tui.h			\
		$(LIBALX_INC_DIR)/libalx/extra/ncurses/common.h		\
		$(LIBALX_INC_DIR)/libalx/extra/ncurses/get.h		\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(INC_DIR)/mine-sweeper/player/iface.h
TUI_SRC		=							\
		$(SRC_DIR)/player/tui.c

IFACE_INC	=							\
		$(INC_DIR)/mine-sweeper/player/iface.h			\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(INC_DIR)/mine-sweeper/player/clui.h			\
		$(INC_DIR)/mine-sweeper/player/tui.h
IFACE_SRC	=							\
		$(SRC_DIR)/player/iface.c

################################################################################
# target: dependencies
#	action

PHONY := all
all: $(OBJ)


clui.s: $(CLUI_SRC) $(CLUI_INC)
	@echo	"	CC	mine-sweeper/player/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
clui.o: clui.s
	@echo	"	AS	mine-sweeper/player/$@"
	$(Q)$(AS) $< -o $@

tui.s: $(TUI_SRC) $(TUI_INC)
	@echo	"	CC	mine-sweeper/player/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
tui.o: tui.s
	@echo	"	AS	mine-sweeper/player/$@"
	$(Q)$(AS) $< -o $@

iface.s: $(IFACE_SRC) $(IFACE_INC)
	@echo	"	CC	mine-sweeper/player/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
iface.o: iface.s
	@echo	"	AS	mine-sweeper/player/$@"
	$(Q)$(AS) $< -o $@


PHONY += clean
clean:
	@echo	"	RM	*.o *.s"
	$(Q)rm -f *.o *.s

################################################################################
# Declare the contents of the .PHONY variable as phony.
.PHONY: $(PHONY)


################################################################################
######## End of file ###########################################################
################################################################################
