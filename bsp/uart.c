#include "bsp.h"

void uart_init()
{
    //关闭中断
    write_reg(IER,0,uint8);
    
    //设置波特率
    write_reg(LCR,1<<7,uint8);
    write_reg(BUAD_LOW,0x3,uint8);
    write_reg(BUAD_HIGH,0x0,uint8);
    
    //设置字模式和校验
    write_reg(LCR,LCR_WORD_LENGTH,uint8);

    //打开FIFO并清空
    write_reg(FCR,FCR_FIFO_ENABLE|FCR_RX_FIFO_CLEAR|FCR_TX_FIFO_CLEAR,uint8);  

    write_reg(IER,IER_RX_INTA|IER_TX_INTA,uint8);
}

void uart_putc_sync(char c)
{
    uint8 state =0;
    while(!((state=read_reg(LSR,uint8))&LSR_TX_READY)) ;
    write_reg(THR,c,uint8);
}