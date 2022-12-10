
SRC_DIR 		:= ./src
OBJ_DIR 		:= ./obj
ASM_DIR			:= ./asm
DISASM_DIR		:= ./dasm

CC := D:/SW_4/bin/arm-eabi-gcc.exe
OBJDMP := D:/SW_4/bin/arm-eabi-objdump.exe
QEMU := D:/SW_4/bin/arm-eabi-gnatemu.exe
QEMU2 := D:/SW_9/xpack-qemu-arm-7.0.0-1-win32-x64/xpack-qemu-arm-7.0.0-1/bin/qemu-system-gnuarmeclipse.exe
GDB := D:/SW_4/bin/arm-eabi-gdb.exe

CPU := cortex-m4
#BOARD=STM32F4-Discovery
RT := ./RTS_minimal_stm32f4/

CFLAGS := -c -g -mcpu=$(CPU) -mthumb -mfloat-abi=soft --RTS=$(RT)
SFLAGS := -S -g -mcpu=$(CPU) -mthumb -mfloat-abi=soft --RTS=$(RT)
LDFLAGS := -mcpu=$(CPU) -mthumb -T stm32_ls.ld -nostdlib -Wl,-Map=${OBJ_DIR}/final.map

#OBJS := startup.o handlers.o pack_1.o leds.o blinky.o
FILENAMES := startup handlers pack_1 leds blinky	#name only, no extension
EXE := final

OBJS := ${addsuffix .o, ${FILENAMES}}
OBJECTS := ${addprefix ${OBJ_DIR}/, ${OBJS}}

EXES := ${addsuffix .elf, ${EXE}}
EXECUTABLE := ${addprefix ${OBJ_DIR}/, ${EXES}}

ASMS := ${addsuffix .s, ${FILENAMES}}
ASMBLES := ${addprefix ${ASM_DIR}/, ${ASMS}}
ASM_ALIS := ${addsuffix .ali, ${FILENAMES}}

DASMS := ${addsuffix .asm, ${FILENAMES}}
DISASMS := ${addprefix ${DISASM_DIR}/, ${DASMS}} ${addsuffix .asm, ${DISASM_DIR}/${EXE}}
DASMS_I := ${addsuffix _i.asm, ${FILENAMES}}
DISASMS_I := ${addprefix ${DISASM_DIR}/, ${DASMS_I}} ${addsuffix _i.asm, ${DISASM_DIR}/${EXE}}

CLS := *.o *.elf *.bin *.ali *.asm *.s *.map
CLEANS := ${addprefix ${OBJ_DIR}/, ${CLS}}
CLEAN_DISASM := ${DISASM_DIR}/*.asm
CLEAN_ASMS := ${ASM_DIR}/*.s 

all:${OBJECTS} ${EXECUTABLE}

disasm:${DISASMS} ${DISASMS_I}

asmble:${ASMBLES}

# Build (Compile and Link)
${OBJ_DIR}/%.o: ${SRC_DIR}/%.adb
	$(CC) $(CFLAGS) -o $@ $^

${EXECUTABLE}: ${OBJECTS}
	$(CC) $(LDFLAGS) -o $@ $^



#Assemble only
${ASM_DIR}/%.s: ${SRC_DIR}/%.adb
	$(CC) $(SFLAGS) -o $@ $^


# Disassemble (Full and Source-InterMixed)
# The trick is to keep the Full disassembly recipies last
# So, that naming rules (*.asm and *_i.asm) do not conflict with each other.
${DISASM_DIR}/%_i.asm: ${OBJ_DIR}/%.o
	$(OBJDMP) -S $^ > $@

${DISASM_DIR}/%_i.asm: ${OBJ_DIR}/%.elf
	$(OBJDMP) -S $^ > $@

${DISASM_DIR}/%.asm: ${OBJ_DIR}/%.o
	$(OBJDMP) -D $^ > $@

${DISASM_DIR}/%.asm: ${OBJ_DIR}/%.elf
	$(OBJDMP) -D $^ > $@


# print the header of elf
header:${EXECUTABLE}
	$(OBJDMP) -h $^

# Emulate (Using QEMU)
emu:${EXECUTABLE}
	$(QEMU) --board=STM32F4 --gdb --freeze-on-startup $^

emu2:${EXECUTABLE}
	$(QEMU2) -cpu $(CPU) -machine STM32F4-Discovery -gdb tcp::1234 -nographic -S -kernel $^


#Debug (Using GDB)
debug:
	$(GDB)

# clean
clean:
	rm -rf ${CLEANS} ${CLEAN_DISASM} ${CLEAN_ASMS} ${ASM_ALIS}
#rm -rf *.o *.elf *.bin *.ali *.asm


load:
	openocd -f board/stm32f4discovery.cfg

