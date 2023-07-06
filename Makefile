SRC:=./
BUILD:=./build

PREFIX:=riscv32-unknown-linux-gnu-


QEMU:=qemu-system-riscv32
QEMUFLAGS:= \
-smp 1\
-bios none\
-m  512M\
-nographic\
-machine virt

CC:= $(PREFIX)gcc
LD:= $(PREFIX)ld
CCFLAGS:=\
-ffreestanding\
-nostdlib\
-nostdinc\
-fno-stack-protector\
-O0 -ggdb\
-march=rv32gc\
-I./kernel\
-I./cpu\
-I./bsp\
-I./kernel/Cfg

OBJECTS:= \
$(BUILD)/bsp/boot.o\
$(BUILD)/bsp/trap.o\
$(BUILD)/bsp/riscv.o\
$(BUILD)/bsp/bsp_init.o\
$(BUILD)/bsp/string.o\
$(BUILD)/bsp/uart.o\
$(BUILD)/bsp/string.o\
$(BUILD)/cpu/cpu_a.o\
$(BUILD)/cpu/cpu_core.o\
$(BUILD)/cpu/os_cpu_a.o\
$(BUILD)/cpu/os_cpu_c.o\
$(BUILD)/kernel/os_sem.o\
$(BUILD)/kernel/os_mem.o\
$(BUILD)/kernel/os_stat.o\
$(BUILD)/kernel/os_cfg_app.o\
$(BUILD)/kernel/os_msg.o\
$(BUILD)/kernel/os_task.o\
$(BUILD)/kernel/os_var.o\
$(BUILD)/kernel/os_core.o\
$(BUILD)/kernel/os_mutex.o\
$(BUILD)/kernel/os_tick.o\
$(BUILD)/kernel/os_dbg.o\
$(BUILD)/kernel/os_prio.o\
$(BUILD)/kernel/os_time.o\
$(BUILD)/kernel/os_flag.o\
$(BUILD)/kernel/os_q.o\
$(BUILD)/kernel/os_tmr.o\
$(BUILD)/main.o

compile: $(BUILD)/kernel.bin


qemu:$(BUILD)/kernel.bin
	$(QEMU) $(QEMUFLAGS) -kernel $< 

qemuDbg:$(BUILD)/kernel.bin
	$(QEMU) $(QEMUFLAGS) -kernel $< -s -S
$(BUILD)/kernel.bin:$(OBJECTS)
	$(shell mkdir -p $(dir $@))
	$(LD) -T kernel.ld $^  -o $@

$(BUILD)/bsp/%.o: $(SRC)/bsp/%.c
	$(shell mkdir -p $(dir $@) )
	$(CC) -c $(CCFLAGS) $< -o $@

$(BUILD)/bsp/%.o:$(SRC)/bsp/%.s
	$(shell mkdir -p $(dir $@) )
	$(CC) -c $(CCFLAGS) $< -o $@

$(BUILD)/cpu/%.o: $(SRC)/cpu/%.c
	$(shell mkdir -p $(dir $@) )
	$(CC) -c $(CCFLAGS) $< -o $@


$(BUILD)/cpu/%.o: $(SRC)/cpu/%.S
	$(shell mkdir -p $(dir $@) )
	$(CC) -c $(CCFLAGS) $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.c
	$(shell mkdir -p $(dir $@) )
	$(CC) -c $(CCFLAGS) $< -o $@

$(BUILD)/%.o: $(SRC)/%.c
	$(shell mkdir -p $(dir $@) )
	$(CC) -c $(CCFLAGS) $< -o $@
	
.PHONY: clean
clean:
	rm -rf $(BUILD)
