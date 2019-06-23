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
		about.o

ABOUT_INC	=							\
		$(INC_DIR)/mine-sweeper/about/about.h			\
		$(LIBALX_INC_DIR)/libalx/base/errno/perror.h		\
		$(LIBALX_INC_DIR)/libalx/base/stddef/size.h
ABOUT_SRC	=							\
		$(SRC_DIR)/about/about.c

################################################################################
# target: dependencies
#	action

PHONY := all
all: $(OBJ)


about.s: $(ABOUT_SRC) $(ABOUT_INC)
	@echo	"	CC	mine-sweeper/about/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
about.o: about.s
	@echo	"	AS	mine-sweeper/about/$@"
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
