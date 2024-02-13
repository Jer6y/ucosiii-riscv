/*
 * Copyright (c) 2014 Daniel Ramirez. (javamonn@gmail.com)
 *
 * This file's license is 2-clause BSD as in this distribution's LICENSE file.
 */

#include <prt_task.h>
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
#define WARMUP_TIMES 100

TskHandle taskIds[2];
uintptr_t telapsed;
uintptr_t tloop;
uintptr_t tswitch;
U32 count, count1;
U32 status;

void Task01(uintptr_t param1, uintptr_t param2, uintptr_t param3, uintptr_t param4)
{
    for (count = 0; count < WARMUP_TIMES; count++) {
        status = PRT_TaskResume(taskIds[1]);
        tswitch = benchmark_timer_read();
        PRT_Printf("PRT_TaskResume of TA02");
    }
    PRT_Printf("\n\n\n");
    benchmark_timer_initialize();

    for (count = 0; count < BENCHMARKS; count++) {
        PRT_TaskResume(taskIds[1]);
    }

    rtems_test_assert(false);
}

void Task02(uintptr_t param1, uintptr_t param2, uintptr_t param3, uintptr_t param4)
{
    for (count1 = 0; count1 < WARMUP_TIMES; count1++) {
        benchmark_timer_initialize();
        PRT_TaskSuspend(taskIds[1]);
    }

    for (; count < BENCHMARKS - 1;) {
        PRT_TaskSuspend(taskIds[1]);
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

void Init(uintptr_t param1, uintptr_t param2, uintptr_t param3, uintptr_t param4)
{
    struct TskInitParam param = { 0 };

    param.taskEntry = (TskEntryFunc)Task01;
    param.stackSize = 0x800;
    param.name = "TA01";
    param.taskPrio = OS_TSK_PRIORITY_08;
    param.stackAddr = 0;

    status = PRT_TaskCreate(&taskIds[0], &param);
    PRT_Printf("PRT_TaskCreate of TA01");

    param.taskEntry = (TskEntryFunc)Task02;
    param.stackSize = 0x0800;
    param.name = "TA02";
    param.taskPrio = OS_TSK_PRIORITY_05;
    param.stackAddr = 0;

    status = PRT_TaskCreate(&taskIds[1], &param);
    PRT_Printf("PRT_TaskCreate of TA02");

    benchmark_timer_initialize();
    for (count = 0; count < (BENCHMARKS * 2) - 1; count++) {
        __asm__ __volatile__("");
    }
    tloop = benchmark_timer_read();

    status = PRT_TaskResume(taskIds[0]);
    PRT_Printf("PRT_TaskResume of TA01");

    TskHandle taskId;
    PRT_TaskSelf(&taskId);
    status = PRT_TaskDelete(taskId);
    PRT_Printf("PRT_TaskDelete of INIT");
}