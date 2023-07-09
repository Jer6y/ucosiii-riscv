#include "bsp/bsp.h"
#include "kernel/os.h"
#include "cpu/cpu_core.h"
void fstTask(void *p_arg);
void scdTask(void *p_arg);
void controlTsk(void *arg);
//普通任务优先级
#define NORMAL_TSK_PRIO     9     
//任务堆栈大小    
#define TASK_STK_SIZE       2048

int state =0;
//开始任务的优先级
#define START_TSK_PRIO      4
#define START_TASK_OPT      (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR)
CPU_STK startTsk_stk[TASK_STK_SIZE]__attribute__((aligned(16)));
OS_TCB  startTsk_tcb;

CPU_STK fstTsk_stk[TASK_STK_SIZE]__attribute__((aligned(16)));
OS_TCB  fstTsk_tcb;

CPU_STK scdTsk_stk[TASK_STK_SIZE]__attribute__((aligned(16)));
OS_TCB  scdTsk_tcb;


CPU_STK cntlTsk_stk[TASK_STK_SIZE]__attribute__((aligned(16)));
OS_TCB  cntlTsk_tcb;
void startTsk(void* args)
{
    OS_ERR err;
    OSTaskCreate((OS_TCB*)      &fstTsk_tcb,           \
                 (CPU_CHAR*)    "first_task",          \
                 (OS_TASK_PTR)  fstTask,               \
                 (void*)        NULL,                  \
                 (OS_PRIO)      NORMAL_TSK_PRIO,       \
                 (CPU_STK *)    &fstTsk_stk[0],        \
                 (CPU_STK_SIZE) TASK_STK_SIZE/10,      \
                 (CPU_STK_SIZE) TASK_STK_SIZE,         \
                 (OS_MSG_QTY)   0,                     \
                 (OS_TICK)      2,                     \
                 (void*)        NULL,                  \
                 (OS_OPT)       (OS_OPT_TASK_STK_CHK|OS_OPT_TASK_STK_CLR),\
                 &err);
    if(err !=OS_ERR_NONE) 
        panic("startTsk: create fstTask failed");
    OSTaskCreate(&scdTsk_tcb,           \
                 "second_task",         \
                 scdTask,               \
                 NULL,                  \
                 NORMAL_TSK_PRIO,       \
                 &scdTsk_stk[0],        \
                 TASK_STK_SIZE/10,      \
                 TASK_STK_SIZE,         \
                 0,                     \
                 2,                     \
                 NULL,                  \
                 OS_OPT_TASK_STK_CHK|OS_OPT_TASK_STK_CLR,\
                 &err);
    if(err !=OS_ERR_NONE) 
        panic("startTsk: create scdTask failed");
    OSTaskCreate(&cntlTsk_tcb,          \
                "control_task",         \
                 controlTsk,            \
                 NULL,                  \
                 NORMAL_TSK_PRIO,       \
                 &cntlTsk_stk[0],       \
                 TASK_STK_SIZE/10,      \
                 TASK_STK_SIZE,         \
                 0,                     \
                 2,                     \
                 NULL,                  \
                 OS_OPT_TASK_STK_CHK|OS_OPT_TASK_STK_CLR,\
                 &err);
    if(err != OS_ERR_NONE)
        panic("cntlTsk: create contrlTask failed");
    OSTaskDel(&startTsk_tcb,&err);
    panic("init delete failed");
}

void controlTsk(void *arg)
{
    OS_ERR err;
    CPU_SR_ALLOC();
    while(true)
    {
        CPU_CRITICAL_ENTER();
        if(state ==0)
        {
            OSTaskSuspend(&fstTsk_tcb,&err);
            OSTaskResume(&scdTsk_tcb,&err);
        }
        else
        {
            OSTaskSuspend(&scdTsk_tcb,&err);
            OSTaskResume(&fstTsk_tcb,&err);
        }
        state = !state;
        CPU_CRITICAL_EXIT();
        OSTimeDly(3,OS_OPT_TIME_DLY,&err);
        if(err != OS_ERR_NONE)
            panic("cntlTsk: delay failed!");
    }
}

void fstTask(void *p_arg)
{
     while(1)
     {
        OS_ERR err;
        // OSSchedLock(&err);
        printf("Hello,This is task1\n");
        // OSSchedUnlock(&err);
        // OSTimeDly ( 1, OS_OPT_TIME_DLY, & err );
     }
}

void scdTask(void *p_arg)
{
     while(1)
     {
        printf("Task2!!!\n");
        OS_ERR err;
        // for(int i=0;i<80000000;i++) ;
        //  OSTimeDly ( 1, OS_OPT_TIME_DLY, & err );
     }
}

void main(void)
{
    CPU_Init();
    OS_ERR err;
    OSInit(&err);
    if(err != OS_ERR_NONE)
        panic("OSInit: init failed!");
    OSTaskCreate(&startTsk_tcb,     \
                "initTsk",          \
                startTsk,           \
                NULL,               \
                START_TSK_PRIO,     \
                &startTsk_stk[0],   \
                TASK_STK_SIZE/10,   \
                TASK_STK_SIZE,      \
                0,                  \
                3,                  \
                NULL,               \
                START_TASK_OPT,     \
                &err);

    if(err !=OS_ERR_NONE) 
        panic("startTask: create failed!");
    OSStart(&err);
    
    panic("OSStart: start sheched failed!");
}