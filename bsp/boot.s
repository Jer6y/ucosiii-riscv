.section .text
.align 4
.extern ks_stack
.extern bsp_init
.global _start
_start:
    la  sp,ks_stack
    csrr t0,mhartid
    add  tp,t0,zero
    li   t1,1
    add  t0,t0,t1
    li   t1,4096
    mul  t0,t0,t1
    add sp,sp,t0
    j bsp_init
spin:
    j spin
    