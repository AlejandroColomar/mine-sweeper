#! /usr/bin/make -f

# MACRO = substitute with this

# directories

OBJS		=							\
		$(TMP_DIR)/main.o					\
		$(TMP_DIR)/about/about.o				\
		$(TMP_DIR)/ctrl/start.o					\
		$(TMP_DIR)/game/core.o					\
		$(TMP_DIR)/game/iface.o					\
		$(TMP_DIR)/menu/parser.o				\
		$(TMP_DIR)/menu/clui.o					\
		$(TMP_DIR)/menu/tui.o					\
		$(TMP_DIR)/menu/iface.o					\
		$(TMP_DIR)/player/clui.o				\
		$(TMP_DIR)/player/tui.o					\
		$(TMP_DIR)/player/iface.o				\
		$(TMP_DIR)/save/save.o					\
		$(TMP_DIR)/save/score.o					\
		$(TMP_DIR)/xyzzy/xyzzy.o

ALL	= $(BIN_NAME) size


# target: dependencies
#	action

PHONY := all
all: $(ALL)


$(BIN_NAME): $(OBJS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(OBJS) -o $@ $(LIBS)

size: $(BIN_NAME)
	@echo	"	SZ	$(BIN_NAME)"
	$(Q)$(SZ) $(BIN_NAME)


clean:
	@echo	"	RM	$(ALL)"
	$(Q)rm -f	$(ALL)

################################################################################
# Declare the contents of the .PHONY variable as phony.
.PHONY: $(PHONY)

################################################################################
######## End of file ###########################################################
################################################################################
