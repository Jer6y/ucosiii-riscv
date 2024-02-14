/*
 * Copyright (c) 2014 Daniel Ramirez. (javamonn@gmail.com)
 *
 * This file's license is 2-clause BSD as in this distribution's LICENSE file.
 */

#include "adaptor.h"
#include "os.h"
#include "cpu_core.h"
#define WARMUP_TIMES 5000

extern void benchmark_timer_initialize(void);
extern uint64 benchmark_timer_read(void);

#define rtems_test_assert(x) 
#define trans( _total_time, \
            _iterations, _loop_overhead, _overhead )    \
    (((_total_time) - (_loop_overhead)) / (_iterations)) - (_overhead)

#define BENCHMARKS 50000

#define TASK_STK_SIZE       4096
#define TASK_TSK_PRIO_1     8
#define TASK_TSK_PRIO_2     5
#define TASK_OPT      (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR)

OS_TCB taskIds[2];
CPU_STK taskStk_1[TASK_STK_SIZE]__attribute__((aligned(16)));
CPU_STK taskStk_2[TASK_STK_SIZE]__attribute__((aligned(16)));

uintptr_t telapsed;
uintptr_t tloop;
uintptr_t tswitch;
U32 count, count1;

void Task01(void* arg)
{
    OS_ERR err;
    for (count = 0; count < WARMUP_TIMES; count++) {
        OSTaskResume(&(taskIds[1]),&err);
        tswitch += benchmark_timer_read();
        //PRT_Printf("PRT_TaskResume of TA02");
    }
    tswitch /= WARMUP_TIMES;
    PRT_Printf("warm-up end\n");
    benchmark_timer_initialize();

    for (count = 0; count < BENCHMARKS; count++) {
        OSTaskResume(&(taskIds[1]),&err);
    }

    panic("assert");
    rtems_test_assert(false);
}

void Task02(void* arg)
{
    OS_ERR err;

    for (count1 = 0; count1 < WARMUP_TIMES; count1++) {
        benchmark_timer_initialize();
        OSTaskSuspend(&taskIds[1], &err);
    }

    for (; count < BENCHMARKS - 1;) {
        OSTaskSuspend(&taskIds[1], &err);
    }

    telapsed = benchmark_timer_read();

    PRT_Printf("tsk used total cycle    : %ld cyc\n",telapsed);
    PRT_Printf("tsk loop cycle total    : %ld cyc\n",tloop);
    PRT_Printf("tsk switch cycle        : %ld cyc\n",tswitch);
    U64 cycle = trans(telapsed,BENCHMARKS-1,tloop,tswitch);
    // put_time(
    //     "Rhealstone: Task Preempt",
    //     telapsed,
    //     BENCHMARKS - 1,
    //     tloop,
    //     tswitch
    // );
    PRT_Printf("tsk preempt cycle       : %ld cyc\n",cycle);
    PRT_Printf("tsk preempt time        : %ld us\n",PRT_ClkCycle2Us(cycle));

    PRT_SysReboot();
}

void Init(void* arg)
{
    OS_ERR err;
    OSTaskCreate((OS_TCB*)      &taskIds[0],           \
                 (CPU_CHAR*)    "TA01",                \
                 (OS_TASK_PTR)  Task01,                \
                 (void*)        NULL,                  \
                 (OS_PRIO)      TASK_TSK_PRIO_1,       \
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
                 (OS_PRIO)      TASK_TSK_PRIO_2,       \
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
    for (count = 0; count < (BENCHMARKS * 2) - 1; count++) {
        __asm__ __volatile__("");
    }
    tloop = benchmark_timer_read();

    OSTaskSuspend(&taskIds[1], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task02 failed");

    PRT_Printf("PRT_TaskResume of TA01");

    OSTaskDel(NULL, &err);
    
    PRT_Printf("PRT_TaskDelete of INIT ERROR\n");
    panic("error in del\n");
}