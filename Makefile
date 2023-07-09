SRC:= 	.
BUILD:=	build

PREFIX:=riscv32-unknown-linux-gnu-

INCLUDE_PATH:= 	\
$(SRC)/kernel	\
$(SRC)/cpu		\
$(SRC)/bsp		\
$(SRC)/kernel/Cfg



CC:=$(PREFIX)gcc
CCFLAGS:= 				\
-ffreestanding			\
-nostdlib				\
-nostdinc				\
-fno-stack-protector	\
-O0 -ggdb				\
-march=rv32gc			\
$(foreach it,$(INCLUDE_PATH),-I$(it))

LD:=$(PREFIX)ld

OBJDUMP:=$(PREFIX)objdump

NM:=$(PREFIX)nm

QEMU:=qemu-system-riscv32
QEMUFLAGS:=	\
-bios none	\
-smp  1		\
-m    512M	\
-nographic	\
-machine virt


SRFILES:= 						\
$(SRC)/bsp/boot.s				\
$(SRC)/bsp/bsp_init.c			\
$(SRC)/bsp/uart.c				\
$(SRC)/bsp/string.c				\
$(SRC)/bsp/riscv.c				\
$(SRC)/bsp/trap.s				\
$(SRC)/cpu/cpu_a.S				\
$(SRC)/cpu/cpu_core.c 			\
$(SRC)/cpu/os_cpu_a.S			\
$(SRC)/cpu/os_cpu_c.c			\
$(SRC)/kernel/os_sem.c 			\
$(SRC)/kernel/os_mem.c			\
$(SRC)/kernel/os_stat.c			\
$(SRC)/kernel/os_cfg_app.c		\
$(SRC)/kernel/os_msg.c			\
$(SRC)/kernel/os_task.c			\
$(SRC)/kernel/os_var.c			\
$(SRC)/kernel/os_core.c			\
$(SRC)/kernel/os_mutex.c		\
$(SRC)/kernel/os_tick.c			\
$(SRC)/kernel/os_dbg.c			\
$(SRC)/kernel/os_prio.c			\
$(SRC)/kernel/os_time.c			\
$(SRC)/kernel/os_flag.c			\
$(SRC)/kernel/os_q.c			\
$(SRC)/kernel/os_tmr.c			\
$(SRC)/kernel/Cfg/os_app_hooks.c\
$(SRC)/main.c

OBJECTS:= $(patsubst $(SRC)/bsp/%.s,$(BUILD)/bsp/%.o,$(SRFILES))
OBJECTS:= $(patsubst $(SRC)/bsp/%.c,$(BUILD)/bsp/%.o,$(OBJECTS))
OBJECTS:= $(patsubst $(SRC)/cpu/%.S,$(BUILD)/cpu/%.o,$(OBJECTS))
OBJECTS:= $(patsubst $(SRC)/cpu/%.c,$(BUILD)/cpu/%.o,$(OBJECTS))
OBJECTS:= $(patsubst $(SRC)/kernel/%.S,$(BUILD)/kernel/%.o,$(OBJECTS))
OBJECTS:= $(patsubst $(SRC)/kernel/%.c,$(BUILD)/kernel/%.o,$(OBJECTS))
OBJECTS:= $(patsubst $(SRC)/kernel/Cfg/%.S,$(BUILD)/kernel/Cfg/%.o,$(OBJECTS))
OBJECTS:= $(patsubst $(SRC)/kernel/Cfg/%.c,$(BUILD)/kernel/Cfg/%.o,$(OBJECTS))
OBJECTS:= $(patsubst $(SRC)/%.c,$(BUILD)/%.o,$(OBJECTS))

DEBUGFILES:=\
$(shell find $(SRC) -name "*.c")\
$(shell find $(SRC) -name "*.s")\
$(shell find $(SRC) -name "*.S")


compile:$(BUILD)/kernel.elf\
		$(BUILD)/kernel.asm\
		$(BUILD)/kernel.map

qemu:$(BUILD)/kernel.elf\
	 $(BUILD)/kernel.asm\
	 $(BUILD)/kernel.map
	$(QEMU) $(QEMUFLAGS) -kernel $< 

qemuDbg:$(BUILD)/kernel.elf\
	 	$(BUILD)/kernel.asm\
		$(BUILD)/kernel.map
	$(QEMU) $(QEMUFLAGS) -kernel $< -s -S 

$(BUILD)/kernel.asm:$(BUILD)/kernel.elf
	@mkdir -p $(dir $@)
	$(OBJDUMP) -d $< > $@

$(BUILD)/kernel.map:$(BUILD)/kernel.elf
	@mkdir -p $(dir $@)
	$(NM)  $<  |sort >$@

$(BUILD)/kernel.elf:$(SRC)/kernel.ld $(OBJECTS)
	@mkdir -p $(dir $@)
	$(LD) -T $< $(OBJECTS) -o $@

$(BUILD)/bsp/%.o:$(SRC)/bsp/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $^ -o $@

$(BUILD)/bsp/%.o:$(SRC)/bsp/%.s
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $^ -o $@

$(BUILD)/cpu/%.o:$(SRC)/cpu/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $^ -o $@

$(BUILD)/cpu/%.o:$(SRC)/cpu/%.S
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $^ -o $@

$(BUILD)/kernel/%.o:$(SRC)/kernel/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $^ -o $@

$(BUILD)/kernel/%.o:$(SRC)/kernel/%.S
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $^ -o $@

$(BUILD)/kernel/Cfg/%.o:$(SRC)/kernel/Cfg/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $^ -o $@

$(BUILD)/kernel/Cfg/%.o:$(SRC)/kernel/Cfg/%.S
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $^ -o $@

$(BUILD)/%.o:$(SRC)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $^ -o $@
	
clean:
	rm -rf $(BUILD)
debug:
	@echo $(CCFLAGS) 
.PHONY:clean debug compile qemu qemuDbg
