# -*- MakeFile -*-

# MACRO = substitute with this

# directories

INC_DIR = $(LIBALX_DIR)/inc/
OBJ_DIR = $(LIBALX_DIR)/obj/
SRC_DIR = $(LIBALX_DIR)/src/

# dependencies

_ALL	= alx_cmp.o alx_file.o alx_input.o alx_mask.o alx_math.o alx_ncur.o alx_seed.o
ALL	= $(_ALL) alx_lib.o

CMP_INC		= alx_cmp.h
CMP_DEPS	= $(SRC_DIR)/alx_cmp.c $(patsubst %,$(INC_DIR)/%,$(CMP_INC))
CMP_INC_DIRS	= -I $(INC_DIR)

FILE_INC	= alx_file.h
FILE_DEPS	= $(SRC_DIR)/alx_file.c $(patsubst %,$(INC_DIR)/%,$(FILE_INC))
FILE_INC_DIRS	= -I $(INC_DIR)

INPUT_INC	= alx_input.h
INPUT_DEPS	= $(SRC_DIR)/alx_input.c $(patsubst %,$(INC_DIR)/%,$(INPUT_INC))
INPUT_INC_DIRS	= -I $(INC_DIR)

MASK_INC	= alx_mask.h
MASK_DEPS	= $(SRC_DIR)/alx_mask.c $(patsubst %,$(INC_DIR)/%,$(MASK_INC))
MASK_INC_DIRS	= -I $(INC_DIR)

MATH_INC	= alx_math.h
MATH_DEPS	= $(SRC_DIR)/alx_math.c $(patsubst %,$(INC_DIR)/%,$(MATH_INC))
MATH_INC_DIRS	= -I $(INC_DIR)

NCUR_INC	= alx_ncur.h	alx_input.h
NCUR_DEPS	= $(SRC_DIR)/alx_ncur.c $(patsubst %,$(INC_DIR)/%,$(NCUR_INC))
NCUR_INC_DIRS	= -I $(INC_DIR)

SEED_INC	= alx_seed.h
SEED_DEPS	= $(SRC_DIR)/alx_seed.c $(patsubst %,$(INC_DIR)/%,$(SEED_INC))
SEED_INC_DIRS	= -I $(INC_DIR)

# target: dependencies
#	action

all: $(ALL)


alx_lib.o: $(_ALL)
	$(Q)$(LD) -r $^ -o $@
	@echo  "\tLD	$@"
	@echo  ""


alx_cmp.o: $(CMP_DEPS)
	$(Q)$(CC) $(CFLAGS) $(CMP_INC_DIRS) -c $< -o $@
	@echo  "\tCC	$@"

alx_file.o: $(FILE_DEPS)
	$(Q)$(CC) $(CFLAGS) $(FILE_INC_DIRS) -c $< -o $@
	@echo  "\tCC	$@"

alx_input.o: $(INPUT_DEPS)
	$(Q)$(CC) $(CFLAGS) $(INPUT_INC_DIRS) -c $< -o $@
	@echo  "\tCC	$@"

alx_mask.o: $(MASK_DEPS)
	$(Q)$(CC) $(CFLAGS) $(MASK_INC_DIRS) -c $< -o $@
	@echo  "\tCC	$@"

alx_math.o: $(MATH_DEPS)
	$(Q)$(CC) $(CFLAGS) $(MATH_INC_DIRS) -c $< -o $@
	@echo  "\tCC	$@"

alx_ncur.o: $(NCUR_DEPS)
	$(Q)$(CC) $(CFLAGS) $(NCUR_INC_DIRS) -c $< -o $@
	@echo  "\tCC	$@"

alx_seed.o: $(SEED_DEPS)
	$(Q)$(CC) $(CFLAGS) $(SEED_INC_DIRS) -c $< -o $@
	@echo  "\tCC	$@"


clean:
	$(Q)rm -f *.o
