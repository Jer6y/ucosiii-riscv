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

#define MESSAGE_SIZE (sizeof(long) * 4)
#define BENCHMARKS      100000      
#define WARM_UP_TIMES   500

uintptr_t telapsed;
uintptr_t tloopOverhead;
uintptr_t treceiveOverhead;
U32 count;
#define TASK_STK_SIZE       4096
#define TASK_TSK_PRIO       4
#define TASK_OPT      (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR)
OS_TCB taskIds[2];
CPU_STK taskStk_1[TASK_STK_SIZE]__attribute__((aligned(16)));
CPU_STK taskStk_2[TASK_STK_SIZE]__attribute__((aligned(16)));

OS_Q queueId;
long messageBuffer[4];

void Task01(void* args)
{
    OS_ERR err;
    size_t size;
    for(int i=0; i<WARM_UP_TIMES; i++) {
        OSQPost(&queueId, messageBuffer, MESSAGE_SIZE, OS_OPT_POST_FIFO, &err);
        OSQPend(&queueId, 0, OS_OPT_PEND_BLOCKING, &size, NULL, &err);
    }

    /* Put a message in the queue so recieve overhead can be found. */
    OSQPost(&queueId, messageBuffer, MESSAGE_SIZE, OS_OPT_POST_FIFO, &err);
    /* status up second task, get preempted */
    OSTaskResume(&(taskIds[1]),&err);
    //PRT_Printf("PRT_TaskResume %d\n",status);

    for ( int i =0 ; i < BENCHMARKS; i++) {
        OSQPost(&queueId, messageBuffer, MESSAGE_SIZE, OS_OPT_POST_FIFO, &err);
    }

    /* should never reach here */
    rtems_test_assert(false);
    panic("err end");
}

void Task02(void* args)
{
    size_t size = MESSAGE_SIZE;
    OS_ERR err;


    /* find recieve overhead - no preempt or task switch */
    for(int i=0; i<WARM_UP_TIMES -1 ; i++) {
        benchmark_timer_initialize();
        size = MESSAGE_SIZE;
        OSQPend(&queueId, 0, OS_OPT_PEND_BLOCKING, &size, NULL, &err);
        treceiveOverhead += benchmark_timer_read();
        OSQPost(&queueId, messageBuffer, MESSAGE_SIZE, OS_OPT_POST_FIFO, &err);
    }
    
    
    benchmark_timer_initialize();
    size = MESSAGE_SIZE;
    OSQPend(&queueId, 0, OS_OPT_PEND_BLOCKING, &size, NULL, &err);
    treceiveOverhead += benchmark_timer_read();

    treceiveOverhead /= WARM_UP_TIMES;

    /* Benchmark code */
    benchmark_timer_initialize();
    for (int i = 0; i < BENCHMARKS - 1; i++) {
        size = MESSAGE_SIZE;
        OSQPend(&queueId, 0, OS_OPT_PEND_BLOCKING, &size, NULL, &err);
    }
    telapsed = benchmark_timer_read();
    PRT_Printf("tsk used total cycle    : %ld cyc\n",telapsed);
    PRT_Printf("tsk loop cycle total    : %ld cyc\n",tloopOverhead);
    PRT_Printf("treceiveOverhead cycle  : %ld cyc\n",treceiveOverhead);
    
    U64 cycle = trans(telapsed,BENCHMARKS - 1,tloopOverhead,treceiveOverhead);
    // U64 cycle = (telapsed - tloopOverhead) / (BENCHMARKS - 1);
    PRT_Printf("tsk msg-latency cycle   : %ld cyc\n",cycle);
    PRT_Printf("tsk msg-latency time    : %ld us\n",PRT_ClkCycle2Us(cycle));
    
    // put_time(
    //     "Rhealstone: Intertask Message Latency",
    //     telapsed,
    //     BENCHMARKS - 1,
    //     tloopOverhead,
    //     treceiveOverhead
    // );

    PRT_SysReboot();
}

void Init(void* arg)
{
    OS_ERR err;
    OSQCreate(&queueId, "msg_queue", 1000, &err);
    PRT_Printf("message_queue_create %d\n",err);
    if(err !=OS_ERR_NONE) 
        panic("msg create fail");

    OSTaskCreate((OS_TCB*)      &taskIds[0],           \
                 (CPU_CHAR*)    "TA01",                \
                 (OS_TASK_PTR)  Task01,                \
                 (void*)        NULL,                  \
                 (OS_PRIO)      TASK_TSK_PRIO+1,       \
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
                 (OS_PRIO)      TASK_TSK_PRIO-1,       \
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
    for (int i = 0; i < BENCHMARKS - 1; i++) {
        __asm__ __volatile__("");
    }
    tloopOverhead = benchmark_timer_read();
   
    OSTaskSuspend(&taskIds[1], &err);
    if(err !=OS_ERR_NONE) 
        panic("suspend task02 failed");

    OSTaskDel(NULL, &err);
    
    PRT_Printf("PRT_TaskDelete of INIT ERROR\n");
    panic("error in del\n");
}
