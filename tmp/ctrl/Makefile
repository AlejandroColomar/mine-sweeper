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
		start.o

START_INC	=							\
		$(INC_DIR)/mine-sweeper/ctrl/start.h			\
		$(INC_DIR)/mine-sweeper/game/core.h			\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(INC_DIR)/mine-sweeper/menu/iface.h			\
		$(INC_DIR)/mine-sweeper/player/iface.h
START_SRC	=							\
		$(SRC_DIR)/ctrl/start.c

################################################################################
# target: dependencies
#	action

PHONY := all
all: $(OBJ)


start.s: $(START_SRC) $(START_INC)
	@echo	"	CC	mine-sweeper/ctrl/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
start.o: start.s
	@echo	"	AS	mine-sweeper/ctrl/$@"
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
