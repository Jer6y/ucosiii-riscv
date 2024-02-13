/*
 * Copyright (c) 2014 Daniel Ramirez. (javamonn@gmail.com)
 *
 * This file's license is 2-clause BSD as in this distribution's LICENSE file.
 */

#include "adaptor.h"
#include "os.h"
#include "cpu_core.h"
#define WARM_UP_TIMES 500

extern void benchmark_timer_initialize(void);
extern uint64 benchmark_timer_read(void);

#define rtems_test_assert(x) 
#define trans( _total_time, \
            _iterations, _loop_overhead, _overhead )    \
    (((_total_time) - (_loop_overhead)) / (_iterations)) - (_overhead)

#define BENCHMARKS 50000

#define TASK_STK_SIZE       4096
#define TASK_TSK_PRIO       4
#define TASK_OPT      (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR)
OS_TCB taskIds[2];
CPU_STK taskStk_1[TASK_STK_SIZE]__attribute__((aligned(16)));
CPU_STK taskStk_2[TASK_STK_SIZE]__attribute__((aligned(16)));

uintptr_t loopCycle;
uintptr_t dirOverhead;
U32 count1, count2;
U32 status;

void Task02(uintptr_t param1, uintptr_t param2, uintptr_t param3,uintptr_t param4)
{
    uintptr_t telapsed;
    OS_ERR err;
    benchmark_timer_initialize();

    for (count1 = 0; count1 < BENCHMARKS - 1; count1++) {
        OSSchedRoundRobinYield(&err);
    }

    telapsed = benchmark_timer_read();
    PRT_Printf("tsk used total cycle    : %ld cyc\n",telapsed);
    PRT_Printf("tsk loop cycle total    : %ld cyc\n",loopCycle);
    U64 cycle = trans(telapsed,(BENCHMARKS * 2) - 1,loopCycle,dirOverhead);
    PRT_Printf("tsk single switch cycle : %ld cyc\n",cycle);
    PRT_Printf("tsk single switch time  : %ld us\n",PRT_ClkCycle2Us(cycle));
    PRT_SysReboot();
    // while(1);
}

void Task01(void* args)
{
    OS_ERR err;
    OSSchedRoundRobinYield(&err);

    for (count2 = 0; count2 < BENCHMARKS; count2++) {
        OSSchedRoundRobinYield(&err);
    }

    rtems_test_assert(false);
    panic("123");
}

void Init(void* args)
{
    OS_ERR err;
    OSTaskCreate((OS_TCB*)      &taskIds[0],           \
                 (CPU_CHAR*)    "TA01",                \
                 (OS_TASK_PTR)  Task01,                \
                 (void*)        NULL,                  \
                 (OS_PRIO)      TASK_TSK_PRIO,         \
                 (CPU_STK *)    &taskStk_1[0],         \
                 (CPU_STK_SIZE) TASK_STK_SIZE/10,      \
                 (CPU_STK_SIZE) TASK_STK_SIZE,         \
                 (OS_MSG_QTY)   0,                     \
                 (OS_TICK)      100000,                \
                 (void*)        NULL,                  \
                 (OS_OPT)       TASK_OPT,              \
                 &err);
    if(err !=OS_ERR_NONE) 
        panic("create task01 failed");

    
    OSTaskCreate((OS_TCB*)      &taskIds[1],           \
                 (CPU_CHAR*)    "TA02",                \
                 (OS_TASK_PTR)  Task02,                \
                 (void*)        NULL,                  \
                 (OS_PRIO)      TASK_TSK_PRIO,         \
                 (CPU_STK *)    &taskStk_2[0],         \
                 (CPU_STK_SIZE) TASK_STK_SIZE/10,      \
                 (CPU_STK_SIZE) TASK_STK_SIZE,         \
                 (OS_MSG_QTY)   0,                     \
                 (OS_TICK)      100000,                \
                 (void*)        NULL,                  \
                 (OS_OPT)       TASK_OPT,              \
                 &err);
    if(err !=OS_ERR_NONE) 
        panic("create task02 failed");

    benchmark_timer_initialize();
    for (count1 = 0; count1 < BENCHMARKS - 1; count1++) {
        __asm__ __volatile__("");
    }
    for (count2 = 0; count2 < BENCHMARKS; count2++) {
        __asm__ __volatile__("");
    }
    loopCycle = benchmark_timer_read();

    OSSchedRoundRobinYield(&err);
    if(err !=OS_ERR_ROUND_ROBIN_1) 
        panic("yield error");

    for(int i=0;i<WARM_UP_TIMES;i++)
    {
        benchmark_timer_initialize();
        OSSchedRoundRobinYield(&err);
        dirOverhead += benchmark_timer_read();
    }
    dirOverhead /=WARM_UP_TIMES;
    
    PRT_Printf("PRT_TaskResume of TA01\n");

    OSTaskDel(NULL, &err);
    
    PRT_Printf("PRT_TaskDelete of INIT ERROR\n");
    panic("error in del\n");
}
