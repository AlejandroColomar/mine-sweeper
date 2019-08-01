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
		save.o							\
		score.o

SAVE_INC	=							\
		$(INC_DIR)/mine-sweeper/save/save.h			\
		$(LIBALX_INC_DIR)/libalx/base/errno/error.h		\
		$(LIBALX_INC_DIR)/libalx/base/stdio/seekc.h		\
		$(INC_DIR)/mine-sweeper/game/core.h			\
		$(INC_DIR)/mine-sweeper/player/iface.h
SAVE_SRC	=							\
		$(SRC_DIR)/save/save.c

SCORE_INC	=							\
		$(INC_DIR)/mine-sweeper/save/score.h			\
		$(LIBALX_INC_DIR)/libalx/base/compiler/size.h		\
		$(LIBALX_INC_DIR)/libalx/base/errno/error.h		\
		$(LIBALX_INC_DIR)/libalx/base/stdio/seekc.h		\
		$(INC_DIR)/mine-sweeper/game/core.h			\
		$(INC_DIR)/mine-sweeper/game/iface.h			\
		$(INC_DIR)/mine-sweeper/player/iface.h
SCORE_SRC	=							\
		$(SRC_DIR)/save/score.c

################################################################################
# target: dependencies
#	action

PHONY := all
all: $(OBJ)


save.s: $(SAVE_SRC) $(SAVE_INC)
	@echo	"	CC	mine-sweeper/save/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
save.o: save.s
	@echo	"	AS	mine-sweeper/save/$@"
	$(Q)$(AS) $< -o $@

score.s: $(SCORE_SRC) $(SCORE_INC)
	@echo	"	CC	mine-sweeper/save/$@"
	$(Q)$(CC) $(CFLAGS) -S $< -o $@
score.o: score.s
	@echo	"	AS	mine-sweeper/save/$@"
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
