/*
 * Copyright (c) 2014 Daniel Ramirez. (javamonn@gmail.com)
 *
 * This file's license is 2-clause BSD as in this distribution's LICENSE file.
 */

#include <prt_task.h>
#include <prt_sem.h>
#include <prt_sys.h>
#include <prt_clk.h>
extern void benchmark_timer_initialize(void);
extern uintptr_t benchmark_timer_read(void);
extern int PRT_Printf(char* str, ...); 
#define rtems_test_assert(x) 
#define put_time( _message, _total_time, \
                  _iterations, _loop_overhead, _overhead ) \
    PRT_Printf( \
      "%s - %d cycle\n", \
      (_message), \
      (((_total_time) - (_loop_overhead)) / (_iterations)) - (_overhead) \
    )
#define trans( _total_time, \
            _iterations, _loop_overhead, _overhead )    \
    (((_total_time) - (_loop_overhead)) / (_iterations)) - (_overhead)


#define BENCHMARKS 50000

TskHandle taskId[2];
SemHandle semId;
uintptr_t telapsed;
uintptr_t tswitch;
U32 count;
U32 semFlag;

void Task01(uintptr_t param1, uintptr_t param2, uintptr_t param3, uintptr_t param4)
{
    U32 status;

    if (semFlag == 0) {
        status = PRT_TaskResume(taskId[1]);
        PRT_Printf("PRT_TaskResume of TA02 %d\n",status);
    } else {
        status = PRT_TaskResume(taskId[1]);
        PRT_Printf("PRT_TaskResume of TA02 %d\n",status);
    }
    PRT_TaskDelay(0);

    for (; count < BENCHMARKS;) {
        if (semFlag == 1) {
            PRT_SemPend(semId, OS_WAIT_FOREVER);
        }
        PRT_TaskDelay(0);

        if (semFlag == 1) {
            PRT_SemPost(semId);
        }
        PRT_TaskDelay(0);
    }

    rtems_test_assert(false);
}

void Task02(uintptr_t param1, uintptr_t param2, uintptr_t param3, uintptr_t param4)
{
    benchmark_timer_initialize();
    for (count = 0; count < BENCHMARKS; count++) {
        if (semFlag == 1) {
            PRT_SemPend(semId, OS_WAIT_FOREVER);
        }
        PRT_TaskDelay(0);

        if (semFlag == 1) {
            PRT_SemPost(semId);
        }
        PRT_TaskDelay(0);
    }
    telapsed = benchmark_timer_read();

    if (semFlag == 0) {
        tswitch = telapsed;
        PRT_TaskSuspend(taskId[0]);
        PRT_TaskSuspend(taskId[1]);
    } else {
        // put_time(
        //     "Rhealstone: Semaphore Shuffle",
        //     telapsed,
        //     (BENCHMARKS * 2),
        //     tswitch,
        //     0
        // );
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
    struct TskInitParam param = { 0 };
    TskHandle pid;
    U32 status;

    status = PRT_SemCreate(1, &semId);
    PRT_Printf("PRT_SemCreate of S0 %d\n",status);

    param.taskEntry = Task01;
    param.stackSize = 0x800;
    param.name = "TA01";
    param.taskPrio = OS_TSK_PRIORITY_19;
    param.stackAddr = 0;
    status = PRT_TaskCreate(&taskId[0], &param);
    PRT_Printf("PRT_TaskCreate of TA01 %d\n",status);

    param.taskEntry = Task02;
    param.stackSize = 0x800;
    param.name = "TA02";
    param.taskPrio = OS_TSK_PRIORITY_19;
    param.stackAddr = 0;
    status = PRT_TaskCreate(&taskId[1], &param);
    PRT_Printf("PRT_TaskCreate of TA02 %d\n",status);

    status = PRT_TaskSelf(&pid);
    PRT_Printf("PRT_TaskSelf %d\n",status);

    status = PRT_TaskSetPriority(pid, OS_TSK_PRIORITY_25);
    PRT_Printf("PRT_TaskSetPriority %d\n",status);

    semFlag = 0;
    status = PRT_TaskResume(taskId[0]);
    PRT_Printf("PRT_TaskResume of TA01 %d\n",status);

    param.taskEntry = Task01;
    param.stackSize = 0x800;
    param.name = "TA01";
    param.taskPrio = OS_TSK_PRIORITY_19;
    param.stackAddr = 0;
    status = PRT_TaskCreate(&taskId[0], &param);
    PRT_Printf("PRT_TaskCreate of TA01 %d\n",status);

    param.taskEntry = Task02;
    param.stackSize = 0x800;
    param.name = "TA02";
    param.taskPrio = OS_TSK_PRIORITY_19;
    param.stackAddr = 0;
    status = PRT_TaskCreate(&taskId[1], &param);
    PRT_Printf("PRT_TaskCreate of TA02 %d\n",status);

    semFlag = 1;
    status = PRT_TaskResume(taskId[0]);
    PRT_Printf("benchmark_task_create of TA01 %d\n",status);

    rtems_test_assert(false);
}
