# Author: Leon Botros
# Makefile to create hex from source directories
# make to build the .hex files
# make norxtest to run norxtest.c on the board
# make speedtest to run speedtest.c on the board

# Compiler & Compiler flags
CC = avr-gcc
CFLAGS = -Wall -mmcu=atmega2560 -O3 -DF_CPU=16000000

# avr object copy settings
AVROBJCOPY = avr-objcopy

# avrdude settings
AVRDUDE = avrdude
DEVICE = /dev/ttyACM0
AVRDUDE_FLAGS = -c stk500v2 -p atmega2560 -P $(DEVICE)

# source files from directory
AVR_SRC = $(wildcard src/avr/*.c)
NORX_SRC =  $(wildcard src/norx/*.c)
ASM_SRC = $(wildcard src/norx/assembly/*.S)
NORXTEST_SRC = src/norxtest.c $(AVR_SRC) $(NORX_SRC)
SPEEDTEST_SRC = src/speedtest.c $(AVR_SRC) $(NORX_SRC)

NORXTEST_OBJ = $(NORXTEST_SRC:src/%.c=obj/%.o) $(ASM_SRC:src/%.S=obj/%.o)
SPEEDTEST_OBJ = $(SPEEDTEST_SRC:src/%.c=obj/%.o) $(ASM_SRC:src/%.S=obj/%.o)

# header files
AVR_HEADERS = $(wildcard src/avr/*.h)
NORX_HEADERS = $(wildcard src/norx/*.h)
HEADERS = $(AVR_HEADERS) $(NORX_HEADERS)

all: hex/norxtest.hex hex/speedtest.hex

norxtest: hex/norxtest.hex
	@$(AVRDUDE) $(AVRDUDE_FLAGS) -U flash:w:hex/norxtest.hex
	@stty -F $(DEVICE) raw icanon eof \^d 38400
	@echo "===== Output ====="
	@cat < $(DEVICE)
	
speedtest: hex/speedtest.hex
	@$(AVRDUDE) $(AVRDUDE_FLAGS) -U flash:w:hex/speedtest.hex
	@stty -F $(DEVICE) raw icanon eof \^d 38400
	@echo "===== Speedtest ====="
	@cat < $(DEVICE)
	
hex/norxtest.hex: $(NORXTEST_OBJ)
	$(CC) $(CFLAGS) $(NORXTEST_OBJ) -o hex/norxtest
	$(AVROBJCOPY) -O ihex -R .eeprom hex/norxtest hex/norxtest.hex
	
hex/speedtest.hex: $(SPEEDTEST_OBJ)
	$(CC) $(CFLAGS) $(SRC) $(SPEEDTEST_OBJ) -o hex/speedtest
	$(AVROBJCOPY) -O ihex -R eeprom hex/speedtest hex/speedtest.hex	
	
obj/%.o: src/%.S
	$(CC) $(CFLAGS) -c -o $@ $<
	
obj/%.o: src/%.c $(HEADERS)
	$(CC) $(CFLAGS) -c -o $@ $< 
	
.PHONY: clean
.PHONY: all

clean:
	-rm hex/norxtest
	-rm hex/norxtest.hex
	-rm hex/speedtest
	-rm hex/speedtest.hex
	-rm $(NORXTEST_OBJ)
	-rm obj/speedtest.o