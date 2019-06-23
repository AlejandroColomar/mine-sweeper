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
		xyzzy.o

XYZZY_INC	=							\
		$(INC_DIR)/mine-sweeper/xyzzy/xyzzy.h			\
		$(INC_DIR)/mine-sweeper/game/iface.h
XYZZY_SRC	=							\
		$(SRC_DIR)/xyzzy/xyzzy.c

################################################################################
# target: dependencies
#	action

PHONY := all
all: $(OBJ)


xyzzy.s: $(XYZZY_SRC) $(XYZZY_INC)
	@echo	"	CC	mine-sweeper/xyzzy/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
xyzzy.o: xyzzy.s
	@echo	"	AS	mine-sweeper/xyzzy/$@"
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
