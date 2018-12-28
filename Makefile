#!/usr/bin/make -f

VERSION		= 4
PATCHLEVEL	= ~b1
SUBLEVEL	= 
EXTRAVERSION	=
NAME		= graphic

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
PROGRAMVERSION	= $(VERSION)$(if $(PATCHLEVEL),$(PATCHLEVEL)$(if $(SUBLEVEL),$(SUBLEVEL)))$(EXTRAVERSION)
export	PROGRAMVERSION

################################################################################
OS	= linux
TST	= false
DBG	= false

export	OS
export	TST
export	DBG

################################################################################
# directories

MAIN_DIR	= $(CURDIR)

LIBALX_DIR	= $(CURDIR)/libalx/
MODULES_DIR	= $(CURDIR)/modules/
TMP_DIR		= $(CURDIR)/tmp/
BIN_DIR		= $(CURDIR)/bin/

export	MAIN_DIR
export	LIBALX_DIR
export	MODULES_DIR

# FIXME: Set local or not local when building a package
ifeq ($(OS), linux)
  INSTALL_BIN_DIR	= /usr/local/games/
#  INSTALL_BIN_DIR	= /usr/games/
  INSTALL_SHARE_DIR	= /usr/local/share/
#  INSTALL_SHARE_DIR	= /usr/share/
  SHARE_DIR		= mine-sweeper/
  INSTALL_VAR_DIR	= /var/local/
#  INSTALL_VAR_DIR	= /var/games/
  VAR_DIR		= mine-sweeper/
else ifeq ($(OS), win)
  INSTALL_DIR		= c:/Program files (x86)/
  INSTALL_SHARE_DIR	= $(INSTALL_DIR)/mine-sweeper/
  SHARE_DIR		= share/
  INSTALL_VAR_DIR	= $(INSTALL_DIR)/mine-sweeper/
  VAR_DIR		= var/
endif

export	INSTALL_DIR
export	INSTALL_SHARE_DIR
export	SHARE_DIR

################################################################################
# executables

ifeq ($(OS), linux)
  BIN_NAME	= mine-sweeper
else ifeq ($(OS), win)
  BIN_NAME	= mine-sweeper.exe
endif

export	BIN_NAME

################################################################################
# Make variables (CC, etc...)
  CC		= gcc
  AS		= as
  LD		= ld

export	CC
export	AS
export	LD

################################################################################
# cflags
CFLAGS_STD	= -std=c11

CFLAGS_OPT	= -O3
CFLAGS_OPT     += -march=native

CFLAGS_W	= -Wall
CFLAGS_W       += -Werror
CFLAGS_W       += -Wno-format-truncation
CFLAGS_W       += -Wno-format-zero-length
CFLAGS_W       += -Wno-unused-function

CFLAGS_PKG	= `pkg-config --cflags ncurses`
CFLAGS_PKG     += `pkg-config --cflags gtk+-2.0`

CFLAGS_D	= -D PROG_VERSION=\"$(PROGRAMVERSION)\"
CFLAGS_D       += -D INSTALL_SHARE_DIR=\"$(INSTALL_SHARE_DIR)\"
CFLAGS_D       += -D SHARE_DIR=\"$(SHARE_DIR)\"
CFLAGS_D       += -D INSTALL_VAR_DIR=\"$(INSTALL_VAR_DIR)\"
CFLAGS_D       += -D VAR_DIR=\"$(VAR_DIR)\"

ifeq ($(OS), linux)
  CFLAGS_D     += -D OS_LINUX
else ifeq ($(OS), win)
  CFLAGS_D     += -D OS_WIN
endif

CFLAGS		= $(CFLAGS_STD)
CFLAGS         += $(CFLAGS_OPT)
CFLAGS         += $(CFLAGS_W)
CFLAGS         += $(CFLAGS_PKG)
CFLAGS         += $(CFLAGS_D)

export	CFLAGS

################################################################################
# libs
LIBS_STATIC	= -static

LIBS_STD	= -l m

LIBS_PKG	= `pkg-config --libs ncurses`
LIBS_PKG       += `pkg-config --libs gtk+-2.0`

ifeq ($(OS), linux)
  LIBS		= $(LIBS_STD) $(LIBS_PKG)
else ifeq ($(OS), win)
  LIBS		= $(LIBS_STD) $(LIBS_STATIC) $(LIBS_PKG)
endif

export	LIBS

################################################################################
# target: dependencies
#	action

# That's the default target when none is given on the command line
PHONY := all
all: binary


PHONY += libalx
libalx:
	@echo	'	MAKE	libalx'
	$(Q)$(MAKE) base	-C $(LIBALX_DIR)
	$(Q)$(MAKE) io		-C $(LIBALX_DIR)
	$(Q)$(MAKE) curses	-C $(LIBALX_DIR)

PHONY += modules
modules: libalx
	@echo	'	MAKE	modules'
	$(Q)$(MAKE) -C $(MODULES_DIR)

PHONY += object
object: modules libalx
	@echo	'	MAKE	obj'
	$(Q)$(MAKE) -C $(TMP_DIR)

PHONY += binary
binary: object
	@echo	'	MAKE	bin'
	$(Q)$(MAKE) -C $(BIN_DIR)

PHONY += install
install: uninstall
	@echo	"Create $(INSTALL_BIN_DIR)/"
	$(Q)mkdir -p		$(DESTDIR)/$(INSTALL_BIN_DIR)/
	@echo	"Copy $(BIN_NAME)"
	$(Q)cp			$(BIN_DIR)/$(BIN_NAME)	$(DESTDIR)/$(INSTALL_BIN_DIR)/
	@echo
	
	@echo	"Create $(INSTALL_SHARE_DIR)/$(SHARE_DIR)/"
	$(Q)mkdir -p		$(DESTDIR)/$(INSTALL_SHARE_DIR)/$(SHARE_DIR)/
	@echo	"Copy share/*"
	$(Q)cp -r		./share/*		$(DESTDIR)/$(INSTALL_SHARE_DIR)/$(SHARE_DIR)/
	
	@echo	"Create $(INSTALL_VAR_DIR)/$(VAR_DIR)/"
	$(Q)mkdir -p		$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/
	$(Q)mkdir		$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/boards_beginner/
	$(Q)mkdir		$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/boards_intermediate/
	$(Q)mkdir		$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/boards_expert/
	$(Q)mkdir		$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/boards_custom/
	@echo	"Copy var/*"
	$(Q)cp -r		./var/*			$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/
	@echo	"Change owner"
	$(Q)chown root:games -R	$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/
	@echo	"Change permissions"
	$(Q)chmod 664 -R	$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/
	$(Q)chmod +X -R		$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/
	@echo
	
	@echo	"Done"
	@echo

PHONY += uninstall
uninstall:
	@echo	"Clean old installations"
	$(Q)rm -f	$(DESTDIR)/$(INSTALL_BIN_DIR)/$(BIN_NAME)
	$(Q)rm -f -r	$(DESTDIR)/$(INSTALL_SHARE_DIR)/$(SHARE_DIR)/
	$(Q)rm -f -r	$(DESTDIR)/$(INSTALL_VAR_DIR)/$(VAR_DIR)/
	@echo

PHONY += clean
clean:
	@echo	'	CLEAN	modules'
	$(Q)$(MAKE) clean	-C $(MODULES_DIR)
	@echo	'	CLEAN	tmp'
	$(Q)$(MAKE) clean	-C $(TMP_DIR)
	@echo	'	CLEAN	bin'
	$(Q)$(MAKE) clean	-C $(BIN_DIR)

PHONY += mrproper
mrproper: clean
	@echo	'	CLEAN	libalx'
	$(Q)$(MAKE) clean	-C $(LIBALX_DIR)

PHONY += help
help:
	@echo  'Cleaning targets:'
	@echo  '  clean		  - Remove all object files, but keep the binary'
	@echo  '  mrproper	  - Remove all generated files'
	@echo  ''
	@echo  'Other generic targets:'
	@echo  '  all		  - Build all targets marked with [*]'
	@echo  '* libalx	  - Build the libalx library'
	@echo  '* modules	  - Build all modules'
	@echo  '* object	  - Build the main object'
	@echo  '* binary	  - Build the binary'
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
