#ifndef ADAPTOR_H
#define ADAPTOR_H

#include "bsp.h"

#define PRT_Printf printf
#define U64 uint64
#define U32 uint32
#define U16 uint16
#define U8  uint8
#define uintptr_t uint64

#define PRT_ClkCycle2Us(cycle) ((cycle)/10)

#define PRT_SysReboot()  while(1) {__asm__ __volatile__("wfi");}

#endif