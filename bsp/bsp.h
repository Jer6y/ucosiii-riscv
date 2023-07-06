#ifndef BSP_H
#define BSP_H

#define NULL  0
#define false 0
#define true  1

typedef char                int8;
typedef short               int16;
typedef int                 int32;
typedef long long           int64;
typedef unsigned char       uint8;
typedef unsigned short      uint16;
typedef unsigned int        uint32;
typedef unsigned int        size_t;
typedef unsigned long long  uint64;

#define THR 0
#define RHR 0
#define BUAD_LOW  0 
#define BUAD_HIGH 1
#define IER 1
    #define IER_RX_INTA (1<<0)
    #define IER_TX_INTA (1<<1)
#define FCR 2
    #define FCR_FIFO_ENABLE   (1<<0)
    #define FCR_RX_FIFO_CLEAR (1<<1)
    #define FCR_TX_FIFO_CLEAR (1<<2)
#define ISR 2
#define LCR 3
    #define LCR_WORD_LENGTH (3<<0)
#define MCR 4
#define LSR 5
    #define LSR_RX_READY (1<<0)
    #define LSR_TX_READY (1<<5)
#define MSR 6
#define SPR 7

#define UART_START 0x10000000u
#define Reg(r) (UART_START+(r))

#define write_reg(r,val,type) (*(type *)Reg((r))=(type)(val))
#define read_reg(r,type) (*(type *)Reg((r)))

#define va_list(base) ((uint64*)(base)+1)
#define va_end(t)     ((t)= 0)
#define va_next(t,type) ( *(type *)((va*)((t)=(va*)(t)+1)-1))
typedef unsigned long long va;

#ifndef PLATFORM_H
#define PLATFORM_H

//CPU核心数
#define CPUS            1  
//虚拟地址最高处                        闭区间
#define MAX_VA          ((1u<<39)-1)
//内核基地址                            闭区间
#define KERNEL_BASE     (0x80000000u) 
//页粒度                                4k
#define PAGESIZE        (4096)
//物理地址结束的地方                    闭区间
#define RAM_END         ((KERNEL_BASE+128*1024*1024)-1)
//串口                                 IO地址
#define UART_START      0x10000000u
//时钟                                 IO地址
#define CLINT_START     0x2000000u
//中断管理设备                          IO地址
#define PLIC_START      0xc000000u
//TRAPFRAM地址
#define TRAPFRAME       0x3ffffff000u 
//总页数
#define TOTALPAGES      ((128*1024*1024)/4096)
#endif

#define SIE  (1u<<1)
    #define SIE_S (1u<<1)
    #define SIE_R (0u<<1)

//S-mode env-ret跳转到的模式
#define SPP  (1u<<8)
    #define SPP_U (0u<<8)
    #define SPP_S (1u<<8)

//S-mode 若SUM置1 则S模式可以访问U模式的page 反之
#define SUM  (1u<<18)
    #define SUM_S (1u<<18)
    #define SUM_R (0u<<18)

//S-mode env-ret 跳转时SPIE会覆盖SIE
#define SPIE (1u<<5)
    #define SPIE_S (1u<<5)
    #define SPIE_R (0u<<5)

#define SEIE (1u<<9)
    #define SEIE_S (1u<<9)
    #define SEIE_R (0u<<9)

#define STIE (1u<<5)
    #define STIE_S (1u<<5)
    #define STIE_R (0u<<5)

#define SSIE (1u<<1)
    #define SSIE_S (1u<<1)
    #define SSIE_R (0u<<1)
//M-mode:
#define MIE  (1u<<3)
    #define MIE_S (1u<<3)
    #define MIE_R (0u<<3)

#define MPP  (3u<<11)
    #define MPP_U (0u<<11)
    #define MPP_S (1u<<11)
    #define MPP_M (3u<<11)

#define MPIE (1u<<7)
    #define MPIE_S (1u<<7)
    #define MPIE_R (0u<<7)

#define MEIE (1u<<11)
    #define MEIE_S (1u<<11)
    #define MEIE_R (0u<<11)

#define MTIE (1u<<7)
    #define MTIE_S (1u<<7)
    #define MTIE_R (0u<<7)

#define MSIE (1u<<3)
    #define MSIE_S (1u<<3)
    #define MSIE_R (0u<<3)


void uart_init();                //串口初始化
void uart_putc_sync(char c);    //同步输送字符

void sfence();              //读riscv-csr的c描述的函数
uint32 r_int();
uint32 r_tp();
uint32 r_sip();
uint32 r_mip();
uint32 r_sie();
uint32 r_mie();
uint32 r_satp();
uint32 r_sepc();
uint32 r_mepc();
uint32 r_stval();
uint32 r_mtval();
uint32 r_stvec();
uint32 r_mtvec();
uint32 r_scause();
uint32 r_mcause();
uint32 r_sstatus();
uint32 r_mstatus();
uint32 r_mhartid();
uint32 r_mideleg();
uint32 r_medeleg();
uint32 r_sscratch();
uint32 r_mscratch();
void w_int_on();            //写riscv-csr的c描述的函数          
void w_int_off();
void w_tp(uint32 x);
void w_sip(uint32 x);
void w_mip(uint32 x);
void w_sie(uint32 x);
void w_mie(uint32 x);
void w_satp(uint32 x);
void w_sepc(uint32 x);
void w_mepc(uint32 x);
void w_stval(uint32 x);
void w_mtval(uint32 x);
void w_stvec(uint32 x);
void w_mtvec(uint32 x);
void w_scause(uint32 x);
void w_mcause(uint32 x);
void w_sstatus(uint32 x);
void w_mstatus(uint32 x);
// hartid 为只读 是不允许写的!
// void w_mhartid(uint32 x);
void w_mideleg(uint32 x);
void w_medeleg(uint32 x);
void w_sscratch(uint32 x);
void w_mscratch(uint32 x);
void w_pmpaddr0(uint32 x);
void w_pmpcfg0(uint32 x);
//string.c
void *memset(const void *des, uint8 c,size_t n);
void *memchr(const void *str, int c, size_t n);
void *memcpy(void *des, const void *src, size_t n);
int memcmp(const void *str1, const void *str2, size_t n);
char *strrchr(const char *str, int c);
char *strchr(const char *str, int c);
char *strcat(char *dest, const char *src);
int strcmp(const char* src,const char *des);
char *strncpy(char *dest, const char *src, size_t n);
char *strcpy(char *dest, const char *src);
size_t  strlen(const char * src);
// 以下的buf或者str都不应该超过256个字符 否则引发panic
int printf(const char* str,...);
int sprintf(char *buf, const char *fmt, ...);
int vsprintf(char *buf, const char *fmt, va* args);
void panic(char *str);
void assert_fail(char* file,int line);
#define assert(x) if(!(x)) { assert_fail(__FILE__,__LINE__); }
void bsp_init();
void trap_handler(uint32 mcause,uint32 mtval,uint32 sp);

#endif