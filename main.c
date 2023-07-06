#include "bsp/bsp.h"
#include "kernel/os.h"
#include "cpu/cpu_core.h"
//任务优先级
#define START_TASK_PRIO     3
//任务堆栈大小    
#define START_STK_SIZE      2048

//任务控制块
OS_TCB StartTaskTCB;
//任务堆栈  
CPU_STK START_TASK_STK[START_STK_SIZE]__attribute__((aligned(16)));
//任务函数

// //任务控制块
OS_TCB StartTaskTCB2;
// //任务堆栈  
CPU_STK START_TASK_STK2[START_STK_SIZE]__attribute__((aligned(16)));
// //任务函数


void start_task(void *p_arg)
{
     while(1)
     {
        printf("Hello,This is task1\n");
        OS_ERR err;
        for(int i=0;i<80000000;i++) ;
     }
}

void start_task2(void *p_arg)
{
     while(1)
     {
        printf("Task2!!!\n");
        OS_ERR err;
        for(int i=0;i<80000000;i++) ;
        // OSTimeDly ( 3, OS_OPT_TIME_DLY, & err );
     }
}

void main(void)
{
    CPU_Init();
    OS_ERR err;
    OSInit(&err);
    if(err != OS_ERR_NONE)
    {
        panic("error");
    }
     OSTaskCreate((OS_TCB    * )&StartTaskTCB,       //任务控制块
                 (CPU_CHAR  * )"start task",        //任务名字,自己起的
                 (OS_TASK_PTR )start_task,          //任务函数
                 (void      * )0,                   //传递给任务函数的参数
                 (OS_PRIO     )START_TASK_PRIO,     //任务优先级
                 (CPU_STK   * )&START_TASK_STK[0],  //任务堆栈基地址
                 (CPU_STK_SIZE)START_STK_SIZE/10,   //任务堆栈深度限位
                 (CPU_STK_SIZE)START_STK_SIZE,      //任务堆栈大小
                 (OS_MSG_QTY  )0,                   //任务内部消息队列能够接收的最大消息数目,为0时禁止接收消息
                 (OS_TICK     )2,                   //当使能时间片轮转时的时间片长度，为0时为默认长度，
                 (void      * )0,                   //用户补充的存储区
                 (OS_OPT      )OS_OPT_TASK_STK_CHK|OS_OPT_TASK_STK_CLR, //任务选项
                 (OS_ERR    * )&err); 

    OSTaskCreate((OS_TCB    * )&StartTaskTCB2,       //任务控制块
                 (CPU_CHAR  * )"start task2",        //任务名字,自己起的
                 (OS_TASK_PTR )start_task2,          //任务函数
                 (void      * )0,                   //传递给任务函数的参数
                 (OS_PRIO     )START_TASK_PRIO,     //任务优先级
                 (CPU_STK   * )&START_TASK_STK2[0],  //任务堆栈基地址
                 (CPU_STK_SIZE)START_STK_SIZE/10,   //任务堆栈深度限位
                 (CPU_STK_SIZE)START_STK_SIZE,      //任务堆栈大小
                 (OS_MSG_QTY  )0,                   //任务内部消息队列能够接收的最大消息数目,为0时禁止接收消息
                 (OS_TICK     )2,                   //当使能时间片轮转时的时间片长度，为0时为默认长度，
                 (void      * )0,                   //用户补充的存储区
                 (OS_OPT      )OS_OPT_TASK_STK_CHK|OS_OPT_TASK_STK_CLR, //任务选项
                 (OS_ERR    * )&err);      
    
    
    OSStart(&err);
    
    panic("error");
}