/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved
 */

#include "bsp.h"
#include "adaptor.h"

uint64 g_cycle = 0;
uint64 g_tick = 0;

#define CLINT_TIME             (CLINT_START+0xBFF8)
#define CLINT_TIMECMP(hart_id) (CLINT_START+0x4000+8*(hart_id))


static inline uint64 PRT_ClkGetCycleCount64(void)
{
    return *(uint64 *)CLINT_TIME;
}


void benchmark_timer_initialize(void)
{
    g_cycle = PRT_ClkGetCycleCount64();
}

uint64 benchmark_timer_read(void)
{
    U64 end = PRT_ClkGetCycleCount64();
    return end - g_cycle;
}
