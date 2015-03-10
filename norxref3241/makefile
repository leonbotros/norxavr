# Author: Leon Botros
# Makefile to create hex from source directories
# make to build the .hex files
# make norxtest to run norxtest.c on the board
# make speedtest to run speedtest.c on the board

# Compiler & Compiler flags
CC = avr-gcc
CFLAGS = -Wall -mmcu=atmega2560 -O3 -DF_CPU=16000000
TARGET = hex/norxtest
SPEEDTEST = hex/speedtest

# avr object copy settings
AVROBJCOPY = avr-objcopy

# avrdude settings
AVRDUDE = avrdude
DEVICE = /dev/ttyACM0
DIR=
AVRDUDE_FLAGS = -c stk500v2 -p atmega2560 -P $(DEVICE)
AVRDUDE_WRITE_FLASH = -U flash:w:$(dir)$(TARGET).hex

# source files from directory
AVR_SRC = $(wildcard avr/*.c)
NORX_SRC =  $(wildcard norx/*.c)
TARGET_SRC = norxtest.c
SPEEDTEST_SRC = speedtest.c

SRC = $(AVR_SRC) $(NORX_SRC)

# header files
AVR_HEADERS = $(wildcard avr/*.h)
NORX_HEADERS = $(wildcard norx/*.h)
HEADERS = $(AVR_HEADERS) $(NORX_HEADERS)

all: $(TARGET).hex $(SPEEDTEST).hex

$(TARGET).hex: $(SRC) $(HEADERS) $(TARGET_SRC)
	$(CC) $(CFLAGS) $(SRC) $(TARGET_SRC) -o $(TARGET)
	$(AVROBJCOPY) -O ihex -R .eeprom $(TARGET) $(TARGET).hex
	
$(SPEEDTEST).hex: $(SRC) $(SPEEDTEST_SRC)
	$(CC) $(CFLAGS) $(SRC) $(SPEEDTEST_SRC) -o $(SPEEDTEST)
	$(AVROBJCOPY) -O ihex -R eeprom $(SPEEDTEST) $(SPEEDTEST).hex

norxtest: $(TARGET).hex
	@$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH)
	@stty -F $(DEVICE) raw icanon eof \^d 38400
	@echo "===== Output ====="
	@cat < $(DEVICE)
	

speedtest: $(SPEEDTEST).hex
	@$(AVRDUDE) $(AVRDUDE_FLAGS) -U flash:w:$(SPEEDTEST).hex
	@stty -F $(DEVICE) raw icanon eof \^d 38400
	@echo "===== Speedtest ====="
	@cat < $(DEVICE)


.PHONY: clean
.PHONY: all

clean:
	-rm $(TARGET)
	-rm $(TARGET).hex
	-rm $(SPEEDTEST)
	-rm $(SPEEDTEST).hex