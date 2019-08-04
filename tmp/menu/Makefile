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
		parser.o						\
		clui.o							\
		tui.o							\
		iface.o

PARSER_INC	=							\
		$(INC_DIR)/mine-sweeper/menu/parser.h			\
		$(INC_DIR)/mine-sweeper/about/about.h			\
		$(INC_DIR)/mine-sweeper/ctrl/start.h			\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(INC_DIR)/mine-sweeper/menu/iface.h			\
		$(INC_DIR)/mine-sweeper/player/iface.h			\
		$(INC_DIR)/mine-sweeper/save/save.h
PARSER_SRC	=							\
		$(SRC_DIR)/menu/parser.c

CLUI_INC	=							\
		$(INC_DIR)/mine-sweeper/menu/clui.h			\
		$(INC_DIR)/mine-sweeper/about/about.h			\
		$(INC_DIR)/mine-sweeper/ctrl/start.h			\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(INC_DIR)/mine-sweeper/menu/iface.h			\
		$(INC_DIR)/mine-sweeper/save/save.h
CLUI_SRC	=							\
		$(SRC_DIR)/menu/clui.c

TUI_INC		=							\
		$(INC_DIR)/mine-sweeper/menu/tui.h			\
		$(INC_DIR)/mine-sweeper/about/about.h			\
		$(INC_DIR)/mine-sweeper/ctrl/start.h			\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(INC_DIR)/mine-sweeper/menu/iface.h			\
		$(INC_DIR)/mine-sweeper/save/save.h			\
		$(INC_DIR)/mine-sweeper/save/score.h
TUI_SRC		=							\
		$(SRC_DIR)/menu/tui.c

IFACE_INC	=							\
		$(INC_DIR)/mine-sweeper/menu/iface.h			\
		$(INC_DIR)/mine-sweeper/ctrl/start.h			\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(INC_DIR)/mine-sweeper/menu/clui.h			\
		$(INC_DIR)/mine-sweeper/menu/tui.h
IFACE_SRC	=							\
		$(SRC_DIR)/menu/iface.c

################################################################################
# target: dependencies
#	action

PHONY := all
all: $(OBJ)


parser.s: $(PARSER_SRC) $(PARSER_INC)
	@echo	"	CC	mine-sweeper/menu/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
parser.o: parser.s
	@echo	"	AS	mine-sweeper/menu/$@"
	$(Q)$(AS) $< -o $@

clui.s: $(CLUI_SRC) $(CLUI_INC)
	@echo	"	CC	mine-sweeper/menu/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
clui.o: clui.s
	@echo	"	AS	mine-sweeper/menu/$@"
	$(Q)$(AS) $< -o $@

tui.s: $(TUI_SRC) $(TUI_INC)
	@echo	"	CC	mine-sweeper/menu/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
tui.o: tui.s
	@echo	"	AS	mine-sweeper/menu/$@"
	$(Q)$(AS) $< -o $@

iface.s: $(IFACE_SRC) $(IFACE_INC)
	@echo	"	CC	mine-sweeper/menu/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
iface.o: iface.s
	@echo	"	AS	mine-sweeper/menu/$@"
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
