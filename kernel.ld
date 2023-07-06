/*输出架构和入口*/
OUTPUT_ARCH("riscv")

ENTRY(_start)
/*对内核的结构的描述*/
SECTIONS
{
    . = 0x80000000;
    .text : {
        *(.text .text*)
        . = ALIGN(0x1000);
        /*代码段结束后与一页对齐 方便后续计算和操作
        与一页对齐同时也就与32位对齐了 不会引发RV64G的PAGEFAULT*/
    }
    PROVIDE(textEnd = .);
    /*定义一下代码段结束的位置 在虚拟内存管理部分可以使用*/
    .rodata : {
        . = ALIGN(16); /*数据对齐16位 防止引用数据时发生PAGEFAULT*/
        *(.srodata .srodata.*)
        . = ALIGN(16); /*数据对齐16位 防止引用数据时发生PAGEFAULT*/
        *(.rodata .rodata.*)
    }
    .data : {
        . = ALIGN(16);
        *(.sdata .sdata.*)
        . = ALIGN(16);
        *(.data .data.*)
    }
    .bss : {
        . = ALIGN(16);
        *(.sbss .sbss.*)
        . = ALIGN(16);
        *(.bss .bss.*)
    }
    PROVIDE(end = .);
    /*end为内核结束的地方 物理内存管理可以使用*/
}