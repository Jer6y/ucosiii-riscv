#********************************************************************************************************
#                                              uC/OS-III
#                                        The Real-Time Kernel
#
#                    Copyright 2009-2022 Silicon Laboratories Inc. www.silabs.com
#
#                                 SPDX-License-Identifier: APACHE-2.0
#
#               This software is subject to an open source license and is distributed by
#                Silicon Laboratories Inc. pursuant to the terms of the Apache License,
#                    Version 2.0 available at www.apache.org/licenses/LICENSE-2.0.
#
#********************************************************************************************************

#********************************************************************************************************
#
#                                        ASSEMBLY LANGUAGE PORT
#                                              RISC-V PORT
#
# File      : os_cpu_a.S
# Version   : V3.08.02
#********************************************************************************************************
# For       : RISC-V RV64
# Toolchain : GNU C Compiler
#********************************************************************************************************
# Note(s)   : Hardware FP is not supported.
#********************************************************************************************************

#********************************************************************************************************
#                                          PUBLIC FUNCTIONS
#********************************************************************************************************

    .extern  OSRunning                               # External references
    .extern  OSPrioCur
    .extern  OSPrioHighRdy
    .extern  OSTCBCurPtr
    .extern  OSTCBHighRdyPtr
    .extern  OSIntExit
    .extern  OSTaskSwHook


    .global  OSStartHighRdy                          # Functions declared in this file
    .global  OSCtxSw
    .global  OSIntCtxSw
    .global  Software_IRQHandler


#********************************************************************************************************
#                                               EQUATES
#********************************************************************************************************

    .equ  RISCV_MSTATUS_MIE,         0x08

    .equ  RISCV_MIE_MSIE,            0x08            # M Soft Interrupt bit

    .equ  RISCV64_SIE_BIT,           0x2

#********************************************************************************************************
#                                     CODE GENERATION DIRECTIVES
#********************************************************************************************************

.section .text


#********************************************************************************************************
#                                         START MULTITASKING
#                                      void OSStartHighRdy(void)
#
# Note(s) : 1) OSStartHighRdy() MUST:
#              a) Call OSTaskSwHook() then,
#              b) Set OSRunning to TRUE,
#              c) Set OSTCBHighRdyPtr->StkPtr = SP
#              d) Restore x1-x31; There is no need to restore x0 since it is always zero.
#              e) Enable interrupts (tasks will run with interrupts enabled).
#              f) Switch to highest priority task.
#********************************************************************************************************

OSStartHighRdy:
# Disable interrupts
    li     t0, RISCV_MSTATUS_MIE
    csrrc  zero, mstatus, t0

# Execute OS task switch hook.
    jal    OSTaskSwHook

# OSRunning = TRUE;
    li     t0, 0x01
    la     t1, OSRunning
    sb     t0, 0(t1)

# SWITCH TO HIGHEST PRIORITY TASK
    la     t0, OSTCBHighRdyPtr
    ld     t1, 0(t0)
    ld     sp, 0(t1)

# Retrieve the location where to jump
    ld     t0, 31 * 8(sp)
    csrw   mepc, t0

# Restore x1 to x31 registers
    ld     ra,   0 * 8(sp)
    ld     t0,   4 * 8(sp)
    ld     t1,   5 * 8(sp)
    ld     t2,   6 * 8(sp)
    ld     s0,   7 * 8(sp)
    ld     s1,   8 * 8(sp)
    ld     a0,   9 * 8(sp)
    ld     a1,  10 * 8(sp)
    ld     a2,  11 * 8(sp)
    ld     a3,  12 * 8(sp)
    ld     a4,  13 * 8(sp)
    ld     a5,  14 * 8(sp)
    ld     a6,  15 * 8(sp)
    ld     a7,  16 * 8(sp)
    ld     s2,  17 * 8(sp)
    ld     s3,  18 * 8(sp)
    ld     s4,  19 * 8(sp)
    ld     s5,  20 * 8(sp)
    ld     s6,  21 * 8(sp)
    ld     s7,  22 * 8(sp)
    ld     s8,  23 * 8(sp)
    ld     s9,  24 * 8(sp)
    ld     s10, 25 * 8(sp)
    ld     s11, 26 * 8(sp)
    ld     t3,  27 * 8(sp)
    ld     t4,  28 * 8(sp)
    ld     t5,  29 * 8(sp)
    ld     t6,  30 * 8(sp)

# Compensate for the stack pointer
    addi   sp, sp, 32 * 8

# Use register t6 to jump to HIGHEST priority
    csrr   t6, mepc

# Enable global interrupts
    li     t0, RISCV_MSTATUS_MIE
    csrrs  zero, mstatus, t0

# Jump to HIGHEST priority task.
    jalr   x0, t6, 0


#********************************************************************************************************
#                       PERFORM A CONTEXT SWITCH (From task level) - OSCtxSw()
#                   PERFORM A CONTEXT SWITCH (From interrupt level) - OSIntCtxSw()
#
# Note(s) : 1) OSCtxSw() is called when OS wants to perform a task context switch.  This function
#              triggers a synchronous software interrupt by writing into the MSIP register
#
#           2) OSIntCtxSw() is called by OSIntExit() when it determines a context switch is needed as
#              the result of an interrupt.  This function triggers a synchronous software interrupt by
#              writing into the MSIP register
#********************************************************************************************************

OSCtxSw:
OSIntCtxSw:
# MIE_MSIE -- enable software interrupt bit
    li     t0, RISCV_MIE_MSIE
    csrrs  zero, mie, t0

# This will trigger a synchronous software interrupt; PRCI->MSIP[0] = 0x01;
    li     t0, RISCV64_SIE_BIT
    csrw   mip,t0
    ret


#********************************************************************************************************
#                                   void Software_IRQHandler (void)
#
# Note(s) : 1) This function is defined with weak linking in 'riscv_hal_stubs.c' so that it can be
#              overridden by the kernel port with same prototype.
#
#           2) Pseudo-code is:
#              a) Disable global interrupts.
#              b) Clear soft interrupt for hart0.
#              c) Save the process SP in its TCB, OSTCBCurPtr->StkPtr = SP;
#              d) Call OSTaskSwHook();
#              e) Get current high priority, OSPrioCur = OSPrioHighRdy;
#              f) Get current ready thread TCB, OSTCBCurPtr = OSTCBHighRdyPtr;
#              g) Get new process SP from TCB, SP = OSTCBHighRdyPtr->StkPtr;
#              h) Retrieve the address at which exception happened
#              i) Restore x1-x31 from new process stack; x0 is always zero.
#              j) Perform exception return which will restore remaining context.
#
#           3) On entry into Software_IRQHandler:
#              a) The initial register context save is being done by 'entry.S'
#              b) Stack pointer was passed by 'entry.s' in register a2.
#              c) OSTCBCurPtr      points to the OS_TCB of the task to suspend
#                 OSTCBHighRdyPtr  points to the OS_TCB of the task to resume
#********************************************************************************************************

Software_IRQHandler:
# Disable interrupts globally and prevent interruption during context switch
    li     t0, RISCV_MSTATUS_MIE
    csrrc  zero, mstatus, t0

# Clear soft interrupt for hart0, PRCI->MSIP[0] = 0x00;
    li     t0, RISCV64_SIE_BIT
    csrrc zero,mip,t0

# Stack pointer was passed by 'entry.s' in register a2.
# OSTCBCurPtr->StkPtr = SP;
    la     t0, OSTCBCurPtr
    ld     t1, 0(t0)
    sd     a2, 0(t1)

# Execute OS task switch hook.
    jal    OSTaskSwHook

# OSPrioCur = OSPrioHighRdy;
    la     t0, OSPrioHighRdy
    lb     t1, 0(t0)
    la     t0, OSPrioCur
    sb     t1, 0(t0)

# OSTCBCurPtr = OSTCBHighRdyPtr;
    la     t0, OSTCBHighRdyPtr
    ld     t1, 0(t0)
    la     t0, OSTCBCurPtr
    sd     t1, 0(t0)

# SP = OSTCBHighRdyPtr->StkPtr;
    ld     sp, 0(t1)

# Retrieve the address at which exception happened
    ld     t0, 31 * 8(sp)
    csrw   mepc, t0

# Restore x1 to x31 registers
    ld     ra,   0 * 8(sp)
    ld     t0,   4 * 8(sp)
    ld     t1,   5 * 8(sp)
    ld     t2,   6 * 8(sp)
    ld     s0,   7 * 8(sp)
    ld     s1,   8 * 8(sp)
    ld     a0,   9 * 8(sp)
    ld     a1,  10 * 8(sp)
    ld     a2,  11 * 8(sp)
    ld     a3,  12 * 8(sp)
    ld     a4,  13 * 8(sp)
    ld     a5,  14 * 8(sp)
    ld     a6,  15 * 8(sp)
    ld     a7,  16 * 8(sp)
    ld     s2,  17 * 8(sp)
    ld     s3,  18 * 8(sp)
    ld     s4,  19 * 8(sp)
    ld     s5,  20 * 8(sp)
    ld     s6,  21 * 8(sp)
    ld     s7,  22 * 8(sp)
    ld     s8,  23 * 8(sp)
    ld     s9,  24 * 8(sp)
    ld     s10, 25 * 8(sp)
    ld     s11, 26 * 8(sp)
    ld     t3,  27 * 8(sp)
    ld     t4,  28 * 8(sp)
    ld     t5,  29 * 8(sp)
    ld     t6,  30 * 8(sp)

    addi   sp, sp, 8 * 32

# Exception return will restore remaining context
    mret


#********************************************************************************************************
#                                             MODULE END
#*********************************************************************************************************
