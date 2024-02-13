SRC:= 	.
BUILD:=	build

PREFIX:=../riscv/bin/riscv64-unknown-elf-

INCLUDE_PATH:= 	\
$(SRC)/kernel	\
$(SRC)/cpu		\
$(SRC)/bsp 	\
$(SRC)/kernel/Cfg\
$(SRC)/rhealstone/support 



CC:=$(PREFIX)gcc
CCFLAGS:= 				\
-O0 -ggdb				\
-march=rv64gc			\
-g -Wall -Werror  -Wextra -Wformat=2 -Wfloat-equal -Wshadow -Wtrampolines -O0 -Wdate-time  -static -nostdlib -nostartfiles -nodefaultlibs  -fno-builtin -fno-PIE -fno-dwarf2-cfi-asm -Wno-incompatible-pointer-types -Wno-cast-function-type -Wno-implicit-fallthrough  -fomit-frame-pointer -fzero-initialized-in-bss -fdollars-in-identifiers -ffunction-sections -fdata-sections -fno-common -fno-aggressive-loop-optimizations -fno-optimize-strlen -fno-schedule-insns  -fno-inline-small-functions -fno-inline-functions-called-once -fno-strict-aliasing -fno-builtin -nostartfiles -fno-stack-protector  -funsigned-char -fno-PIC -std=c99 -Wno-undef -Wno-strict-prototypes -Wno-unused-but-set-variable -Wno-redundant-decls -Wno-unused-variable -Wno-cast-qual -Wno-parentheses -Wno-pointer-sign -Wno-unused-parameter -Wno-sign-compare -Wno-jump-misses-init -Wno-old-style-definition -Wno-shadow -Wno-unused-macros -mcmodel=medany -static \
$(foreach it,$(INCLUDE_PATH),-I$(it))

LD:=$(PREFIX)ld

LDFLAGS:= -static -no-pie

OBJDUMP:=$(PREFIX)objdump

NM:=$(PREFIX)nm

QEMU:=qemu-system-riscv64
QEMUFLAGS:=	\
-bios none	\
-smp  1		\
-m    512M	\
-nographic	\
-machine virt

TEST_APPS_OBJS:= $(BUILD)/rhealstone/task-switch/task-switch.o

SRFILES:= 	\
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
$(SRC)/main.c					\
$(SRC)/rhealstone/support/banchmark_support.c	

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

$(BUILD)/test_task_switch: $(SRC)/kernel.ld $(OBJECTS) $(TEST_APPS_OBJS)
	@mkdir -p $(dir $@)
	$(LD) $(LDFLAGS) -T $< $(OBJECTS) $(BUILD)/rhealstone/task-switch/task-switch.o -o $@

qemu:$(BUILD)/test_task_switch \
	$(BUILD)/kernel.asm\
	$(BUILD)/kernel.map
	$(QEMU) $(QEMUFLAGS) -kernel $< 

qemuDbg:$(BUILD)/test_task_switch \
	$(BUILD)/kernel.asm\
	$(BUILD)/kernel.map
	$(QEMU) $(QEMUFLAGS) -kernel $< -s -S 

$(BUILD)/kernel.asm: $(BUILD)/test_task_switch
	@mkdir -p $(dir $@)
	$(OBJDUMP) -d $< > $@

$(BUILD)/kernel.map: $(BUILD)/test_task_switch
	@mkdir -p $(dir $@)
	$(NM)  $<  |sort >$@


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
