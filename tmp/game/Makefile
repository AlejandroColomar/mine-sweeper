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
		core.o							\
		iface.o

CORE_INC	=							\
		$(INC_DIR)/mine-sweeper/game/core.h			\
		$(LIBALX_INC_DIR)/libalx/base/stdlib/seed_mix.h		\
		$(INC_DIR)/mine-sweeper/save/save.h
CORE_SRC	=							\
		$(SRC_DIR)/game/core.c

IFACE_INC	=							\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(LIBALX_INC_DIR)/libalx/base/stdlib/seed_mix.h		\
		$(INC_DIR)/mine-sweeper/game/core.h			\
		$(INC_DIR)/mine-sweeper/player/iface.h			\
		$(INC_DIR)/mine-sweeper/save/save.h			\
		$(INC_DIR)/mine-sweeper/save/score.h			\
		$(INC_DIR)/mine-sweeper/xyzzy/xyzzy.h
IFACE_SRC	=							\
		$(SRC_DIR)/game/iface.c

################################################################################
# target: dependencies
#	action

PHONY := all
all: $(OBJ)


core.s: $(CORE_SRC) $(CORE_INC)
	@echo	"	CC	mine-sweeper/game/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
core.o: core.s
	@echo	"	AS	mine-sweeper/game/$@"
	$(Q)$(AS) $< -o $@

iface.s: $(IFACE_SRC) $(IFACE_INC)
	@echo	"	CC	mine-sweeper/game/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
iface.o: iface.s
	@echo	"	AS	mine-sweeper/game/$@"
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
