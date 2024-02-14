/*
 * Copyright (c) 2014 Daniel Ramirez. (javamonn@gmail.com)
 *
 * This file's license is 2-clause BSD as in this distribution's LICENSE file.
 */

#include "adaptor.h"
#include "os.h"
#include "cpu_core.h"

extern void benchmark_timer_initialize(void);
extern uint64 benchmark_timer_read(void);

#define rtems_test_assert(x) 
#define trans( _total_time, \
            _iterations, _loop_overhead, _overhead )    \
    (((_total_time) - (_loop_overhead)) / (_iterations)) - (_overhead)


#define BENCHMARKS 50000
#define WARM_UP_TIMES 500
#define TASK_STK_SIZE       4096
#define TASK_TSK_PRIO       4
#define TASK_OPT      (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR)

OS_TCB taskIds[4];
CPU_STK taskStk_1[TASK_STK_SIZE]__attribute__((aligned(16)));
CPU_STK taskStk_2[TASK_STK_SIZE]__attribute__((aligned(16)));
CPU_STK taskStk_3[TASK_STK_SIZE]__attribute__((aligned(16)));
CPU_STK taskStk_4[TASK_STK_SIZE]__attribute__((aligned(16)));


OS_SEM semId;
uintptr_t telapsed;
uintptr_t tswitch;
U32 count;
U32 semFlag;

void Task01(void* arg)
{
    OS_ERR err;
    if (semFlag == 0) {
        OSTaskResume(&taskIds[1],&err);
        PRT_Printf("PRT_TaskResume of TA02 %d\n",err);
    } else {
        OSTaskResume(&taskIds[3],&err);
        PRT_Printf("PRT_TaskResume of TA02 %d\n",err);
    }
    OSSchedRoundRobinYield(&err);

    for (; count < BENCHMARKS;) {
        if (semFlag == 1) {
            OSSemPend(&semId, 0, OS_OPT_PEND_BLOCKING, NULL, &err);
        }
        OSSchedRoundRobinYield(&err);

        if (semFlag == 1) {
            OSSemPost(&semId, OS_OPT_POST_1, &err);
        }
        OSSchedRoundRobinYield(&err);
    }

    rtems_test_assert(false);
    panic("shuffle error end");
}

void Task02(void* arg)
{
    OS_ERR err;
    benchmark_timer_initialize();
    for (count = 0; count < BENCHMARKS; count++) {
        if (semFlag == 1) {
            OSSemPend(&semId, 0, OS_OPT_PEND_BLOCKING, NULL, &err);
        }
        OSSchedRoundRobinYield(&err);

        if (semFlag == 1) {
             OSSemPost(&semId, OS_OPT_POST_1, &err);
        }
        OSSchedRoundRobinYield(&err);
    }
    telapsed = benchmark_timer_read();

    if (semFlag == 0) {
        tswitch = telapsed;
        OSTaskSuspend(&taskIds[0], &err);
        OSTaskSuspend(&taskIds[1], &err);
    } else {
        U64 cycle = trans(telapsed, (BENCHMARKS * 2), tswitch, 0);
        PRT_Printf("tsk total cycle: %ld cyc\n",telapsed);
        PRT_Printf("tsk swith cycle: %ld cyc\n",tswitch);
        PRT_Printf("sem shufl cycle: %ld cyc\n",cycle);
        PRT_Printf("sem shufl time : %ld cyc\n",PRT_ClkCycle2Us(cycle));
        PRT_SysReboot();
    }
}

void Init(uintptr_t param1, uintptr_t param2, uintptr_t param3, uintptr_t param4)
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
    
    OSTaskSuspend(&taskIds[1], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task02 failed");

    OSTaskSuspend(&taskIds[0], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task01 failed");

    OSSemCreate(&semId, "semphare", 1, &err);
    if(err !=OS_ERR_NONE) 
        panic("create semphare failed");

    OSTaskChangePrio (NULL, TASK_TSK_PRIO + 2, &err);
    if(err !=OS_ERR_NONE) 
        panic("change prio failed");
    
    semFlag = 0;
    OSTaskResume(&taskIds[0], &err);

    OSTaskChangePrio(NULL, TASK_TSK_PRIO - 1, &err);
    if(err !=OS_ERR_NONE) 
        panic("change prio failed");

    OSTaskCreate((OS_TCB*)      &taskIds[2],           \
                 (CPU_CHAR*)    "TA03",                \
                 (OS_TASK_PTR)  Task01,                \
                 (void*)        NULL,                  \
                 (OS_PRIO)      TASK_TSK_PRIO,         \
                 (CPU_STK *)    &taskStk_3[0],         \
                 (CPU_STK_SIZE) TASK_STK_SIZE/10,      \
                 (CPU_STK_SIZE) TASK_STK_SIZE,         \
                 (OS_MSG_QTY)   0,                     \
                 (OS_TICK)      100000,                \
                 (void*)        NULL,                  \
                 (OS_OPT)       TASK_OPT,              \
                 &err);
    if(err !=OS_ERR_NONE) 
        panic("create task03 failed");

    OSTaskCreate((OS_TCB*)      &taskIds[3],           \
                 (CPU_CHAR*)    "TA04",                \
                 (OS_TASK_PTR)  Task02,                \
                 (void*)        NULL,                  \
                 (OS_PRIO)      TASK_TSK_PRIO,         \
                 (CPU_STK *)    &taskStk_4[0],         \
                 (CPU_STK_SIZE) TASK_STK_SIZE/10,      \
                 (CPU_STK_SIZE) TASK_STK_SIZE,         \
                 (OS_MSG_QTY)   0,                     \
                 (OS_TICK)      100000,                \
                 (void*)        NULL,                  \
                 (OS_OPT)       TASK_OPT,              \
                 &err);
    if(err !=OS_ERR_NONE) 
        panic("create task04 failed");

    OSTaskSuspend(&taskIds[2], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task03 failed");

    OSTaskSuspend(&taskIds[3], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task04 failed");

    OSTaskChangePrio (NULL, TASK_TSK_PRIO + 2, &err);
    if(err !=OS_ERR_NONE) 
        panic("change prio failed");

    semFlag = 1;
    OSTaskResume(&taskIds[2], &err);
    PRT_Printf("benchmark_task_create of TA01 %d\n",err);
    panic("end fail");
    rtems_test_assert(false);
}
