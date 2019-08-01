#! /usr/bin/make -f

VERSION		= 5
PATCHLEVEL	= ~a1
SUBLEVEL	=
EXTRAVERSION	=
NAME		=

export	VERSION
export	PATCHLEVEL
export	SUBLEVEL

################################################################################
# *AUTHOR*

# EMAIL		"1903716@gmail.com"
# FULL NAME	"Alejandro Colomar Andrés"

################################################################################
# *DOCUMENTATION*
# To see a list of typical targets execute "make help"
# More info can be located in ./README.txt
# Comments in this file are targeted only to the developer, do not
# expect to learn how to build mine-sweeper reading this file.

################################################################################
# Beautify output
# ---------------------------------------------------------------------------
# Prefix commands with $(Q) - that's useful
# for commands that shall be hidden in non-verbose mode.
#
#	$(Q)some command here
#
# If BUILD_VERBOSE equals 0 then the above command will be hidden.
# If BUILD_VERBOSE equals 1 then the above command is displayed.
#
# To put more focus on warnings, be less verbose as default
# Use 'make V=1' to see the full commands

ifeq ("$(origin V)","command line")
  BUILD_VERBOSE = $(V)
endif
ifndef BUILD_VERBOSE
  BUILD_VERBOSE = 0
endif

ifeq ($(BUILD_VERBOSE), 1)
  Q =
else
  Q = @
endif

# If the user is running make -s (silent mode), suppress echoing of
# commands

ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
  Q = @
endif

export	Q
export	BUILD_VERBOSE

################################################################################
# Do not print "Entering directory ...",
# but we want to display it when entering to the output directory
# so that IDEs/editors are able to understand relative filenames.
MAKEFLAGS += --no-print-directory

################################################################################
PROGRAMVERSION	= $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
export	PROGRAMVERSION

################################################################################
# directories

MAIN_DIR	= $(CURDIR)

LIBALX_DIR	= $(CURDIR)/libalx/
LIBALX_INC_DIR	= $(LIBALX_DIR)/inc/
LIBALX_LIB_DIR	= $(LIBALX_DIR)/lib/libalx/

BIN_DIR		= $(CURDIR)/bin/
INC_DIR		= $(CURDIR)/inc/
SRC_DIR		= $(CURDIR)/src/
TMP_DIR		= $(CURDIR)/tmp/

export	MAIN_DIR
export	LIBALX_DIR
export	LIBALX_INC_DIR
export	LIBALX_LIB_DIR
export	BIN_DIR
export	INC_DIR
export	SRC_DIR
export	TMP_DIR

# FIXME: Set local or not local when building a package
INSTALL_BIN_DIR		= /usr/local/bin/
#INSTALL_BIN_DIR	= /usr/bin/
INSTALL_SHARE_DIR	= /usr/local/share/
#INSTALL_SHARE_DIR	= /usr/share/
INSTALL_VAR_DIR		= /var/local/
#INSTALL_VAR_DIR	= /var/lib/

################################################################################
# Make variables (CC, etc...)
CC	= gcc
AS	= as
AR	= ar
LD	= ld
SZ	= size --format=SysV

export	CC
export	AS
export	AR
export	LD
export	SZ

################################################################################
# cflags
CFLAGS_STD	= -std=c17
CFLAGS_STD     += -Wpedantic

CFLAGS_OPT	= -O3
CFLAGS_OPT     += -march=native
CFLAGS_OPT     += -flto

CFLAGS_W	= -Wall
CFLAGS_W       += -Wextra
CFLAGS_W       += -Wstrict-prototypes
CFLAGS_W       += -Werror
CFLAGS_W       += -Wno-error=format-truncation
#CFLAGS_W       += -Wno-error=unused-function
#CFLAGS_W       += -Wno-error=unused-parameter

CFLAGS_PKG	= `pkg-config --cflags ncurses`
CFLAGS_PKG     += -I $(LIBALX_INC_DIR)

CFLAGS_D	= -D _GNU_SOURCE
CFLAGS_D       += -D _POSIX_C_SOURCE=200809L
CFLAGS_D       += -D PROG_VERSION=\"$(PROGRAMVERSION)\"
CFLAGS_D       += -D INSTALL_SHARE_DIR=\"$(INSTALL_SHARE_DIR)\"
CFLAGS_D       += -D INSTALL_VAR_DIR=\"$(INSTALL_VAR_DIR)\"

CFLAGS_I	= -I $(INC_DIR)

CFLAGS		= $(CFLAGS_STD)
CFLAGS         += $(CFLAGS_OPT)
CFLAGS         += $(CFLAGS_W)
CFLAGS         += $(CFLAGS_PKG)
CFLAGS         += $(CFLAGS_D)
CFLAGS         += $(CFLAGS_I)

export	CFLAGS

################################################################################
# libs
LIBS_STD	= -l m

LIBS_OPT	= -O3
LIBS_OPT       += -march=native
LIBS_OPT       += -flto
LIBS_OPT       += -fuse-linker-plugin

LIBS_PKG	= `pkg-config --libs ncurses`

LIBS		= $(LIBS_STD)
LIBS           += $(LIBS_OPT)
LIBS           += $(LIBS_PKG)

export	LIBS

################################################################################
# executables

BIN_NAME	= mine-sweeper

export	BIN_NAME

################################################################################
# target: dependencies
#	action

# That's the default target when none is given on the command line
PHONY := all
all: bin


PHONY += libalx
libalx:
	@echo	"	MAKE	$@"
	$(Q)$(MAKE) base	-C $(LIBALX_DIR)
	$(Q)$(MAKE) ncurses	-C $(LIBALX_DIR)
	@echo

PHONY += tmp
tmp:
	@echo	"	MAKE	$@"
	$(Q)$(MAKE)	-C $(TMP_DIR)
	@echo

PHONY += bin
bin: tmp libalx
	@echo	"	MAKE	$@"
	$(Q)$(MAKE)	-C $(BIN_DIR)
	@echo

PHONY += install
install: uninstall
	@echo	"	Install:"
	@echo	"	MKDIR	$(DESTDIR)/$(INSTALL_BIN_DIR)/"
	$(Q)mkdir -p		$(DESTDIR)/$(INSTALL_BIN_DIR)/
	@echo	"	CP	$(BIN_NAME)"
	$(Q)cp -v		$(BIN_DIR)/$(BIN_NAME)	$(DESTDIR)/$(INSTALL_BIN_DIR)/
	@echo	"	MKDIR	$(DESTDIR)/$(INSTALL_SHARE_DIR)/mine-sweeper/"
	$(Q)mkdir -p		$(DESTDIR)/$(INSTALL_SHARE_DIR)/mine-sweeper/
	@echo	"	CP -r	share/mine-sweeper/*"
	$(Q)cp -r -v		./share/mine-sweeper/*	$(DESTDIR)/$(INSTALL_SHARE_DIR)/mine-sweeper/
	@echo	"	MKDIR	$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/"
	$(Q)mkdir -p		$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/
	$(Q)mkdir -p		$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/boards/beginner/
	$(Q)mkdir		$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/boards/intermediate/
	$(Q)mkdir		$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/boards/expert/
	$(Q)mkdir		$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/boards/custom/
	@echo	"	CP -rv	var/mine-sweeper/*"
	$(Q)cp -r -v		./var/mine-sweeper/*	$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/
	@echo	"	CHOWN	$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/"
	$(Q)chown root:games -R	$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/
	@echo	"	CHMOD	$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/"
	$(Q)chmod 664 -R	$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/
	$(Q)chmod +X -R		$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/
	@echo	"	Done"
	@echo

PHONY += uninstall
uninstall:
	@echo	"	Clean old installations:"
	@echo	"	RM	bin"
	$(Q)rm -f		$(DESTDIR)/$(INSTALL_BIN_DIR)/$(BIN_NAME)
	@echo	"	RM -r	$(DESTDIR)/$(INSTALL_SHARE_DIR)/mine-sweeper/"
	$(Q)rm -f -r		$(DESTDIR)/$(INSTALL_SHARE_DIR)/mine-sweeper/
	@echo	"	RM -r	$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/"
	$(Q)rm -f -r		$(DESTDIR)/$(INSTALL_VAR_DIR)/mine-sweeper/
	@echo	"	Done"
	@echo

PHONY += clean
clean:
	@echo	"	RM	*.o *.s *.a $(BIN_NAME)"
	$(Q)find $(TMP_DIR) -type f -name '*.o' -exec rm '{}' '+'
	$(Q)find $(TMP_DIR) -type f -name '*.s' -exec rm '{}' '+'
	$(Q)find $(BIN_DIR) -type f -name '*$(BIN_NAME)' -exec rm '{}' '+'

PHONY += distclean
distclean: clean
	@echo	'	CLEAN	libalx'
	$(Q)$(MAKE) clean	-C $(LIBALX_DIR)
	@echo

PHONY += help
help:
	@echo  'Cleaning targets:'
	@echo  '  clean		  - Remove all generated files'
	@echo  '  distclean	  - Remove all generated files (including libraries)'
	@echo  ''
	@echo  'Other generic targets:'
	@echo  '  all		  - Build all targets marked with [*]'
	@echo  '* libalx	  - Build the libalx library'
	@echo  '* tmp		  - Compile all files'
	@echo  '* bin		  - Build the binary'
	@echo  '  install	  - Install the program into the filesystem'
	@echo  '  uninstall	  - Uninstall the program off the filesystem'
	@echo  ''
	@echo  '  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
	@echo  ''
	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
	@echo  'For further info see the ./README file'

################################################################################
# Declare the contents of the .PHONY variable as phony.
.PHONY: $(PHONY)


################################################################################
######## End of file ###########################################################
################################################################################
