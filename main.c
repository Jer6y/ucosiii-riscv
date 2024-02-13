#include "bsp/bsp.h"
#include "kernel/os.h"
#include "cpu/cpu_core.h"

//普通任务优先级
#define NORMAL_TSK_PRIO     2
//任务堆栈大小    
#define TASK_STK_SIZE       4096

#define TASK_OPT      (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR)
CPU_STK init_stk[TASK_STK_SIZE]__attribute__((aligned(16)));
OS_TCB  init_tcb;

int main(void)
{
    CPU_Init();
    OS_ERR err;
    OSInit(&err);
    if(err != OS_ERR_NONE)
        panic("OSInit: init failed!");
    extern void Init(void* args);
    OSTaskCreate(&init_tcb,         \
                "initTsk",          \
                Init,               \
                NULL,               \
                NORMAL_TSK_PRIO,    \
                &init_stk[0],       \
                TASK_STK_SIZE/10,   \
                TASK_STK_SIZE,      \
                0,                  \
                1,                  \
                NULL,               \
                TASK_OPT,           \
                &err);

    if(err !=OS_ERR_NONE) 
        panic("startTask: create failed!");
    OSStart(&err);
    panic("OSStart: start sheched failed!");
}