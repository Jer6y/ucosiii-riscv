
#include "bsp.h"
char ks_stack[4096*CPUS]__attribute__((aligned(16)));

extern void (OSIntEnter)(void);
extern void (OSTimeTick)(void);
extern void (OSIntExit)(void);
extern void (trap_entry)(void);
extern void (main)(void);
extern void Software_IRQHandler(void);
#define CLINT_TIME             (CLINT_START+0xBFF8)
#define CLINT_TIMECMP(hart_id) (CLINT_START+0x4000+8*(hart_id))

static void nextcmp()
{
    uint64 cpu_id = r_mhartid();
    //设置间隔位8000000个周期
    //qemu 中一个周期是1ps 约等于8ms
    uint64 intervel = 1000000;
    uint64 x = *(uint64 *)CLINT_TIME;
    x+=intervel;
    *(uint64 *)CLINT_TIMECMP(cpu_id)=x;
}

#define INT_BIT 0x8000000000000000ull

void trap_handler(uint64 mcause,uint64 mtval,uint64 sp)
{
     if(mcause &INT_BIT)
     {
        mcause&= (~INT_BIT);
        if(mcause == 7)
        {
            OSIntEnter();
            // printf("timer!");
            nextcmp();            
	        OSTimeTick();
            uint64 mstatus = r_mstatus();
            mstatus |= MPIE;
            mstatus = mstatus| MPP_M;
            w_mstatus(mstatus);
            OSIntExit();
        }
        else if(mcause ==1)
        {
            uint64 mstatus = r_mstatus();
            mstatus |= MPIE;
            mstatus = mstatus| MPP_M;
            w_mstatus(mstatus);
            __asm__ __volatile__("add a2,%0,zero"::"r"(sp):"a2");
            Software_IRQHandler();
        }
        else panic("error");
     }
     else
     {
        panic("exception");
     }

}

void timer_init()
{
    uint64 cpu_id = r_mhartid();
    //设置间隔位8000000个周期
    //qemu 中一个周期是1ps 约等于8ms
    uint64 intervel = 1000000;
    uint64 x = *(uint64 *)CLINT_TIME;
    x+=intervel;
    *(uint64 *)CLINT_TIMECMP(cpu_id)=x;
    w_mie(r_mie()| MEIE | MTIE | MSIE |SSIE);
    w_mstatus((r_mstatus()&(~MPIE))|MPP_M);
    w_mepc((uint64)main);
    __asm__ __volatile__("mret");
}

void bsp_init()
{
    w_satp(0);
    uart_init();
    printf("booting!\n");
    w_mtvec((uint64)trap_entry);
    timer_init();
    while(1) ;
}