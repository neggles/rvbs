.PHONY: all clean fmt

CC       = gcc-14
CFLAGS   = -std=gnu2x -O2 -ggdb -Wall -Wpedantic
CPPFLAGS = -MMD -MP
LDFLAGS  = -lm

# names of binaries to build
PROGRAMS := vec vlen vadd irate

BIN_DIR := ./bin
SRC_DIR := ./src

### end config ###
# add EXTRA_CFLAGS
CFLAGS += $(EXTRA_CFLAGS)
# deeply unserious architecture
CFLAGS   += -march=rv64gcv_zicbom_zicboz_zicntr_zicond_zihintpause_zihpm_zfh_zfhmin_zca_zcd_zba_zbb_zbc_zbs_zkt_zve32f_zve32x_zve64d_zve64f_zve64x_zvfh_zvfhmin_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt

# set target locations
TARGETS = $(addprefix $(BIN_DIR)/, $(PROGRAMS))

all: $(TARGETS)

# build C+ASM binaries
$(BIN_DIR)/%.o: $(SRC_DIR)/%.c $(SRC_DIR)/%.S
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)
$(BIN_DIR)/%: $(SRC_DIR)/%.c $(SRC_DIR)/%.S
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

# build C-only binaries
$(BIN_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)
$(BIN_DIR)/%: $(SRC_DIR)/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(TARGETS) $(BIN_DIR)/*.o $(BIN_DIR)/*.d

fmt:
	clang-format -i $(SRC_DIR)/*.c $(SRC_DIR)/*.h

-include $(TARGETS:%=%.d)
