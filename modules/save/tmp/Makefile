# -*- MakeFile -*-

# MACRO = substitute with this

# directories

GAME_INC_DIR	= $(GAME_DIR)/inc/
PLAY_INC_DIR	= $(PLAY_DIR)/inc/

INC_DIR	= $(SAVE_DIR)/inc/
SRC_DIR	= $(SAVE_DIR)/src/

# dependencies

_ALL	= save.o score.o
ALL	= $(_ALL) save_mod.o

SAVE_INC_PLAY	= player_iface.h
SAVE_INC_GAME	= game.h
SAVE_INC	= save.h
SAVE_DEPS	= $(SRC_DIR)/save.c \
			$(patsubst %,$(INC_DIR)/%,$(SAVE_INC)) \
			$(patsubst %,$(GAME_INC_DIR)/%,$(SAVE_INC_GAME)) \
			$(patsubst %,$(PLAY_INC_DIR)/%,$(SAVE_INC_PLAY))
SAVE_INC_DIRS	= -I $(INC_DIR) \
			-I $(GAME_INC_DIR) \
			-I $(PLAY_INC_DIR)

SCORE_INC_PLAY	= player_iface.h
SCORE_INC_GAME	= game.h game_iface.h
SCORE_INC	= score.h
SCORE_DEPS	= $(SRC_DIR)/score.c \
			$(patsubst %,$(INC_DIR)/%,$(SCORE_INC)) \
			$(patsubst %,$(GAME_INC_DIR)/%,$(SCORE_INC_GAME)) \
			$(patsubst %,$(PLAY_INC_DIR)/%,$(SCORE_INC_PLAY))
SCORE_INC_DIRS	= -I $(INC_DIR) \
			-I $(GAME_INC_DIR) \
			-I $(PLAY_INC_DIR)

# target: dependencies
#	action

all: $(ALL)


save_mod.o: $(_ALL)
	@echo	"	LD	$@"
	$(Q)$(LD) -r $^ -o $@


save.s: $(SAVE_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(SAVE_INC_DIRS) -S $< -o $@
save.o: save.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@

score.s: $(SCORE_DEPS)
	@echo	"	CC	$@"
	$(Q)$(CC) $(CFLAGS) $(SCORE_INC_DIRS) -S $< -o $@
score.o: score.s
	@echo	"	AS	$@"
	$(Q)$(AS) $< -o $@


clean:
	$(Q)rm -f *.o *.s
