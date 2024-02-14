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

#define BENCHMARKS 20000
#define WARM_UP_TIMES 1000

#define TASK_STK_SIZE       4096
#define TASK_TSK_PRIO_1     6
#define TASK_TSK_PRIO_2     7
#define TASK_TSK_PRIO_3     8
#define TASK_OPT      (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR)

OS_TCB taskIds[3];
CPU_STK taskStk_1[TASK_STK_SIZE]__attribute__((aligned(16)));
CPU_STK taskStk_2[TASK_STK_SIZE]__attribute__((aligned(16)));
CPU_STK taskStk_3[TASK_STK_SIZE]__attribute__((aligned(16)));


OS_SEM semId;
U32 status;
U32 count;
U32 semExe;
uintptr_t telapsed;
uintptr_t switchOverhead;
uintptr_t obtainOverhead;

void Task01(void* arg)
{
    /* All tasks have bad time to start up once TA01 is running */
    OS_ERR err;
    /* Benchmark code */
    benchmark_timer_initialize();
    for (count = 0; count < BENCHMARKS; count++) {
        if (semExe == 1) {
            /* Block on call */
            OSSemPend(&semId, 0, OS_OPT_PEND_BLOCKING, NULL, &err);
            // PRT_SemPend(semId, OS_WAIT_FOREVER);
        }

        if (semExe == 1) {
            /* Release semaphore immediately after obtaining it */
            // PRT_SemPost(semId);
            OSSemPost(&semId, OS_OPT_POST_1, &err);
        }

        /* Suspend self, go to TA02 */
        OSTaskSuspend(&taskIds[0], &err);
    }
    telapsed = benchmark_timer_read();

    /* Check which run this was */
    if (semExe == 0) {
        switchOverhead = telapsed;
        OSTaskSuspend(&taskIds[1], &err);
        OSTaskSuspend(&taskIds[2], &err);
        OSTaskSuspend(&taskIds[0], &err);
    } else {
        // put_time (
        //     "Rhealstone: Deadlock Break",
        //     telapsed,
        //     BENCHMARKS,         /* Total number of times deadlock broken */
        //     switchOverhead,   /* Overhead of loop and task switches */
        //     obtainOverhead
        // );
        U64 cycle = trans(telapsed,BENCHMARKS,switchOverhead,obtainOverhead);
        PRT_Printf("tsk used total time : %ld cyc\n", telapsed);
        PRT_Printf("tsk swth total time : %ld cyc\n", switchOverhead);
        PRT_Printf("obtainOverhead time : %ld cyc\n", obtainOverhead);
        PRT_Printf("Rhealstone     time : %ld cyc\n", cycle);
        PRT_Printf("Rhealstone     time : %ld us\n", PRT_ClkCycle2Us(cycle));
        PRT_SysReboot();
    }
}

void Task02(void* arg)
{
    OS_ERR err;
    /* Start up TA01, get preempted */
    if (semExe == 1) {
        OSTaskResume(&taskIds[0], &err);
        // status = PRT_TaskResume(taskIds[0]);
        // PRT_Printf("PRT_TaskResume of TA01 %d\n",status);
    } else {
        OSTaskResume(&taskIds[0], &err);
        // status = PRT_TaskResume(taskIds[0]);
        // PRT_Printf("PRT_TaskResume of TA01 %d\n",status);
    }

    /* Benchmark code */
    for (; count < BENCHMARKS;) {
        /* Suspend self, go to TA01 */
        // PRT_TaskSuspend(taskIds[1]);
        OSTaskSuspend(&taskIds[1], &err);

        /* Wake up TA01, get preempted */
        // PRT_TaskResume(taskIds[0]);
        OSTaskResume(&taskIds[0], &err);
    }
}

void Task03(void* arg)
{
    OS_ERR err;
    if (semExe == 1) {
        /* Low priority task holds mutex */
        OSSemPend(&semId, 0, OS_OPT_PEND_BLOCKING, NULL, &err);
    }

    /* Start up TA02, get preempted */
    if (semExe == 1) {
        OSTaskResume(&taskIds[1], &err);
    } else {
        OSTaskResume(&taskIds[1], &err);
    }

    /* Benchmark code */
    for (; count < BENCHMARKS;) {
        if (semExe == 1) {
            /* Preempted by TA01 upon release */
            OSSemPost(&semId, OS_OPT_POST_1, &err);
        }

        if (semExe == 1) {
            /* Prepare for next Benchmark */
            OSSemPend(&semId, 0, OS_OPT_PEND_BLOCKING, NULL, &err);
        }
        /* Wake up TA02, get preempted */
        OSTaskResume(&taskIds[1], &err);
    }
}

void Init(uintptr_t paraml, uintptr_t param2, uintptr_t param3, uintptr_t param4)
{
    OS_ERR err;
    OSSemCreate(&semId, "semphare", 1, &err);
    if(err !=OS_ERR_NONE) 
        panic("create semphare failed");
    PRT_Printf("PRT_SemCreate of S0 %d\n",err);

    
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
    
    OSTaskCreate((OS_TCB*)      &taskIds[2],           \
                 (CPU_CHAR*)    "TA03",                \
                 (OS_TASK_PTR)  Task03,                \
                 (void*)        NULL,                  \
                 (OS_PRIO)      TASK_TSK_PRIO_3,       \
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

    /* find overhead of obtaining semaphore*/
    for(int i=0;i<WARM_UP_TIMES;i++)
    {
        benchmark_timer_initialize();
        OSSemPend(&semId, 0, OS_OPT_PEND_BLOCKING, NULL, &err);
        obtainOverhead += benchmark_timer_read();
        OSSemPost(&semId, OS_OPT_POST_1, &err);
    }
    obtainOverhead /= WARM_UP_TIMES;
    PRT_Printf("test time: %ld cyc\n",obtainOverhead);
    
    OSTaskSuspend(&taskIds[0], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task01 failed");
    OSTaskSuspend(&taskIds[1], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task02 failed");
    OSTaskSuspend(&taskIds[2], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task03 failed");
    
    OSTaskChangePrio (NULL, TASK_TSK_PRIO_3 + 2, &err);
    if(err !=OS_ERR_NONE) 
        panic("change prio failed");


    /* Get time of benchmark with no semaphores involved, i.e. find overhead */
    semExe = 0;
    OSTaskResume(&taskIds[2], &err);

    OSTaskChangePrio (NULL, TASK_TSK_PRIO_1 - 1, &err);
    if(err !=OS_ERR_NONE) 
        panic("change prio failed");
    
    OSTaskDel(&taskIds[0],&err);
    if(err !=OS_ERR_NONE) 
        panic("del task0 error");
    OSTaskDel(&taskIds[1],&err);
    if(err !=OS_ERR_NONE) 
        panic("del task1 error");
    OSTaskDel(&taskIds[2],&err);
    if(err !=OS_ERR_NONE) 
        panic("del task0 error");
    
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
    
    OSTaskCreate((OS_TCB*)      &taskIds[2],           \
                 (CPU_CHAR*)    "TA03",                \
                 (OS_TASK_PTR)  Task03,                \
                 (void*)        NULL,                  \
                 (OS_PRIO)      TASK_TSK_PRIO_3,       \
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

    OSTaskSuspend(&taskIds[0], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task01 failed");
    OSTaskSuspend(&taskIds[1], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task02 failed");
    OSTaskSuspend(&taskIds[2], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task03 failed");
    
    OSTaskChangePrio (NULL, TASK_TSK_PRIO_3 + 2, &err);
    if(err !=OS_ERR_NONE) 
        panic("change prio failed");

    /* Get time of benchmark with semaphores */
    semExe = 1;
    OSTaskResume(&taskIds[2], &err);
    
    /* Should never reach here*/
    rtems_test_assert(false);
    panic("error end");
}
