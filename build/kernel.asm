
build/test_task_switch:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_start>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	a1010113          	add	sp,sp,-1520 # 8000ba10 <ks_stack>
    80000008:	f14022f3          	csrr	t0,mhartid
    8000000c:	00028233          	add	tp,t0,zero
    80000010:	4305                	li	t1,1
    80000012:	929a                	add	t0,t0,t1
    80000014:	6305                	lui	t1,0x1
    80000016:	026282b3          	mul	t0,t0,t1
    8000001a:	9116                	add	sp,sp,t0
    8000001c:	17a0006f          	j	80000196 <bsp_init>

0000000080000020 <spin>:
    80000020:	a001                	j	80000020 <spin>

0000000080000022 <nextcmp>:
    80000022:	7179                	add	sp,sp,-48
    80000024:	f406                	sd	ra,40(sp)
    80000026:	042010ef          	jal	80001068 <r_mhartid>
    8000002a:	ec2a                	sd	a0,24(sp)
    8000002c:	000f47b7          	lui	a5,0xf4
    80000030:	24078793          	add	a5,a5,576 # f4240 <CPU_MSTATUS_MIE+0xf4238>
    80000034:	e83e                	sd	a5,16(sp)
    80000036:	0200c7b7          	lui	a5,0x200c
    8000003a:	17e1                	add	a5,a5,-8 # 200bff8 <CPU_MSTATUS_MIE+0x200bff0>
    8000003c:	639c                	ld	a5,0(a5)
    8000003e:	e43e                	sd	a5,8(sp)
    80000040:	6722                	ld	a4,8(sp)
    80000042:	67c2                	ld	a5,16(sp)
    80000044:	97ba                	add	a5,a5,a4
    80000046:	e43e                	sd	a5,8(sp)
    80000048:	6762                	ld	a4,24(sp)
    8000004a:	004017b7          	lui	a5,0x401
    8000004e:	80078793          	add	a5,a5,-2048 # 400800 <CPU_MSTATUS_MIE+0x4007f8>
    80000052:	97ba                	add	a5,a5,a4
    80000054:	078e                	sll	a5,a5,0x3
    80000056:	873e                	mv	a4,a5
    80000058:	67a2                	ld	a5,8(sp)
    8000005a:	e31c                	sd	a5,0(a4)
    8000005c:	0001                	nop
    8000005e:	70a2                	ld	ra,40(sp)
    80000060:	6145                	add	sp,sp,48
    80000062:	8082                	ret

0000000080000064 <trap_handler>:
    80000064:	7139                	add	sp,sp,-64
    80000066:	fc06                	sd	ra,56(sp)
    80000068:	ec2a                	sd	a0,24(sp)
    8000006a:	e82e                	sd	a1,16(sp)
    8000006c:	e432                	sd	a2,8(sp)
    8000006e:	67e2                	ld	a5,24(sp)
    80000070:	0807d563          	bgez	a5,800000fa <trap_handler+0x96>
    80000074:	6762                	ld	a4,24(sp)
    80000076:	57fd                	li	a5,-1
    80000078:	8385                	srl	a5,a5,0x1
    8000007a:	8ff9                	and	a5,a5,a4
    8000007c:	ec3e                	sd	a5,24(sp)
    8000007e:	6762                	ld	a4,24(sp)
    80000080:	479d                	li	a5,7
    80000082:	02f71b63          	bne	a4,a5,800000b8 <trap_handler+0x54>
    80000086:	749040ef          	jal	80004fce <OSIntEnter>
    8000008a:	f99ff0ef          	jal	80000022 <nextcmp>
    8000008e:	041070ef          	jal	800078ce <OSTimeTick>
    80000092:	7c7000ef          	jal	80001058 <r_mstatus>
    80000096:	f02a                	sd	a0,32(sp)
    80000098:	7782                	ld	a5,32(sp)
    8000009a:	0807e793          	or	a5,a5,128
    8000009e:	f03e                	sd	a5,32(sp)
    800000a0:	7702                	ld	a4,32(sp)
    800000a2:	6789                	lui	a5,0x2
    800000a4:	80078793          	add	a5,a5,-2048 # 1800 <CPU_MSTATUS_MIE+0x17f8>
    800000a8:	8fd9                	or	a5,a5,a4
    800000aa:	f03e                	sd	a5,32(sp)
    800000ac:	7502                	ld	a0,32(sp)
    800000ae:	134010ef          	jal	800011e2 <w_mstatus>
    800000b2:	76f040ef          	jal	80005020 <OSIntExit>
    800000b6:	a881                	j	80000106 <trap_handler+0xa2>
    800000b8:	6762                	ld	a4,24(sp)
    800000ba:	4785                	li	a5,1
    800000bc:	02f71863          	bne	a4,a5,800000ec <trap_handler+0x88>
    800000c0:	799000ef          	jal	80001058 <r_mstatus>
    800000c4:	f42a                	sd	a0,40(sp)
    800000c6:	77a2                	ld	a5,40(sp)
    800000c8:	0807e793          	or	a5,a5,128
    800000cc:	f43e                	sd	a5,40(sp)
    800000ce:	7722                	ld	a4,40(sp)
    800000d0:	6789                	lui	a5,0x2
    800000d2:	80078793          	add	a5,a5,-2048 # 1800 <CPU_MSTATUS_MIE+0x17f8>
    800000d6:	8fd9                	or	a5,a5,a4
    800000d8:	f43e                	sd	a5,40(sp)
    800000da:	7522                	ld	a0,40(sp)
    800000dc:	106010ef          	jal	800011e2 <w_mstatus>
    800000e0:	67a2                	ld	a5,8(sp)
    800000e2:	00078633          	add	a2,a5,zero
    800000e6:	76a010ef          	jal	80001850 <Software_IRQHandler>
    800000ea:	a831                	j	80000106 <trap_handler+0xa2>
    800000ec:	0000b517          	auipc	a0,0xb
    800000f0:	03450513          	add	a0,a0,52 # 8000b120 <OSDbg_DataSize+0x10>
    800000f4:	5e3000ef          	jal	80000ed6 <panic>
    800000f8:	a039                	j	80000106 <trap_handler+0xa2>
    800000fa:	0000b517          	auipc	a0,0xb
    800000fe:	02e50513          	add	a0,a0,46 # 8000b128 <OSDbg_DataSize+0x18>
    80000102:	5d5000ef          	jal	80000ed6 <panic>
    80000106:	0001                	nop
    80000108:	70e2                	ld	ra,56(sp)
    8000010a:	6121                	add	sp,sp,64
    8000010c:	8082                	ret

000000008000010e <timer_init>:
    8000010e:	7179                	add	sp,sp,-48
    80000110:	f406                	sd	ra,40(sp)
    80000112:	757000ef          	jal	80001068 <r_mhartid>
    80000116:	ec2a                	sd	a0,24(sp)
    80000118:	000f47b7          	lui	a5,0xf4
    8000011c:	24078793          	add	a5,a5,576 # f4240 <CPU_MSTATUS_MIE+0xf4238>
    80000120:	e83e                	sd	a5,16(sp)
    80000122:	0200c7b7          	lui	a5,0x200c
    80000126:	17e1                	add	a5,a5,-8 # 200bff8 <CPU_MSTATUS_MIE+0x200bff0>
    80000128:	639c                	ld	a5,0(a5)
    8000012a:	e43e                	sd	a5,8(sp)
    8000012c:	6722                	ld	a4,8(sp)
    8000012e:	67c2                	ld	a5,16(sp)
    80000130:	97ba                	add	a5,a5,a4
    80000132:	e43e                	sd	a5,8(sp)
    80000134:	6762                	ld	a4,24(sp)
    80000136:	004017b7          	lui	a5,0x401
    8000013a:	80078793          	add	a5,a5,-2048 # 400800 <CPU_MSTATUS_MIE+0x4007f8>
    8000013e:	97ba                	add	a5,a5,a4
    80000140:	078e                	sll	a5,a5,0x3
    80000142:	873e                	mv	a4,a5
    80000144:	67a2                	ld	a5,8(sp)
    80000146:	e31c                	sd	a5,0(a4)
    80000148:	661000ef          	jal	80000fa8 <r_mie>
    8000014c:	872a                	mv	a4,a0
    8000014e:	6785                	lui	a5,0x1
    80000150:	88a78793          	add	a5,a5,-1910 # 88a <CPU_MSTATUS_MIE+0x882>
    80000154:	8fd9                	or	a5,a5,a4
    80000156:	853e                	mv	a0,a5
    80000158:	7db000ef          	jal	80001132 <w_mie>
    8000015c:	6fd000ef          	jal	80001058 <r_mstatus>
    80000160:	872a                	mv	a4,a0
    80000162:	7ffff7b7          	lui	a5,0x7ffff
    80000166:	0786                	sll	a5,a5,0x1
    80000168:	77f78793          	add	a5,a5,1919 # 7ffff77f <CPU_MSTATUS_MIE+0x7ffff777>
    8000016c:	8f7d                	and	a4,a4,a5
    8000016e:	6789                	lui	a5,0x2
    80000170:	80078793          	add	a5,a5,-2048 # 1800 <CPU_MSTATUS_MIE+0x17f8>
    80000174:	8fd9                	or	a5,a5,a4
    80000176:	853e                	mv	a0,a5
    80000178:	06a010ef          	jal	800011e2 <w_mstatus>
    8000017c:	0000a797          	auipc	a5,0xa
    80000180:	3d678793          	add	a5,a5,982 # 8000a552 <main>
    80000184:	853e                	mv	a0,a5
    80000186:	7dd000ef          	jal	80001162 <w_mepc>
    8000018a:	30200073          	mret
    8000018e:	0001                	nop
    80000190:	70a2                	ld	ra,40(sp)
    80000192:	6145                	add	sp,sp,48
    80000194:	8082                	ret

0000000080000196 <bsp_init>:
    80000196:	1141                	add	sp,sp,-16
    80000198:	e406                	sd	ra,8(sp)
    8000019a:	4501                	li	a0,0
    8000019c:	7a7000ef          	jal	80001142 <w_satp>
    800001a0:	026000ef          	jal	800001c6 <uart_init>
    800001a4:	0000b517          	auipc	a0,0xb
    800001a8:	f9450513          	add	a0,a0,-108 # 8000b138 <OSDbg_DataSize+0x28>
    800001ac:	3c8000ef          	jal	80000574 <printf>
    800001b0:	00001797          	auipc	a5,0x1
    800001b4:	0b078793          	add	a5,a5,176 # 80001260 <trap_entry>
    800001b8:	853e                	mv	a0,a5
    800001ba:	7e9000ef          	jal	800011a2 <w_mtvec>
    800001be:	f51ff0ef          	jal	8000010e <timer_init>
    800001c2:	0001                	nop
    800001c4:	bffd                	j	800001c2 <bsp_init+0x2c>

00000000800001c6 <uart_init>:
    800001c6:	100007b7          	lui	a5,0x10000
    800001ca:	0785                	add	a5,a5,1 # 10000001 <CPU_MSTATUS_MIE+0xffffff9>
    800001cc:	00078023          	sb	zero,0(a5)
    800001d0:	100007b7          	lui	a5,0x10000
    800001d4:	078d                	add	a5,a5,3 # 10000003 <CPU_MSTATUS_MIE+0xffffffb>
    800001d6:	f8000713          	li	a4,-128
    800001da:	00e78023          	sb	a4,0(a5)
    800001de:	100007b7          	lui	a5,0x10000
    800001e2:	470d                	li	a4,3
    800001e4:	00e78023          	sb	a4,0(a5) # 10000000 <CPU_MSTATUS_MIE+0xffffff8>
    800001e8:	100007b7          	lui	a5,0x10000
    800001ec:	0785                	add	a5,a5,1 # 10000001 <CPU_MSTATUS_MIE+0xffffff9>
    800001ee:	00078023          	sb	zero,0(a5)
    800001f2:	100007b7          	lui	a5,0x10000
    800001f6:	078d                	add	a5,a5,3 # 10000003 <CPU_MSTATUS_MIE+0xffffffb>
    800001f8:	470d                	li	a4,3
    800001fa:	00e78023          	sb	a4,0(a5)
    800001fe:	100007b7          	lui	a5,0x10000
    80000202:	0789                	add	a5,a5,2 # 10000002 <CPU_MSTATUS_MIE+0xffffffa>
    80000204:	471d                	li	a4,7
    80000206:	00e78023          	sb	a4,0(a5)
    8000020a:	100007b7          	lui	a5,0x10000
    8000020e:	0785                	add	a5,a5,1 # 10000001 <CPU_MSTATUS_MIE+0xffffff9>
    80000210:	470d                	li	a4,3
    80000212:	00e78023          	sb	a4,0(a5)
    80000216:	0001                	nop
    80000218:	8082                	ret

000000008000021a <uart_putc_sync>:
    8000021a:	1101                	add	sp,sp,-32
    8000021c:	87aa                	mv	a5,a0
    8000021e:	00f107a3          	sb	a5,15(sp)
    80000222:	00010fa3          	sb	zero,31(sp)
    80000226:	0001                	nop
    80000228:	100007b7          	lui	a5,0x10000
    8000022c:	0795                	add	a5,a5,5 # 10000005 <CPU_MSTATUS_MIE+0xffffffd>
    8000022e:	0007c783          	lbu	a5,0(a5)
    80000232:	00f10fa3          	sb	a5,31(sp)
    80000236:	01f14783          	lbu	a5,31(sp)
    8000023a:	2781                	sext.w	a5,a5
    8000023c:	0207f793          	and	a5,a5,32
    80000240:	2781                	sext.w	a5,a5
    80000242:	d3fd                	beqz	a5,80000228 <uart_putc_sync+0xe>
    80000244:	100007b7          	lui	a5,0x10000
    80000248:	00f14703          	lbu	a4,15(sp)
    8000024c:	00e78023          	sb	a4,0(a5) # 10000000 <CPU_MSTATUS_MIE+0xffffff8>
    80000250:	0001                	nop
    80000252:	6105                	add	sp,sp,32
    80000254:	8082                	ret

0000000080000256 <strlen>:
    80000256:	1101                	add	sp,sp,-32
    80000258:	e42a                	sd	a0,8(sp)
    8000025a:	ce02                	sw	zero,28(sp)
    8000025c:	a021                	j	80000264 <strlen+0xe>
    8000025e:	47f2                	lw	a5,28(sp)
    80000260:	2785                	addw	a5,a5,1
    80000262:	ce3e                	sw	a5,28(sp)
    80000264:	01c16783          	lwu	a5,28(sp)
    80000268:	6722                	ld	a4,8(sp)
    8000026a:	97ba                	add	a5,a5,a4
    8000026c:	0007c783          	lbu	a5,0(a5)
    80000270:	f7fd                	bnez	a5,8000025e <strlen+0x8>
    80000272:	47f2                	lw	a5,28(sp)
    80000274:	853e                	mv	a0,a5
    80000276:	6105                	add	sp,sp,32
    80000278:	8082                	ret

000000008000027a <strcpy>:
    8000027a:	1101                	add	sp,sp,-32
    8000027c:	e42a                	sd	a0,8(sp)
    8000027e:	e02e                	sd	a1,0(sp)
    80000280:	ce02                	sw	zero,28(sp)
    80000282:	a831                	j	8000029e <strcpy+0x24>
    80000284:	47f2                	lw	a5,28(sp)
    80000286:	6702                	ld	a4,0(sp)
    80000288:	973e                	add	a4,a4,a5
    8000028a:	47f2                	lw	a5,28(sp)
    8000028c:	66a2                	ld	a3,8(sp)
    8000028e:	97b6                	add	a5,a5,a3
    80000290:	00074703          	lbu	a4,0(a4)
    80000294:	00e78023          	sb	a4,0(a5)
    80000298:	47f2                	lw	a5,28(sp)
    8000029a:	2785                	addw	a5,a5,1
    8000029c:	ce3e                	sw	a5,28(sp)
    8000029e:	47f2                	lw	a5,28(sp)
    800002a0:	6702                	ld	a4,0(sp)
    800002a2:	97ba                	add	a5,a5,a4
    800002a4:	0007c783          	lbu	a5,0(a5)
    800002a8:	fff1                	bnez	a5,80000284 <strcpy+0xa>
    800002aa:	67a2                	ld	a5,8(sp)
    800002ac:	853e                	mv	a0,a5
    800002ae:	6105                	add	sp,sp,32
    800002b0:	8082                	ret

00000000800002b2 <strncpy>:
    800002b2:	7179                	add	sp,sp,-48
    800002b4:	ec2a                	sd	a0,24(sp)
    800002b6:	e82e                	sd	a1,16(sp)
    800002b8:	87b2                	mv	a5,a2
    800002ba:	c63e                	sw	a5,12(sp)
    800002bc:	d602                	sw	zero,44(sp)
    800002be:	a831                	j	800002da <strncpy+0x28>
    800002c0:	57b2                	lw	a5,44(sp)
    800002c2:	6742                	ld	a4,16(sp)
    800002c4:	973e                	add	a4,a4,a5
    800002c6:	57b2                	lw	a5,44(sp)
    800002c8:	66e2                	ld	a3,24(sp)
    800002ca:	97b6                	add	a5,a5,a3
    800002cc:	00074703          	lbu	a4,0(a4)
    800002d0:	00e78023          	sb	a4,0(a5)
    800002d4:	57b2                	lw	a5,44(sp)
    800002d6:	2785                	addw	a5,a5,1
    800002d8:	d63e                	sw	a5,44(sp)
    800002da:	57b2                	lw	a5,44(sp)
    800002dc:	6742                	ld	a4,16(sp)
    800002de:	97ba                	add	a5,a5,a4
    800002e0:	0007c783          	lbu	a5,0(a5)
    800002e4:	c791                	beqz	a5,800002f0 <strncpy+0x3e>
    800002e6:	5732                	lw	a4,44(sp)
    800002e8:	47b2                	lw	a5,12(sp)
    800002ea:	2781                	sext.w	a5,a5
    800002ec:	fcf76ae3          	bltu	a4,a5,800002c0 <strncpy+0xe>
    800002f0:	67e2                	ld	a5,24(sp)
    800002f2:	853e                	mv	a0,a5
    800002f4:	6145                	add	sp,sp,48
    800002f6:	8082                	ret

00000000800002f8 <strcmp>:
    800002f8:	1101                	add	sp,sp,-32
    800002fa:	e42a                	sd	a0,8(sp)
    800002fc:	e02e                	sd	a1,0(sp)
    800002fe:	ce02                	sw	zero,28(sp)
    80000300:	a091                	j	80000344 <strcmp+0x4c>
    80000302:	47f2                	lw	a5,28(sp)
    80000304:	6722                	ld	a4,8(sp)
    80000306:	97ba                	add	a5,a5,a4
    80000308:	0007c683          	lbu	a3,0(a5)
    8000030c:	47f2                	lw	a5,28(sp)
    8000030e:	6702                	ld	a4,0(sp)
    80000310:	97ba                	add	a5,a5,a4
    80000312:	0007c783          	lbu	a5,0(a5)
    80000316:	8736                	mv	a4,a3
    80000318:	02f70363          	beq	a4,a5,8000033e <strcmp+0x46>
    8000031c:	47f2                	lw	a5,28(sp)
    8000031e:	6722                	ld	a4,8(sp)
    80000320:	97ba                	add	a5,a5,a4
    80000322:	0007c783          	lbu	a5,0(a5)
    80000326:	0007871b          	sext.w	a4,a5
    8000032a:	47f2                	lw	a5,28(sp)
    8000032c:	6682                	ld	a3,0(sp)
    8000032e:	97b6                	add	a5,a5,a3
    80000330:	0007c783          	lbu	a5,0(a5)
    80000334:	2781                	sext.w	a5,a5
    80000336:	40f707bb          	subw	a5,a4,a5
    8000033a:	2781                	sext.w	a5,a5
    8000033c:	a00d                	j	8000035e <strcmp+0x66>
    8000033e:	47f2                	lw	a5,28(sp)
    80000340:	2785                	addw	a5,a5,1
    80000342:	ce3e                	sw	a5,28(sp)
    80000344:	47f2                	lw	a5,28(sp)
    80000346:	6722                	ld	a4,8(sp)
    80000348:	97ba                	add	a5,a5,a4
    8000034a:	0007c783          	lbu	a5,0(a5)
    8000034e:	fbd5                	bnez	a5,80000302 <strcmp+0xa>
    80000350:	47f2                	lw	a5,28(sp)
    80000352:	6702                	ld	a4,0(sp)
    80000354:	97ba                	add	a5,a5,a4
    80000356:	0007c783          	lbu	a5,0(a5)
    8000035a:	f7c5                	bnez	a5,80000302 <strcmp+0xa>
    8000035c:	4781                	li	a5,0
    8000035e:	853e                	mv	a0,a5
    80000360:	6105                	add	sp,sp,32
    80000362:	8082                	ret

0000000080000364 <strcat>:
    80000364:	1101                	add	sp,sp,-32
    80000366:	e42a                	sd	a0,8(sp)
    80000368:	e02e                	sd	a1,0(sp)
    8000036a:	67a2                	ld	a5,8(sp)
    8000036c:	ec3e                	sd	a5,24(sp)
    8000036e:	a021                	j	80000376 <strcat+0x12>
    80000370:	67e2                	ld	a5,24(sp)
    80000372:	0785                	add	a5,a5,1
    80000374:	ec3e                	sd	a5,24(sp)
    80000376:	67e2                	ld	a5,24(sp)
    80000378:	0007c783          	lbu	a5,0(a5)
    8000037c:	fbf5                	bnez	a5,80000370 <strcat+0xc>
    8000037e:	ca02                	sw	zero,20(sp)
    80000380:	a839                	j	8000039e <strcat+0x3a>
    80000382:	47d2                	lw	a5,20(sp)
    80000384:	6702                	ld	a4,0(sp)
    80000386:	97ba                	add	a5,a5,a4
    80000388:	0007c703          	lbu	a4,0(a5)
    8000038c:	67e2                	ld	a5,24(sp)
    8000038e:	00e78023          	sb	a4,0(a5)
    80000392:	47d2                	lw	a5,20(sp)
    80000394:	2785                	addw	a5,a5,1
    80000396:	ca3e                	sw	a5,20(sp)
    80000398:	67e2                	ld	a5,24(sp)
    8000039a:	0785                	add	a5,a5,1
    8000039c:	ec3e                	sd	a5,24(sp)
    8000039e:	47d2                	lw	a5,20(sp)
    800003a0:	6702                	ld	a4,0(sp)
    800003a2:	97ba                	add	a5,a5,a4
    800003a4:	0007c783          	lbu	a5,0(a5)
    800003a8:	ffe9                	bnez	a5,80000382 <strcat+0x1e>
    800003aa:	67e2                	ld	a5,24(sp)
    800003ac:	00078023          	sb	zero,0(a5)
    800003b0:	67a2                	ld	a5,8(sp)
    800003b2:	853e                	mv	a0,a5
    800003b4:	6105                	add	sp,sp,32
    800003b6:	8082                	ret

00000000800003b8 <strchr>:
    800003b8:	1101                	add	sp,sp,-32
    800003ba:	e42a                	sd	a0,8(sp)
    800003bc:	87ae                	mv	a5,a1
    800003be:	c23e                	sw	a5,4(sp)
    800003c0:	67a2                	ld	a5,8(sp)
    800003c2:	ec3e                	sd	a5,24(sp)
    800003c4:	67e2                	ld	a5,24(sp)
    800003c6:	0007c783          	lbu	a5,0(a5)
    800003ca:	0007871b          	sext.w	a4,a5
    800003ce:	4792                	lw	a5,4(sp)
    800003d0:	2781                	sext.w	a5,a5
    800003d2:	00e79463          	bne	a5,a4,800003da <strchr+0x22>
    800003d6:	67e2                	ld	a5,24(sp)
    800003d8:	a809                	j	800003ea <strchr+0x32>
    800003da:	67e2                	ld	a5,24(sp)
    800003dc:	00178713          	add	a4,a5,1
    800003e0:	ec3a                	sd	a4,24(sp)
    800003e2:	0007c783          	lbu	a5,0(a5)
    800003e6:	fff9                	bnez	a5,800003c4 <strchr+0xc>
    800003e8:	4781                	li	a5,0
    800003ea:	853e                	mv	a0,a5
    800003ec:	6105                	add	sp,sp,32
    800003ee:	8082                	ret

00000000800003f0 <strrchr>:
    800003f0:	1101                	add	sp,sp,-32
    800003f2:	e42a                	sd	a0,8(sp)
    800003f4:	87ae                	mv	a5,a1
    800003f6:	c23e                	sw	a5,4(sp)
    800003f8:	67a2                	ld	a5,8(sp)
    800003fa:	ec3e                	sd	a5,24(sp)
    800003fc:	e802                	sd	zero,16(sp)
    800003fe:	67e2                	ld	a5,24(sp)
    80000400:	0007c783          	lbu	a5,0(a5)
    80000404:	0007871b          	sext.w	a4,a5
    80000408:	4792                	lw	a5,4(sp)
    8000040a:	2781                	sext.w	a5,a5
    8000040c:	00e79863          	bne	a5,a4,8000041c <strrchr+0x2c>
    80000410:	67e2                	ld	a5,24(sp)
    80000412:	00178713          	add	a4,a5,1
    80000416:	ec3a                	sd	a4,24(sp)
    80000418:	e83e                	sd	a5,16(sp)
    8000041a:	b7d5                	j	800003fe <strrchr+0xe>
    8000041c:	67e2                	ld	a5,24(sp)
    8000041e:	00178713          	add	a4,a5,1
    80000422:	ec3a                	sd	a4,24(sp)
    80000424:	0007c783          	lbu	a5,0(a5)
    80000428:	c391                	beqz	a5,8000042c <strrchr+0x3c>
    8000042a:	bfd1                	j	800003fe <strrchr+0xe>
    8000042c:	0001                	nop
    8000042e:	67c2                	ld	a5,16(sp)
    80000430:	853e                	mv	a0,a5
    80000432:	6105                	add	sp,sp,32
    80000434:	8082                	ret

0000000080000436 <memcmp>:
    80000436:	7139                	add	sp,sp,-64
    80000438:	ec2a                	sd	a0,24(sp)
    8000043a:	e82e                	sd	a1,16(sp)
    8000043c:	87b2                	mv	a5,a2
    8000043e:	c63e                	sw	a5,12(sp)
    80000440:	67e2                	ld	a5,24(sp)
    80000442:	f83e                	sd	a5,48(sp)
    80000444:	67c2                	ld	a5,16(sp)
    80000446:	f43e                	sd	a5,40(sp)
    80000448:	de02                	sw	zero,60(sp)
    8000044a:	a091                	j	8000048e <memcmp+0x58>
    8000044c:	57f2                	lw	a5,60(sp)
    8000044e:	7742                	ld	a4,48(sp)
    80000450:	97ba                	add	a5,a5,a4
    80000452:	0007c683          	lbu	a3,0(a5)
    80000456:	57f2                	lw	a5,60(sp)
    80000458:	7722                	ld	a4,40(sp)
    8000045a:	97ba                	add	a5,a5,a4
    8000045c:	0007c783          	lbu	a5,0(a5)
    80000460:	8736                	mv	a4,a3
    80000462:	02f70363          	beq	a4,a5,80000488 <memcmp+0x52>
    80000466:	57f2                	lw	a5,60(sp)
    80000468:	7742                	ld	a4,48(sp)
    8000046a:	97ba                	add	a5,a5,a4
    8000046c:	0007c783          	lbu	a5,0(a5)
    80000470:	0007871b          	sext.w	a4,a5
    80000474:	57f2                	lw	a5,60(sp)
    80000476:	76a2                	ld	a3,40(sp)
    80000478:	97b6                	add	a5,a5,a3
    8000047a:	0007c783          	lbu	a5,0(a5)
    8000047e:	2781                	sext.w	a5,a5
    80000480:	40f707bb          	subw	a5,a4,a5
    80000484:	2781                	sext.w	a5,a5
    80000486:	a811                	j	8000049a <memcmp+0x64>
    80000488:	57f2                	lw	a5,60(sp)
    8000048a:	2785                	addw	a5,a5,1
    8000048c:	de3e                	sw	a5,60(sp)
    8000048e:	5772                	lw	a4,60(sp)
    80000490:	47b2                	lw	a5,12(sp)
    80000492:	2781                	sext.w	a5,a5
    80000494:	faf76ce3          	bltu	a4,a5,8000044c <memcmp+0x16>
    80000498:	4781                	li	a5,0
    8000049a:	853e                	mv	a0,a5
    8000049c:	6121                	add	sp,sp,64
    8000049e:	8082                	ret

00000000800004a0 <memcpy>:
    800004a0:	7139                	add	sp,sp,-64
    800004a2:	ec2a                	sd	a0,24(sp)
    800004a4:	e82e                	sd	a1,16(sp)
    800004a6:	87b2                	mv	a5,a2
    800004a8:	c63e                	sw	a5,12(sp)
    800004aa:	67e2                	ld	a5,24(sp)
    800004ac:	f83e                	sd	a5,48(sp)
    800004ae:	67c2                	ld	a5,16(sp)
    800004b0:	f43e                	sd	a5,40(sp)
    800004b2:	de02                	sw	zero,60(sp)
    800004b4:	a005                	j	800004d4 <memcpy+0x34>
    800004b6:	03c16783          	lwu	a5,60(sp)
    800004ba:	7722                	ld	a4,40(sp)
    800004bc:	973e                	add	a4,a4,a5
    800004be:	03c16783          	lwu	a5,60(sp)
    800004c2:	76c2                	ld	a3,48(sp)
    800004c4:	97b6                	add	a5,a5,a3
    800004c6:	00074703          	lbu	a4,0(a4)
    800004ca:	00e78023          	sb	a4,0(a5)
    800004ce:	57f2                	lw	a5,60(sp)
    800004d0:	2785                	addw	a5,a5,1
    800004d2:	de3e                	sw	a5,60(sp)
    800004d4:	57f2                	lw	a5,60(sp)
    800004d6:	873e                	mv	a4,a5
    800004d8:	47b2                	lw	a5,12(sp)
    800004da:	2701                	sext.w	a4,a4
    800004dc:	2781                	sext.w	a5,a5
    800004de:	fcf76ce3          	bltu	a4,a5,800004b6 <memcpy+0x16>
    800004e2:	67e2                	ld	a5,24(sp)
    800004e4:	853e                	mv	a0,a5
    800004e6:	6121                	add	sp,sp,64
    800004e8:	8082                	ret

00000000800004ea <memchr>:
    800004ea:	1101                	add	sp,sp,-32
    800004ec:	e42a                	sd	a0,8(sp)
    800004ee:	87ae                	mv	a5,a1
    800004f0:	8732                	mv	a4,a2
    800004f2:	c23e                	sw	a5,4(sp)
    800004f4:	87ba                	mv	a5,a4
    800004f6:	c03e                	sw	a5,0(sp)
    800004f8:	67a2                	ld	a5,8(sp)
    800004fa:	e83e                	sd	a5,16(sp)
    800004fc:	ce02                	sw	zero,28(sp)
    800004fe:	a01d                	j	80000524 <memchr+0x3a>
    80000500:	47f2                	lw	a5,28(sp)
    80000502:	6742                	ld	a4,16(sp)
    80000504:	97ba                	add	a5,a5,a4
    80000506:	0007c783          	lbu	a5,0(a5)
    8000050a:	0007871b          	sext.w	a4,a5
    8000050e:	4792                	lw	a5,4(sp)
    80000510:	2781                	sext.w	a5,a5
    80000512:	00e79663          	bne	a5,a4,8000051e <memchr+0x34>
    80000516:	47f2                	lw	a5,28(sp)
    80000518:	6742                	ld	a4,16(sp)
    8000051a:	97ba                	add	a5,a5,a4
    8000051c:	a811                	j	80000530 <memchr+0x46>
    8000051e:	47f2                	lw	a5,28(sp)
    80000520:	2785                	addw	a5,a5,1
    80000522:	ce3e                	sw	a5,28(sp)
    80000524:	4772                	lw	a4,28(sp)
    80000526:	4782                	lw	a5,0(sp)
    80000528:	2781                	sext.w	a5,a5
    8000052a:	fcf76be3          	bltu	a4,a5,80000500 <memchr+0x16>
    8000052e:	4781                	li	a5,0
    80000530:	853e                	mv	a0,a5
    80000532:	6105                	add	sp,sp,32
    80000534:	8082                	ret

0000000080000536 <memset>:
    80000536:	1101                	add	sp,sp,-32
    80000538:	e42a                	sd	a0,8(sp)
    8000053a:	87ae                	mv	a5,a1
    8000053c:	8732                	mv	a4,a2
    8000053e:	00f103a3          	sb	a5,7(sp)
    80000542:	87ba                	mv	a5,a4
    80000544:	c03e                	sw	a5,0(sp)
    80000546:	67a2                	ld	a5,8(sp)
    80000548:	e83e                	sd	a5,16(sp)
    8000054a:	ce02                	sw	zero,28(sp)
    8000054c:	a819                	j	80000562 <memset+0x2c>
    8000054e:	47f2                	lw	a5,28(sp)
    80000550:	6742                	ld	a4,16(sp)
    80000552:	97ba                	add	a5,a5,a4
    80000554:	00714703          	lbu	a4,7(sp)
    80000558:	00e78023          	sb	a4,0(a5)
    8000055c:	47f2                	lw	a5,28(sp)
    8000055e:	2785                	addw	a5,a5,1
    80000560:	ce3e                	sw	a5,28(sp)
    80000562:	4772                	lw	a4,28(sp)
    80000564:	4782                	lw	a5,0(sp)
    80000566:	2781                	sext.w	a5,a5
    80000568:	fef763e3          	bltu	a4,a5,8000054e <memset+0x18>
    8000056c:	67c2                	ld	a5,16(sp)
    8000056e:	853e                	mv	a0,a5
    80000570:	6105                	add	sp,sp,32
    80000572:	8082                	ret

0000000080000574 <printf>:
    80000574:	7149                	add	sp,sp,-368
    80000576:	f606                	sd	ra,296(sp)
    80000578:	e42a                	sd	a0,8(sp)
    8000057a:	fe2e                	sd	a1,312(sp)
    8000057c:	e2b2                	sd	a2,320(sp)
    8000057e:	e6b6                	sd	a3,328(sp)
    80000580:	eaba                	sd	a4,336(sp)
    80000582:	eebe                	sd	a5,344(sp)
    80000584:	f2c2                	sd	a6,352(sp)
    80000586:	f6c6                	sd	a7,360(sp)
    80000588:	1a9c                	add	a5,sp,368
    8000058a:	e03e                	sd	a5,0(sp)
    8000058c:	6782                	ld	a5,0(sp)
    8000058e:	fc878793          	add	a5,a5,-56
    80000592:	ea3e                	sd	a5,272(sp)
    80000594:	6752                	ld	a4,272(sp)
    80000596:	081c                	add	a5,sp,16
    80000598:	863a                	mv	a2,a4
    8000059a:	65a2                	ld	a1,8(sp)
    8000059c:	853e                	mv	a0,a5
    8000059e:	46e000ef          	jal	80000a0c <__vsprintf>
    800005a2:	87aa                	mv	a5,a0
    800005a4:	10f12c23          	sw	a5,280(sp)
    800005a8:	10012e23          	sw	zero,284(sp)
    800005ac:	a005                	j	800005cc <printf+0x58>
    800005ae:	11c12783          	lw	a5,284(sp)
    800005b2:	12078793          	add	a5,a5,288
    800005b6:	978a                	add	a5,a5,sp
    800005b8:	ef07c783          	lbu	a5,-272(a5)
    800005bc:	853e                	mv	a0,a5
    800005be:	c5dff0ef          	jal	8000021a <uart_putc_sync>
    800005c2:	11c12783          	lw	a5,284(sp)
    800005c6:	2785                	addw	a5,a5,1
    800005c8:	10f12e23          	sw	a5,284(sp)
    800005cc:	11c12783          	lw	a5,284(sp)
    800005d0:	873e                	mv	a4,a5
    800005d2:	11812783          	lw	a5,280(sp)
    800005d6:	2701                	sext.w	a4,a4
    800005d8:	2781                	sext.w	a5,a5
    800005da:	fcf74ae3          	blt	a4,a5,800005ae <printf+0x3a>
    800005de:	11812783          	lw	a5,280(sp)
    800005e2:	853e                	mv	a0,a5
    800005e4:	70b2                	ld	ra,296(sp)
    800005e6:	6175                	add	sp,sp,368
    800005e8:	8082                	ret

00000000800005ea <skip_atoi>:
    800005ea:	1101                	add	sp,sp,-32
    800005ec:	e42a                	sd	a0,8(sp)
    800005ee:	ce02                	sw	zero,28(sp)
    800005f0:	a80d                	j	80000622 <skip_atoi+0x38>
    800005f2:	47f2                	lw	a5,28(sp)
    800005f4:	873e                	mv	a4,a5
    800005f6:	87ba                	mv	a5,a4
    800005f8:	0027979b          	sllw	a5,a5,0x2
    800005fc:	9fb9                	addw	a5,a5,a4
    800005fe:	0017979b          	sllw	a5,a5,0x1
    80000602:	0007871b          	sext.w	a4,a5
    80000606:	67a2                	ld	a5,8(sp)
    80000608:	639c                	ld	a5,0(a5)
    8000060a:	00178613          	add	a2,a5,1
    8000060e:	66a2                	ld	a3,8(sp)
    80000610:	e290                	sd	a2,0(a3)
    80000612:	0007c783          	lbu	a5,0(a5)
    80000616:	2781                	sext.w	a5,a5
    80000618:	9fb9                	addw	a5,a5,a4
    8000061a:	2781                	sext.w	a5,a5
    8000061c:	fd07879b          	addw	a5,a5,-48
    80000620:	ce3e                	sw	a5,28(sp)
    80000622:	67a2                	ld	a5,8(sp)
    80000624:	639c                	ld	a5,0(a5)
    80000626:	0007c783          	lbu	a5,0(a5)
    8000062a:	873e                	mv	a4,a5
    8000062c:	02f00793          	li	a5,47
    80000630:	00e7fb63          	bgeu	a5,a4,80000646 <skip_atoi+0x5c>
    80000634:	67a2                	ld	a5,8(sp)
    80000636:	639c                	ld	a5,0(a5)
    80000638:	0007c783          	lbu	a5,0(a5)
    8000063c:	873e                	mv	a4,a5
    8000063e:	03900793          	li	a5,57
    80000642:	fae7f8e3          	bgeu	a5,a4,800005f2 <skip_atoi+0x8>
    80000646:	47f2                	lw	a5,28(sp)
    80000648:	853e                	mv	a0,a5
    8000064a:	6105                	add	sp,sp,32
    8000064c:	8082                	ret

000000008000064e <number>:
    8000064e:	7119                	add	sp,sp,-128
    80000650:	ec2a                	sd	a0,24(sp)
    80000652:	e82e                	sd	a1,16(sp)
    80000654:	85b2                	mv	a1,a2
    80000656:	8636                	mv	a2,a3
    80000658:	86ba                	mv	a3,a4
    8000065a:	873e                	mv	a4,a5
    8000065c:	87ae                	mv	a5,a1
    8000065e:	c63e                	sw	a5,12(sp)
    80000660:	87b2                	mv	a5,a2
    80000662:	c43e                	sw	a5,8(sp)
    80000664:	87b6                	mv	a5,a3
    80000666:	c23e                	sw	a5,4(sp)
    80000668:	87ba                	mv	a5,a4
    8000066a:	c03e                	sw	a5,0(sp)
    8000066c:	0000b797          	auipc	a5,0xb
    80000670:	adc78793          	add	a5,a5,-1316 # 8000b148 <OSDbg_DataSize+0x38>
    80000674:	f8be                	sd	a5,112(sp)
    80000676:	67e2                	ld	a5,24(sp)
    80000678:	ecbe                	sd	a5,88(sp)
    8000067a:	4782                	lw	a5,0(sp)
    8000067c:	0407f793          	and	a5,a5,64
    80000680:	2781                	sext.w	a5,a5
    80000682:	c791                	beqz	a5,8000068e <number+0x40>
    80000684:	0000b797          	auipc	a5,0xb
    80000688:	aec78793          	add	a5,a5,-1300 # 8000b170 <OSDbg_DataSize+0x60>
    8000068c:	f8be                	sd	a5,112(sp)
    8000068e:	4782                	lw	a5,0(sp)
    80000690:	8bc1                	and	a5,a5,16
    80000692:	2781                	sext.w	a5,a5
    80000694:	c781                	beqz	a5,8000069c <number+0x4e>
    80000696:	4782                	lw	a5,0(sp)
    80000698:	9bf9                	and	a5,a5,-2
    8000069a:	c03e                	sw	a5,0(sp)
    8000069c:	47b2                	lw	a5,12(sp)
    8000069e:	0007871b          	sext.w	a4,a5
    800006a2:	4785                	li	a5,1
    800006a4:	00e7d963          	bge	a5,a4,800006b6 <number+0x68>
    800006a8:	47b2                	lw	a5,12(sp)
    800006aa:	0007871b          	sext.w	a4,a5
    800006ae:	02400793          	li	a5,36
    800006b2:	00e7d463          	bge	a5,a4,800006ba <number+0x6c>
    800006b6:	4781                	li	a5,0
    800006b8:	a6b9                	j	80000a06 <number+0x3b8>
    800006ba:	4782                	lw	a5,0(sp)
    800006bc:	8b85                	and	a5,a5,1
    800006be:	2781                	sext.w	a5,a5
    800006c0:	c781                	beqz	a5,800006c8 <number+0x7a>
    800006c2:	03000793          	li	a5,48
    800006c6:	a019                	j	800006cc <number+0x7e>
    800006c8:	02000793          	li	a5,32
    800006cc:	04f10ba3          	sb	a5,87(sp)
    800006d0:	4782                	lw	a5,0(sp)
    800006d2:	0807f793          	and	a5,a5,128
    800006d6:	2781                	sext.w	a5,a5
    800006d8:	c39d                	beqz	a5,800006fe <number+0xb0>
    800006da:	67c2                	ld	a5,16(sp)
    800006dc:	239c                	fld	fa5,0(a5)
    800006de:	f2000753          	fmv.d.x	fa4,zero
    800006e2:	a2e797d3          	flt.d	a5,fa5,fa4
    800006e6:	cf81                	beqz	a5,800006fe <number+0xb0>
    800006e8:	02d00793          	li	a5,45
    800006ec:	06f10fa3          	sb	a5,127(sp)
    800006f0:	67c2                	ld	a5,16(sp)
    800006f2:	239c                	fld	fa5,0(a5)
    800006f4:	22f797d3          	fneg.d	fa5,fa5
    800006f8:	67c2                	ld	a5,16(sp)
    800006fa:	a39c                	fsd	fa5,0(a5)
    800006fc:	a095                	j	80000760 <number+0x112>
    800006fe:	4782                	lw	a5,0(sp)
    80000700:	8b89                	and	a5,a5,2
    80000702:	2781                	sext.w	a5,a5
    80000704:	cb95                	beqz	a5,80000738 <number+0xea>
    80000706:	4782                	lw	a5,0(sp)
    80000708:	0807f793          	and	a5,a5,128
    8000070c:	2781                	sext.w	a5,a5
    8000070e:	e78d                	bnez	a5,80000738 <number+0xea>
    80000710:	67c2                	ld	a5,16(sp)
    80000712:	439c                	lw	a5,0(a5)
    80000714:	2781                	sext.w	a5,a5
    80000716:	0207d163          	bgez	a5,80000738 <number+0xea>
    8000071a:	02d00793          	li	a5,45
    8000071e:	06f10fa3          	sb	a5,127(sp)
    80000722:	67c2                	ld	a5,16(sp)
    80000724:	439c                	lw	a5,0(a5)
    80000726:	2781                	sext.w	a5,a5
    80000728:	40f007bb          	negw	a5,a5
    8000072c:	2781                	sext.w	a5,a5
    8000072e:	0007871b          	sext.w	a4,a5
    80000732:	67c2                	ld	a5,16(sp)
    80000734:	c398                	sw	a4,0(a5)
    80000736:	a02d                	j	80000760 <number+0x112>
    80000738:	4782                	lw	a5,0(sp)
    8000073a:	8b91                	and	a5,a5,4
    8000073c:	2781                	sext.w	a5,a5
    8000073e:	ef89                	bnez	a5,80000758 <number+0x10a>
    80000740:	4782                	lw	a5,0(sp)
    80000742:	0ff7f793          	zext.b	a5,a5
    80000746:	0027979b          	sllw	a5,a5,0x2
    8000074a:	0ff7f793          	zext.b	a5,a5
    8000074e:	0207f793          	and	a5,a5,32
    80000752:	0ff7f793          	zext.b	a5,a5
    80000756:	a019                	j	8000075c <number+0x10e>
    80000758:	02b00793          	li	a5,43
    8000075c:	06f10fa3          	sb	a5,127(sp)
    80000760:	07f14783          	lbu	a5,127(sp)
    80000764:	0ff7f793          	zext.b	a5,a5
    80000768:	c781                	beqz	a5,80000770 <number+0x122>
    8000076a:	47a2                	lw	a5,8(sp)
    8000076c:	37fd                	addw	a5,a5,-1
    8000076e:	c43e                	sw	a5,8(sp)
    80000770:	4782                	lw	a5,0(sp)
    80000772:	0207f793          	and	a5,a5,32
    80000776:	2781                	sext.w	a5,a5
    80000778:	c785                	beqz	a5,800007a0 <number+0x152>
    8000077a:	47b2                	lw	a5,12(sp)
    8000077c:	0007871b          	sext.w	a4,a5
    80000780:	47c1                	li	a5,16
    80000782:	00f71663          	bne	a4,a5,8000078e <number+0x140>
    80000786:	47a2                	lw	a5,8(sp)
    80000788:	37f9                	addw	a5,a5,-2
    8000078a:	c43e                	sw	a5,8(sp)
    8000078c:	a811                	j	800007a0 <number+0x152>
    8000078e:	47b2                	lw	a5,12(sp)
    80000790:	0007871b          	sext.w	a4,a5
    80000794:	47a1                	li	a5,8
    80000796:	00f71563          	bne	a4,a5,800007a0 <number+0x152>
    8000079a:	47a2                	lw	a5,8(sp)
    8000079c:	37fd                	addw	a5,a5,-1
    8000079e:	c43e                	sw	a5,8(sp)
    800007a0:	d682                	sw	zero,108(sp)
    800007a2:	4782                	lw	a5,0(sp)
    800007a4:	0807f793          	and	a5,a5,128
    800007a8:	2781                	sext.w	a5,a5
    800007aa:	cbdd                	beqz	a5,80000860 <number+0x212>
    800007ac:	67c2                	ld	a5,16(sp)
    800007ae:	239c                	fld	fa5,0(a5)
    800007b0:	c21797d3          	fcvt.wu.d	a5,fa5,rtz
    800007b4:	d4be                	sw	a5,104(sp)
    800007b6:	67c2                	ld	a5,16(sp)
    800007b8:	2398                	fld	fa4,0(a5)
    800007ba:	57a6                	lw	a5,104(sp)
    800007bc:	d21787d3          	fcvt.d.wu	fa5,a5
    800007c0:	0af77753          	fsub.d	fa4,fa4,fa5
    800007c4:	0000b797          	auipc	a5,0xb
    800007c8:	a2c78793          	add	a5,a5,-1492 # 8000b1f0 <OSDbg_DataSize+0xe0>
    800007cc:	239c                	fld	fa5,0(a5)
    800007ce:	12f777d3          	fmul.d	fa5,fa4,fa5
    800007d2:	c21797d3          	fcvt.wu.d	a5,fa5,rtz
    800007d6:	d2be                	sw	a5,100(sp)
    800007d8:	47b2                	lw	a5,12(sp)
    800007da:	5716                	lw	a4,100(sp)
    800007dc:	02f777bb          	remuw	a5,a4,a5
    800007e0:	2781                	sext.w	a5,a5
    800007e2:	c8be                	sw	a5,80(sp)
    800007e4:	47b2                	lw	a5,12(sp)
    800007e6:	5716                	lw	a4,100(sp)
    800007e8:	02f757bb          	divuw	a5,a4,a5
    800007ec:	d2be                	sw	a5,100(sp)
    800007ee:	47c6                	lw	a5,80(sp)
    800007f0:	7746                	ld	a4,112(sp)
    800007f2:	973e                	add	a4,a4,a5
    800007f4:	57b6                	lw	a5,108(sp)
    800007f6:	0017869b          	addw	a3,a5,1
    800007fa:	d6b6                	sw	a3,108(sp)
    800007fc:	00074703          	lbu	a4,0(a4)
    80000800:	08078793          	add	a5,a5,128
    80000804:	978a                	add	a5,a5,sp
    80000806:	fae78423          	sb	a4,-88(a5)
    8000080a:	5796                	lw	a5,100(sp)
    8000080c:	2781                	sext.w	a5,a5
    8000080e:	f7e9                	bnez	a5,800007d8 <number+0x18a>
    80000810:	57b6                	lw	a5,108(sp)
    80000812:	0017871b          	addw	a4,a5,1
    80000816:	d6ba                	sw	a4,108(sp)
    80000818:	08078793          	add	a5,a5,128
    8000081c:	978a                	add	a5,a5,sp
    8000081e:	02e00713          	li	a4,46
    80000822:	fae78423          	sb	a4,-88(a5)
    80000826:	47b2                	lw	a5,12(sp)
    80000828:	5726                	lw	a4,104(sp)
    8000082a:	02f777bb          	remuw	a5,a4,a5
    8000082e:	2781                	sext.w	a5,a5
    80000830:	c8be                	sw	a5,80(sp)
    80000832:	47b2                	lw	a5,12(sp)
    80000834:	5726                	lw	a4,104(sp)
    80000836:	02f757bb          	divuw	a5,a4,a5
    8000083a:	d4be                	sw	a5,104(sp)
    8000083c:	47c6                	lw	a5,80(sp)
    8000083e:	7746                	ld	a4,112(sp)
    80000840:	973e                	add	a4,a4,a5
    80000842:	57b6                	lw	a5,108(sp)
    80000844:	0017869b          	addw	a3,a5,1
    80000848:	d6b6                	sw	a3,108(sp)
    8000084a:	00074703          	lbu	a4,0(a4)
    8000084e:	08078793          	add	a5,a5,128
    80000852:	978a                	add	a5,a5,sp
    80000854:	fae78423          	sb	a4,-88(a5)
    80000858:	57a6                	lw	a5,104(sp)
    8000085a:	2781                	sext.w	a5,a5
    8000085c:	f7e9                	bnez	a5,80000826 <number+0x1d8>
    8000085e:	a08d                	j	800008c0 <number+0x272>
    80000860:	67c2                	ld	a5,16(sp)
    80000862:	439c                	lw	a5,0(a5)
    80000864:	ebb9                	bnez	a5,800008ba <number+0x26c>
    80000866:	57b6                	lw	a5,108(sp)
    80000868:	0017871b          	addw	a4,a5,1
    8000086c:	d6ba                	sw	a4,108(sp)
    8000086e:	08078793          	add	a5,a5,128
    80000872:	978a                	add	a5,a5,sp
    80000874:	03000713          	li	a4,48
    80000878:	fae78423          	sb	a4,-88(a5)
    8000087c:	a091                	j	800008c0 <number+0x272>
    8000087e:	67c2                	ld	a5,16(sp)
    80000880:	4398                	lw	a4,0(a5)
    80000882:	47b2                	lw	a5,12(sp)
    80000884:	02f777bb          	remuw	a5,a4,a5
    80000888:	2781                	sext.w	a5,a5
    8000088a:	c8be                	sw	a5,80(sp)
    8000088c:	67c2                	ld	a5,16(sp)
    8000088e:	4398                	lw	a4,0(a5)
    80000890:	47b2                	lw	a5,12(sp)
    80000892:	02f757bb          	divuw	a5,a4,a5
    80000896:	0007871b          	sext.w	a4,a5
    8000089a:	67c2                	ld	a5,16(sp)
    8000089c:	c398                	sw	a4,0(a5)
    8000089e:	47c6                	lw	a5,80(sp)
    800008a0:	7746                	ld	a4,112(sp)
    800008a2:	973e                	add	a4,a4,a5
    800008a4:	57b6                	lw	a5,108(sp)
    800008a6:	0017869b          	addw	a3,a5,1
    800008aa:	d6b6                	sw	a3,108(sp)
    800008ac:	00074703          	lbu	a4,0(a4)
    800008b0:	08078793          	add	a5,a5,128
    800008b4:	978a                	add	a5,a5,sp
    800008b6:	fae78423          	sb	a4,-88(a5)
    800008ba:	67c2                	ld	a5,16(sp)
    800008bc:	439c                	lw	a5,0(a5)
    800008be:	f3e1                	bnez	a5,8000087e <number+0x230>
    800008c0:	57b6                	lw	a5,108(sp)
    800008c2:	873e                	mv	a4,a5
    800008c4:	4792                	lw	a5,4(sp)
    800008c6:	2701                	sext.w	a4,a4
    800008c8:	2781                	sext.w	a5,a5
    800008ca:	00e7d463          	bge	a5,a4,800008d2 <number+0x284>
    800008ce:	57b6                	lw	a5,108(sp)
    800008d0:	c23e                	sw	a5,4(sp)
    800008d2:	47a2                	lw	a5,8(sp)
    800008d4:	873e                	mv	a4,a5
    800008d6:	4792                	lw	a5,4(sp)
    800008d8:	40f707bb          	subw	a5,a4,a5
    800008dc:	c43e                	sw	a5,8(sp)
    800008de:	4782                	lw	a5,0(sp)
    800008e0:	8bc5                	and	a5,a5,17
    800008e2:	2781                	sext.w	a5,a5
    800008e4:	e385                	bnez	a5,80000904 <number+0x2b6>
    800008e6:	a809                	j	800008f8 <number+0x2aa>
    800008e8:	67e2                	ld	a5,24(sp)
    800008ea:	00178713          	add	a4,a5,1
    800008ee:	ec3a                	sd	a4,24(sp)
    800008f0:	02000713          	li	a4,32
    800008f4:	00e78023          	sb	a4,0(a5)
    800008f8:	47a2                	lw	a5,8(sp)
    800008fa:	fff7871b          	addw	a4,a5,-1
    800008fe:	c43a                	sw	a4,8(sp)
    80000900:	fef044e3          	bgtz	a5,800008e8 <number+0x29a>
    80000904:	07f14783          	lbu	a5,127(sp)
    80000908:	0ff7f793          	zext.b	a5,a5
    8000090c:	cb89                	beqz	a5,8000091e <number+0x2d0>
    8000090e:	67e2                	ld	a5,24(sp)
    80000910:	00178713          	add	a4,a5,1
    80000914:	ec3a                	sd	a4,24(sp)
    80000916:	07f14703          	lbu	a4,127(sp)
    8000091a:	00e78023          	sb	a4,0(a5)
    8000091e:	4782                	lw	a5,0(sp)
    80000920:	0207f793          	and	a5,a5,32
    80000924:	2781                	sext.w	a5,a5
    80000926:	cba9                	beqz	a5,80000978 <number+0x32a>
    80000928:	47b2                	lw	a5,12(sp)
    8000092a:	0007871b          	sext.w	a4,a5
    8000092e:	47a1                	li	a5,8
    80000930:	00f71b63          	bne	a4,a5,80000946 <number+0x2f8>
    80000934:	67e2                	ld	a5,24(sp)
    80000936:	00178713          	add	a4,a5,1
    8000093a:	ec3a                	sd	a4,24(sp)
    8000093c:	03000713          	li	a4,48
    80000940:	00e78023          	sb	a4,0(a5)
    80000944:	a815                	j	80000978 <number+0x32a>
    80000946:	47b2                	lw	a5,12(sp)
    80000948:	0007871b          	sext.w	a4,a5
    8000094c:	47c1                	li	a5,16
    8000094e:	02f71563          	bne	a4,a5,80000978 <number+0x32a>
    80000952:	67e2                	ld	a5,24(sp)
    80000954:	00178713          	add	a4,a5,1
    80000958:	ec3a                	sd	a4,24(sp)
    8000095a:	03000713          	li	a4,48
    8000095e:	00e78023          	sb	a4,0(a5)
    80000962:	77c6                	ld	a5,112(sp)
    80000964:	02178713          	add	a4,a5,33
    80000968:	67e2                	ld	a5,24(sp)
    8000096a:	00178693          	add	a3,a5,1
    8000096e:	ec36                	sd	a3,24(sp)
    80000970:	00074703          	lbu	a4,0(a4)
    80000974:	00e78023          	sb	a4,0(a5)
    80000978:	4782                	lw	a5,0(sp)
    8000097a:	8bc1                	and	a5,a5,16
    8000097c:	2781                	sext.w	a5,a5
    8000097e:	eb8d                	bnez	a5,800009b0 <number+0x362>
    80000980:	a809                	j	80000992 <number+0x344>
    80000982:	67e2                	ld	a5,24(sp)
    80000984:	00178713          	add	a4,a5,1
    80000988:	ec3a                	sd	a4,24(sp)
    8000098a:	05714703          	lbu	a4,87(sp)
    8000098e:	00e78023          	sb	a4,0(a5)
    80000992:	47a2                	lw	a5,8(sp)
    80000994:	fff7871b          	addw	a4,a5,-1
    80000998:	c43a                	sw	a4,8(sp)
    8000099a:	fef044e3          	bgtz	a5,80000982 <number+0x334>
    8000099e:	a809                	j	800009b0 <number+0x362>
    800009a0:	67e2                	ld	a5,24(sp)
    800009a2:	00178713          	add	a4,a5,1
    800009a6:	ec3a                	sd	a4,24(sp)
    800009a8:	03000713          	li	a4,48
    800009ac:	00e78023          	sb	a4,0(a5)
    800009b0:	4792                	lw	a5,4(sp)
    800009b2:	fff7871b          	addw	a4,a5,-1
    800009b6:	c23a                	sw	a4,4(sp)
    800009b8:	5736                	lw	a4,108(sp)
    800009ba:	2701                	sext.w	a4,a4
    800009bc:	fef742e3          	blt	a4,a5,800009a0 <number+0x352>
    800009c0:	a829                	j	800009da <number+0x38c>
    800009c2:	67e2                	ld	a5,24(sp)
    800009c4:	00178713          	add	a4,a5,1
    800009c8:	ec3a                	sd	a4,24(sp)
    800009ca:	5736                	lw	a4,108(sp)
    800009cc:	08070713          	add	a4,a4,128
    800009d0:	970a                	add	a4,a4,sp
    800009d2:	fa874703          	lbu	a4,-88(a4)
    800009d6:	00e78023          	sb	a4,0(a5)
    800009da:	57b6                	lw	a5,108(sp)
    800009dc:	fff7871b          	addw	a4,a5,-1
    800009e0:	d6ba                	sw	a4,108(sp)
    800009e2:	fef040e3          	bgtz	a5,800009c2 <number+0x374>
    800009e6:	a809                	j	800009f8 <number+0x3aa>
    800009e8:	67e2                	ld	a5,24(sp)
    800009ea:	00178713          	add	a4,a5,1
    800009ee:	ec3a                	sd	a4,24(sp)
    800009f0:	02000713          	li	a4,32
    800009f4:	00e78023          	sb	a4,0(a5)
    800009f8:	47a2                	lw	a5,8(sp)
    800009fa:	fff7871b          	addw	a4,a5,-1
    800009fe:	c43a                	sw	a4,8(sp)
    80000a00:	fef044e3          	bgtz	a5,800009e8 <number+0x39a>
    80000a04:	67e2                	ld	a5,24(sp)
    80000a06:	853e                	mv	a0,a5
    80000a08:	6109                	add	sp,sp,128
    80000a0a:	8082                	ret

0000000080000a0c <__vsprintf>:
    80000a0c:	7159                	add	sp,sp,-112
    80000a0e:	f486                	sd	ra,104(sp)
    80000a10:	ec2a                	sd	a0,24(sp)
    80000a12:	e82e                	sd	a1,16(sp)
    80000a14:	e432                	sd	a2,8(sp)
    80000a16:	67e2                	ld	a5,24(sp)
    80000a18:	e8be                	sd	a5,80(sp)
    80000a1a:	a9a1                	j	80000e72 <__vsprintf+0x466>
    80000a1c:	67c2                	ld	a5,16(sp)
    80000a1e:	0007c783          	lbu	a5,0(a5)
    80000a22:	873e                	mv	a4,a5
    80000a24:	02500793          	li	a5,37
    80000a28:	00f70c63          	beq	a4,a5,80000a40 <__vsprintf+0x34>
    80000a2c:	6742                	ld	a4,16(sp)
    80000a2e:	67c6                	ld	a5,80(sp)
    80000a30:	00178693          	add	a3,a5,1
    80000a34:	e8b6                	sd	a3,80(sp)
    80000a36:	00074703          	lbu	a4,0(a4)
    80000a3a:	00e78023          	sb	a4,0(a5)
    80000a3e:	a13d                	j	80000e6c <__vsprintf+0x460>
    80000a40:	c282                	sw	zero,68(sp)
    80000a42:	67c2                	ld	a5,16(sp)
    80000a44:	0785                	add	a5,a5,1
    80000a46:	e83e                	sd	a5,16(sp)
    80000a48:	67c2                	ld	a5,16(sp)
    80000a4a:	0007c783          	lbu	a5,0(a5)
    80000a4e:	2781                	sext.w	a5,a5
    80000a50:	fe07869b          	addw	a3,a5,-32
    80000a54:	0006871b          	sext.w	a4,a3
    80000a58:	47c1                	li	a5,16
    80000a5a:	04e7ee63          	bltu	a5,a4,80000ab6 <__vsprintf+0xaa>
    80000a5e:	02069793          	sll	a5,a3,0x20
    80000a62:	9381                	srl	a5,a5,0x20
    80000a64:	00279713          	sll	a4,a5,0x2
    80000a68:	0000a797          	auipc	a5,0xa
    80000a6c:	79078793          	add	a5,a5,1936 # 8000b1f8 <OSDbg_DataSize+0xe8>
    80000a70:	97ba                	add	a5,a5,a4
    80000a72:	439c                	lw	a5,0(a5)
    80000a74:	0007871b          	sext.w	a4,a5
    80000a78:	0000a797          	auipc	a5,0xa
    80000a7c:	78078793          	add	a5,a5,1920 # 8000b1f8 <OSDbg_DataSize+0xe8>
    80000a80:	97ba                	add	a5,a5,a4
    80000a82:	8782                	jr	a5
    80000a84:	4796                	lw	a5,68(sp)
    80000a86:	0107e793          	or	a5,a5,16
    80000a8a:	c2be                	sw	a5,68(sp)
    80000a8c:	bf5d                	j	80000a42 <__vsprintf+0x36>
    80000a8e:	4796                	lw	a5,68(sp)
    80000a90:	0047e793          	or	a5,a5,4
    80000a94:	c2be                	sw	a5,68(sp)
    80000a96:	b775                	j	80000a42 <__vsprintf+0x36>
    80000a98:	4796                	lw	a5,68(sp)
    80000a9a:	0087e793          	or	a5,a5,8
    80000a9e:	c2be                	sw	a5,68(sp)
    80000aa0:	b74d                	j	80000a42 <__vsprintf+0x36>
    80000aa2:	4796                	lw	a5,68(sp)
    80000aa4:	0207e793          	or	a5,a5,32
    80000aa8:	c2be                	sw	a5,68(sp)
    80000aaa:	bf61                	j	80000a42 <__vsprintf+0x36>
    80000aac:	4796                	lw	a5,68(sp)
    80000aae:	0017e793          	or	a5,a5,1
    80000ab2:	c2be                	sw	a5,68(sp)
    80000ab4:	b779                	j	80000a42 <__vsprintf+0x36>
    80000ab6:	57fd                	li	a5,-1
    80000ab8:	c0be                	sw	a5,64(sp)
    80000aba:	67c2                	ld	a5,16(sp)
    80000abc:	0007c783          	lbu	a5,0(a5)
    80000ac0:	873e                	mv	a4,a5
    80000ac2:	02f00793          	li	a5,47
    80000ac6:	02e7f163          	bgeu	a5,a4,80000ae8 <__vsprintf+0xdc>
    80000aca:	67c2                	ld	a5,16(sp)
    80000acc:	0007c783          	lbu	a5,0(a5)
    80000ad0:	873e                	mv	a4,a5
    80000ad2:	03900793          	li	a5,57
    80000ad6:	00e7e963          	bltu	a5,a4,80000ae8 <__vsprintf+0xdc>
    80000ada:	081c                	add	a5,sp,16
    80000adc:	853e                	mv	a0,a5
    80000ade:	b0dff0ef          	jal	800005ea <skip_atoi>
    80000ae2:	87aa                	mv	a5,a0
    80000ae4:	c0be                	sw	a5,64(sp)
    80000ae6:	a835                	j	80000b22 <__vsprintf+0x116>
    80000ae8:	67c2                	ld	a5,16(sp)
    80000aea:	0007c783          	lbu	a5,0(a5)
    80000aee:	873e                	mv	a4,a5
    80000af0:	02a00793          	li	a5,42
    80000af4:	02f71763          	bne	a4,a5,80000b22 <__vsprintf+0x116>
    80000af8:	67c2                	ld	a5,16(sp)
    80000afa:	0785                	add	a5,a5,1
    80000afc:	e83e                	sd	a5,16(sp)
    80000afe:	67a2                	ld	a5,8(sp)
    80000b00:	00878713          	add	a4,a5,8
    80000b04:	e43a                	sd	a4,8(sp)
    80000b06:	439c                	lw	a5,0(a5)
    80000b08:	c0be                	sw	a5,64(sp)
    80000b0a:	4786                	lw	a5,64(sp)
    80000b0c:	2781                	sext.w	a5,a5
    80000b0e:	0007da63          	bgez	a5,80000b22 <__vsprintf+0x116>
    80000b12:	4786                	lw	a5,64(sp)
    80000b14:	40f007bb          	negw	a5,a5
    80000b18:	c0be                	sw	a5,64(sp)
    80000b1a:	4796                	lw	a5,68(sp)
    80000b1c:	0107e793          	or	a5,a5,16
    80000b20:	c2be                	sw	a5,68(sp)
    80000b22:	57fd                	li	a5,-1
    80000b24:	de3e                	sw	a5,60(sp)
    80000b26:	67c2                	ld	a5,16(sp)
    80000b28:	0007c783          	lbu	a5,0(a5)
    80000b2c:	873e                	mv	a4,a5
    80000b2e:	02e00793          	li	a5,46
    80000b32:	04f71f63          	bne	a4,a5,80000b90 <__vsprintf+0x184>
    80000b36:	67c2                	ld	a5,16(sp)
    80000b38:	0785                	add	a5,a5,1
    80000b3a:	e83e                	sd	a5,16(sp)
    80000b3c:	67c2                	ld	a5,16(sp)
    80000b3e:	0007c783          	lbu	a5,0(a5)
    80000b42:	873e                	mv	a4,a5
    80000b44:	02f00793          	li	a5,47
    80000b48:	02e7f163          	bgeu	a5,a4,80000b6a <__vsprintf+0x15e>
    80000b4c:	67c2                	ld	a5,16(sp)
    80000b4e:	0007c783          	lbu	a5,0(a5)
    80000b52:	873e                	mv	a4,a5
    80000b54:	03900793          	li	a5,57
    80000b58:	00e7e963          	bltu	a5,a4,80000b6a <__vsprintf+0x15e>
    80000b5c:	081c                	add	a5,sp,16
    80000b5e:	853e                	mv	a0,a5
    80000b60:	a8bff0ef          	jal	800005ea <skip_atoi>
    80000b64:	87aa                	mv	a5,a0
    80000b66:	de3e                	sw	a5,60(sp)
    80000b68:	a839                	j	80000b86 <__vsprintf+0x17a>
    80000b6a:	67c2                	ld	a5,16(sp)
    80000b6c:	0007c783          	lbu	a5,0(a5)
    80000b70:	873e                	mv	a4,a5
    80000b72:	02a00793          	li	a5,42
    80000b76:	00f71863          	bne	a4,a5,80000b86 <__vsprintf+0x17a>
    80000b7a:	67a2                	ld	a5,8(sp)
    80000b7c:	00878713          	add	a4,a5,8
    80000b80:	e43a                	sd	a4,8(sp)
    80000b82:	439c                	lw	a5,0(a5)
    80000b84:	de3e                	sw	a5,60(sp)
    80000b86:	57f2                	lw	a5,60(sp)
    80000b88:	2781                	sext.w	a5,a5
    80000b8a:	0007d363          	bgez	a5,80000b90 <__vsprintf+0x184>
    80000b8e:	de02                	sw	zero,60(sp)
    80000b90:	57fd                	li	a5,-1
    80000b92:	dc3e                	sw	a5,56(sp)
    80000b94:	67c2                	ld	a5,16(sp)
    80000b96:	0007c783          	lbu	a5,0(a5)
    80000b9a:	873e                	mv	a4,a5
    80000b9c:	06800793          	li	a5,104
    80000ba0:	02f70263          	beq	a4,a5,80000bc4 <__vsprintf+0x1b8>
    80000ba4:	67c2                	ld	a5,16(sp)
    80000ba6:	0007c783          	lbu	a5,0(a5)
    80000baa:	873e                	mv	a4,a5
    80000bac:	06c00793          	li	a5,108
    80000bb0:	00f70a63          	beq	a4,a5,80000bc4 <__vsprintf+0x1b8>
    80000bb4:	67c2                	ld	a5,16(sp)
    80000bb6:	0007c783          	lbu	a5,0(a5)
    80000bba:	873e                	mv	a4,a5
    80000bbc:	04c00793          	li	a5,76
    80000bc0:	00f71963          	bne	a4,a5,80000bd2 <__vsprintf+0x1c6>
    80000bc4:	67c2                	ld	a5,16(sp)
    80000bc6:	0007c783          	lbu	a5,0(a5)
    80000bca:	dc3e                	sw	a5,56(sp)
    80000bcc:	67c2                	ld	a5,16(sp)
    80000bce:	0785                	add	a5,a5,1
    80000bd0:	e83e                	sd	a5,16(sp)
    80000bd2:	67c2                	ld	a5,16(sp)
    80000bd4:	0007c783          	lbu	a5,0(a5)
    80000bd8:	2781                	sext.w	a5,a5
    80000bda:	fa87869b          	addw	a3,a5,-88
    80000bde:	0006871b          	sext.w	a4,a3
    80000be2:	02000793          	li	a5,32
    80000be6:	24e7e163          	bltu	a5,a4,80000e28 <__vsprintf+0x41c>
    80000bea:	02069793          	sll	a5,a3,0x20
    80000bee:	9381                	srl	a5,a5,0x20
    80000bf0:	00279713          	sll	a4,a5,0x2
    80000bf4:	0000a797          	auipc	a5,0xa
    80000bf8:	64878793          	add	a5,a5,1608 # 8000b23c <OSDbg_DataSize+0x12c>
    80000bfc:	97ba                	add	a5,a5,a4
    80000bfe:	439c                	lw	a5,0(a5)
    80000c00:	0007871b          	sext.w	a4,a5
    80000c04:	0000a797          	auipc	a5,0xa
    80000c08:	63878793          	add	a5,a5,1592 # 8000b23c <OSDbg_DataSize+0x12c>
    80000c0c:	97ba                	add	a5,a5,a4
    80000c0e:	8782                	jr	a5
    80000c10:	4796                	lw	a5,68(sp)
    80000c12:	8bc1                	and	a5,a5,16
    80000c14:	2781                	sext.w	a5,a5
    80000c16:	e38d                	bnez	a5,80000c38 <__vsprintf+0x22c>
    80000c18:	a809                	j	80000c2a <__vsprintf+0x21e>
    80000c1a:	67c6                	ld	a5,80(sp)
    80000c1c:	00178713          	add	a4,a5,1
    80000c20:	e8ba                	sd	a4,80(sp)
    80000c22:	02000713          	li	a4,32
    80000c26:	00e78023          	sb	a4,0(a5)
    80000c2a:	4786                	lw	a5,64(sp)
    80000c2c:	37fd                	addw	a5,a5,-1
    80000c2e:	c0be                	sw	a5,64(sp)
    80000c30:	4786                	lw	a5,64(sp)
    80000c32:	2781                	sext.w	a5,a5
    80000c34:	fef043e3          	bgtz	a5,80000c1a <__vsprintf+0x20e>
    80000c38:	67a2                	ld	a5,8(sp)
    80000c3a:	00878713          	add	a4,a5,8
    80000c3e:	e43a                	sd	a4,8(sp)
    80000c40:	4394                	lw	a3,0(a5)
    80000c42:	67c6                	ld	a5,80(sp)
    80000c44:	00178713          	add	a4,a5,1
    80000c48:	e8ba                	sd	a4,80(sp)
    80000c4a:	0ff6f713          	zext.b	a4,a3
    80000c4e:	00e78023          	sb	a4,0(a5)
    80000c52:	a809                	j	80000c64 <__vsprintf+0x258>
    80000c54:	67c6                	ld	a5,80(sp)
    80000c56:	00178713          	add	a4,a5,1
    80000c5a:	e8ba                	sd	a4,80(sp)
    80000c5c:	02000713          	li	a4,32
    80000c60:	00e78023          	sb	a4,0(a5)
    80000c64:	4786                	lw	a5,64(sp)
    80000c66:	37fd                	addw	a5,a5,-1
    80000c68:	c0be                	sw	a5,64(sp)
    80000c6a:	4786                	lw	a5,64(sp)
    80000c6c:	2781                	sext.w	a5,a5
    80000c6e:	fef043e3          	bgtz	a5,80000c54 <__vsprintf+0x248>
    80000c72:	aaed                	j	80000e6c <__vsprintf+0x460>
    80000c74:	67a2                	ld	a5,8(sp)
    80000c76:	00878713          	add	a4,a5,8
    80000c7a:	e43a                	sd	a4,8(sp)
    80000c7c:	639c                	ld	a5,0(a5)
    80000c7e:	e4be                	sd	a5,72(sp)
    80000c80:	6526                	ld	a0,72(sp)
    80000c82:	dd4ff0ef          	jal	80000256 <strlen>
    80000c86:	87aa                	mv	a5,a0
    80000c88:	2781                	sext.w	a5,a5
    80000c8a:	cebe                	sw	a5,92(sp)
    80000c8c:	57f2                	lw	a5,60(sp)
    80000c8e:	2781                	sext.w	a5,a5
    80000c90:	0007d563          	bgez	a5,80000c9a <__vsprintf+0x28e>
    80000c94:	47f6                	lw	a5,92(sp)
    80000c96:	de3e                	sw	a5,60(sp)
    80000c98:	a811                	j	80000cac <__vsprintf+0x2a0>
    80000c9a:	47f6                	lw	a5,92(sp)
    80000c9c:	873e                	mv	a4,a5
    80000c9e:	57f2                	lw	a5,60(sp)
    80000ca0:	2701                	sext.w	a4,a4
    80000ca2:	2781                	sext.w	a5,a5
    80000ca4:	00e7d463          	bge	a5,a4,80000cac <__vsprintf+0x2a0>
    80000ca8:	57f2                	lw	a5,60(sp)
    80000caa:	cebe                	sw	a5,92(sp)
    80000cac:	4796                	lw	a5,68(sp)
    80000cae:	8bc1                	and	a5,a5,16
    80000cb0:	2781                	sext.w	a5,a5
    80000cb2:	e395                	bnez	a5,80000cd6 <__vsprintf+0x2ca>
    80000cb4:	a809                	j	80000cc6 <__vsprintf+0x2ba>
    80000cb6:	67c6                	ld	a5,80(sp)
    80000cb8:	00178713          	add	a4,a5,1
    80000cbc:	e8ba                	sd	a4,80(sp)
    80000cbe:	02000713          	li	a4,32
    80000cc2:	00e78023          	sb	a4,0(a5)
    80000cc6:	4786                	lw	a5,64(sp)
    80000cc8:	fff7871b          	addw	a4,a5,-1
    80000ccc:	c0ba                	sw	a4,64(sp)
    80000cce:	4776                	lw	a4,92(sp)
    80000cd0:	2701                	sext.w	a4,a4
    80000cd2:	fef742e3          	blt	a4,a5,80000cb6 <__vsprintf+0x2aa>
    80000cd6:	cc82                	sw	zero,88(sp)
    80000cd8:	a005                	j	80000cf8 <__vsprintf+0x2ec>
    80000cda:	6726                	ld	a4,72(sp)
    80000cdc:	00170793          	add	a5,a4,1
    80000ce0:	e4be                	sd	a5,72(sp)
    80000ce2:	67c6                	ld	a5,80(sp)
    80000ce4:	00178693          	add	a3,a5,1
    80000ce8:	e8b6                	sd	a3,80(sp)
    80000cea:	00074703          	lbu	a4,0(a4)
    80000cee:	00e78023          	sb	a4,0(a5)
    80000cf2:	47e6                	lw	a5,88(sp)
    80000cf4:	2785                	addw	a5,a5,1
    80000cf6:	ccbe                	sw	a5,88(sp)
    80000cf8:	47e6                	lw	a5,88(sp)
    80000cfa:	873e                	mv	a4,a5
    80000cfc:	47f6                	lw	a5,92(sp)
    80000cfe:	2701                	sext.w	a4,a4
    80000d00:	2781                	sext.w	a5,a5
    80000d02:	fcf74ce3          	blt	a4,a5,80000cda <__vsprintf+0x2ce>
    80000d06:	a809                	j	80000d18 <__vsprintf+0x30c>
    80000d08:	67c6                	ld	a5,80(sp)
    80000d0a:	00178713          	add	a4,a5,1
    80000d0e:	e8ba                	sd	a4,80(sp)
    80000d10:	02000713          	li	a4,32
    80000d14:	00e78023          	sb	a4,0(a5)
    80000d18:	4786                	lw	a5,64(sp)
    80000d1a:	fff7871b          	addw	a4,a5,-1
    80000d1e:	c0ba                	sw	a4,64(sp)
    80000d20:	4776                	lw	a4,92(sp)
    80000d22:	2701                	sext.w	a4,a4
    80000d24:	fef742e3          	blt	a4,a5,80000d08 <__vsprintf+0x2fc>
    80000d28:	a291                	j	80000e6c <__vsprintf+0x460>
    80000d2a:	67a2                	ld	a5,8(sp)
    80000d2c:	00878713          	add	a4,a5,8
    80000d30:	e43a                	sd	a4,8(sp)
    80000d32:	639c                	ld	a5,0(a5)
    80000d34:	2781                	sext.w	a5,a5
    80000d36:	d63e                	sw	a5,44(sp)
    80000d38:	4796                	lw	a5,68(sp)
    80000d3a:	5772                	lw	a4,60(sp)
    80000d3c:	4686                	lw	a3,64(sp)
    80000d3e:	106c                	add	a1,sp,44
    80000d40:	4621                	li	a2,8
    80000d42:	6546                	ld	a0,80(sp)
    80000d44:	90bff0ef          	jal	8000064e <number>
    80000d48:	e8aa                	sd	a0,80(sp)
    80000d4a:	a20d                	j	80000e6c <__vsprintf+0x460>
    80000d4c:	4786                	lw	a5,64(sp)
    80000d4e:	0007871b          	sext.w	a4,a5
    80000d52:	57fd                	li	a5,-1
    80000d54:	00f71863          	bne	a4,a5,80000d64 <__vsprintf+0x358>
    80000d58:	47a1                	li	a5,8
    80000d5a:	c0be                	sw	a5,64(sp)
    80000d5c:	4796                	lw	a5,68(sp)
    80000d5e:	0017e793          	or	a5,a5,1
    80000d62:	c2be                	sw	a5,68(sp)
    80000d64:	67a2                	ld	a5,8(sp)
    80000d66:	00878713          	add	a4,a5,8
    80000d6a:	e43a                	sd	a4,8(sp)
    80000d6c:	639c                	ld	a5,0(a5)
    80000d6e:	2781                	sext.w	a5,a5
    80000d70:	d63e                	sw	a5,44(sp)
    80000d72:	4796                	lw	a5,68(sp)
    80000d74:	5772                	lw	a4,60(sp)
    80000d76:	4686                	lw	a3,64(sp)
    80000d78:	106c                	add	a1,sp,44
    80000d7a:	4641                	li	a2,16
    80000d7c:	6546                	ld	a0,80(sp)
    80000d7e:	8d1ff0ef          	jal	8000064e <number>
    80000d82:	e8aa                	sd	a0,80(sp)
    80000d84:	a0e5                	j	80000e6c <__vsprintf+0x460>
    80000d86:	4796                	lw	a5,68(sp)
    80000d88:	0407e793          	or	a5,a5,64
    80000d8c:	c2be                	sw	a5,68(sp)
    80000d8e:	67a2                	ld	a5,8(sp)
    80000d90:	00878713          	add	a4,a5,8
    80000d94:	e43a                	sd	a4,8(sp)
    80000d96:	639c                	ld	a5,0(a5)
    80000d98:	2781                	sext.w	a5,a5
    80000d9a:	d63e                	sw	a5,44(sp)
    80000d9c:	4796                	lw	a5,68(sp)
    80000d9e:	5772                	lw	a4,60(sp)
    80000da0:	4686                	lw	a3,64(sp)
    80000da2:	106c                	add	a1,sp,44
    80000da4:	4641                	li	a2,16
    80000da6:	6546                	ld	a0,80(sp)
    80000da8:	8a7ff0ef          	jal	8000064e <number>
    80000dac:	e8aa                	sd	a0,80(sp)
    80000dae:	a87d                	j	80000e6c <__vsprintf+0x460>
    80000db0:	4796                	lw	a5,68(sp)
    80000db2:	0027e793          	or	a5,a5,2
    80000db6:	c2be                	sw	a5,68(sp)
    80000db8:	67a2                	ld	a5,8(sp)
    80000dba:	00878713          	add	a4,a5,8
    80000dbe:	e43a                	sd	a4,8(sp)
    80000dc0:	639c                	ld	a5,0(a5)
    80000dc2:	2781                	sext.w	a5,a5
    80000dc4:	d63e                	sw	a5,44(sp)
    80000dc6:	4796                	lw	a5,68(sp)
    80000dc8:	5772                	lw	a4,60(sp)
    80000dca:	4686                	lw	a3,64(sp)
    80000dcc:	106c                	add	a1,sp,44
    80000dce:	4629                	li	a2,10
    80000dd0:	6546                	ld	a0,80(sp)
    80000dd2:	87dff0ef          	jal	8000064e <number>
    80000dd6:	e8aa                	sd	a0,80(sp)
    80000dd8:	a851                	j	80000e6c <__vsprintf+0x460>
    80000dda:	67a2                	ld	a5,8(sp)
    80000ddc:	00878713          	add	a4,a5,8
    80000de0:	e43a                	sd	a4,8(sp)
    80000de2:	639c                	ld	a5,0(a5)
    80000de4:	f83e                	sd	a5,48(sp)
    80000de6:	6746                	ld	a4,80(sp)
    80000de8:	67e2                	ld	a5,24(sp)
    80000dea:	40f707b3          	sub	a5,a4,a5
    80000dee:	0007871b          	sext.w	a4,a5
    80000df2:	77c2                	ld	a5,48(sp)
    80000df4:	c398                	sw	a4,0(a5)
    80000df6:	a89d                	j	80000e6c <__vsprintf+0x460>
    80000df8:	4796                	lw	a5,68(sp)
    80000dfa:	0027e793          	or	a5,a5,2
    80000dfe:	c2be                	sw	a5,68(sp)
    80000e00:	4796                	lw	a5,68(sp)
    80000e02:	0807e793          	or	a5,a5,128
    80000e06:	c2be                	sw	a5,68(sp)
    80000e08:	67a2                	ld	a5,8(sp)
    80000e0a:	00878713          	add	a4,a5,8
    80000e0e:	e43a                	sd	a4,8(sp)
    80000e10:	239c                	fld	fa5,0(a5)
    80000e12:	b03e                	fsd	fa5,32(sp)
    80000e14:	4796                	lw	a5,68(sp)
    80000e16:	5772                	lw	a4,60(sp)
    80000e18:	4686                	lw	a3,64(sp)
    80000e1a:	100c                	add	a1,sp,32
    80000e1c:	4629                	li	a2,10
    80000e1e:	6546                	ld	a0,80(sp)
    80000e20:	82fff0ef          	jal	8000064e <number>
    80000e24:	e8aa                	sd	a0,80(sp)
    80000e26:	a099                	j	80000e6c <__vsprintf+0x460>
    80000e28:	67c2                	ld	a5,16(sp)
    80000e2a:	0007c783          	lbu	a5,0(a5)
    80000e2e:	873e                	mv	a4,a5
    80000e30:	02500793          	li	a5,37
    80000e34:	00f70a63          	beq	a4,a5,80000e48 <__vsprintf+0x43c>
    80000e38:	67c6                	ld	a5,80(sp)
    80000e3a:	00178713          	add	a4,a5,1
    80000e3e:	e8ba                	sd	a4,80(sp)
    80000e40:	02500713          	li	a4,37
    80000e44:	00e78023          	sb	a4,0(a5)
    80000e48:	67c2                	ld	a5,16(sp)
    80000e4a:	0007c783          	lbu	a5,0(a5)
    80000e4e:	cb99                	beqz	a5,80000e64 <__vsprintf+0x458>
    80000e50:	6742                	ld	a4,16(sp)
    80000e52:	67c6                	ld	a5,80(sp)
    80000e54:	00178693          	add	a3,a5,1
    80000e58:	e8b6                	sd	a3,80(sp)
    80000e5a:	00074703          	lbu	a4,0(a4)
    80000e5e:	00e78023          	sb	a4,0(a5)
    80000e62:	a021                	j	80000e6a <__vsprintf+0x45e>
    80000e64:	67c2                	ld	a5,16(sp)
    80000e66:	17fd                	add	a5,a5,-1
    80000e68:	e83e                	sd	a5,16(sp)
    80000e6a:	0001                	nop
    80000e6c:	67c2                	ld	a5,16(sp)
    80000e6e:	0785                	add	a5,a5,1
    80000e70:	e83e                	sd	a5,16(sp)
    80000e72:	67c2                	ld	a5,16(sp)
    80000e74:	0007c783          	lbu	a5,0(a5)
    80000e78:	ba0792e3          	bnez	a5,80000a1c <__vsprintf+0x10>
    80000e7c:	67c6                	ld	a5,80(sp)
    80000e7e:	00078023          	sb	zero,0(a5)
    80000e82:	6746                	ld	a4,80(sp)
    80000e84:	67e2                	ld	a5,24(sp)
    80000e86:	40f707b3          	sub	a5,a4,a5
    80000e8a:	ccbe                	sw	a5,88(sp)
    80000e8c:	47e6                	lw	a5,88(sp)
    80000e8e:	853e                	mv	a0,a5
    80000e90:	70a6                	ld	ra,104(sp)
    80000e92:	6165                	add	sp,sp,112
    80000e94:	8082                	ret

0000000080000e96 <sprintf>:
    80000e96:	7149                	add	sp,sp,-368
    80000e98:	fe06                	sd	ra,312(sp)
    80000e9a:	ec2a                	sd	a0,24(sp)
    80000e9c:	e82e                	sd	a1,16(sp)
    80000e9e:	e2b2                	sd	a2,320(sp)
    80000ea0:	e6b6                	sd	a3,328(sp)
    80000ea2:	eaba                	sd	a4,336(sp)
    80000ea4:	eebe                	sd	a5,344(sp)
    80000ea6:	f2c2                	sd	a6,352(sp)
    80000ea8:	f6c6                	sd	a7,360(sp)
    80000eaa:	1a9c                	add	a5,sp,368
    80000eac:	e43e                	sd	a5,8(sp)
    80000eae:	67a2                	ld	a5,8(sp)
    80000eb0:	fd078793          	add	a5,a5,-48
    80000eb4:	f23e                	sd	a5,288(sp)
    80000eb6:	7712                	ld	a4,288(sp)
    80000eb8:	101c                	add	a5,sp,32
    80000eba:	863a                	mv	a2,a4
    80000ebc:	65c2                	ld	a1,16(sp)
    80000ebe:	853e                	mv	a0,a5
    80000ec0:	b4dff0ef          	jal	80000a0c <__vsprintf>
    80000ec4:	87aa                	mv	a5,a0
    80000ec6:	12f12623          	sw	a5,300(sp)
    80000eca:	12c12783          	lw	a5,300(sp)
    80000ece:	853e                	mv	a0,a5
    80000ed0:	70f2                	ld	ra,312(sp)
    80000ed2:	6175                	add	sp,sp,368
    80000ed4:	8082                	ret

0000000080000ed6 <panic>:
    80000ed6:	1101                	add	sp,sp,-32
    80000ed8:	ec06                	sd	ra,24(sp)
    80000eda:	e42a                	sd	a0,8(sp)
    80000edc:	1f8000ef          	jal	800010d4 <w_int_off>
    80000ee0:	65a2                	ld	a1,8(sp)
    80000ee2:	0000a517          	auipc	a0,0xa
    80000ee6:	2b650513          	add	a0,a0,694 # 8000b198 <OSDbg_DataSize+0x88>
    80000eea:	e8aff0ef          	jal	80000574 <printf>
    80000eee:	0001                	nop
    80000ef0:	bffd                	j	80000eee <panic+0x18>

0000000080000ef2 <assert_fail>:
    80000ef2:	1101                	add	sp,sp,-32
    80000ef4:	ec06                	sd	ra,24(sp)
    80000ef6:	e42a                	sd	a0,8(sp)
    80000ef8:	87ae                	mv	a5,a1
    80000efa:	c23e                	sw	a5,4(sp)
    80000efc:	0000a517          	auipc	a0,0xa
    80000f00:	2b450513          	add	a0,a0,692 # 8000b1b0 <OSDbg_DataSize+0xa0>
    80000f04:	e70ff0ef          	jal	80000574 <printf>
    80000f08:	65a2                	ld	a1,8(sp)
    80000f0a:	0000a517          	auipc	a0,0xa
    80000f0e:	2b650513          	add	a0,a0,694 # 8000b1c0 <OSDbg_DataSize+0xb0>
    80000f12:	e62ff0ef          	jal	80000574 <printf>
    80000f16:	4792                	lw	a5,4(sp)
    80000f18:	85be                	mv	a1,a5
    80000f1a:	0000a517          	auipc	a0,0xa
    80000f1e:	2b650513          	add	a0,a0,694 # 8000b1d0 <OSDbg_DataSize+0xc0>
    80000f22:	e52ff0ef          	jal	80000574 <printf>
    80000f26:	0000a517          	auipc	a0,0xa
    80000f2a:	28a50513          	add	a0,a0,650 # 8000b1b0 <OSDbg_DataSize+0xa0>
    80000f2e:	e46ff0ef          	jal	80000574 <printf>
    80000f32:	0000a517          	auipc	a0,0xa
    80000f36:	2ae50513          	add	a0,a0,686 # 8000b1e0 <OSDbg_DataSize+0xd0>
    80000f3a:	f9dff0ef          	jal	80000ed6 <panic>
    80000f3e:	0001                	nop
    80000f40:	60e2                	ld	ra,24(sp)
    80000f42:	6105                	add	sp,sp,32
    80000f44:	8082                	ret

0000000080000f46 <sfence>:
    80000f46:	12000073          	sfence.vma
    80000f4a:	0001                	nop
    80000f4c:	8082                	ret

0000000080000f4e <r_int>:
    80000f4e:	1141                	add	sp,sp,-16
    80000f50:	e406                	sd	ra,8(sp)
    80000f52:	106000ef          	jal	80001058 <r_mstatus>
    80000f56:	87aa                	mv	a5,a0
    80000f58:	8ba1                	and	a5,a5,8
    80000f5a:	c399                	beqz	a5,80000f60 <r_int+0x12>
    80000f5c:	4785                	li	a5,1
    80000f5e:	a011                	j	80000f62 <r_int+0x14>
    80000f60:	4781                	li	a5,0
    80000f62:	853e                	mv	a0,a5
    80000f64:	60a2                	ld	ra,8(sp)
    80000f66:	0141                	add	sp,sp,16
    80000f68:	8082                	ret

0000000080000f6a <r_tp>:
    80000f6a:	1141                	add	sp,sp,-16
    80000f6c:	8792                	mv	a5,tp
    80000f6e:	e43e                	sd	a5,8(sp)
    80000f70:	67a2                	ld	a5,8(sp)
    80000f72:	853e                	mv	a0,a5
    80000f74:	0141                	add	sp,sp,16
    80000f76:	8082                	ret

0000000080000f78 <r_sip>:
    80000f78:	1141                	add	sp,sp,-16
    80000f7a:	144027f3          	csrr	a5,sip
    80000f7e:	e43e                	sd	a5,8(sp)
    80000f80:	67a2                	ld	a5,8(sp)
    80000f82:	853e                	mv	a0,a5
    80000f84:	0141                	add	sp,sp,16
    80000f86:	8082                	ret

0000000080000f88 <r_mip>:
    80000f88:	1141                	add	sp,sp,-16
    80000f8a:	344027f3          	csrr	a5,mip
    80000f8e:	e43e                	sd	a5,8(sp)
    80000f90:	67a2                	ld	a5,8(sp)
    80000f92:	853e                	mv	a0,a5
    80000f94:	0141                	add	sp,sp,16
    80000f96:	8082                	ret

0000000080000f98 <r_sie>:
    80000f98:	1141                	add	sp,sp,-16
    80000f9a:	104027f3          	csrr	a5,sie
    80000f9e:	e43e                	sd	a5,8(sp)
    80000fa0:	67a2                	ld	a5,8(sp)
    80000fa2:	853e                	mv	a0,a5
    80000fa4:	0141                	add	sp,sp,16
    80000fa6:	8082                	ret

0000000080000fa8 <r_mie>:
    80000fa8:	1141                	add	sp,sp,-16
    80000faa:	304027f3          	csrr	a5,mie
    80000fae:	e43e                	sd	a5,8(sp)
    80000fb0:	67a2                	ld	a5,8(sp)
    80000fb2:	853e                	mv	a0,a5
    80000fb4:	0141                	add	sp,sp,16
    80000fb6:	8082                	ret

0000000080000fb8 <r_satp>:
    80000fb8:	1141                	add	sp,sp,-16
    80000fba:	180027f3          	csrr	a5,satp
    80000fbe:	e43e                	sd	a5,8(sp)
    80000fc0:	67a2                	ld	a5,8(sp)
    80000fc2:	853e                	mv	a0,a5
    80000fc4:	0141                	add	sp,sp,16
    80000fc6:	8082                	ret

0000000080000fc8 <r_sepc>:
    80000fc8:	1141                	add	sp,sp,-16
    80000fca:	141027f3          	csrr	a5,sepc
    80000fce:	e43e                	sd	a5,8(sp)
    80000fd0:	67a2                	ld	a5,8(sp)
    80000fd2:	853e                	mv	a0,a5
    80000fd4:	0141                	add	sp,sp,16
    80000fd6:	8082                	ret

0000000080000fd8 <r_mepc>:
    80000fd8:	1141                	add	sp,sp,-16
    80000fda:	341027f3          	csrr	a5,mepc
    80000fde:	e43e                	sd	a5,8(sp)
    80000fe0:	67a2                	ld	a5,8(sp)
    80000fe2:	853e                	mv	a0,a5
    80000fe4:	0141                	add	sp,sp,16
    80000fe6:	8082                	ret

0000000080000fe8 <r_stval>:
    80000fe8:	1141                	add	sp,sp,-16
    80000fea:	143027f3          	csrr	a5,stval
    80000fee:	e43e                	sd	a5,8(sp)
    80000ff0:	67a2                	ld	a5,8(sp)
    80000ff2:	853e                	mv	a0,a5
    80000ff4:	0141                	add	sp,sp,16
    80000ff6:	8082                	ret

0000000080000ff8 <r_mtval>:
    80000ff8:	1141                	add	sp,sp,-16
    80000ffa:	343027f3          	csrr	a5,mtval
    80000ffe:	e43e                	sd	a5,8(sp)
    80001000:	67a2                	ld	a5,8(sp)
    80001002:	853e                	mv	a0,a5
    80001004:	0141                	add	sp,sp,16
    80001006:	8082                	ret

0000000080001008 <r_stvec>:
    80001008:	1141                	add	sp,sp,-16
    8000100a:	105027f3          	csrr	a5,stvec
    8000100e:	e43e                	sd	a5,8(sp)
    80001010:	67a2                	ld	a5,8(sp)
    80001012:	853e                	mv	a0,a5
    80001014:	0141                	add	sp,sp,16
    80001016:	8082                	ret

0000000080001018 <r_mtvec>:
    80001018:	1141                	add	sp,sp,-16
    8000101a:	305027f3          	csrr	a5,mtvec
    8000101e:	e43e                	sd	a5,8(sp)
    80001020:	67a2                	ld	a5,8(sp)
    80001022:	853e                	mv	a0,a5
    80001024:	0141                	add	sp,sp,16
    80001026:	8082                	ret

0000000080001028 <r_scause>:
    80001028:	1141                	add	sp,sp,-16
    8000102a:	142027f3          	csrr	a5,scause
    8000102e:	e43e                	sd	a5,8(sp)
    80001030:	67a2                	ld	a5,8(sp)
    80001032:	853e                	mv	a0,a5
    80001034:	0141                	add	sp,sp,16
    80001036:	8082                	ret

0000000080001038 <r_mcause>:
    80001038:	1141                	add	sp,sp,-16
    8000103a:	342027f3          	csrr	a5,mcause
    8000103e:	e43e                	sd	a5,8(sp)
    80001040:	67a2                	ld	a5,8(sp)
    80001042:	853e                	mv	a0,a5
    80001044:	0141                	add	sp,sp,16
    80001046:	8082                	ret

0000000080001048 <r_sstatus>:
    80001048:	1141                	add	sp,sp,-16
    8000104a:	100027f3          	csrr	a5,sstatus
    8000104e:	e43e                	sd	a5,8(sp)
    80001050:	67a2                	ld	a5,8(sp)
    80001052:	853e                	mv	a0,a5
    80001054:	0141                	add	sp,sp,16
    80001056:	8082                	ret

0000000080001058 <r_mstatus>:
    80001058:	1141                	add	sp,sp,-16
    8000105a:	300027f3          	csrr	a5,mstatus
    8000105e:	e43e                	sd	a5,8(sp)
    80001060:	67a2                	ld	a5,8(sp)
    80001062:	853e                	mv	a0,a5
    80001064:	0141                	add	sp,sp,16
    80001066:	8082                	ret

0000000080001068 <r_mhartid>:
    80001068:	1141                	add	sp,sp,-16
    8000106a:	f14027f3          	csrr	a5,mhartid
    8000106e:	e43e                	sd	a5,8(sp)
    80001070:	67a2                	ld	a5,8(sp)
    80001072:	853e                	mv	a0,a5
    80001074:	0141                	add	sp,sp,16
    80001076:	8082                	ret

0000000080001078 <r_mideleg>:
    80001078:	1141                	add	sp,sp,-16
    8000107a:	303027f3          	csrr	a5,mideleg
    8000107e:	e43e                	sd	a5,8(sp)
    80001080:	67a2                	ld	a5,8(sp)
    80001082:	853e                	mv	a0,a5
    80001084:	0141                	add	sp,sp,16
    80001086:	8082                	ret

0000000080001088 <r_medeleg>:
    80001088:	1141                	add	sp,sp,-16
    8000108a:	302027f3          	csrr	a5,medeleg
    8000108e:	e43e                	sd	a5,8(sp)
    80001090:	67a2                	ld	a5,8(sp)
    80001092:	853e                	mv	a0,a5
    80001094:	0141                	add	sp,sp,16
    80001096:	8082                	ret

0000000080001098 <r_sscratch>:
    80001098:	1141                	add	sp,sp,-16
    8000109a:	140027f3          	csrr	a5,sscratch
    8000109e:	e43e                	sd	a5,8(sp)
    800010a0:	67a2                	ld	a5,8(sp)
    800010a2:	853e                	mv	a0,a5
    800010a4:	0141                	add	sp,sp,16
    800010a6:	8082                	ret

00000000800010a8 <r_mscratch>:
    800010a8:	1141                	add	sp,sp,-16
    800010aa:	340027f3          	csrr	a5,mscratch
    800010ae:	e43e                	sd	a5,8(sp)
    800010b0:	67a2                	ld	a5,8(sp)
    800010b2:	853e                	mv	a0,a5
    800010b4:	0141                	add	sp,sp,16
    800010b6:	8082                	ret

00000000800010b8 <w_int_on>:
    800010b8:	1141                	add	sp,sp,-16
    800010ba:	e406                	sd	ra,8(sp)
    800010bc:	f9dff0ef          	jal	80001058 <r_mstatus>
    800010c0:	87aa                	mv	a5,a0
    800010c2:	0087e793          	or	a5,a5,8
    800010c6:	853e                	mv	a0,a5
    800010c8:	11a000ef          	jal	800011e2 <w_mstatus>
    800010cc:	0001                	nop
    800010ce:	60a2                	ld	ra,8(sp)
    800010d0:	0141                	add	sp,sp,16
    800010d2:	8082                	ret

00000000800010d4 <w_int_off>:
    800010d4:	1141                	add	sp,sp,-16
    800010d6:	e406                	sd	ra,8(sp)
    800010d8:	f81ff0ef          	jal	80001058 <r_mstatus>
    800010dc:	872a                	mv	a4,a0
    800010de:	4785                	li	a5,1
    800010e0:	1782                	sll	a5,a5,0x20
    800010e2:	17dd                	add	a5,a5,-9
    800010e4:	8ff9                	and	a5,a5,a4
    800010e6:	853e                	mv	a0,a5
    800010e8:	0fa000ef          	jal	800011e2 <w_mstatus>
    800010ec:	0001                	nop
    800010ee:	60a2                	ld	ra,8(sp)
    800010f0:	0141                	add	sp,sp,16
    800010f2:	8082                	ret

00000000800010f4 <w_tp>:
    800010f4:	1141                	add	sp,sp,-16
    800010f6:	e42a                	sd	a0,8(sp)
    800010f8:	67a2                	ld	a5,8(sp)
    800010fa:	823e                	mv	tp,a5
    800010fc:	0001                	nop
    800010fe:	0141                	add	sp,sp,16
    80001100:	8082                	ret

0000000080001102 <w_sip>:
    80001102:	1141                	add	sp,sp,-16
    80001104:	e42a                	sd	a0,8(sp)
    80001106:	67a2                	ld	a5,8(sp)
    80001108:	14479073          	csrw	sip,a5
    8000110c:	0001                	nop
    8000110e:	0141                	add	sp,sp,16
    80001110:	8082                	ret

0000000080001112 <w_mip>:
    80001112:	1141                	add	sp,sp,-16
    80001114:	e42a                	sd	a0,8(sp)
    80001116:	67a2                	ld	a5,8(sp)
    80001118:	34479073          	csrw	mip,a5
    8000111c:	0001                	nop
    8000111e:	0141                	add	sp,sp,16
    80001120:	8082                	ret

0000000080001122 <w_sie>:
    80001122:	1141                	add	sp,sp,-16
    80001124:	e42a                	sd	a0,8(sp)
    80001126:	67a2                	ld	a5,8(sp)
    80001128:	10479073          	csrw	sie,a5
    8000112c:	0001                	nop
    8000112e:	0141                	add	sp,sp,16
    80001130:	8082                	ret

0000000080001132 <w_mie>:
    80001132:	1141                	add	sp,sp,-16
    80001134:	e42a                	sd	a0,8(sp)
    80001136:	67a2                	ld	a5,8(sp)
    80001138:	30479073          	csrw	mie,a5
    8000113c:	0001                	nop
    8000113e:	0141                	add	sp,sp,16
    80001140:	8082                	ret

0000000080001142 <w_satp>:
    80001142:	1141                	add	sp,sp,-16
    80001144:	e42a                	sd	a0,8(sp)
    80001146:	67a2                	ld	a5,8(sp)
    80001148:	18079073          	csrw	satp,a5
    8000114c:	0001                	nop
    8000114e:	0141                	add	sp,sp,16
    80001150:	8082                	ret

0000000080001152 <w_sepc>:
    80001152:	1141                	add	sp,sp,-16
    80001154:	e42a                	sd	a0,8(sp)
    80001156:	67a2                	ld	a5,8(sp)
    80001158:	14179073          	csrw	sepc,a5
    8000115c:	0001                	nop
    8000115e:	0141                	add	sp,sp,16
    80001160:	8082                	ret

0000000080001162 <w_mepc>:
    80001162:	1141                	add	sp,sp,-16
    80001164:	e42a                	sd	a0,8(sp)
    80001166:	67a2                	ld	a5,8(sp)
    80001168:	34179073          	csrw	mepc,a5
    8000116c:	0001                	nop
    8000116e:	0141                	add	sp,sp,16
    80001170:	8082                	ret

0000000080001172 <w_stval>:
    80001172:	1141                	add	sp,sp,-16
    80001174:	e42a                	sd	a0,8(sp)
    80001176:	67a2                	ld	a5,8(sp)
    80001178:	14379073          	csrw	stval,a5
    8000117c:	0001                	nop
    8000117e:	0141                	add	sp,sp,16
    80001180:	8082                	ret

0000000080001182 <w_mtval>:
    80001182:	1141                	add	sp,sp,-16
    80001184:	e42a                	sd	a0,8(sp)
    80001186:	67a2                	ld	a5,8(sp)
    80001188:	34379073          	csrw	mtval,a5
    8000118c:	0001                	nop
    8000118e:	0141                	add	sp,sp,16
    80001190:	8082                	ret

0000000080001192 <w_stvec>:
    80001192:	1141                	add	sp,sp,-16
    80001194:	e42a                	sd	a0,8(sp)
    80001196:	67a2                	ld	a5,8(sp)
    80001198:	10579073          	csrw	stvec,a5
    8000119c:	0001                	nop
    8000119e:	0141                	add	sp,sp,16
    800011a0:	8082                	ret

00000000800011a2 <w_mtvec>:
    800011a2:	1141                	add	sp,sp,-16
    800011a4:	e42a                	sd	a0,8(sp)
    800011a6:	67a2                	ld	a5,8(sp)
    800011a8:	30579073          	csrw	mtvec,a5
    800011ac:	0001                	nop
    800011ae:	0141                	add	sp,sp,16
    800011b0:	8082                	ret

00000000800011b2 <w_scause>:
    800011b2:	1141                	add	sp,sp,-16
    800011b4:	e42a                	sd	a0,8(sp)
    800011b6:	67a2                	ld	a5,8(sp)
    800011b8:	14279073          	csrw	scause,a5
    800011bc:	0001                	nop
    800011be:	0141                	add	sp,sp,16
    800011c0:	8082                	ret

00000000800011c2 <w_mcause>:
    800011c2:	1141                	add	sp,sp,-16
    800011c4:	e42a                	sd	a0,8(sp)
    800011c6:	67a2                	ld	a5,8(sp)
    800011c8:	34279073          	csrw	mcause,a5
    800011cc:	0001                	nop
    800011ce:	0141                	add	sp,sp,16
    800011d0:	8082                	ret

00000000800011d2 <w_sstatus>:
    800011d2:	1141                	add	sp,sp,-16
    800011d4:	e42a                	sd	a0,8(sp)
    800011d6:	67a2                	ld	a5,8(sp)
    800011d8:	10079073          	csrw	sstatus,a5
    800011dc:	0001                	nop
    800011de:	0141                	add	sp,sp,16
    800011e0:	8082                	ret

00000000800011e2 <w_mstatus>:
    800011e2:	1141                	add	sp,sp,-16
    800011e4:	e42a                	sd	a0,8(sp)
    800011e6:	67a2                	ld	a5,8(sp)
    800011e8:	30079073          	csrw	mstatus,a5
    800011ec:	0001                	nop
    800011ee:	0141                	add	sp,sp,16
    800011f0:	8082                	ret

00000000800011f2 <w_mideleg>:
    800011f2:	1141                	add	sp,sp,-16
    800011f4:	e42a                	sd	a0,8(sp)
    800011f6:	67a2                	ld	a5,8(sp)
    800011f8:	30379073          	csrw	mideleg,a5
    800011fc:	0001                	nop
    800011fe:	0141                	add	sp,sp,16
    80001200:	8082                	ret

0000000080001202 <w_medeleg>:
    80001202:	1141                	add	sp,sp,-16
    80001204:	e42a                	sd	a0,8(sp)
    80001206:	67a2                	ld	a5,8(sp)
    80001208:	30279073          	csrw	medeleg,a5
    8000120c:	0001                	nop
    8000120e:	0141                	add	sp,sp,16
    80001210:	8082                	ret

0000000080001212 <w_sscratch>:
    80001212:	1141                	add	sp,sp,-16
    80001214:	e42a                	sd	a0,8(sp)
    80001216:	67a2                	ld	a5,8(sp)
    80001218:	14079073          	csrw	sscratch,a5
    8000121c:	0001                	nop
    8000121e:	0141                	add	sp,sp,16
    80001220:	8082                	ret

0000000080001222 <w_mscratch>:
    80001222:	1141                	add	sp,sp,-16
    80001224:	e42a                	sd	a0,8(sp)
    80001226:	67a2                	ld	a5,8(sp)
    80001228:	34079073          	csrw	mscratch,a5
    8000122c:	0001                	nop
    8000122e:	0141                	add	sp,sp,16
    80001230:	8082                	ret

0000000080001232 <w_pmpaddr0>:
    80001232:	1141                	add	sp,sp,-16
    80001234:	e42a                	sd	a0,8(sp)
    80001236:	67a2                	ld	a5,8(sp)
    80001238:	3b079073          	csrw	pmpaddr0,a5
    8000123c:	0001                	nop
    8000123e:	0141                	add	sp,sp,16
    80001240:	8082                	ret

0000000080001242 <w_pmpcfg0>:
    80001242:	1141                	add	sp,sp,-16
    80001244:	e42a                	sd	a0,8(sp)
    80001246:	67a2                	ld	a5,8(sp)
    80001248:	3a079073          	csrw	pmpcfg0,a5
    8000124c:	0001                	nop
    8000124e:	0141                	add	sp,sp,16
    80001250:	8082                	ret
	...

0000000080001260 <trap_entry>:
    80001260:	7111                	add	sp,sp,-256
    80001262:	e006                	sd	ra,0(sp)
    80001264:	f016                	sd	t0,32(sp)
    80001266:	f41a                	sd	t1,40(sp)
    80001268:	f81e                	sd	t2,48(sp)
    8000126a:	fc22                	sd	s0,56(sp)
    8000126c:	e0a6                	sd	s1,64(sp)
    8000126e:	e4aa                	sd	a0,72(sp)
    80001270:	e8ae                	sd	a1,80(sp)
    80001272:	ecb2                	sd	a2,88(sp)
    80001274:	f0b6                	sd	a3,96(sp)
    80001276:	f4ba                	sd	a4,104(sp)
    80001278:	f8be                	sd	a5,112(sp)
    8000127a:	fcc2                	sd	a6,120(sp)
    8000127c:	e146                	sd	a7,128(sp)
    8000127e:	e54a                	sd	s2,136(sp)
    80001280:	e94e                	sd	s3,144(sp)
    80001282:	ed52                	sd	s4,152(sp)
    80001284:	f156                	sd	s5,160(sp)
    80001286:	f55a                	sd	s6,168(sp)
    80001288:	f95e                	sd	s7,176(sp)
    8000128a:	fd62                	sd	s8,184(sp)
    8000128c:	e1e6                	sd	s9,192(sp)
    8000128e:	e5ea                	sd	s10,200(sp)
    80001290:	e9ee                	sd	s11,208(sp)
    80001292:	edf2                	sd	t3,216(sp)
    80001294:	f1f6                	sd	t4,224(sp)
    80001296:	f5fa                	sd	t5,232(sp)
    80001298:	f9fe                	sd	t6,240(sp)
    8000129a:	341022f3          	csrr	t0,mepc
    8000129e:	fd96                	sd	t0,248(sp)
    800012a0:	34202573          	csrr	a0,mcause
    800012a4:	343025f3          	csrr	a1,mtval
    800012a8:	00010633          	add	a2,sp,zero
    800012ac:	db9fe0ef          	jal	80000064 <trap_handler>
    800012b0:	72ee                	ld	t0,248(sp)
    800012b2:	34129073          	csrw	mepc,t0
    800012b6:	6082                	ld	ra,0(sp)
    800012b8:	7282                	ld	t0,32(sp)
    800012ba:	7322                	ld	t1,40(sp)
    800012bc:	73c2                	ld	t2,48(sp)
    800012be:	7462                	ld	s0,56(sp)
    800012c0:	6486                	ld	s1,64(sp)
    800012c2:	6526                	ld	a0,72(sp)
    800012c4:	65c6                	ld	a1,80(sp)
    800012c6:	6666                	ld	a2,88(sp)
    800012c8:	7686                	ld	a3,96(sp)
    800012ca:	7726                	ld	a4,104(sp)
    800012cc:	77c6                	ld	a5,112(sp)
    800012ce:	7866                	ld	a6,120(sp)
    800012d0:	688a                	ld	a7,128(sp)
    800012d2:	692a                	ld	s2,136(sp)
    800012d4:	69ca                	ld	s3,144(sp)
    800012d6:	6a6a                	ld	s4,152(sp)
    800012d8:	7a8a                	ld	s5,160(sp)
    800012da:	7b2a                	ld	s6,168(sp)
    800012dc:	7bca                	ld	s7,176(sp)
    800012de:	7c6a                	ld	s8,184(sp)
    800012e0:	6c8e                	ld	s9,192(sp)
    800012e2:	6d2e                	ld	s10,200(sp)
    800012e4:	6dce                	ld	s11,208(sp)
    800012e6:	6e6e                	ld	t3,216(sp)
    800012e8:	7e8e                	ld	t4,224(sp)
    800012ea:	7f2e                	ld	t5,232(sp)
    800012ec:	7fce                	ld	t6,240(sp)
    800012ee:	6111                	add	sp,sp,256
    800012f0:	30200073          	mret
	...

00000000800012fe <CPU_IntDis>:
    800012fe:	42a1                	li	t0,8
    80001300:	3002b073          	csrc	mstatus,t0
    80001304:	8082                	ret

0000000080001306 <CPU_IntEn>:
    80001306:	42a1                	li	t0,8
    80001308:	3002a073          	csrs	mstatus,t0
    8000130c:	8082                	ret

000000008000130e <CPU_SR_Save>:
    8000130e:	30002573          	csrr	a0,mstatus
    80001312:	42a1                	li	t0,8
    80001314:	3002b073          	csrc	mstatus,t0
    80001318:	8082                	ret

000000008000131a <CPU_SR_Restore>:
    8000131a:	30051073          	csrw	mstatus,a0
    8000131e:	8082                	ret

0000000080001320 <CPU_Init>:
    80001320:	0001                	nop
    80001322:	8082                	ret

0000000080001324 <CPU_SW_Exception>:
    80001324:	0001                	nop
    80001326:	bffd                	j	80001324 <CPU_SW_Exception>

0000000080001328 <CPU_CntLeadZeros>:
    80001328:	7179                	add	sp,sp,-48
    8000132a:	f406                	sd	ra,40(sp)
    8000132c:	e42a                	sd	a0,8(sp)
    8000132e:	6522                	ld	a0,8(sp)
    80001330:	152000ef          	jal	80001482 <CPU_CntLeadZeros64>
    80001334:	ec2a                	sd	a0,24(sp)
    80001336:	67e2                	ld	a5,24(sp)
    80001338:	853e                	mv	a0,a5
    8000133a:	70a2                	ld	ra,40(sp)
    8000133c:	6145                	add	sp,sp,48
    8000133e:	8082                	ret

0000000080001340 <CPU_CntLeadZeros08>:
    80001340:	1101                	add	sp,sp,-32
    80001342:	87aa                	mv	a5,a0
    80001344:	00f107a3          	sb	a5,15(sp)
    80001348:	00f14783          	lbu	a5,15(sp)
    8000134c:	ec3e                	sd	a5,24(sp)
    8000134e:	0000a717          	auipc	a4,0xa
    80001352:	f7270713          	add	a4,a4,-142 # 8000b2c0 <CPU_CntLeadZerosTbl>
    80001356:	67e2                	ld	a5,24(sp)
    80001358:	97ba                	add	a5,a5,a4
    8000135a:	0007c783          	lbu	a5,0(a5)
    8000135e:	e83e                	sd	a5,16(sp)
    80001360:	67c2                	ld	a5,16(sp)
    80001362:	853e                	mv	a0,a5
    80001364:	6105                	add	sp,sp,32
    80001366:	8082                	ret

0000000080001368 <CPU_CntLeadZeros16>:
    80001368:	1101                	add	sp,sp,-32
    8000136a:	87aa                	mv	a5,a0
    8000136c:	00f11723          	sh	a5,14(sp)
    80001370:	00e15783          	lhu	a5,14(sp)
    80001374:	0007871b          	sext.w	a4,a5
    80001378:	0ff00793          	li	a5,255
    8000137c:	02e7f563          	bgeu	a5,a4,800013a6 <CPU_CntLeadZeros16+0x3e>
    80001380:	00e15783          	lhu	a5,14(sp)
    80001384:	0087d79b          	srlw	a5,a5,0x8
    80001388:	00f11723          	sh	a5,14(sp)
    8000138c:	00e15783          	lhu	a5,14(sp)
    80001390:	e83e                	sd	a5,16(sp)
    80001392:	0000a717          	auipc	a4,0xa
    80001396:	f2e70713          	add	a4,a4,-210 # 8000b2c0 <CPU_CntLeadZerosTbl>
    8000139a:	67c2                	ld	a5,16(sp)
    8000139c:	97ba                	add	a5,a5,a4
    8000139e:	0007c783          	lbu	a5,0(a5)
    800013a2:	ec3e                	sd	a5,24(sp)
    800013a4:	a831                	j	800013c0 <CPU_CntLeadZeros16+0x58>
    800013a6:	00e15783          	lhu	a5,14(sp)
    800013aa:	e83e                	sd	a5,16(sp)
    800013ac:	0000a717          	auipc	a4,0xa
    800013b0:	f1470713          	add	a4,a4,-236 # 8000b2c0 <CPU_CntLeadZerosTbl>
    800013b4:	67c2                	ld	a5,16(sp)
    800013b6:	97ba                	add	a5,a5,a4
    800013b8:	0007c783          	lbu	a5,0(a5)
    800013bc:	07a1                	add	a5,a5,8
    800013be:	ec3e                	sd	a5,24(sp)
    800013c0:	67e2                	ld	a5,24(sp)
    800013c2:	853e                	mv	a0,a5
    800013c4:	6105                	add	sp,sp,32
    800013c6:	8082                	ret

00000000800013c8 <CPU_CntLeadZeros32>:
    800013c8:	1101                	add	sp,sp,-32
    800013ca:	87aa                	mv	a5,a0
    800013cc:	c63e                	sw	a5,12(sp)
    800013ce:	47b2                	lw	a5,12(sp)
    800013d0:	0007871b          	sext.w	a4,a5
    800013d4:	67c1                	lui	a5,0x10
    800013d6:	04f76c63          	bltu	a4,a5,8000142e <CPU_CntLeadZeros32+0x66>
    800013da:	47b2                	lw	a5,12(sp)
    800013dc:	0007871b          	sext.w	a4,a5
    800013e0:	010007b7          	lui	a5,0x1000
    800013e4:	02f76363          	bltu	a4,a5,8000140a <CPU_CntLeadZeros32+0x42>
    800013e8:	47b2                	lw	a5,12(sp)
    800013ea:	0187d79b          	srlw	a5,a5,0x18
    800013ee:	c63e                	sw	a5,12(sp)
    800013f0:	00c16783          	lwu	a5,12(sp)
    800013f4:	e83e                	sd	a5,16(sp)
    800013f6:	0000a717          	auipc	a4,0xa
    800013fa:	eca70713          	add	a4,a4,-310 # 8000b2c0 <CPU_CntLeadZerosTbl>
    800013fe:	67c2                	ld	a5,16(sp)
    80001400:	97ba                	add	a5,a5,a4
    80001402:	0007c783          	lbu	a5,0(a5) # 1000000 <CPU_MSTATUS_MIE+0xfffff8>
    80001406:	ec3e                	sd	a5,24(sp)
    80001408:	a88d                	j	8000147a <CPU_CntLeadZeros32+0xb2>
    8000140a:	47b2                	lw	a5,12(sp)
    8000140c:	0107d79b          	srlw	a5,a5,0x10
    80001410:	c63e                	sw	a5,12(sp)
    80001412:	00c16783          	lwu	a5,12(sp)
    80001416:	e83e                	sd	a5,16(sp)
    80001418:	0000a717          	auipc	a4,0xa
    8000141c:	ea870713          	add	a4,a4,-344 # 8000b2c0 <CPU_CntLeadZerosTbl>
    80001420:	67c2                	ld	a5,16(sp)
    80001422:	97ba                	add	a5,a5,a4
    80001424:	0007c783          	lbu	a5,0(a5)
    80001428:	07a1                	add	a5,a5,8
    8000142a:	ec3e                	sd	a5,24(sp)
    8000142c:	a0b9                	j	8000147a <CPU_CntLeadZeros32+0xb2>
    8000142e:	47b2                	lw	a5,12(sp)
    80001430:	0007871b          	sext.w	a4,a5
    80001434:	0ff00793          	li	a5,255
    80001438:	02e7f463          	bgeu	a5,a4,80001460 <CPU_CntLeadZeros32+0x98>
    8000143c:	47b2                	lw	a5,12(sp)
    8000143e:	0087d79b          	srlw	a5,a5,0x8
    80001442:	c63e                	sw	a5,12(sp)
    80001444:	00c16783          	lwu	a5,12(sp)
    80001448:	e83e                	sd	a5,16(sp)
    8000144a:	0000a717          	auipc	a4,0xa
    8000144e:	e7670713          	add	a4,a4,-394 # 8000b2c0 <CPU_CntLeadZerosTbl>
    80001452:	67c2                	ld	a5,16(sp)
    80001454:	97ba                	add	a5,a5,a4
    80001456:	0007c783          	lbu	a5,0(a5)
    8000145a:	07c1                	add	a5,a5,16
    8000145c:	ec3e                	sd	a5,24(sp)
    8000145e:	a831                	j	8000147a <CPU_CntLeadZeros32+0xb2>
    80001460:	00c16783          	lwu	a5,12(sp)
    80001464:	e83e                	sd	a5,16(sp)
    80001466:	0000a717          	auipc	a4,0xa
    8000146a:	e5a70713          	add	a4,a4,-422 # 8000b2c0 <CPU_CntLeadZerosTbl>
    8000146e:	67c2                	ld	a5,16(sp)
    80001470:	97ba                	add	a5,a5,a4
    80001472:	0007c783          	lbu	a5,0(a5)
    80001476:	07e1                	add	a5,a5,24
    80001478:	ec3e                	sd	a5,24(sp)
    8000147a:	67e2                	ld	a5,24(sp)
    8000147c:	853e                	mv	a0,a5
    8000147e:	6105                	add	sp,sp,32
    80001480:	8082                	ret

0000000080001482 <CPU_CntLeadZeros64>:
    80001482:	1101                	add	sp,sp,-32
    80001484:	e42a                	sd	a0,8(sp)
    80001486:	6722                	ld	a4,8(sp)
    80001488:	57fd                	li	a5,-1
    8000148a:	9381                	srl	a5,a5,0x20
    8000148c:	0ae7f063          	bgeu	a5,a4,8000152c <CPU_CntLeadZeros64+0xaa>
    80001490:	6722                	ld	a4,8(sp)
    80001492:	57fd                	li	a5,-1
    80001494:	83c1                	srl	a5,a5,0x10
    80001496:	04e7f663          	bgeu	a5,a4,800014e2 <CPU_CntLeadZeros64+0x60>
    8000149a:	6722                	ld	a4,8(sp)
    8000149c:	57fd                	li	a5,-1
    8000149e:	83a1                	srl	a5,a5,0x8
    800014a0:	02e7f163          	bgeu	a5,a4,800014c2 <CPU_CntLeadZeros64+0x40>
    800014a4:	67a2                	ld	a5,8(sp)
    800014a6:	93e1                	srl	a5,a5,0x38
    800014a8:	e43e                	sd	a5,8(sp)
    800014aa:	67a2                	ld	a5,8(sp)
    800014ac:	e83e                	sd	a5,16(sp)
    800014ae:	0000a717          	auipc	a4,0xa
    800014b2:	e1270713          	add	a4,a4,-494 # 8000b2c0 <CPU_CntLeadZerosTbl>
    800014b6:	67c2                	ld	a5,16(sp)
    800014b8:	97ba                	add	a5,a5,a4
    800014ba:	0007c783          	lbu	a5,0(a5)
    800014be:	ec3e                	sd	a5,24(sp)
    800014c0:	a221                	j	800015c8 <CPU_CntLeadZeros64+0x146>
    800014c2:	67a2                	ld	a5,8(sp)
    800014c4:	93c1                	srl	a5,a5,0x30
    800014c6:	e43e                	sd	a5,8(sp)
    800014c8:	67a2                	ld	a5,8(sp)
    800014ca:	e83e                	sd	a5,16(sp)
    800014cc:	0000a717          	auipc	a4,0xa
    800014d0:	df470713          	add	a4,a4,-524 # 8000b2c0 <CPU_CntLeadZerosTbl>
    800014d4:	67c2                	ld	a5,16(sp)
    800014d6:	97ba                	add	a5,a5,a4
    800014d8:	0007c783          	lbu	a5,0(a5)
    800014dc:	07a1                	add	a5,a5,8
    800014de:	ec3e                	sd	a5,24(sp)
    800014e0:	a0e5                	j	800015c8 <CPU_CntLeadZeros64+0x146>
    800014e2:	6722                	ld	a4,8(sp)
    800014e4:	57fd                	li	a5,-1
    800014e6:	83e1                	srl	a5,a5,0x18
    800014e8:	02e7f263          	bgeu	a5,a4,8000150c <CPU_CntLeadZeros64+0x8a>
    800014ec:	67a2                	ld	a5,8(sp)
    800014ee:	93a1                	srl	a5,a5,0x28
    800014f0:	e43e                	sd	a5,8(sp)
    800014f2:	67a2                	ld	a5,8(sp)
    800014f4:	e83e                	sd	a5,16(sp)
    800014f6:	0000a717          	auipc	a4,0xa
    800014fa:	dca70713          	add	a4,a4,-566 # 8000b2c0 <CPU_CntLeadZerosTbl>
    800014fe:	67c2                	ld	a5,16(sp)
    80001500:	97ba                	add	a5,a5,a4
    80001502:	0007c783          	lbu	a5,0(a5)
    80001506:	07c1                	add	a5,a5,16
    80001508:	ec3e                	sd	a5,24(sp)
    8000150a:	a87d                	j	800015c8 <CPU_CntLeadZeros64+0x146>
    8000150c:	67a2                	ld	a5,8(sp)
    8000150e:	9381                	srl	a5,a5,0x20
    80001510:	e43e                	sd	a5,8(sp)
    80001512:	67a2                	ld	a5,8(sp)
    80001514:	e83e                	sd	a5,16(sp)
    80001516:	0000a717          	auipc	a4,0xa
    8000151a:	daa70713          	add	a4,a4,-598 # 8000b2c0 <CPU_CntLeadZerosTbl>
    8000151e:	67c2                	ld	a5,16(sp)
    80001520:	97ba                	add	a5,a5,a4
    80001522:	0007c783          	lbu	a5,0(a5)
    80001526:	07e1                	add	a5,a5,24
    80001528:	ec3e                	sd	a5,24(sp)
    8000152a:	a879                	j	800015c8 <CPU_CntLeadZeros64+0x146>
    8000152c:	6722                	ld	a4,8(sp)
    8000152e:	67c1                	lui	a5,0x10
    80001530:	04f76963          	bltu	a4,a5,80001582 <CPU_CntLeadZeros64+0x100>
    80001534:	6722                	ld	a4,8(sp)
    80001536:	010007b7          	lui	a5,0x1000
    8000153a:	02f76363          	bltu	a4,a5,80001560 <CPU_CntLeadZeros64+0xde>
    8000153e:	67a2                	ld	a5,8(sp)
    80001540:	83e1                	srl	a5,a5,0x18
    80001542:	e43e                	sd	a5,8(sp)
    80001544:	67a2                	ld	a5,8(sp)
    80001546:	e83e                	sd	a5,16(sp)
    80001548:	0000a717          	auipc	a4,0xa
    8000154c:	d7870713          	add	a4,a4,-648 # 8000b2c0 <CPU_CntLeadZerosTbl>
    80001550:	67c2                	ld	a5,16(sp)
    80001552:	97ba                	add	a5,a5,a4
    80001554:	0007c783          	lbu	a5,0(a5) # 1000000 <CPU_MSTATUS_MIE+0xfffff8>
    80001558:	02078793          	add	a5,a5,32
    8000155c:	ec3e                	sd	a5,24(sp)
    8000155e:	a0ad                	j	800015c8 <CPU_CntLeadZeros64+0x146>
    80001560:	67a2                	ld	a5,8(sp)
    80001562:	83c1                	srl	a5,a5,0x10
    80001564:	e43e                	sd	a5,8(sp)
    80001566:	67a2                	ld	a5,8(sp)
    80001568:	e83e                	sd	a5,16(sp)
    8000156a:	0000a717          	auipc	a4,0xa
    8000156e:	d5670713          	add	a4,a4,-682 # 8000b2c0 <CPU_CntLeadZerosTbl>
    80001572:	67c2                	ld	a5,16(sp)
    80001574:	97ba                	add	a5,a5,a4
    80001576:	0007c783          	lbu	a5,0(a5)
    8000157a:	02878793          	add	a5,a5,40
    8000157e:	ec3e                	sd	a5,24(sp)
    80001580:	a0a1                	j	800015c8 <CPU_CntLeadZeros64+0x146>
    80001582:	6722                	ld	a4,8(sp)
    80001584:	0ff00793          	li	a5,255
    80001588:	02e7f363          	bgeu	a5,a4,800015ae <CPU_CntLeadZeros64+0x12c>
    8000158c:	67a2                	ld	a5,8(sp)
    8000158e:	83a1                	srl	a5,a5,0x8
    80001590:	e43e                	sd	a5,8(sp)
    80001592:	67a2                	ld	a5,8(sp)
    80001594:	e83e                	sd	a5,16(sp)
    80001596:	0000a717          	auipc	a4,0xa
    8000159a:	d2a70713          	add	a4,a4,-726 # 8000b2c0 <CPU_CntLeadZerosTbl>
    8000159e:	67c2                	ld	a5,16(sp)
    800015a0:	97ba                	add	a5,a5,a4
    800015a2:	0007c783          	lbu	a5,0(a5)
    800015a6:	03078793          	add	a5,a5,48
    800015aa:	ec3e                	sd	a5,24(sp)
    800015ac:	a831                	j	800015c8 <CPU_CntLeadZeros64+0x146>
    800015ae:	67a2                	ld	a5,8(sp)
    800015b0:	e83e                	sd	a5,16(sp)
    800015b2:	0000a717          	auipc	a4,0xa
    800015b6:	d0e70713          	add	a4,a4,-754 # 8000b2c0 <CPU_CntLeadZerosTbl>
    800015ba:	67c2                	ld	a5,16(sp)
    800015bc:	97ba                	add	a5,a5,a4
    800015be:	0007c783          	lbu	a5,0(a5)
    800015c2:	03878793          	add	a5,a5,56
    800015c6:	ec3e                	sd	a5,24(sp)
    800015c8:	67e2                	ld	a5,24(sp)
    800015ca:	853e                	mv	a0,a5
    800015cc:	6105                	add	sp,sp,32
    800015ce:	8082                	ret

00000000800015d0 <CPU_CntTrailZeros>:
    800015d0:	7139                	add	sp,sp,-64
    800015d2:	fc06                	sd	ra,56(sp)
    800015d4:	e42a                	sd	a0,8(sp)
    800015d6:	67a2                	ld	a5,8(sp)
    800015d8:	e781                	bnez	a5,800015e0 <CPU_CntTrailZeros+0x10>
    800015da:	04000793          	li	a5,64
    800015de:	a015                	j	80001602 <CPU_CntTrailZeros+0x32>
    800015e0:	67a2                	ld	a5,8(sp)
    800015e2:	40f007b3          	neg	a5,a5
    800015e6:	6722                	ld	a4,8(sp)
    800015e8:	8ff9                	and	a5,a5,a4
    800015ea:	f43e                	sd	a5,40(sp)
    800015ec:	7522                	ld	a0,40(sp)
    800015ee:	d3bff0ef          	jal	80001328 <CPU_CntLeadZeros>
    800015f2:	f02a                	sd	a0,32(sp)
    800015f4:	03f00713          	li	a4,63
    800015f8:	7782                	ld	a5,32(sp)
    800015fa:	40f707b3          	sub	a5,a4,a5
    800015fe:	ec3e                	sd	a5,24(sp)
    80001600:	67e2                	ld	a5,24(sp)
    80001602:	853e                	mv	a0,a5
    80001604:	70e2                	ld	ra,56(sp)
    80001606:	6121                	add	sp,sp,64
    80001608:	8082                	ret

000000008000160a <CPU_CntTrailZeros08>:
    8000160a:	7139                	add	sp,sp,-64
    8000160c:	fc06                	sd	ra,56(sp)
    8000160e:	87aa                	mv	a5,a0
    80001610:	00f107a3          	sb	a5,15(sp)
    80001614:	00f14783          	lbu	a5,15(sp)
    80001618:	0ff7f793          	zext.b	a5,a5
    8000161c:	e399                	bnez	a5,80001622 <CPU_CntTrailZeros08+0x18>
    8000161e:	47a1                	li	a5,8
    80001620:	a805                	j	80001650 <CPU_CntTrailZeros08+0x46>
    80001622:	00f14783          	lbu	a5,15(sp)
    80001626:	40f007bb          	negw	a5,a5
    8000162a:	0ff7f793          	zext.b	a5,a5
    8000162e:	00f14703          	lbu	a4,15(sp)
    80001632:	8ff9                	and	a5,a5,a4
    80001634:	02f107a3          	sb	a5,47(sp)
    80001638:	02f14783          	lbu	a5,47(sp)
    8000163c:	853e                	mv	a0,a5
    8000163e:	d03ff0ef          	jal	80001340 <CPU_CntLeadZeros08>
    80001642:	f02a                	sd	a0,32(sp)
    80001644:	471d                	li	a4,7
    80001646:	7782                	ld	a5,32(sp)
    80001648:	40f707b3          	sub	a5,a4,a5
    8000164c:	ec3e                	sd	a5,24(sp)
    8000164e:	67e2                	ld	a5,24(sp)
    80001650:	853e                	mv	a0,a5
    80001652:	70e2                	ld	ra,56(sp)
    80001654:	6121                	add	sp,sp,64
    80001656:	8082                	ret

0000000080001658 <CPU_CntTrailZeros16>:
    80001658:	7139                	add	sp,sp,-64
    8000165a:	fc06                	sd	ra,56(sp)
    8000165c:	87aa                	mv	a5,a0
    8000165e:	00f11723          	sh	a5,14(sp)
    80001662:	00e15783          	lhu	a5,14(sp)
    80001666:	2781                	sext.w	a5,a5
    80001668:	e399                	bnez	a5,8000166e <CPU_CntTrailZeros16+0x16>
    8000166a:	47c1                	li	a5,16
    8000166c:	a805                	j	8000169c <CPU_CntTrailZeros16+0x44>
    8000166e:	00e15783          	lhu	a5,14(sp)
    80001672:	40f007bb          	negw	a5,a5
    80001676:	17c2                	sll	a5,a5,0x30
    80001678:	93c1                	srl	a5,a5,0x30
    8000167a:	00e15703          	lhu	a4,14(sp)
    8000167e:	8ff9                	and	a5,a5,a4
    80001680:	02f11723          	sh	a5,46(sp)
    80001684:	02e15783          	lhu	a5,46(sp)
    80001688:	853e                	mv	a0,a5
    8000168a:	cdfff0ef          	jal	80001368 <CPU_CntLeadZeros16>
    8000168e:	f02a                	sd	a0,32(sp)
    80001690:	473d                	li	a4,15
    80001692:	7782                	ld	a5,32(sp)
    80001694:	40f707b3          	sub	a5,a4,a5
    80001698:	ec3e                	sd	a5,24(sp)
    8000169a:	67e2                	ld	a5,24(sp)
    8000169c:	853e                	mv	a0,a5
    8000169e:	70e2                	ld	ra,56(sp)
    800016a0:	6121                	add	sp,sp,64
    800016a2:	8082                	ret

00000000800016a4 <CPU_CntTrailZeros32>:
    800016a4:	7139                	add	sp,sp,-64
    800016a6:	fc06                	sd	ra,56(sp)
    800016a8:	87aa                	mv	a5,a0
    800016aa:	c63e                	sw	a5,12(sp)
    800016ac:	47b2                	lw	a5,12(sp)
    800016ae:	2781                	sext.w	a5,a5
    800016b0:	e781                	bnez	a5,800016b8 <CPU_CntTrailZeros32+0x14>
    800016b2:	02000793          	li	a5,32
    800016b6:	a01d                	j	800016dc <CPU_CntTrailZeros32+0x38>
    800016b8:	47b2                	lw	a5,12(sp)
    800016ba:	40f007bb          	negw	a5,a5
    800016be:	2781                	sext.w	a5,a5
    800016c0:	4732                	lw	a4,12(sp)
    800016c2:	8ff9                	and	a5,a5,a4
    800016c4:	d63e                	sw	a5,44(sp)
    800016c6:	57b2                	lw	a5,44(sp)
    800016c8:	853e                	mv	a0,a5
    800016ca:	cffff0ef          	jal	800013c8 <CPU_CntLeadZeros32>
    800016ce:	f02a                	sd	a0,32(sp)
    800016d0:	477d                	li	a4,31
    800016d2:	7782                	ld	a5,32(sp)
    800016d4:	40f707b3          	sub	a5,a4,a5
    800016d8:	ec3e                	sd	a5,24(sp)
    800016da:	67e2                	ld	a5,24(sp)
    800016dc:	853e                	mv	a0,a5
    800016de:	70e2                	ld	ra,56(sp)
    800016e0:	6121                	add	sp,sp,64
    800016e2:	8082                	ret

00000000800016e4 <CPU_CntTrailZeros64>:
    800016e4:	7139                	add	sp,sp,-64
    800016e6:	fc06                	sd	ra,56(sp)
    800016e8:	e42a                	sd	a0,8(sp)
    800016ea:	67a2                	ld	a5,8(sp)
    800016ec:	e781                	bnez	a5,800016f4 <CPU_CntTrailZeros64+0x10>
    800016ee:	04000793          	li	a5,64
    800016f2:	a015                	j	80001716 <CPU_CntTrailZeros64+0x32>
    800016f4:	67a2                	ld	a5,8(sp)
    800016f6:	40f007b3          	neg	a5,a5
    800016fa:	6722                	ld	a4,8(sp)
    800016fc:	8ff9                	and	a5,a5,a4
    800016fe:	f43e                	sd	a5,40(sp)
    80001700:	7522                	ld	a0,40(sp)
    80001702:	d81ff0ef          	jal	80001482 <CPU_CntLeadZeros64>
    80001706:	f02a                	sd	a0,32(sp)
    80001708:	03f00713          	li	a4,63
    8000170c:	7782                	ld	a5,32(sp)
    8000170e:	40f707b3          	sub	a5,a4,a5
    80001712:	ec3e                	sd	a5,24(sp)
    80001714:	67e2                	ld	a5,24(sp)
    80001716:	853e                	mv	a0,a5
    80001718:	70e2                	ld	ra,56(sp)
    8000171a:	6121                	add	sp,sp,64
    8000171c:	8082                	ret

000000008000171e <CPU_PopCnt32>:
    8000171e:	1101                	add	sp,sp,-32
    80001720:	87aa                	mv	a5,a0
    80001722:	c63e                	sw	a5,12(sp)
    80001724:	47b2                	lw	a5,12(sp)
    80001726:	0017d79b          	srlw	a5,a5,0x1
    8000172a:	2781                	sext.w	a5,a5
    8000172c:	873e                	mv	a4,a5
    8000172e:	555557b7          	lui	a5,0x55555
    80001732:	55578793          	add	a5,a5,1365 # 55555555 <CPU_MSTATUS_MIE+0x5555554d>
    80001736:	8ff9                	and	a5,a5,a4
    80001738:	ce3e                	sw	a5,28(sp)
    8000173a:	47b2                	lw	a5,12(sp)
    8000173c:	873e                	mv	a4,a5
    8000173e:	47f2                	lw	a5,28(sp)
    80001740:	40f707bb          	subw	a5,a4,a5
    80001744:	cc3e                	sw	a5,24(sp)
    80001746:	47e2                	lw	a5,24(sp)
    80001748:	873e                	mv	a4,a5
    8000174a:	333337b7          	lui	a5,0x33333
    8000174e:	33378793          	add	a5,a5,819 # 33333333 <CPU_MSTATUS_MIE+0x3333332b>
    80001752:	8ff9                	and	a5,a5,a4
    80001754:	ca3e                	sw	a5,20(sp)
    80001756:	47e2                	lw	a5,24(sp)
    80001758:	0027d79b          	srlw	a5,a5,0x2
    8000175c:	2781                	sext.w	a5,a5
    8000175e:	873e                	mv	a4,a5
    80001760:	333337b7          	lui	a5,0x33333
    80001764:	33378793          	add	a5,a5,819 # 33333333 <CPU_MSTATUS_MIE+0x3333332b>
    80001768:	8ff9                	and	a5,a5,a4
    8000176a:	ce3e                	sw	a5,28(sp)
    8000176c:	47d2                	lw	a5,20(sp)
    8000176e:	873e                	mv	a4,a5
    80001770:	47f2                	lw	a5,28(sp)
    80001772:	9fb9                	addw	a5,a5,a4
    80001774:	cc3e                	sw	a5,24(sp)
    80001776:	47e2                	lw	a5,24(sp)
    80001778:	873e                	mv	a4,a5
    8000177a:	0f0f17b7          	lui	a5,0xf0f1
    8000177e:	f0f78793          	add	a5,a5,-241 # f0f0f0f <CPU_MSTATUS_MIE+0xf0f0f07>
    80001782:	8ff9                	and	a5,a5,a4
    80001784:	ca3e                	sw	a5,20(sp)
    80001786:	47e2                	lw	a5,24(sp)
    80001788:	0047d79b          	srlw	a5,a5,0x4
    8000178c:	2781                	sext.w	a5,a5
    8000178e:	873e                	mv	a4,a5
    80001790:	0f0f17b7          	lui	a5,0xf0f1
    80001794:	f0f78793          	add	a5,a5,-241 # f0f0f0f <CPU_MSTATUS_MIE+0xf0f0f07>
    80001798:	8ff9                	and	a5,a5,a4
    8000179a:	ce3e                	sw	a5,28(sp)
    8000179c:	47d2                	lw	a5,20(sp)
    8000179e:	873e                	mv	a4,a5
    800017a0:	47f2                	lw	a5,28(sp)
    800017a2:	9fb9                	addw	a5,a5,a4
    800017a4:	cc3e                	sw	a5,24(sp)
    800017a6:	47e2                	lw	a5,24(sp)
    800017a8:	873e                	mv	a4,a5
    800017aa:	87ba                	mv	a5,a4
    800017ac:	0087979b          	sllw	a5,a5,0x8
    800017b0:	9fb9                	addw	a5,a5,a4
    800017b2:	0107971b          	sllw	a4,a5,0x10
    800017b6:	9fb9                	addw	a5,a5,a4
    800017b8:	2781                	sext.w	a5,a5
    800017ba:	0187d79b          	srlw	a5,a5,0x18
    800017be:	cc3e                	sw	a5,24(sp)
    800017c0:	47e2                	lw	a5,24(sp)
    800017c2:	0ff7f793          	zext.b	a5,a5
    800017c6:	853e                	mv	a0,a5
    800017c8:	6105                	add	sp,sp,32
    800017ca:	8082                	ret

00000000800017cc <OSStartHighRdy>:
    800017cc:	42a1                	li	t0,8
    800017ce:	3002b073          	csrc	mstatus,t0
    800017d2:	43c000ef          	jal	80001c0e <OSTaskSwHook>
    800017d6:	4285                	li	t0,1
    800017d8:	0000a317          	auipc	t1,0xa
    800017dc:	13530313          	add	t1,t1,309 # 8000b90d <OSRunning>
    800017e0:	00530023          	sb	t0,0(t1)
    800017e4:	0000a297          	auipc	t0,0xa
    800017e8:	1ec28293          	add	t0,t0,492 # 8000b9d0 <OSTCBHighRdyPtr>
    800017ec:	0002b303          	ld	t1,0(t0)
    800017f0:	00033103          	ld	sp,0(t1)
    800017f4:	72ee                	ld	t0,248(sp)
    800017f6:	34129073          	csrw	mepc,t0
    800017fa:	6082                	ld	ra,0(sp)
    800017fc:	7282                	ld	t0,32(sp)
    800017fe:	7322                	ld	t1,40(sp)
    80001800:	73c2                	ld	t2,48(sp)
    80001802:	7462                	ld	s0,56(sp)
    80001804:	6486                	ld	s1,64(sp)
    80001806:	6526                	ld	a0,72(sp)
    80001808:	65c6                	ld	a1,80(sp)
    8000180a:	6666                	ld	a2,88(sp)
    8000180c:	7686                	ld	a3,96(sp)
    8000180e:	7726                	ld	a4,104(sp)
    80001810:	77c6                	ld	a5,112(sp)
    80001812:	7866                	ld	a6,120(sp)
    80001814:	688a                	ld	a7,128(sp)
    80001816:	692a                	ld	s2,136(sp)
    80001818:	69ca                	ld	s3,144(sp)
    8000181a:	6a6a                	ld	s4,152(sp)
    8000181c:	7a8a                	ld	s5,160(sp)
    8000181e:	7b2a                	ld	s6,168(sp)
    80001820:	7bca                	ld	s7,176(sp)
    80001822:	7c6a                	ld	s8,184(sp)
    80001824:	6c8e                	ld	s9,192(sp)
    80001826:	6d2e                	ld	s10,200(sp)
    80001828:	6dce                	ld	s11,208(sp)
    8000182a:	6e6e                	ld	t3,216(sp)
    8000182c:	7e8e                	ld	t4,224(sp)
    8000182e:	7f2e                	ld	t5,232(sp)
    80001830:	7fce                	ld	t6,240(sp)
    80001832:	6111                	add	sp,sp,256
    80001834:	34102ff3          	csrr	t6,mepc
    80001838:	42a1                	li	t0,8
    8000183a:	3002a073          	csrs	mstatus,t0
    8000183e:	000f8067          	jr	t6

0000000080001842 <OSCtxSw>:
    80001842:	42a1                	li	t0,8
    80001844:	3042a073          	csrs	mie,t0
    80001848:	4289                	li	t0,2
    8000184a:	34429073          	csrw	mip,t0
    8000184e:	8082                	ret

0000000080001850 <Software_IRQHandler>:
    80001850:	42a1                	li	t0,8
    80001852:	3002b073          	csrc	mstatus,t0
    80001856:	4289                	li	t0,2
    80001858:	3442b073          	csrc	mip,t0
    8000185c:	0000a297          	auipc	t0,0xa
    80001860:	16c28293          	add	t0,t0,364 # 8000b9c8 <OSTCBCurPtr>
    80001864:	0002b303          	ld	t1,0(t0)
    80001868:	00c33023          	sd	a2,0(t1)
    8000186c:	3a2000ef          	jal	80001c0e <OSTaskSwHook>
    80001870:	0000a297          	auipc	t0,0xa
    80001874:	0d328293          	add	t0,t0,211 # 8000b943 <OSPrioHighRdy>
    80001878:	00028303          	lb	t1,0(t0)
    8000187c:	0000a297          	auipc	t0,0xa
    80001880:	0c628293          	add	t0,t0,198 # 8000b942 <OSPrioCur>
    80001884:	00628023          	sb	t1,0(t0)
    80001888:	0000a297          	auipc	t0,0xa
    8000188c:	14828293          	add	t0,t0,328 # 8000b9d0 <OSTCBHighRdyPtr>
    80001890:	0002b303          	ld	t1,0(t0)
    80001894:	0000a297          	auipc	t0,0xa
    80001898:	13428293          	add	t0,t0,308 # 8000b9c8 <OSTCBCurPtr>
    8000189c:	0062b023          	sd	t1,0(t0)
    800018a0:	00033103          	ld	sp,0(t1)
    800018a4:	72ee                	ld	t0,248(sp)
    800018a6:	34129073          	csrw	mepc,t0
    800018aa:	6082                	ld	ra,0(sp)
    800018ac:	7282                	ld	t0,32(sp)
    800018ae:	7322                	ld	t1,40(sp)
    800018b0:	73c2                	ld	t2,48(sp)
    800018b2:	7462                	ld	s0,56(sp)
    800018b4:	6486                	ld	s1,64(sp)
    800018b6:	6526                	ld	a0,72(sp)
    800018b8:	65c6                	ld	a1,80(sp)
    800018ba:	6666                	ld	a2,88(sp)
    800018bc:	7686                	ld	a3,96(sp)
    800018be:	7726                	ld	a4,104(sp)
    800018c0:	77c6                	ld	a5,112(sp)
    800018c2:	7866                	ld	a6,120(sp)
    800018c4:	688a                	ld	a7,128(sp)
    800018c6:	692a                	ld	s2,136(sp)
    800018c8:	69ca                	ld	s3,144(sp)
    800018ca:	6a6a                	ld	s4,152(sp)
    800018cc:	7a8a                	ld	s5,160(sp)
    800018ce:	7b2a                	ld	s6,168(sp)
    800018d0:	7bca                	ld	s7,176(sp)
    800018d2:	7c6a                	ld	s8,184(sp)
    800018d4:	6c8e                	ld	s9,192(sp)
    800018d6:	6d2e                	ld	s10,200(sp)
    800018d8:	6dce                	ld	s11,208(sp)
    800018da:	6e6e                	ld	t3,216(sp)
    800018dc:	7e8e                	ld	t4,224(sp)
    800018de:	7f2e                	ld	t5,232(sp)
    800018e0:	7fce                	ld	t6,240(sp)
    800018e2:	6111                	add	sp,sp,256
    800018e4:	30200073          	mret

00000000800018e8 <OSIdleTaskHook>:
    800018e8:	1141                	add	sp,sp,-16
    800018ea:	e406                	sd	ra,8(sp)
    800018ec:	0000a797          	auipc	a5,0xa
    800018f0:	ffc78793          	add	a5,a5,-4 # 8000b8e8 <OS_AppIdleTaskHookPtr>
    800018f4:	639c                	ld	a5,0(a5)
    800018f6:	c799                	beqz	a5,80001904 <OSIdleTaskHook+0x1c>
    800018f8:	0000a797          	auipc	a5,0xa
    800018fc:	ff078793          	add	a5,a5,-16 # 8000b8e8 <OS_AppIdleTaskHookPtr>
    80001900:	639c                	ld	a5,0(a5)
    80001902:	9782                	jalr	a5
    80001904:	0001                	nop
    80001906:	60a2                	ld	ra,8(sp)
    80001908:	0141                	add	sp,sp,16
    8000190a:	8082                	ret

000000008000190c <OSInitHook>:
    8000190c:	0001                	nop
    8000190e:	8082                	ret

0000000080001910 <OSStatTaskHook>:
    80001910:	1141                	add	sp,sp,-16
    80001912:	e406                	sd	ra,8(sp)
    80001914:	0000a797          	auipc	a5,0xa
    80001918:	fdc78793          	add	a5,a5,-36 # 8000b8f0 <OS_AppStatTaskHookPtr>
    8000191c:	639c                	ld	a5,0(a5)
    8000191e:	c799                	beqz	a5,8000192c <OSStatTaskHook+0x1c>
    80001920:	0000a797          	auipc	a5,0xa
    80001924:	fd078793          	add	a5,a5,-48 # 8000b8f0 <OS_AppStatTaskHookPtr>
    80001928:	639c                	ld	a5,0(a5)
    8000192a:	9782                	jalr	a5
    8000192c:	0001                	nop
    8000192e:	60a2                	ld	ra,8(sp)
    80001930:	0141                	add	sp,sp,16
    80001932:	8082                	ret

0000000080001934 <OSTaskCreateHook>:
    80001934:	1101                	add	sp,sp,-32
    80001936:	ec06                	sd	ra,24(sp)
    80001938:	e42a                	sd	a0,8(sp)
    8000193a:	0000a797          	auipc	a5,0xa
    8000193e:	f9678793          	add	a5,a5,-106 # 8000b8d0 <OS_AppTaskCreateHookPtr>
    80001942:	639c                	ld	a5,0(a5)
    80001944:	cb81                	beqz	a5,80001954 <OSTaskCreateHook+0x20>
    80001946:	0000a797          	auipc	a5,0xa
    8000194a:	f8a78793          	add	a5,a5,-118 # 8000b8d0 <OS_AppTaskCreateHookPtr>
    8000194e:	639c                	ld	a5,0(a5)
    80001950:	6522                	ld	a0,8(sp)
    80001952:	9782                	jalr	a5
    80001954:	0001                	nop
    80001956:	60e2                	ld	ra,24(sp)
    80001958:	6105                	add	sp,sp,32
    8000195a:	8082                	ret

000000008000195c <OSTaskDelHook>:
    8000195c:	1101                	add	sp,sp,-32
    8000195e:	ec06                	sd	ra,24(sp)
    80001960:	e42a                	sd	a0,8(sp)
    80001962:	0000a797          	auipc	a5,0xa
    80001966:	f7678793          	add	a5,a5,-138 # 8000b8d8 <OS_AppTaskDelHookPtr>
    8000196a:	639c                	ld	a5,0(a5)
    8000196c:	cb81                	beqz	a5,8000197c <OSTaskDelHook+0x20>
    8000196e:	0000a797          	auipc	a5,0xa
    80001972:	f6a78793          	add	a5,a5,-150 # 8000b8d8 <OS_AppTaskDelHookPtr>
    80001976:	639c                	ld	a5,0(a5)
    80001978:	6522                	ld	a0,8(sp)
    8000197a:	9782                	jalr	a5
    8000197c:	0001                	nop
    8000197e:	60e2                	ld	ra,24(sp)
    80001980:	6105                	add	sp,sp,32
    80001982:	8082                	ret

0000000080001984 <OSTaskReturnHook>:
    80001984:	1101                	add	sp,sp,-32
    80001986:	ec06                	sd	ra,24(sp)
    80001988:	e42a                	sd	a0,8(sp)
    8000198a:	0000a797          	auipc	a5,0xa
    8000198e:	f5678793          	add	a5,a5,-170 # 8000b8e0 <OS_AppTaskReturnHookPtr>
    80001992:	639c                	ld	a5,0(a5)
    80001994:	cb81                	beqz	a5,800019a4 <OSTaskReturnHook+0x20>
    80001996:	0000a797          	auipc	a5,0xa
    8000199a:	f4a78793          	add	a5,a5,-182 # 8000b8e0 <OS_AppTaskReturnHookPtr>
    8000199e:	639c                	ld	a5,0(a5)
    800019a0:	6522                	ld	a0,8(sp)
    800019a2:	9782                	jalr	a5
    800019a4:	0001                	nop
    800019a6:	60e2                	ld	ra,24(sp)
    800019a8:	6105                	add	sp,sp,32
    800019aa:	8082                	ret

00000000800019ac <OSTaskStkInit>:
    800019ac:	7139                	add	sp,sp,-64
    800019ae:	f42a                	sd	a0,40(sp)
    800019b0:	f02e                	sd	a1,32(sp)
    800019b2:	ec32                	sd	a2,24(sp)
    800019b4:	e836                	sd	a3,16(sp)
    800019b6:	e43a                	sd	a4,8(sp)
    800019b8:	00f11323          	sh	a5,6(sp)
    800019bc:	67a2                	ld	a5,8(sp)
    800019be:	078e                	sll	a5,a5,0x3
    800019c0:	6762                	ld	a4,24(sp)
    800019c2:	97ba                	add	a5,a5,a4
    800019c4:	fc3e                	sd	a5,56(sp)
    800019c6:	7762                	ld	a4,56(sp)
    800019c8:	4785                	li	a5,1
    800019ca:	1782                	sll	a5,a5,0x20
    800019cc:	17c1                	add	a5,a5,-16
    800019ce:	8ff9                	and	a5,a5,a4
    800019d0:	fc3e                	sd	a5,56(sp)
    800019d2:	77e2                	ld	a5,56(sp)
    800019d4:	17e1                	add	a5,a5,-8
    800019d6:	fc3e                	sd	a5,56(sp)
    800019d8:	7722                	ld	a4,40(sp)
    800019da:	77e2                	ld	a5,56(sp)
    800019dc:	e398                	sd	a4,0(a5)
    800019de:	77e2                	ld	a5,56(sp)
    800019e0:	17e1                	add	a5,a5,-8
    800019e2:	fc3e                	sd	a5,56(sp)
    800019e4:	77e2                	ld	a5,56(sp)
    800019e6:	31313737          	lui	a4,0x31313
    800019ea:	13170713          	add	a4,a4,305 # 31313131 <CPU_MSTATUS_MIE+0x31313129>
    800019ee:	e398                	sd	a4,0(a5)
    800019f0:	77e2                	ld	a5,56(sp)
    800019f2:	17e1                	add	a5,a5,-8
    800019f4:	fc3e                	sd	a5,56(sp)
    800019f6:	77e2                	ld	a5,56(sp)
    800019f8:	30303737          	lui	a4,0x30303
    800019fc:	03070713          	add	a4,a4,48 # 30303030 <CPU_MSTATUS_MIE+0x30303028>
    80001a00:	e398                	sd	a4,0(a5)
    80001a02:	77e2                	ld	a5,56(sp)
    80001a04:	17e1                	add	a5,a5,-8
    80001a06:	fc3e                	sd	a5,56(sp)
    80001a08:	77e2                	ld	a5,56(sp)
    80001a0a:	29293737          	lui	a4,0x29293
    80001a0e:	92970713          	add	a4,a4,-1751 # 29292929 <CPU_MSTATUS_MIE+0x29292921>
    80001a12:	e398                	sd	a4,0(a5)
    80001a14:	77e2                	ld	a5,56(sp)
    80001a16:	17e1                	add	a5,a5,-8
    80001a18:	fc3e                	sd	a5,56(sp)
    80001a1a:	77e2                	ld	a5,56(sp)
    80001a1c:	28283737          	lui	a4,0x28283
    80001a20:	82870713          	add	a4,a4,-2008 # 28282828 <CPU_MSTATUS_MIE+0x28282820>
    80001a24:	e398                	sd	a4,0(a5)
    80001a26:	77e2                	ld	a5,56(sp)
    80001a28:	17e1                	add	a5,a5,-8
    80001a2a:	fc3e                	sd	a5,56(sp)
    80001a2c:	77e2                	ld	a5,56(sp)
    80001a2e:	27272737          	lui	a4,0x27272
    80001a32:	72770713          	add	a4,a4,1831 # 27272727 <CPU_MSTATUS_MIE+0x2727271f>
    80001a36:	e398                	sd	a4,0(a5)
    80001a38:	77e2                	ld	a5,56(sp)
    80001a3a:	17e1                	add	a5,a5,-8
    80001a3c:	fc3e                	sd	a5,56(sp)
    80001a3e:	77e2                	ld	a5,56(sp)
    80001a40:	26262737          	lui	a4,0x26262
    80001a44:	62670713          	add	a4,a4,1574 # 26262626 <CPU_MSTATUS_MIE+0x2626261e>
    80001a48:	e398                	sd	a4,0(a5)
    80001a4a:	77e2                	ld	a5,56(sp)
    80001a4c:	17e1                	add	a5,a5,-8
    80001a4e:	fc3e                	sd	a5,56(sp)
    80001a50:	77e2                	ld	a5,56(sp)
    80001a52:	25252737          	lui	a4,0x25252
    80001a56:	52570713          	add	a4,a4,1317 # 25252525 <CPU_MSTATUS_MIE+0x2525251d>
    80001a5a:	e398                	sd	a4,0(a5)
    80001a5c:	77e2                	ld	a5,56(sp)
    80001a5e:	17e1                	add	a5,a5,-8
    80001a60:	fc3e                	sd	a5,56(sp)
    80001a62:	77e2                	ld	a5,56(sp)
    80001a64:	24242737          	lui	a4,0x24242
    80001a68:	42470713          	add	a4,a4,1060 # 24242424 <CPU_MSTATUS_MIE+0x2424241c>
    80001a6c:	e398                	sd	a4,0(a5)
    80001a6e:	77e2                	ld	a5,56(sp)
    80001a70:	17e1                	add	a5,a5,-8
    80001a72:	fc3e                	sd	a5,56(sp)
    80001a74:	77e2                	ld	a5,56(sp)
    80001a76:	23232737          	lui	a4,0x23232
    80001a7a:	32370713          	add	a4,a4,803 # 23232323 <CPU_MSTATUS_MIE+0x2323231b>
    80001a7e:	e398                	sd	a4,0(a5)
    80001a80:	77e2                	ld	a5,56(sp)
    80001a82:	17e1                	add	a5,a5,-8
    80001a84:	fc3e                	sd	a5,56(sp)
    80001a86:	77e2                	ld	a5,56(sp)
    80001a88:	22222737          	lui	a4,0x22222
    80001a8c:	22270713          	add	a4,a4,546 # 22222222 <CPU_MSTATUS_MIE+0x2222221a>
    80001a90:	e398                	sd	a4,0(a5)
    80001a92:	77e2                	ld	a5,56(sp)
    80001a94:	17e1                	add	a5,a5,-8
    80001a96:	fc3e                	sd	a5,56(sp)
    80001a98:	77e2                	ld	a5,56(sp)
    80001a9a:	21212737          	lui	a4,0x21212
    80001a9e:	12170713          	add	a4,a4,289 # 21212121 <CPU_MSTATUS_MIE+0x21212119>
    80001aa2:	e398                	sd	a4,0(a5)
    80001aa4:	77e2                	ld	a5,56(sp)
    80001aa6:	17e1                	add	a5,a5,-8
    80001aa8:	fc3e                	sd	a5,56(sp)
    80001aaa:	77e2                	ld	a5,56(sp)
    80001aac:	20202737          	lui	a4,0x20202
    80001ab0:	02070713          	add	a4,a4,32 # 20202020 <CPU_MSTATUS_MIE+0x20202018>
    80001ab4:	e398                	sd	a4,0(a5)
    80001ab6:	77e2                	ld	a5,56(sp)
    80001ab8:	17e1                	add	a5,a5,-8
    80001aba:	fc3e                	sd	a5,56(sp)
    80001abc:	77e2                	ld	a5,56(sp)
    80001abe:	19192737          	lui	a4,0x19192
    80001ac2:	91970713          	add	a4,a4,-1767 # 19191919 <CPU_MSTATUS_MIE+0x19191911>
    80001ac6:	e398                	sd	a4,0(a5)
    80001ac8:	77e2                	ld	a5,56(sp)
    80001aca:	17e1                	add	a5,a5,-8
    80001acc:	fc3e                	sd	a5,56(sp)
    80001ace:	77e2                	ld	a5,56(sp)
    80001ad0:	18182737          	lui	a4,0x18182
    80001ad4:	81870713          	add	a4,a4,-2024 # 18181818 <CPU_MSTATUS_MIE+0x18181810>
    80001ad8:	e398                	sd	a4,0(a5)
    80001ada:	77e2                	ld	a5,56(sp)
    80001adc:	17e1                	add	a5,a5,-8
    80001ade:	fc3e                	sd	a5,56(sp)
    80001ae0:	77e2                	ld	a5,56(sp)
    80001ae2:	17171737          	lui	a4,0x17171
    80001ae6:	71770713          	add	a4,a4,1815 # 17171717 <CPU_MSTATUS_MIE+0x1717170f>
    80001aea:	e398                	sd	a4,0(a5)
    80001aec:	77e2                	ld	a5,56(sp)
    80001aee:	17e1                	add	a5,a5,-8
    80001af0:	fc3e                	sd	a5,56(sp)
    80001af2:	77e2                	ld	a5,56(sp)
    80001af4:	16161737          	lui	a4,0x16161
    80001af8:	61670713          	add	a4,a4,1558 # 16161616 <CPU_MSTATUS_MIE+0x1616160e>
    80001afc:	e398                	sd	a4,0(a5)
    80001afe:	77e2                	ld	a5,56(sp)
    80001b00:	17e1                	add	a5,a5,-8
    80001b02:	fc3e                	sd	a5,56(sp)
    80001b04:	77e2                	ld	a5,56(sp)
    80001b06:	15151737          	lui	a4,0x15151
    80001b0a:	51570713          	add	a4,a4,1301 # 15151515 <CPU_MSTATUS_MIE+0x1515150d>
    80001b0e:	e398                	sd	a4,0(a5)
    80001b10:	77e2                	ld	a5,56(sp)
    80001b12:	17e1                	add	a5,a5,-8
    80001b14:	fc3e                	sd	a5,56(sp)
    80001b16:	77e2                	ld	a5,56(sp)
    80001b18:	14141737          	lui	a4,0x14141
    80001b1c:	41470713          	add	a4,a4,1044 # 14141414 <CPU_MSTATUS_MIE+0x1414140c>
    80001b20:	e398                	sd	a4,0(a5)
    80001b22:	77e2                	ld	a5,56(sp)
    80001b24:	17e1                	add	a5,a5,-8
    80001b26:	fc3e                	sd	a5,56(sp)
    80001b28:	77e2                	ld	a5,56(sp)
    80001b2a:	13131737          	lui	a4,0x13131
    80001b2e:	31370713          	add	a4,a4,787 # 13131313 <CPU_MSTATUS_MIE+0x1313130b>
    80001b32:	e398                	sd	a4,0(a5)
    80001b34:	77e2                	ld	a5,56(sp)
    80001b36:	17e1                	add	a5,a5,-8
    80001b38:	fc3e                	sd	a5,56(sp)
    80001b3a:	77e2                	ld	a5,56(sp)
    80001b3c:	12121737          	lui	a4,0x12121
    80001b40:	21270713          	add	a4,a4,530 # 12121212 <CPU_MSTATUS_MIE+0x1212120a>
    80001b44:	e398                	sd	a4,0(a5)
    80001b46:	77e2                	ld	a5,56(sp)
    80001b48:	17e1                	add	a5,a5,-8
    80001b4a:	fc3e                	sd	a5,56(sp)
    80001b4c:	77e2                	ld	a5,56(sp)
    80001b4e:	11111737          	lui	a4,0x11111
    80001b52:	11170713          	add	a4,a4,273 # 11111111 <CPU_MSTATUS_MIE+0x11111109>
    80001b56:	e398                	sd	a4,0(a5)
    80001b58:	77e2                	ld	a5,56(sp)
    80001b5a:	17e1                	add	a5,a5,-8
    80001b5c:	fc3e                	sd	a5,56(sp)
    80001b5e:	7702                	ld	a4,32(sp)
    80001b60:	77e2                	ld	a5,56(sp)
    80001b62:	e398                	sd	a4,0(a5)
    80001b64:	77e2                	ld	a5,56(sp)
    80001b66:	17e1                	add	a5,a5,-8
    80001b68:	fc3e                	sd	a5,56(sp)
    80001b6a:	77e2                	ld	a5,56(sp)
    80001b6c:	09091737          	lui	a4,0x9091
    80001b70:	90970713          	add	a4,a4,-1783 # 9090909 <CPU_MSTATUS_MIE+0x9090901>
    80001b74:	e398                	sd	a4,0(a5)
    80001b76:	77e2                	ld	a5,56(sp)
    80001b78:	17e1                	add	a5,a5,-8
    80001b7a:	fc3e                	sd	a5,56(sp)
    80001b7c:	77e2                	ld	a5,56(sp)
    80001b7e:	08081737          	lui	a4,0x8081
    80001b82:	80870713          	add	a4,a4,-2040 # 8080808 <CPU_MSTATUS_MIE+0x8080800>
    80001b86:	e398                	sd	a4,0(a5)
    80001b88:	77e2                	ld	a5,56(sp)
    80001b8a:	17e1                	add	a5,a5,-8
    80001b8c:	fc3e                	sd	a5,56(sp)
    80001b8e:	77e2                	ld	a5,56(sp)
    80001b90:	07070737          	lui	a4,0x7070
    80001b94:	70770713          	add	a4,a4,1799 # 7070707 <CPU_MSTATUS_MIE+0x70706ff>
    80001b98:	e398                	sd	a4,0(a5)
    80001b9a:	77e2                	ld	a5,56(sp)
    80001b9c:	17e1                	add	a5,a5,-8
    80001b9e:	fc3e                	sd	a5,56(sp)
    80001ba0:	77e2                	ld	a5,56(sp)
    80001ba2:	06060737          	lui	a4,0x6060
    80001ba6:	60670713          	add	a4,a4,1542 # 6060606 <CPU_MSTATUS_MIE+0x60605fe>
    80001baa:	e398                	sd	a4,0(a5)
    80001bac:	77e2                	ld	a5,56(sp)
    80001bae:	17e1                	add	a5,a5,-8
    80001bb0:	fc3e                	sd	a5,56(sp)
    80001bb2:	77e2                	ld	a5,56(sp)
    80001bb4:	05050737          	lui	a4,0x5050
    80001bb8:	50570713          	add	a4,a4,1285 # 5050505 <CPU_MSTATUS_MIE+0x50504fd>
    80001bbc:	e398                	sd	a4,0(a5)
    80001bbe:	77e2                	ld	a5,56(sp)
    80001bc0:	17e1                	add	a5,a5,-8
    80001bc2:	fc3e                	sd	a5,56(sp)
    80001bc4:	77e2                	ld	a5,56(sp)
    80001bc6:	04040737          	lui	a4,0x4040
    80001bca:	40470713          	add	a4,a4,1028 # 4040404 <CPU_MSTATUS_MIE+0x40403fc>
    80001bce:	e398                	sd	a4,0(a5)
    80001bd0:	77e2                	ld	a5,56(sp)
    80001bd2:	17e1                	add	a5,a5,-8
    80001bd4:	fc3e                	sd	a5,56(sp)
    80001bd6:	77e2                	ld	a5,56(sp)
    80001bd8:	03030737          	lui	a4,0x3030
    80001bdc:	30370713          	add	a4,a4,771 # 3030303 <CPU_MSTATUS_MIE+0x30302fb>
    80001be0:	e398                	sd	a4,0(a5)
    80001be2:	77e2                	ld	a5,56(sp)
    80001be4:	17e1                	add	a5,a5,-8
    80001be6:	fc3e                	sd	a5,56(sp)
    80001be8:	77e2                	ld	a5,56(sp)
    80001bea:	02020737          	lui	a4,0x2020
    80001bee:	20270713          	add	a4,a4,514 # 2020202 <CPU_MSTATUS_MIE+0x20201fa>
    80001bf2:	e398                	sd	a4,0(a5)
    80001bf4:	77e2                	ld	a5,56(sp)
    80001bf6:	17e1                	add	a5,a5,-8
    80001bf8:	fc3e                	sd	a5,56(sp)
    80001bfa:	00003717          	auipc	a4,0x3
    80001bfe:	02270713          	add	a4,a4,34 # 80004c1c <OS_TaskReturn>
    80001c02:	77e2                	ld	a5,56(sp)
    80001c04:	e398                	sd	a4,0(a5)
    80001c06:	77e2                	ld	a5,56(sp)
    80001c08:	853e                	mv	a0,a5
    80001c0a:	6121                	add	sp,sp,64
    80001c0c:	8082                	ret

0000000080001c0e <OSTaskSwHook>:
    80001c0e:	1101                	add	sp,sp,-32
    80001c10:	ec06                	sd	ra,24(sp)
    80001c12:	0000a797          	auipc	a5,0xa
    80001c16:	ce678793          	add	a5,a5,-794 # 8000b8f8 <OS_AppTaskSwHookPtr>
    80001c1a:	639c                	ld	a5,0(a5)
    80001c1c:	c799                	beqz	a5,80001c2a <OSTaskSwHook+0x1c>
    80001c1e:	0000a797          	auipc	a5,0xa
    80001c22:	cda78793          	add	a5,a5,-806 # 8000b8f8 <OS_AppTaskSwHookPtr>
    80001c26:	639c                	ld	a5,0(a5)
    80001c28:	9782                	jalr	a5
    80001c2a:	c602                	sw	zero,12(sp)
    80001c2c:	0000a797          	auipc	a5,0xa
    80001c30:	d9c78793          	add	a5,a5,-612 # 8000b9c8 <OSTCBCurPtr>
    80001c34:	6398                	ld	a4,0(a5)
    80001c36:	0000a797          	auipc	a5,0xa
    80001c3a:	d9a78793          	add	a5,a5,-614 # 8000b9d0 <OSTCBHighRdyPtr>
    80001c3e:	639c                	ld	a5,0(a5)
    80001c40:	04f70b63          	beq	a4,a5,80001c96 <OSTaskSwHook+0x88>
    80001c44:	0000a797          	auipc	a5,0xa
    80001c48:	d8478793          	add	a5,a5,-636 # 8000b9c8 <OSTCBCurPtr>
    80001c4c:	639c                	ld	a5,0(a5)
    80001c4e:	0f07a703          	lw	a4,240(a5)
    80001c52:	0000a797          	auipc	a5,0xa
    80001c56:	d7678793          	add	a5,a5,-650 # 8000b9c8 <OSTCBCurPtr>
    80001c5a:	639c                	ld	a5,0(a5)
    80001c5c:	46b2                	lw	a3,12(sp)
    80001c5e:	40e6873b          	subw	a4,a3,a4
    80001c62:	2701                	sext.w	a4,a4
    80001c64:	0ee7a623          	sw	a4,236(a5)
    80001c68:	0000a797          	auipc	a5,0xa
    80001c6c:	d6078793          	add	a5,a5,-672 # 8000b9c8 <OSTCBCurPtr>
    80001c70:	639c                	ld	a5,0(a5)
    80001c72:	0f47a683          	lw	a3,244(a5)
    80001c76:	0000a797          	auipc	a5,0xa
    80001c7a:	d5278793          	add	a5,a5,-686 # 8000b9c8 <OSTCBCurPtr>
    80001c7e:	639c                	ld	a5,0(a5)
    80001c80:	0ec7a703          	lw	a4,236(a5)
    80001c84:	0000a797          	auipc	a5,0xa
    80001c88:	d4478793          	add	a5,a5,-700 # 8000b9c8 <OSTCBCurPtr>
    80001c8c:	639c                	ld	a5,0(a5)
    80001c8e:	9f35                	addw	a4,a4,a3
    80001c90:	2701                	sext.w	a4,a4
    80001c92:	0ee7aa23          	sw	a4,244(a5)
    80001c96:	0000a797          	auipc	a5,0xa
    80001c9a:	d3a78793          	add	a5,a5,-710 # 8000b9d0 <OSTCBHighRdyPtr>
    80001c9e:	639c                	ld	a5,0(a5)
    80001ca0:	4732                	lw	a4,12(sp)
    80001ca2:	0ee7a823          	sw	a4,240(a5)
    80001ca6:	0001                	nop
    80001ca8:	60e2                	ld	ra,24(sp)
    80001caa:	6105                	add	sp,sp,32
    80001cac:	8082                	ret

0000000080001cae <OSTimeTickHook>:
    80001cae:	1141                	add	sp,sp,-16
    80001cb0:	e406                	sd	ra,8(sp)
    80001cb2:	0000a797          	auipc	a5,0xa
    80001cb6:	c4e78793          	add	a5,a5,-946 # 8000b900 <OS_AppTimeTickHookPtr>
    80001cba:	639c                	ld	a5,0(a5)
    80001cbc:	c799                	beqz	a5,80001cca <OSTimeTickHook+0x1c>
    80001cbe:	0000a797          	auipc	a5,0xa
    80001cc2:	c4278793          	add	a5,a5,-958 # 8000b900 <OS_AppTimeTickHookPtr>
    80001cc6:	639c                	ld	a5,0(a5)
    80001cc8:	9782                	jalr	a5
    80001cca:	0001                	nop
    80001ccc:	60a2                	ld	ra,8(sp)
    80001cce:	0141                	add	sp,sp,16
    80001cd0:	8082                	ret

0000000080001cd2 <SysTick_Handler>:
    80001cd2:	1101                	add	sp,sp,-32
    80001cd4:	ec06                	sd	ra,24(sp)
    80001cd6:	e402                	sd	zero,8(sp)
    80001cd8:	e36ff0ef          	jal	8000130e <CPU_SR_Save>
    80001cdc:	e42a                	sd	a0,8(sp)
    80001cde:	2f0030ef          	jal	80004fce <OSIntEnter>
    80001ce2:	6522                	ld	a0,8(sp)
    80001ce4:	e36ff0ef          	jal	8000131a <CPU_SR_Restore>
    80001ce8:	3e7050ef          	jal	800078ce <OSTimeTick>
    80001cec:	334030ef          	jal	80005020 <OSIntExit>
    80001cf0:	0001                	nop
    80001cf2:	60e2                	ld	ra,24(sp)
    80001cf4:	6105                	add	sp,sp,32
    80001cf6:	8082                	ret

0000000080001cf8 <OSSemCreate>:
    80001cf8:	7139                	add	sp,sp,-64
    80001cfa:	fc06                	sd	ra,56(sp)
    80001cfc:	ec2a                	sd	a0,24(sp)
    80001cfe:	e82e                	sd	a1,16(sp)
    80001d00:	87b2                	mv	a5,a2
    80001d02:	e036                	sd	a3,0(sp)
    80001d04:	c63e                	sw	a5,12(sp)
    80001d06:	f402                	sd	zero,40(sp)
    80001d08:	0000a797          	auipc	a5,0xa
    80001d0c:	c0478793          	add	a5,a5,-1020 # 8000b90c <OSIntNestingCtr>
    80001d10:	0007c783          	lbu	a5,0(a5)
    80001d14:	c799                	beqz	a5,80001d22 <OSSemCreate+0x2a>
    80001d16:	6782                	ld	a5,0(sp)
    80001d18:	670d                	lui	a4,0x3
    80001d1a:	ee170713          	add	a4,a4,-287 # 2ee1 <CPU_MSTATUS_MIE+0x2ed9>
    80001d1e:	c398                	sw	a4,0(a5)
    80001d20:	a841                	j	80001db0 <OSSemCreate+0xb8>
    80001d22:	67e2                	ld	a5,24(sp)
    80001d24:	e799                	bnez	a5,80001d32 <OSSemCreate+0x3a>
    80001d26:	6782                	ld	a5,0(sp)
    80001d28:	6719                	lui	a4,0x6
    80001d2a:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80001d2e:	c398                	sw	a4,0(a5)
    80001d30:	a041                	j	80001db0 <OSSemCreate+0xb8>
    80001d32:	ddcff0ef          	jal	8000130e <CPU_SR_Save>
    80001d36:	f42a                	sd	a0,40(sp)
    80001d38:	67e2                	ld	a5,24(sp)
    80001d3a:	439c                	lw	a5,0(a5)
    80001d3c:	873e                	mv	a4,a5
    80001d3e:	414d47b7          	lui	a5,0x414d4
    80001d42:	55378793          	add	a5,a5,1363 # 414d4553 <CPU_MSTATUS_MIE+0x414d454b>
    80001d46:	00f71b63          	bne	a4,a5,80001d5c <OSSemCreate+0x64>
    80001d4a:	7522                	ld	a0,40(sp)
    80001d4c:	dceff0ef          	jal	8000131a <CPU_SR_Restore>
    80001d50:	6782                	ld	a5,0(sp)
    80001d52:	6719                	lui	a4,0x6
    80001d54:	dc170713          	add	a4,a4,-575 # 5dc1 <CPU_MSTATUS_MIE+0x5db9>
    80001d58:	c398                	sw	a4,0(a5)
    80001d5a:	a899                	j	80001db0 <OSSemCreate+0xb8>
    80001d5c:	67e2                	ld	a5,24(sp)
    80001d5e:	414d4737          	lui	a4,0x414d4
    80001d62:	55370713          	add	a4,a4,1363 # 414d4553 <CPU_MSTATUS_MIE+0x414d454b>
    80001d66:	c398                	sw	a4,0(a5)
    80001d68:	67e2                	ld	a5,24(sp)
    80001d6a:	4732                	lw	a4,12(sp)
    80001d6c:	c3b8                	sw	a4,64(a5)
    80001d6e:	67e2                	ld	a5,24(sp)
    80001d70:	6742                	ld	a4,16(sp)
    80001d72:	e798                	sd	a4,8(a5)
    80001d74:	67e2                	ld	a5,24(sp)
    80001d76:	07c1                	add	a5,a5,16
    80001d78:	853e                	mv	a0,a5
    80001d7a:	381030ef          	jal	800058fa <OS_PendListInit>
    80001d7e:	6562                	ld	a0,24(sp)
    80001d80:	70a000ef          	jal	8000248a <OS_SemDbgListAdd>
    80001d84:	0000a797          	auipc	a5,0xa
    80001d88:	bec78793          	add	a5,a5,-1044 # 8000b970 <OSSemQty>
    80001d8c:	0007d783          	lhu	a5,0(a5)
    80001d90:	2785                	addw	a5,a5,1
    80001d92:	03079713          	sll	a4,a5,0x30
    80001d96:	9341                	srl	a4,a4,0x30
    80001d98:	0000a797          	auipc	a5,0xa
    80001d9c:	bd878793          	add	a5,a5,-1064 # 8000b970 <OSSemQty>
    80001da0:	00e79023          	sh	a4,0(a5)
    80001da4:	7522                	ld	a0,40(sp)
    80001da6:	d74ff0ef          	jal	8000131a <CPU_SR_Restore>
    80001daa:	6782                	ld	a5,0(sp)
    80001dac:	0007a023          	sw	zero,0(a5)
    80001db0:	70e2                	ld	ra,56(sp)
    80001db2:	6121                	add	sp,sp,64
    80001db4:	8082                	ret

0000000080001db6 <OSSemDel>:
    80001db6:	711d                	add	sp,sp,-96
    80001db8:	ec86                	sd	ra,88(sp)
    80001dba:	ec2a                	sd	a0,24(sp)
    80001dbc:	87ae                	mv	a5,a1
    80001dbe:	e432                	sd	a2,8(sp)
    80001dc0:	00f11b23          	sh	a5,22(sp)
    80001dc4:	e082                	sd	zero,64(sp)
    80001dc6:	0000a797          	auipc	a5,0xa
    80001dca:	b4678793          	add	a5,a5,-1210 # 8000b90c <OSIntNestingCtr>
    80001dce:	0007c783          	lbu	a5,0(a5)
    80001dd2:	cb81                	beqz	a5,80001de2 <OSSemDel+0x2c>
    80001dd4:	67a2                	ld	a5,8(sp)
    80001dd6:	670d                	lui	a4,0x3
    80001dd8:	2c970713          	add	a4,a4,713 # 32c9 <CPU_MSTATUS_MIE+0x32c1>
    80001ddc:	c398                	sw	a4,0(a5)
    80001dde:	4781                	li	a5,0
    80001de0:	a291                	j	80001f24 <OSSemDel+0x16e>
    80001de2:	0000a797          	auipc	a5,0xa
    80001de6:	b2b78793          	add	a5,a5,-1237 # 8000b90d <OSRunning>
    80001dea:	0007c783          	lbu	a5,0(a5)
    80001dee:	873e                	mv	a4,a5
    80001df0:	4785                	li	a5,1
    80001df2:	00f70963          	beq	a4,a5,80001e04 <OSSemDel+0x4e>
    80001df6:	67a2                	ld	a5,8(sp)
    80001df8:	6719                	lui	a4,0x6
    80001dfa:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80001dfe:	c398                	sw	a4,0(a5)
    80001e00:	4781                	li	a5,0
    80001e02:	a20d                	j	80001f24 <OSSemDel+0x16e>
    80001e04:	67e2                	ld	a5,24(sp)
    80001e06:	eb81                	bnez	a5,80001e16 <OSSemDel+0x60>
    80001e08:	67a2                	ld	a5,8(sp)
    80001e0a:	6719                	lui	a4,0x6
    80001e0c:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80001e10:	c398                	sw	a4,0(a5)
    80001e12:	4781                	li	a5,0
    80001e14:	aa01                	j	80001f24 <OSSemDel+0x16e>
    80001e16:	67e2                	ld	a5,24(sp)
    80001e18:	439c                	lw	a5,0(a5)
    80001e1a:	873e                	mv	a4,a5
    80001e1c:	414d47b7          	lui	a5,0x414d4
    80001e20:	55378793          	add	a5,a5,1363 # 414d4553 <CPU_MSTATUS_MIE+0x414d454b>
    80001e24:	00f70963          	beq	a4,a5,80001e36 <OSSemDel+0x80>
    80001e28:	67a2                	ld	a5,8(sp)
    80001e2a:	6719                	lui	a4,0x6
    80001e2c:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80001e30:	c398                	sw	a4,0(a5)
    80001e32:	4781                	li	a5,0
    80001e34:	a8c5                	j	80001f24 <OSSemDel+0x16e>
    80001e36:	cd8ff0ef          	jal	8000130e <CPU_SR_Save>
    80001e3a:	e0aa                	sd	a0,64(sp)
    80001e3c:	67e2                	ld	a5,24(sp)
    80001e3e:	07c1                	add	a5,a5,16
    80001e40:	fc3e                	sd	a5,56(sp)
    80001e42:	04011723          	sh	zero,78(sp)
    80001e46:	01615783          	lhu	a5,22(sp)
    80001e4a:	2781                	sext.w	a5,a5
    80001e4c:	c791                	beqz	a5,80001e58 <OSSemDel+0xa2>
    80001e4e:	873e                	mv	a4,a5
    80001e50:	4785                	li	a5,1
    80001e52:	04f70c63          	beq	a4,a5,80001eaa <OSSemDel+0xf4>
    80001e56:	a865                	j	80001f0e <OSSemDel+0x158>
    80001e58:	77e2                	ld	a5,56(sp)
    80001e5a:	639c                	ld	a5,0(a5)
    80001e5c:	ef95                	bnez	a5,80001e98 <OSSemDel+0xe2>
    80001e5e:	6562                	ld	a0,24(sp)
    80001e60:	682000ef          	jal	800024e2 <OS_SemDbgListRemove>
    80001e64:	0000a797          	auipc	a5,0xa
    80001e68:	b0c78793          	add	a5,a5,-1268 # 8000b970 <OSSemQty>
    80001e6c:	0007d783          	lhu	a5,0(a5)
    80001e70:	37fd                	addw	a5,a5,-1
    80001e72:	03079713          	sll	a4,a5,0x30
    80001e76:	9341                	srl	a4,a4,0x30
    80001e78:	0000a797          	auipc	a5,0xa
    80001e7c:	af878793          	add	a5,a5,-1288 # 8000b970 <OSSemQty>
    80001e80:	00e79023          	sh	a4,0(a5)
    80001e84:	6562                	ld	a0,24(sp)
    80001e86:	5ce000ef          	jal	80002454 <OS_SemClr>
    80001e8a:	6506                	ld	a0,64(sp)
    80001e8c:	c8eff0ef          	jal	8000131a <CPU_SR_Restore>
    80001e90:	67a2                	ld	a5,8(sp)
    80001e92:	0007a023          	sw	zero,0(a5)
    80001e96:	a069                	j	80001f20 <OSSemDel+0x16a>
    80001e98:	6506                	ld	a0,64(sp)
    80001e9a:	c80ff0ef          	jal	8000131a <CPU_SR_Restore>
    80001e9e:	67a2                	ld	a5,8(sp)
    80001ea0:	671d                	lui	a4,0x7
    80001ea2:	15f70713          	add	a4,a4,351 # 715f <CPU_MSTATUS_MIE+0x7157>
    80001ea6:	c398                	sw	a4,0(a5)
    80001ea8:	a8a5                	j	80001f20 <OSSemDel+0x16a>
    80001eaa:	da02                	sw	zero,52(sp)
    80001eac:	a839                	j	80001eca <OSSemDel+0x114>
    80001eae:	77e2                	ld	a5,56(sp)
    80001eb0:	639c                	ld	a5,0(a5)
    80001eb2:	f43e                	sd	a5,40(sp)
    80001eb4:	57d2                	lw	a5,52(sp)
    80001eb6:	4609                	li	a2,2
    80001eb8:	85be                	mv	a1,a5
    80001eba:	7522                	ld	a0,40(sp)
    80001ebc:	081030ef          	jal	8000573c <OS_PendAbort>
    80001ec0:	04e15783          	lhu	a5,78(sp)
    80001ec4:	2785                	addw	a5,a5,1
    80001ec6:	04f11723          	sh	a5,78(sp)
    80001eca:	77e2                	ld	a5,56(sp)
    80001ecc:	639c                	ld	a5,0(a5)
    80001ece:	f3e5                	bnez	a5,80001eae <OSSemDel+0xf8>
    80001ed0:	6562                	ld	a0,24(sp)
    80001ed2:	610000ef          	jal	800024e2 <OS_SemDbgListRemove>
    80001ed6:	0000a797          	auipc	a5,0xa
    80001eda:	a9a78793          	add	a5,a5,-1382 # 8000b970 <OSSemQty>
    80001ede:	0007d783          	lhu	a5,0(a5)
    80001ee2:	37fd                	addw	a5,a5,-1
    80001ee4:	03079713          	sll	a4,a5,0x30
    80001ee8:	9341                	srl	a4,a4,0x30
    80001eea:	0000a797          	auipc	a5,0xa
    80001eee:	a8678793          	add	a5,a5,-1402 # 8000b970 <OSSemQty>
    80001ef2:	00e79023          	sh	a4,0(a5)
    80001ef6:	6562                	ld	a0,24(sp)
    80001ef8:	55c000ef          	jal	80002454 <OS_SemClr>
    80001efc:	6506                	ld	a0,64(sp)
    80001efe:	c1cff0ef          	jal	8000131a <CPU_SR_Restore>
    80001f02:	244030ef          	jal	80005146 <OSSched>
    80001f06:	67a2                	ld	a5,8(sp)
    80001f08:	0007a023          	sw	zero,0(a5)
    80001f0c:	a811                	j	80001f20 <OSSemDel+0x16a>
    80001f0e:	6506                	ld	a0,64(sp)
    80001f10:	c0aff0ef          	jal	8000131a <CPU_SR_Restore>
    80001f14:	67a2                	ld	a5,8(sp)
    80001f16:	6719                	lui	a4,0x6
    80001f18:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80001f1c:	c398                	sw	a4,0(a5)
    80001f1e:	0001                	nop
    80001f20:	04e15783          	lhu	a5,78(sp)
    80001f24:	853e                	mv	a0,a5
    80001f26:	60e6                	ld	ra,88(sp)
    80001f28:	6125                	add	sp,sp,96
    80001f2a:	8082                	ret

0000000080001f2c <OSSemPend>:
    80001f2c:	7139                	add	sp,sp,-64
    80001f2e:	fc06                	sd	ra,56(sp)
    80001f30:	ec2a                	sd	a0,24(sp)
    80001f32:	87ae                	mv	a5,a1
    80001f34:	e436                	sd	a3,8(sp)
    80001f36:	e03a                	sd	a4,0(sp)
    80001f38:	ca3e                	sw	a5,20(sp)
    80001f3a:	87b2                	mv	a5,a2
    80001f3c:	00f11923          	sh	a5,18(sp)
    80001f40:	f402                	sd	zero,40(sp)
    80001f42:	0000a797          	auipc	a5,0xa
    80001f46:	9ca78793          	add	a5,a5,-1590 # 8000b90c <OSIntNestingCtr>
    80001f4a:	0007c783          	lbu	a5,0(a5)
    80001f4e:	cf81                	beqz	a5,80001f66 <OSSemPend+0x3a>
    80001f50:	01211783          	lh	a5,18(sp)
    80001f54:	0007c963          	bltz	a5,80001f66 <OSSemPend+0x3a>
    80001f58:	6782                	ld	a5,0(sp)
    80001f5a:	6719                	lui	a4,0x6
    80001f5c:	1ae70713          	add	a4,a4,430 # 61ae <CPU_MSTATUS_MIE+0x61a6>
    80001f60:	c398                	sw	a4,0(a5)
    80001f62:	4781                	li	a5,0
    80001f64:	aa71                	j	80002100 <OSSemPend+0x1d4>
    80001f66:	0000a797          	auipc	a5,0xa
    80001f6a:	9a778793          	add	a5,a5,-1625 # 8000b90d <OSRunning>
    80001f6e:	0007c783          	lbu	a5,0(a5)
    80001f72:	873e                	mv	a4,a5
    80001f74:	4785                	li	a5,1
    80001f76:	00f70963          	beq	a4,a5,80001f88 <OSSemPend+0x5c>
    80001f7a:	6782                	ld	a5,0(sp)
    80001f7c:	6719                	lui	a4,0x6
    80001f7e:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80001f82:	c398                	sw	a4,0(a5)
    80001f84:	4781                	li	a5,0
    80001f86:	aaad                	j	80002100 <OSSemPend+0x1d4>
    80001f88:	67e2                	ld	a5,24(sp)
    80001f8a:	eb81                	bnez	a5,80001f9a <OSSemPend+0x6e>
    80001f8c:	6782                	ld	a5,0(sp)
    80001f8e:	6719                	lui	a4,0x6
    80001f90:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80001f94:	c398                	sw	a4,0(a5)
    80001f96:	4781                	li	a5,0
    80001f98:	a2a5                	j	80002100 <OSSemPend+0x1d4>
    80001f9a:	01215783          	lhu	a5,18(sp)
    80001f9e:	2781                	sext.w	a5,a5
    80001fa0:	cf81                	beqz	a5,80001fb8 <OSSemPend+0x8c>
    80001fa2:	873e                	mv	a4,a5
    80001fa4:	67a1                	lui	a5,0x8
    80001fa6:	00f70963          	beq	a4,a5,80001fb8 <OSSemPend+0x8c>
    80001faa:	6782                	ld	a5,0(sp)
    80001fac:	6719                	lui	a4,0x6
    80001fae:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80001fb2:	c398                	sw	a4,0(a5)
    80001fb4:	4781                	li	a5,0
    80001fb6:	a2a9                	j	80002100 <OSSemPend+0x1d4>
    80001fb8:	0001                	nop
    80001fba:	67e2                	ld	a5,24(sp)
    80001fbc:	439c                	lw	a5,0(a5)
    80001fbe:	873e                	mv	a4,a5
    80001fc0:	414d47b7          	lui	a5,0x414d4
    80001fc4:	55378793          	add	a5,a5,1363 # 414d4553 <CPU_MSTATUS_MIE+0x414d454b>
    80001fc8:	00f70963          	beq	a4,a5,80001fda <OSSemPend+0xae>
    80001fcc:	6782                	ld	a5,0(sp)
    80001fce:	6719                	lui	a4,0x6
    80001fd0:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80001fd4:	c398                	sw	a4,0(a5)
    80001fd6:	4781                	li	a5,0
    80001fd8:	a225                	j	80002100 <OSSemPend+0x1d4>
    80001fda:	b34ff0ef          	jal	8000130e <CPU_SR_Save>
    80001fde:	f42a                	sd	a0,40(sp)
    80001fe0:	67e2                	ld	a5,24(sp)
    80001fe2:	43bc                	lw	a5,64(a5)
    80001fe4:	c39d                	beqz	a5,8000200a <OSSemPend+0xde>
    80001fe6:	67e2                	ld	a5,24(sp)
    80001fe8:	43bc                	lw	a5,64(a5)
    80001fea:	37fd                	addw	a5,a5,-1
    80001fec:	0007871b          	sext.w	a4,a5
    80001ff0:	67e2                	ld	a5,24(sp)
    80001ff2:	c3b8                	sw	a4,64(a5)
    80001ff4:	67e2                	ld	a5,24(sp)
    80001ff6:	43bc                	lw	a5,64(a5)
    80001ff8:	d23e                	sw	a5,36(sp)
    80001ffa:	7522                	ld	a0,40(sp)
    80001ffc:	b1eff0ef          	jal	8000131a <CPU_SR_Restore>
    80002000:	6782                	ld	a5,0(sp)
    80002002:	0007a023          	sw	zero,0(a5)
    80002006:	5792                	lw	a5,36(sp)
    80002008:	a8e5                	j	80002100 <OSSemPend+0x1d4>
    8000200a:	01211783          	lh	a5,18(sp)
    8000200e:	0007df63          	bgez	a5,8000202c <OSSemPend+0x100>
    80002012:	67e2                	ld	a5,24(sp)
    80002014:	43bc                	lw	a5,64(a5)
    80002016:	d23e                	sw	a5,36(sp)
    80002018:	7522                	ld	a0,40(sp)
    8000201a:	b00ff0ef          	jal	8000131a <CPU_SR_Restore>
    8000201e:	6782                	ld	a5,0(sp)
    80002020:	6719                	lui	a4,0x6
    80002022:	1b070713          	add	a4,a4,432 # 61b0 <CPU_MSTATUS_MIE+0x61a8>
    80002026:	c398                	sw	a4,0(a5)
    80002028:	5792                	lw	a5,36(sp)
    8000202a:	a8d9                	j	80002100 <OSSemPend+0x1d4>
    8000202c:	0000a797          	auipc	a5,0xa
    80002030:	92e78793          	add	a5,a5,-1746 # 8000b95a <OSSchedLockNestingCtr>
    80002034:	0007c783          	lbu	a5,0(a5)
    80002038:	cb99                	beqz	a5,8000204e <OSSemPend+0x122>
    8000203a:	7522                	ld	a0,40(sp)
    8000203c:	adeff0ef          	jal	8000131a <CPU_SR_Restore>
    80002040:	6782                	ld	a5,0(sp)
    80002042:	671d                	lui	a4,0x7
    80002044:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80002048:	c398                	sw	a4,0(a5)
    8000204a:	4781                	li	a5,0
    8000204c:	a855                	j	80002100 <OSSemPend+0x1d4>
    8000204e:	0000a797          	auipc	a5,0xa
    80002052:	97a78793          	add	a5,a5,-1670 # 8000b9c8 <OSTCBCurPtr>
    80002056:	639c                	ld	a5,0(a5)
    80002058:	4752                	lw	a4,20(sp)
    8000205a:	86ba                	mv	a3,a4
    8000205c:	4619                	li	a2,6
    8000205e:	85be                	mv	a1,a5
    80002060:	6562                	ld	a0,24(sp)
    80002062:	67c030ef          	jal	800056de <OS_Pend>
    80002066:	7522                	ld	a0,40(sp)
    80002068:	ab2ff0ef          	jal	8000131a <CPU_SR_Restore>
    8000206c:	0da030ef          	jal	80005146 <OSSched>
    80002070:	a9eff0ef          	jal	8000130e <CPU_SR_Save>
    80002074:	f42a                	sd	a0,40(sp)
    80002076:	0000a797          	auipc	a5,0xa
    8000207a:	95278793          	add	a5,a5,-1710 # 8000b9c8 <OSTCBCurPtr>
    8000207e:	639c                	ld	a5,0(a5)
    80002080:	0717c783          	lbu	a5,113(a5)
    80002084:	2781                	sext.w	a5,a5
    80002086:	86be                	mv	a3,a5
    80002088:	470d                	li	a4,3
    8000208a:	02e68e63          	beq	a3,a4,800020c6 <OSSemPend+0x19a>
    8000208e:	86be                	mv	a3,a5
    80002090:	470d                	li	a4,3
    80002092:	04d74663          	blt	a4,a3,800020de <OSSemPend+0x1b2>
    80002096:	86be                	mv	a3,a5
    80002098:	4709                	li	a4,2
    8000209a:	02e68c63          	beq	a3,a4,800020d2 <OSSemPend+0x1a6>
    8000209e:	86be                	mv	a3,a5
    800020a0:	4709                	li	a4,2
    800020a2:	02d74e63          	blt	a4,a3,800020de <OSSemPend+0x1b2>
    800020a6:	c791                	beqz	a5,800020b2 <OSSemPend+0x186>
    800020a8:	873e                	mv	a4,a5
    800020aa:	4785                	li	a5,1
    800020ac:	00f70763          	beq	a4,a5,800020ba <OSSemPend+0x18e>
    800020b0:	a03d                	j	800020de <OSSemPend+0x1b2>
    800020b2:	6782                	ld	a5,0(sp)
    800020b4:	0007a023          	sw	zero,0(a5)
    800020b8:	a82d                	j	800020f2 <OSSemPend+0x1c6>
    800020ba:	6782                	ld	a5,0(sp)
    800020bc:	6719                	lui	a4,0x6
    800020be:	1a970713          	add	a4,a4,425 # 61a9 <CPU_MSTATUS_MIE+0x61a1>
    800020c2:	c398                	sw	a4,0(a5)
    800020c4:	a03d                	j	800020f2 <OSSemPend+0x1c6>
    800020c6:	6782                	ld	a5,0(sp)
    800020c8:	671d                	lui	a4,0x7
    800020ca:	2d970713          	add	a4,a4,729 # 72d9 <CPU_MSTATUS_MIE+0x72d1>
    800020ce:	c398                	sw	a4,0(a5)
    800020d0:	a00d                	j	800020f2 <OSSemPend+0x1c6>
    800020d2:	6782                	ld	a5,0(sp)
    800020d4:	6719                	lui	a4,0x6
    800020d6:	dc270713          	add	a4,a4,-574 # 5dc2 <CPU_MSTATUS_MIE+0x5dba>
    800020da:	c398                	sw	a4,0(a5)
    800020dc:	a819                	j	800020f2 <OSSemPend+0x1c6>
    800020de:	6782                	ld	a5,0(sp)
    800020e0:	671d                	lui	a4,0x7
    800020e2:	e2e70713          	add	a4,a4,-466 # 6e2e <CPU_MSTATUS_MIE+0x6e26>
    800020e6:	c398                	sw	a4,0(a5)
    800020e8:	7522                	ld	a0,40(sp)
    800020ea:	a30ff0ef          	jal	8000131a <CPU_SR_Restore>
    800020ee:	4781                	li	a5,0
    800020f0:	a801                	j	80002100 <OSSemPend+0x1d4>
    800020f2:	67e2                	ld	a5,24(sp)
    800020f4:	43bc                	lw	a5,64(a5)
    800020f6:	d23e                	sw	a5,36(sp)
    800020f8:	7522                	ld	a0,40(sp)
    800020fa:	a20ff0ef          	jal	8000131a <CPU_SR_Restore>
    800020fe:	5792                	lw	a5,36(sp)
    80002100:	853e                	mv	a0,a5
    80002102:	70e2                	ld	ra,56(sp)
    80002104:	6121                	add	sp,sp,64
    80002106:	8082                	ret

0000000080002108 <OSSemPendAbort>:
    80002108:	711d                	add	sp,sp,-96
    8000210a:	ec86                	sd	ra,88(sp)
    8000210c:	ec2a                	sd	a0,24(sp)
    8000210e:	87ae                	mv	a5,a1
    80002110:	e432                	sd	a2,8(sp)
    80002112:	00f11b23          	sh	a5,22(sp)
    80002116:	e082                	sd	zero,64(sp)
    80002118:	00009797          	auipc	a5,0x9
    8000211c:	7f478793          	add	a5,a5,2036 # 8000b90c <OSIntNestingCtr>
    80002120:	0007c783          	lbu	a5,0(a5)
    80002124:	cb81                	beqz	a5,80002134 <OSSemPendAbort+0x2c>
    80002126:	67a2                	ld	a5,8(sp)
    80002128:	6719                	lui	a4,0x6
    8000212a:	1aa70713          	add	a4,a4,426 # 61aa <CPU_MSTATUS_MIE+0x61a2>
    8000212e:	c398                	sw	a4,0(a5)
    80002130:	4781                	li	a5,0
    80002132:	a205                	j	80002252 <OSSemPendAbort+0x14a>
    80002134:	00009797          	auipc	a5,0x9
    80002138:	7d978793          	add	a5,a5,2009 # 8000b90d <OSRunning>
    8000213c:	0007c783          	lbu	a5,0(a5)
    80002140:	873e                	mv	a4,a5
    80002142:	4785                	li	a5,1
    80002144:	00f70963          	beq	a4,a5,80002156 <OSSemPendAbort+0x4e>
    80002148:	67a2                	ld	a5,8(sp)
    8000214a:	6719                	lui	a4,0x6
    8000214c:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80002150:	c398                	sw	a4,0(a5)
    80002152:	4781                	li	a5,0
    80002154:	a8fd                	j	80002252 <OSSemPendAbort+0x14a>
    80002156:	67e2                	ld	a5,24(sp)
    80002158:	eb81                	bnez	a5,80002168 <OSSemPendAbort+0x60>
    8000215a:	67a2                	ld	a5,8(sp)
    8000215c:	6719                	lui	a4,0x6
    8000215e:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80002162:	c398                	sw	a4,0(a5)
    80002164:	4781                	li	a5,0
    80002166:	a0f5                	j	80002252 <OSSemPendAbort+0x14a>
    80002168:	01615783          	lhu	a5,22(sp)
    8000216c:	2781                	sext.w	a5,a5
    8000216e:	86be                	mv	a3,a5
    80002170:	6721                	lui	a4,0x8
    80002172:	10070713          	add	a4,a4,256 # 8100 <CPU_MSTATUS_MIE+0x80f8>
    80002176:	02e68d63          	beq	a3,a4,800021b0 <OSSemPendAbort+0xa8>
    8000217a:	86be                	mv	a3,a5
    8000217c:	6721                	lui	a4,0x8
    8000217e:	10070713          	add	a4,a4,256 # 8100 <CPU_MSTATUS_MIE+0x80f8>
    80002182:	02d74063          	blt	a4,a3,800021a2 <OSSemPendAbort+0x9a>
    80002186:	86be                	mv	a3,a5
    80002188:	6721                	lui	a4,0x8
    8000218a:	02e68363          	beq	a3,a4,800021b0 <OSSemPendAbort+0xa8>
    8000218e:	86be                	mv	a3,a5
    80002190:	6721                	lui	a4,0x8
    80002192:	00d74863          	blt	a4,a3,800021a2 <OSSemPendAbort+0x9a>
    80002196:	cf89                	beqz	a5,800021b0 <OSSemPendAbort+0xa8>
    80002198:	873e                	mv	a4,a5
    8000219a:	10000793          	li	a5,256
    8000219e:	00f70963          	beq	a4,a5,800021b0 <OSSemPendAbort+0xa8>
    800021a2:	67a2                	ld	a5,8(sp)
    800021a4:	6719                	lui	a4,0x6
    800021a6:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800021aa:	c398                	sw	a4,0(a5)
    800021ac:	4781                	li	a5,0
    800021ae:	a055                	j	80002252 <OSSemPendAbort+0x14a>
    800021b0:	0001                	nop
    800021b2:	67e2                	ld	a5,24(sp)
    800021b4:	439c                	lw	a5,0(a5)
    800021b6:	873e                	mv	a4,a5
    800021b8:	414d47b7          	lui	a5,0x414d4
    800021bc:	55378793          	add	a5,a5,1363 # 414d4553 <CPU_MSTATUS_MIE+0x414d454b>
    800021c0:	00f70963          	beq	a4,a5,800021d2 <OSSemPendAbort+0xca>
    800021c4:	67a2                	ld	a5,8(sp)
    800021c6:	6719                	lui	a4,0x6
    800021c8:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    800021cc:	c398                	sw	a4,0(a5)
    800021ce:	4781                	li	a5,0
    800021d0:	a049                	j	80002252 <OSSemPendAbort+0x14a>
    800021d2:	93cff0ef          	jal	8000130e <CPU_SR_Save>
    800021d6:	e0aa                	sd	a0,64(sp)
    800021d8:	67e2                	ld	a5,24(sp)
    800021da:	07c1                	add	a5,a5,16
    800021dc:	fc3e                	sd	a5,56(sp)
    800021de:	77e2                	ld	a5,56(sp)
    800021e0:	639c                	ld	a5,0(a5)
    800021e2:	eb99                	bnez	a5,800021f8 <OSSemPendAbort+0xf0>
    800021e4:	6506                	ld	a0,64(sp)
    800021e6:	934ff0ef          	jal	8000131a <CPU_SR_Restore>
    800021ea:	67a2                	ld	a5,8(sp)
    800021ec:	6719                	lui	a4,0x6
    800021ee:	1ab70713          	add	a4,a4,427 # 61ab <CPU_MSTATUS_MIE+0x61a3>
    800021f2:	c398                	sw	a4,0(a5)
    800021f4:	4781                	li	a5,0
    800021f6:	a8b1                	j	80002252 <OSSemPendAbort+0x14a>
    800021f8:	04011723          	sh	zero,78(sp)
    800021fc:	da02                	sw	zero,52(sp)
    800021fe:	a03d                	j	8000222c <OSSemPendAbort+0x124>
    80002200:	77e2                	ld	a5,56(sp)
    80002202:	639c                	ld	a5,0(a5)
    80002204:	f43e                	sd	a5,40(sp)
    80002206:	57d2                	lw	a5,52(sp)
    80002208:	4605                	li	a2,1
    8000220a:	85be                	mv	a1,a5
    8000220c:	7522                	ld	a0,40(sp)
    8000220e:	52e030ef          	jal	8000573c <OS_PendAbort>
    80002212:	04e15783          	lhu	a5,78(sp)
    80002216:	2785                	addw	a5,a5,1
    80002218:	04f11723          	sh	a5,78(sp)
    8000221c:	01615783          	lhu	a5,22(sp)
    80002220:	0007871b          	sext.w	a4,a5
    80002224:	10000793          	li	a5,256
    80002228:	00f71663          	bne	a4,a5,80002234 <OSSemPendAbort+0x12c>
    8000222c:	77e2                	ld	a5,56(sp)
    8000222e:	639c                	ld	a5,0(a5)
    80002230:	fbe1                	bnez	a5,80002200 <OSSemPendAbort+0xf8>
    80002232:	a011                	j	80002236 <OSSemPendAbort+0x12e>
    80002234:	0001                	nop
    80002236:	6506                	ld	a0,64(sp)
    80002238:	8e2ff0ef          	jal	8000131a <CPU_SR_Restore>
    8000223c:	01611783          	lh	a5,22(sp)
    80002240:	0007c463          	bltz	a5,80002248 <OSSemPendAbort+0x140>
    80002244:	703020ef          	jal	80005146 <OSSched>
    80002248:	67a2                	ld	a5,8(sp)
    8000224a:	0007a023          	sw	zero,0(a5)
    8000224e:	04e15783          	lhu	a5,78(sp)
    80002252:	853e                	mv	a0,a5
    80002254:	60e6                	ld	ra,88(sp)
    80002256:	6125                	add	sp,sp,96
    80002258:	8082                	ret

000000008000225a <OSSemPost>:
    8000225a:	711d                	add	sp,sp,-96
    8000225c:	ec86                	sd	ra,88(sp)
    8000225e:	ec2a                	sd	a0,24(sp)
    80002260:	87ae                	mv	a5,a1
    80002262:	e432                	sd	a2,8(sp)
    80002264:	00f11b23          	sh	a5,22(sp)
    80002268:	e082                	sd	zero,64(sp)
    8000226a:	00009797          	auipc	a5,0x9
    8000226e:	6a378793          	add	a5,a5,1699 # 8000b90d <OSRunning>
    80002272:	0007c783          	lbu	a5,0(a5)
    80002276:	873e                	mv	a4,a5
    80002278:	4785                	li	a5,1
    8000227a:	00f70963          	beq	a4,a5,8000228c <OSSemPost+0x32>
    8000227e:	67a2                	ld	a5,8(sp)
    80002280:	6719                	lui	a4,0x6
    80002282:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80002286:	c398                	sw	a4,0(a5)
    80002288:	4781                	li	a5,0
    8000228a:	a225                	j	800023b2 <OSSemPost+0x158>
    8000228c:	67e2                	ld	a5,24(sp)
    8000228e:	eb81                	bnez	a5,8000229e <OSSemPost+0x44>
    80002290:	67a2                	ld	a5,8(sp)
    80002292:	6719                	lui	a4,0x6
    80002294:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80002298:	c398                	sw	a4,0(a5)
    8000229a:	4781                	li	a5,0
    8000229c:	aa19                	j	800023b2 <OSSemPost+0x158>
    8000229e:	01615783          	lhu	a5,22(sp)
    800022a2:	2781                	sext.w	a5,a5
    800022a4:	86be                	mv	a3,a5
    800022a6:	6721                	lui	a4,0x8
    800022a8:	20070713          	add	a4,a4,512 # 8200 <CPU_MSTATUS_MIE+0x81f8>
    800022ac:	02e68d63          	beq	a3,a4,800022e6 <OSSemPost+0x8c>
    800022b0:	86be                	mv	a3,a5
    800022b2:	6721                	lui	a4,0x8
    800022b4:	20070713          	add	a4,a4,512 # 8200 <CPU_MSTATUS_MIE+0x81f8>
    800022b8:	02d74063          	blt	a4,a3,800022d8 <OSSemPost+0x7e>
    800022bc:	86be                	mv	a3,a5
    800022be:	6721                	lui	a4,0x8
    800022c0:	02e68363          	beq	a3,a4,800022e6 <OSSemPost+0x8c>
    800022c4:	86be                	mv	a3,a5
    800022c6:	6721                	lui	a4,0x8
    800022c8:	00d74863          	blt	a4,a3,800022d8 <OSSemPost+0x7e>
    800022cc:	cf89                	beqz	a5,800022e6 <OSSemPost+0x8c>
    800022ce:	873e                	mv	a4,a5
    800022d0:	20000793          	li	a5,512
    800022d4:	00f70963          	beq	a4,a5,800022e6 <OSSemPost+0x8c>
    800022d8:	67a2                	ld	a5,8(sp)
    800022da:	6719                	lui	a4,0x6
    800022dc:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800022e0:	c398                	sw	a4,0(a5)
    800022e2:	4781                	li	a5,0
    800022e4:	a0f9                	j	800023b2 <OSSemPost+0x158>
    800022e6:	0001                	nop
    800022e8:	67e2                	ld	a5,24(sp)
    800022ea:	439c                	lw	a5,0(a5)
    800022ec:	873e                	mv	a4,a5
    800022ee:	414d47b7          	lui	a5,0x414d4
    800022f2:	55378793          	add	a5,a5,1363 # 414d4553 <CPU_MSTATUS_MIE+0x414d454b>
    800022f6:	00f70963          	beq	a4,a5,80002308 <OSSemPost+0xae>
    800022fa:	67a2                	ld	a5,8(sp)
    800022fc:	6719                	lui	a4,0x6
    800022fe:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80002302:	c398                	sw	a4,0(a5)
    80002304:	4781                	li	a5,0
    80002306:	a075                	j	800023b2 <OSSemPost+0x158>
    80002308:	de02                	sw	zero,60(sp)
    8000230a:	804ff0ef          	jal	8000130e <CPU_SR_Save>
    8000230e:	e0aa                	sd	a0,64(sp)
    80002310:	67e2                	ld	a5,24(sp)
    80002312:	07c1                	add	a5,a5,16
    80002314:	f83e                	sd	a5,48(sp)
    80002316:	77c2                	ld	a5,48(sp)
    80002318:	639c                	ld	a5,0(a5)
    8000231a:	e3b9                	bnez	a5,80002360 <OSSemPost+0x106>
    8000231c:	67e2                	ld	a5,24(sp)
    8000231e:	43bc                	lw	a5,64(a5)
    80002320:	873e                	mv	a4,a5
    80002322:	57fd                	li	a5,-1
    80002324:	00f71c63          	bne	a4,a5,8000233c <OSSemPost+0xe2>
    80002328:	6506                	ld	a0,64(sp)
    8000232a:	ff1fe0ef          	jal	8000131a <CPU_SR_Restore>
    8000232e:	67a2                	ld	a5,8(sp)
    80002330:	671d                	lui	a4,0x7
    80002332:	dc570713          	add	a4,a4,-571 # 6dc5 <CPU_MSTATUS_MIE+0x6dbd>
    80002336:	c398                	sw	a4,0(a5)
    80002338:	4781                	li	a5,0
    8000233a:	a8a5                	j	800023b2 <OSSemPost+0x158>
    8000233c:	67e2                	ld	a5,24(sp)
    8000233e:	43bc                	lw	a5,64(a5)
    80002340:	2785                	addw	a5,a5,1
    80002342:	0007871b          	sext.w	a4,a5
    80002346:	67e2                	ld	a5,24(sp)
    80002348:	c3b8                	sw	a4,64(a5)
    8000234a:	67e2                	ld	a5,24(sp)
    8000234c:	43bc                	lw	a5,64(a5)
    8000234e:	d23e                	sw	a5,36(sp)
    80002350:	6506                	ld	a0,64(sp)
    80002352:	fc9fe0ef          	jal	8000131a <CPU_SR_Restore>
    80002356:	67a2                	ld	a5,8(sp)
    80002358:	0007a023          	sw	zero,0(a5)
    8000235c:	5792                	lw	a5,36(sp)
    8000235e:	a891                	j	800023b2 <OSSemPost+0x158>
    80002360:	77c2                	ld	a5,48(sp)
    80002362:	639c                	ld	a5,0(a5)
    80002364:	e4be                	sd	a5,72(sp)
    80002366:	a02d                	j	80002390 <OSSemPost+0x136>
    80002368:	67a6                	ld	a5,72(sp)
    8000236a:	6fbc                	ld	a5,88(a5)
    8000236c:	f43e                	sd	a5,40(sp)
    8000236e:	57f2                	lw	a5,60(sp)
    80002370:	873e                	mv	a4,a5
    80002372:	4681                	li	a3,0
    80002374:	4601                	li	a2,0
    80002376:	65a6                	ld	a1,72(sp)
    80002378:	6562                	ld	a0,24(sp)
    8000237a:	714030ef          	jal	80005a8e <OS_Post>
    8000237e:	01615783          	lhu	a5,22(sp)
    80002382:	2781                	sext.w	a5,a5
    80002384:	2007f793          	and	a5,a5,512
    80002388:	2781                	sext.w	a5,a5
    8000238a:	c791                	beqz	a5,80002396 <OSSemPost+0x13c>
    8000238c:	77a2                	ld	a5,40(sp)
    8000238e:	e4be                	sd	a5,72(sp)
    80002390:	67a6                	ld	a5,72(sp)
    80002392:	fbf9                	bnez	a5,80002368 <OSSemPost+0x10e>
    80002394:	a011                	j	80002398 <OSSemPost+0x13e>
    80002396:	0001                	nop
    80002398:	6506                	ld	a0,64(sp)
    8000239a:	f81fe0ef          	jal	8000131a <CPU_SR_Restore>
    8000239e:	01611783          	lh	a5,22(sp)
    800023a2:	0007c463          	bltz	a5,800023aa <OSSemPost+0x150>
    800023a6:	5a1020ef          	jal	80005146 <OSSched>
    800023aa:	67a2                	ld	a5,8(sp)
    800023ac:	0007a023          	sw	zero,0(a5)
    800023b0:	4781                	li	a5,0
    800023b2:	853e                	mv	a0,a5
    800023b4:	60e6                	ld	ra,88(sp)
    800023b6:	6125                	add	sp,sp,96
    800023b8:	8082                	ret

00000000800023ba <OSSemSet>:
    800023ba:	7139                	add	sp,sp,-64
    800023bc:	fc06                	sd	ra,56(sp)
    800023be:	ec2a                	sd	a0,24(sp)
    800023c0:	87ae                	mv	a5,a1
    800023c2:	e432                	sd	a2,8(sp)
    800023c4:	ca3e                	sw	a5,20(sp)
    800023c6:	f402                	sd	zero,40(sp)
    800023c8:	00009797          	auipc	a5,0x9
    800023cc:	54478793          	add	a5,a5,1348 # 8000b90c <OSIntNestingCtr>
    800023d0:	0007c783          	lbu	a5,0(a5)
    800023d4:	c799                	beqz	a5,800023e2 <OSSemSet+0x28>
    800023d6:	67a2                	ld	a5,8(sp)
    800023d8:	671d                	lui	a4,0x7
    800023da:	dc670713          	add	a4,a4,-570 # 6dc6 <CPU_MSTATUS_MIE+0x6dbe>
    800023de:	c398                	sw	a4,0(a5)
    800023e0:	a0bd                	j	8000244e <OSSemSet+0x94>
    800023e2:	67e2                	ld	a5,24(sp)
    800023e4:	e799                	bnez	a5,800023f2 <OSSemSet+0x38>
    800023e6:	67a2                	ld	a5,8(sp)
    800023e8:	6719                	lui	a4,0x6
    800023ea:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    800023ee:	c398                	sw	a4,0(a5)
    800023f0:	a8b9                	j	8000244e <OSSemSet+0x94>
    800023f2:	67e2                	ld	a5,24(sp)
    800023f4:	439c                	lw	a5,0(a5)
    800023f6:	873e                	mv	a4,a5
    800023f8:	414d47b7          	lui	a5,0x414d4
    800023fc:	55378793          	add	a5,a5,1363 # 414d4553 <CPU_MSTATUS_MIE+0x414d454b>
    80002400:	00f70863          	beq	a4,a5,80002410 <OSSemSet+0x56>
    80002404:	67a2                	ld	a5,8(sp)
    80002406:	6719                	lui	a4,0x6
    80002408:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    8000240c:	c398                	sw	a4,0(a5)
    8000240e:	a081                	j	8000244e <OSSemSet+0x94>
    80002410:	67a2                	ld	a5,8(sp)
    80002412:	0007a023          	sw	zero,0(a5)
    80002416:	ef9fe0ef          	jal	8000130e <CPU_SR_Save>
    8000241a:	f42a                	sd	a0,40(sp)
    8000241c:	67e2                	ld	a5,24(sp)
    8000241e:	43bc                	lw	a5,64(a5)
    80002420:	c789                	beqz	a5,8000242a <OSSemSet+0x70>
    80002422:	67e2                	ld	a5,24(sp)
    80002424:	4752                	lw	a4,20(sp)
    80002426:	c3b8                	sw	a4,64(a5)
    80002428:	a005                	j	80002448 <OSSemSet+0x8e>
    8000242a:	67e2                	ld	a5,24(sp)
    8000242c:	07c1                	add	a5,a5,16
    8000242e:	f03e                	sd	a5,32(sp)
    80002430:	7782                	ld	a5,32(sp)
    80002432:	639c                	ld	a5,0(a5)
    80002434:	e789                	bnez	a5,8000243e <OSSemSet+0x84>
    80002436:	67e2                	ld	a5,24(sp)
    80002438:	4752                	lw	a4,20(sp)
    8000243a:	c3b8                	sw	a4,64(a5)
    8000243c:	a031                	j	80002448 <OSSemSet+0x8e>
    8000243e:	67a2                	ld	a5,8(sp)
    80002440:	671d                	lui	a4,0x7
    80002442:	15f70713          	add	a4,a4,351 # 715f <CPU_MSTATUS_MIE+0x7157>
    80002446:	c398                	sw	a4,0(a5)
    80002448:	7522                	ld	a0,40(sp)
    8000244a:	ed1fe0ef          	jal	8000131a <CPU_SR_Restore>
    8000244e:	70e2                	ld	ra,56(sp)
    80002450:	6121                	add	sp,sp,64
    80002452:	8082                	ret

0000000080002454 <OS_SemClr>:
    80002454:	1101                	add	sp,sp,-32
    80002456:	ec06                	sd	ra,24(sp)
    80002458:	e42a                	sd	a0,8(sp)
    8000245a:	67a2                	ld	a5,8(sp)
    8000245c:	454e5737          	lui	a4,0x454e5
    80002460:	f4e70713          	add	a4,a4,-178 # 454e4f4e <CPU_MSTATUS_MIE+0x454e4f46>
    80002464:	c398                	sw	a4,0(a5)
    80002466:	67a2                	ld	a5,8(sp)
    80002468:	0407a023          	sw	zero,64(a5)
    8000246c:	67a2                	ld	a5,8(sp)
    8000246e:	00009717          	auipc	a4,0x9
    80002472:	f5270713          	add	a4,a4,-174 # 8000b3c0 <CPU_CntLeadZerosTbl+0x100>
    80002476:	e798                	sd	a4,8(a5)
    80002478:	67a2                	ld	a5,8(sp)
    8000247a:	07c1                	add	a5,a5,16
    8000247c:	853e                	mv	a0,a5
    8000247e:	47c030ef          	jal	800058fa <OS_PendListInit>
    80002482:	0001                	nop
    80002484:	60e2                	ld	ra,24(sp)
    80002486:	6105                	add	sp,sp,32
    80002488:	8082                	ret

000000008000248a <OS_SemDbgListAdd>:
    8000248a:	1141                	add	sp,sp,-16
    8000248c:	e42a                	sd	a0,8(sp)
    8000248e:	67a2                	ld	a5,8(sp)
    80002490:	00009717          	auipc	a4,0x9
    80002494:	f3870713          	add	a4,a4,-200 # 8000b3c8 <CPU_CntLeadZerosTbl+0x108>
    80002498:	ff98                	sd	a4,56(a5)
    8000249a:	67a2                	ld	a5,8(sp)
    8000249c:	0207b423          	sd	zero,40(a5)
    800024a0:	00009797          	auipc	a5,0x9
    800024a4:	4c878793          	add	a5,a5,1224 # 8000b968 <OSSemDbgListPtr>
    800024a8:	639c                	ld	a5,0(a5)
    800024aa:	e789                	bnez	a5,800024b4 <OS_SemDbgListAdd+0x2a>
    800024ac:	67a2                	ld	a5,8(sp)
    800024ae:	0207b823          	sd	zero,48(a5)
    800024b2:	a839                	j	800024d0 <OS_SemDbgListAdd+0x46>
    800024b4:	00009797          	auipc	a5,0x9
    800024b8:	4b478793          	add	a5,a5,1204 # 8000b968 <OSSemDbgListPtr>
    800024bc:	6398                	ld	a4,0(a5)
    800024be:	67a2                	ld	a5,8(sp)
    800024c0:	fb98                	sd	a4,48(a5)
    800024c2:	00009797          	auipc	a5,0x9
    800024c6:	4a678793          	add	a5,a5,1190 # 8000b968 <OSSemDbgListPtr>
    800024ca:	639c                	ld	a5,0(a5)
    800024cc:	6722                	ld	a4,8(sp)
    800024ce:	f798                	sd	a4,40(a5)
    800024d0:	00009797          	auipc	a5,0x9
    800024d4:	49878793          	add	a5,a5,1176 # 8000b968 <OSSemDbgListPtr>
    800024d8:	6722                	ld	a4,8(sp)
    800024da:	e398                	sd	a4,0(a5)
    800024dc:	0001                	nop
    800024de:	0141                	add	sp,sp,16
    800024e0:	8082                	ret

00000000800024e2 <OS_SemDbgListRemove>:
    800024e2:	1101                	add	sp,sp,-32
    800024e4:	e42a                	sd	a0,8(sp)
    800024e6:	67a2                	ld	a5,8(sp)
    800024e8:	779c                	ld	a5,40(a5)
    800024ea:	ec3e                	sd	a5,24(sp)
    800024ec:	67a2                	ld	a5,8(sp)
    800024ee:	7b9c                	ld	a5,48(a5)
    800024f0:	e83e                	sd	a5,16(sp)
    800024f2:	67e2                	ld	a5,24(sp)
    800024f4:	e385                	bnez	a5,80002514 <OS_SemDbgListRemove+0x32>
    800024f6:	00009797          	auipc	a5,0x9
    800024fa:	47278793          	add	a5,a5,1138 # 8000b968 <OSSemDbgListPtr>
    800024fe:	6742                	ld	a4,16(sp)
    80002500:	e398                	sd	a4,0(a5)
    80002502:	67c2                	ld	a5,16(sp)
    80002504:	c781                	beqz	a5,8000250c <OS_SemDbgListRemove+0x2a>
    80002506:	67c2                	ld	a5,16(sp)
    80002508:	0207b423          	sd	zero,40(a5)
    8000250c:	67a2                	ld	a5,8(sp)
    8000250e:	0207b823          	sd	zero,48(a5)
    80002512:	a035                	j	8000253e <OS_SemDbgListRemove+0x5c>
    80002514:	67c2                	ld	a5,16(sp)
    80002516:	eb81                	bnez	a5,80002526 <OS_SemDbgListRemove+0x44>
    80002518:	67e2                	ld	a5,24(sp)
    8000251a:	0207b823          	sd	zero,48(a5)
    8000251e:	67a2                	ld	a5,8(sp)
    80002520:	0207b423          	sd	zero,40(a5)
    80002524:	a829                	j	8000253e <OS_SemDbgListRemove+0x5c>
    80002526:	67e2                	ld	a5,24(sp)
    80002528:	6742                	ld	a4,16(sp)
    8000252a:	fb98                	sd	a4,48(a5)
    8000252c:	67c2                	ld	a5,16(sp)
    8000252e:	6762                	ld	a4,24(sp)
    80002530:	f798                	sd	a4,40(a5)
    80002532:	67a2                	ld	a5,8(sp)
    80002534:	0207b823          	sd	zero,48(a5)
    80002538:	67a2                	ld	a5,8(sp)
    8000253a:	0207b423          	sd	zero,40(a5)
    8000253e:	0001                	nop
    80002540:	6105                	add	sp,sp,32
    80002542:	8082                	ret

0000000080002544 <OSMemCreate>:
    80002544:	7159                	add	sp,sp,-112
    80002546:	f486                	sd	ra,104(sp)
    80002548:	f42a                	sd	a0,40(sp)
    8000254a:	f02e                	sd	a1,32(sp)
    8000254c:	ec32                	sd	a2,24(sp)
    8000254e:	e43e                	sd	a5,8(sp)
    80002550:	87b6                	mv	a5,a3
    80002552:	00f11b23          	sh	a5,22(sp)
    80002556:	87ba                	mv	a5,a4
    80002558:	00f11a23          	sh	a5,20(sp)
    8000255c:	e082                	sd	zero,64(sp)
    8000255e:	00009797          	auipc	a5,0x9
    80002562:	3ae78793          	add	a5,a5,942 # 8000b90c <OSIntNestingCtr>
    80002566:	0007c783          	lbu	a5,0(a5)
    8000256a:	c799                	beqz	a5,80002578 <OSMemCreate+0x34>
    8000256c:	67a2                	ld	a5,8(sp)
    8000256e:	6715                	lui	a4,0x5
    80002570:	6b970713          	add	a4,a4,1721 # 56b9 <CPU_MSTATUS_MIE+0x56b1>
    80002574:	c398                	sw	a4,0(a5)
    80002576:	aab1                	j	800026d2 <OSMemCreate+0x18e>
    80002578:	67e2                	ld	a5,24(sp)
    8000257a:	e799                	bnez	a5,80002588 <OSMemCreate+0x44>
    8000257c:	67a2                	ld	a5,8(sp)
    8000257e:	6715                	lui	a4,0x5
    80002580:	6bb70713          	add	a4,a4,1723 # 56bb <CPU_MSTATUS_MIE+0x56b3>
    80002584:	c398                	sw	a4,0(a5)
    80002586:	a2b1                	j	800026d2 <OSMemCreate+0x18e>
    80002588:	01615783          	lhu	a5,22(sp)
    8000258c:	0007871b          	sext.w	a4,a5
    80002590:	4785                	li	a5,1
    80002592:	00e7e863          	bltu	a5,a4,800025a2 <OSMemCreate+0x5e>
    80002596:	67a2                	ld	a5,8(sp)
    80002598:	6715                	lui	a4,0x5
    8000259a:	6bc70713          	add	a4,a4,1724 # 56bc <CPU_MSTATUS_MIE+0x56b4>
    8000259e:	c398                	sw	a4,0(a5)
    800025a0:	aa0d                	j	800026d2 <OSMemCreate+0x18e>
    800025a2:	01415783          	lhu	a5,20(sp)
    800025a6:	0007871b          	sext.w	a4,a5
    800025aa:	479d                	li	a5,7
    800025ac:	00e7e863          	bltu	a5,a4,800025bc <OSMemCreate+0x78>
    800025b0:	67a2                	ld	a5,8(sp)
    800025b2:	6715                	lui	a4,0x5
    800025b4:	6c170713          	add	a4,a4,1729 # 56c1 <CPU_MSTATUS_MIE+0x56b9>
    800025b8:	c398                	sw	a4,0(a5)
    800025ba:	aa21                	j	800026d2 <OSMemCreate+0x18e>
    800025bc:	479d                	li	a5,7
    800025be:	fc3e                	sd	a5,56(sp)
    800025c0:	77e2                	ld	a5,56(sp)
    800025c2:	c795                	beqz	a5,800025ee <OSMemCreate+0xaa>
    800025c4:	6762                	ld	a4,24(sp)
    800025c6:	77e2                	ld	a5,56(sp)
    800025c8:	8ff9                	and	a5,a5,a4
    800025ca:	c799                	beqz	a5,800025d8 <OSMemCreate+0x94>
    800025cc:	67a2                	ld	a5,8(sp)
    800025ce:	6715                	lui	a4,0x5
    800025d0:	6bb70713          	add	a4,a4,1723 # 56bb <CPU_MSTATUS_MIE+0x56b3>
    800025d4:	c398                	sw	a4,0(a5)
    800025d6:	a8f5                	j	800026d2 <OSMemCreate+0x18e>
    800025d8:	01415703          	lhu	a4,20(sp)
    800025dc:	77e2                	ld	a5,56(sp)
    800025de:	8ff9                	and	a5,a5,a4
    800025e0:	c799                	beqz	a5,800025ee <OSMemCreate+0xaa>
    800025e2:	67a2                	ld	a5,8(sp)
    800025e4:	6715                	lui	a4,0x5
    800025e6:	6c170713          	add	a4,a4,1729 # 56c1 <CPU_MSTATUS_MIE+0x56b9>
    800025ea:	c398                	sw	a4,0(a5)
    800025ec:	a0dd                	j	800026d2 <OSMemCreate+0x18e>
    800025ee:	67e2                	ld	a5,24(sp)
    800025f0:	e4be                	sd	a5,72(sp)
    800025f2:	67e2                	ld	a5,24(sp)
    800025f4:	e8be                	sd	a5,80(sp)
    800025f6:	01615783          	lhu	a5,22(sp)
    800025fa:	37fd                	addw	a5,a5,-1
    800025fc:	02f11b23          	sh	a5,54(sp)
    80002600:	04011f23          	sh	zero,94(sp)
    80002604:	a005                	j	80002624 <OSMemCreate+0xe0>
    80002606:	01415783          	lhu	a5,20(sp)
    8000260a:	6746                	ld	a4,80(sp)
    8000260c:	97ba                	add	a5,a5,a4
    8000260e:	e8be                	sd	a5,80(sp)
    80002610:	67a6                	ld	a5,72(sp)
    80002612:	6746                	ld	a4,80(sp)
    80002614:	e398                	sd	a4,0(a5)
    80002616:	67c6                	ld	a5,80(sp)
    80002618:	e4be                	sd	a5,72(sp)
    8000261a:	05e15783          	lhu	a5,94(sp)
    8000261e:	2785                	addw	a5,a5,1
    80002620:	04f11f23          	sh	a5,94(sp)
    80002624:	05e15703          	lhu	a4,94(sp)
    80002628:	03615783          	lhu	a5,54(sp)
    8000262c:	2701                	sext.w	a4,a4
    8000262e:	2781                	sext.w	a5,a5
    80002630:	fcf76be3          	bltu	a4,a5,80002606 <OSMemCreate+0xc2>
    80002634:	67a6                	ld	a5,72(sp)
    80002636:	0007b023          	sd	zero,0(a5)
    8000263a:	cd5fe0ef          	jal	8000130e <CPU_SR_Save>
    8000263e:	e0aa                	sd	a0,64(sp)
    80002640:	77a2                	ld	a5,40(sp)
    80002642:	439c                	lw	a5,0(a5)
    80002644:	873e                	mv	a4,a5
    80002646:	204d47b7          	lui	a5,0x204d4
    8000264a:	54d78793          	add	a5,a5,1357 # 204d454d <CPU_MSTATUS_MIE+0x204d4545>
    8000264e:	00f71b63          	bne	a4,a5,80002664 <OSMemCreate+0x120>
    80002652:	6506                	ld	a0,64(sp)
    80002654:	cc7fe0ef          	jal	8000131a <CPU_SR_Restore>
    80002658:	67a2                	ld	a5,8(sp)
    8000265a:	6719                	lui	a4,0x6
    8000265c:	dc170713          	add	a4,a4,-575 # 5dc1 <CPU_MSTATUS_MIE+0x5db9>
    80002660:	c398                	sw	a4,0(a5)
    80002662:	a885                	j	800026d2 <OSMemCreate+0x18e>
    80002664:	77a2                	ld	a5,40(sp)
    80002666:	204d4737          	lui	a4,0x204d4
    8000266a:	54d70713          	add	a4,a4,1357 # 204d454d <CPU_MSTATUS_MIE+0x204d4545>
    8000266e:	c398                	sw	a4,0(a5)
    80002670:	77a2                	ld	a5,40(sp)
    80002672:	7702                	ld	a4,32(sp)
    80002674:	e798                	sd	a4,8(a5)
    80002676:	77a2                	ld	a5,40(sp)
    80002678:	6762                	ld	a4,24(sp)
    8000267a:	eb98                	sd	a4,16(a5)
    8000267c:	77a2                	ld	a5,40(sp)
    8000267e:	6762                	ld	a4,24(sp)
    80002680:	ef98                	sd	a4,24(a5)
    80002682:	77a2                	ld	a5,40(sp)
    80002684:	01615703          	lhu	a4,22(sp)
    80002688:	02e79223          	sh	a4,36(a5)
    8000268c:	77a2                	ld	a5,40(sp)
    8000268e:	01615703          	lhu	a4,22(sp)
    80002692:	02e79123          	sh	a4,34(a5)
    80002696:	77a2                	ld	a5,40(sp)
    80002698:	01415703          	lhu	a4,20(sp)
    8000269c:	02e79023          	sh	a4,32(a5)
    800026a0:	7522                	ld	a0,40(sp)
    800026a2:	176000ef          	jal	80002818 <OS_MemDbgListAdd>
    800026a6:	00009797          	auipc	a5,0x9
    800026aa:	28a78793          	add	a5,a5,650 # 8000b930 <OSMemQty>
    800026ae:	0007d783          	lhu	a5,0(a5)
    800026b2:	2785                	addw	a5,a5,1
    800026b4:	03079713          	sll	a4,a5,0x30
    800026b8:	9341                	srl	a4,a4,0x30
    800026ba:	00009797          	auipc	a5,0x9
    800026be:	27678793          	add	a5,a5,630 # 8000b930 <OSMemQty>
    800026c2:	00e79023          	sh	a4,0(a5)
    800026c6:	6506                	ld	a0,64(sp)
    800026c8:	c53fe0ef          	jal	8000131a <CPU_SR_Restore>
    800026cc:	67a2                	ld	a5,8(sp)
    800026ce:	0007a023          	sw	zero,0(a5)
    800026d2:	70a6                	ld	ra,104(sp)
    800026d4:	6165                	add	sp,sp,112
    800026d6:	8082                	ret

00000000800026d8 <OSMemGet>:
    800026d8:	7179                	add	sp,sp,-48
    800026da:	f406                	sd	ra,40(sp)
    800026dc:	e42a                	sd	a0,8(sp)
    800026de:	e02e                	sd	a1,0(sp)
    800026e0:	ec02                	sd	zero,24(sp)
    800026e2:	67a2                	ld	a5,8(sp)
    800026e4:	eb81                	bnez	a5,800026f4 <OSMemGet+0x1c>
    800026e6:	6782                	ld	a5,0(sp)
    800026e8:	6715                	lui	a4,0x5
    800026ea:	6bf70713          	add	a4,a4,1727 # 56bf <CPU_MSTATUS_MIE+0x56b7>
    800026ee:	c398                	sw	a4,0(a5)
    800026f0:	4781                	li	a5,0
    800026f2:	a895                	j	80002766 <OSMemGet+0x8e>
    800026f4:	67a2                	ld	a5,8(sp)
    800026f6:	439c                	lw	a5,0(a5)
    800026f8:	873e                	mv	a4,a5
    800026fa:	204d47b7          	lui	a5,0x204d4
    800026fe:	54d78793          	add	a5,a5,1357 # 204d454d <CPU_MSTATUS_MIE+0x204d4545>
    80002702:	00f70963          	beq	a4,a5,80002714 <OSMemGet+0x3c>
    80002706:	6782                	ld	a5,0(sp)
    80002708:	6719                	lui	a4,0x6
    8000270a:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    8000270e:	c398                	sw	a4,0(a5)
    80002710:	4781                	li	a5,0
    80002712:	a891                	j	80002766 <OSMemGet+0x8e>
    80002714:	bfbfe0ef          	jal	8000130e <CPU_SR_Save>
    80002718:	ec2a                	sd	a0,24(sp)
    8000271a:	67a2                	ld	a5,8(sp)
    8000271c:	0247d783          	lhu	a5,36(a5)
    80002720:	eb99                	bnez	a5,80002736 <OSMemGet+0x5e>
    80002722:	6562                	ld	a0,24(sp)
    80002724:	bf7fe0ef          	jal	8000131a <CPU_SR_Restore>
    80002728:	6782                	ld	a5,0(sp)
    8000272a:	6715                	lui	a4,0x5
    8000272c:	6c270713          	add	a4,a4,1730 # 56c2 <CPU_MSTATUS_MIE+0x56ba>
    80002730:	c398                	sw	a4,0(a5)
    80002732:	4781                	li	a5,0
    80002734:	a80d                	j	80002766 <OSMemGet+0x8e>
    80002736:	67a2                	ld	a5,8(sp)
    80002738:	6f9c                	ld	a5,24(a5)
    8000273a:	e83e                	sd	a5,16(sp)
    8000273c:	67c2                	ld	a5,16(sp)
    8000273e:	6398                	ld	a4,0(a5)
    80002740:	67a2                	ld	a5,8(sp)
    80002742:	ef98                	sd	a4,24(a5)
    80002744:	67a2                	ld	a5,8(sp)
    80002746:	0247d783          	lhu	a5,36(a5)
    8000274a:	37fd                	addw	a5,a5,-1
    8000274c:	03079713          	sll	a4,a5,0x30
    80002750:	9341                	srl	a4,a4,0x30
    80002752:	67a2                	ld	a5,8(sp)
    80002754:	02e79223          	sh	a4,36(a5)
    80002758:	6562                	ld	a0,24(sp)
    8000275a:	bc1fe0ef          	jal	8000131a <CPU_SR_Restore>
    8000275e:	6782                	ld	a5,0(sp)
    80002760:	0007a023          	sw	zero,0(a5)
    80002764:	67c2                	ld	a5,16(sp)
    80002766:	853e                	mv	a0,a5
    80002768:	70a2                	ld	ra,40(sp)
    8000276a:	6145                	add	sp,sp,48
    8000276c:	8082                	ret

000000008000276e <OSMemPut>:
    8000276e:	7139                	add	sp,sp,-64
    80002770:	fc06                	sd	ra,56(sp)
    80002772:	ec2a                	sd	a0,24(sp)
    80002774:	e82e                	sd	a1,16(sp)
    80002776:	e432                	sd	a2,8(sp)
    80002778:	f402                	sd	zero,40(sp)
    8000277a:	67e2                	ld	a5,24(sp)
    8000277c:	e799                	bnez	a5,8000278a <OSMemPut+0x1c>
    8000277e:	67a2                	ld	a5,8(sp)
    80002780:	6715                	lui	a4,0x5
    80002782:	6bf70713          	add	a4,a4,1727 # 56bf <CPU_MSTATUS_MIE+0x56b7>
    80002786:	c398                	sw	a4,0(a5)
    80002788:	a069                	j	80002812 <OSMemPut+0xa4>
    8000278a:	67c2                	ld	a5,16(sp)
    8000278c:	e799                	bnez	a5,8000279a <OSMemPut+0x2c>
    8000278e:	67a2                	ld	a5,8(sp)
    80002790:	6715                	lui	a4,0x5
    80002792:	6be70713          	add	a4,a4,1726 # 56be <CPU_MSTATUS_MIE+0x56b6>
    80002796:	c398                	sw	a4,0(a5)
    80002798:	a8ad                	j	80002812 <OSMemPut+0xa4>
    8000279a:	67e2                	ld	a5,24(sp)
    8000279c:	439c                	lw	a5,0(a5)
    8000279e:	873e                	mv	a4,a5
    800027a0:	204d47b7          	lui	a5,0x204d4
    800027a4:	54d78793          	add	a5,a5,1357 # 204d454d <CPU_MSTATUS_MIE+0x204d4545>
    800027a8:	00f70863          	beq	a4,a5,800027b8 <OSMemPut+0x4a>
    800027ac:	67a2                	ld	a5,8(sp)
    800027ae:	6719                	lui	a4,0x6
    800027b0:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    800027b4:	c398                	sw	a4,0(a5)
    800027b6:	a8b1                	j	80002812 <OSMemPut+0xa4>
    800027b8:	b57fe0ef          	jal	8000130e <CPU_SR_Save>
    800027bc:	f42a                	sd	a0,40(sp)
    800027be:	67e2                	ld	a5,24(sp)
    800027c0:	0247d703          	lhu	a4,36(a5)
    800027c4:	67e2                	ld	a5,24(sp)
    800027c6:	0227d783          	lhu	a5,34(a5)
    800027ca:	2701                	sext.w	a4,a4
    800027cc:	2781                	sext.w	a5,a5
    800027ce:	00f76b63          	bltu	a4,a5,800027e4 <OSMemPut+0x76>
    800027d2:	7522                	ld	a0,40(sp)
    800027d4:	b47fe0ef          	jal	8000131a <CPU_SR_Restore>
    800027d8:	67a2                	ld	a5,8(sp)
    800027da:	6715                	lui	a4,0x5
    800027dc:	6ba70713          	add	a4,a4,1722 # 56ba <CPU_MSTATUS_MIE+0x56b2>
    800027e0:	c398                	sw	a4,0(a5)
    800027e2:	a805                	j	80002812 <OSMemPut+0xa4>
    800027e4:	67e2                	ld	a5,24(sp)
    800027e6:	6f98                	ld	a4,24(a5)
    800027e8:	67c2                	ld	a5,16(sp)
    800027ea:	e398                	sd	a4,0(a5)
    800027ec:	67e2                	ld	a5,24(sp)
    800027ee:	6742                	ld	a4,16(sp)
    800027f0:	ef98                	sd	a4,24(a5)
    800027f2:	67e2                	ld	a5,24(sp)
    800027f4:	0247d783          	lhu	a5,36(a5)
    800027f8:	2785                	addw	a5,a5,1
    800027fa:	03079713          	sll	a4,a5,0x30
    800027fe:	9341                	srl	a4,a4,0x30
    80002800:	67e2                	ld	a5,24(sp)
    80002802:	02e79223          	sh	a4,36(a5)
    80002806:	7522                	ld	a0,40(sp)
    80002808:	b13fe0ef          	jal	8000131a <CPU_SR_Restore>
    8000280c:	67a2                	ld	a5,8(sp)
    8000280e:	0007a023          	sw	zero,0(a5)
    80002812:	70e2                	ld	ra,56(sp)
    80002814:	6121                	add	sp,sp,64
    80002816:	8082                	ret

0000000080002818 <OS_MemDbgListAdd>:
    80002818:	1141                	add	sp,sp,-16
    8000281a:	e42a                	sd	a0,8(sp)
    8000281c:	67a2                	ld	a5,8(sp)
    8000281e:	0207b423          	sd	zero,40(a5)
    80002822:	00009797          	auipc	a5,0x9
    80002826:	10678793          	add	a5,a5,262 # 8000b928 <OSMemDbgListPtr>
    8000282a:	639c                	ld	a5,0(a5)
    8000282c:	e789                	bnez	a5,80002836 <OS_MemDbgListAdd+0x1e>
    8000282e:	67a2                	ld	a5,8(sp)
    80002830:	0207b823          	sd	zero,48(a5)
    80002834:	a839                	j	80002852 <OS_MemDbgListAdd+0x3a>
    80002836:	00009797          	auipc	a5,0x9
    8000283a:	0f278793          	add	a5,a5,242 # 8000b928 <OSMemDbgListPtr>
    8000283e:	6398                	ld	a4,0(a5)
    80002840:	67a2                	ld	a5,8(sp)
    80002842:	fb98                	sd	a4,48(a5)
    80002844:	00009797          	auipc	a5,0x9
    80002848:	0e478793          	add	a5,a5,228 # 8000b928 <OSMemDbgListPtr>
    8000284c:	639c                	ld	a5,0(a5)
    8000284e:	6722                	ld	a4,8(sp)
    80002850:	f798                	sd	a4,40(a5)
    80002852:	00009797          	auipc	a5,0x9
    80002856:	0d678793          	add	a5,a5,214 # 8000b928 <OSMemDbgListPtr>
    8000285a:	6722                	ld	a4,8(sp)
    8000285c:	e398                	sd	a4,0(a5)
    8000285e:	0001                	nop
    80002860:	0141                	add	sp,sp,16
    80002862:	8082                	ret

0000000080002864 <OS_MemInit>:
    80002864:	1141                	add	sp,sp,-16
    80002866:	e42a                	sd	a0,8(sp)
    80002868:	00009797          	auipc	a5,0x9
    8000286c:	0c078793          	add	a5,a5,192 # 8000b928 <OSMemDbgListPtr>
    80002870:	0007b023          	sd	zero,0(a5)
    80002874:	00009797          	auipc	a5,0x9
    80002878:	0bc78793          	add	a5,a5,188 # 8000b930 <OSMemQty>
    8000287c:	00079023          	sh	zero,0(a5)
    80002880:	67a2                	ld	a5,8(sp)
    80002882:	0007a023          	sw	zero,0(a5)
    80002886:	0001                	nop
    80002888:	0141                	add	sp,sp,16
    8000288a:	8082                	ret

000000008000288c <OSStatReset>:
    8000288c:	7139                	add	sp,sp,-64
    8000288e:	fc06                	sd	ra,56(sp)
    80002890:	e42a                	sd	a0,8(sp)
    80002892:	ec02                	sd	zero,24(sp)
    80002894:	a7bfe0ef          	jal	8000130e <CPU_SR_Save>
    80002898:	ec2a                	sd	a0,24(sp)
    8000289a:	00009797          	auipc	a5,0x9
    8000289e:	0dc78793          	add	a5,a5,220 # 8000b976 <OSStatTaskCPUUsageMax>
    800028a2:	00079023          	sh	zero,0(a5)
    800028a6:	0001a797          	auipc	a5,0x1a
    800028aa:	59a78793          	add	a5,a5,1434 # 8001ce40 <OSMsgPool>
    800028ae:	00079623          	sh	zero,12(a5)
    800028b2:	6562                	ld	a0,24(sp)
    800028b4:	a67fe0ef          	jal	8000131a <CPU_SR_Restore>
    800028b8:	a57fe0ef          	jal	8000130e <CPU_SR_Save>
    800028bc:	ec2a                	sd	a0,24(sp)
    800028be:	00009797          	auipc	a5,0x9
    800028c2:	0d278793          	add	a5,a5,210 # 8000b990 <OSTaskDbgListPtr>
    800028c6:	639c                	ld	a5,0(a5)
    800028c8:	f43e                	sd	a5,40(sp)
    800028ca:	6562                	ld	a0,24(sp)
    800028cc:	a4ffe0ef          	jal	8000131a <CPU_SR_Restore>
    800028d0:	a0b9                	j	8000291e <OSStatReset+0x92>
    800028d2:	a3dfe0ef          	jal	8000130e <CPU_SR_Save>
    800028d6:	ec2a                	sd	a0,24(sp)
    800028d8:	77a2                	ld	a5,40(sp)
    800028da:	0c07a623          	sw	zero,204(a5)
    800028de:	77a2                	ld	a5,40(sp)
    800028e0:	1007a023          	sw	zero,256(a5)
    800028e4:	77a2                	ld	a5,40(sp)
    800028e6:	0e07a423          	sw	zero,232(a5)
    800028ea:	77a2                	ld	a5,40(sp)
    800028ec:	0e079223          	sh	zero,228(a5)
    800028f0:	77a2                	ld	a5,40(sp)
    800028f2:	0e079323          	sh	zero,230(a5)
    800028f6:	77a2                	ld	a5,40(sp)
    800028f8:	0e07aa23          	sw	zero,244(a5)
    800028fc:	77a2                	ld	a5,40(sp)
    800028fe:	0e07ac23          	sw	zero,248(a5)
    80002902:	77a2                	ld	a5,40(sp)
    80002904:	0b078793          	add	a5,a5,176
    80002908:	e83e                	sd	a5,16(sp)
    8000290a:	67c2                	ld	a5,16(sp)
    8000290c:	00079a23          	sh	zero,20(a5)
    80002910:	77a2                	ld	a5,40(sp)
    80002912:	1207b783          	ld	a5,288(a5)
    80002916:	f43e                	sd	a5,40(sp)
    80002918:	6562                	ld	a0,24(sp)
    8000291a:	a01fe0ef          	jal	8000131a <CPU_SR_Restore>
    8000291e:	77a2                	ld	a5,40(sp)
    80002920:	fbcd                	bnez	a5,800028d2 <OSStatReset+0x46>
    80002922:	9edfe0ef          	jal	8000130e <CPU_SR_Save>
    80002926:	ec2a                	sd	a0,24(sp)
    80002928:	00009797          	auipc	a5,0x9
    8000292c:	02878793          	add	a5,a5,40 # 8000b950 <OSQDbgListPtr>
    80002930:	639c                	ld	a5,0(a5)
    80002932:	f03e                	sd	a5,32(sp)
    80002934:	6562                	ld	a0,24(sp)
    80002936:	9e5fe0ef          	jal	8000131a <CPU_SR_Restore>
    8000293a:	a00d                	j	8000295c <OSStatReset+0xd0>
    8000293c:	9d3fe0ef          	jal	8000130e <CPU_SR_Save>
    80002940:	ec2a                	sd	a0,24(sp)
    80002942:	7782                	ld	a5,32(sp)
    80002944:	04078793          	add	a5,a5,64
    80002948:	e83e                	sd	a5,16(sp)
    8000294a:	67c2                	ld	a5,16(sp)
    8000294c:	00079a23          	sh	zero,20(a5)
    80002950:	7782                	ld	a5,32(sp)
    80002952:	7b9c                	ld	a5,48(a5)
    80002954:	f03e                	sd	a5,32(sp)
    80002956:	6562                	ld	a0,24(sp)
    80002958:	9c3fe0ef          	jal	8000131a <CPU_SR_Restore>
    8000295c:	7782                	ld	a5,32(sp)
    8000295e:	fff9                	bnez	a5,8000293c <OSStatReset+0xb0>
    80002960:	67a2                	ld	a5,8(sp)
    80002962:	0007a023          	sw	zero,0(a5)
    80002966:	0001                	nop
    80002968:	70e2                	ld	ra,56(sp)
    8000296a:	6121                	add	sp,sp,64
    8000296c:	8082                	ret

000000008000296e <OSStatTaskCPUUsageInit>:
    8000296e:	7139                	add	sp,sp,-64
    80002970:	fc06                	sd	ra,56(sp)
    80002972:	e42a                	sd	a0,8(sp)
    80002974:	f002                	sd	zero,32(sp)
    80002976:	ce02                	sw	zero,28(sp)
    80002978:	00009797          	auipc	a5,0x9
    8000297c:	f9578793          	add	a5,a5,-107 # 8000b90d <OSRunning>
    80002980:	0007c783          	lbu	a5,0(a5)
    80002984:	873e                	mv	a4,a5
    80002986:	4785                	li	a5,1
    80002988:	00f70863          	beq	a4,a5,80002998 <OSStatTaskCPUUsageInit+0x2a>
    8000298c:	67a2                	ld	a5,8(sp)
    8000298e:	6719                	lui	a4,0x6
    80002990:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80002994:	c398                	sw	a4,0(a5)
    80002996:	a8ed                	j	80002a90 <OSStatTaskCPUUsageInit+0x122>
    80002998:	087c                	add	a5,sp,28
    8000299a:	85be                	mv	a1,a5
    8000299c:	0001b517          	auipc	a0,0x1b
    800029a0:	c9450513          	add	a0,a0,-876 # 8001d630 <OSTmrTaskTCB>
    800029a4:	5cf010ef          	jal	80004772 <OSTaskSuspend>
    800029a8:	47f2                	lw	a5,28(sp)
    800029aa:	c789                	beqz	a5,800029b4 <OSStatTaskCPUUsageInit+0x46>
    800029ac:	4772                	lw	a4,28(sp)
    800029ae:	67a2                	ld	a5,8(sp)
    800029b0:	c398                	sw	a4,0(a5)
    800029b2:	a8f9                	j	80002a90 <OSStatTaskCPUUsageInit+0x122>
    800029b4:	087c                	add	a5,sp,28
    800029b6:	863e                	mv	a2,a5
    800029b8:	4581                	li	a1,0
    800029ba:	4509                	li	a0,2
    800029bc:	247040ef          	jal	80007402 <OSTimeDly>
    800029c0:	47f2                	lw	a5,28(sp)
    800029c2:	c789                	beqz	a5,800029cc <OSStatTaskCPUUsageInit+0x5e>
    800029c4:	4772                	lw	a4,28(sp)
    800029c6:	67a2                	ld	a5,8(sp)
    800029c8:	c398                	sw	a4,0(a5)
    800029ca:	a0d9                	j	80002a90 <OSStatTaskCPUUsageInit+0x122>
    800029cc:	943fe0ef          	jal	8000130e <CPU_SR_Save>
    800029d0:	f02a                	sd	a0,32(sp)
    800029d2:	00009797          	auipc	a5,0x9
    800029d6:	fa678793          	add	a5,a5,-90 # 8000b978 <OSStatTaskCtr>
    800029da:	0007a023          	sw	zero,0(a5)
    800029de:	7502                	ld	a0,32(sp)
    800029e0:	93bfe0ef          	jal	8000131a <CPU_SR_Restore>
    800029e4:	d602                	sw	zero,44(sp)
    800029e6:	00008797          	auipc	a5,0x8
    800029ea:	69a78793          	add	a5,a5,1690 # 8000b080 <OSCfg_TickRate_Hz>
    800029ee:	4398                	lw	a4,0(a5)
    800029f0:	00008797          	auipc	a5,0x8
    800029f4:	66478793          	add	a5,a5,1636 # 8000b054 <OSCfg_StatTaskRate_Hz>
    800029f8:	439c                	lw	a5,0(a5)
    800029fa:	00e7ff63          	bgeu	a5,a4,80002a18 <OSStatTaskCPUUsageInit+0xaa>
    800029fe:	00008797          	auipc	a5,0x8
    80002a02:	68278793          	add	a5,a5,1666 # 8000b080 <OSCfg_TickRate_Hz>
    80002a06:	4398                	lw	a4,0(a5)
    80002a08:	00008797          	auipc	a5,0x8
    80002a0c:	64c78793          	add	a5,a5,1612 # 8000b054 <OSCfg_StatTaskRate_Hz>
    80002a10:	439c                	lw	a5,0(a5)
    80002a12:	02f757bb          	divuw	a5,a4,a5
    80002a16:	d63e                	sw	a5,44(sp)
    80002a18:	57b2                	lw	a5,44(sp)
    80002a1a:	2781                	sext.w	a5,a5
    80002a1c:	eb99                	bnez	a5,80002a32 <OSStatTaskCPUUsageInit+0xc4>
    80002a1e:	00008797          	auipc	a5,0x8
    80002a22:	66278793          	add	a5,a5,1634 # 8000b080 <OSCfg_TickRate_Hz>
    80002a26:	439c                	lw	a5,0(a5)
    80002a28:	873e                	mv	a4,a5
    80002a2a:	47a9                	li	a5,10
    80002a2c:	02f757bb          	divuw	a5,a4,a5
    80002a30:	d63e                	sw	a5,44(sp)
    80002a32:	0878                	add	a4,sp,28
    80002a34:	57b2                	lw	a5,44(sp)
    80002a36:	863a                	mv	a2,a4
    80002a38:	4581                	li	a1,0
    80002a3a:	853e                	mv	a0,a5
    80002a3c:	1c7040ef          	jal	80007402 <OSTimeDly>
    80002a40:	087c                	add	a5,sp,28
    80002a42:	85be                	mv	a1,a5
    80002a44:	0001b517          	auipc	a0,0x1b
    80002a48:	bec50513          	add	a0,a0,-1044 # 8001d630 <OSTmrTaskTCB>
    80002a4c:	5d0010ef          	jal	8000401c <OSTaskResume>
    80002a50:	47f2                	lw	a5,28(sp)
    80002a52:	c789                	beqz	a5,80002a5c <OSStatTaskCPUUsageInit+0xee>
    80002a54:	4772                	lw	a4,28(sp)
    80002a56:	67a2                	ld	a5,8(sp)
    80002a58:	c398                	sw	a4,0(a5)
    80002a5a:	a81d                	j	80002a90 <OSStatTaskCPUUsageInit+0x122>
    80002a5c:	8b3fe0ef          	jal	8000130e <CPU_SR_Save>
    80002a60:	f02a                	sd	a0,32(sp)
    80002a62:	00009797          	auipc	a5,0x9
    80002a66:	f1678793          	add	a5,a5,-234 # 8000b978 <OSStatTaskCtr>
    80002a6a:	4398                	lw	a4,0(a5)
    80002a6c:	00009797          	auipc	a5,0x9
    80002a70:	f1078793          	add	a5,a5,-240 # 8000b97c <OSStatTaskCtrMax>
    80002a74:	c398                	sw	a4,0(a5)
    80002a76:	00009797          	auipc	a5,0x9
    80002a7a:	f0e78793          	add	a5,a5,-242 # 8000b984 <OSStatTaskRdy>
    80002a7e:	4705                	li	a4,1
    80002a80:	00e78023          	sb	a4,0(a5)
    80002a84:	7502                	ld	a0,32(sp)
    80002a86:	895fe0ef          	jal	8000131a <CPU_SR_Restore>
    80002a8a:	67a2                	ld	a5,8(sp)
    80002a8c:	0007a023          	sw	zero,0(a5)
    80002a90:	70e2                	ld	ra,56(sp)
    80002a92:	6121                	add	sp,sp,64
    80002a94:	8082                	ret

0000000080002a96 <OS_StatTask>:
    80002a96:	7119                	add	sp,sp,-128
    80002a98:	fc86                	sd	ra,120(sp)
    80002a9a:	e42a                	sd	a0,8(sp)
    80002a9c:	f402                	sd	zero,40(sp)
    80002a9e:	a839                	j	80002abc <OS_StatTask+0x26>
    80002aa0:	00008797          	auipc	a5,0x8
    80002aa4:	5b478793          	add	a5,a5,1460 # 8000b054 <OSCfg_StatTaskRate_Hz>
    80002aa8:	439c                	lw	a5,0(a5)
    80002aaa:	0017979b          	sllw	a5,a5,0x1
    80002aae:	2781                	sext.w	a5,a5
    80002ab0:	0878                	add	a4,sp,28
    80002ab2:	863a                	mv	a2,a4
    80002ab4:	4581                	li	a1,0
    80002ab6:	853e                	mv	a0,a5
    80002ab8:	14b040ef          	jal	80007402 <OSTimeDly>
    80002abc:	00009797          	auipc	a5,0x9
    80002ac0:	ec878793          	add	a5,a5,-312 # 8000b984 <OSStatTaskRdy>
    80002ac4:	0007c783          	lbu	a5,0(a5)
    80002ac8:	873e                	mv	a4,a5
    80002aca:	4785                	li	a5,1
    80002acc:	fcf71ae3          	bne	a4,a5,80002aa0 <OS_StatTask+0xa>
    80002ad0:	087c                	add	a5,sp,28
    80002ad2:	853e                	mv	a0,a5
    80002ad4:	db9ff0ef          	jal	8000288c <OSStatReset>
    80002ad8:	c282                	sw	zero,68(sp)
    80002ada:	00008797          	auipc	a5,0x8
    80002ade:	5a678793          	add	a5,a5,1446 # 8000b080 <OSCfg_TickRate_Hz>
    80002ae2:	4398                	lw	a4,0(a5)
    80002ae4:	00008797          	auipc	a5,0x8
    80002ae8:	57078793          	add	a5,a5,1392 # 8000b054 <OSCfg_StatTaskRate_Hz>
    80002aec:	439c                	lw	a5,0(a5)
    80002aee:	00e7ff63          	bgeu	a5,a4,80002b0c <OS_StatTask+0x76>
    80002af2:	00008797          	auipc	a5,0x8
    80002af6:	58e78793          	add	a5,a5,1422 # 8000b080 <OSCfg_TickRate_Hz>
    80002afa:	4398                	lw	a4,0(a5)
    80002afc:	00008797          	auipc	a5,0x8
    80002b00:	55878793          	add	a5,a5,1368 # 8000b054 <OSCfg_StatTaskRate_Hz>
    80002b04:	439c                	lw	a5,0(a5)
    80002b06:	02f757bb          	divuw	a5,a4,a5
    80002b0a:	c2be                	sw	a5,68(sp)
    80002b0c:	4796                	lw	a5,68(sp)
    80002b0e:	2781                	sext.w	a5,a5
    80002b10:	eb99                	bnez	a5,80002b26 <OS_StatTask+0x90>
    80002b12:	00008797          	auipc	a5,0x8
    80002b16:	56e78793          	add	a5,a5,1390 # 8000b080 <OSCfg_TickRate_Hz>
    80002b1a:	439c                	lw	a5,0(a5)
    80002b1c:	873e                	mv	a4,a5
    80002b1e:	47a9                	li	a5,10
    80002b20:	02f757bb          	divuw	a5,a4,a5
    80002b24:	c2be                	sw	a5,68(sp)
    80002b26:	fe8fe0ef          	jal	8000130e <CPU_SR_Save>
    80002b2a:	f42a                	sd	a0,40(sp)
    80002b2c:	00009797          	auipc	a5,0x9
    80002b30:	e4c78793          	add	a5,a5,-436 # 8000b978 <OSStatTaskCtr>
    80002b34:	4398                	lw	a4,0(a5)
    80002b36:	00009797          	auipc	a5,0x9
    80002b3a:	e4a78793          	add	a5,a5,-438 # 8000b980 <OSStatTaskCtrRun>
    80002b3e:	c398                	sw	a4,0(a5)
    80002b40:	00009797          	auipc	a5,0x9
    80002b44:	e3878793          	add	a5,a5,-456 # 8000b978 <OSStatTaskCtr>
    80002b48:	0007a023          	sw	zero,0(a5)
    80002b4c:	7522                	ld	a0,40(sp)
    80002b4e:	fccfe0ef          	jal	8000131a <CPU_SR_Restore>
    80002b52:	00009797          	auipc	a5,0x9
    80002b56:	e2a78793          	add	a5,a5,-470 # 8000b97c <OSStatTaskCtrMax>
    80002b5a:	4398                	lw	a4,0(a5)
    80002b5c:	00009797          	auipc	a5,0x9
    80002b60:	e2478793          	add	a5,a5,-476 # 8000b980 <OSStatTaskCtrRun>
    80002b64:	439c                	lw	a5,0(a5)
    80002b66:	12e7f563          	bgeu	a5,a4,80002c90 <OS_StatTask+0x1fa>
    80002b6a:	00009797          	auipc	a5,0x9
    80002b6e:	e1278793          	add	a5,a5,-494 # 8000b97c <OSStatTaskCtrMax>
    80002b72:	439c                	lw	a5,0(a5)
    80002b74:	873e                	mv	a4,a5
    80002b76:	000627b7          	lui	a5,0x62
    80002b7a:	a7f78793          	add	a5,a5,-1409 # 61a7f <CPU_MSTATUS_MIE+0x61a77>
    80002b7e:	00e7e963          	bltu	a5,a4,80002b90 <OS_StatTask+0xfa>
    80002b82:	6789                	lui	a5,0x2
    80002b84:	71078793          	add	a5,a5,1808 # 2710 <CPU_MSTATUS_MIE+0x2708>
    80002b88:	c6be                	sw	a5,76(sp)
    80002b8a:	4785                	li	a5,1
    80002b8c:	c4be                	sw	a5,72(sp)
    80002b8e:	a8b5                	j	80002c0a <OS_StatTask+0x174>
    80002b90:	00009797          	auipc	a5,0x9
    80002b94:	dec78793          	add	a5,a5,-532 # 8000b97c <OSStatTaskCtrMax>
    80002b98:	439c                	lw	a5,0(a5)
    80002b9a:	873e                	mv	a4,a5
    80002b9c:	003d17b7          	lui	a5,0x3d1
    80002ba0:	8ff78793          	add	a5,a5,-1793 # 3d08ff <CPU_MSTATUS_MIE+0x3d08f7>
    80002ba4:	00e7e863          	bltu	a5,a4,80002bb4 <OS_StatTask+0x11e>
    80002ba8:	3e800793          	li	a5,1000
    80002bac:	c6be                	sw	a5,76(sp)
    80002bae:	47a9                	li	a5,10
    80002bb0:	c4be                	sw	a5,72(sp)
    80002bb2:	a8a1                	j	80002c0a <OS_StatTask+0x174>
    80002bb4:	00009797          	auipc	a5,0x9
    80002bb8:	dc878793          	add	a5,a5,-568 # 8000b97c <OSStatTaskCtrMax>
    80002bbc:	439c                	lw	a5,0(a5)
    80002bbe:	873e                	mv	a4,a5
    80002bc0:	026267b7          	lui	a5,0x2626
    80002bc4:	9ff78793          	add	a5,a5,-1537 # 26259ff <CPU_MSTATUS_MIE+0x26259f7>
    80002bc8:	00e7e963          	bltu	a5,a4,80002bda <OS_StatTask+0x144>
    80002bcc:	06400793          	li	a5,100
    80002bd0:	c6be                	sw	a5,76(sp)
    80002bd2:	06400793          	li	a5,100
    80002bd6:	c4be                	sw	a5,72(sp)
    80002bd8:	a80d                	j	80002c0a <OS_StatTask+0x174>
    80002bda:	00009797          	auipc	a5,0x9
    80002bde:	da278793          	add	a5,a5,-606 # 8000b97c <OSStatTaskCtrMax>
    80002be2:	439c                	lw	a5,0(a5)
    80002be4:	873e                	mv	a4,a5
    80002be6:	17d787b7          	lui	a5,0x17d78
    80002bea:	3ff78793          	add	a5,a5,1023 # 17d783ff <CPU_MSTATUS_MIE+0x17d783f7>
    80002bee:	00e7e863          	bltu	a5,a4,80002bfe <OS_StatTask+0x168>
    80002bf2:	47a9                	li	a5,10
    80002bf4:	c6be                	sw	a5,76(sp)
    80002bf6:	3e800793          	li	a5,1000
    80002bfa:	c4be                	sw	a5,72(sp)
    80002bfc:	a039                	j	80002c0a <OS_StatTask+0x174>
    80002bfe:	4785                	li	a5,1
    80002c00:	c6be                	sw	a5,76(sp)
    80002c02:	6789                	lui	a5,0x2
    80002c04:	71078793          	add	a5,a5,1808 # 2710 <CPU_MSTATUS_MIE+0x2708>
    80002c08:	c4be                	sw	a5,72(sp)
    80002c0a:	00009797          	auipc	a5,0x9
    80002c0e:	d7278793          	add	a5,a5,-654 # 8000b97c <OSStatTaskCtrMax>
    80002c12:	439c                	lw	a5,0(a5)
    80002c14:	4726                	lw	a4,72(sp)
    80002c16:	02e7d7bb          	divuw	a5,a5,a4
    80002c1a:	d23e                	sw	a5,36(sp)
    80002c1c:	00009797          	auipc	a5,0x9
    80002c20:	d6478793          	add	a5,a5,-668 # 8000b980 <OSStatTaskCtrRun>
    80002c24:	439c                	lw	a5,0(a5)
    80002c26:	4736                	lw	a4,76(sp)
    80002c28:	02f707bb          	mulw	a5,a4,a5
    80002c2c:	2781                	sext.w	a5,a5
    80002c2e:	5712                	lw	a4,36(sp)
    80002c30:	02e7d7bb          	divuw	a5,a5,a4
    80002c34:	2781                	sext.w	a5,a5
    80002c36:	17c2                	sll	a5,a5,0x30
    80002c38:	93c1                	srl	a5,a5,0x30
    80002c3a:	6709                	lui	a4,0x2
    80002c3c:	7107071b          	addw	a4,a4,1808 # 2710 <CPU_MSTATUS_MIE+0x2708>
    80002c40:	40f707bb          	subw	a5,a4,a5
    80002c44:	03079713          	sll	a4,a5,0x30
    80002c48:	9341                	srl	a4,a4,0x30
    80002c4a:	00009797          	auipc	a5,0x9
    80002c4e:	d2a78793          	add	a5,a5,-726 # 8000b974 <OSStatTaskCPUUsage>
    80002c52:	00e79023          	sh	a4,0(a5)
    80002c56:	00009797          	auipc	a5,0x9
    80002c5a:	d2078793          	add	a5,a5,-736 # 8000b976 <OSStatTaskCPUUsageMax>
    80002c5e:	0007d703          	lhu	a4,0(a5)
    80002c62:	00009797          	auipc	a5,0x9
    80002c66:	d1278793          	add	a5,a5,-750 # 8000b974 <OSStatTaskCPUUsage>
    80002c6a:	0007d783          	lhu	a5,0(a5)
    80002c6e:	2701                	sext.w	a4,a4
    80002c70:	2781                	sext.w	a5,a5
    80002c72:	02f77563          	bgeu	a4,a5,80002c9c <OS_StatTask+0x206>
    80002c76:	00009797          	auipc	a5,0x9
    80002c7a:	cfe78793          	add	a5,a5,-770 # 8000b974 <OSStatTaskCPUUsage>
    80002c7e:	0007d703          	lhu	a4,0(a5)
    80002c82:	00009797          	auipc	a5,0x9
    80002c86:	cf478793          	add	a5,a5,-780 # 8000b976 <OSStatTaskCPUUsageMax>
    80002c8a:	00e79023          	sh	a4,0(a5)
    80002c8e:	a039                	j	80002c9c <OS_StatTask+0x206>
    80002c90:	00009797          	auipc	a5,0x9
    80002c94:	ce478793          	add	a5,a5,-796 # 8000b974 <OSStatTaskCPUUsage>
    80002c98:	00079023          	sh	zero,0(a5)
    80002c9c:	c75fe0ef          	jal	80001910 <OSStatTaskHook>
    80002ca0:	d482                	sw	zero,104(sp)
    80002ca2:	e6cfe0ef          	jal	8000130e <CPU_SR_Save>
    80002ca6:	f42a                	sd	a0,40(sp)
    80002ca8:	00009797          	auipc	a5,0x9
    80002cac:	ce878793          	add	a5,a5,-792 # 8000b990 <OSTaskDbgListPtr>
    80002cb0:	639c                	ld	a5,0(a5)
    80002cb2:	e8be                	sd	a5,80(sp)
    80002cb4:	7522                	ld	a0,40(sp)
    80002cb6:	e64fe0ef          	jal	8000131a <CPU_SR_Restore>
    80002cba:	a081                	j	80002cfa <OS_StatTask+0x264>
    80002cbc:	e52fe0ef          	jal	8000130e <CPU_SR_Save>
    80002cc0:	f42a                	sd	a0,40(sp)
    80002cc2:	67c6                	ld	a5,80(sp)
    80002cc4:	0f47a703          	lw	a4,244(a5)
    80002cc8:	67c6                	ld	a5,80(sp)
    80002cca:	0ee7ac23          	sw	a4,248(a5)
    80002cce:	67c6                	ld	a5,80(sp)
    80002cd0:	0e07aa23          	sw	zero,244(a5)
    80002cd4:	7522                	ld	a0,40(sp)
    80002cd6:	e44fe0ef          	jal	8000131a <CPU_SR_Restore>
    80002cda:	67c6                	ld	a5,80(sp)
    80002cdc:	0f87a783          	lw	a5,248(a5)
    80002ce0:	5726                	lw	a4,104(sp)
    80002ce2:	9fb9                	addw	a5,a5,a4
    80002ce4:	d4be                	sw	a5,104(sp)
    80002ce6:	e28fe0ef          	jal	8000130e <CPU_SR_Save>
    80002cea:	f42a                	sd	a0,40(sp)
    80002cec:	67c6                	ld	a5,80(sp)
    80002cee:	1207b783          	ld	a5,288(a5)
    80002cf2:	e8be                	sd	a5,80(sp)
    80002cf4:	7522                	ld	a0,40(sp)
    80002cf6:	e24fe0ef          	jal	8000131a <CPU_SR_Restore>
    80002cfa:	67c6                	ld	a5,80(sp)
    80002cfc:	f3e1                	bnez	a5,80002cbc <OS_StatTask+0x226>
    80002cfe:	57a6                	lw	a5,104(sp)
    80002d00:	2781                	sext.w	a5,a5
    80002d02:	cfc1                	beqz	a5,80002d9a <OS_StatTask+0x304>
    80002d04:	57a6                	lw	a5,104(sp)
    80002d06:	0007871b          	sext.w	a4,a5
    80002d0a:	000627b7          	lui	a5,0x62
    80002d0e:	a7f78793          	add	a5,a5,-1409 # 61a7f <CPU_MSTATUS_MIE+0x61a77>
    80002d12:	00e7e963          	bltu	a5,a4,80002d24 <OS_StatTask+0x28e>
    80002d16:	6789                	lui	a5,0x2
    80002d18:	71078793          	add	a5,a5,1808 # 2710 <CPU_MSTATUS_MIE+0x2708>
    80002d1c:	d0be                	sw	a5,96(sp)
    80002d1e:	4785                	li	a5,1
    80002d20:	d2be                	sw	a5,100(sp)
    80002d22:	a0ad                	j	80002d8c <OS_StatTask+0x2f6>
    80002d24:	57a6                	lw	a5,104(sp)
    80002d26:	0007871b          	sext.w	a4,a5
    80002d2a:	003d17b7          	lui	a5,0x3d1
    80002d2e:	8ff78793          	add	a5,a5,-1793 # 3d08ff <CPU_MSTATUS_MIE+0x3d08f7>
    80002d32:	00e7e863          	bltu	a5,a4,80002d42 <OS_StatTask+0x2ac>
    80002d36:	3e800793          	li	a5,1000
    80002d3a:	d0be                	sw	a5,96(sp)
    80002d3c:	47a9                	li	a5,10
    80002d3e:	d2be                	sw	a5,100(sp)
    80002d40:	a0b1                	j	80002d8c <OS_StatTask+0x2f6>
    80002d42:	57a6                	lw	a5,104(sp)
    80002d44:	0007871b          	sext.w	a4,a5
    80002d48:	026267b7          	lui	a5,0x2626
    80002d4c:	9ff78793          	add	a5,a5,-1537 # 26259ff <CPU_MSTATUS_MIE+0x26259f7>
    80002d50:	00e7e963          	bltu	a5,a4,80002d62 <OS_StatTask+0x2cc>
    80002d54:	06400793          	li	a5,100
    80002d58:	d0be                	sw	a5,96(sp)
    80002d5a:	06400793          	li	a5,100
    80002d5e:	d2be                	sw	a5,100(sp)
    80002d60:	a035                	j	80002d8c <OS_StatTask+0x2f6>
    80002d62:	57a6                	lw	a5,104(sp)
    80002d64:	0007871b          	sext.w	a4,a5
    80002d68:	17d787b7          	lui	a5,0x17d78
    80002d6c:	3ff78793          	add	a5,a5,1023 # 17d783ff <CPU_MSTATUS_MIE+0x17d783f7>
    80002d70:	00e7e863          	bltu	a5,a4,80002d80 <OS_StatTask+0x2ea>
    80002d74:	47a9                	li	a5,10
    80002d76:	d0be                	sw	a5,96(sp)
    80002d78:	3e800793          	li	a5,1000
    80002d7c:	d2be                	sw	a5,100(sp)
    80002d7e:	a039                	j	80002d8c <OS_StatTask+0x2f6>
    80002d80:	4785                	li	a5,1
    80002d82:	d0be                	sw	a5,96(sp)
    80002d84:	6789                	lui	a5,0x2
    80002d86:	71078793          	add	a5,a5,1808 # 2710 <CPU_MSTATUS_MIE+0x2708>
    80002d8a:	d2be                	sw	a5,100(sp)
    80002d8c:	57a6                	lw	a5,104(sp)
    80002d8e:	873e                	mv	a4,a5
    80002d90:	5796                	lw	a5,100(sp)
    80002d92:	02f757bb          	divuw	a5,a4,a5
    80002d96:	cebe                	sw	a5,92(sp)
    80002d98:	a021                	j	80002da0 <OS_StatTask+0x30a>
    80002d9a:	d082                	sw	zero,96(sp)
    80002d9c:	4785                	li	a5,1
    80002d9e:	cebe                	sw	a5,92(sp)
    80002da0:	d6efe0ef          	jal	8000130e <CPU_SR_Save>
    80002da4:	f42a                	sd	a0,40(sp)
    80002da6:	00009797          	auipc	a5,0x9
    80002daa:	bea78793          	add	a5,a5,-1046 # 8000b990 <OSTaskDbgListPtr>
    80002dae:	639c                	ld	a5,0(a5)
    80002db0:	e8be                	sd	a5,80(sp)
    80002db2:	7522                	ld	a0,40(sp)
    80002db4:	d66fe0ef          	jal	8000131a <CPU_SR_Restore>
    80002db8:	a069                	j	80002e42 <OS_StatTask+0x3ac>
    80002dba:	67c6                	ld	a5,80(sp)
    80002dbc:	0f87a783          	lw	a5,248(a5)
    80002dc0:	5706                	lw	a4,96(sp)
    80002dc2:	02f707bb          	mulw	a5,a4,a5
    80002dc6:	2781                	sext.w	a5,a5
    80002dc8:	4776                	lw	a4,92(sp)
    80002dca:	02e7d7bb          	divuw	a5,a5,a4
    80002dce:	2781                	sext.w	a5,a5
    80002dd0:	06f11723          	sh	a5,110(sp)
    80002dd4:	06e15783          	lhu	a5,110(sp)
    80002dd8:	0007871b          	sext.w	a4,a5
    80002ddc:	6789                	lui	a5,0x2
    80002dde:	71078793          	add	a5,a5,1808 # 2710 <CPU_MSTATUS_MIE+0x2708>
    80002de2:	00e7f763          	bgeu	a5,a4,80002df0 <OS_StatTask+0x35a>
    80002de6:	6789                	lui	a5,0x2
    80002de8:	71078793          	add	a5,a5,1808 # 2710 <CPU_MSTATUS_MIE+0x2708>
    80002dec:	06f11723          	sh	a5,110(sp)
    80002df0:	67c6                	ld	a5,80(sp)
    80002df2:	06e15703          	lhu	a4,110(sp)
    80002df6:	0ee79223          	sh	a4,228(a5)
    80002dfa:	67c6                	ld	a5,80(sp)
    80002dfc:	0e67d783          	lhu	a5,230(a5)
    80002e00:	06e15703          	lhu	a4,110(sp)
    80002e04:	2701                	sext.w	a4,a4
    80002e06:	2781                	sext.w	a5,a5
    80002e08:	00e7f763          	bgeu	a5,a4,80002e16 <OS_StatTask+0x380>
    80002e0c:	67c6                	ld	a5,80(sp)
    80002e0e:	06e15703          	lhu	a4,110(sp)
    80002e12:	0ee79323          	sh	a4,230(a5)
    80002e16:	67c6                	ld	a5,80(sp)
    80002e18:	11078713          	add	a4,a5,272
    80002e1c:	67c6                	ld	a5,80(sp)
    80002e1e:	10878793          	add	a5,a5,264
    80002e22:	0874                	add	a3,sp,28
    80002e24:	863e                	mv	a2,a5
    80002e26:	85ba                	mv	a1,a4
    80002e28:	6546                	ld	a0,80(sp)
    80002e2a:	04f010ef          	jal	80004678 <OSTaskStkChk>
    80002e2e:	ce0fe0ef          	jal	8000130e <CPU_SR_Save>
    80002e32:	f42a                	sd	a0,40(sp)
    80002e34:	67c6                	ld	a5,80(sp)
    80002e36:	1207b783          	ld	a5,288(a5)
    80002e3a:	e8be                	sd	a5,80(sp)
    80002e3c:	7522                	ld	a0,40(sp)
    80002e3e:	cdcfe0ef          	jal	8000131a <CPU_SR_Restore>
    80002e42:	67c6                	ld	a5,80(sp)
    80002e44:	fbbd                	bnez	a5,80002dba <OS_StatTask+0x324>
    80002e46:	da02                	sw	zero,52(sp)
    80002e48:	00008797          	auipc	a5,0x8
    80002e4c:	1e078793          	add	a5,a5,480 # 8000b028 <OSCfg_ISRStkBasePtr>
    80002e50:	639c                	ld	a5,0(a5)
    80002e52:	fc3e                	sd	a5,56(sp)
    80002e54:	00008797          	auipc	a5,0x8
    80002e58:	1dc78793          	add	a5,a5,476 # 8000b030 <OSCfg_ISRStkSize>
    80002e5c:	639c                	ld	a5,0(a5)
    80002e5e:	d03e                	sw	a5,32(sp)
    80002e60:	a039                	j	80002e6e <OS_StatTask+0x3d8>
    80002e62:	77e2                	ld	a5,56(sp)
    80002e64:	07a1                	add	a5,a5,8
    80002e66:	fc3e                	sd	a5,56(sp)
    80002e68:	57d2                	lw	a5,52(sp)
    80002e6a:	2785                	addw	a5,a5,1
    80002e6c:	da3e                	sw	a5,52(sp)
    80002e6e:	77e2                	ld	a5,56(sp)
    80002e70:	639c                	ld	a5,0(a5)
    80002e72:	eb81                	bnez	a5,80002e82 <OS_StatTask+0x3ec>
    80002e74:	57d2                	lw	a5,52(sp)
    80002e76:	873e                	mv	a4,a5
    80002e78:	5782                	lw	a5,32(sp)
    80002e7a:	2701                	sext.w	a4,a4
    80002e7c:	2781                	sext.w	a5,a5
    80002e7e:	fef762e3          	bltu	a4,a5,80002e62 <OS_StatTask+0x3cc>
    80002e82:	00009797          	auipc	a5,0x9
    80002e86:	a8e78793          	add	a5,a5,-1394 # 8000b910 <OSISRStkFree>
    80002e8a:	5752                	lw	a4,52(sp)
    80002e8c:	c398                	sw	a4,0(a5)
    80002e8e:	00008797          	auipc	a5,0x8
    80002e92:	1a278793          	add	a5,a5,418 # 8000b030 <OSCfg_ISRStkSize>
    80002e96:	639c                	ld	a5,0(a5)
    80002e98:	2781                	sext.w	a5,a5
    80002e9a:	5752                	lw	a4,52(sp)
    80002e9c:	9f99                	subw	a5,a5,a4
    80002e9e:	0007871b          	sext.w	a4,a5
    80002ea2:	00009797          	auipc	a5,0x9
    80002ea6:	a7278793          	add	a5,a5,-1422 # 8000b914 <OSISRStkUsed>
    80002eaa:	c398                	sw	a4,0(a5)
    80002eac:	00009797          	auipc	a5,0x9
    80002eb0:	ac678793          	add	a5,a5,-1338 # 8000b972 <OSStatResetFlag>
    80002eb4:	0007c783          	lbu	a5,0(a5)
    80002eb8:	873e                	mv	a4,a5
    80002eba:	4785                	li	a5,1
    80002ebc:	00f71c63          	bne	a4,a5,80002ed4 <OS_StatTask+0x43e>
    80002ec0:	00009797          	auipc	a5,0x9
    80002ec4:	ab278793          	add	a5,a5,-1358 # 8000b972 <OSStatResetFlag>
    80002ec8:	00078023          	sb	zero,0(a5)
    80002ecc:	087c                	add	a5,sp,28
    80002ece:	853e                	mv	a0,a5
    80002ed0:	9bdff0ef          	jal	8000288c <OSStatReset>
    80002ed4:	0878                	add	a4,sp,28
    80002ed6:	4796                	lw	a5,68(sp)
    80002ed8:	863a                	mv	a2,a4
    80002eda:	4581                	li	a1,0
    80002edc:	853e                	mv	a0,a5
    80002ede:	524040ef          	jal	80007402 <OSTimeDly>
    80002ee2:	b191                	j	80002b26 <OS_StatTask+0x90>

0000000080002ee4 <OS_StatTaskInit>:
    80002ee4:	715d                	add	sp,sp,-80
    80002ee6:	e486                	sd	ra,72(sp)
    80002ee8:	fc2a                	sd	a0,56(sp)
    80002eea:	00009797          	auipc	a5,0x9
    80002eee:	a8e78793          	add	a5,a5,-1394 # 8000b978 <OSStatTaskCtr>
    80002ef2:	0007a023          	sw	zero,0(a5)
    80002ef6:	00009797          	auipc	a5,0x9
    80002efa:	a8a78793          	add	a5,a5,-1398 # 8000b980 <OSStatTaskCtrRun>
    80002efe:	0007a023          	sw	zero,0(a5)
    80002f02:	00009797          	auipc	a5,0x9
    80002f06:	a7a78793          	add	a5,a5,-1414 # 8000b97c <OSStatTaskCtrMax>
    80002f0a:	0007a023          	sw	zero,0(a5)
    80002f0e:	00009797          	auipc	a5,0x9
    80002f12:	a7678793          	add	a5,a5,-1418 # 8000b984 <OSStatTaskRdy>
    80002f16:	00078023          	sb	zero,0(a5)
    80002f1a:	00009797          	auipc	a5,0x9
    80002f1e:	a5878793          	add	a5,a5,-1448 # 8000b972 <OSStatResetFlag>
    80002f22:	00078023          	sb	zero,0(a5)
    80002f26:	00009797          	auipc	a5,0x9
    80002f2a:	9ea78793          	add	a5,a5,-1558 # 8000b910 <OSISRStkFree>
    80002f2e:	0007a023          	sw	zero,0(a5)
    80002f32:	00009797          	auipc	a5,0x9
    80002f36:	9e278793          	add	a5,a5,-1566 # 8000b914 <OSISRStkUsed>
    80002f3a:	0007a023          	sw	zero,0(a5)
    80002f3e:	00008797          	auipc	a5,0x8
    80002f42:	11a78793          	add	a5,a5,282 # 8000b058 <OSCfg_StatTaskStkBasePtr>
    80002f46:	639c                	ld	a5,0(a5)
    80002f48:	e799                	bnez	a5,80002f56 <OS_StatTaskInit+0x72>
    80002f4a:	77e2                	ld	a5,56(sp)
    80002f4c:	671d                	lui	a4,0x7
    80002f4e:	e2b70713          	add	a4,a4,-469 # 6e2b <CPU_MSTATUS_MIE+0x6e23>
    80002f52:	c398                	sw	a4,0(a5)
    80002f54:	a055                	j	80002ff8 <OS_StatTaskInit+0x114>
    80002f56:	00008797          	auipc	a5,0x8
    80002f5a:	11278793          	add	a5,a5,274 # 8000b068 <OSCfg_StatTaskStkSize>
    80002f5e:	6398                	ld	a4,0(a5)
    80002f60:	00008797          	auipc	a5,0x8
    80002f64:	11878793          	add	a5,a5,280 # 8000b078 <OSCfg_StkSizeMin>
    80002f68:	639c                	ld	a5,0(a5)
    80002f6a:	00f77863          	bgeu	a4,a5,80002f7a <OS_StatTaskInit+0x96>
    80002f6e:	77e2                	ld	a5,56(sp)
    80002f70:	671d                	lui	a4,0x7
    80002f72:	e2c70713          	add	a4,a4,-468 # 6e2c <CPU_MSTATUS_MIE+0x6e24>
    80002f76:	c398                	sw	a4,0(a5)
    80002f78:	a041                	j	80002ff8 <OS_StatTaskInit+0x114>
    80002f7a:	00008797          	auipc	a5,0x8
    80002f7e:	0d678793          	add	a5,a5,214 # 8000b050 <OSCfg_StatTaskPrio>
    80002f82:	0007c783          	lbu	a5,0(a5)
    80002f86:	873e                	mv	a4,a5
    80002f88:	03e00793          	li	a5,62
    80002f8c:	00e7f863          	bgeu	a5,a4,80002f9c <OS_StatTaskInit+0xb8>
    80002f90:	77e2                	ld	a5,56(sp)
    80002f92:	671d                	lui	a4,0x7
    80002f94:	e2a70713          	add	a4,a4,-470 # 6e2a <CPU_MSTATUS_MIE+0x6e22>
    80002f98:	c398                	sw	a4,0(a5)
    80002f9a:	a8b9                	j	80002ff8 <OS_StatTaskInit+0x114>
    80002f9c:	00008797          	auipc	a5,0x8
    80002fa0:	0b478793          	add	a5,a5,180 # 8000b050 <OSCfg_StatTaskPrio>
    80002fa4:	0007c703          	lbu	a4,0(a5)
    80002fa8:	00008797          	auipc	a5,0x8
    80002fac:	0b078793          	add	a5,a5,176 # 8000b058 <OSCfg_StatTaskStkBasePtr>
    80002fb0:	6394                	ld	a3,0(a5)
    80002fb2:	00008797          	auipc	a5,0x8
    80002fb6:	0ae78793          	add	a5,a5,174 # 8000b060 <OSCfg_StatTaskStkLimit>
    80002fba:	6390                	ld	a2,0(a5)
    80002fbc:	00008797          	auipc	a5,0x8
    80002fc0:	0ac78793          	add	a5,a5,172 # 8000b068 <OSCfg_StatTaskStkSize>
    80002fc4:	638c                	ld	a1,0(a5)
    80002fc6:	77e2                	ld	a5,56(sp)
    80002fc8:	f03e                	sd	a5,32(sp)
    80002fca:	478d                	li	a5,3
    80002fcc:	ec3e                	sd	a5,24(sp)
    80002fce:	e802                	sd	zero,16(sp)
    80002fd0:	e402                	sd	zero,8(sp)
    80002fd2:	e002                	sd	zero,0(sp)
    80002fd4:	88ae                	mv	a7,a1
    80002fd6:	8832                	mv	a6,a2
    80002fd8:	87b6                	mv	a5,a3
    80002fda:	4681                	li	a3,0
    80002fdc:	00000617          	auipc	a2,0x0
    80002fe0:	aba60613          	add	a2,a2,-1350 # 80002a96 <OS_StatTask>
    80002fe4:	00008597          	auipc	a1,0x8
    80002fe8:	3ec58593          	add	a1,a1,1004 # 8000b3d0 <CPU_CntLeadZerosTbl+0x110>
    80002fec:	0001a517          	auipc	a0,0x1a
    80002ff0:	46450513          	add	a0,a0,1124 # 8001d450 <OSStatTaskTCB>
    80002ff4:	570000ef          	jal	80003564 <OSTaskCreate>
    80002ff8:	60a6                	ld	ra,72(sp)
    80002ffa:	6161                	add	sp,sp,80
    80002ffc:	8082                	ret

0000000080002ffe <OSCfg_Init>:
    80002ffe:	0001                	nop
    80003000:	8082                	ret

0000000080003002 <OS_MsgPoolInit>:
    80003002:	7179                	add	sp,sp,-48
    80003004:	e42a                	sd	a0,8(sp)
    80003006:	00008797          	auipc	a5,0x8
    8000300a:	04278793          	add	a5,a5,66 # 8000b048 <OSCfg_MsgPoolBasePtr>
    8000300e:	639c                	ld	a5,0(a5)
    80003010:	e799                	bnez	a5,8000301e <OS_MsgPoolInit+0x1c>
    80003012:	67a2                	ld	a5,8(sp)
    80003014:	6715                	lui	a4,0x5
    80003016:	71e70713          	add	a4,a4,1822 # 571e <CPU_MSTATUS_MIE+0x5716>
    8000301a:	c398                	sw	a4,0(a5)
    8000301c:	a0dd                	j	80003102 <OS_MsgPoolInit+0x100>
    8000301e:	00008797          	auipc	a5,0x8
    80003022:	01e78793          	add	a5,a5,30 # 8000b03c <OSCfg_MsgPoolSize>
    80003026:	0007d783          	lhu	a5,0(a5)
    8000302a:	e799                	bnez	a5,80003038 <OS_MsgPoolInit+0x36>
    8000302c:	67a2                	ld	a5,8(sp)
    8000302e:	6715                	lui	a4,0x5
    80003030:	71d70713          	add	a4,a4,1821 # 571d <CPU_MSTATUS_MIE+0x5715>
    80003034:	c398                	sw	a4,0(a5)
    80003036:	a0f1                	j	80003102 <OS_MsgPoolInit+0x100>
    80003038:	00008797          	auipc	a5,0x8
    8000303c:	01078793          	add	a5,a5,16 # 8000b048 <OSCfg_MsgPoolBasePtr>
    80003040:	639c                	ld	a5,0(a5)
    80003042:	f43e                	sd	a5,40(sp)
    80003044:	00008797          	auipc	a5,0x8
    80003048:	00478793          	add	a5,a5,4 # 8000b048 <OSCfg_MsgPoolBasePtr>
    8000304c:	639c                	ld	a5,0(a5)
    8000304e:	f03e                	sd	a5,32(sp)
    80003050:	7782                	ld	a5,32(sp)
    80003052:	07e1                	add	a5,a5,24
    80003054:	f03e                	sd	a5,32(sp)
    80003056:	00008797          	auipc	a5,0x8
    8000305a:	fe678793          	add	a5,a5,-26 # 8000b03c <OSCfg_MsgPoolSize>
    8000305e:	0007d783          	lhu	a5,0(a5)
    80003062:	37fd                	addw	a5,a5,-1
    80003064:	00f11e23          	sh	a5,28(sp)
    80003068:	00011f23          	sh	zero,30(sp)
    8000306c:	a02d                	j	80003096 <OS_MsgPoolInit+0x94>
    8000306e:	77a2                	ld	a5,40(sp)
    80003070:	7702                	ld	a4,32(sp)
    80003072:	e398                	sd	a4,0(a5)
    80003074:	77a2                	ld	a5,40(sp)
    80003076:	0007b423          	sd	zero,8(a5)
    8000307a:	77a2                	ld	a5,40(sp)
    8000307c:	00079823          	sh	zero,16(a5)
    80003080:	77a2                	ld	a5,40(sp)
    80003082:	07e1                	add	a5,a5,24
    80003084:	f43e                	sd	a5,40(sp)
    80003086:	7782                	ld	a5,32(sp)
    80003088:	07e1                	add	a5,a5,24
    8000308a:	f03e                	sd	a5,32(sp)
    8000308c:	01e15783          	lhu	a5,30(sp)
    80003090:	2785                	addw	a5,a5,1
    80003092:	00f11f23          	sh	a5,30(sp)
    80003096:	01e15703          	lhu	a4,30(sp)
    8000309a:	01c15783          	lhu	a5,28(sp)
    8000309e:	2701                	sext.w	a4,a4
    800030a0:	2781                	sext.w	a5,a5
    800030a2:	fcf766e3          	bltu	a4,a5,8000306e <OS_MsgPoolInit+0x6c>
    800030a6:	77a2                	ld	a5,40(sp)
    800030a8:	0007b023          	sd	zero,0(a5)
    800030ac:	77a2                	ld	a5,40(sp)
    800030ae:	0007b423          	sd	zero,8(a5)
    800030b2:	77a2                	ld	a5,40(sp)
    800030b4:	00079823          	sh	zero,16(a5)
    800030b8:	00008797          	auipc	a5,0x8
    800030bc:	f9078793          	add	a5,a5,-112 # 8000b048 <OSCfg_MsgPoolBasePtr>
    800030c0:	6398                	ld	a4,0(a5)
    800030c2:	0001a797          	auipc	a5,0x1a
    800030c6:	d7e78793          	add	a5,a5,-642 # 8001ce40 <OSMsgPool>
    800030ca:	e398                	sd	a4,0(a5)
    800030cc:	00008797          	auipc	a5,0x8
    800030d0:	f7078793          	add	a5,a5,-144 # 8000b03c <OSCfg_MsgPoolSize>
    800030d4:	0007d703          	lhu	a4,0(a5)
    800030d8:	0001a797          	auipc	a5,0x1a
    800030dc:	d6878793          	add	a5,a5,-664 # 8001ce40 <OSMsgPool>
    800030e0:	00e79423          	sh	a4,8(a5)
    800030e4:	0001a797          	auipc	a5,0x1a
    800030e8:	d5c78793          	add	a5,a5,-676 # 8001ce40 <OSMsgPool>
    800030ec:	00079523          	sh	zero,10(a5)
    800030f0:	0001a797          	auipc	a5,0x1a
    800030f4:	d5078793          	add	a5,a5,-688 # 8001ce40 <OSMsgPool>
    800030f8:	00079623          	sh	zero,12(a5)
    800030fc:	67a2                	ld	a5,8(sp)
    800030fe:	0007a023          	sw	zero,0(a5)
    80003102:	6145                	add	sp,sp,48
    80003104:	8082                	ret

0000000080003106 <OS_MsgQFreeAll>:
    80003106:	1101                	add	sp,sp,-32
    80003108:	e42a                	sd	a0,8(sp)
    8000310a:	67a2                	ld	a5,8(sp)
    8000310c:	0127d783          	lhu	a5,18(a5)
    80003110:	00f11f23          	sh	a5,30(sp)
    80003114:	67a2                	ld	a5,8(sp)
    80003116:	0127d783          	lhu	a5,18(a5)
    8000311a:	c7c9                	beqz	a5,800031a4 <OS_MsgQFreeAll+0x9e>
    8000311c:	67a2                	ld	a5,8(sp)
    8000311e:	639c                	ld	a5,0(a5)
    80003120:	e83e                	sd	a5,16(sp)
    80003122:	0001a797          	auipc	a5,0x1a
    80003126:	d1e78793          	add	a5,a5,-738 # 8001ce40 <OSMsgPool>
    8000312a:	6398                	ld	a4,0(a5)
    8000312c:	67c2                	ld	a5,16(sp)
    8000312e:	e398                	sd	a4,0(a5)
    80003130:	67a2                	ld	a5,8(sp)
    80003132:	6798                	ld	a4,8(a5)
    80003134:	0001a797          	auipc	a5,0x1a
    80003138:	d0c78793          	add	a5,a5,-756 # 8001ce40 <OSMsgPool>
    8000313c:	e398                	sd	a4,0(a5)
    8000313e:	0001a797          	auipc	a5,0x1a
    80003142:	d0278793          	add	a5,a5,-766 # 8001ce40 <OSMsgPool>
    80003146:	00a7d703          	lhu	a4,10(a5)
    8000314a:	67a2                	ld	a5,8(sp)
    8000314c:	0127d783          	lhu	a5,18(a5)
    80003150:	40f707bb          	subw	a5,a4,a5
    80003154:	03079713          	sll	a4,a5,0x30
    80003158:	9341                	srl	a4,a4,0x30
    8000315a:	0001a797          	auipc	a5,0x1a
    8000315e:	ce678793          	add	a5,a5,-794 # 8001ce40 <OSMsgPool>
    80003162:	00e79523          	sh	a4,10(a5)
    80003166:	0001a797          	auipc	a5,0x1a
    8000316a:	cda78793          	add	a5,a5,-806 # 8001ce40 <OSMsgPool>
    8000316e:	0087d703          	lhu	a4,8(a5)
    80003172:	67a2                	ld	a5,8(sp)
    80003174:	0127d783          	lhu	a5,18(a5)
    80003178:	9fb9                	addw	a5,a5,a4
    8000317a:	03079713          	sll	a4,a5,0x30
    8000317e:	9341                	srl	a4,a4,0x30
    80003180:	0001a797          	auipc	a5,0x1a
    80003184:	cc078793          	add	a5,a5,-832 # 8001ce40 <OSMsgPool>
    80003188:	00e79423          	sh	a4,8(a5)
    8000318c:	67a2                	ld	a5,8(sp)
    8000318e:	00079923          	sh	zero,18(a5)
    80003192:	67a2                	ld	a5,8(sp)
    80003194:	00079a23          	sh	zero,20(a5)
    80003198:	67a2                	ld	a5,8(sp)
    8000319a:	0007b023          	sd	zero,0(a5)
    8000319e:	67a2                	ld	a5,8(sp)
    800031a0:	0007b423          	sd	zero,8(a5)
    800031a4:	01e15783          	lhu	a5,30(sp)
    800031a8:	853e                	mv	a0,a5
    800031aa:	6105                	add	sp,sp,32
    800031ac:	8082                	ret

00000000800031ae <OS_MsgQInit>:
    800031ae:	1141                	add	sp,sp,-16
    800031b0:	e42a                	sd	a0,8(sp)
    800031b2:	87ae                	mv	a5,a1
    800031b4:	00f11323          	sh	a5,6(sp)
    800031b8:	67a2                	ld	a5,8(sp)
    800031ba:	00615703          	lhu	a4,6(sp)
    800031be:	00e79823          	sh	a4,16(a5)
    800031c2:	67a2                	ld	a5,8(sp)
    800031c4:	00079923          	sh	zero,18(a5)
    800031c8:	67a2                	ld	a5,8(sp)
    800031ca:	00079a23          	sh	zero,20(a5)
    800031ce:	67a2                	ld	a5,8(sp)
    800031d0:	0007b023          	sd	zero,0(a5)
    800031d4:	67a2                	ld	a5,8(sp)
    800031d6:	0007b423          	sd	zero,8(a5)
    800031da:	0001                	nop
    800031dc:	0141                	add	sp,sp,16
    800031de:	8082                	ret

00000000800031e0 <OS_MsgQGet>:
    800031e0:	7179                	add	sp,sp,-48
    800031e2:	ec2a                	sd	a0,24(sp)
    800031e4:	e82e                	sd	a1,16(sp)
    800031e6:	e432                	sd	a2,8(sp)
    800031e8:	e036                	sd	a3,0(sp)
    800031ea:	67e2                	ld	a5,24(sp)
    800031ec:	0127d783          	lhu	a5,18(a5)
    800031f0:	eb99                	bnez	a5,80003206 <OS_MsgQGet+0x26>
    800031f2:	67c2                	ld	a5,16(sp)
    800031f4:	00079023          	sh	zero,0(a5)
    800031f8:	6782                	ld	a5,0(sp)
    800031fa:	6719                	lui	a4,0x6
    800031fc:	59270713          	add	a4,a4,1426 # 6592 <CPU_MSTATUS_MIE+0x658a>
    80003200:	c398                	sw	a4,0(a5)
    80003202:	4781                	li	a5,0
    80003204:	a075                	j	800032b0 <OS_MsgQGet+0xd0>
    80003206:	67e2                	ld	a5,24(sp)
    80003208:	679c                	ld	a5,8(a5)
    8000320a:	f43e                	sd	a5,40(sp)
    8000320c:	77a2                	ld	a5,40(sp)
    8000320e:	679c                	ld	a5,8(a5)
    80003210:	f03e                	sd	a5,32(sp)
    80003212:	77a2                	ld	a5,40(sp)
    80003214:	0107d703          	lhu	a4,16(a5)
    80003218:	67c2                	ld	a5,16(sp)
    8000321a:	00e79023          	sh	a4,0(a5)
    8000321e:	77a2                	ld	a5,40(sp)
    80003220:	6398                	ld	a4,0(a5)
    80003222:	67e2                	ld	a5,24(sp)
    80003224:	e798                	sd	a4,8(a5)
    80003226:	67e2                	ld	a5,24(sp)
    80003228:	679c                	ld	a5,8(a5)
    8000322a:	eb81                	bnez	a5,8000323a <OS_MsgQGet+0x5a>
    8000322c:	67e2                	ld	a5,24(sp)
    8000322e:	0007b023          	sd	zero,0(a5)
    80003232:	67e2                	ld	a5,24(sp)
    80003234:	00079923          	sh	zero,18(a5)
    80003238:	a819                	j	8000324e <OS_MsgQGet+0x6e>
    8000323a:	67e2                	ld	a5,24(sp)
    8000323c:	0127d783          	lhu	a5,18(a5)
    80003240:	37fd                	addw	a5,a5,-1
    80003242:	03079713          	sll	a4,a5,0x30
    80003246:	9341                	srl	a4,a4,0x30
    80003248:	67e2                	ld	a5,24(sp)
    8000324a:	00e79923          	sh	a4,18(a5)
    8000324e:	0001a797          	auipc	a5,0x1a
    80003252:	bf278793          	add	a5,a5,-1038 # 8001ce40 <OSMsgPool>
    80003256:	6398                	ld	a4,0(a5)
    80003258:	77a2                	ld	a5,40(sp)
    8000325a:	e398                	sd	a4,0(a5)
    8000325c:	0001a797          	auipc	a5,0x1a
    80003260:	be478793          	add	a5,a5,-1052 # 8001ce40 <OSMsgPool>
    80003264:	7722                	ld	a4,40(sp)
    80003266:	e398                	sd	a4,0(a5)
    80003268:	0001a797          	auipc	a5,0x1a
    8000326c:	bd878793          	add	a5,a5,-1064 # 8001ce40 <OSMsgPool>
    80003270:	0087d783          	lhu	a5,8(a5)
    80003274:	2785                	addw	a5,a5,1
    80003276:	03079713          	sll	a4,a5,0x30
    8000327a:	9341                	srl	a4,a4,0x30
    8000327c:	0001a797          	auipc	a5,0x1a
    80003280:	bc478793          	add	a5,a5,-1084 # 8001ce40 <OSMsgPool>
    80003284:	00e79423          	sh	a4,8(a5)
    80003288:	0001a797          	auipc	a5,0x1a
    8000328c:	bb878793          	add	a5,a5,-1096 # 8001ce40 <OSMsgPool>
    80003290:	00a7d783          	lhu	a5,10(a5)
    80003294:	37fd                	addw	a5,a5,-1
    80003296:	03079713          	sll	a4,a5,0x30
    8000329a:	9341                	srl	a4,a4,0x30
    8000329c:	0001a797          	auipc	a5,0x1a
    800032a0:	ba478793          	add	a5,a5,-1116 # 8001ce40 <OSMsgPool>
    800032a4:	00e79523          	sh	a4,10(a5)
    800032a8:	6782                	ld	a5,0(sp)
    800032aa:	0007a023          	sw	zero,0(a5)
    800032ae:	7782                	ld	a5,32(sp)
    800032b0:	853e                	mv	a0,a5
    800032b2:	6145                	add	sp,sp,48
    800032b4:	8082                	ret

00000000800032b6 <OS_MsgQPut>:
    800032b6:	7179                	add	sp,sp,-48
    800032b8:	ec2a                	sd	a0,24(sp)
    800032ba:	e82e                	sd	a1,16(sp)
    800032bc:	e03e                	sd	a5,0(sp)
    800032be:	87b2                	mv	a5,a2
    800032c0:	00f11723          	sh	a5,14(sp)
    800032c4:	87b6                	mv	a5,a3
    800032c6:	00f11623          	sh	a5,12(sp)
    800032ca:	87ba                	mv	a5,a4
    800032cc:	c43e                	sw	a5,8(sp)
    800032ce:	67e2                	ld	a5,24(sp)
    800032d0:	0127d703          	lhu	a4,18(a5)
    800032d4:	67e2                	ld	a5,24(sp)
    800032d6:	0107d783          	lhu	a5,16(a5)
    800032da:	2701                	sext.w	a4,a4
    800032dc:	2781                	sext.w	a5,a5
    800032de:	00f76863          	bltu	a4,a5,800032ee <OS_MsgQPut+0x38>
    800032e2:	6782                	ld	a5,0(sp)
    800032e4:	6719                	lui	a4,0x6
    800032e6:	59370713          	add	a4,a4,1427 # 6593 <CPU_MSTATUS_MIE+0x658b>
    800032ea:	c398                	sw	a4,0(a5)
    800032ec:	aa81                	j	8000343c <OS_MsgQPut+0x186>
    800032ee:	0001a797          	auipc	a5,0x1a
    800032f2:	b5278793          	add	a5,a5,-1198 # 8001ce40 <OSMsgPool>
    800032f6:	0087d783          	lhu	a5,8(a5)
    800032fa:	e799                	bnez	a5,80003308 <OS_MsgQPut+0x52>
    800032fc:	6782                	ld	a5,0(sp)
    800032fe:	6715                	lui	a4,0x5
    80003300:	71d70713          	add	a4,a4,1821 # 571d <CPU_MSTATUS_MIE+0x5715>
    80003304:	c398                	sw	a4,0(a5)
    80003306:	aa1d                	j	8000343c <OS_MsgQPut+0x186>
    80003308:	0001a797          	auipc	a5,0x1a
    8000330c:	b3878793          	add	a5,a5,-1224 # 8001ce40 <OSMsgPool>
    80003310:	639c                	ld	a5,0(a5)
    80003312:	f43e                	sd	a5,40(sp)
    80003314:	77a2                	ld	a5,40(sp)
    80003316:	6398                	ld	a4,0(a5)
    80003318:	0001a797          	auipc	a5,0x1a
    8000331c:	b2878793          	add	a5,a5,-1240 # 8001ce40 <OSMsgPool>
    80003320:	e398                	sd	a4,0(a5)
    80003322:	0001a797          	auipc	a5,0x1a
    80003326:	b1e78793          	add	a5,a5,-1250 # 8001ce40 <OSMsgPool>
    8000332a:	0087d783          	lhu	a5,8(a5)
    8000332e:	37fd                	addw	a5,a5,-1
    80003330:	03079713          	sll	a4,a5,0x30
    80003334:	9341                	srl	a4,a4,0x30
    80003336:	0001a797          	auipc	a5,0x1a
    8000333a:	b0a78793          	add	a5,a5,-1270 # 8001ce40 <OSMsgPool>
    8000333e:	00e79423          	sh	a4,8(a5)
    80003342:	0001a797          	auipc	a5,0x1a
    80003346:	afe78793          	add	a5,a5,-1282 # 8001ce40 <OSMsgPool>
    8000334a:	00a7d783          	lhu	a5,10(a5)
    8000334e:	2785                	addw	a5,a5,1
    80003350:	03079713          	sll	a4,a5,0x30
    80003354:	9341                	srl	a4,a4,0x30
    80003356:	0001a797          	auipc	a5,0x1a
    8000335a:	aea78793          	add	a5,a5,-1302 # 8001ce40 <OSMsgPool>
    8000335e:	00e79523          	sh	a4,10(a5)
    80003362:	0001a797          	auipc	a5,0x1a
    80003366:	ade78793          	add	a5,a5,-1314 # 8001ce40 <OSMsgPool>
    8000336a:	00c7d703          	lhu	a4,12(a5)
    8000336e:	0001a797          	auipc	a5,0x1a
    80003372:	ad278793          	add	a5,a5,-1326 # 8001ce40 <OSMsgPool>
    80003376:	00a7d783          	lhu	a5,10(a5)
    8000337a:	2701                	sext.w	a4,a4
    8000337c:	2781                	sext.w	a5,a5
    8000337e:	00f77e63          	bgeu	a4,a5,8000339a <OS_MsgQPut+0xe4>
    80003382:	0001a797          	auipc	a5,0x1a
    80003386:	abe78793          	add	a5,a5,-1346 # 8001ce40 <OSMsgPool>
    8000338a:	00a7d703          	lhu	a4,10(a5)
    8000338e:	0001a797          	auipc	a5,0x1a
    80003392:	ab278793          	add	a5,a5,-1358 # 8001ce40 <OSMsgPool>
    80003396:	00e79623          	sh	a4,12(a5)
    8000339a:	67e2                	ld	a5,24(sp)
    8000339c:	0127d783          	lhu	a5,18(a5)
    800033a0:	ef99                	bnez	a5,800033be <OS_MsgQPut+0x108>
    800033a2:	67e2                	ld	a5,24(sp)
    800033a4:	7722                	ld	a4,40(sp)
    800033a6:	e398                	sd	a4,0(a5)
    800033a8:	67e2                	ld	a5,24(sp)
    800033aa:	7722                	ld	a4,40(sp)
    800033ac:	e798                	sd	a4,8(a5)
    800033ae:	67e2                	ld	a5,24(sp)
    800033b0:	4705                	li	a4,1
    800033b2:	00e79923          	sh	a4,18(a5)
    800033b6:	77a2                	ld	a5,40(sp)
    800033b8:	0007b023          	sd	zero,0(a5)
    800033bc:	a0a9                	j	80003406 <OS_MsgQPut+0x150>
    800033be:	00c15783          	lhu	a5,12(sp)
    800033c2:	2781                	sext.w	a5,a5
    800033c4:	8bc1                	and	a5,a5,16
    800033c6:	2781                	sext.w	a5,a5
    800033c8:	ef91                	bnez	a5,800033e4 <OS_MsgQPut+0x12e>
    800033ca:	67e2                	ld	a5,24(sp)
    800033cc:	639c                	ld	a5,0(a5)
    800033ce:	f03e                	sd	a5,32(sp)
    800033d0:	7782                	ld	a5,32(sp)
    800033d2:	7722                	ld	a4,40(sp)
    800033d4:	e398                	sd	a4,0(a5)
    800033d6:	67e2                	ld	a5,24(sp)
    800033d8:	7722                	ld	a4,40(sp)
    800033da:	e398                	sd	a4,0(a5)
    800033dc:	77a2                	ld	a5,40(sp)
    800033de:	0007b023          	sd	zero,0(a5)
    800033e2:	a801                	j	800033f2 <OS_MsgQPut+0x13c>
    800033e4:	67e2                	ld	a5,24(sp)
    800033e6:	6798                	ld	a4,8(a5)
    800033e8:	77a2                	ld	a5,40(sp)
    800033ea:	e398                	sd	a4,0(a5)
    800033ec:	67e2                	ld	a5,24(sp)
    800033ee:	7722                	ld	a4,40(sp)
    800033f0:	e798                	sd	a4,8(a5)
    800033f2:	67e2                	ld	a5,24(sp)
    800033f4:	0127d783          	lhu	a5,18(a5)
    800033f8:	2785                	addw	a5,a5,1
    800033fa:	03079713          	sll	a4,a5,0x30
    800033fe:	9341                	srl	a4,a4,0x30
    80003400:	67e2                	ld	a5,24(sp)
    80003402:	00e79923          	sh	a4,18(a5)
    80003406:	67e2                	ld	a5,24(sp)
    80003408:	0147d703          	lhu	a4,20(a5)
    8000340c:	67e2                	ld	a5,24(sp)
    8000340e:	0127d783          	lhu	a5,18(a5)
    80003412:	2701                	sext.w	a4,a4
    80003414:	2781                	sext.w	a5,a5
    80003416:	00f77863          	bgeu	a4,a5,80003426 <OS_MsgQPut+0x170>
    8000341a:	67e2                	ld	a5,24(sp)
    8000341c:	0127d703          	lhu	a4,18(a5)
    80003420:	67e2                	ld	a5,24(sp)
    80003422:	00e79a23          	sh	a4,20(a5)
    80003426:	77a2                	ld	a5,40(sp)
    80003428:	6742                	ld	a4,16(sp)
    8000342a:	e798                	sd	a4,8(a5)
    8000342c:	77a2                	ld	a5,40(sp)
    8000342e:	00e15703          	lhu	a4,14(sp)
    80003432:	00e79823          	sh	a4,16(a5)
    80003436:	6782                	ld	a5,0(sp)
    80003438:	0007a023          	sw	zero,0(a5)
    8000343c:	6145                	add	sp,sp,48
    8000343e:	8082                	ret

0000000080003440 <OSTaskChangePrio>:
    80003440:	7139                	add	sp,sp,-64
    80003442:	fc06                	sd	ra,56(sp)
    80003444:	ec2a                	sd	a0,24(sp)
    80003446:	87ae                	mv	a5,a1
    80003448:	e432                	sd	a2,8(sp)
    8000344a:	00f10ba3          	sb	a5,23(sp)
    8000344e:	f402                	sd	zero,40(sp)
    80003450:	67e2                	ld	a5,24(sp)
    80003452:	cf99                	beqz	a5,80003470 <OSTaskChangePrio+0x30>
    80003454:	67e2                	ld	a5,24(sp)
    80003456:	0727c783          	lbu	a5,114(a5)
    8000345a:	873e                	mv	a4,a5
    8000345c:	0ff00793          	li	a5,255
    80003460:	00f71863          	bne	a4,a5,80003470 <OSTaskChangePrio+0x30>
    80003464:	67a2                	ld	a5,8(sp)
    80003466:	671d                	lui	a4,0x7
    80003468:	e2d70713          	add	a4,a4,-467 # 6e2d <CPU_MSTATUS_MIE+0x6e25>
    8000346c:	c398                	sw	a4,0(a5)
    8000346e:	a8c5                	j	8000355e <OSTaskChangePrio+0x11e>
    80003470:	00008797          	auipc	a5,0x8
    80003474:	49c78793          	add	a5,a5,1180 # 8000b90c <OSIntNestingCtr>
    80003478:	0007c783          	lbu	a5,0(a5)
    8000347c:	c799                	beqz	a5,8000348a <OSTaskChangePrio+0x4a>
    8000347e:	67a2                	ld	a5,8(sp)
    80003480:	671d                	lui	a4,0x7
    80003482:	14970713          	add	a4,a4,329 # 7149 <CPU_MSTATUS_MIE+0x7141>
    80003486:	c398                	sw	a4,0(a5)
    80003488:	a8d9                	j	8000355e <OSTaskChangePrio+0x11e>
    8000348a:	01714783          	lbu	a5,23(sp)
    8000348e:	0ff7f713          	zext.b	a4,a5
    80003492:	03e00793          	li	a5,62
    80003496:	00e7f863          	bgeu	a5,a4,800034a6 <OSTaskChangePrio+0x66>
    8000349a:	67a2                	ld	a5,8(sp)
    8000349c:	6719                	lui	a4,0x6
    8000349e:	27370713          	add	a4,a4,627 # 6273 <CPU_MSTATUS_MIE+0x626b>
    800034a2:	c398                	sw	a4,0(a5)
    800034a4:	a86d                	j	8000355e <OSTaskChangePrio+0x11e>
    800034a6:	e69fd0ef          	jal	8000130e <CPU_SR_Save>
    800034aa:	f42a                	sd	a0,40(sp)
    800034ac:	67e2                	ld	a5,24(sp)
    800034ae:	eb95                	bnez	a5,800034e2 <OSTaskChangePrio+0xa2>
    800034b0:	00008797          	auipc	a5,0x8
    800034b4:	45d78793          	add	a5,a5,1117 # 8000b90d <OSRunning>
    800034b8:	0007c783          	lbu	a5,0(a5)
    800034bc:	873e                	mv	a4,a5
    800034be:	4785                	li	a5,1
    800034c0:	00f70b63          	beq	a4,a5,800034d6 <OSTaskChangePrio+0x96>
    800034c4:	7522                	ld	a0,40(sp)
    800034c6:	e55fd0ef          	jal	8000131a <CPU_SR_Restore>
    800034ca:	67a2                	ld	a5,8(sp)
    800034cc:	6719                	lui	a4,0x6
    800034ce:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    800034d2:	c398                	sw	a4,0(a5)
    800034d4:	a069                	j	8000355e <OSTaskChangePrio+0x11e>
    800034d6:	00008797          	auipc	a5,0x8
    800034da:	4f278793          	add	a5,a5,1266 # 8000b9c8 <OSTCBCurPtr>
    800034de:	639c                	ld	a5,0(a5)
    800034e0:	ec3e                	sd	a5,24(sp)
    800034e2:	67e2                	ld	a5,24(sp)
    800034e4:	01714703          	lbu	a4,23(sp)
    800034e8:	06e78a23          	sb	a4,116(a5)
    800034ec:	67e2                	ld	a5,24(sp)
    800034ee:	7fbc                	ld	a5,120(a5)
    800034f0:	cf9d                	beqz	a5,8000352e <OSTaskChangePrio+0xee>
    800034f2:	67e2                	ld	a5,24(sp)
    800034f4:	0737c703          	lbu	a4,115(a5)
    800034f8:	01714783          	lbu	a5,23(sp)
    800034fc:	0ff7f793          	zext.b	a5,a5
    80003500:	02f77763          	bgeu	a4,a5,8000352e <OSTaskChangePrio+0xee>
    80003504:	6562                	ld	a0,24(sp)
    80003506:	4c6030ef          	jal	800069cc <OS_MutexGrpPrioFindHighest>
    8000350a:	87aa                	mv	a5,a0
    8000350c:	02f103a3          	sb	a5,39(sp)
    80003510:	01714783          	lbu	a5,23(sp)
    80003514:	873e                	mv	a4,a5
    80003516:	02714783          	lbu	a5,39(sp)
    8000351a:	0ff77713          	zext.b	a4,a4
    8000351e:	0ff7f793          	zext.b	a5,a5
    80003522:	00e7f663          	bgeu	a5,a4,8000352e <OSTaskChangePrio+0xee>
    80003526:	02714783          	lbu	a5,39(sp)
    8000352a:	00f10ba3          	sb	a5,23(sp)
    8000352e:	01714783          	lbu	a5,23(sp)
    80003532:	85be                	mv	a1,a5
    80003534:	6562                	ld	a0,24(sp)
    80003536:	70c010ef          	jal	80004c42 <OS_TaskChangePrio>
    8000353a:	7522                	ld	a0,40(sp)
    8000353c:	ddffd0ef          	jal	8000131a <CPU_SR_Restore>
    80003540:	00008797          	auipc	a5,0x8
    80003544:	3cd78793          	add	a5,a5,973 # 8000b90d <OSRunning>
    80003548:	0007c783          	lbu	a5,0(a5)
    8000354c:	873e                	mv	a4,a5
    8000354e:	4785                	li	a5,1
    80003550:	00f71463          	bne	a4,a5,80003558 <OSTaskChangePrio+0x118>
    80003554:	3f3010ef          	jal	80005146 <OSSched>
    80003558:	67a2                	ld	a5,8(sp)
    8000355a:	0007a023          	sw	zero,0(a5)
    8000355e:	70e2                	ld	ra,56(sp)
    80003560:	6121                	add	sp,sp,64
    80003562:	8082                	ret

0000000080003564 <OSTaskCreate>:
    80003564:	7119                	add	sp,sp,-128
    80003566:	fc86                	sd	ra,120(sp)
    80003568:	fc2a                	sd	a0,56(sp)
    8000356a:	f82e                	sd	a1,48(sp)
    8000356c:	f432                	sd	a2,40(sp)
    8000356e:	f036                	sd	a3,32(sp)
    80003570:	e83e                	sd	a5,16(sp)
    80003572:	e442                	sd	a6,8(sp)
    80003574:	e046                	sd	a7,0(sp)
    80003576:	87ba                	mv	a5,a4
    80003578:	00f10fa3          	sb	a5,31(sp)
    8000357c:	e882                	sd	zero,80(sp)
    8000357e:	00008797          	auipc	a5,0x8
    80003582:	38e78793          	add	a5,a5,910 # 8000b90c <OSIntNestingCtr>
    80003586:	0007c783          	lbu	a5,0(a5)
    8000358a:	c799                	beqz	a5,80003598 <OSTaskCreate+0x34>
    8000358c:	778a                	ld	a5,160(sp)
    8000358e:	671d                	lui	a4,0x7
    80003590:	14a70713          	add	a4,a4,330 # 714a <CPU_MSTATUS_MIE+0x7142>
    80003594:	c398                	sw	a4,0(a5)
    80003596:	aca9                	j	800037f0 <OSTaskCreate+0x28c>
    80003598:	77e2                	ld	a5,56(sp)
    8000359a:	e799                	bnez	a5,800035a8 <OSTaskCreate+0x44>
    8000359c:	778a                	ld	a5,160(sp)
    8000359e:	671d                	lui	a4,0x7
    800035a0:	1ad70713          	add	a4,a4,429 # 71ad <CPU_MSTATUS_MIE+0x71a5>
    800035a4:	c398                	sw	a4,0(a5)
    800035a6:	a4a9                	j	800037f0 <OSTaskCreate+0x28c>
    800035a8:	77a2                	ld	a5,40(sp)
    800035aa:	e799                	bnez	a5,800035b8 <OSTaskCreate+0x54>
    800035ac:	778a                	ld	a5,160(sp)
    800035ae:	671d                	lui	a4,0x7
    800035b0:	14f70713          	add	a4,a4,335 # 714f <CPU_MSTATUS_MIE+0x7147>
    800035b4:	c398                	sw	a4,0(a5)
    800035b6:	ac2d                	j	800037f0 <OSTaskCreate+0x28c>
    800035b8:	67c2                	ld	a5,16(sp)
    800035ba:	e799                	bnez	a5,800035c8 <OSTaskCreate+0x64>
    800035bc:	778a                	ld	a5,160(sp)
    800035be:	671d                	lui	a4,0x7
    800035c0:	e2f70713          	add	a4,a4,-465 # 6e2f <CPU_MSTATUS_MIE+0x6e27>
    800035c4:	c398                	sw	a4,0(a5)
    800035c6:	a42d                	j	800037f0 <OSTaskCreate+0x28c>
    800035c8:	00008797          	auipc	a5,0x8
    800035cc:	ab078793          	add	a5,a5,-1360 # 8000b078 <OSCfg_StkSizeMin>
    800035d0:	639c                	ld	a5,0(a5)
    800035d2:	6702                	ld	a4,0(sp)
    800035d4:	00f77863          	bgeu	a4,a5,800035e4 <OSTaskCreate+0x80>
    800035d8:	778a                	ld	a5,160(sp)
    800035da:	671d                	lui	a4,0x7
    800035dc:	e3070713          	add	a4,a4,-464 # 6e30 <CPU_MSTATUS_MIE+0x6e28>
    800035e0:	c398                	sw	a4,0(a5)
    800035e2:	a439                	j	800037f0 <OSTaskCreate+0x28c>
    800035e4:	6722                	ld	a4,8(sp)
    800035e6:	6782                	ld	a5,0(sp)
    800035e8:	00f76863          	bltu	a4,a5,800035f8 <OSTaskCreate+0x94>
    800035ec:	778a                	ld	a5,160(sp)
    800035ee:	671d                	lui	a4,0x7
    800035f0:	e3170713          	add	a4,a4,-463 # 6e31 <CPU_MSTATUS_MIE+0x6e29>
    800035f4:	c398                	sw	a4,0(a5)
    800035f6:	aaed                	j	800037f0 <OSTaskCreate+0x28c>
    800035f8:	01f14783          	lbu	a5,31(sp)
    800035fc:	0ff7f713          	zext.b	a4,a5
    80003600:	03e00793          	li	a5,62
    80003604:	02e7f063          	bgeu	a5,a4,80003624 <OSTaskCreate+0xc0>
    80003608:	01f14783          	lbu	a5,31(sp)
    8000360c:	0ff7f713          	zext.b	a4,a5
    80003610:	03f00793          	li	a5,63
    80003614:	00f70863          	beq	a4,a5,80003624 <OSTaskCreate+0xc0>
    80003618:	778a                	ld	a5,160(sp)
    8000361a:	6719                	lui	a4,0x6
    8000361c:	27370713          	add	a4,a4,627 # 6273 <CPU_MSTATUS_MIE+0x626b>
    80003620:	c398                	sw	a4,0(a5)
    80003622:	a2f9                	j	800037f0 <OSTaskCreate+0x28c>
    80003624:	01f14783          	lbu	a5,31(sp)
    80003628:	0ff7f713          	zext.b	a4,a5
    8000362c:	03f00793          	li	a5,63
    80003630:	00f71f63          	bne	a4,a5,8000364e <OSTaskCreate+0xea>
    80003634:	7762                	ld	a4,56(sp)
    80003636:	00019797          	auipc	a5,0x19
    8000363a:	6da78793          	add	a5,a5,1754 # 8001cd10 <OSIdleTaskTCB>
    8000363e:	00f70863          	beq	a4,a5,8000364e <OSTaskCreate+0xea>
    80003642:	778a                	ld	a5,160(sp)
    80003644:	6719                	lui	a4,0x6
    80003646:	27370713          	add	a4,a4,627 # 6273 <CPU_MSTATUS_MIE+0x626b>
    8000364a:	c398                	sw	a4,0(a5)
    8000364c:	a255                	j	800037f0 <OSTaskCreate+0x28c>
    8000364e:	7562                	ld	a0,56(sp)
    80003650:	44e010ef          	jal	80004a9e <OS_TaskInitTCB>
    80003654:	778a                	ld	a5,160(sp)
    80003656:	0007a023          	sw	zero,0(a5)
    8000365a:	09815783          	lhu	a5,152(sp)
    8000365e:	2781                	sext.w	a5,a5
    80003660:	8b85                	and	a5,a5,1
    80003662:	2781                	sext.w	a5,a5
    80003664:	e799                	bnez	a5,80003672 <OSTaskCreate+0x10e>
    80003666:	09815783          	lhu	a5,152(sp)
    8000366a:	2781                	sext.w	a5,a5
    8000366c:	8b89                	and	a5,a5,2
    8000366e:	2781                	sext.w	a5,a5
    80003670:	cb85                	beqz	a5,800036a0 <OSTaskCreate+0x13c>
    80003672:	09815783          	lhu	a5,152(sp)
    80003676:	2781                	sext.w	a5,a5
    80003678:	8b89                	and	a5,a5,2
    8000367a:	2781                	sext.w	a5,a5
    8000367c:	c395                	beqz	a5,800036a0 <OSTaskCreate+0x13c>
    8000367e:	67c2                	ld	a5,16(sp)
    80003680:	ecbe                	sd	a5,88(sp)
    80003682:	f482                	sd	zero,104(sp)
    80003684:	a811                	j	80003698 <OSTaskCreate+0x134>
    80003686:	67e6                	ld	a5,88(sp)
    80003688:	0007b023          	sd	zero,0(a5)
    8000368c:	67e6                	ld	a5,88(sp)
    8000368e:	07a1                	add	a5,a5,8
    80003690:	ecbe                	sd	a5,88(sp)
    80003692:	77a6                	ld	a5,104(sp)
    80003694:	0785                	add	a5,a5,1
    80003696:	f4be                	sd	a5,104(sp)
    80003698:	7726                	ld	a4,104(sp)
    8000369a:	6782                	ld	a5,0(sp)
    8000369c:	fef765e3          	bltu	a4,a5,80003686 <OSTaskCreate+0x122>
    800036a0:	67a2                	ld	a5,8(sp)
    800036a2:	078e                	sll	a5,a5,0x3
    800036a4:	6742                	ld	a4,16(sp)
    800036a6:	97ba                	add	a5,a5,a4
    800036a8:	e4be                	sd	a5,72(sp)
    800036aa:	09815783          	lhu	a5,152(sp)
    800036ae:	6702                	ld	a4,0(sp)
    800036b0:	66a6                	ld	a3,72(sp)
    800036b2:	6642                	ld	a2,16(sp)
    800036b4:	7582                	ld	a1,32(sp)
    800036b6:	7522                	ld	a0,40(sp)
    800036b8:	af4fe0ef          	jal	800019ac <OSTaskStkInit>
    800036bc:	ecaa                	sd	a0,88(sp)
    800036be:	6766                	ld	a4,88(sp)
    800036c0:	67c2                	ld	a5,16(sp)
    800036c2:	00f77863          	bgeu	a4,a5,800036d2 <OSTaskCreate+0x16e>
    800036c6:	778a                	ld	a5,160(sp)
    800036c8:	671d                	lui	a4,0x7
    800036ca:	e3270713          	add	a4,a4,-462 # 6e32 <CPU_MSTATUS_MIE+0x6e2a>
    800036ce:	c398                	sw	a4,0(a5)
    800036d0:	a205                	j	800037f0 <OSTaskCreate+0x28c>
    800036d2:	77e2                	ld	a5,56(sp)
    800036d4:	7722                	ld	a4,40(sp)
    800036d6:	e7b8                	sd	a4,72(a5)
    800036d8:	77e2                	ld	a5,56(sp)
    800036da:	7702                	ld	a4,32(sp)
    800036dc:	ebb8                	sd	a4,80(a5)
    800036de:	77e2                	ld	a5,56(sp)
    800036e0:	7742                	ld	a4,48(sp)
    800036e2:	ef98                	sd	a4,24(a5)
    800036e4:	77e2                	ld	a5,56(sp)
    800036e6:	01f14703          	lbu	a4,31(sp)
    800036ea:	06e789a3          	sb	a4,115(a5)
    800036ee:	77e2                	ld	a5,56(sp)
    800036f0:	01f14703          	lbu	a4,31(sp)
    800036f4:	06e78a23          	sb	a4,116(a5)
    800036f8:	77e2                	ld	a5,56(sp)
    800036fa:	6766                	ld	a4,88(sp)
    800036fc:	e398                	sd	a4,0(a5)
    800036fe:	77e2                	ld	a5,56(sp)
    80003700:	6726                	ld	a4,72(sp)
    80003702:	eb98                	sd	a4,16(a5)
    80003704:	77e2                	ld	a5,56(sp)
    80003706:	472a                	lw	a4,136(sp)
    80003708:	08e7ac23          	sw	a4,152(a5)
    8000370c:	47aa                	lw	a5,136(sp)
    8000370e:	2781                	sext.w	a5,a5
    80003710:	eb91                	bnez	a5,80003724 <OSTaskCreate+0x1c0>
    80003712:	00008797          	auipc	a5,0x8
    80003716:	24a78793          	add	a5,a5,586 # 8000b95c <OSSchedRoundRobinDfltTimeQuanta>
    8000371a:	4398                	lw	a4,0(a5)
    8000371c:	77e2                	ld	a5,56(sp)
    8000371e:	08e7ae23          	sw	a4,156(a5)
    80003722:	a029                	j	8000372c <OSTaskCreate+0x1c8>
    80003724:	77e2                	ld	a5,56(sp)
    80003726:	472a                	lw	a4,136(sp)
    80003728:	08e7ae23          	sw	a4,156(a5)
    8000372c:	77e2                	ld	a5,56(sp)
    8000372e:	674a                	ld	a4,144(sp)
    80003730:	e798                	sd	a4,8(a5)
    80003732:	77e2                	ld	a5,56(sp)
    80003734:	6742                	ld	a4,16(sp)
    80003736:	e3b8                	sd	a4,64(a5)
    80003738:	77e2                	ld	a5,56(sp)
    8000373a:	6702                	ld	a4,0(sp)
    8000373c:	e3d8                	sd	a4,128(a5)
    8000373e:	77e2                	ld	a5,56(sp)
    80003740:	09815703          	lhu	a4,152(sp)
    80003744:	08e79423          	sh	a4,136(a5)
    80003748:	060103a3          	sb	zero,103(sp)
    8000374c:	a839                	j	8000376a <OSTaskCreate+0x206>
    8000374e:	06714783          	lbu	a5,103(sp)
    80003752:	2781                	sext.w	a5,a5
    80003754:	7762                	ld	a4,56(sp)
    80003756:	07e9                	add	a5,a5,26
    80003758:	078e                	sll	a5,a5,0x3
    8000375a:	97ba                	add	a5,a5,a4
    8000375c:	0007b023          	sd	zero,0(a5)
    80003760:	06714783          	lbu	a5,103(sp)
    80003764:	2785                	addw	a5,a5,1
    80003766:	06f103a3          	sb	a5,103(sp)
    8000376a:	06714783          	lbu	a5,103(sp)
    8000376e:	0ff7f793          	zext.b	a5,a5
    80003772:	dff1                	beqz	a5,8000374e <OSTaskCreate+0x1ea>
    80003774:	77e2                	ld	a5,56(sp)
    80003776:	0b078793          	add	a5,a5,176
    8000377a:	08015703          	lhu	a4,128(sp)
    8000377e:	85ba                	mv	a1,a4
    80003780:	853e                	mv	a0,a5
    80003782:	a2dff0ef          	jal	800031ae <OS_MsgQInit>
    80003786:	7562                	ld	a0,56(sp)
    80003788:	9acfe0ef          	jal	80001934 <OSTaskCreateHook>
    8000378c:	b83fd0ef          	jal	8000130e <CPU_SR_Save>
    80003790:	e8aa                	sd	a0,80(sp)
    80003792:	77e2                	ld	a5,56(sp)
    80003794:	0737c783          	lbu	a5,115(a5)
    80003798:	853e                	mv	a0,a5
    8000379a:	3fd030ef          	jal	80007396 <OS_PrioInsert>
    8000379e:	7562                	ld	a0,56(sp)
    800037a0:	4fe020ef          	jal	80005c9e <OS_RdyListInsertTail>
    800037a4:	7562                	ld	a0,56(sp)
    800037a6:	20a010ef          	jal	800049b0 <OS_TaskDbgListAdd>
    800037aa:	00008797          	auipc	a5,0x8
    800037ae:	1ee78793          	add	a5,a5,494 # 8000b998 <OSTaskQty>
    800037b2:	0007d783          	lhu	a5,0(a5)
    800037b6:	2785                	addw	a5,a5,1
    800037b8:	03079713          	sll	a4,a5,0x30
    800037bc:	9341                	srl	a4,a4,0x30
    800037be:	00008797          	auipc	a5,0x8
    800037c2:	1da78793          	add	a5,a5,474 # 8000b998 <OSTaskQty>
    800037c6:	00e79023          	sh	a4,0(a5)
    800037ca:	00008797          	auipc	a5,0x8
    800037ce:	14378793          	add	a5,a5,323 # 8000b90d <OSRunning>
    800037d2:	0007c783          	lbu	a5,0(a5)
    800037d6:	873e                	mv	a4,a5
    800037d8:	4785                	li	a5,1
    800037da:	00f70663          	beq	a4,a5,800037e6 <OSTaskCreate+0x282>
    800037de:	6546                	ld	a0,80(sp)
    800037e0:	b3bfd0ef          	jal	8000131a <CPU_SR_Restore>
    800037e4:	a031                	j	800037f0 <OSTaskCreate+0x28c>
    800037e6:	6546                	ld	a0,80(sp)
    800037e8:	b33fd0ef          	jal	8000131a <CPU_SR_Restore>
    800037ec:	15b010ef          	jal	80005146 <OSSched>
    800037f0:	70e6                	ld	ra,120(sp)
    800037f2:	6109                	add	sp,sp,128
    800037f4:	8082                	ret

00000000800037f6 <OSTaskDel>:
    800037f6:	7139                	add	sp,sp,-64
    800037f8:	fc06                	sd	ra,56(sp)
    800037fa:	e42a                	sd	a0,8(sp)
    800037fc:	e02e                	sd	a1,0(sp)
    800037fe:	f002                	sd	zero,32(sp)
    80003800:	00008797          	auipc	a5,0x8
    80003804:	10c78793          	add	a5,a5,268 # 8000b90c <OSIntNestingCtr>
    80003808:	0007c783          	lbu	a5,0(a5)
    8000380c:	c799                	beqz	a5,8000381a <OSTaskDel+0x24>
    8000380e:	6782                	ld	a5,0(sp)
    80003810:	671d                	lui	a4,0x7
    80003812:	14e70713          	add	a4,a4,334 # 714e <CPU_MSTATUS_MIE+0x7146>
    80003816:	c398                	sw	a4,0(a5)
    80003818:	a405                	j	80003a38 <OSTaskDel+0x242>
    8000381a:	00008797          	auipc	a5,0x8
    8000381e:	0f378793          	add	a5,a5,243 # 8000b90d <OSRunning>
    80003822:	0007c783          	lbu	a5,0(a5)
    80003826:	873e                	mv	a4,a5
    80003828:	4785                	li	a5,1
    8000382a:	00f70863          	beq	a4,a5,8000383a <OSTaskDel+0x44>
    8000382e:	6782                	ld	a5,0(sp)
    80003830:	6719                	lui	a4,0x6
    80003832:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80003836:	c398                	sw	a4,0(a5)
    80003838:	a401                	j	80003a38 <OSTaskDel+0x242>
    8000383a:	6722                	ld	a4,8(sp)
    8000383c:	00019797          	auipc	a5,0x19
    80003840:	4d478793          	add	a5,a5,1236 # 8001cd10 <OSIdleTaskTCB>
    80003844:	00f71863          	bne	a4,a5,80003854 <OSTaskDel+0x5e>
    80003848:	6782                	ld	a5,0(sp)
    8000384a:	671d                	lui	a4,0x7
    8000384c:	14c70713          	add	a4,a4,332 # 714c <CPU_MSTATUS_MIE+0x7144>
    80003850:	c398                	sw	a4,0(a5)
    80003852:	a2dd                	j	80003a38 <OSTaskDel+0x242>
    80003854:	67a2                	ld	a5,8(sp)
    80003856:	ef89                	bnez	a5,80003870 <OSTaskDel+0x7a>
    80003858:	ab7fd0ef          	jal	8000130e <CPU_SR_Save>
    8000385c:	f02a                	sd	a0,32(sp)
    8000385e:	00008797          	auipc	a5,0x8
    80003862:	16a78793          	add	a5,a5,362 # 8000b9c8 <OSTCBCurPtr>
    80003866:	639c                	ld	a5,0(a5)
    80003868:	e43e                	sd	a5,8(sp)
    8000386a:	7502                	ld	a0,32(sp)
    8000386c:	aaffd0ef          	jal	8000131a <CPU_SR_Restore>
    80003870:	a9ffd0ef          	jal	8000130e <CPU_SR_Save>
    80003874:	f02a                	sd	a0,32(sp)
    80003876:	67a2                	ld	a5,8(sp)
    80003878:	0727c783          	lbu	a5,114(a5)
    8000387c:	2781                	sext.w	a5,a5
    8000387e:	86be                	mv	a3,a5
    80003880:	471d                	li	a4,7
    80003882:	12d76e63          	bltu	a4,a3,800039be <OSTaskDel+0x1c8>
    80003886:	00279713          	sll	a4,a5,0x2
    8000388a:	00008797          	auipc	a5,0x8
    8000388e:	b5a78793          	add	a5,a5,-1190 # 8000b3e4 <CPU_CntLeadZerosTbl+0x124>
    80003892:	97ba                	add	a5,a5,a4
    80003894:	439c                	lw	a5,0(a5)
    80003896:	0007871b          	sext.w	a4,a5
    8000389a:	00008797          	auipc	a5,0x8
    8000389e:	b4a78793          	add	a5,a5,-1206 # 8000b3e4 <CPU_CntLeadZerosTbl+0x124>
    800038a2:	97ba                	add	a5,a5,a4
    800038a4:	8782                	jr	a5
    800038a6:	6522                	ld	a0,8(sp)
    800038a8:	504020ef          	jal	80005dac <OS_RdyListRemove>
    800038ac:	a22d                	j	800039d6 <OSTaskDel+0x1e0>
    800038ae:	6522                	ld	a0,8(sp)
    800038b0:	516030ef          	jal	80006dc6 <OS_TickListRemove>
    800038b4:	a20d                	j	800039d6 <OSTaskDel+0x1e0>
    800038b6:	67a2                	ld	a5,8(sp)
    800038b8:	0707c783          	lbu	a5,112(a5)
    800038bc:	2781                	sext.w	a5,a5
    800038be:	0007871b          	sext.w	a4,a5
    800038c2:	86ba                	mv	a3,a4
    800038c4:	479d                	li	a5,7
    800038c6:	00d7b7b3          	sltu	a5,a5,a3
    800038ca:	0ff7f793          	zext.b	a5,a5
    800038ce:	e3e9                	bnez	a5,80003990 <OSTaskDel+0x19a>
    800038d0:	4785                	li	a5,1
    800038d2:	00e797b3          	sll	a5,a5,a4
    800038d6:	0627f713          	and	a4,a5,98
    800038da:	00e03733          	snez	a4,a4
    800038de:	0ff77713          	zext.b	a4,a4
    800038e2:	ef19                	bnez	a4,80003900 <OSTaskDel+0x10a>
    800038e4:	0857f713          	and	a4,a5,133
    800038e8:	00e03733          	snez	a4,a4
    800038ec:	0ff77713          	zext.b	a4,a4
    800038f0:	e355                	bnez	a4,80003994 <OSTaskDel+0x19e>
    800038f2:	8bc1                	and	a5,a5,16
    800038f4:	00f037b3          	snez	a5,a5
    800038f8:	0ff7f793          	zext.b	a5,a5
    800038fc:	e791                	bnez	a5,80003908 <OSTaskDel+0x112>
    800038fe:	a849                	j	80003990 <OSTaskDel+0x19a>
    80003900:	6522                	ld	a0,8(sp)
    80003902:	0ec020ef          	jal	800059ee <OS_PendListRemove>
    80003906:	a851                	j	8000399a <OSTaskDel+0x1a4>
    80003908:	67a2                	ld	a5,8(sp)
    8000390a:	77bc                	ld	a5,104(a5)
    8000390c:	67bc                	ld	a5,72(a5)
    8000390e:	ec3e                	sd	a5,24(sp)
    80003910:	67e2                	ld	a5,24(sp)
    80003912:	0737c783          	lbu	a5,115(a5)
    80003916:	02f107a3          	sb	a5,47(sp)
    8000391a:	6522                	ld	a0,8(sp)
    8000391c:	0d2020ef          	jal	800059ee <OS_PendListRemove>
    80003920:	67e2                	ld	a5,24(sp)
    80003922:	0737c703          	lbu	a4,115(a5)
    80003926:	67e2                	ld	a5,24(sp)
    80003928:	0747c783          	lbu	a5,116(a5)
    8000392c:	02f70f63          	beq	a4,a5,8000396a <OSTaskDel+0x174>
    80003930:	67e2                	ld	a5,24(sp)
    80003932:	0737c703          	lbu	a4,115(a5)
    80003936:	67a2                	ld	a5,8(sp)
    80003938:	0737c783          	lbu	a5,115(a5)
    8000393c:	02f71763          	bne	a4,a5,8000396a <OSTaskDel+0x174>
    80003940:	6562                	ld	a0,24(sp)
    80003942:	08a030ef          	jal	800069cc <OS_MutexGrpPrioFindHighest>
    80003946:	87aa                	mv	a5,a0
    80003948:	02f107a3          	sb	a5,47(sp)
    8000394c:	67e2                	ld	a5,24(sp)
    8000394e:	0747c783          	lbu	a5,116(a5)
    80003952:	863e                	mv	a2,a5
    80003954:	02f14783          	lbu	a5,47(sp)
    80003958:	0ff7f693          	zext.b	a3,a5
    8000395c:	0ff67713          	zext.b	a4,a2
    80003960:	00d77363          	bgeu	a4,a3,80003966 <OSTaskDel+0x170>
    80003964:	87b2                	mv	a5,a2
    80003966:	02f107a3          	sb	a5,47(sp)
    8000396a:	67a2                	ld	a5,8(sp)
    8000396c:	06078823          	sb	zero,112(a5)
    80003970:	67e2                	ld	a5,24(sp)
    80003972:	0737c703          	lbu	a4,115(a5)
    80003976:	02f14783          	lbu	a5,47(sp)
    8000397a:	0ff7f793          	zext.b	a5,a5
    8000397e:	00e78d63          	beq	a5,a4,80003998 <OSTaskDel+0x1a2>
    80003982:	02f14783          	lbu	a5,47(sp)
    80003986:	85be                	mv	a1,a5
    80003988:	6562                	ld	a0,24(sp)
    8000398a:	2b8010ef          	jal	80004c42 <OS_TaskChangePrio>
    8000398e:	a029                	j	80003998 <OSTaskDel+0x1a2>
    80003990:	0001                	nop
    80003992:	a021                	j	8000399a <OSTaskDel+0x1a4>
    80003994:	0001                	nop
    80003996:	a011                	j	8000399a <OSTaskDel+0x1a4>
    80003998:	0001                	nop
    8000399a:	67a2                	ld	a5,8(sp)
    8000399c:	0727c783          	lbu	a5,114(a5)
    800039a0:	873e                	mv	a4,a5
    800039a2:	478d                	li	a5,3
    800039a4:	00f70963          	beq	a4,a5,800039b6 <OSTaskDel+0x1c0>
    800039a8:	67a2                	ld	a5,8(sp)
    800039aa:	0727c783          	lbu	a5,114(a5)
    800039ae:	873e                	mv	a4,a5
    800039b0:	479d                	li	a5,7
    800039b2:	02f71163          	bne	a4,a5,800039d4 <OSTaskDel+0x1de>
    800039b6:	6522                	ld	a0,8(sp)
    800039b8:	40e030ef          	jal	80006dc6 <OS_TickListRemove>
    800039bc:	a821                	j	800039d4 <OSTaskDel+0x1de>
    800039be:	7502                	ld	a0,32(sp)
    800039c0:	95bfd0ef          	jal	8000131a <CPU_SR_Restore>
    800039c4:	6782                	ld	a5,0(sp)
    800039c6:	671d                	lui	a4,0x7
    800039c8:	e2d70713          	add	a4,a4,-467 # 6e2d <CPU_MSTATUS_MIE+0x6e25>
    800039cc:	c398                	sw	a4,0(a5)
    800039ce:	a0ad                	j	80003a38 <OSTaskDel+0x242>
    800039d0:	0001                	nop
    800039d2:	a011                	j	800039d6 <OSTaskDel+0x1e0>
    800039d4:	0001                	nop
    800039d6:	67a2                	ld	a5,8(sp)
    800039d8:	7fbc                	ld	a5,120(a5)
    800039da:	c781                	beqz	a5,800039e2 <OSTaskDel+0x1ec>
    800039dc:	6522                	ld	a0,8(sp)
    800039de:	052030ef          	jal	80006a30 <OS_MutexGrpPostAll>
    800039e2:	67a2                	ld	a5,8(sp)
    800039e4:	0b078793          	add	a5,a5,176
    800039e8:	853e                	mv	a0,a5
    800039ea:	f1cff0ef          	jal	80003106 <OS_MsgQFreeAll>
    800039ee:	6522                	ld	a0,8(sp)
    800039f0:	f6dfd0ef          	jal	8000195c <OSTaskDelHook>
    800039f4:	6522                	ld	a0,8(sp)
    800039f6:	00a010ef          	jal	80004a00 <OS_TaskDbgListRemove>
    800039fa:	00008797          	auipc	a5,0x8
    800039fe:	f9e78793          	add	a5,a5,-98 # 8000b998 <OSTaskQty>
    80003a02:	0007d783          	lhu	a5,0(a5)
    80003a06:	37fd                	addw	a5,a5,-1
    80003a08:	03079713          	sll	a4,a5,0x30
    80003a0c:	9341                	srl	a4,a4,0x30
    80003a0e:	00008797          	auipc	a5,0x8
    80003a12:	f8a78793          	add	a5,a5,-118 # 8000b998 <OSTaskQty>
    80003a16:	00e79023          	sh	a4,0(a5)
    80003a1a:	6522                	ld	a0,8(sp)
    80003a1c:	082010ef          	jal	80004a9e <OS_TaskInitTCB>
    80003a20:	67a2                	ld	a5,8(sp)
    80003a22:	577d                	li	a4,-1
    80003a24:	06e78923          	sb	a4,114(a5)
    80003a28:	6782                	ld	a5,0(sp)
    80003a2a:	0007a023          	sw	zero,0(a5)
    80003a2e:	7502                	ld	a0,32(sp)
    80003a30:	8ebfd0ef          	jal	8000131a <CPU_SR_Restore>
    80003a34:	712010ef          	jal	80005146 <OSSched>
    80003a38:	70e2                	ld	ra,56(sp)
    80003a3a:	6121                	add	sp,sp,64
    80003a3c:	8082                	ret

0000000080003a3e <OSTaskQFlush>:
    80003a3e:	7179                	add	sp,sp,-48
    80003a40:	f406                	sd	ra,40(sp)
    80003a42:	e42a                	sd	a0,8(sp)
    80003a44:	e02e                	sd	a1,0(sp)
    80003a46:	ec02                	sd	zero,24(sp)
    80003a48:	00008797          	auipc	a5,0x8
    80003a4c:	ec478793          	add	a5,a5,-316 # 8000b90c <OSIntNestingCtr>
    80003a50:	0007c783          	lbu	a5,0(a5)
    80003a54:	cb81                	beqz	a5,80003a64 <OSTaskQFlush+0x26>
    80003a56:	6782                	ld	a5,0(sp)
    80003a58:	6711                	lui	a4,0x4
    80003a5a:	b0070713          	add	a4,a4,-1280 # 3b00 <CPU_MSTATUS_MIE+0x3af8>
    80003a5e:	c398                	sw	a4,0(a5)
    80003a60:	4781                	li	a5,0
    80003a62:	a0a5                	j	80003aca <OSTaskQFlush+0x8c>
    80003a64:	00008797          	auipc	a5,0x8
    80003a68:	ea978793          	add	a5,a5,-343 # 8000b90d <OSRunning>
    80003a6c:	0007c783          	lbu	a5,0(a5)
    80003a70:	873e                	mv	a4,a5
    80003a72:	4785                	li	a5,1
    80003a74:	00f70963          	beq	a4,a5,80003a86 <OSTaskQFlush+0x48>
    80003a78:	6782                	ld	a5,0(sp)
    80003a7a:	6719                	lui	a4,0x6
    80003a7c:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80003a80:	c398                	sw	a4,0(a5)
    80003a82:	4781                	li	a5,0
    80003a84:	a099                	j	80003aca <OSTaskQFlush+0x8c>
    80003a86:	67a2                	ld	a5,8(sp)
    80003a88:	ef89                	bnez	a5,80003aa2 <OSTaskQFlush+0x64>
    80003a8a:	885fd0ef          	jal	8000130e <CPU_SR_Save>
    80003a8e:	ec2a                	sd	a0,24(sp)
    80003a90:	00008797          	auipc	a5,0x8
    80003a94:	f3878793          	add	a5,a5,-200 # 8000b9c8 <OSTCBCurPtr>
    80003a98:	639c                	ld	a5,0(a5)
    80003a9a:	e43e                	sd	a5,8(sp)
    80003a9c:	6562                	ld	a0,24(sp)
    80003a9e:	87dfd0ef          	jal	8000131a <CPU_SR_Restore>
    80003aa2:	86dfd0ef          	jal	8000130e <CPU_SR_Save>
    80003aa6:	ec2a                	sd	a0,24(sp)
    80003aa8:	67a2                	ld	a5,8(sp)
    80003aaa:	0b078793          	add	a5,a5,176
    80003aae:	853e                	mv	a0,a5
    80003ab0:	e56ff0ef          	jal	80003106 <OS_MsgQFreeAll>
    80003ab4:	87aa                	mv	a5,a0
    80003ab6:	00f11b23          	sh	a5,22(sp)
    80003aba:	6562                	ld	a0,24(sp)
    80003abc:	85ffd0ef          	jal	8000131a <CPU_SR_Restore>
    80003ac0:	6782                	ld	a5,0(sp)
    80003ac2:	0007a023          	sw	zero,0(a5)
    80003ac6:	01615783          	lhu	a5,22(sp)
    80003aca:	853e                	mv	a0,a5
    80003acc:	70a2                	ld	ra,40(sp)
    80003ace:	6145                	add	sp,sp,48
    80003ad0:	8082                	ret

0000000080003ad2 <OSTaskQPend>:
    80003ad2:	715d                	add	sp,sp,-80
    80003ad4:	e486                	sd	ra,72(sp)
    80003ad6:	87aa                	mv	a5,a0
    80003ad8:	e832                	sd	a2,16(sp)
    80003ada:	e436                	sd	a3,8(sp)
    80003adc:	e03a                	sd	a4,0(sp)
    80003ade:	ce3e                	sw	a5,28(sp)
    80003ae0:	87ae                	mv	a5,a1
    80003ae2:	00f11d23          	sh	a5,26(sp)
    80003ae6:	f802                	sd	zero,48(sp)
    80003ae8:	00008797          	auipc	a5,0x8
    80003aec:	e2478793          	add	a5,a5,-476 # 8000b90c <OSIntNestingCtr>
    80003af0:	0007c783          	lbu	a5,0(a5)
    80003af4:	cb81                	beqz	a5,80003b04 <OSTaskQPend+0x32>
    80003af6:	6782                	ld	a5,0(sp)
    80003af8:	6719                	lui	a4,0x6
    80003afa:	1ae70713          	add	a4,a4,430 # 61ae <CPU_MSTATUS_MIE+0x61a6>
    80003afe:	c398                	sw	a4,0(a5)
    80003b00:	4781                	li	a5,0
    80003b02:	aaad                	j	80003c7c <OSTaskQPend+0x1aa>
    80003b04:	00008797          	auipc	a5,0x8
    80003b08:	e0978793          	add	a5,a5,-503 # 8000b90d <OSRunning>
    80003b0c:	0007c783          	lbu	a5,0(a5)
    80003b10:	873e                	mv	a4,a5
    80003b12:	4785                	li	a5,1
    80003b14:	00f70963          	beq	a4,a5,80003b26 <OSTaskQPend+0x54>
    80003b18:	6782                	ld	a5,0(sp)
    80003b1a:	6719                	lui	a4,0x6
    80003b1c:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80003b20:	c398                	sw	a4,0(a5)
    80003b22:	4781                	li	a5,0
    80003b24:	aaa1                	j	80003c7c <OSTaskQPend+0x1aa>
    80003b26:	67c2                	ld	a5,16(sp)
    80003b28:	eb81                	bnez	a5,80003b38 <OSTaskQPend+0x66>
    80003b2a:	6782                	ld	a5,0(sp)
    80003b2c:	6719                	lui	a4,0x6
    80003b2e:	2d570713          	add	a4,a4,725 # 62d5 <CPU_MSTATUS_MIE+0x62cd>
    80003b32:	c398                	sw	a4,0(a5)
    80003b34:	4781                	li	a5,0
    80003b36:	a299                	j	80003c7c <OSTaskQPend+0x1aa>
    80003b38:	01a15783          	lhu	a5,26(sp)
    80003b3c:	2781                	sext.w	a5,a5
    80003b3e:	cf81                	beqz	a5,80003b56 <OSTaskQPend+0x84>
    80003b40:	873e                	mv	a4,a5
    80003b42:	67a1                	lui	a5,0x8
    80003b44:	00f70963          	beq	a4,a5,80003b56 <OSTaskQPend+0x84>
    80003b48:	6782                	ld	a5,0(sp)
    80003b4a:	6719                	lui	a4,0x6
    80003b4c:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80003b50:	c398                	sw	a4,0(a5)
    80003b52:	4781                	li	a5,0
    80003b54:	a225                	j	80003c7c <OSTaskQPend+0x1aa>
    80003b56:	0001                	nop
    80003b58:	67a2                	ld	a5,8(sp)
    80003b5a:	c781                	beqz	a5,80003b62 <OSTaskQPend+0x90>
    80003b5c:	67a2                	ld	a5,8(sp)
    80003b5e:	0007a023          	sw	zero,0(a5) # 8000 <CPU_MSTATUS_MIE+0x7ff8>
    80003b62:	facfd0ef          	jal	8000130e <CPU_SR_Save>
    80003b66:	f82a                	sd	a0,48(sp)
    80003b68:	00008797          	auipc	a5,0x8
    80003b6c:	e6078793          	add	a5,a5,-416 # 8000b9c8 <OSTCBCurPtr>
    80003b70:	639c                	ld	a5,0(a5)
    80003b72:	0b078793          	add	a5,a5,176
    80003b76:	f43e                	sd	a5,40(sp)
    80003b78:	6682                	ld	a3,0(sp)
    80003b7a:	6622                	ld	a2,8(sp)
    80003b7c:	65c2                	ld	a1,16(sp)
    80003b7e:	7522                	ld	a0,40(sp)
    80003b80:	e60ff0ef          	jal	800031e0 <OS_MsgQGet>
    80003b84:	fc2a                	sd	a0,56(sp)
    80003b86:	6782                	ld	a5,0(sp)
    80003b88:	439c                	lw	a5,0(a5)
    80003b8a:	e791                	bnez	a5,80003b96 <OSTaskQPend+0xc4>
    80003b8c:	7542                	ld	a0,48(sp)
    80003b8e:	f8cfd0ef          	jal	8000131a <CPU_SR_Restore>
    80003b92:	77e2                	ld	a5,56(sp)
    80003b94:	a0e5                	j	80003c7c <OSTaskQPend+0x1aa>
    80003b96:	01a11783          	lh	a5,26(sp)
    80003b9a:	0007dc63          	bgez	a5,80003bb2 <OSTaskQPend+0xe0>
    80003b9e:	6782                	ld	a5,0(sp)
    80003ba0:	6719                	lui	a4,0x6
    80003ba2:	1b070713          	add	a4,a4,432 # 61b0 <CPU_MSTATUS_MIE+0x61a8>
    80003ba6:	c398                	sw	a4,0(a5)
    80003ba8:	7542                	ld	a0,48(sp)
    80003baa:	f70fd0ef          	jal	8000131a <CPU_SR_Restore>
    80003bae:	4781                	li	a5,0
    80003bb0:	a0f1                	j	80003c7c <OSTaskQPend+0x1aa>
    80003bb2:	00008797          	auipc	a5,0x8
    80003bb6:	da878793          	add	a5,a5,-600 # 8000b95a <OSSchedLockNestingCtr>
    80003bba:	0007c783          	lbu	a5,0(a5)
    80003bbe:	cb99                	beqz	a5,80003bd4 <OSTaskQPend+0x102>
    80003bc0:	7542                	ld	a0,48(sp)
    80003bc2:	f58fd0ef          	jal	8000131a <CPU_SR_Restore>
    80003bc6:	6782                	ld	a5,0(sp)
    80003bc8:	671d                	lui	a4,0x7
    80003bca:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80003bce:	c398                	sw	a4,0(a5)
    80003bd0:	4781                	li	a5,0
    80003bd2:	a06d                	j	80003c7c <OSTaskQPend+0x1aa>
    80003bd4:	00008797          	auipc	a5,0x8
    80003bd8:	df478793          	add	a5,a5,-524 # 8000b9c8 <OSTCBCurPtr>
    80003bdc:	639c                	ld	a5,0(a5)
    80003bde:	4772                	lw	a4,28(sp)
    80003be0:	86ba                	mv	a3,a4
    80003be2:	4609                	li	a2,2
    80003be4:	85be                	mv	a1,a5
    80003be6:	4501                	li	a0,0
    80003be8:	2f7010ef          	jal	800056de <OS_Pend>
    80003bec:	7542                	ld	a0,48(sp)
    80003bee:	f2cfd0ef          	jal	8000131a <CPU_SR_Restore>
    80003bf2:	554010ef          	jal	80005146 <OSSched>
    80003bf6:	f18fd0ef          	jal	8000130e <CPU_SR_Save>
    80003bfa:	f82a                	sd	a0,48(sp)
    80003bfc:	00008797          	auipc	a5,0x8
    80003c00:	dcc78793          	add	a5,a5,-564 # 8000b9c8 <OSTCBCurPtr>
    80003c04:	639c                	ld	a5,0(a5)
    80003c06:	0717c783          	lbu	a5,113(a5)
    80003c0a:	2781                	sext.w	a5,a5
    80003c0c:	c791                	beqz	a5,80003c18 <OSTaskQPend+0x146>
    80003c0e:	873e                	mv	a4,a5
    80003c10:	4785                	li	a5,1
    80003c12:	02f70863          	beq	a4,a5,80003c42 <OSTaskQPend+0x170>
    80003c16:	a0a9                	j	80003c60 <OSTaskQPend+0x18e>
    80003c18:	00008797          	auipc	a5,0x8
    80003c1c:	db078793          	add	a5,a5,-592 # 8000b9c8 <OSTCBCurPtr>
    80003c20:	639c                	ld	a5,0(a5)
    80003c22:	73dc                	ld	a5,160(a5)
    80003c24:	fc3e                	sd	a5,56(sp)
    80003c26:	00008797          	auipc	a5,0x8
    80003c2a:	da278793          	add	a5,a5,-606 # 8000b9c8 <OSTCBCurPtr>
    80003c2e:	639c                	ld	a5,0(a5)
    80003c30:	0a87d703          	lhu	a4,168(a5)
    80003c34:	67c2                	ld	a5,16(sp)
    80003c36:	00e79023          	sh	a4,0(a5)
    80003c3a:	6782                	ld	a5,0(sp)
    80003c3c:	0007a023          	sw	zero,0(a5)
    80003c40:	a815                	j	80003c74 <OSTaskQPend+0x1a2>
    80003c42:	fc02                	sd	zero,56(sp)
    80003c44:	67c2                	ld	a5,16(sp)
    80003c46:	00079023          	sh	zero,0(a5)
    80003c4a:	67a2                	ld	a5,8(sp)
    80003c4c:	c781                	beqz	a5,80003c54 <OSTaskQPend+0x182>
    80003c4e:	67a2                	ld	a5,8(sp)
    80003c50:	0007a023          	sw	zero,0(a5)
    80003c54:	6782                	ld	a5,0(sp)
    80003c56:	6719                	lui	a4,0x6
    80003c58:	1a970713          	add	a4,a4,425 # 61a9 <CPU_MSTATUS_MIE+0x61a1>
    80003c5c:	c398                	sw	a4,0(a5)
    80003c5e:	a819                	j	80003c74 <OSTaskQPend+0x1a2>
    80003c60:	fc02                	sd	zero,56(sp)
    80003c62:	67c2                	ld	a5,16(sp)
    80003c64:	00079023          	sh	zero,0(a5)
    80003c68:	6782                	ld	a5,0(sp)
    80003c6a:	671d                	lui	a4,0x7
    80003c6c:	2d970713          	add	a4,a4,729 # 72d9 <CPU_MSTATUS_MIE+0x72d1>
    80003c70:	c398                	sw	a4,0(a5)
    80003c72:	0001                	nop
    80003c74:	7542                	ld	a0,48(sp)
    80003c76:	ea4fd0ef          	jal	8000131a <CPU_SR_Restore>
    80003c7a:	77e2                	ld	a5,56(sp)
    80003c7c:	853e                	mv	a0,a5
    80003c7e:	60a6                	ld	ra,72(sp)
    80003c80:	6161                	add	sp,sp,80
    80003c82:	8082                	ret

0000000080003c84 <OSTaskQPendAbort>:
    80003c84:	7139                	add	sp,sp,-64
    80003c86:	fc06                	sd	ra,56(sp)
    80003c88:	ec2a                	sd	a0,24(sp)
    80003c8a:	87ae                	mv	a5,a1
    80003c8c:	e432                	sd	a2,8(sp)
    80003c8e:	00f11b23          	sh	a5,22(sp)
    80003c92:	f402                	sd	zero,40(sp)
    80003c94:	00008797          	auipc	a5,0x8
    80003c98:	c7878793          	add	a5,a5,-904 # 8000b90c <OSIntNestingCtr>
    80003c9c:	0007c783          	lbu	a5,0(a5)
    80003ca0:	cb81                	beqz	a5,80003cb0 <OSTaskQPendAbort+0x2c>
    80003ca2:	67a2                	ld	a5,8(sp)
    80003ca4:	6719                	lui	a4,0x6
    80003ca6:	1aa70713          	add	a4,a4,426 # 61aa <CPU_MSTATUS_MIE+0x61a2>
    80003caa:	c398                	sw	a4,0(a5)
    80003cac:	4781                	li	a5,0
    80003cae:	a875                	j	80003d6a <OSTaskQPendAbort+0xe6>
    80003cb0:	00008797          	auipc	a5,0x8
    80003cb4:	c5d78793          	add	a5,a5,-931 # 8000b90d <OSRunning>
    80003cb8:	0007c783          	lbu	a5,0(a5)
    80003cbc:	873e                	mv	a4,a5
    80003cbe:	4785                	li	a5,1
    80003cc0:	00f70963          	beq	a4,a5,80003cd2 <OSTaskQPendAbort+0x4e>
    80003cc4:	67a2                	ld	a5,8(sp)
    80003cc6:	6719                	lui	a4,0x6
    80003cc8:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80003ccc:	c398                	sw	a4,0(a5)
    80003cce:	4781                	li	a5,0
    80003cd0:	a869                	j	80003d6a <OSTaskQPendAbort+0xe6>
    80003cd2:	01615783          	lhu	a5,22(sp)
    80003cd6:	2781                	sext.w	a5,a5
    80003cd8:	cf81                	beqz	a5,80003cf0 <OSTaskQPendAbort+0x6c>
    80003cda:	873e                	mv	a4,a5
    80003cdc:	67a1                	lui	a5,0x8
    80003cde:	00f70963          	beq	a4,a5,80003cf0 <OSTaskQPendAbort+0x6c>
    80003ce2:	67a2                	ld	a5,8(sp)
    80003ce4:	6719                	lui	a4,0x6
    80003ce6:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80003cea:	c398                	sw	a4,0(a5)
    80003cec:	4781                	li	a5,0
    80003cee:	a8b5                	j	80003d6a <OSTaskQPendAbort+0xe6>
    80003cf0:	0001                	nop
    80003cf2:	e1cfd0ef          	jal	8000130e <CPU_SR_Save>
    80003cf6:	f42a                	sd	a0,40(sp)
    80003cf8:	67e2                	ld	a5,24(sp)
    80003cfa:	cb89                	beqz	a5,80003d0c <OSTaskQPendAbort+0x88>
    80003cfc:	00008797          	auipc	a5,0x8
    80003d00:	ccc78793          	add	a5,a5,-820 # 8000b9c8 <OSTCBCurPtr>
    80003d04:	639c                	ld	a5,0(a5)
    80003d06:	6762                	ld	a4,24(sp)
    80003d08:	00f71c63          	bne	a4,a5,80003d20 <OSTaskQPendAbort+0x9c>
    80003d0c:	7522                	ld	a0,40(sp)
    80003d0e:	e0cfd0ef          	jal	8000131a <CPU_SR_Restore>
    80003d12:	67a2                	ld	a5,8(sp)
    80003d14:	6719                	lui	a4,0x6
    80003d16:	1ac70713          	add	a4,a4,428 # 61ac <CPU_MSTATUS_MIE+0x61a4>
    80003d1a:	c398                	sw	a4,0(a5)
    80003d1c:	4781                	li	a5,0
    80003d1e:	a0b1                	j	80003d6a <OSTaskQPendAbort+0xe6>
    80003d20:	67e2                	ld	a5,24(sp)
    80003d22:	0707c783          	lbu	a5,112(a5)
    80003d26:	873e                	mv	a4,a5
    80003d28:	4789                	li	a5,2
    80003d2a:	00f70c63          	beq	a4,a5,80003d42 <OSTaskQPendAbort+0xbe>
    80003d2e:	7522                	ld	a0,40(sp)
    80003d30:	deafd0ef          	jal	8000131a <CPU_SR_Restore>
    80003d34:	67a2                	ld	a5,8(sp)
    80003d36:	6719                	lui	a4,0x6
    80003d38:	1ab70713          	add	a4,a4,427 # 61ab <CPU_MSTATUS_MIE+0x61a3>
    80003d3c:	c398                	sw	a4,0(a5)
    80003d3e:	4781                	li	a5,0
    80003d40:	a02d                	j	80003d6a <OSTaskQPendAbort+0xe6>
    80003d42:	d202                	sw	zero,36(sp)
    80003d44:	5792                	lw	a5,36(sp)
    80003d46:	4605                	li	a2,1
    80003d48:	85be                	mv	a1,a5
    80003d4a:	6562                	ld	a0,24(sp)
    80003d4c:	1f1010ef          	jal	8000573c <OS_PendAbort>
    80003d50:	7522                	ld	a0,40(sp)
    80003d52:	dc8fd0ef          	jal	8000131a <CPU_SR_Restore>
    80003d56:	01611783          	lh	a5,22(sp)
    80003d5a:	0007c463          	bltz	a5,80003d62 <OSTaskQPendAbort+0xde>
    80003d5e:	3e8010ef          	jal	80005146 <OSSched>
    80003d62:	67a2                	ld	a5,8(sp)
    80003d64:	0007a023          	sw	zero,0(a5)
    80003d68:	4785                	li	a5,1
    80003d6a:	853e                	mv	a0,a5
    80003d6c:	70e2                	ld	ra,56(sp)
    80003d6e:	6121                	add	sp,sp,64
    80003d70:	8082                	ret

0000000080003d72 <OSTaskQPost>:
    80003d72:	7139                	add	sp,sp,-64
    80003d74:	fc06                	sd	ra,56(sp)
    80003d76:	ec2a                	sd	a0,24(sp)
    80003d78:	e82e                	sd	a1,16(sp)
    80003d7a:	87b2                	mv	a5,a2
    80003d7c:	e03a                	sd	a4,0(sp)
    80003d7e:	00f11723          	sh	a5,14(sp)
    80003d82:	87b6                	mv	a5,a3
    80003d84:	00f11623          	sh	a5,12(sp)
    80003d88:	f402                	sd	zero,40(sp)
    80003d8a:	00008797          	auipc	a5,0x8
    80003d8e:	b8378793          	add	a5,a5,-1149 # 8000b90d <OSRunning>
    80003d92:	0007c783          	lbu	a5,0(a5)
    80003d96:	873e                	mv	a4,a5
    80003d98:	4785                	li	a5,1
    80003d9a:	00f70863          	beq	a4,a5,80003daa <OSTaskQPost+0x38>
    80003d9e:	6782                	ld	a5,0(sp)
    80003da0:	6719                	lui	a4,0x6
    80003da2:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80003da6:	c398                	sw	a4,0(a5)
    80003da8:	aa05                	j	80003ed8 <OSTaskQPost+0x166>
    80003daa:	00c15783          	lhu	a5,12(sp)
    80003dae:	2781                	sext.w	a5,a5
    80003db0:	86be                	mv	a3,a5
    80003db2:	6721                	lui	a4,0x8
    80003db4:	0741                	add	a4,a4,16 # 8010 <CPU_MSTATUS_MIE+0x8008>
    80003db6:	02e68a63          	beq	a3,a4,80003dea <OSTaskQPost+0x78>
    80003dba:	86be                	mv	a3,a5
    80003dbc:	6721                	lui	a4,0x8
    80003dbe:	0741                	add	a4,a4,16 # 8010 <CPU_MSTATUS_MIE+0x8008>
    80003dc0:	00d74f63          	blt	a4,a3,80003dde <OSTaskQPost+0x6c>
    80003dc4:	86be                	mv	a3,a5
    80003dc6:	6721                	lui	a4,0x8
    80003dc8:	02e68163          	beq	a3,a4,80003dea <OSTaskQPost+0x78>
    80003dcc:	86be                	mv	a3,a5
    80003dce:	6721                	lui	a4,0x8
    80003dd0:	00d74763          	blt	a4,a3,80003dde <OSTaskQPost+0x6c>
    80003dd4:	cb99                	beqz	a5,80003dea <OSTaskQPost+0x78>
    80003dd6:	873e                	mv	a4,a5
    80003dd8:	47c1                	li	a5,16
    80003dda:	00f70863          	beq	a4,a5,80003dea <OSTaskQPost+0x78>
    80003dde:	6782                	ld	a5,0(sp)
    80003de0:	6719                	lui	a4,0x6
    80003de2:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80003de6:	c398                	sw	a4,0(a5)
    80003de8:	a8c5                	j	80003ed8 <OSTaskQPost+0x166>
    80003dea:	0001                	nop
    80003dec:	d202                	sw	zero,36(sp)
    80003dee:	6782                	ld	a5,0(sp)
    80003df0:	0007a023          	sw	zero,0(a5)
    80003df4:	d1afd0ef          	jal	8000130e <CPU_SR_Save>
    80003df8:	f42a                	sd	a0,40(sp)
    80003dfa:	67e2                	ld	a5,24(sp)
    80003dfc:	e799                	bnez	a5,80003e0a <OSTaskQPost+0x98>
    80003dfe:	00008797          	auipc	a5,0x8
    80003e02:	bca78793          	add	a5,a5,-1078 # 8000b9c8 <OSTCBCurPtr>
    80003e06:	639c                	ld	a5,0(a5)
    80003e08:	ec3e                	sd	a5,24(sp)
    80003e0a:	67e2                	ld	a5,24(sp)
    80003e0c:	0727c783          	lbu	a5,114(a5)
    80003e10:	2781                	sext.w	a5,a5
    80003e12:	86be                	mv	a3,a5
    80003e14:	471d                	li	a4,7
    80003e16:	0ad74763          	blt	a4,a3,80003ec4 <OSTaskQPost+0x152>
    80003e1a:	86be                	mv	a3,a5
    80003e1c:	4719                	li	a4,6
    80003e1e:	04e6d963          	bge	a3,a4,80003e70 <OSTaskQPost+0xfe>
    80003e22:	86be                	mv	a3,a5
    80003e24:	4715                	li	a4,5
    80003e26:	08d74f63          	blt	a4,a3,80003ec4 <OSTaskQPost+0x152>
    80003e2a:	86be                	mv	a3,a5
    80003e2c:	4711                	li	a4,4
    80003e2e:	02e6d163          	bge	a3,a4,80003e50 <OSTaskQPost+0xde>
    80003e32:	86be                	mv	a3,a5
    80003e34:	4705                	li	a4,1
    80003e36:	00d74563          	blt	a4,a3,80003e40 <OSTaskQPost+0xce>
    80003e3a:	0007db63          	bgez	a5,80003e50 <OSTaskQPost+0xde>
    80003e3e:	a059                	j	80003ec4 <OSTaskQPost+0x152>
    80003e40:	2781                	sext.w	a5,a5
    80003e42:	37f9                	addw	a5,a5,-2
    80003e44:	2781                	sext.w	a5,a5
    80003e46:	873e                	mv	a4,a5
    80003e48:	4785                	li	a5,1
    80003e4a:	06e7ed63          	bltu	a5,a4,80003ec4 <OSTaskQPost+0x152>
    80003e4e:	a00d                	j	80003e70 <OSTaskQPost+0xfe>
    80003e50:	67e2                	ld	a5,24(sp)
    80003e52:	0b078513          	add	a0,a5,176
    80003e56:	5712                	lw	a4,36(sp)
    80003e58:	00c15683          	lhu	a3,12(sp)
    80003e5c:	00e15603          	lhu	a2,14(sp)
    80003e60:	6782                	ld	a5,0(sp)
    80003e62:	65c2                	ld	a1,16(sp)
    80003e64:	c52ff0ef          	jal	800032b6 <OS_MsgQPut>
    80003e68:	7522                	ld	a0,40(sp)
    80003e6a:	cb0fd0ef          	jal	8000131a <CPU_SR_Restore>
    80003e6e:	a0ad                	j	80003ed8 <OSTaskQPost+0x166>
    80003e70:	67e2                	ld	a5,24(sp)
    80003e72:	0707c783          	lbu	a5,112(a5)
    80003e76:	873e                	mv	a4,a5
    80003e78:	4789                	li	a5,2
    80003e7a:	02f71563          	bne	a4,a5,80003ea4 <OSTaskQPost+0x132>
    80003e7e:	5712                	lw	a4,36(sp)
    80003e80:	00e15783          	lhu	a5,14(sp)
    80003e84:	86be                	mv	a3,a5
    80003e86:	6642                	ld	a2,16(sp)
    80003e88:	65e2                	ld	a1,24(sp)
    80003e8a:	4501                	li	a0,0
    80003e8c:	403010ef          	jal	80005a8e <OS_Post>
    80003e90:	7522                	ld	a0,40(sp)
    80003e92:	c88fd0ef          	jal	8000131a <CPU_SR_Restore>
    80003e96:	00c11783          	lh	a5,12(sp)
    80003e9a:	0207ce63          	bltz	a5,80003ed6 <OSTaskQPost+0x164>
    80003e9e:	2a8010ef          	jal	80005146 <OSSched>
    80003ea2:	a815                	j	80003ed6 <OSTaskQPost+0x164>
    80003ea4:	67e2                	ld	a5,24(sp)
    80003ea6:	0b078513          	add	a0,a5,176
    80003eaa:	5712                	lw	a4,36(sp)
    80003eac:	00c15683          	lhu	a3,12(sp)
    80003eb0:	00e15603          	lhu	a2,14(sp)
    80003eb4:	6782                	ld	a5,0(sp)
    80003eb6:	65c2                	ld	a1,16(sp)
    80003eb8:	bfeff0ef          	jal	800032b6 <OS_MsgQPut>
    80003ebc:	7522                	ld	a0,40(sp)
    80003ebe:	c5cfd0ef          	jal	8000131a <CPU_SR_Restore>
    80003ec2:	a811                	j	80003ed6 <OSTaskQPost+0x164>
    80003ec4:	7522                	ld	a0,40(sp)
    80003ec6:	c54fd0ef          	jal	8000131a <CPU_SR_Restore>
    80003eca:	6782                	ld	a5,0(sp)
    80003ecc:	671d                	lui	a4,0x7
    80003ece:	e2d70713          	add	a4,a4,-467 # 6e2d <CPU_MSTATUS_MIE+0x6e25>
    80003ed2:	c398                	sw	a4,0(a5)
    80003ed4:	a011                	j	80003ed8 <OSTaskQPost+0x166>
    80003ed6:	0001                	nop
    80003ed8:	70e2                	ld	ra,56(sp)
    80003eda:	6121                	add	sp,sp,64
    80003edc:	8082                	ret

0000000080003ede <OSTaskRegGet>:
    80003ede:	7139                	add	sp,sp,-64
    80003ee0:	fc06                	sd	ra,56(sp)
    80003ee2:	ec2a                	sd	a0,24(sp)
    80003ee4:	87ae                	mv	a5,a1
    80003ee6:	e432                	sd	a2,8(sp)
    80003ee8:	00f10ba3          	sb	a5,23(sp)
    80003eec:	f402                	sd	zero,40(sp)
    80003eee:	01714783          	lbu	a5,23(sp)
    80003ef2:	0ff7f793          	zext.b	a5,a5
    80003ef6:	cb81                	beqz	a5,80003f06 <OSTaskRegGet+0x28>
    80003ef8:	67a2                	ld	a5,8(sp)
    80003efa:	671d                	lui	a4,0x7
    80003efc:	97970713          	add	a4,a4,-1671 # 6979 <CPU_MSTATUS_MIE+0x6971>
    80003f00:	c398                	sw	a4,0(a5)
    80003f02:	4781                	li	a5,0
    80003f04:	a825                	j	80003f3c <OSTaskRegGet+0x5e>
    80003f06:	c08fd0ef          	jal	8000130e <CPU_SR_Save>
    80003f0a:	f42a                	sd	a0,40(sp)
    80003f0c:	67e2                	ld	a5,24(sp)
    80003f0e:	e799                	bnez	a5,80003f1c <OSTaskRegGet+0x3e>
    80003f10:	00008797          	auipc	a5,0x8
    80003f14:	ab878793          	add	a5,a5,-1352 # 8000b9c8 <OSTCBCurPtr>
    80003f18:	639c                	ld	a5,0(a5)
    80003f1a:	ec3e                	sd	a5,24(sp)
    80003f1c:	01714783          	lbu	a5,23(sp)
    80003f20:	2781                	sext.w	a5,a5
    80003f22:	6762                	ld	a4,24(sp)
    80003f24:	07e9                	add	a5,a5,26
    80003f26:	078e                	sll	a5,a5,0x3
    80003f28:	97ba                	add	a5,a5,a4
    80003f2a:	639c                	ld	a5,0(a5)
    80003f2c:	f03e                	sd	a5,32(sp)
    80003f2e:	7522                	ld	a0,40(sp)
    80003f30:	beafd0ef          	jal	8000131a <CPU_SR_Restore>
    80003f34:	67a2                	ld	a5,8(sp)
    80003f36:	0007a023          	sw	zero,0(a5)
    80003f3a:	7782                	ld	a5,32(sp)
    80003f3c:	853e                	mv	a0,a5
    80003f3e:	70e2                	ld	ra,56(sp)
    80003f40:	6121                	add	sp,sp,64
    80003f42:	8082                	ret

0000000080003f44 <OSTaskRegGetID>:
    80003f44:	7179                	add	sp,sp,-48
    80003f46:	f406                	sd	ra,40(sp)
    80003f48:	e42a                	sd	a0,8(sp)
    80003f4a:	ec02                	sd	zero,24(sp)
    80003f4c:	bc2fd0ef          	jal	8000130e <CPU_SR_Save>
    80003f50:	ec2a                	sd	a0,24(sp)
    80003f52:	00008797          	auipc	a5,0x8
    80003f56:	a4878793          	add	a5,a5,-1464 # 8000b99a <OSTaskRegNextAvailID>
    80003f5a:	0007c783          	lbu	a5,0(a5)
    80003f5e:	cb99                	beqz	a5,80003f74 <OSTaskRegGetID+0x30>
    80003f60:	67a2                	ld	a5,8(sp)
    80003f62:	6719                	lui	a4,0x6
    80003f64:	9da70713          	add	a4,a4,-1574 # 59da <CPU_MSTATUS_MIE+0x59d2>
    80003f68:	c398                	sw	a4,0(a5)
    80003f6a:	6562                	ld	a0,24(sp)
    80003f6c:	baefd0ef          	jal	8000131a <CPU_SR_Restore>
    80003f70:	4785                	li	a5,1
    80003f72:	a081                	j	80003fb2 <OSTaskRegGetID+0x6e>
    80003f74:	00008797          	auipc	a5,0x8
    80003f78:	a2678793          	add	a5,a5,-1498 # 8000b99a <OSTaskRegNextAvailID>
    80003f7c:	0007c783          	lbu	a5,0(a5)
    80003f80:	00f10ba3          	sb	a5,23(sp)
    80003f84:	00008797          	auipc	a5,0x8
    80003f88:	a1678793          	add	a5,a5,-1514 # 8000b99a <OSTaskRegNextAvailID>
    80003f8c:	0007c783          	lbu	a5,0(a5)
    80003f90:	2785                	addw	a5,a5,1
    80003f92:	0ff7f713          	zext.b	a4,a5
    80003f96:	00008797          	auipc	a5,0x8
    80003f9a:	a0478793          	add	a5,a5,-1532 # 8000b99a <OSTaskRegNextAvailID>
    80003f9e:	00e78023          	sb	a4,0(a5)
    80003fa2:	6562                	ld	a0,24(sp)
    80003fa4:	b76fd0ef          	jal	8000131a <CPU_SR_Restore>
    80003fa8:	67a2                	ld	a5,8(sp)
    80003faa:	0007a023          	sw	zero,0(a5)
    80003fae:	01714783          	lbu	a5,23(sp)
    80003fb2:	853e                	mv	a0,a5
    80003fb4:	70a2                	ld	ra,40(sp)
    80003fb6:	6145                	add	sp,sp,48
    80003fb8:	8082                	ret

0000000080003fba <OSTaskRegSet>:
    80003fba:	7139                	add	sp,sp,-64
    80003fbc:	fc06                	sd	ra,56(sp)
    80003fbe:	ec2a                	sd	a0,24(sp)
    80003fc0:	87ae                	mv	a5,a1
    80003fc2:	e432                	sd	a2,8(sp)
    80003fc4:	e036                	sd	a3,0(sp)
    80003fc6:	00f10ba3          	sb	a5,23(sp)
    80003fca:	f402                	sd	zero,40(sp)
    80003fcc:	01714783          	lbu	a5,23(sp)
    80003fd0:	0ff7f793          	zext.b	a5,a5
    80003fd4:	c799                	beqz	a5,80003fe2 <OSTaskRegSet+0x28>
    80003fd6:	6782                	ld	a5,0(sp)
    80003fd8:	671d                	lui	a4,0x7
    80003fda:	97970713          	add	a4,a4,-1671 # 6979 <CPU_MSTATUS_MIE+0x6971>
    80003fde:	c398                	sw	a4,0(a5)
    80003fe0:	a81d                	j	80004016 <OSTaskRegSet+0x5c>
    80003fe2:	b2cfd0ef          	jal	8000130e <CPU_SR_Save>
    80003fe6:	f42a                	sd	a0,40(sp)
    80003fe8:	67e2                	ld	a5,24(sp)
    80003fea:	e799                	bnez	a5,80003ff8 <OSTaskRegSet+0x3e>
    80003fec:	00008797          	auipc	a5,0x8
    80003ff0:	9dc78793          	add	a5,a5,-1572 # 8000b9c8 <OSTCBCurPtr>
    80003ff4:	639c                	ld	a5,0(a5)
    80003ff6:	ec3e                	sd	a5,24(sp)
    80003ff8:	01714783          	lbu	a5,23(sp)
    80003ffc:	2781                	sext.w	a5,a5
    80003ffe:	6762                	ld	a4,24(sp)
    80004000:	07e9                	add	a5,a5,26
    80004002:	078e                	sll	a5,a5,0x3
    80004004:	97ba                	add	a5,a5,a4
    80004006:	6722                	ld	a4,8(sp)
    80004008:	e398                	sd	a4,0(a5)
    8000400a:	7522                	ld	a0,40(sp)
    8000400c:	b0efd0ef          	jal	8000131a <CPU_SR_Restore>
    80004010:	6782                	ld	a5,0(sp)
    80004012:	0007a023          	sw	zero,0(a5)
    80004016:	70e2                	ld	ra,56(sp)
    80004018:	6121                	add	sp,sp,64
    8000401a:	8082                	ret

000000008000401c <OSTaskResume>:
    8000401c:	7179                	add	sp,sp,-48
    8000401e:	f406                	sd	ra,40(sp)
    80004020:	e42a                	sd	a0,8(sp)
    80004022:	e02e                	sd	a1,0(sp)
    80004024:	ec02                	sd	zero,24(sp)
    80004026:	00008797          	auipc	a5,0x8
    8000402a:	8e678793          	add	a5,a5,-1818 # 8000b90c <OSIntNestingCtr>
    8000402e:	0007c783          	lbu	a5,0(a5)
    80004032:	c799                	beqz	a5,80004040 <OSTaskResume+0x24>
    80004034:	6782                	ld	a5,0(sp)
    80004036:	671d                	lui	a4,0x7
    80004038:	15570713          	add	a4,a4,341 # 7155 <CPU_MSTATUS_MIE+0x714d>
    8000403c:	c398                	sw	a4,0(a5)
    8000403e:	a2bd                	j	800041ac <OSTaskResume+0x190>
    80004040:	00008797          	auipc	a5,0x8
    80004044:	8cd78793          	add	a5,a5,-1843 # 8000b90d <OSRunning>
    80004048:	0007c783          	lbu	a5,0(a5)
    8000404c:	873e                	mv	a4,a5
    8000404e:	4785                	li	a5,1
    80004050:	00f70863          	beq	a4,a5,80004060 <OSTaskResume+0x44>
    80004054:	6782                	ld	a5,0(sp)
    80004056:	6719                	lui	a4,0x6
    80004058:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    8000405c:	c398                	sw	a4,0(a5)
    8000405e:	a2b9                	j	800041ac <OSTaskResume+0x190>
    80004060:	aaefd0ef          	jal	8000130e <CPU_SR_Save>
    80004064:	ec2a                	sd	a0,24(sp)
    80004066:	67a2                	ld	a5,8(sp)
    80004068:	cb89                	beqz	a5,8000407a <OSTaskResume+0x5e>
    8000406a:	00008797          	auipc	a5,0x8
    8000406e:	95e78793          	add	a5,a5,-1698 # 8000b9c8 <OSTCBCurPtr>
    80004072:	639c                	ld	a5,0(a5)
    80004074:	6722                	ld	a4,8(sp)
    80004076:	00f71b63          	bne	a4,a5,8000408c <OSTaskResume+0x70>
    8000407a:	6562                	ld	a0,24(sp)
    8000407c:	a9efd0ef          	jal	8000131a <CPU_SR_Restore>
    80004080:	6782                	ld	a5,0(sp)
    80004082:	671d                	lui	a4,0x7
    80004084:	15770713          	add	a4,a4,343 # 7157 <CPU_MSTATUS_MIE+0x714f>
    80004088:	c398                	sw	a4,0(a5)
    8000408a:	a20d                	j	800041ac <OSTaskResume+0x190>
    8000408c:	6562                	ld	a0,24(sp)
    8000408e:	a8cfd0ef          	jal	8000131a <CPU_SR_Restore>
    80004092:	a7cfd0ef          	jal	8000130e <CPU_SR_Save>
    80004096:	ec2a                	sd	a0,24(sp)
    80004098:	6782                	ld	a5,0(sp)
    8000409a:	0007a023          	sw	zero,0(a5)
    8000409e:	67a2                	ld	a5,8(sp)
    800040a0:	0727c783          	lbu	a5,114(a5)
    800040a4:	2781                	sext.w	a5,a5
    800040a6:	86be                	mv	a3,a5
    800040a8:	471d                	li	a4,7
    800040aa:	0ed76163          	bltu	a4,a3,8000418c <OSTaskResume+0x170>
    800040ae:	00279713          	sll	a4,a5,0x2
    800040b2:	00007797          	auipc	a5,0x7
    800040b6:	35278793          	add	a5,a5,850 # 8000b404 <CPU_CntLeadZerosTbl+0x144>
    800040ba:	97ba                	add	a5,a5,a4
    800040bc:	439c                	lw	a5,0(a5)
    800040be:	0007871b          	sext.w	a4,a5
    800040c2:	00007797          	auipc	a5,0x7
    800040c6:	34278793          	add	a5,a5,834 # 8000b404 <CPU_CntLeadZerosTbl+0x144>
    800040ca:	97ba                	add	a5,a5,a4
    800040cc:	8782                	jr	a5
    800040ce:	6562                	ld	a0,24(sp)
    800040d0:	a4afd0ef          	jal	8000131a <CPU_SR_Restore>
    800040d4:	6782                	ld	a5,0(sp)
    800040d6:	671d                	lui	a4,0x7
    800040d8:	15370713          	add	a4,a4,339 # 7153 <CPU_MSTATUS_MIE+0x714b>
    800040dc:	c398                	sw	a4,0(a5)
    800040de:	a0c1                	j	8000419e <OSTaskResume+0x182>
    800040e0:	67a2                	ld	a5,8(sp)
    800040e2:	0e27c783          	lbu	a5,226(a5)
    800040e6:	37fd                	addw	a5,a5,-1
    800040e8:	0ff7f713          	zext.b	a4,a5
    800040ec:	67a2                	ld	a5,8(sp)
    800040ee:	0ee78123          	sb	a4,226(a5)
    800040f2:	67a2                	ld	a5,8(sp)
    800040f4:	0e27c783          	lbu	a5,226(a5)
    800040f8:	e799                	bnez	a5,80004106 <OSTaskResume+0xea>
    800040fa:	67a2                	ld	a5,8(sp)
    800040fc:	06078923          	sb	zero,114(a5)
    80004100:	6522                	ld	a0,8(sp)
    80004102:	2db010ef          	jal	80005bdc <OS_RdyListInsert>
    80004106:	6562                	ld	a0,24(sp)
    80004108:	a12fd0ef          	jal	8000131a <CPU_SR_Restore>
    8000410c:	a849                	j	8000419e <OSTaskResume+0x182>
    8000410e:	67a2                	ld	a5,8(sp)
    80004110:	0e27c783          	lbu	a5,226(a5)
    80004114:	37fd                	addw	a5,a5,-1
    80004116:	0ff7f713          	zext.b	a4,a5
    8000411a:	67a2                	ld	a5,8(sp)
    8000411c:	0ee78123          	sb	a4,226(a5)
    80004120:	67a2                	ld	a5,8(sp)
    80004122:	0e27c783          	lbu	a5,226(a5)
    80004126:	e789                	bnez	a5,80004130 <OSTaskResume+0x114>
    80004128:	67a2                	ld	a5,8(sp)
    8000412a:	4705                	li	a4,1
    8000412c:	06e78923          	sb	a4,114(a5)
    80004130:	6562                	ld	a0,24(sp)
    80004132:	9e8fd0ef          	jal	8000131a <CPU_SR_Restore>
    80004136:	a0a5                	j	8000419e <OSTaskResume+0x182>
    80004138:	67a2                	ld	a5,8(sp)
    8000413a:	0e27c783          	lbu	a5,226(a5)
    8000413e:	37fd                	addw	a5,a5,-1
    80004140:	0ff7f713          	zext.b	a4,a5
    80004144:	67a2                	ld	a5,8(sp)
    80004146:	0ee78123          	sb	a4,226(a5)
    8000414a:	67a2                	ld	a5,8(sp)
    8000414c:	0e27c783          	lbu	a5,226(a5)
    80004150:	e789                	bnez	a5,8000415a <OSTaskResume+0x13e>
    80004152:	67a2                	ld	a5,8(sp)
    80004154:	4709                	li	a4,2
    80004156:	06e78923          	sb	a4,114(a5)
    8000415a:	6562                	ld	a0,24(sp)
    8000415c:	9befd0ef          	jal	8000131a <CPU_SR_Restore>
    80004160:	a83d                	j	8000419e <OSTaskResume+0x182>
    80004162:	67a2                	ld	a5,8(sp)
    80004164:	0e27c783          	lbu	a5,226(a5)
    80004168:	37fd                	addw	a5,a5,-1
    8000416a:	0ff7f713          	zext.b	a4,a5
    8000416e:	67a2                	ld	a5,8(sp)
    80004170:	0ee78123          	sb	a4,226(a5)
    80004174:	67a2                	ld	a5,8(sp)
    80004176:	0e27c783          	lbu	a5,226(a5)
    8000417a:	e789                	bnez	a5,80004184 <OSTaskResume+0x168>
    8000417c:	67a2                	ld	a5,8(sp)
    8000417e:	470d                	li	a4,3
    80004180:	06e78923          	sb	a4,114(a5)
    80004184:	6562                	ld	a0,24(sp)
    80004186:	994fd0ef          	jal	8000131a <CPU_SR_Restore>
    8000418a:	a811                	j	8000419e <OSTaskResume+0x182>
    8000418c:	6562                	ld	a0,24(sp)
    8000418e:	98cfd0ef          	jal	8000131a <CPU_SR_Restore>
    80004192:	6782                	ld	a5,0(sp)
    80004194:	671d                	lui	a4,0x7
    80004196:	e2d70713          	add	a4,a4,-467 # 6e2d <CPU_MSTATUS_MIE+0x6e25>
    8000419a:	c398                	sw	a4,0(a5)
    8000419c:	0001                	nop
    8000419e:	6782                	ld	a5,0(sp)
    800041a0:	439c                	lw	a5,0(a5)
    800041a2:	e781                	bnez	a5,800041aa <OSTaskResume+0x18e>
    800041a4:	7a3000ef          	jal	80005146 <OSSched>
    800041a8:	a011                	j	800041ac <OSTaskResume+0x190>
    800041aa:	0001                	nop
    800041ac:	70a2                	ld	ra,40(sp)
    800041ae:	6145                	add	sp,sp,48
    800041b0:	8082                	ret

00000000800041b2 <OSTaskSemPend>:
    800041b2:	7139                	add	sp,sp,-64
    800041b4:	fc06                	sd	ra,56(sp)
    800041b6:	87aa                	mv	a5,a0
    800041b8:	872e                	mv	a4,a1
    800041ba:	e832                	sd	a2,16(sp)
    800041bc:	e436                	sd	a3,8(sp)
    800041be:	ce3e                	sw	a5,28(sp)
    800041c0:	87ba                	mv	a5,a4
    800041c2:	00f11d23          	sh	a5,26(sp)
    800041c6:	f402                	sd	zero,40(sp)
    800041c8:	00007797          	auipc	a5,0x7
    800041cc:	74478793          	add	a5,a5,1860 # 8000b90c <OSIntNestingCtr>
    800041d0:	0007c783          	lbu	a5,0(a5)
    800041d4:	cb81                	beqz	a5,800041e4 <OSTaskSemPend+0x32>
    800041d6:	67a2                	ld	a5,8(sp)
    800041d8:	6719                	lui	a4,0x6
    800041da:	1ae70713          	add	a4,a4,430 # 61ae <CPU_MSTATUS_MIE+0x61a6>
    800041de:	c398                	sw	a4,0(a5)
    800041e0:	4781                	li	a5,0
    800041e2:	a29d                	j	80004348 <OSTaskSemPend+0x196>
    800041e4:	00007797          	auipc	a5,0x7
    800041e8:	72978793          	add	a5,a5,1833 # 8000b90d <OSRunning>
    800041ec:	0007c783          	lbu	a5,0(a5)
    800041f0:	873e                	mv	a4,a5
    800041f2:	4785                	li	a5,1
    800041f4:	00f70963          	beq	a4,a5,80004206 <OSTaskSemPend+0x54>
    800041f8:	67a2                	ld	a5,8(sp)
    800041fa:	6719                	lui	a4,0x6
    800041fc:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80004200:	c398                	sw	a4,0(a5)
    80004202:	4781                	li	a5,0
    80004204:	a291                	j	80004348 <OSTaskSemPend+0x196>
    80004206:	01a15783          	lhu	a5,26(sp)
    8000420a:	2781                	sext.w	a5,a5
    8000420c:	cf81                	beqz	a5,80004224 <OSTaskSemPend+0x72>
    8000420e:	873e                	mv	a4,a5
    80004210:	67a1                	lui	a5,0x8
    80004212:	00f70963          	beq	a4,a5,80004224 <OSTaskSemPend+0x72>
    80004216:	67a2                	ld	a5,8(sp)
    80004218:	6719                	lui	a4,0x6
    8000421a:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    8000421e:	c398                	sw	a4,0(a5)
    80004220:	4781                	li	a5,0
    80004222:	a21d                	j	80004348 <OSTaskSemPend+0x196>
    80004224:	0001                	nop
    80004226:	8e8fd0ef          	jal	8000130e <CPU_SR_Save>
    8000422a:	f42a                	sd	a0,40(sp)
    8000422c:	00007797          	auipc	a5,0x7
    80004230:	79c78793          	add	a5,a5,1948 # 8000b9c8 <OSTCBCurPtr>
    80004234:	639c                	ld	a5,0(a5)
    80004236:	08c7a783          	lw	a5,140(a5)
    8000423a:	cf85                	beqz	a5,80004272 <OSTaskSemPend+0xc0>
    8000423c:	00007797          	auipc	a5,0x7
    80004240:	78c78793          	add	a5,a5,1932 # 8000b9c8 <OSTCBCurPtr>
    80004244:	639c                	ld	a5,0(a5)
    80004246:	08c7a703          	lw	a4,140(a5)
    8000424a:	377d                	addw	a4,a4,-1
    8000424c:	2701                	sext.w	a4,a4
    8000424e:	08e7a623          	sw	a4,140(a5)
    80004252:	00007797          	auipc	a5,0x7
    80004256:	77678793          	add	a5,a5,1910 # 8000b9c8 <OSTCBCurPtr>
    8000425a:	639c                	ld	a5,0(a5)
    8000425c:	08c7a783          	lw	a5,140(a5)
    80004260:	d23e                	sw	a5,36(sp)
    80004262:	7522                	ld	a0,40(sp)
    80004264:	8b6fd0ef          	jal	8000131a <CPU_SR_Restore>
    80004268:	67a2                	ld	a5,8(sp)
    8000426a:	0007a023          	sw	zero,0(a5)
    8000426e:	5792                	lw	a5,36(sp)
    80004270:	a8e1                	j	80004348 <OSTaskSemPend+0x196>
    80004272:	01a11783          	lh	a5,26(sp)
    80004276:	0007dc63          	bgez	a5,8000428e <OSTaskSemPend+0xdc>
    8000427a:	7522                	ld	a0,40(sp)
    8000427c:	89efd0ef          	jal	8000131a <CPU_SR_Restore>
    80004280:	67a2                	ld	a5,8(sp)
    80004282:	6719                	lui	a4,0x6
    80004284:	1b070713          	add	a4,a4,432 # 61b0 <CPU_MSTATUS_MIE+0x61a8>
    80004288:	c398                	sw	a4,0(a5)
    8000428a:	4781                	li	a5,0
    8000428c:	a875                	j	80004348 <OSTaskSemPend+0x196>
    8000428e:	00007797          	auipc	a5,0x7
    80004292:	6cc78793          	add	a5,a5,1740 # 8000b95a <OSSchedLockNestingCtr>
    80004296:	0007c783          	lbu	a5,0(a5)
    8000429a:	cb99                	beqz	a5,800042b0 <OSTaskSemPend+0xfe>
    8000429c:	7522                	ld	a0,40(sp)
    8000429e:	87cfd0ef          	jal	8000131a <CPU_SR_Restore>
    800042a2:	67a2                	ld	a5,8(sp)
    800042a4:	671d                	lui	a4,0x7
    800042a6:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    800042aa:	c398                	sw	a4,0(a5)
    800042ac:	4781                	li	a5,0
    800042ae:	a869                	j	80004348 <OSTaskSemPend+0x196>
    800042b0:	00007797          	auipc	a5,0x7
    800042b4:	71878793          	add	a5,a5,1816 # 8000b9c8 <OSTCBCurPtr>
    800042b8:	639c                	ld	a5,0(a5)
    800042ba:	4772                	lw	a4,28(sp)
    800042bc:	86ba                	mv	a3,a4
    800042be:	461d                	li	a2,7
    800042c0:	85be                	mv	a1,a5
    800042c2:	4501                	li	a0,0
    800042c4:	41a010ef          	jal	800056de <OS_Pend>
    800042c8:	7522                	ld	a0,40(sp)
    800042ca:	850fd0ef          	jal	8000131a <CPU_SR_Restore>
    800042ce:	679000ef          	jal	80005146 <OSSched>
    800042d2:	83cfd0ef          	jal	8000130e <CPU_SR_Save>
    800042d6:	f42a                	sd	a0,40(sp)
    800042d8:	00007797          	auipc	a5,0x7
    800042dc:	6f078793          	add	a5,a5,1776 # 8000b9c8 <OSTCBCurPtr>
    800042e0:	639c                	ld	a5,0(a5)
    800042e2:	0717c783          	lbu	a5,113(a5)
    800042e6:	2781                	sext.w	a5,a5
    800042e8:	86be                	mv	a3,a5
    800042ea:	470d                	li	a4,3
    800042ec:	02e68663          	beq	a3,a4,80004318 <OSTaskSemPend+0x166>
    800042f0:	86be                	mv	a3,a5
    800042f2:	470d                	li	a4,3
    800042f4:	02d74863          	blt	a4,a3,80004324 <OSTaskSemPend+0x172>
    800042f8:	c791                	beqz	a5,80004304 <OSTaskSemPend+0x152>
    800042fa:	873e                	mv	a4,a5
    800042fc:	4785                	li	a5,1
    800042fe:	00f70763          	beq	a4,a5,8000430c <OSTaskSemPend+0x15a>
    80004302:	a00d                	j	80004324 <OSTaskSemPend+0x172>
    80004304:	67a2                	ld	a5,8(sp)
    80004306:	0007a023          	sw	zero,0(a5)
    8000430a:	a01d                	j	80004330 <OSTaskSemPend+0x17e>
    8000430c:	67a2                	ld	a5,8(sp)
    8000430e:	6719                	lui	a4,0x6
    80004310:	1a970713          	add	a4,a4,425 # 61a9 <CPU_MSTATUS_MIE+0x61a1>
    80004314:	c398                	sw	a4,0(a5)
    80004316:	a829                	j	80004330 <OSTaskSemPend+0x17e>
    80004318:	67a2                	ld	a5,8(sp)
    8000431a:	671d                	lui	a4,0x7
    8000431c:	2d970713          	add	a4,a4,729 # 72d9 <CPU_MSTATUS_MIE+0x72d1>
    80004320:	c398                	sw	a4,0(a5)
    80004322:	a039                	j	80004330 <OSTaskSemPend+0x17e>
    80004324:	67a2                	ld	a5,8(sp)
    80004326:	671d                	lui	a4,0x7
    80004328:	e2e70713          	add	a4,a4,-466 # 6e2e <CPU_MSTATUS_MIE+0x6e26>
    8000432c:	c398                	sw	a4,0(a5)
    8000432e:	0001                	nop
    80004330:	00007797          	auipc	a5,0x7
    80004334:	69878793          	add	a5,a5,1688 # 8000b9c8 <OSTCBCurPtr>
    80004338:	639c                	ld	a5,0(a5)
    8000433a:	08c7a783          	lw	a5,140(a5)
    8000433e:	d23e                	sw	a5,36(sp)
    80004340:	7522                	ld	a0,40(sp)
    80004342:	fd9fc0ef          	jal	8000131a <CPU_SR_Restore>
    80004346:	5792                	lw	a5,36(sp)
    80004348:	853e                	mv	a0,a5
    8000434a:	70e2                	ld	ra,56(sp)
    8000434c:	6121                	add	sp,sp,64
    8000434e:	8082                	ret

0000000080004350 <OSTaskSemPendAbort>:
    80004350:	7139                	add	sp,sp,-64
    80004352:	fc06                	sd	ra,56(sp)
    80004354:	ec2a                	sd	a0,24(sp)
    80004356:	87ae                	mv	a5,a1
    80004358:	e432                	sd	a2,8(sp)
    8000435a:	00f11b23          	sh	a5,22(sp)
    8000435e:	f402                	sd	zero,40(sp)
    80004360:	00007797          	auipc	a5,0x7
    80004364:	5ac78793          	add	a5,a5,1452 # 8000b90c <OSIntNestingCtr>
    80004368:	0007c783          	lbu	a5,0(a5)
    8000436c:	cb81                	beqz	a5,8000437c <OSTaskSemPendAbort+0x2c>
    8000436e:	67a2                	ld	a5,8(sp)
    80004370:	6719                	lui	a4,0x6
    80004372:	1aa70713          	add	a4,a4,426 # 61aa <CPU_MSTATUS_MIE+0x61a2>
    80004376:	c398                	sw	a4,0(a5)
    80004378:	4781                	li	a5,0
    8000437a:	a0e1                	j	80004442 <OSTaskSemPendAbort+0xf2>
    8000437c:	00007797          	auipc	a5,0x7
    80004380:	59178793          	add	a5,a5,1425 # 8000b90d <OSRunning>
    80004384:	0007c783          	lbu	a5,0(a5)
    80004388:	873e                	mv	a4,a5
    8000438a:	4785                	li	a5,1
    8000438c:	00f70963          	beq	a4,a5,8000439e <OSTaskSemPendAbort+0x4e>
    80004390:	67a2                	ld	a5,8(sp)
    80004392:	6719                	lui	a4,0x6
    80004394:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80004398:	c398                	sw	a4,0(a5)
    8000439a:	4781                	li	a5,0
    8000439c:	a05d                	j	80004442 <OSTaskSemPendAbort+0xf2>
    8000439e:	01615783          	lhu	a5,22(sp)
    800043a2:	2781                	sext.w	a5,a5
    800043a4:	cf81                	beqz	a5,800043bc <OSTaskSemPendAbort+0x6c>
    800043a6:	873e                	mv	a4,a5
    800043a8:	67a1                	lui	a5,0x8
    800043aa:	00f70963          	beq	a4,a5,800043bc <OSTaskSemPendAbort+0x6c>
    800043ae:	67a2                	ld	a5,8(sp)
    800043b0:	6719                	lui	a4,0x6
    800043b2:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800043b6:	c398                	sw	a4,0(a5)
    800043b8:	4781                	li	a5,0
    800043ba:	a061                	j	80004442 <OSTaskSemPendAbort+0xf2>
    800043bc:	0001                	nop
    800043be:	f51fc0ef          	jal	8000130e <CPU_SR_Save>
    800043c2:	f42a                	sd	a0,40(sp)
    800043c4:	67e2                	ld	a5,24(sp)
    800043c6:	cb89                	beqz	a5,800043d8 <OSTaskSemPendAbort+0x88>
    800043c8:	00007797          	auipc	a5,0x7
    800043cc:	60078793          	add	a5,a5,1536 # 8000b9c8 <OSTCBCurPtr>
    800043d0:	639c                	ld	a5,0(a5)
    800043d2:	6762                	ld	a4,24(sp)
    800043d4:	00f71c63          	bne	a4,a5,800043ec <OSTaskSemPendAbort+0x9c>
    800043d8:	7522                	ld	a0,40(sp)
    800043da:	f41fc0ef          	jal	8000131a <CPU_SR_Restore>
    800043de:	67a2                	ld	a5,8(sp)
    800043e0:	6719                	lui	a4,0x6
    800043e2:	1ac70713          	add	a4,a4,428 # 61ac <CPU_MSTATUS_MIE+0x61a4>
    800043e6:	c398                	sw	a4,0(a5)
    800043e8:	4781                	li	a5,0
    800043ea:	a8a1                	j	80004442 <OSTaskSemPendAbort+0xf2>
    800043ec:	67e2                	ld	a5,24(sp)
    800043ee:	0707c783          	lbu	a5,112(a5)
    800043f2:	873e                	mv	a4,a5
    800043f4:	479d                	li	a5,7
    800043f6:	00f70c63          	beq	a4,a5,8000440e <OSTaskSemPendAbort+0xbe>
    800043fa:	7522                	ld	a0,40(sp)
    800043fc:	f1ffc0ef          	jal	8000131a <CPU_SR_Restore>
    80004400:	67a2                	ld	a5,8(sp)
    80004402:	6719                	lui	a4,0x6
    80004404:	1ab70713          	add	a4,a4,427 # 61ab <CPU_MSTATUS_MIE+0x61a3>
    80004408:	c398                	sw	a4,0(a5)
    8000440a:	4781                	li	a5,0
    8000440c:	a81d                	j	80004442 <OSTaskSemPendAbort+0xf2>
    8000440e:	7522                	ld	a0,40(sp)
    80004410:	f0bfc0ef          	jal	8000131a <CPU_SR_Restore>
    80004414:	efbfc0ef          	jal	8000130e <CPU_SR_Save>
    80004418:	f42a                	sd	a0,40(sp)
    8000441a:	d202                	sw	zero,36(sp)
    8000441c:	5792                	lw	a5,36(sp)
    8000441e:	4605                	li	a2,1
    80004420:	85be                	mv	a1,a5
    80004422:	6562                	ld	a0,24(sp)
    80004424:	318010ef          	jal	8000573c <OS_PendAbort>
    80004428:	7522                	ld	a0,40(sp)
    8000442a:	ef1fc0ef          	jal	8000131a <CPU_SR_Restore>
    8000442e:	01611783          	lh	a5,22(sp)
    80004432:	0007c463          	bltz	a5,8000443a <OSTaskSemPendAbort+0xea>
    80004436:	511000ef          	jal	80005146 <OSSched>
    8000443a:	67a2                	ld	a5,8(sp)
    8000443c:	0007a023          	sw	zero,0(a5)
    80004440:	4785                	li	a5,1
    80004442:	853e                	mv	a0,a5
    80004444:	70e2                	ld	ra,56(sp)
    80004446:	6121                	add	sp,sp,64
    80004448:	8082                	ret

000000008000444a <OSTaskSemPost>:
    8000444a:	715d                	add	sp,sp,-80
    8000444c:	e486                	sd	ra,72(sp)
    8000444e:	ec2a                	sd	a0,24(sp)
    80004450:	87ae                	mv	a5,a1
    80004452:	e432                	sd	a2,8(sp)
    80004454:	00f11b23          	sh	a5,22(sp)
    80004458:	f802                	sd	zero,48(sp)
    8000445a:	00007797          	auipc	a5,0x7
    8000445e:	4b378793          	add	a5,a5,1203 # 8000b90d <OSRunning>
    80004462:	0007c783          	lbu	a5,0(a5)
    80004466:	873e                	mv	a4,a5
    80004468:	4785                	li	a5,1
    8000446a:	00f70963          	beq	a4,a5,8000447c <OSTaskSemPost+0x32>
    8000446e:	67a2                	ld	a5,8(sp)
    80004470:	6719                	lui	a4,0x6
    80004472:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80004476:	c398                	sw	a4,0(a5)
    80004478:	4781                	li	a5,0
    8000447a:	a285                	j	800045da <OSTaskSemPost+0x190>
    8000447c:	01615783          	lhu	a5,22(sp)
    80004480:	2781                	sext.w	a5,a5
    80004482:	cf81                	beqz	a5,8000449a <OSTaskSemPost+0x50>
    80004484:	873e                	mv	a4,a5
    80004486:	67a1                	lui	a5,0x8
    80004488:	00f70963          	beq	a4,a5,8000449a <OSTaskSemPost+0x50>
    8000448c:	67a2                	ld	a5,8(sp)
    8000448e:	6719                	lui	a4,0x6
    80004490:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80004494:	c398                	sw	a4,0(a5)
    80004496:	4781                	li	a5,0
    80004498:	a289                	j	800045da <OSTaskSemPost+0x190>
    8000449a:	0001                	nop
    8000449c:	d602                	sw	zero,44(sp)
    8000449e:	e71fc0ef          	jal	8000130e <CPU_SR_Save>
    800044a2:	f82a                	sd	a0,48(sp)
    800044a4:	67e2                	ld	a5,24(sp)
    800044a6:	e799                	bnez	a5,800044b4 <OSTaskSemPost+0x6a>
    800044a8:	00007797          	auipc	a5,0x7
    800044ac:	52078793          	add	a5,a5,1312 # 8000b9c8 <OSTCBCurPtr>
    800044b0:	639c                	ld	a5,0(a5)
    800044b2:	ec3e                	sd	a5,24(sp)
    800044b4:	67a2                	ld	a5,8(sp)
    800044b6:	0007a023          	sw	zero,0(a5)
    800044ba:	67e2                	ld	a5,24(sp)
    800044bc:	0727c783          	lbu	a5,114(a5)
    800044c0:	2781                	sext.w	a5,a5
    800044c2:	86be                	mv	a3,a5
    800044c4:	471d                	li	a4,7
    800044c6:	0ed74e63          	blt	a4,a3,800045c2 <OSTaskSemPost+0x178>
    800044ca:	86be                	mv	a3,a5
    800044cc:	4719                	li	a4,6
    800044ce:	06e6db63          	bge	a3,a4,80004544 <OSTaskSemPost+0xfa>
    800044d2:	86be                	mv	a3,a5
    800044d4:	4715                	li	a4,5
    800044d6:	0ed74663          	blt	a4,a3,800045c2 <OSTaskSemPost+0x178>
    800044da:	86be                	mv	a3,a5
    800044dc:	4711                	li	a4,4
    800044de:	02e6d163          	bge	a3,a4,80004500 <OSTaskSemPost+0xb6>
    800044e2:	86be                	mv	a3,a5
    800044e4:	4705                	li	a4,1
    800044e6:	00d74563          	blt	a4,a3,800044f0 <OSTaskSemPost+0xa6>
    800044ea:	0007db63          	bgez	a5,80004500 <OSTaskSemPost+0xb6>
    800044ee:	a8d1                	j	800045c2 <OSTaskSemPost+0x178>
    800044f0:	2781                	sext.w	a5,a5
    800044f2:	37f9                	addw	a5,a5,-2
    800044f4:	2781                	sext.w	a5,a5
    800044f6:	873e                	mv	a4,a5
    800044f8:	4785                	li	a5,1
    800044fa:	0ce7e463          	bltu	a5,a4,800045c2 <OSTaskSemPost+0x178>
    800044fe:	a099                	j	80004544 <OSTaskSemPost+0xfa>
    80004500:	67e2                	ld	a5,24(sp)
    80004502:	08c7a783          	lw	a5,140(a5)
    80004506:	873e                	mv	a4,a5
    80004508:	57fd                	li	a5,-1
    8000450a:	00f71c63          	bne	a4,a5,80004522 <OSTaskSemPost+0xd8>
    8000450e:	7542                	ld	a0,48(sp)
    80004510:	e0bfc0ef          	jal	8000131a <CPU_SR_Restore>
    80004514:	67a2                	ld	a5,8(sp)
    80004516:	671d                	lui	a4,0x7
    80004518:	dc570713          	add	a4,a4,-571 # 6dc5 <CPU_MSTATUS_MIE+0x6dbd>
    8000451c:	c398                	sw	a4,0(a5)
    8000451e:	4781                	li	a5,0
    80004520:	a86d                	j	800045da <OSTaskSemPost+0x190>
    80004522:	67e2                	ld	a5,24(sp)
    80004524:	08c7a783          	lw	a5,140(a5)
    80004528:	2785                	addw	a5,a5,1
    8000452a:	0007871b          	sext.w	a4,a5
    8000452e:	67e2                	ld	a5,24(sp)
    80004530:	08e7a623          	sw	a4,140(a5)
    80004534:	67e2                	ld	a5,24(sp)
    80004536:	08c7a783          	lw	a5,140(a5)
    8000453a:	de3e                	sw	a5,60(sp)
    8000453c:	7542                	ld	a0,48(sp)
    8000453e:	dddfc0ef          	jal	8000131a <CPU_SR_Restore>
    80004542:	a859                	j	800045d8 <OSTaskSemPost+0x18e>
    80004544:	67e2                	ld	a5,24(sp)
    80004546:	0707c783          	lbu	a5,112(a5)
    8000454a:	873e                	mv	a4,a5
    8000454c:	479d                	li	a5,7
    8000454e:	02f71863          	bne	a4,a5,8000457e <OSTaskSemPost+0x134>
    80004552:	57b2                	lw	a5,44(sp)
    80004554:	873e                	mv	a4,a5
    80004556:	4681                	li	a3,0
    80004558:	4601                	li	a2,0
    8000455a:	65e2                	ld	a1,24(sp)
    8000455c:	4501                	li	a0,0
    8000455e:	530010ef          	jal	80005a8e <OS_Post>
    80004562:	67e2                	ld	a5,24(sp)
    80004564:	08c7a783          	lw	a5,140(a5)
    80004568:	de3e                	sw	a5,60(sp)
    8000456a:	7542                	ld	a0,48(sp)
    8000456c:	daffc0ef          	jal	8000131a <CPU_SR_Restore>
    80004570:	01611783          	lh	a5,22(sp)
    80004574:	0607c163          	bltz	a5,800045d6 <OSTaskSemPost+0x18c>
    80004578:	3cf000ef          	jal	80005146 <OSSched>
    8000457c:	a8a9                	j	800045d6 <OSTaskSemPost+0x18c>
    8000457e:	67e2                	ld	a5,24(sp)
    80004580:	08c7a783          	lw	a5,140(a5)
    80004584:	873e                	mv	a4,a5
    80004586:	57fd                	li	a5,-1
    80004588:	00f71c63          	bne	a4,a5,800045a0 <OSTaskSemPost+0x156>
    8000458c:	7542                	ld	a0,48(sp)
    8000458e:	d8dfc0ef          	jal	8000131a <CPU_SR_Restore>
    80004592:	67a2                	ld	a5,8(sp)
    80004594:	671d                	lui	a4,0x7
    80004596:	dc570713          	add	a4,a4,-571 # 6dc5 <CPU_MSTATUS_MIE+0x6dbd>
    8000459a:	c398                	sw	a4,0(a5)
    8000459c:	4781                	li	a5,0
    8000459e:	a835                	j	800045da <OSTaskSemPost+0x190>
    800045a0:	67e2                	ld	a5,24(sp)
    800045a2:	08c7a783          	lw	a5,140(a5)
    800045a6:	2785                	addw	a5,a5,1
    800045a8:	0007871b          	sext.w	a4,a5
    800045ac:	67e2                	ld	a5,24(sp)
    800045ae:	08e7a623          	sw	a4,140(a5)
    800045b2:	67e2                	ld	a5,24(sp)
    800045b4:	08c7a783          	lw	a5,140(a5)
    800045b8:	de3e                	sw	a5,60(sp)
    800045ba:	7542                	ld	a0,48(sp)
    800045bc:	d5ffc0ef          	jal	8000131a <CPU_SR_Restore>
    800045c0:	a819                	j	800045d6 <OSTaskSemPost+0x18c>
    800045c2:	7542                	ld	a0,48(sp)
    800045c4:	d57fc0ef          	jal	8000131a <CPU_SR_Restore>
    800045c8:	67a2                	ld	a5,8(sp)
    800045ca:	671d                	lui	a4,0x7
    800045cc:	e2d70713          	add	a4,a4,-467 # 6e2d <CPU_MSTATUS_MIE+0x6e25>
    800045d0:	c398                	sw	a4,0(a5)
    800045d2:	de02                	sw	zero,60(sp)
    800045d4:	a011                	j	800045d8 <OSTaskSemPost+0x18e>
    800045d6:	0001                	nop
    800045d8:	57f2                	lw	a5,60(sp)
    800045da:	853e                	mv	a0,a5
    800045dc:	60a6                	ld	ra,72(sp)
    800045de:	6161                	add	sp,sp,80
    800045e0:	8082                	ret

00000000800045e2 <OSTaskSemSet>:
    800045e2:	7139                	add	sp,sp,-64
    800045e4:	fc06                	sd	ra,56(sp)
    800045e6:	ec2a                	sd	a0,24(sp)
    800045e8:	87ae                	mv	a5,a1
    800045ea:	e432                	sd	a2,8(sp)
    800045ec:	ca3e                	sw	a5,20(sp)
    800045ee:	f402                	sd	zero,40(sp)
    800045f0:	00007797          	auipc	a5,0x7
    800045f4:	31c78793          	add	a5,a5,796 # 8000b90c <OSIntNestingCtr>
    800045f8:	0007c783          	lbu	a5,0(a5)
    800045fc:	cb81                	beqz	a5,8000460c <OSTaskSemSet+0x2a>
    800045fe:	67a2                	ld	a5,8(sp)
    80004600:	671d                	lui	a4,0x7
    80004602:	dc670713          	add	a4,a4,-570 # 6dc6 <CPU_MSTATUS_MIE+0x6dbe>
    80004606:	c398                	sw	a4,0(a5)
    80004608:	4781                	li	a5,0
    8000460a:	a09d                	j	80004670 <OSTaskSemSet+0x8e>
    8000460c:	d03fc0ef          	jal	8000130e <CPU_SR_Save>
    80004610:	f42a                	sd	a0,40(sp)
    80004612:	67e2                	ld	a5,24(sp)
    80004614:	e799                	bnez	a5,80004622 <OSTaskSemSet+0x40>
    80004616:	00007797          	auipc	a5,0x7
    8000461a:	3b278793          	add	a5,a5,946 # 8000b9c8 <OSTCBCurPtr>
    8000461e:	639c                	ld	a5,0(a5)
    80004620:	ec3e                	sd	a5,24(sp)
    80004622:	67e2                	ld	a5,24(sp)
    80004624:	0727c783          	lbu	a5,114(a5)
    80004628:	2781                	sext.w	a5,a5
    8000462a:	8b89                	and	a5,a5,2
    8000462c:	2781                	sext.w	a5,a5
    8000462e:	c395                	beqz	a5,80004652 <OSTaskSemSet+0x70>
    80004630:	67e2                	ld	a5,24(sp)
    80004632:	0707c783          	lbu	a5,112(a5)
    80004636:	873e                	mv	a4,a5
    80004638:	479d                	li	a5,7
    8000463a:	00f71c63          	bne	a4,a5,80004652 <OSTaskSemSet+0x70>
    8000463e:	7522                	ld	a0,40(sp)
    80004640:	cdbfc0ef          	jal	8000131a <CPU_SR_Restore>
    80004644:	67a2                	ld	a5,8(sp)
    80004646:	671d                	lui	a4,0x7
    80004648:	15f70713          	add	a4,a4,351 # 715f <CPU_MSTATUS_MIE+0x7157>
    8000464c:	c398                	sw	a4,0(a5)
    8000464e:	4781                	li	a5,0
    80004650:	a005                	j	80004670 <OSTaskSemSet+0x8e>
    80004652:	67e2                	ld	a5,24(sp)
    80004654:	08c7a783          	lw	a5,140(a5)
    80004658:	d23e                	sw	a5,36(sp)
    8000465a:	67e2                	ld	a5,24(sp)
    8000465c:	4752                	lw	a4,20(sp)
    8000465e:	08e7a623          	sw	a4,140(a5)
    80004662:	7522                	ld	a0,40(sp)
    80004664:	cb7fc0ef          	jal	8000131a <CPU_SR_Restore>
    80004668:	67a2                	ld	a5,8(sp)
    8000466a:	0007a023          	sw	zero,0(a5)
    8000466e:	5792                	lw	a5,36(sp)
    80004670:	853e                	mv	a0,a5
    80004672:	70e2                	ld	ra,56(sp)
    80004674:	6121                	add	sp,sp,64
    80004676:	8082                	ret

0000000080004678 <OSTaskStkChk>:
    80004678:	715d                	add	sp,sp,-80
    8000467a:	e486                	sd	ra,72(sp)
    8000467c:	ec2a                	sd	a0,24(sp)
    8000467e:	e82e                	sd	a1,16(sp)
    80004680:	e432                	sd	a2,8(sp)
    80004682:	e036                	sd	a3,0(sp)
    80004684:	f402                	sd	zero,40(sp)
    80004686:	00007797          	auipc	a5,0x7
    8000468a:	28678793          	add	a5,a5,646 # 8000b90c <OSIntNestingCtr>
    8000468e:	0007c783          	lbu	a5,0(a5)
    80004692:	c799                	beqz	a5,800046a0 <OSTaskStkChk+0x28>
    80004694:	6782                	ld	a5,0(sp)
    80004696:	671d                	lui	a4,0x7
    80004698:	15970713          	add	a4,a4,345 # 7159 <CPU_MSTATUS_MIE+0x7151>
    8000469c:	c398                	sw	a4,0(a5)
    8000469e:	a0f9                	j	8000476c <OSTaskStkChk+0xf4>
    800046a0:	67c2                	ld	a5,16(sp)
    800046a2:	e799                	bnez	a5,800046b0 <OSTaskStkChk+0x38>
    800046a4:	6782                	ld	a5,0(sp)
    800046a6:	6719                	lui	a4,0x6
    800046a8:	2d570713          	add	a4,a4,725 # 62d5 <CPU_MSTATUS_MIE+0x62cd>
    800046ac:	c398                	sw	a4,0(a5)
    800046ae:	a87d                	j	8000476c <OSTaskStkChk+0xf4>
    800046b0:	67a2                	ld	a5,8(sp)
    800046b2:	e799                	bnez	a5,800046c0 <OSTaskStkChk+0x48>
    800046b4:	6782                	ld	a5,0(sp)
    800046b6:	6719                	lui	a4,0x6
    800046b8:	2d570713          	add	a4,a4,725 # 62d5 <CPU_MSTATUS_MIE+0x62cd>
    800046bc:	c398                	sw	a4,0(a5)
    800046be:	a07d                	j	8000476c <OSTaskStkChk+0xf4>
    800046c0:	c4ffc0ef          	jal	8000130e <CPU_SR_Save>
    800046c4:	f42a                	sd	a0,40(sp)
    800046c6:	67e2                	ld	a5,24(sp)
    800046c8:	e799                	bnez	a5,800046d6 <OSTaskStkChk+0x5e>
    800046ca:	00007797          	auipc	a5,0x7
    800046ce:	2fe78793          	add	a5,a5,766 # 8000b9c8 <OSTCBCurPtr>
    800046d2:	639c                	ld	a5,0(a5)
    800046d4:	ec3e                	sd	a5,24(sp)
    800046d6:	67e2                	ld	a5,24(sp)
    800046d8:	639c                	ld	a5,0(a5)
    800046da:	e385                	bnez	a5,800046fa <OSTaskStkChk+0x82>
    800046dc:	7522                	ld	a0,40(sp)
    800046de:	c3dfc0ef          	jal	8000131a <CPU_SR_Restore>
    800046e2:	67c2                	ld	a5,16(sp)
    800046e4:	0007b023          	sd	zero,0(a5)
    800046e8:	67a2                	ld	a5,8(sp)
    800046ea:	0007b023          	sd	zero,0(a5)
    800046ee:	6782                	ld	a5,0(sp)
    800046f0:	671d                	lui	a4,0x7
    800046f2:	15270713          	add	a4,a4,338 # 7152 <CPU_MSTATUS_MIE+0x714a>
    800046f6:	c398                	sw	a4,0(a5)
    800046f8:	a895                	j	8000476c <OSTaskStkChk+0xf4>
    800046fa:	67e2                	ld	a5,24(sp)
    800046fc:	0887d783          	lhu	a5,136(a5)
    80004700:	2781                	sext.w	a5,a5
    80004702:	8b85                	and	a5,a5,1
    80004704:	2781                	sext.w	a5,a5
    80004706:	e385                	bnez	a5,80004726 <OSTaskStkChk+0xae>
    80004708:	7522                	ld	a0,40(sp)
    8000470a:	c11fc0ef          	jal	8000131a <CPU_SR_Restore>
    8000470e:	67c2                	ld	a5,16(sp)
    80004710:	0007b023          	sd	zero,0(a5)
    80004714:	67a2                	ld	a5,8(sp)
    80004716:	0007b023          	sd	zero,0(a5)
    8000471a:	6782                	ld	a5,0(sp)
    8000471c:	671d                	lui	a4,0x7
    8000471e:	15470713          	add	a4,a4,340 # 7154 <CPU_MSTATUS_MIE+0x714c>
    80004722:	c398                	sw	a4,0(a5)
    80004724:	a0a1                	j	8000476c <OSTaskStkChk+0xf4>
    80004726:	67e2                	ld	a5,24(sp)
    80004728:	63bc                	ld	a5,64(a5)
    8000472a:	f83e                	sd	a5,48(sp)
    8000472c:	67e2                	ld	a5,24(sp)
    8000472e:	63dc                	ld	a5,128(a5)
    80004730:	f03e                	sd	a5,32(sp)
    80004732:	7522                	ld	a0,40(sp)
    80004734:	be7fc0ef          	jal	8000131a <CPU_SR_Restore>
    80004738:	fc02                	sd	zero,56(sp)
    8000473a:	a039                	j	80004748 <OSTaskStkChk+0xd0>
    8000473c:	77c2                	ld	a5,48(sp)
    8000473e:	07a1                	add	a5,a5,8
    80004740:	f83e                	sd	a5,48(sp)
    80004742:	77e2                	ld	a5,56(sp)
    80004744:	0785                	add	a5,a5,1
    80004746:	fc3e                	sd	a5,56(sp)
    80004748:	7762                	ld	a4,56(sp)
    8000474a:	7782                	ld	a5,32(sp)
    8000474c:	00f77563          	bgeu	a4,a5,80004756 <OSTaskStkChk+0xde>
    80004750:	77c2                	ld	a5,48(sp)
    80004752:	639c                	ld	a5,0(a5)
    80004754:	d7e5                	beqz	a5,8000473c <OSTaskStkChk+0xc4>
    80004756:	67c2                	ld	a5,16(sp)
    80004758:	7762                	ld	a4,56(sp)
    8000475a:	e398                	sd	a4,0(a5)
    8000475c:	7702                	ld	a4,32(sp)
    8000475e:	77e2                	ld	a5,56(sp)
    80004760:	8f1d                	sub	a4,a4,a5
    80004762:	67a2                	ld	a5,8(sp)
    80004764:	e398                	sd	a4,0(a5)
    80004766:	6782                	ld	a5,0(sp)
    80004768:	0007a023          	sw	zero,0(a5)
    8000476c:	60a6                	ld	ra,72(sp)
    8000476e:	6161                	add	sp,sp,80
    80004770:	8082                	ret

0000000080004772 <OSTaskSuspend>:
    80004772:	7179                	add	sp,sp,-48
    80004774:	f406                	sd	ra,40(sp)
    80004776:	e42a                	sd	a0,8(sp)
    80004778:	e02e                	sd	a1,0(sp)
    8000477a:	ec02                	sd	zero,24(sp)
    8000477c:	00007797          	auipc	a5,0x7
    80004780:	19078793          	add	a5,a5,400 # 8000b90c <OSIntNestingCtr>
    80004784:	0007c783          	lbu	a5,0(a5)
    80004788:	c799                	beqz	a5,80004796 <OSTaskSuspend+0x24>
    8000478a:	6782                	ld	a5,0(sp)
    8000478c:	671d                	lui	a4,0x7
    8000478e:	15d70713          	add	a4,a4,349 # 715d <CPU_MSTATUS_MIE+0x7155>
    80004792:	c398                	sw	a4,0(a5)
    80004794:	a269                	j	8000491e <OSTaskSuspend+0x1ac>
    80004796:	6722                	ld	a4,8(sp)
    80004798:	00018797          	auipc	a5,0x18
    8000479c:	57878793          	add	a5,a5,1400 # 8001cd10 <OSIdleTaskTCB>
    800047a0:	00f71863          	bne	a4,a5,800047b0 <OSTaskSuspend+0x3e>
    800047a4:	6782                	ld	a5,0(sp)
    800047a6:	671d                	lui	a4,0x7
    800047a8:	15b70713          	add	a4,a4,347 # 715b <CPU_MSTATUS_MIE+0x7153>
    800047ac:	c398                	sw	a4,0(a5)
    800047ae:	aa85                	j	8000491e <OSTaskSuspend+0x1ac>
    800047b0:	b5ffc0ef          	jal	8000130e <CPU_SR_Save>
    800047b4:	ec2a                	sd	a0,24(sp)
    800047b6:	67a2                	ld	a5,8(sp)
    800047b8:	eb95                	bnez	a5,800047ec <OSTaskSuspend+0x7a>
    800047ba:	00007797          	auipc	a5,0x7
    800047be:	15378793          	add	a5,a5,339 # 8000b90d <OSRunning>
    800047c2:	0007c783          	lbu	a5,0(a5)
    800047c6:	873e                	mv	a4,a5
    800047c8:	4785                	li	a5,1
    800047ca:	00f70b63          	beq	a4,a5,800047e0 <OSTaskSuspend+0x6e>
    800047ce:	6562                	ld	a0,24(sp)
    800047d0:	b4bfc0ef          	jal	8000131a <CPU_SR_Restore>
    800047d4:	6782                	ld	a5,0(sp)
    800047d6:	6719                	lui	a4,0x6
    800047d8:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    800047dc:	c398                	sw	a4,0(a5)
    800047de:	a281                	j	8000491e <OSTaskSuspend+0x1ac>
    800047e0:	00007797          	auipc	a5,0x7
    800047e4:	1e878793          	add	a5,a5,488 # 8000b9c8 <OSTCBCurPtr>
    800047e8:	639c                	ld	a5,0(a5)
    800047ea:	e43e                	sd	a5,8(sp)
    800047ec:	00007797          	auipc	a5,0x7
    800047f0:	1dc78793          	add	a5,a5,476 # 8000b9c8 <OSTCBCurPtr>
    800047f4:	639c                	ld	a5,0(a5)
    800047f6:	6722                	ld	a4,8(sp)
    800047f8:	02f71263          	bne	a4,a5,8000481c <OSTaskSuspend+0xaa>
    800047fc:	00007797          	auipc	a5,0x7
    80004800:	15e78793          	add	a5,a5,350 # 8000b95a <OSSchedLockNestingCtr>
    80004804:	0007c783          	lbu	a5,0(a5)
    80004808:	cb91                	beqz	a5,8000481c <OSTaskSuspend+0xaa>
    8000480a:	6562                	ld	a0,24(sp)
    8000480c:	b0ffc0ef          	jal	8000131a <CPU_SR_Restore>
    80004810:	6782                	ld	a5,0(sp)
    80004812:	671d                	lui	a4,0x7
    80004814:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80004818:	c398                	sw	a4,0(a5)
    8000481a:	a211                	j	8000491e <OSTaskSuspend+0x1ac>
    8000481c:	6782                	ld	a5,0(sp)
    8000481e:	0007a023          	sw	zero,0(a5)
    80004822:	67a2                	ld	a5,8(sp)
    80004824:	0727c783          	lbu	a5,114(a5)
    80004828:	2781                	sext.w	a5,a5
    8000482a:	86be                	mv	a3,a5
    8000482c:	471d                	li	a4,7
    8000482e:	0cd76363          	bltu	a4,a3,800048f4 <OSTaskSuspend+0x182>
    80004832:	00279713          	sll	a4,a5,0x2
    80004836:	00007797          	auipc	a5,0x7
    8000483a:	bee78793          	add	a5,a5,-1042 # 8000b424 <CPU_CntLeadZerosTbl+0x164>
    8000483e:	97ba                	add	a5,a5,a4
    80004840:	439c                	lw	a5,0(a5)
    80004842:	0007871b          	sext.w	a4,a5
    80004846:	00007797          	auipc	a5,0x7
    8000484a:	bde78793          	add	a5,a5,-1058 # 8000b424 <CPU_CntLeadZerosTbl+0x164>
    8000484e:	97ba                	add	a5,a5,a4
    80004850:	8782                	jr	a5
    80004852:	67a2                	ld	a5,8(sp)
    80004854:	4711                	li	a4,4
    80004856:	06e78923          	sb	a4,114(a5)
    8000485a:	67a2                	ld	a5,8(sp)
    8000485c:	4705                	li	a4,1
    8000485e:	0ee78123          	sb	a4,226(a5)
    80004862:	6522                	ld	a0,8(sp)
    80004864:	548010ef          	jal	80005dac <OS_RdyListRemove>
    80004868:	6562                	ld	a0,24(sp)
    8000486a:	ab1fc0ef          	jal	8000131a <CPU_SR_Restore>
    8000486e:	a861                	j	80004906 <OSTaskSuspend+0x194>
    80004870:	67a2                	ld	a5,8(sp)
    80004872:	4715                	li	a4,5
    80004874:	06e78923          	sb	a4,114(a5)
    80004878:	67a2                	ld	a5,8(sp)
    8000487a:	4705                	li	a4,1
    8000487c:	0ee78123          	sb	a4,226(a5)
    80004880:	6562                	ld	a0,24(sp)
    80004882:	a99fc0ef          	jal	8000131a <CPU_SR_Restore>
    80004886:	a041                	j	80004906 <OSTaskSuspend+0x194>
    80004888:	67a2                	ld	a5,8(sp)
    8000488a:	4719                	li	a4,6
    8000488c:	06e78923          	sb	a4,114(a5)
    80004890:	67a2                	ld	a5,8(sp)
    80004892:	4705                	li	a4,1
    80004894:	0ee78123          	sb	a4,226(a5)
    80004898:	6562                	ld	a0,24(sp)
    8000489a:	a81fc0ef          	jal	8000131a <CPU_SR_Restore>
    8000489e:	a0a5                	j	80004906 <OSTaskSuspend+0x194>
    800048a0:	67a2                	ld	a5,8(sp)
    800048a2:	471d                	li	a4,7
    800048a4:	06e78923          	sb	a4,114(a5)
    800048a8:	67a2                	ld	a5,8(sp)
    800048aa:	4705                	li	a4,1
    800048ac:	0ee78123          	sb	a4,226(a5)
    800048b0:	6562                	ld	a0,24(sp)
    800048b2:	a69fc0ef          	jal	8000131a <CPU_SR_Restore>
    800048b6:	a881                	j	80004906 <OSTaskSuspend+0x194>
    800048b8:	67a2                	ld	a5,8(sp)
    800048ba:	0e27c783          	lbu	a5,226(a5)
    800048be:	873e                	mv	a4,a5
    800048c0:	0ff00793          	li	a5,255
    800048c4:	00f71b63          	bne	a4,a5,800048da <OSTaskSuspend+0x168>
    800048c8:	6562                	ld	a0,24(sp)
    800048ca:	a51fc0ef          	jal	8000131a <CPU_SR_Restore>
    800048ce:	6782                	ld	a5,0(sp)
    800048d0:	671d                	lui	a4,0x7
    800048d2:	16070713          	add	a4,a4,352 # 7160 <CPU_MSTATUS_MIE+0x7158>
    800048d6:	c398                	sw	a4,0(a5)
    800048d8:	a099                	j	8000491e <OSTaskSuspend+0x1ac>
    800048da:	67a2                	ld	a5,8(sp)
    800048dc:	0e27c783          	lbu	a5,226(a5)
    800048e0:	2785                	addw	a5,a5,1
    800048e2:	0ff7f713          	zext.b	a4,a5
    800048e6:	67a2                	ld	a5,8(sp)
    800048e8:	0ee78123          	sb	a4,226(a5)
    800048ec:	6562                	ld	a0,24(sp)
    800048ee:	a2dfc0ef          	jal	8000131a <CPU_SR_Restore>
    800048f2:	a811                	j	80004906 <OSTaskSuspend+0x194>
    800048f4:	6562                	ld	a0,24(sp)
    800048f6:	a25fc0ef          	jal	8000131a <CPU_SR_Restore>
    800048fa:	6782                	ld	a5,0(sp)
    800048fc:	671d                	lui	a4,0x7
    800048fe:	e2d70713          	add	a4,a4,-467 # 6e2d <CPU_MSTATUS_MIE+0x6e25>
    80004902:	c398                	sw	a4,0(a5)
    80004904:	a829                	j	8000491e <OSTaskSuspend+0x1ac>
    80004906:	00007797          	auipc	a5,0x7
    8000490a:	00778793          	add	a5,a5,7 # 8000b90d <OSRunning>
    8000490e:	0007c783          	lbu	a5,0(a5)
    80004912:	873e                	mv	a4,a5
    80004914:	4785                	li	a5,1
    80004916:	00f71463          	bne	a4,a5,8000491e <OSTaskSuspend+0x1ac>
    8000491a:	02d000ef          	jal	80005146 <OSSched>
    8000491e:	70a2                	ld	ra,40(sp)
    80004920:	6145                	add	sp,sp,48
    80004922:	8082                	ret

0000000080004924 <OSTaskTimeQuantaSet>:
    80004924:	7139                	add	sp,sp,-64
    80004926:	fc06                	sd	ra,56(sp)
    80004928:	ec2a                	sd	a0,24(sp)
    8000492a:	87ae                	mv	a5,a1
    8000492c:	e432                	sd	a2,8(sp)
    8000492e:	ca3e                	sw	a5,20(sp)
    80004930:	f402                	sd	zero,40(sp)
    80004932:	00007797          	auipc	a5,0x7
    80004936:	fda78793          	add	a5,a5,-38 # 8000b90c <OSIntNestingCtr>
    8000493a:	0007c783          	lbu	a5,0(a5)
    8000493e:	c799                	beqz	a5,8000494c <OSTaskTimeQuantaSet+0x28>
    80004940:	67a2                	ld	a5,8(sp)
    80004942:	671d                	lui	a4,0x7
    80004944:	dc670713          	add	a4,a4,-570 # 6dc6 <CPU_MSTATUS_MIE+0x6dbe>
    80004948:	c398                	sw	a4,0(a5)
    8000494a:	a085                	j	800049aa <OSTaskTimeQuantaSet+0x86>
    8000494c:	9c3fc0ef          	jal	8000130e <CPU_SR_Save>
    80004950:	f42a                	sd	a0,40(sp)
    80004952:	67e2                	ld	a5,24(sp)
    80004954:	e799                	bnez	a5,80004962 <OSTaskTimeQuantaSet+0x3e>
    80004956:	00007797          	auipc	a5,0x7
    8000495a:	07278793          	add	a5,a5,114 # 8000b9c8 <OSTCBCurPtr>
    8000495e:	639c                	ld	a5,0(a5)
    80004960:	ec3e                	sd	a5,24(sp)
    80004962:	47d2                	lw	a5,20(sp)
    80004964:	2781                	sext.w	a5,a5
    80004966:	eb91                	bnez	a5,8000497a <OSTaskTimeQuantaSet+0x56>
    80004968:	00007797          	auipc	a5,0x7
    8000496c:	ff478793          	add	a5,a5,-12 # 8000b95c <OSSchedRoundRobinDfltTimeQuanta>
    80004970:	4398                	lw	a4,0(a5)
    80004972:	67e2                	ld	a5,24(sp)
    80004974:	08e7ac23          	sw	a4,152(a5)
    80004978:	a029                	j	80004982 <OSTaskTimeQuantaSet+0x5e>
    8000497a:	67e2                	ld	a5,24(sp)
    8000497c:	4752                	lw	a4,20(sp)
    8000497e:	08e7ac23          	sw	a4,152(a5)
    80004982:	67e2                	ld	a5,24(sp)
    80004984:	0987a703          	lw	a4,152(a5)
    80004988:	67e2                	ld	a5,24(sp)
    8000498a:	09c7a783          	lw	a5,156(a5)
    8000498e:	00e7f863          	bgeu	a5,a4,8000499e <OSTaskTimeQuantaSet+0x7a>
    80004992:	67e2                	ld	a5,24(sp)
    80004994:	0987a703          	lw	a4,152(a5)
    80004998:	67e2                	ld	a5,24(sp)
    8000499a:	08e7ae23          	sw	a4,156(a5)
    8000499e:	7522                	ld	a0,40(sp)
    800049a0:	97bfc0ef          	jal	8000131a <CPU_SR_Restore>
    800049a4:	67a2                	ld	a5,8(sp)
    800049a6:	0007a023          	sw	zero,0(a5)
    800049aa:	70e2                	ld	ra,56(sp)
    800049ac:	6121                	add	sp,sp,64
    800049ae:	8082                	ret

00000000800049b0 <OS_TaskDbgListAdd>:
    800049b0:	1141                	add	sp,sp,-16
    800049b2:	e42a                	sd	a0,8(sp)
    800049b4:	67a2                	ld	a5,8(sp)
    800049b6:	1007bc23          	sd	zero,280(a5)
    800049ba:	00007797          	auipc	a5,0x7
    800049be:	fd678793          	add	a5,a5,-42 # 8000b990 <OSTaskDbgListPtr>
    800049c2:	639c                	ld	a5,0(a5)
    800049c4:	e789                	bnez	a5,800049ce <OS_TaskDbgListAdd+0x1e>
    800049c6:	67a2                	ld	a5,8(sp)
    800049c8:	1207b023          	sd	zero,288(a5)
    800049cc:	a00d                	j	800049ee <OS_TaskDbgListAdd+0x3e>
    800049ce:	00007797          	auipc	a5,0x7
    800049d2:	fc278793          	add	a5,a5,-62 # 8000b990 <OSTaskDbgListPtr>
    800049d6:	6398                	ld	a4,0(a5)
    800049d8:	67a2                	ld	a5,8(sp)
    800049da:	12e7b023          	sd	a4,288(a5)
    800049de:	00007797          	auipc	a5,0x7
    800049e2:	fb278793          	add	a5,a5,-78 # 8000b990 <OSTaskDbgListPtr>
    800049e6:	639c                	ld	a5,0(a5)
    800049e8:	6722                	ld	a4,8(sp)
    800049ea:	10e7bc23          	sd	a4,280(a5)
    800049ee:	00007797          	auipc	a5,0x7
    800049f2:	fa278793          	add	a5,a5,-94 # 8000b990 <OSTaskDbgListPtr>
    800049f6:	6722                	ld	a4,8(sp)
    800049f8:	e398                	sd	a4,0(a5)
    800049fa:	0001                	nop
    800049fc:	0141                	add	sp,sp,16
    800049fe:	8082                	ret

0000000080004a00 <OS_TaskDbgListRemove>:
    80004a00:	1101                	add	sp,sp,-32
    80004a02:	e42a                	sd	a0,8(sp)
    80004a04:	67a2                	ld	a5,8(sp)
    80004a06:	1187b783          	ld	a5,280(a5)
    80004a0a:	ec3e                	sd	a5,24(sp)
    80004a0c:	67a2                	ld	a5,8(sp)
    80004a0e:	1207b783          	ld	a5,288(a5)
    80004a12:	e83e                	sd	a5,16(sp)
    80004a14:	67e2                	ld	a5,24(sp)
    80004a16:	e385                	bnez	a5,80004a36 <OS_TaskDbgListRemove+0x36>
    80004a18:	00007797          	auipc	a5,0x7
    80004a1c:	f7878793          	add	a5,a5,-136 # 8000b990 <OSTaskDbgListPtr>
    80004a20:	6742                	ld	a4,16(sp)
    80004a22:	e398                	sd	a4,0(a5)
    80004a24:	67c2                	ld	a5,16(sp)
    80004a26:	c781                	beqz	a5,80004a2e <OS_TaskDbgListRemove+0x2e>
    80004a28:	67c2                	ld	a5,16(sp)
    80004a2a:	1007bc23          	sd	zero,280(a5)
    80004a2e:	67a2                	ld	a5,8(sp)
    80004a30:	1207b023          	sd	zero,288(a5)
    80004a34:	a805                	j	80004a64 <OS_TaskDbgListRemove+0x64>
    80004a36:	67c2                	ld	a5,16(sp)
    80004a38:	eb81                	bnez	a5,80004a48 <OS_TaskDbgListRemove+0x48>
    80004a3a:	67e2                	ld	a5,24(sp)
    80004a3c:	1207b023          	sd	zero,288(a5)
    80004a40:	67a2                	ld	a5,8(sp)
    80004a42:	1007bc23          	sd	zero,280(a5)
    80004a46:	a839                	j	80004a64 <OS_TaskDbgListRemove+0x64>
    80004a48:	67e2                	ld	a5,24(sp)
    80004a4a:	6742                	ld	a4,16(sp)
    80004a4c:	12e7b023          	sd	a4,288(a5)
    80004a50:	67c2                	ld	a5,16(sp)
    80004a52:	6762                	ld	a4,24(sp)
    80004a54:	10e7bc23          	sd	a4,280(a5)
    80004a58:	67a2                	ld	a5,8(sp)
    80004a5a:	1207b023          	sd	zero,288(a5)
    80004a5e:	67a2                	ld	a5,8(sp)
    80004a60:	1007bc23          	sd	zero,280(a5)
    80004a64:	0001                	nop
    80004a66:	6105                	add	sp,sp,32
    80004a68:	8082                	ret

0000000080004a6a <OS_TaskInit>:
    80004a6a:	1141                	add	sp,sp,-16
    80004a6c:	e42a                	sd	a0,8(sp)
    80004a6e:	00007797          	auipc	a5,0x7
    80004a72:	f2278793          	add	a5,a5,-222 # 8000b990 <OSTaskDbgListPtr>
    80004a76:	0007b023          	sd	zero,0(a5)
    80004a7a:	00007797          	auipc	a5,0x7
    80004a7e:	f1e78793          	add	a5,a5,-226 # 8000b998 <OSTaskQty>
    80004a82:	00079023          	sh	zero,0(a5)
    80004a86:	00007797          	auipc	a5,0x7
    80004a8a:	f0278793          	add	a5,a5,-254 # 8000b988 <OSTaskCtxSwCtr>
    80004a8e:	0007a023          	sw	zero,0(a5)
    80004a92:	67a2                	ld	a5,8(sp)
    80004a94:	0007a023          	sw	zero,0(a5)
    80004a98:	0001                	nop
    80004a9a:	0141                	add	sp,sp,16
    80004a9c:	8082                	ret

0000000080004a9e <OS_TaskInitTCB>:
    80004a9e:	7179                	add	sp,sp,-48
    80004aa0:	f406                	sd	ra,40(sp)
    80004aa2:	e42a                	sd	a0,8(sp)
    80004aa4:	67a2                	ld	a5,8(sp)
    80004aa6:	0007b023          	sd	zero,0(a5)
    80004aaa:	67a2                	ld	a5,8(sp)
    80004aac:	0007b823          	sd	zero,16(a5)
    80004ab0:	67a2                	ld	a5,8(sp)
    80004ab2:	0007b423          	sd	zero,8(a5)
    80004ab6:	67a2                	ld	a5,8(sp)
    80004ab8:	0207b023          	sd	zero,32(a5)
    80004abc:	67a2                	ld	a5,8(sp)
    80004abe:	0207b423          	sd	zero,40(a5)
    80004ac2:	67a2                	ld	a5,8(sp)
    80004ac4:	0207b823          	sd	zero,48(a5)
    80004ac8:	67a2                	ld	a5,8(sp)
    80004aca:	0207bc23          	sd	zero,56(a5)
    80004ace:	67a2                	ld	a5,8(sp)
    80004ad0:	00007717          	auipc	a4,0x7
    80004ad4:	97870713          	add	a4,a4,-1672 # 8000b448 <CPU_CntLeadZerosTbl+0x188>
    80004ad8:	ef98                	sd	a4,24(a5)
    80004ada:	67a2                	ld	a5,8(sp)
    80004adc:	0407b023          	sd	zero,64(a5)
    80004ae0:	67a2                	ld	a5,8(sp)
    80004ae2:	0407b423          	sd	zero,72(a5)
    80004ae6:	67a2                	ld	a5,8(sp)
    80004ae8:	0407b823          	sd	zero,80(a5)
    80004aec:	67a2                	ld	a5,8(sp)
    80004aee:	0a07b023          	sd	zero,160(a5)
    80004af2:	67a2                	ld	a5,8(sp)
    80004af4:	0a079423          	sh	zero,168(a5)
    80004af8:	67a2                	ld	a5,8(sp)
    80004afa:	0b078793          	add	a5,a5,176
    80004afe:	4581                	li	a1,0
    80004b00:	853e                	mv	a0,a5
    80004b02:	eacfe0ef          	jal	800031ae <OS_MsgQInit>
    80004b06:	67a2                	ld	a5,8(sp)
    80004b08:	0c07a423          	sw	zero,200(a5)
    80004b0c:	67a2                	ld	a5,8(sp)
    80004b0e:	0c07a623          	sw	zero,204(a5)
    80004b12:	67a2                	ld	a5,8(sp)
    80004b14:	0c07ac23          	sw	zero,216(a5)
    80004b18:	67a2                	ld	a5,8(sp)
    80004b1a:	0e079023          	sh	zero,224(a5)
    80004b1e:	67a2                	ld	a5,8(sp)
    80004b20:	0c07ae23          	sw	zero,220(a5)
    80004b24:	00010fa3          	sb	zero,31(sp)
    80004b28:	a839                	j	80004b46 <OS_TaskInitTCB+0xa8>
    80004b2a:	01f14783          	lbu	a5,31(sp)
    80004b2e:	2781                	sext.w	a5,a5
    80004b30:	6722                	ld	a4,8(sp)
    80004b32:	07e9                	add	a5,a5,26
    80004b34:	078e                	sll	a5,a5,0x3
    80004b36:	97ba                	add	a5,a5,a4
    80004b38:	0007b023          	sd	zero,0(a5)
    80004b3c:	01f14783          	lbu	a5,31(sp)
    80004b40:	2785                	addw	a5,a5,1
    80004b42:	00f10fa3          	sb	a5,31(sp)
    80004b46:	01f14783          	lbu	a5,31(sp)
    80004b4a:	0ff7f793          	zext.b	a5,a5
    80004b4e:	dff1                	beqz	a5,80004b2a <OS_TaskInitTCB+0x8c>
    80004b50:	67a2                	ld	a5,8(sp)
    80004b52:	0807a623          	sw	zero,140(a5)
    80004b56:	67a2                	ld	a5,8(sp)
    80004b58:	0e07ae23          	sw	zero,252(a5)
    80004b5c:	67a2                	ld	a5,8(sp)
    80004b5e:	1007a023          	sw	zero,256(a5)
    80004b62:	67a2                	ld	a5,8(sp)
    80004b64:	0807b023          	sd	zero,128(a5)
    80004b68:	67a2                	ld	a5,8(sp)
    80004b6a:	0e078123          	sb	zero,226(a5)
    80004b6e:	67a2                	ld	a5,8(sp)
    80004b70:	1007b823          	sd	zero,272(a5)
    80004b74:	67a2                	ld	a5,8(sp)
    80004b76:	1007b423          	sd	zero,264(a5)
    80004b7a:	67a2                	ld	a5,8(sp)
    80004b7c:	08079423          	sh	zero,136(a5)
    80004b80:	67a2                	ld	a5,8(sp)
    80004b82:	0807a823          	sw	zero,144(a5)
    80004b86:	67a2                	ld	a5,8(sp)
    80004b88:	0807aa23          	sw	zero,148(a5)
    80004b8c:	67a2                	ld	a5,8(sp)
    80004b8e:	0807ac23          	sw	zero,152(a5)
    80004b92:	67a2                	ld	a5,8(sp)
    80004b94:	0807ae23          	sw	zero,156(a5)
    80004b98:	67a2                	ld	a5,8(sp)
    80004b9a:	0e079223          	sh	zero,228(a5)
    80004b9e:	67a2                	ld	a5,8(sp)
    80004ba0:	0e079323          	sh	zero,230(a5)
    80004ba4:	67a2                	ld	a5,8(sp)
    80004ba6:	0e07a423          	sw	zero,232(a5)
    80004baa:	67a2                	ld	a5,8(sp)
    80004bac:	0e07a623          	sw	zero,236(a5)
    80004bb0:	67a2                	ld	a5,8(sp)
    80004bb2:	0e07a823          	sw	zero,240(a5)
    80004bb6:	67a2                	ld	a5,8(sp)
    80004bb8:	0e07aa23          	sw	zero,244(a5)
    80004bbc:	67a2                	ld	a5,8(sp)
    80004bbe:	0407bc23          	sd	zero,88(a5)
    80004bc2:	67a2                	ld	a5,8(sp)
    80004bc4:	0607b023          	sd	zero,96(a5)
    80004bc8:	67a2                	ld	a5,8(sp)
    80004bca:	0607b423          	sd	zero,104(a5)
    80004bce:	67a2                	ld	a5,8(sp)
    80004bd0:	06078823          	sb	zero,112(a5)
    80004bd4:	67a2                	ld	a5,8(sp)
    80004bd6:	060788a3          	sb	zero,113(a5)
    80004bda:	67a2                	ld	a5,8(sp)
    80004bdc:	06078923          	sb	zero,114(a5)
    80004be0:	67a2                	ld	a5,8(sp)
    80004be2:	04000713          	li	a4,64
    80004be6:	06e789a3          	sb	a4,115(a5)
    80004bea:	67a2                	ld	a5,8(sp)
    80004bec:	04000713          	li	a4,64
    80004bf0:	06e78a23          	sb	a4,116(a5)
    80004bf4:	67a2                	ld	a5,8(sp)
    80004bf6:	0607bc23          	sd	zero,120(a5)
    80004bfa:	67a2                	ld	a5,8(sp)
    80004bfc:	1007bc23          	sd	zero,280(a5)
    80004c00:	67a2                	ld	a5,8(sp)
    80004c02:	1207b023          	sd	zero,288(a5)
    80004c06:	67a2                	ld	a5,8(sp)
    80004c08:	00007717          	auipc	a4,0x7
    80004c0c:	84870713          	add	a4,a4,-1976 # 8000b450 <CPU_CntLeadZerosTbl+0x190>
    80004c10:	12e7b423          	sd	a4,296(a5)
    80004c14:	0001                	nop
    80004c16:	70a2                	ld	ra,40(sp)
    80004c18:	6145                	add	sp,sp,48
    80004c1a:	8082                	ret

0000000080004c1c <OS_TaskReturn>:
    80004c1c:	1101                	add	sp,sp,-32
    80004c1e:	ec06                	sd	ra,24(sp)
    80004c20:	00007797          	auipc	a5,0x7
    80004c24:	da878793          	add	a5,a5,-600 # 8000b9c8 <OSTCBCurPtr>
    80004c28:	639c                	ld	a5,0(a5)
    80004c2a:	853e                	mv	a0,a5
    80004c2c:	d59fc0ef          	jal	80001984 <OSTaskReturnHook>
    80004c30:	007c                	add	a5,sp,12
    80004c32:	85be                	mv	a1,a5
    80004c34:	4501                	li	a0,0
    80004c36:	bc1fe0ef          	jal	800037f6 <OSTaskDel>
    80004c3a:	0001                	nop
    80004c3c:	60e2                	ld	ra,24(sp)
    80004c3e:	6105                	add	sp,sp,32
    80004c40:	8082                	ret

0000000080004c42 <OS_TaskChangePrio>:
    80004c42:	7179                	add	sp,sp,-48
    80004c44:	f406                	sd	ra,40(sp)
    80004c46:	e42a                	sd	a0,8(sp)
    80004c48:	87ae                	mv	a5,a1
    80004c4a:	00f103a3          	sb	a5,7(sp)
    80004c4e:	ec02                	sd	zero,24(sp)
    80004c50:	67a2                	ld	a5,8(sp)
    80004c52:	0737c783          	lbu	a5,115(a5)
    80004c56:	00f10ba3          	sb	a5,23(sp)
    80004c5a:	67a2                	ld	a5,8(sp)
    80004c5c:	0727c783          	lbu	a5,114(a5)
    80004c60:	2781                	sext.w	a5,a5
    80004c62:	86be                	mv	a3,a5
    80004c64:	471d                	li	a4,7
    80004c66:	14d76663          	bltu	a4,a3,80004db2 <OS_TaskChangePrio+0x170>
    80004c6a:	00279713          	sll	a4,a5,0x2
    80004c6e:	00006797          	auipc	a5,0x6
    80004c72:	7e678793          	add	a5,a5,2022 # 8000b454 <CPU_CntLeadZerosTbl+0x194>
    80004c76:	97ba                	add	a5,a5,a4
    80004c78:	439c                	lw	a5,0(a5)
    80004c7a:	0007871b          	sext.w	a4,a5
    80004c7e:	00006797          	auipc	a5,0x6
    80004c82:	7d678793          	add	a5,a5,2006 # 8000b454 <CPU_CntLeadZerosTbl+0x194>
    80004c86:	97ba                	add	a5,a5,a4
    80004c88:	8782                	jr	a5
    80004c8a:	6522                	ld	a0,8(sp)
    80004c8c:	120010ef          	jal	80005dac <OS_RdyListRemove>
    80004c90:	67a2                	ld	a5,8(sp)
    80004c92:	00714703          	lbu	a4,7(sp)
    80004c96:	06e789a3          	sb	a4,115(a5)
    80004c9a:	67a2                	ld	a5,8(sp)
    80004c9c:	0737c783          	lbu	a5,115(a5)
    80004ca0:	853e                	mv	a0,a5
    80004ca2:	6f4020ef          	jal	80007396 <OS_PrioInsert>
    80004ca6:	00007797          	auipc	a5,0x7
    80004caa:	d2278793          	add	a5,a5,-734 # 8000b9c8 <OSTCBCurPtr>
    80004cae:	639c                	ld	a5,0(a5)
    80004cb0:	6722                	ld	a4,8(sp)
    80004cb2:	00f71663          	bne	a4,a5,80004cbe <OS_TaskChangePrio+0x7c>
    80004cb6:	6522                	ld	a0,8(sp)
    80004cb8:	763000ef          	jal	80005c1a <OS_RdyListInsertHead>
    80004cbc:	a0ed                	j	80004da6 <OS_TaskChangePrio+0x164>
    80004cbe:	6522                	ld	a0,8(sp)
    80004cc0:	7df000ef          	jal	80005c9e <OS_RdyListInsertTail>
    80004cc4:	a0cd                	j	80004da6 <OS_TaskChangePrio+0x164>
    80004cc6:	67a2                	ld	a5,8(sp)
    80004cc8:	00714703          	lbu	a4,7(sp)
    80004ccc:	06e789a3          	sb	a4,115(a5)
    80004cd0:	a8d9                	j	80004da6 <OS_TaskChangePrio+0x164>
    80004cd2:	67a2                	ld	a5,8(sp)
    80004cd4:	00714703          	lbu	a4,7(sp)
    80004cd8:	06e789a3          	sb	a4,115(a5)
    80004cdc:	67a2                	ld	a5,8(sp)
    80004cde:	0707c783          	lbu	a5,112(a5)
    80004ce2:	2781                	sext.w	a5,a5
    80004ce4:	86be                	mv	a3,a5
    80004ce6:	4719                	li	a4,6
    80004ce8:	0ad74b63          	blt	a4,a3,80004d9e <OS_TaskChangePrio+0x15c>
    80004cec:	86be                	mv	a3,a5
    80004cee:	4715                	li	a4,5
    80004cf0:	00e6db63          	bge	a3,a4,80004d06 <OS_TaskChangePrio+0xc4>
    80004cf4:	86be                	mv	a3,a5
    80004cf6:	4705                	li	a4,1
    80004cf8:	00e68763          	beq	a3,a4,80004d06 <OS_TaskChangePrio+0xc4>
    80004cfc:	873e                	mv	a4,a5
    80004cfe:	4791                	li	a5,4
    80004d00:	00f70763          	beq	a4,a5,80004d0e <OS_TaskChangePrio+0xcc>
    80004d04:	a869                	j	80004d9e <OS_TaskChangePrio+0x15c>
    80004d06:	6522                	ld	a0,8(sp)
    80004d08:	3bd000ef          	jal	800058c4 <OS_PendListChangePrio>
    80004d0c:	a861                	j	80004da4 <OS_TaskChangePrio+0x162>
    80004d0e:	6522                	ld	a0,8(sp)
    80004d10:	3b5000ef          	jal	800058c4 <OS_PendListChangePrio>
    80004d14:	67a2                	ld	a5,8(sp)
    80004d16:	77bc                	ld	a5,104(a5)
    80004d18:	67bc                	ld	a5,72(a5)
    80004d1a:	ec3e                	sd	a5,24(sp)
    80004d1c:	01714783          	lbu	a5,23(sp)
    80004d20:	873e                	mv	a4,a5
    80004d22:	00714783          	lbu	a5,7(sp)
    80004d26:	0ff77713          	zext.b	a4,a4
    80004d2a:	0ff7f793          	zext.b	a5,a5
    80004d2e:	00e7fd63          	bgeu	a5,a4,80004d48 <OS_TaskChangePrio+0x106>
    80004d32:	67e2                	ld	a5,24(sp)
    80004d34:	0737c703          	lbu	a4,115(a5)
    80004d38:	00714783          	lbu	a5,7(sp)
    80004d3c:	0ff7f793          	zext.b	a5,a5
    80004d40:	06e7e163          	bltu	a5,a4,80004da2 <OS_TaskChangePrio+0x160>
    80004d44:	ec02                	sd	zero,24(sp)
    80004d46:	a8b1                	j	80004da2 <OS_TaskChangePrio+0x160>
    80004d48:	67e2                	ld	a5,24(sp)
    80004d4a:	0737c703          	lbu	a4,115(a5)
    80004d4e:	01714783          	lbu	a5,23(sp)
    80004d52:	0ff7f793          	zext.b	a5,a5
    80004d56:	04e79263          	bne	a5,a4,80004d9a <OS_TaskChangePrio+0x158>
    80004d5a:	6562                	ld	a0,24(sp)
    80004d5c:	471010ef          	jal	800069cc <OS_MutexGrpPrioFindHighest>
    80004d60:	87aa                	mv	a5,a0
    80004d62:	00f103a3          	sb	a5,7(sp)
    80004d66:	67e2                	ld	a5,24(sp)
    80004d68:	0747c783          	lbu	a5,116(a5)
    80004d6c:	863e                	mv	a2,a5
    80004d6e:	00714783          	lbu	a5,7(sp)
    80004d72:	0ff7f693          	zext.b	a3,a5
    80004d76:	0ff67713          	zext.b	a4,a2
    80004d7a:	00d77363          	bgeu	a4,a3,80004d80 <OS_TaskChangePrio+0x13e>
    80004d7e:	87b2                	mv	a5,a2
    80004d80:	00f103a3          	sb	a5,7(sp)
    80004d84:	67e2                	ld	a5,24(sp)
    80004d86:	0737c703          	lbu	a4,115(a5)
    80004d8a:	00714783          	lbu	a5,7(sp)
    80004d8e:	0ff7f793          	zext.b	a5,a5
    80004d92:	00e79863          	bne	a5,a4,80004da2 <OS_TaskChangePrio+0x160>
    80004d96:	ec02                	sd	zero,24(sp)
    80004d98:	a029                	j	80004da2 <OS_TaskChangePrio+0x160>
    80004d9a:	ec02                	sd	zero,24(sp)
    80004d9c:	a019                	j	80004da2 <OS_TaskChangePrio+0x160>
    80004d9e:	0001                	nop
    80004da0:	a011                	j	80004da4 <OS_TaskChangePrio+0x162>
    80004da2:	0001                	nop
    80004da4:	0001                	nop
    80004da6:	67e2                	ld	a5,24(sp)
    80004da8:	e43e                	sd	a5,8(sp)
    80004daa:	67a2                	ld	a5,8(sp)
    80004dac:	ea0791e3          	bnez	a5,80004c4e <OS_TaskChangePrio+0xc>
    80004db0:	a011                	j	80004db4 <OS_TaskChangePrio+0x172>
    80004db2:	0001                	nop
    80004db4:	70a2                	ld	ra,40(sp)
    80004db6:	6145                	add	sp,sp,48
    80004db8:	8082                	ret

0000000080004dba <OSInit>:
    80004dba:	7179                	add	sp,sp,-48
    80004dbc:	f406                	sd	ra,40(sp)
    80004dbe:	e42a                	sd	a0,8(sp)
    80004dc0:	b4dfc0ef          	jal	8000190c <OSInitHook>
    80004dc4:	00007797          	auipc	a5,0x7
    80004dc8:	b4878793          	add	a5,a5,-1208 # 8000b90c <OSIntNestingCtr>
    80004dcc:	00078023          	sb	zero,0(a5)
    80004dd0:	00007797          	auipc	a5,0x7
    80004dd4:	b3d78793          	add	a5,a5,-1219 # 8000b90d <OSRunning>
    80004dd8:	00078023          	sb	zero,0(a5)
    80004ddc:	00007797          	auipc	a5,0x7
    80004de0:	b7e78793          	add	a5,a5,-1154 # 8000b95a <OSSchedLockNestingCtr>
    80004de4:	00078023          	sb	zero,0(a5)
    80004de8:	00007797          	auipc	a5,0x7
    80004dec:	be078793          	add	a5,a5,-1056 # 8000b9c8 <OSTCBCurPtr>
    80004df0:	0007b023          	sd	zero,0(a5)
    80004df4:	00007797          	auipc	a5,0x7
    80004df8:	bdc78793          	add	a5,a5,-1060 # 8000b9d0 <OSTCBHighRdyPtr>
    80004dfc:	0007b023          	sd	zero,0(a5)
    80004e00:	00007797          	auipc	a5,0x7
    80004e04:	b4278793          	add	a5,a5,-1214 # 8000b942 <OSPrioCur>
    80004e08:	00078023          	sb	zero,0(a5)
    80004e0c:	00007797          	auipc	a5,0x7
    80004e10:	b3778793          	add	a5,a5,-1225 # 8000b943 <OSPrioHighRdy>
    80004e14:	00078023          	sb	zero,0(a5)
    80004e18:	00007797          	auipc	a5,0x7
    80004e1c:	b4878793          	add	a5,a5,-1208 # 8000b960 <OSSchedRoundRobinEn>
    80004e20:	4705                	li	a4,1
    80004e22:	00e78023          	sb	a4,0(a5)
    80004e26:	00006797          	auipc	a5,0x6
    80004e2a:	25a78793          	add	a5,a5,602 # 8000b080 <OSCfg_TickRate_Hz>
    80004e2e:	439c                	lw	a5,0(a5)
    80004e30:	873e                	mv	a4,a5
    80004e32:	47a9                	li	a5,10
    80004e34:	02f757bb          	divuw	a5,a4,a5
    80004e38:	0007871b          	sext.w	a4,a5
    80004e3c:	00007797          	auipc	a5,0x7
    80004e40:	b2078793          	add	a5,a5,-1248 # 8000b95c <OSSchedRoundRobinDfltTimeQuanta>
    80004e44:	c398                	sw	a4,0(a5)
    80004e46:	00006797          	auipc	a5,0x6
    80004e4a:	1e278793          	add	a5,a5,482 # 8000b028 <OSCfg_ISRStkBasePtr>
    80004e4e:	639c                	ld	a5,0(a5)
    80004e50:	ec3e                	sd	a5,24(sp)
    80004e52:	67e2                	ld	a5,24(sp)
    80004e54:	c39d                	beqz	a5,80004e7a <OSInit+0xc0>
    80004e56:	00006797          	auipc	a5,0x6
    80004e5a:	1da78793          	add	a5,a5,474 # 8000b030 <OSCfg_ISRStkSize>
    80004e5e:	639c                	ld	a5,0(a5)
    80004e60:	e83e                	sd	a5,16(sp)
    80004e62:	a811                	j	80004e76 <OSInit+0xbc>
    80004e64:	67c2                	ld	a5,16(sp)
    80004e66:	17fd                	add	a5,a5,-1
    80004e68:	e83e                	sd	a5,16(sp)
    80004e6a:	67e2                	ld	a5,24(sp)
    80004e6c:	0007b023          	sd	zero,0(a5)
    80004e70:	67e2                	ld	a5,24(sp)
    80004e72:	07a1                	add	a5,a5,8
    80004e74:	ec3e                	sd	a5,24(sp)
    80004e76:	67c2                	ld	a5,16(sp)
    80004e78:	f7f5                	bnez	a5,80004e64 <OSInit+0xaa>
    80004e7a:	00007797          	auipc	a5,0x7
    80004e7e:	a5678793          	add	a5,a5,-1450 # 8000b8d0 <OS_AppTaskCreateHookPtr>
    80004e82:	0007b023          	sd	zero,0(a5)
    80004e86:	00007797          	auipc	a5,0x7
    80004e8a:	a5278793          	add	a5,a5,-1454 # 8000b8d8 <OS_AppTaskDelHookPtr>
    80004e8e:	0007b023          	sd	zero,0(a5)
    80004e92:	00007797          	auipc	a5,0x7
    80004e96:	a4e78793          	add	a5,a5,-1458 # 8000b8e0 <OS_AppTaskReturnHookPtr>
    80004e9a:	0007b023          	sd	zero,0(a5)
    80004e9e:	00007797          	auipc	a5,0x7
    80004ea2:	a4a78793          	add	a5,a5,-1462 # 8000b8e8 <OS_AppIdleTaskHookPtr>
    80004ea6:	0007b023          	sd	zero,0(a5)
    80004eaa:	00007797          	auipc	a5,0x7
    80004eae:	a4678793          	add	a5,a5,-1466 # 8000b8f0 <OS_AppStatTaskHookPtr>
    80004eb2:	0007b023          	sd	zero,0(a5)
    80004eb6:	00007797          	auipc	a5,0x7
    80004eba:	a4278793          	add	a5,a5,-1470 # 8000b8f8 <OS_AppTaskSwHookPtr>
    80004ebe:	0007b023          	sd	zero,0(a5)
    80004ec2:	00007797          	auipc	a5,0x7
    80004ec6:	a3e78793          	add	a5,a5,-1474 # 8000b900 <OS_AppTimeTickHookPtr>
    80004eca:	0007b023          	sd	zero,0(a5)
    80004ece:	00007797          	auipc	a5,0x7
    80004ed2:	acc78793          	add	a5,a5,-1332 # 8000b99a <OSTaskRegNextAvailID>
    80004ed6:	00078023          	sb	zero,0(a5)
    80004eda:	470020ef          	jal	8000734a <OS_PrioInit>
    80004ede:	4b3000ef          	jal	80005b90 <OS_RdyListInit>
    80004ee2:	00007797          	auipc	a5,0x7
    80004ee6:	a3678793          	add	a5,a5,-1482 # 8000b918 <OSFlagDbgListPtr>
    80004eea:	0007b023          	sd	zero,0(a5)
    80004eee:	00007797          	auipc	a5,0x7
    80004ef2:	a3278793          	add	a5,a5,-1486 # 8000b920 <OSFlagQty>
    80004ef6:	00079023          	sh	zero,0(a5)
    80004efa:	6522                	ld	a0,8(sp)
    80004efc:	969fd0ef          	jal	80002864 <OS_MemInit>
    80004f00:	67a2                	ld	a5,8(sp)
    80004f02:	439c                	lw	a5,0(a5)
    80004f04:	e7cd                	bnez	a5,80004fae <OSInit+0x1f4>
    80004f06:	6522                	ld	a0,8(sp)
    80004f08:	8fafe0ef          	jal	80003002 <OS_MsgPoolInit>
    80004f0c:	67a2                	ld	a5,8(sp)
    80004f0e:	439c                	lw	a5,0(a5)
    80004f10:	e3cd                	bnez	a5,80004fb2 <OSInit+0x1f8>
    80004f12:	00007797          	auipc	a5,0x7
    80004f16:	a2678793          	add	a5,a5,-1498 # 8000b938 <OSMutexDbgListPtr>
    80004f1a:	0007b023          	sd	zero,0(a5)
    80004f1e:	00007797          	auipc	a5,0x7
    80004f22:	a2278793          	add	a5,a5,-1502 # 8000b940 <OSMutexQty>
    80004f26:	00079023          	sh	zero,0(a5)
    80004f2a:	00007797          	auipc	a5,0x7
    80004f2e:	a2678793          	add	a5,a5,-1498 # 8000b950 <OSQDbgListPtr>
    80004f32:	0007b023          	sd	zero,0(a5)
    80004f36:	00007797          	auipc	a5,0x7
    80004f3a:	a2278793          	add	a5,a5,-1502 # 8000b958 <OSQQty>
    80004f3e:	00079023          	sh	zero,0(a5)
    80004f42:	00007797          	auipc	a5,0x7
    80004f46:	a2678793          	add	a5,a5,-1498 # 8000b968 <OSSemDbgListPtr>
    80004f4a:	0007b023          	sd	zero,0(a5)
    80004f4e:	00007797          	auipc	a5,0x7
    80004f52:	a2278793          	add	a5,a5,-1502 # 8000b970 <OSSemQty>
    80004f56:	00079023          	sh	zero,0(a5)
    80004f5a:	6522                	ld	a0,8(sp)
    80004f5c:	b0fff0ef          	jal	80004a6a <OS_TaskInit>
    80004f60:	67a2                	ld	a5,8(sp)
    80004f62:	439c                	lw	a5,0(a5)
    80004f64:	eba9                	bnez	a5,80004fb6 <OSInit+0x1fc>
    80004f66:	6522                	ld	a0,8(sp)
    80004f68:	708000ef          	jal	80005670 <OS_IdleTaskInit>
    80004f6c:	67a2                	ld	a5,8(sp)
    80004f6e:	439c                	lw	a5,0(a5)
    80004f70:	e7a9                	bnez	a5,80004fba <OSInit+0x200>
    80004f72:	6522                	ld	a0,8(sp)
    80004f74:	333010ef          	jal	80006aa6 <OS_TickInit>
    80004f78:	67a2                	ld	a5,8(sp)
    80004f7a:	439c                	lw	a5,0(a5)
    80004f7c:	e3a9                	bnez	a5,80004fbe <OSInit+0x204>
    80004f7e:	6522                	ld	a0,8(sp)
    80004f80:	f65fd0ef          	jal	80002ee4 <OS_StatTaskInit>
    80004f84:	67a2                	ld	a5,8(sp)
    80004f86:	439c                	lw	a5,0(a5)
    80004f88:	ef8d                	bnez	a5,80004fc2 <OSInit+0x208>
    80004f8a:	6522                	ld	a0,8(sp)
    80004f8c:	439040ef          	jal	80009bc4 <OS_TmrInit>
    80004f90:	67a2                	ld	a5,8(sp)
    80004f92:	439c                	lw	a5,0(a5)
    80004f94:	eb8d                	bnez	a5,80004fc6 <OSInit+0x20c>
    80004f96:	0f8020ef          	jal	8000708e <OS_Dbg_Init>
    80004f9a:	864fe0ef          	jal	80002ffe <OSCfg_Init>
    80004f9e:	00007797          	auipc	a5,0x7
    80004fa2:	97078793          	add	a5,a5,-1680 # 8000b90e <OSInitialized>
    80004fa6:	4705                	li	a4,1
    80004fa8:	00e78023          	sb	a4,0(a5)
    80004fac:	a831                	j	80004fc8 <OSInit+0x20e>
    80004fae:	0001                	nop
    80004fb0:	a821                	j	80004fc8 <OSInit+0x20e>
    80004fb2:	0001                	nop
    80004fb4:	a811                	j	80004fc8 <OSInit+0x20e>
    80004fb6:	0001                	nop
    80004fb8:	a801                	j	80004fc8 <OSInit+0x20e>
    80004fba:	0001                	nop
    80004fbc:	a031                	j	80004fc8 <OSInit+0x20e>
    80004fbe:	0001                	nop
    80004fc0:	a021                	j	80004fc8 <OSInit+0x20e>
    80004fc2:	0001                	nop
    80004fc4:	a011                	j	80004fc8 <OSInit+0x20e>
    80004fc6:	0001                	nop
    80004fc8:	70a2                	ld	ra,40(sp)
    80004fca:	6145                	add	sp,sp,48
    80004fcc:	8082                	ret

0000000080004fce <OSIntEnter>:
    80004fce:	00007797          	auipc	a5,0x7
    80004fd2:	93f78793          	add	a5,a5,-1729 # 8000b90d <OSRunning>
    80004fd6:	0007c783          	lbu	a5,0(a5)
    80004fda:	873e                	mv	a4,a5
    80004fdc:	4785                	li	a5,1
    80004fde:	02f71d63          	bne	a4,a5,80005018 <OSIntEnter+0x4a>
    80004fe2:	00007797          	auipc	a5,0x7
    80004fe6:	92a78793          	add	a5,a5,-1750 # 8000b90c <OSIntNestingCtr>
    80004fea:	0007c783          	lbu	a5,0(a5)
    80004fee:	873e                	mv	a4,a5
    80004ff0:	0f900793          	li	a5,249
    80004ff4:	02e7e463          	bltu	a5,a4,8000501c <OSIntEnter+0x4e>
    80004ff8:	00007797          	auipc	a5,0x7
    80004ffc:	91478793          	add	a5,a5,-1772 # 8000b90c <OSIntNestingCtr>
    80005000:	0007c783          	lbu	a5,0(a5)
    80005004:	2785                	addw	a5,a5,1
    80005006:	0ff7f713          	zext.b	a4,a5
    8000500a:	00007797          	auipc	a5,0x7
    8000500e:	90278793          	add	a5,a5,-1790 # 8000b90c <OSIntNestingCtr>
    80005012:	00e78023          	sb	a4,0(a5)
    80005016:	8082                	ret
    80005018:	0001                	nop
    8000501a:	8082                	ret
    8000501c:	0001                	nop
    8000501e:	8082                	ret

0000000080005020 <OSIntExit>:
    80005020:	1101                	add	sp,sp,-32
    80005022:	ec06                	sd	ra,24(sp)
    80005024:	e402                	sd	zero,8(sp)
    80005026:	00007797          	auipc	a5,0x7
    8000502a:	8e778793          	add	a5,a5,-1817 # 8000b90d <OSRunning>
    8000502e:	0007c783          	lbu	a5,0(a5)
    80005032:	873e                	mv	a4,a5
    80005034:	4785                	li	a5,1
    80005036:	10f71463          	bne	a4,a5,8000513e <OSIntExit+0x11e>
    8000503a:	ad4fc0ef          	jal	8000130e <CPU_SR_Save>
    8000503e:	e42a                	sd	a0,8(sp)
    80005040:	00007797          	auipc	a5,0x7
    80005044:	8cc78793          	add	a5,a5,-1844 # 8000b90c <OSIntNestingCtr>
    80005048:	0007c783          	lbu	a5,0(a5)
    8000504c:	e789                	bnez	a5,80005056 <OSIntExit+0x36>
    8000504e:	6522                	ld	a0,8(sp)
    80005050:	acafc0ef          	jal	8000131a <CPU_SR_Restore>
    80005054:	a0f5                	j	80005140 <OSIntExit+0x120>
    80005056:	00007797          	auipc	a5,0x7
    8000505a:	8b678793          	add	a5,a5,-1866 # 8000b90c <OSIntNestingCtr>
    8000505e:	0007c783          	lbu	a5,0(a5)
    80005062:	37fd                	addw	a5,a5,-1
    80005064:	0ff7f713          	zext.b	a4,a5
    80005068:	00007797          	auipc	a5,0x7
    8000506c:	8a478793          	add	a5,a5,-1884 # 8000b90c <OSIntNestingCtr>
    80005070:	00e78023          	sb	a4,0(a5)
    80005074:	00007797          	auipc	a5,0x7
    80005078:	89878793          	add	a5,a5,-1896 # 8000b90c <OSIntNestingCtr>
    8000507c:	0007c783          	lbu	a5,0(a5)
    80005080:	c789                	beqz	a5,8000508a <OSIntExit+0x6a>
    80005082:	6522                	ld	a0,8(sp)
    80005084:	a96fc0ef          	jal	8000131a <CPU_SR_Restore>
    80005088:	a865                	j	80005140 <OSIntExit+0x120>
    8000508a:	00007797          	auipc	a5,0x7
    8000508e:	8d078793          	add	a5,a5,-1840 # 8000b95a <OSSchedLockNestingCtr>
    80005092:	0007c783          	lbu	a5,0(a5)
    80005096:	c789                	beqz	a5,800050a0 <OSIntExit+0x80>
    80005098:	6522                	ld	a0,8(sp)
    8000509a:	a80fc0ef          	jal	8000131a <CPU_SR_Restore>
    8000509e:	a04d                	j	80005140 <OSIntExit+0x120>
    800050a0:	2d4020ef          	jal	80007374 <OS_PrioGetHighest>
    800050a4:	87aa                	mv	a5,a0
    800050a6:	873e                	mv	a4,a5
    800050a8:	00007797          	auipc	a5,0x7
    800050ac:	89b78793          	add	a5,a5,-1893 # 8000b943 <OSPrioHighRdy>
    800050b0:	00e78023          	sb	a4,0(a5)
    800050b4:	00007797          	auipc	a5,0x7
    800050b8:	88f78793          	add	a5,a5,-1905 # 8000b943 <OSPrioHighRdy>
    800050bc:	0007c783          	lbu	a5,0(a5)
    800050c0:	0007871b          	sext.w	a4,a5
    800050c4:	00018697          	auipc	a3,0x18
    800050c8:	d8c68693          	add	a3,a3,-628 # 8001ce50 <OSRdyList>
    800050cc:	87ba                	mv	a5,a4
    800050ce:	0786                	sll	a5,a5,0x1
    800050d0:	97ba                	add	a5,a5,a4
    800050d2:	078e                	sll	a5,a5,0x3
    800050d4:	97b6                	add	a5,a5,a3
    800050d6:	6398                	ld	a4,0(a5)
    800050d8:	00007797          	auipc	a5,0x7
    800050dc:	8f878793          	add	a5,a5,-1800 # 8000b9d0 <OSTCBHighRdyPtr>
    800050e0:	e398                	sd	a4,0(a5)
    800050e2:	00007797          	auipc	a5,0x7
    800050e6:	8ee78793          	add	a5,a5,-1810 # 8000b9d0 <OSTCBHighRdyPtr>
    800050ea:	6398                	ld	a4,0(a5)
    800050ec:	00007797          	auipc	a5,0x7
    800050f0:	8dc78793          	add	a5,a5,-1828 # 8000b9c8 <OSTCBCurPtr>
    800050f4:	639c                	ld	a5,0(a5)
    800050f6:	00f71663          	bne	a4,a5,80005102 <OSIntExit+0xe2>
    800050fa:	6522                	ld	a0,8(sp)
    800050fc:	a1efc0ef          	jal	8000131a <CPU_SR_Restore>
    80005100:	a081                	j	80005140 <OSIntExit+0x120>
    80005102:	00007797          	auipc	a5,0x7
    80005106:	8ce78793          	add	a5,a5,-1842 # 8000b9d0 <OSTCBHighRdyPtr>
    8000510a:	639c                	ld	a5,0(a5)
    8000510c:	0e87a703          	lw	a4,232(a5)
    80005110:	2705                	addw	a4,a4,1
    80005112:	2701                	sext.w	a4,a4
    80005114:	0ee7a423          	sw	a4,232(a5)
    80005118:	00007797          	auipc	a5,0x7
    8000511c:	87078793          	add	a5,a5,-1936 # 8000b988 <OSTaskCtxSwCtr>
    80005120:	439c                	lw	a5,0(a5)
    80005122:	2785                	addw	a5,a5,1
    80005124:	0007871b          	sext.w	a4,a5
    80005128:	00007797          	auipc	a5,0x7
    8000512c:	86078793          	add	a5,a5,-1952 # 8000b988 <OSTaskCtxSwCtr>
    80005130:	c398                	sw	a4,0(a5)
    80005132:	f10fc0ef          	jal	80001842 <OSCtxSw>
    80005136:	6522                	ld	a0,8(sp)
    80005138:	9e2fc0ef          	jal	8000131a <CPU_SR_Restore>
    8000513c:	a011                	j	80005140 <OSIntExit+0x120>
    8000513e:	0001                	nop
    80005140:	60e2                	ld	ra,24(sp)
    80005142:	6105                	add	sp,sp,32
    80005144:	8082                	ret

0000000080005146 <OSSched>:
    80005146:	1101                	add	sp,sp,-32
    80005148:	ec06                	sd	ra,24(sp)
    8000514a:	e402                	sd	zero,8(sp)
    8000514c:	00006797          	auipc	a5,0x6
    80005150:	7c178793          	add	a5,a5,1985 # 8000b90d <OSRunning>
    80005154:	0007c783          	lbu	a5,0(a5)
    80005158:	873e                	mv	a4,a5
    8000515a:	4785                	li	a5,1
    8000515c:	0cf71263          	bne	a4,a5,80005220 <OSSched+0xda>
    80005160:	00006797          	auipc	a5,0x6
    80005164:	7ac78793          	add	a5,a5,1964 # 8000b90c <OSIntNestingCtr>
    80005168:	0007c783          	lbu	a5,0(a5)
    8000516c:	efc5                	bnez	a5,80005224 <OSSched+0xde>
    8000516e:	00006797          	auipc	a5,0x6
    80005172:	7ec78793          	add	a5,a5,2028 # 8000b95a <OSSchedLockNestingCtr>
    80005176:	0007c783          	lbu	a5,0(a5)
    8000517a:	e7dd                	bnez	a5,80005228 <OSSched+0xe2>
    8000517c:	992fc0ef          	jal	8000130e <CPU_SR_Save>
    80005180:	e42a                	sd	a0,8(sp)
    80005182:	1f2020ef          	jal	80007374 <OS_PrioGetHighest>
    80005186:	87aa                	mv	a5,a0
    80005188:	873e                	mv	a4,a5
    8000518a:	00006797          	auipc	a5,0x6
    8000518e:	7b978793          	add	a5,a5,1977 # 8000b943 <OSPrioHighRdy>
    80005192:	00e78023          	sb	a4,0(a5)
    80005196:	00006797          	auipc	a5,0x6
    8000519a:	7ad78793          	add	a5,a5,1965 # 8000b943 <OSPrioHighRdy>
    8000519e:	0007c783          	lbu	a5,0(a5)
    800051a2:	0007871b          	sext.w	a4,a5
    800051a6:	00018697          	auipc	a3,0x18
    800051aa:	caa68693          	add	a3,a3,-854 # 8001ce50 <OSRdyList>
    800051ae:	87ba                	mv	a5,a4
    800051b0:	0786                	sll	a5,a5,0x1
    800051b2:	97ba                	add	a5,a5,a4
    800051b4:	078e                	sll	a5,a5,0x3
    800051b6:	97b6                	add	a5,a5,a3
    800051b8:	6398                	ld	a4,0(a5)
    800051ba:	00007797          	auipc	a5,0x7
    800051be:	81678793          	add	a5,a5,-2026 # 8000b9d0 <OSTCBHighRdyPtr>
    800051c2:	e398                	sd	a4,0(a5)
    800051c4:	00007797          	auipc	a5,0x7
    800051c8:	80c78793          	add	a5,a5,-2036 # 8000b9d0 <OSTCBHighRdyPtr>
    800051cc:	6398                	ld	a4,0(a5)
    800051ce:	00006797          	auipc	a5,0x6
    800051d2:	7fa78793          	add	a5,a5,2042 # 8000b9c8 <OSTCBCurPtr>
    800051d6:	639c                	ld	a5,0(a5)
    800051d8:	00f71663          	bne	a4,a5,800051e4 <OSSched+0x9e>
    800051dc:	6522                	ld	a0,8(sp)
    800051de:	93cfc0ef          	jal	8000131a <CPU_SR_Restore>
    800051e2:	a0a1                	j	8000522a <OSSched+0xe4>
    800051e4:	00006797          	auipc	a5,0x6
    800051e8:	7ec78793          	add	a5,a5,2028 # 8000b9d0 <OSTCBHighRdyPtr>
    800051ec:	639c                	ld	a5,0(a5)
    800051ee:	0e87a703          	lw	a4,232(a5)
    800051f2:	2705                	addw	a4,a4,1
    800051f4:	2701                	sext.w	a4,a4
    800051f6:	0ee7a423          	sw	a4,232(a5)
    800051fa:	00006797          	auipc	a5,0x6
    800051fe:	78e78793          	add	a5,a5,1934 # 8000b988 <OSTaskCtxSwCtr>
    80005202:	439c                	lw	a5,0(a5)
    80005204:	2785                	addw	a5,a5,1
    80005206:	0007871b          	sext.w	a4,a5
    8000520a:	00006797          	auipc	a5,0x6
    8000520e:	77e78793          	add	a5,a5,1918 # 8000b988 <OSTaskCtxSwCtr>
    80005212:	c398                	sw	a4,0(a5)
    80005214:	e2efc0ef          	jal	80001842 <OSCtxSw>
    80005218:	6522                	ld	a0,8(sp)
    8000521a:	900fc0ef          	jal	8000131a <CPU_SR_Restore>
    8000521e:	a031                	j	8000522a <OSSched+0xe4>
    80005220:	0001                	nop
    80005222:	a021                	j	8000522a <OSSched+0xe4>
    80005224:	0001                	nop
    80005226:	a011                	j	8000522a <OSSched+0xe4>
    80005228:	0001                	nop
    8000522a:	60e2                	ld	ra,24(sp)
    8000522c:	6105                	add	sp,sp,32
    8000522e:	8082                	ret

0000000080005230 <OSSchedLock>:
    80005230:	7179                	add	sp,sp,-48
    80005232:	f406                	sd	ra,40(sp)
    80005234:	e42a                	sd	a0,8(sp)
    80005236:	ec02                	sd	zero,24(sp)
    80005238:	00006797          	auipc	a5,0x6
    8000523c:	6d478793          	add	a5,a5,1748 # 8000b90c <OSIntNestingCtr>
    80005240:	0007c783          	lbu	a5,0(a5)
    80005244:	c799                	beqz	a5,80005252 <OSSchedLock+0x22>
    80005246:	67a2                	ld	a5,8(sp)
    80005248:	671d                	lui	a4,0x7
    8000524a:	d6270713          	add	a4,a4,-670 # 6d62 <CPU_MSTATUS_MIE+0x6d5a>
    8000524e:	c398                	sw	a4,0(a5)
    80005250:	a895                	j	800052c4 <OSSchedLock+0x94>
    80005252:	00006797          	auipc	a5,0x6
    80005256:	6bb78793          	add	a5,a5,1723 # 8000b90d <OSRunning>
    8000525a:	0007c783          	lbu	a5,0(a5)
    8000525e:	873e                	mv	a4,a5
    80005260:	4785                	li	a5,1
    80005262:	00f70863          	beq	a4,a5,80005272 <OSSchedLock+0x42>
    80005266:	67a2                	ld	a5,8(sp)
    80005268:	6719                	lui	a4,0x6
    8000526a:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    8000526e:	c398                	sw	a4,0(a5)
    80005270:	a891                	j	800052c4 <OSSchedLock+0x94>
    80005272:	00006797          	auipc	a5,0x6
    80005276:	6e878793          	add	a5,a5,1768 # 8000b95a <OSSchedLockNestingCtr>
    8000527a:	0007c783          	lbu	a5,0(a5)
    8000527e:	873e                	mv	a4,a5
    80005280:	0f900793          	li	a5,249
    80005284:	00e7f863          	bgeu	a5,a4,80005294 <OSSchedLock+0x64>
    80005288:	67a2                	ld	a5,8(sp)
    8000528a:	6715                	lui	a4,0x5
    8000528c:	20970713          	add	a4,a4,521 # 5209 <CPU_MSTATUS_MIE+0x5201>
    80005290:	c398                	sw	a4,0(a5)
    80005292:	a80d                	j	800052c4 <OSSchedLock+0x94>
    80005294:	87afc0ef          	jal	8000130e <CPU_SR_Save>
    80005298:	ec2a                	sd	a0,24(sp)
    8000529a:	00006797          	auipc	a5,0x6
    8000529e:	6c078793          	add	a5,a5,1728 # 8000b95a <OSSchedLockNestingCtr>
    800052a2:	0007c783          	lbu	a5,0(a5)
    800052a6:	2785                	addw	a5,a5,1
    800052a8:	0ff7f713          	zext.b	a4,a5
    800052ac:	00006797          	auipc	a5,0x6
    800052b0:	6ae78793          	add	a5,a5,1710 # 8000b95a <OSSchedLockNestingCtr>
    800052b4:	00e78023          	sb	a4,0(a5)
    800052b8:	6562                	ld	a0,24(sp)
    800052ba:	860fc0ef          	jal	8000131a <CPU_SR_Restore>
    800052be:	67a2                	ld	a5,8(sp)
    800052c0:	0007a023          	sw	zero,0(a5)
    800052c4:	70a2                	ld	ra,40(sp)
    800052c6:	6145                	add	sp,sp,48
    800052c8:	8082                	ret

00000000800052ca <OSSchedUnlock>:
    800052ca:	7179                	add	sp,sp,-48
    800052cc:	f406                	sd	ra,40(sp)
    800052ce:	e42a                	sd	a0,8(sp)
    800052d0:	ec02                	sd	zero,24(sp)
    800052d2:	00006797          	auipc	a5,0x6
    800052d6:	63a78793          	add	a5,a5,1594 # 8000b90c <OSIntNestingCtr>
    800052da:	0007c783          	lbu	a5,0(a5)
    800052de:	c799                	beqz	a5,800052ec <OSSchedUnlock+0x22>
    800052e0:	67a2                	ld	a5,8(sp)
    800052e2:	671d                	lui	a4,0x7
    800052e4:	d6570713          	add	a4,a4,-667 # 6d65 <CPU_MSTATUS_MIE+0x6d5d>
    800052e8:	c398                	sw	a4,0(a5)
    800052ea:	a841                	j	8000537a <OSSchedUnlock+0xb0>
    800052ec:	00006797          	auipc	a5,0x6
    800052f0:	62178793          	add	a5,a5,1569 # 8000b90d <OSRunning>
    800052f4:	0007c783          	lbu	a5,0(a5)
    800052f8:	873e                	mv	a4,a5
    800052fa:	4785                	li	a5,1
    800052fc:	00f70863          	beq	a4,a5,8000530c <OSSchedUnlock+0x42>
    80005300:	67a2                	ld	a5,8(sp)
    80005302:	6719                	lui	a4,0x6
    80005304:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80005308:	c398                	sw	a4,0(a5)
    8000530a:	a885                	j	8000537a <OSSchedUnlock+0xb0>
    8000530c:	00006797          	auipc	a5,0x6
    80005310:	64e78793          	add	a5,a5,1614 # 8000b95a <OSSchedLockNestingCtr>
    80005314:	0007c783          	lbu	a5,0(a5)
    80005318:	e799                	bnez	a5,80005326 <OSSchedUnlock+0x5c>
    8000531a:	67a2                	ld	a5,8(sp)
    8000531c:	671d                	lui	a4,0x7
    8000531e:	d6470713          	add	a4,a4,-668 # 6d64 <CPU_MSTATUS_MIE+0x6d5c>
    80005322:	c398                	sw	a4,0(a5)
    80005324:	a899                	j	8000537a <OSSchedUnlock+0xb0>
    80005326:	fe9fb0ef          	jal	8000130e <CPU_SR_Save>
    8000532a:	ec2a                	sd	a0,24(sp)
    8000532c:	00006797          	auipc	a5,0x6
    80005330:	62e78793          	add	a5,a5,1582 # 8000b95a <OSSchedLockNestingCtr>
    80005334:	0007c783          	lbu	a5,0(a5)
    80005338:	37fd                	addw	a5,a5,-1
    8000533a:	0ff7f713          	zext.b	a4,a5
    8000533e:	00006797          	auipc	a5,0x6
    80005342:	61c78793          	add	a5,a5,1564 # 8000b95a <OSSchedLockNestingCtr>
    80005346:	00e78023          	sb	a4,0(a5)
    8000534a:	00006797          	auipc	a5,0x6
    8000534e:	61078793          	add	a5,a5,1552 # 8000b95a <OSSchedLockNestingCtr>
    80005352:	0007c783          	lbu	a5,0(a5)
    80005356:	cb91                	beqz	a5,8000536a <OSSchedUnlock+0xa0>
    80005358:	6562                	ld	a0,24(sp)
    8000535a:	fc1fb0ef          	jal	8000131a <CPU_SR_Restore>
    8000535e:	67a2                	ld	a5,8(sp)
    80005360:	671d                	lui	a4,0x7
    80005362:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80005366:	c398                	sw	a4,0(a5)
    80005368:	a809                	j	8000537a <OSSchedUnlock+0xb0>
    8000536a:	6562                	ld	a0,24(sp)
    8000536c:	faffb0ef          	jal	8000131a <CPU_SR_Restore>
    80005370:	dd7ff0ef          	jal	80005146 <OSSched>
    80005374:	67a2                	ld	a5,8(sp)
    80005376:	0007a023          	sw	zero,0(a5)
    8000537a:	70a2                	ld	ra,40(sp)
    8000537c:	6145                	add	sp,sp,48
    8000537e:	8082                	ret

0000000080005380 <OSSchedRoundRobinCfg>:
    80005380:	7179                	add	sp,sp,-48
    80005382:	f406                	sd	ra,40(sp)
    80005384:	87aa                	mv	a5,a0
    80005386:	872e                	mv	a4,a1
    80005388:	e032                	sd	a2,0(sp)
    8000538a:	00f107a3          	sb	a5,15(sp)
    8000538e:	87ba                	mv	a5,a4
    80005390:	c43e                	sw	a5,8(sp)
    80005392:	ec02                	sd	zero,24(sp)
    80005394:	f7bfb0ef          	jal	8000130e <CPU_SR_Save>
    80005398:	ec2a                	sd	a0,24(sp)
    8000539a:	00f14783          	lbu	a5,15(sp)
    8000539e:	0ff7f793          	zext.b	a5,a5
    800053a2:	eb81                	bnez	a5,800053b2 <OSSchedRoundRobinCfg+0x32>
    800053a4:	00006797          	auipc	a5,0x6
    800053a8:	5bc78793          	add	a5,a5,1468 # 8000b960 <OSSchedRoundRobinEn>
    800053ac:	00078023          	sb	zero,0(a5)
    800053b0:	a801                	j	800053c0 <OSSchedRoundRobinCfg+0x40>
    800053b2:	00006797          	auipc	a5,0x6
    800053b6:	5ae78793          	add	a5,a5,1454 # 8000b960 <OSSchedRoundRobinEn>
    800053ba:	4705                	li	a4,1
    800053bc:	00e78023          	sb	a4,0(a5)
    800053c0:	47a2                	lw	a5,8(sp)
    800053c2:	2781                	sext.w	a5,a5
    800053c4:	cb81                	beqz	a5,800053d4 <OSSchedRoundRobinCfg+0x54>
    800053c6:	00006797          	auipc	a5,0x6
    800053ca:	59678793          	add	a5,a5,1430 # 8000b95c <OSSchedRoundRobinDfltTimeQuanta>
    800053ce:	4722                	lw	a4,8(sp)
    800053d0:	c398                	sw	a4,0(a5)
    800053d2:	a00d                	j	800053f4 <OSSchedRoundRobinCfg+0x74>
    800053d4:	00006797          	auipc	a5,0x6
    800053d8:	cac78793          	add	a5,a5,-852 # 8000b080 <OSCfg_TickRate_Hz>
    800053dc:	439c                	lw	a5,0(a5)
    800053de:	873e                	mv	a4,a5
    800053e0:	47a9                	li	a5,10
    800053e2:	02f757bb          	divuw	a5,a4,a5
    800053e6:	0007871b          	sext.w	a4,a5
    800053ea:	00006797          	auipc	a5,0x6
    800053ee:	57278793          	add	a5,a5,1394 # 8000b95c <OSSchedRoundRobinDfltTimeQuanta>
    800053f2:	c398                	sw	a4,0(a5)
    800053f4:	6562                	ld	a0,24(sp)
    800053f6:	f25fb0ef          	jal	8000131a <CPU_SR_Restore>
    800053fa:	6782                	ld	a5,0(sp)
    800053fc:	0007a023          	sw	zero,0(a5)
    80005400:	0001                	nop
    80005402:	70a2                	ld	ra,40(sp)
    80005404:	6145                	add	sp,sp,48
    80005406:	8082                	ret

0000000080005408 <OSSchedRoundRobinYield>:
    80005408:	7139                	add	sp,sp,-64
    8000540a:	fc06                	sd	ra,56(sp)
    8000540c:	e42a                	sd	a0,8(sp)
    8000540e:	f402                	sd	zero,40(sp)
    80005410:	00006797          	auipc	a5,0x6
    80005414:	4fc78793          	add	a5,a5,1276 # 8000b90c <OSIntNestingCtr>
    80005418:	0007c783          	lbu	a5,0(a5)
    8000541c:	c799                	beqz	a5,8000542a <OSSchedRoundRobinYield+0x22>
    8000541e:	67a2                	ld	a5,8(sp)
    80005420:	6721                	lui	a4,0x8
    80005422:	4d170713          	add	a4,a4,1233 # 84d1 <CPU_MSTATUS_MIE+0x84c9>
    80005426:	c398                	sw	a4,0(a5)
    80005428:	a0d9                	j	800054ee <OSSchedRoundRobinYield+0xe6>
    8000542a:	00006797          	auipc	a5,0x6
    8000542e:	53078793          	add	a5,a5,1328 # 8000b95a <OSSchedLockNestingCtr>
    80005432:	0007c783          	lbu	a5,0(a5)
    80005436:	c799                	beqz	a5,80005444 <OSSchedRoundRobinYield+0x3c>
    80005438:	67a2                	ld	a5,8(sp)
    8000543a:	671d                	lui	a4,0x7
    8000543c:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80005440:	c398                	sw	a4,0(a5)
    80005442:	a075                	j	800054ee <OSSchedRoundRobinYield+0xe6>
    80005444:	00006797          	auipc	a5,0x6
    80005448:	51c78793          	add	a5,a5,1308 # 8000b960 <OSSchedRoundRobinEn>
    8000544c:	0007c783          	lbu	a5,0(a5)
    80005450:	873e                	mv	a4,a5
    80005452:	4785                	li	a5,1
    80005454:	00f70863          	beq	a4,a5,80005464 <OSSchedRoundRobinYield+0x5c>
    80005458:	67a2                	ld	a5,8(sp)
    8000545a:	671d                	lui	a4,0x7
    8000545c:	97b70713          	add	a4,a4,-1669 # 697b <CPU_MSTATUS_MIE+0x6973>
    80005460:	c398                	sw	a4,0(a5)
    80005462:	a071                	j	800054ee <OSSchedRoundRobinYield+0xe6>
    80005464:	eabfb0ef          	jal	8000130e <CPU_SR_Save>
    80005468:	f42a                	sd	a0,40(sp)
    8000546a:	00006797          	auipc	a5,0x6
    8000546e:	4d878793          	add	a5,a5,1240 # 8000b942 <OSPrioCur>
    80005472:	0007c783          	lbu	a5,0(a5)
    80005476:	0007871b          	sext.w	a4,a5
    8000547a:	87ba                	mv	a5,a4
    8000547c:	0786                	sll	a5,a5,0x1
    8000547e:	97ba                	add	a5,a5,a4
    80005480:	078e                	sll	a5,a5,0x3
    80005482:	00018717          	auipc	a4,0x18
    80005486:	9ce70713          	add	a4,a4,-1586 # 8001ce50 <OSRdyList>
    8000548a:	97ba                	add	a5,a5,a4
    8000548c:	f03e                	sd	a5,32(sp)
    8000548e:	7782                	ld	a5,32(sp)
    80005490:	6398                	ld	a4,0(a5)
    80005492:	7782                	ld	a5,32(sp)
    80005494:	679c                	ld	a5,8(a5)
    80005496:	00f71b63          	bne	a4,a5,800054ac <OSSchedRoundRobinYield+0xa4>
    8000549a:	7522                	ld	a0,40(sp)
    8000549c:	e7ffb0ef          	jal	8000131a <CPU_SR_Restore>
    800054a0:	67a2                	ld	a5,8(sp)
    800054a2:	671d                	lui	a4,0x7
    800054a4:	97a70713          	add	a4,a4,-1670 # 697a <CPU_MSTATUS_MIE+0x6972>
    800054a8:	c398                	sw	a4,0(a5)
    800054aa:	a091                	j	800054ee <OSSchedRoundRobinYield+0xe6>
    800054ac:	7502                	ld	a0,32(sp)
    800054ae:	073000ef          	jal	80005d20 <OS_RdyListMoveHeadToTail>
    800054b2:	7782                	ld	a5,32(sp)
    800054b4:	639c                	ld	a5,0(a5)
    800054b6:	ec3e                	sd	a5,24(sp)
    800054b8:	67e2                	ld	a5,24(sp)
    800054ba:	0987a783          	lw	a5,152(a5)
    800054be:	eb91                	bnez	a5,800054d2 <OSSchedRoundRobinYield+0xca>
    800054c0:	00006797          	auipc	a5,0x6
    800054c4:	49c78793          	add	a5,a5,1180 # 8000b95c <OSSchedRoundRobinDfltTimeQuanta>
    800054c8:	4398                	lw	a4,0(a5)
    800054ca:	67e2                	ld	a5,24(sp)
    800054cc:	08e7ae23          	sw	a4,156(a5)
    800054d0:	a039                	j	800054de <OSSchedRoundRobinYield+0xd6>
    800054d2:	67e2                	ld	a5,24(sp)
    800054d4:	0987a703          	lw	a4,152(a5)
    800054d8:	67e2                	ld	a5,24(sp)
    800054da:	08e7ae23          	sw	a4,156(a5)
    800054de:	7522                	ld	a0,40(sp)
    800054e0:	e3bfb0ef          	jal	8000131a <CPU_SR_Restore>
    800054e4:	c63ff0ef          	jal	80005146 <OSSched>
    800054e8:	67a2                	ld	a5,8(sp)
    800054ea:	0007a023          	sw	zero,0(a5)
    800054ee:	70e2                	ld	ra,56(sp)
    800054f0:	6121                	add	sp,sp,64
    800054f2:	8082                	ret

00000000800054f4 <OSStart>:
    800054f4:	7179                	add	sp,sp,-48
    800054f6:	f406                	sd	ra,40(sp)
    800054f8:	e42a                	sd	a0,8(sp)
    800054fa:	00006797          	auipc	a5,0x6
    800054fe:	41478793          	add	a5,a5,1044 # 8000b90e <OSInitialized>
    80005502:	0007c783          	lbu	a5,0(a5)
    80005506:	873e                	mv	a4,a5
    80005508:	4785                	li	a5,1
    8000550a:	00f70863          	beq	a4,a5,8000551a <OSStart+0x26>
    8000550e:	67a2                	ld	a5,8(sp)
    80005510:	6719                	lui	a4,0x6
    80005512:	e8b70713          	add	a4,a4,-373 # 5e8b <CPU_MSTATUS_MIE+0x5e83>
    80005516:	c398                	sw	a4,0(a5)
    80005518:	a0f5                	j	80005604 <OSStart+0x110>
    8000551a:	00011f23          	sh	zero,30(sp)
    8000551e:	01e15783          	lhu	a5,30(sp)
    80005522:	2785                	addw	a5,a5,1
    80005524:	00f11f23          	sh	a5,30(sp)
    80005528:	01e15783          	lhu	a5,30(sp)
    8000552c:	2785                	addw	a5,a5,1
    8000552e:	00f11f23          	sh	a5,30(sp)
    80005532:	01e15783          	lhu	a5,30(sp)
    80005536:	2785                	addw	a5,a5,1
    80005538:	00f11f23          	sh	a5,30(sp)
    8000553c:	00006797          	auipc	a5,0x6
    80005540:	45c78793          	add	a5,a5,1116 # 8000b998 <OSTaskQty>
    80005544:	0007d783          	lhu	a5,0(a5)
    80005548:	01e15703          	lhu	a4,30(sp)
    8000554c:	2701                	sext.w	a4,a4
    8000554e:	2781                	sext.w	a5,a5
    80005550:	00f76863          	bltu	a4,a5,80005560 <OSStart+0x6c>
    80005554:	67a2                	ld	a5,8(sp)
    80005556:	6719                	lui	a4,0x6
    80005558:	e8c70713          	add	a4,a4,-372 # 5e8c <CPU_MSTATUS_MIE+0x5e84>
    8000555c:	c398                	sw	a4,0(a5)
    8000555e:	a05d                	j	80005604 <OSStart+0x110>
    80005560:	00006797          	auipc	a5,0x6
    80005564:	3ad78793          	add	a5,a5,941 # 8000b90d <OSRunning>
    80005568:	0007c783          	lbu	a5,0(a5)
    8000556c:	e7d9                	bnez	a5,800055fa <OSStart+0x106>
    8000556e:	607010ef          	jal	80007374 <OS_PrioGetHighest>
    80005572:	87aa                	mv	a5,a0
    80005574:	873e                	mv	a4,a5
    80005576:	00006797          	auipc	a5,0x6
    8000557a:	3cd78793          	add	a5,a5,973 # 8000b943 <OSPrioHighRdy>
    8000557e:	00e78023          	sb	a4,0(a5)
    80005582:	00006797          	auipc	a5,0x6
    80005586:	3c178793          	add	a5,a5,961 # 8000b943 <OSPrioHighRdy>
    8000558a:	0007c703          	lbu	a4,0(a5)
    8000558e:	00006797          	auipc	a5,0x6
    80005592:	3b478793          	add	a5,a5,948 # 8000b942 <OSPrioCur>
    80005596:	00e78023          	sb	a4,0(a5)
    8000559a:	00006797          	auipc	a5,0x6
    8000559e:	3a978793          	add	a5,a5,937 # 8000b943 <OSPrioHighRdy>
    800055a2:	0007c783          	lbu	a5,0(a5)
    800055a6:	0007871b          	sext.w	a4,a5
    800055aa:	00018697          	auipc	a3,0x18
    800055ae:	8a668693          	add	a3,a3,-1882 # 8001ce50 <OSRdyList>
    800055b2:	87ba                	mv	a5,a4
    800055b4:	0786                	sll	a5,a5,0x1
    800055b6:	97ba                	add	a5,a5,a4
    800055b8:	078e                	sll	a5,a5,0x3
    800055ba:	97b6                	add	a5,a5,a3
    800055bc:	6398                	ld	a4,0(a5)
    800055be:	00006797          	auipc	a5,0x6
    800055c2:	41278793          	add	a5,a5,1042 # 8000b9d0 <OSTCBHighRdyPtr>
    800055c6:	e398                	sd	a4,0(a5)
    800055c8:	00006797          	auipc	a5,0x6
    800055cc:	40878793          	add	a5,a5,1032 # 8000b9d0 <OSTCBHighRdyPtr>
    800055d0:	6398                	ld	a4,0(a5)
    800055d2:	00006797          	auipc	a5,0x6
    800055d6:	3f678793          	add	a5,a5,1014 # 8000b9c8 <OSTCBCurPtr>
    800055da:	e398                	sd	a4,0(a5)
    800055dc:	00006797          	auipc	a5,0x6
    800055e0:	33178793          	add	a5,a5,817 # 8000b90d <OSRunning>
    800055e4:	4705                	li	a4,1
    800055e6:	00e78023          	sb	a4,0(a5)
    800055ea:	9e2fc0ef          	jal	800017cc <OSStartHighRdy>
    800055ee:	67a2                	ld	a5,8(sp)
    800055f0:	6711                	lui	a4,0x4
    800055f2:	a9970713          	add	a4,a4,-1383 # 3a99 <CPU_MSTATUS_MIE+0x3a91>
    800055f6:	c398                	sw	a4,0(a5)
    800055f8:	a031                	j	80005604 <OSStart+0x110>
    800055fa:	67a2                	ld	a5,8(sp)
    800055fc:	6719                	lui	a4,0x6
    800055fe:	e8a70713          	add	a4,a4,-374 # 5e8a <CPU_MSTATUS_MIE+0x5e82>
    80005602:	c398                	sw	a4,0(a5)
    80005604:	70a2                	ld	ra,40(sp)
    80005606:	6145                	add	sp,sp,48
    80005608:	8082                	ret

000000008000560a <OSVersion>:
    8000560a:	1141                	add	sp,sp,-16
    8000560c:	e42a                	sd	a0,8(sp)
    8000560e:	67a2                	ld	a5,8(sp)
    80005610:	0007a023          	sw	zero,0(a5)
    80005614:	67a1                	lui	a5,0x8
    80005616:	85278793          	add	a5,a5,-1966 # 7852 <CPU_MSTATUS_MIE+0x784a>
    8000561a:	853e                	mv	a0,a5
    8000561c:	0141                	add	sp,sp,16
    8000561e:	8082                	ret

0000000080005620 <OS_IdleTask>:
    80005620:	7179                	add	sp,sp,-48
    80005622:	f406                	sd	ra,40(sp)
    80005624:	e42a                	sd	a0,8(sp)
    80005626:	ec02                	sd	zero,24(sp)
    80005628:	ce7fb0ef          	jal	8000130e <CPU_SR_Save>
    8000562c:	ec2a                	sd	a0,24(sp)
    8000562e:	00006797          	auipc	a5,0x6
    80005632:	2da78793          	add	a5,a5,730 # 8000b908 <OSIdleTaskCtr>
    80005636:	439c                	lw	a5,0(a5)
    80005638:	2785                	addw	a5,a5,1
    8000563a:	0007871b          	sext.w	a4,a5
    8000563e:	00006797          	auipc	a5,0x6
    80005642:	2ca78793          	add	a5,a5,714 # 8000b908 <OSIdleTaskCtr>
    80005646:	c398                	sw	a4,0(a5)
    80005648:	00006797          	auipc	a5,0x6
    8000564c:	33078793          	add	a5,a5,816 # 8000b978 <OSStatTaskCtr>
    80005650:	439c                	lw	a5,0(a5)
    80005652:	2785                	addw	a5,a5,1
    80005654:	0007871b          	sext.w	a4,a5
    80005658:	00006797          	auipc	a5,0x6
    8000565c:	32078793          	add	a5,a5,800 # 8000b978 <OSStatTaskCtr>
    80005660:	c398                	sw	a4,0(a5)
    80005662:	6562                	ld	a0,24(sp)
    80005664:	cb7fb0ef          	jal	8000131a <CPU_SR_Restore>
    80005668:	a80fc0ef          	jal	800018e8 <OSIdleTaskHook>
    8000566c:	0001                	nop
    8000566e:	bf6d                	j	80005628 <OS_IdleTask+0x8>

0000000080005670 <OS_IdleTaskInit>:
    80005670:	715d                	add	sp,sp,-80
    80005672:	e486                	sd	ra,72(sp)
    80005674:	fc2a                	sd	a0,56(sp)
    80005676:	00006797          	auipc	a5,0x6
    8000567a:	29278793          	add	a5,a5,658 # 8000b908 <OSIdleTaskCtr>
    8000567e:	0007a023          	sw	zero,0(a5)
    80005682:	00006797          	auipc	a5,0x6
    80005686:	98678793          	add	a5,a5,-1658 # 8000b008 <OSCfg_IdleTaskStkBasePtr>
    8000568a:	6398                	ld	a4,0(a5)
    8000568c:	00006797          	auipc	a5,0x6
    80005690:	98478793          	add	a5,a5,-1660 # 8000b010 <OSCfg_IdleTaskStkLimit>
    80005694:	6394                	ld	a3,0(a5)
    80005696:	00006797          	auipc	a5,0x6
    8000569a:	98278793          	add	a5,a5,-1662 # 8000b018 <OSCfg_IdleTaskStkSize>
    8000569e:	6390                	ld	a2,0(a5)
    800056a0:	77e2                	ld	a5,56(sp)
    800056a2:	f03e                	sd	a5,32(sp)
    800056a4:	47ad                	li	a5,11
    800056a6:	ec3e                	sd	a5,24(sp)
    800056a8:	e802                	sd	zero,16(sp)
    800056aa:	e402                	sd	zero,8(sp)
    800056ac:	e002                	sd	zero,0(sp)
    800056ae:	88b2                	mv	a7,a2
    800056b0:	8836                	mv	a6,a3
    800056b2:	87ba                	mv	a5,a4
    800056b4:	03f00713          	li	a4,63
    800056b8:	4681                	li	a3,0
    800056ba:	00000617          	auipc	a2,0x0
    800056be:	f6660613          	add	a2,a2,-154 # 80005620 <OS_IdleTask>
    800056c2:	00006597          	auipc	a1,0x6
    800056c6:	db658593          	add	a1,a1,-586 # 8000b478 <CPU_CntLeadZerosTbl+0x1b8>
    800056ca:	00017517          	auipc	a0,0x17
    800056ce:	64650513          	add	a0,a0,1606 # 8001cd10 <OSIdleTaskTCB>
    800056d2:	e93fd0ef          	jal	80003564 <OSTaskCreate>
    800056d6:	0001                	nop
    800056d8:	60a6                	ld	ra,72(sp)
    800056da:	6161                	add	sp,sp,80
    800056dc:	8082                	ret

00000000800056de <OS_Pend>:
    800056de:	7139                	add	sp,sp,-64
    800056e0:	fc06                	sd	ra,56(sp)
    800056e2:	ec2a                	sd	a0,24(sp)
    800056e4:	e82e                	sd	a1,16(sp)
    800056e6:	87b2                	mv	a5,a2
    800056e8:	8736                	mv	a4,a3
    800056ea:	00f107a3          	sb	a5,15(sp)
    800056ee:	87ba                	mv	a5,a4
    800056f0:	c43e                	sw	a5,8(sp)
    800056f2:	67c2                	ld	a5,16(sp)
    800056f4:	00f14703          	lbu	a4,15(sp)
    800056f8:	06e78823          	sb	a4,112(a5)
    800056fc:	67c2                	ld	a5,16(sp)
    800056fe:	060788a3          	sb	zero,113(a5)
    80005702:	47a2                	lw	a5,8(sp)
    80005704:	85be                	mv	a1,a5
    80005706:	6542                	ld	a0,16(sp)
    80005708:	03f000ef          	jal	80005f46 <OS_TaskBlock>
    8000570c:	67e2                	ld	a5,24(sp)
    8000570e:	cf81                	beqz	a5,80005726 <OS_Pend+0x48>
    80005710:	67e2                	ld	a5,24(sp)
    80005712:	07c1                	add	a5,a5,16
    80005714:	f43e                	sd	a5,40(sp)
    80005716:	67c2                	ld	a5,16(sp)
    80005718:	6762                	ld	a4,24(sp)
    8000571a:	f7b8                	sd	a4,104(a5)
    8000571c:	65c2                	ld	a1,16(sp)
    8000571e:	7522                	ld	a0,40(sp)
    80005720:	1f6000ef          	jal	80005916 <OS_PendListInsertPrio>
    80005724:	a021                	j	8000572c <OS_Pend+0x4e>
    80005726:	67c2                	ld	a5,16(sp)
    80005728:	0607b423          	sd	zero,104(a5)
    8000572c:	65c2                	ld	a1,16(sp)
    8000572e:	6562                	ld	a0,24(sp)
    80005730:	0d6000ef          	jal	80005806 <OS_PendDbgNameAdd>
    80005734:	0001                	nop
    80005736:	70e2                	ld	ra,56(sp)
    80005738:	6121                	add	sp,sp,64
    8000573a:	8082                	ret

000000008000573c <OS_PendAbort>:
    8000573c:	1101                	add	sp,sp,-32
    8000573e:	ec06                	sd	ra,24(sp)
    80005740:	e42a                	sd	a0,8(sp)
    80005742:	87ae                	mv	a5,a1
    80005744:	8732                	mv	a4,a2
    80005746:	c23e                	sw	a5,4(sp)
    80005748:	87ba                	mv	a5,a4
    8000574a:	00f101a3          	sb	a5,3(sp)
    8000574e:	67a2                	ld	a5,8(sp)
    80005750:	0727c783          	lbu	a5,114(a5)
    80005754:	2781                	sext.w	a5,a5
    80005756:	86be                	mv	a3,a5
    80005758:	470d                	li	a4,3
    8000575a:	00d74763          	blt	a4,a3,80005768 <OS_PendAbort+0x2c>
    8000575e:	873e                	mv	a4,a5
    80005760:	4789                	li	a5,2
    80005762:	00f75b63          	bge	a4,a5,80005778 <OS_PendAbort+0x3c>
    80005766:	a859                	j	800057fc <OS_PendAbort+0xc0>
    80005768:	2781                	sext.w	a5,a5
    8000576a:	37e9                	addw	a5,a5,-6
    8000576c:	2781                	sext.w	a5,a5
    8000576e:	873e                	mv	a4,a5
    80005770:	4785                	li	a5,1
    80005772:	08e7e563          	bltu	a5,a4,800057fc <OS_PendAbort+0xc0>
    80005776:	a099                	j	800057bc <OS_PendAbort+0x80>
    80005778:	67a2                	ld	a5,8(sp)
    8000577a:	0a07b023          	sd	zero,160(a5)
    8000577e:	67a2                	ld	a5,8(sp)
    80005780:	0a079423          	sh	zero,168(a5)
    80005784:	6522                	ld	a0,8(sp)
    80005786:	268000ef          	jal	800059ee <OS_PendListRemove>
    8000578a:	67a2                	ld	a5,8(sp)
    8000578c:	0727c783          	lbu	a5,114(a5)
    80005790:	873e                	mv	a4,a5
    80005792:	478d                	li	a5,3
    80005794:	00f71563          	bne	a4,a5,8000579e <OS_PendAbort+0x62>
    80005798:	6522                	ld	a0,8(sp)
    8000579a:	62c010ef          	jal	80006dc6 <OS_TickListRemove>
    8000579e:	6522                	ld	a0,8(sp)
    800057a0:	43c000ef          	jal	80005bdc <OS_RdyListInsert>
    800057a4:	67a2                	ld	a5,8(sp)
    800057a6:	06078923          	sb	zero,114(a5)
    800057aa:	67a2                	ld	a5,8(sp)
    800057ac:	00314703          	lbu	a4,3(sp)
    800057b0:	06e788a3          	sb	a4,113(a5)
    800057b4:	67a2                	ld	a5,8(sp)
    800057b6:	06078823          	sb	zero,112(a5)
    800057ba:	a091                	j	800057fe <OS_PendAbort+0xc2>
    800057bc:	67a2                	ld	a5,8(sp)
    800057be:	0a07b023          	sd	zero,160(a5)
    800057c2:	67a2                	ld	a5,8(sp)
    800057c4:	0a079423          	sh	zero,168(a5)
    800057c8:	6522                	ld	a0,8(sp)
    800057ca:	224000ef          	jal	800059ee <OS_PendListRemove>
    800057ce:	67a2                	ld	a5,8(sp)
    800057d0:	0727c783          	lbu	a5,114(a5)
    800057d4:	873e                	mv	a4,a5
    800057d6:	479d                	li	a5,7
    800057d8:	00f71563          	bne	a4,a5,800057e2 <OS_PendAbort+0xa6>
    800057dc:	6522                	ld	a0,8(sp)
    800057de:	5e8010ef          	jal	80006dc6 <OS_TickListRemove>
    800057e2:	67a2                	ld	a5,8(sp)
    800057e4:	4711                	li	a4,4
    800057e6:	06e78923          	sb	a4,114(a5)
    800057ea:	67a2                	ld	a5,8(sp)
    800057ec:	00314703          	lbu	a4,3(sp)
    800057f0:	06e788a3          	sb	a4,113(a5)
    800057f4:	67a2                	ld	a5,8(sp)
    800057f6:	06078823          	sb	zero,112(a5)
    800057fa:	a011                	j	800057fe <OS_PendAbort+0xc2>
    800057fc:	0001                	nop
    800057fe:	0001                	nop
    80005800:	60e2                	ld	ra,24(sp)
    80005802:	6105                	add	sp,sp,32
    80005804:	8082                	ret

0000000080005806 <OS_PendDbgNameAdd>:
    80005806:	1101                	add	sp,sp,-32
    80005808:	e42a                	sd	a0,8(sp)
    8000580a:	e02e                	sd	a1,0(sp)
    8000580c:	67a2                	ld	a5,8(sp)
    8000580e:	c38d                	beqz	a5,80005830 <OS_PendDbgNameAdd+0x2a>
    80005810:	67a2                	ld	a5,8(sp)
    80005812:	6798                	ld	a4,8(a5)
    80005814:	6782                	ld	a5,0(sp)
    80005816:	12e7b423          	sd	a4,296(a5)
    8000581a:	67a2                	ld	a5,8(sp)
    8000581c:	07c1                	add	a5,a5,16
    8000581e:	ec3e                	sd	a5,24(sp)
    80005820:	67e2                	ld	a5,24(sp)
    80005822:	639c                	ld	a5,0(a5)
    80005824:	e83e                	sd	a5,16(sp)
    80005826:	67c2                	ld	a5,16(sp)
    80005828:	6f98                	ld	a4,24(a5)
    8000582a:	67a2                	ld	a5,8(sp)
    8000582c:	ff98                	sd	a4,56(a5)
    8000582e:	a0b1                	j	8000587a <OS_PendDbgNameAdd+0x74>
    80005830:	6782                	ld	a5,0(sp)
    80005832:	0707c783          	lbu	a5,112(a5)
    80005836:	0007871b          	sext.w	a4,a5
    8000583a:	86ba                	mv	a3,a4
    8000583c:	4789                	li	a5,2
    8000583e:	00f68663          	beq	a3,a5,8000584a <OS_PendDbgNameAdd+0x44>
    80005842:	479d                	li	a5,7
    80005844:	00f70b63          	beq	a4,a5,8000585a <OS_PendDbgNameAdd+0x54>
    80005848:	a00d                	j	8000586a <OS_PendDbgNameAdd+0x64>
    8000584a:	6782                	ld	a5,0(sp)
    8000584c:	00006717          	auipc	a4,0x6
    80005850:	c4470713          	add	a4,a4,-956 # 8000b490 <CPU_CntLeadZerosTbl+0x1d0>
    80005854:	12e7b423          	sd	a4,296(a5)
    80005858:	a00d                	j	8000587a <OS_PendDbgNameAdd+0x74>
    8000585a:	6782                	ld	a5,0(sp)
    8000585c:	00006717          	auipc	a4,0x6
    80005860:	c3c70713          	add	a4,a4,-964 # 8000b498 <CPU_CntLeadZerosTbl+0x1d8>
    80005864:	12e7b423          	sd	a4,296(a5)
    80005868:	a809                	j	8000587a <OS_PendDbgNameAdd+0x74>
    8000586a:	6782                	ld	a5,0(sp)
    8000586c:	00006717          	auipc	a4,0x6
    80005870:	c3c70713          	add	a4,a4,-964 # 8000b4a8 <CPU_CntLeadZerosTbl+0x1e8>
    80005874:	12e7b423          	sd	a4,296(a5)
    80005878:	0001                	nop
    8000587a:	0001                	nop
    8000587c:	6105                	add	sp,sp,32
    8000587e:	8082                	ret

0000000080005880 <OS_PendDbgNameRemove>:
    80005880:	1101                	add	sp,sp,-32
    80005882:	e42a                	sd	a0,8(sp)
    80005884:	e02e                	sd	a1,0(sp)
    80005886:	6782                	ld	a5,0(sp)
    80005888:	00006717          	auipc	a4,0x6
    8000588c:	c2070713          	add	a4,a4,-992 # 8000b4a8 <CPU_CntLeadZerosTbl+0x1e8>
    80005890:	12e7b423          	sd	a4,296(a5)
    80005894:	67a2                	ld	a5,8(sp)
    80005896:	c785                	beqz	a5,800058be <OS_PendDbgNameRemove+0x3e>
    80005898:	67a2                	ld	a5,8(sp)
    8000589a:	07c1                	add	a5,a5,16
    8000589c:	ec3e                	sd	a5,24(sp)
    8000589e:	67e2                	ld	a5,24(sp)
    800058a0:	639c                	ld	a5,0(a5)
    800058a2:	e83e                	sd	a5,16(sp)
    800058a4:	67c2                	ld	a5,16(sp)
    800058a6:	c791                	beqz	a5,800058b2 <OS_PendDbgNameRemove+0x32>
    800058a8:	67c2                	ld	a5,16(sp)
    800058aa:	6f98                	ld	a4,24(a5)
    800058ac:	67a2                	ld	a5,8(sp)
    800058ae:	ff98                	sd	a4,56(a5)
    800058b0:	a039                	j	800058be <OS_PendDbgNameRemove+0x3e>
    800058b2:	67a2                	ld	a5,8(sp)
    800058b4:	00006717          	auipc	a4,0x6
    800058b8:	bf470713          	add	a4,a4,-1036 # 8000b4a8 <CPU_CntLeadZerosTbl+0x1e8>
    800058bc:	ff98                	sd	a4,56(a5)
    800058be:	0001                	nop
    800058c0:	6105                	add	sp,sp,32
    800058c2:	8082                	ret

00000000800058c4 <OS_PendListChangePrio>:
    800058c4:	7179                	add	sp,sp,-48
    800058c6:	f406                	sd	ra,40(sp)
    800058c8:	e42a                	sd	a0,8(sp)
    800058ca:	67a2                	ld	a5,8(sp)
    800058cc:	77bc                	ld	a5,104(a5)
    800058ce:	ec3e                	sd	a5,24(sp)
    800058d0:	67e2                	ld	a5,24(sp)
    800058d2:	07c1                	add	a5,a5,16
    800058d4:	e83e                	sd	a5,16(sp)
    800058d6:	67c2                	ld	a5,16(sp)
    800058d8:	639c                	ld	a5,0(a5)
    800058da:	6fbc                	ld	a5,88(a5)
    800058dc:	cb99                	beqz	a5,800058f2 <OS_PendListChangePrio+0x2e>
    800058de:	6522                	ld	a0,8(sp)
    800058e0:	10e000ef          	jal	800059ee <OS_PendListRemove>
    800058e4:	67a2                	ld	a5,8(sp)
    800058e6:	6762                	ld	a4,24(sp)
    800058e8:	f7b8                	sd	a4,104(a5)
    800058ea:	65a2                	ld	a1,8(sp)
    800058ec:	6542                	ld	a0,16(sp)
    800058ee:	028000ef          	jal	80005916 <OS_PendListInsertPrio>
    800058f2:	0001                	nop
    800058f4:	70a2                	ld	ra,40(sp)
    800058f6:	6145                	add	sp,sp,48
    800058f8:	8082                	ret

00000000800058fa <OS_PendListInit>:
    800058fa:	1141                	add	sp,sp,-16
    800058fc:	e42a                	sd	a0,8(sp)
    800058fe:	67a2                	ld	a5,8(sp)
    80005900:	0007b023          	sd	zero,0(a5)
    80005904:	67a2                	ld	a5,8(sp)
    80005906:	0007b423          	sd	zero,8(a5)
    8000590a:	67a2                	ld	a5,8(sp)
    8000590c:	00079823          	sh	zero,16(a5)
    80005910:	0001                	nop
    80005912:	0141                	add	sp,sp,16
    80005914:	8082                	ret

0000000080005916 <OS_PendListInsertPrio>:
    80005916:	1101                	add	sp,sp,-32
    80005918:	e42a                	sd	a0,8(sp)
    8000591a:	e02e                	sd	a1,0(sp)
    8000591c:	6782                	ld	a5,0(sp)
    8000591e:	0737c783          	lbu	a5,115(a5)
    80005922:	00f10ba3          	sb	a5,23(sp)
    80005926:	67a2                	ld	a5,8(sp)
    80005928:	639c                	ld	a5,0(a5)
    8000592a:	e395                	bnez	a5,8000594e <OS_PendListInsertPrio+0x38>
    8000592c:	67a2                	ld	a5,8(sp)
    8000592e:	4705                	li	a4,1
    80005930:	00e79823          	sh	a4,16(a5)
    80005934:	6782                	ld	a5,0(sp)
    80005936:	0407bc23          	sd	zero,88(a5)
    8000593a:	6782                	ld	a5,0(sp)
    8000593c:	0607b023          	sd	zero,96(a5)
    80005940:	67a2                	ld	a5,8(sp)
    80005942:	6702                	ld	a4,0(sp)
    80005944:	e398                	sd	a4,0(a5)
    80005946:	67a2                	ld	a5,8(sp)
    80005948:	6702                	ld	a4,0(sp)
    8000594a:	e798                	sd	a4,8(a5)
    8000594c:	a871                	j	800059e8 <OS_PendListInsertPrio+0xd2>
    8000594e:	67a2                	ld	a5,8(sp)
    80005950:	0107d783          	lhu	a5,16(a5)
    80005954:	2785                	addw	a5,a5,1
    80005956:	03079713          	sll	a4,a5,0x30
    8000595a:	9341                	srl	a4,a4,0x30
    8000595c:	67a2                	ld	a5,8(sp)
    8000595e:	00e79823          	sh	a4,16(a5)
    80005962:	67a2                	ld	a5,8(sp)
    80005964:	639c                	ld	a5,0(a5)
    80005966:	ec3e                	sd	a5,24(sp)
    80005968:	a829                	j	80005982 <OS_PendListInsertPrio+0x6c>
    8000596a:	67e2                	ld	a5,24(sp)
    8000596c:	0737c703          	lbu	a4,115(a5)
    80005970:	01714783          	lbu	a5,23(sp)
    80005974:	0ff7f793          	zext.b	a5,a5
    80005978:	00e7e863          	bltu	a5,a4,80005988 <OS_PendListInsertPrio+0x72>
    8000597c:	67e2                	ld	a5,24(sp)
    8000597e:	6fbc                	ld	a5,88(a5)
    80005980:	ec3e                	sd	a5,24(sp)
    80005982:	67e2                	ld	a5,24(sp)
    80005984:	f3fd                	bnez	a5,8000596a <OS_PendListInsertPrio+0x54>
    80005986:	a011                	j	8000598a <OS_PendListInsertPrio+0x74>
    80005988:	0001                	nop
    8000598a:	67e2                	ld	a5,24(sp)
    8000598c:	e385                	bnez	a5,800059ac <OS_PendListInsertPrio+0x96>
    8000598e:	6782                	ld	a5,0(sp)
    80005990:	0407bc23          	sd	zero,88(a5)
    80005994:	67a2                	ld	a5,8(sp)
    80005996:	6798                	ld	a4,8(a5)
    80005998:	6782                	ld	a5,0(sp)
    8000599a:	f3b8                	sd	a4,96(a5)
    8000599c:	6782                	ld	a5,0(sp)
    8000599e:	73bc                	ld	a5,96(a5)
    800059a0:	6702                	ld	a4,0(sp)
    800059a2:	efb8                	sd	a4,88(a5)
    800059a4:	67a2                	ld	a5,8(sp)
    800059a6:	6702                	ld	a4,0(sp)
    800059a8:	e798                	sd	a4,8(a5)
    800059aa:	a83d                	j	800059e8 <OS_PendListInsertPrio+0xd2>
    800059ac:	67e2                	ld	a5,24(sp)
    800059ae:	73bc                	ld	a5,96(a5)
    800059b0:	ef91                	bnez	a5,800059cc <OS_PendListInsertPrio+0xb6>
    800059b2:	6782                	ld	a5,0(sp)
    800059b4:	6762                	ld	a4,24(sp)
    800059b6:	efb8                	sd	a4,88(a5)
    800059b8:	6782                	ld	a5,0(sp)
    800059ba:	0607b023          	sd	zero,96(a5)
    800059be:	67e2                	ld	a5,24(sp)
    800059c0:	6702                	ld	a4,0(sp)
    800059c2:	f3b8                	sd	a4,96(a5)
    800059c4:	67a2                	ld	a5,8(sp)
    800059c6:	6702                	ld	a4,0(sp)
    800059c8:	e398                	sd	a4,0(a5)
    800059ca:	a839                	j	800059e8 <OS_PendListInsertPrio+0xd2>
    800059cc:	6782                	ld	a5,0(sp)
    800059ce:	6762                	ld	a4,24(sp)
    800059d0:	efb8                	sd	a4,88(a5)
    800059d2:	67e2                	ld	a5,24(sp)
    800059d4:	73b8                	ld	a4,96(a5)
    800059d6:	6782                	ld	a5,0(sp)
    800059d8:	f3b8                	sd	a4,96(a5)
    800059da:	6782                	ld	a5,0(sp)
    800059dc:	73bc                	ld	a5,96(a5)
    800059de:	6702                	ld	a4,0(sp)
    800059e0:	efb8                	sd	a4,88(a5)
    800059e2:	67e2                	ld	a5,24(sp)
    800059e4:	6702                	ld	a4,0(sp)
    800059e6:	f3b8                	sd	a4,96(a5)
    800059e8:	0001                	nop
    800059ea:	6105                	add	sp,sp,32
    800059ec:	8082                	ret

00000000800059ee <OS_PendListRemove>:
    800059ee:	7179                	add	sp,sp,-48
    800059f0:	e42a                	sd	a0,8(sp)
    800059f2:	67a2                	ld	a5,8(sp)
    800059f4:	77bc                	ld	a5,104(a5)
    800059f6:	cbc9                	beqz	a5,80005a88 <OS_PendListRemove+0x9a>
    800059f8:	67a2                	ld	a5,8(sp)
    800059fa:	77bc                	ld	a5,104(a5)
    800059fc:	07c1                	add	a5,a5,16
    800059fe:	f43e                	sd	a5,40(sp)
    80005a00:	77a2                	ld	a5,40(sp)
    80005a02:	639c                	ld	a5,0(a5)
    80005a04:	6fbc                	ld	a5,88(a5)
    80005a06:	eb81                	bnez	a5,80005a16 <OS_PendListRemove+0x28>
    80005a08:	77a2                	ld	a5,40(sp)
    80005a0a:	0007b023          	sd	zero,0(a5)
    80005a0e:	77a2                	ld	a5,40(sp)
    80005a10:	0007b423          	sd	zero,8(a5)
    80005a14:	a0b9                	j	80005a62 <OS_PendListRemove+0x74>
    80005a16:	67a2                	ld	a5,8(sp)
    80005a18:	73bc                	ld	a5,96(a5)
    80005a1a:	eb99                	bnez	a5,80005a30 <OS_PendListRemove+0x42>
    80005a1c:	67a2                	ld	a5,8(sp)
    80005a1e:	6fbc                	ld	a5,88(a5)
    80005a20:	ec3e                	sd	a5,24(sp)
    80005a22:	67e2                	ld	a5,24(sp)
    80005a24:	0607b023          	sd	zero,96(a5)
    80005a28:	77a2                	ld	a5,40(sp)
    80005a2a:	6762                	ld	a4,24(sp)
    80005a2c:	e398                	sd	a4,0(a5)
    80005a2e:	a815                	j	80005a62 <OS_PendListRemove+0x74>
    80005a30:	67a2                	ld	a5,8(sp)
    80005a32:	6fbc                	ld	a5,88(a5)
    80005a34:	eb99                	bnez	a5,80005a4a <OS_PendListRemove+0x5c>
    80005a36:	67a2                	ld	a5,8(sp)
    80005a38:	73bc                	ld	a5,96(a5)
    80005a3a:	f03e                	sd	a5,32(sp)
    80005a3c:	7782                	ld	a5,32(sp)
    80005a3e:	0407bc23          	sd	zero,88(a5)
    80005a42:	77a2                	ld	a5,40(sp)
    80005a44:	7702                	ld	a4,32(sp)
    80005a46:	e798                	sd	a4,8(a5)
    80005a48:	a829                	j	80005a62 <OS_PendListRemove+0x74>
    80005a4a:	67a2                	ld	a5,8(sp)
    80005a4c:	73bc                	ld	a5,96(a5)
    80005a4e:	f03e                	sd	a5,32(sp)
    80005a50:	67a2                	ld	a5,8(sp)
    80005a52:	6fbc                	ld	a5,88(a5)
    80005a54:	ec3e                	sd	a5,24(sp)
    80005a56:	7782                	ld	a5,32(sp)
    80005a58:	6762                	ld	a4,24(sp)
    80005a5a:	efb8                	sd	a4,88(a5)
    80005a5c:	67e2                	ld	a5,24(sp)
    80005a5e:	7702                	ld	a4,32(sp)
    80005a60:	f3b8                	sd	a4,96(a5)
    80005a62:	77a2                	ld	a5,40(sp)
    80005a64:	0107d783          	lhu	a5,16(a5)
    80005a68:	37fd                	addw	a5,a5,-1
    80005a6a:	03079713          	sll	a4,a5,0x30
    80005a6e:	9341                	srl	a4,a4,0x30
    80005a70:	77a2                	ld	a5,40(sp)
    80005a72:	00e79823          	sh	a4,16(a5)
    80005a76:	67a2                	ld	a5,8(sp)
    80005a78:	0407bc23          	sd	zero,88(a5)
    80005a7c:	67a2                	ld	a5,8(sp)
    80005a7e:	0607b023          	sd	zero,96(a5)
    80005a82:	67a2                	ld	a5,8(sp)
    80005a84:	0607b423          	sd	zero,104(a5)
    80005a88:	0001                	nop
    80005a8a:	6145                	add	sp,sp,48
    80005a8c:	8082                	ret

0000000080005a8e <OS_Post>:
    80005a8e:	7179                	add	sp,sp,-48
    80005a90:	f406                	sd	ra,40(sp)
    80005a92:	ec2a                	sd	a0,24(sp)
    80005a94:	e82e                	sd	a1,16(sp)
    80005a96:	e432                	sd	a2,8(sp)
    80005a98:	87b6                	mv	a5,a3
    80005a9a:	00f11323          	sh	a5,6(sp)
    80005a9e:	87ba                	mv	a5,a4
    80005aa0:	c03e                	sw	a5,0(sp)
    80005aa2:	67c2                	ld	a5,16(sp)
    80005aa4:	0727c783          	lbu	a5,114(a5)
    80005aa8:	2781                	sext.w	a5,a5
    80005aaa:	86be                	mv	a3,a5
    80005aac:	471d                	li	a4,7
    80005aae:	0cd74a63          	blt	a4,a3,80005b82 <OS_Post+0xf4>
    80005ab2:	86be                	mv	a3,a5
    80005ab4:	4719                	li	a4,6
    80005ab6:	08e6d063          	bge	a3,a4,80005b36 <OS_Post+0xa8>
    80005aba:	86be                	mv	a3,a5
    80005abc:	4715                	li	a4,5
    80005abe:	0cd74263          	blt	a4,a3,80005b82 <OS_Post+0xf4>
    80005ac2:	86be                	mv	a3,a5
    80005ac4:	4711                	li	a4,4
    80005ac6:	0ce6d063          	bge	a3,a4,80005b86 <OS_Post+0xf8>
    80005aca:	86be                	mv	a3,a5
    80005acc:	4705                	li	a4,1
    80005ace:	00d74563          	blt	a4,a3,80005ad8 <OS_Post+0x4a>
    80005ad2:	0a07da63          	bgez	a5,80005b86 <OS_Post+0xf8>
    80005ad6:	a075                	j	80005b82 <OS_Post+0xf4>
    80005ad8:	2781                	sext.w	a5,a5
    80005ada:	37f9                	addw	a5,a5,-2
    80005adc:	2781                	sext.w	a5,a5
    80005ade:	873e                	mv	a4,a5
    80005ae0:	4785                	li	a5,1
    80005ae2:	0ae7e063          	bltu	a5,a4,80005b82 <OS_Post+0xf4>
    80005ae6:	67c2                	ld	a5,16(sp)
    80005ae8:	6722                	ld	a4,8(sp)
    80005aea:	f3d8                	sd	a4,160(a5)
    80005aec:	67c2                	ld	a5,16(sp)
    80005aee:	00615703          	lhu	a4,6(sp)
    80005af2:	0ae79423          	sh	a4,168(a5)
    80005af6:	67e2                	ld	a5,24(sp)
    80005af8:	c781                	beqz	a5,80005b00 <OS_Post+0x72>
    80005afa:	6542                	ld	a0,16(sp)
    80005afc:	ef3ff0ef          	jal	800059ee <OS_PendListRemove>
    80005b00:	65c2                	ld	a1,16(sp)
    80005b02:	6562                	ld	a0,24(sp)
    80005b04:	d7dff0ef          	jal	80005880 <OS_PendDbgNameRemove>
    80005b08:	67c2                	ld	a5,16(sp)
    80005b0a:	0727c783          	lbu	a5,114(a5)
    80005b0e:	873e                	mv	a4,a5
    80005b10:	478d                	li	a5,3
    80005b12:	00f71563          	bne	a4,a5,80005b1c <OS_Post+0x8e>
    80005b16:	6542                	ld	a0,16(sp)
    80005b18:	2ae010ef          	jal	80006dc6 <OS_TickListRemove>
    80005b1c:	6542                	ld	a0,16(sp)
    80005b1e:	0be000ef          	jal	80005bdc <OS_RdyListInsert>
    80005b22:	67c2                	ld	a5,16(sp)
    80005b24:	06078923          	sb	zero,114(a5)
    80005b28:	67c2                	ld	a5,16(sp)
    80005b2a:	060788a3          	sb	zero,113(a5)
    80005b2e:	67c2                	ld	a5,16(sp)
    80005b30:	06078823          	sb	zero,112(a5)
    80005b34:	a891                	j	80005b88 <OS_Post+0xfa>
    80005b36:	67c2                	ld	a5,16(sp)
    80005b38:	6722                	ld	a4,8(sp)
    80005b3a:	f3d8                	sd	a4,160(a5)
    80005b3c:	67c2                	ld	a5,16(sp)
    80005b3e:	00615703          	lhu	a4,6(sp)
    80005b42:	0ae79423          	sh	a4,168(a5)
    80005b46:	67e2                	ld	a5,24(sp)
    80005b48:	c781                	beqz	a5,80005b50 <OS_Post+0xc2>
    80005b4a:	6542                	ld	a0,16(sp)
    80005b4c:	ea3ff0ef          	jal	800059ee <OS_PendListRemove>
    80005b50:	65c2                	ld	a1,16(sp)
    80005b52:	6562                	ld	a0,24(sp)
    80005b54:	d2dff0ef          	jal	80005880 <OS_PendDbgNameRemove>
    80005b58:	67c2                	ld	a5,16(sp)
    80005b5a:	0727c783          	lbu	a5,114(a5)
    80005b5e:	873e                	mv	a4,a5
    80005b60:	479d                	li	a5,7
    80005b62:	00f71563          	bne	a4,a5,80005b6c <OS_Post+0xde>
    80005b66:	6542                	ld	a0,16(sp)
    80005b68:	25e010ef          	jal	80006dc6 <OS_TickListRemove>
    80005b6c:	67c2                	ld	a5,16(sp)
    80005b6e:	4711                	li	a4,4
    80005b70:	06e78923          	sb	a4,114(a5)
    80005b74:	67c2                	ld	a5,16(sp)
    80005b76:	060788a3          	sb	zero,113(a5)
    80005b7a:	67c2                	ld	a5,16(sp)
    80005b7c:	06078823          	sb	zero,112(a5)
    80005b80:	a021                	j	80005b88 <OS_Post+0xfa>
    80005b82:	0001                	nop
    80005b84:	a011                	j	80005b88 <OS_Post+0xfa>
    80005b86:	0001                	nop
    80005b88:	0001                	nop
    80005b8a:	70a2                	ld	ra,40(sp)
    80005b8c:	6145                	add	sp,sp,48
    80005b8e:	8082                	ret

0000000080005b90 <OS_RdyListInit>:
    80005b90:	1141                	add	sp,sp,-16
    80005b92:	c602                	sw	zero,12(sp)
    80005b94:	a80d                	j	80005bc6 <OS_RdyListInit+0x36>
    80005b96:	00c16703          	lwu	a4,12(sp)
    80005b9a:	87ba                	mv	a5,a4
    80005b9c:	0786                	sll	a5,a5,0x1
    80005b9e:	97ba                	add	a5,a5,a4
    80005ba0:	078e                	sll	a5,a5,0x3
    80005ba2:	00017717          	auipc	a4,0x17
    80005ba6:	2ae70713          	add	a4,a4,686 # 8001ce50 <OSRdyList>
    80005baa:	97ba                	add	a5,a5,a4
    80005bac:	e03e                	sd	a5,0(sp)
    80005bae:	6782                	ld	a5,0(sp)
    80005bb0:	00079823          	sh	zero,16(a5)
    80005bb4:	6782                	ld	a5,0(sp)
    80005bb6:	0007b023          	sd	zero,0(a5)
    80005bba:	6782                	ld	a5,0(sp)
    80005bbc:	0007b423          	sd	zero,8(a5)
    80005bc0:	47b2                	lw	a5,12(sp)
    80005bc2:	2785                	addw	a5,a5,1
    80005bc4:	c63e                	sw	a5,12(sp)
    80005bc6:	47b2                	lw	a5,12(sp)
    80005bc8:	0007871b          	sext.w	a4,a5
    80005bcc:	03f00793          	li	a5,63
    80005bd0:	fce7f3e3          	bgeu	a5,a4,80005b96 <OS_RdyListInit+0x6>
    80005bd4:	0001                	nop
    80005bd6:	0001                	nop
    80005bd8:	0141                	add	sp,sp,16
    80005bda:	8082                	ret

0000000080005bdc <OS_RdyListInsert>:
    80005bdc:	1101                	add	sp,sp,-32
    80005bde:	ec06                	sd	ra,24(sp)
    80005be0:	e42a                	sd	a0,8(sp)
    80005be2:	67a2                	ld	a5,8(sp)
    80005be4:	0737c783          	lbu	a5,115(a5)
    80005be8:	853e                	mv	a0,a5
    80005bea:	7ac010ef          	jal	80007396 <OS_PrioInsert>
    80005bee:	67a2                	ld	a5,8(sp)
    80005bf0:	0737c703          	lbu	a4,115(a5)
    80005bf4:	00006797          	auipc	a5,0x6
    80005bf8:	d4e78793          	add	a5,a5,-690 # 8000b942 <OSPrioCur>
    80005bfc:	0007c783          	lbu	a5,0(a5)
    80005c00:	00f71663          	bne	a4,a5,80005c0c <OS_RdyListInsert+0x30>
    80005c04:	6522                	ld	a0,8(sp)
    80005c06:	098000ef          	jal	80005c9e <OS_RdyListInsertTail>
    80005c0a:	a021                	j	80005c12 <OS_RdyListInsert+0x36>
    80005c0c:	6522                	ld	a0,8(sp)
    80005c0e:	00c000ef          	jal	80005c1a <OS_RdyListInsertHead>
    80005c12:	0001                	nop
    80005c14:	60e2                	ld	ra,24(sp)
    80005c16:	6105                	add	sp,sp,32
    80005c18:	8082                	ret

0000000080005c1a <OS_RdyListInsertHead>:
    80005c1a:	1101                	add	sp,sp,-32
    80005c1c:	e42a                	sd	a0,8(sp)
    80005c1e:	67a2                	ld	a5,8(sp)
    80005c20:	0737c783          	lbu	a5,115(a5)
    80005c24:	0007871b          	sext.w	a4,a5
    80005c28:	87ba                	mv	a5,a4
    80005c2a:	0786                	sll	a5,a5,0x1
    80005c2c:	97ba                	add	a5,a5,a4
    80005c2e:	078e                	sll	a5,a5,0x3
    80005c30:	00017717          	auipc	a4,0x17
    80005c34:	22070713          	add	a4,a4,544 # 8001ce50 <OSRdyList>
    80005c38:	97ba                	add	a5,a5,a4
    80005c3a:	ec3e                	sd	a5,24(sp)
    80005c3c:	67e2                	ld	a5,24(sp)
    80005c3e:	639c                	ld	a5,0(a5)
    80005c40:	e395                	bnez	a5,80005c64 <OS_RdyListInsertHead+0x4a>
    80005c42:	67e2                	ld	a5,24(sp)
    80005c44:	4705                	li	a4,1
    80005c46:	00e79823          	sh	a4,16(a5)
    80005c4a:	67a2                	ld	a5,8(sp)
    80005c4c:	0207b023          	sd	zero,32(a5)
    80005c50:	67a2                	ld	a5,8(sp)
    80005c52:	0207b423          	sd	zero,40(a5)
    80005c56:	67e2                	ld	a5,24(sp)
    80005c58:	6722                	ld	a4,8(sp)
    80005c5a:	e398                	sd	a4,0(a5)
    80005c5c:	67e2                	ld	a5,24(sp)
    80005c5e:	6722                	ld	a4,8(sp)
    80005c60:	e798                	sd	a4,8(a5)
    80005c62:	a81d                	j	80005c98 <OS_RdyListInsertHead+0x7e>
    80005c64:	67e2                	ld	a5,24(sp)
    80005c66:	0107d783          	lhu	a5,16(a5)
    80005c6a:	2785                	addw	a5,a5,1
    80005c6c:	03079713          	sll	a4,a5,0x30
    80005c70:	9341                	srl	a4,a4,0x30
    80005c72:	67e2                	ld	a5,24(sp)
    80005c74:	00e79823          	sh	a4,16(a5)
    80005c78:	67e2                	ld	a5,24(sp)
    80005c7a:	6398                	ld	a4,0(a5)
    80005c7c:	67a2                	ld	a5,8(sp)
    80005c7e:	f398                	sd	a4,32(a5)
    80005c80:	67a2                	ld	a5,8(sp)
    80005c82:	0207b423          	sd	zero,40(a5)
    80005c86:	67e2                	ld	a5,24(sp)
    80005c88:	639c                	ld	a5,0(a5)
    80005c8a:	e83e                	sd	a5,16(sp)
    80005c8c:	67c2                	ld	a5,16(sp)
    80005c8e:	6722                	ld	a4,8(sp)
    80005c90:	f798                	sd	a4,40(a5)
    80005c92:	67e2                	ld	a5,24(sp)
    80005c94:	6722                	ld	a4,8(sp)
    80005c96:	e398                	sd	a4,0(a5)
    80005c98:	0001                	nop
    80005c9a:	6105                	add	sp,sp,32
    80005c9c:	8082                	ret

0000000080005c9e <OS_RdyListInsertTail>:
    80005c9e:	1101                	add	sp,sp,-32
    80005ca0:	e42a                	sd	a0,8(sp)
    80005ca2:	67a2                	ld	a5,8(sp)
    80005ca4:	0737c783          	lbu	a5,115(a5)
    80005ca8:	0007871b          	sext.w	a4,a5
    80005cac:	87ba                	mv	a5,a4
    80005cae:	0786                	sll	a5,a5,0x1
    80005cb0:	97ba                	add	a5,a5,a4
    80005cb2:	078e                	sll	a5,a5,0x3
    80005cb4:	00017717          	auipc	a4,0x17
    80005cb8:	19c70713          	add	a4,a4,412 # 8001ce50 <OSRdyList>
    80005cbc:	97ba                	add	a5,a5,a4
    80005cbe:	ec3e                	sd	a5,24(sp)
    80005cc0:	67e2                	ld	a5,24(sp)
    80005cc2:	639c                	ld	a5,0(a5)
    80005cc4:	e395                	bnez	a5,80005ce8 <OS_RdyListInsertTail+0x4a>
    80005cc6:	67e2                	ld	a5,24(sp)
    80005cc8:	4705                	li	a4,1
    80005cca:	00e79823          	sh	a4,16(a5)
    80005cce:	67a2                	ld	a5,8(sp)
    80005cd0:	0207b023          	sd	zero,32(a5)
    80005cd4:	67a2                	ld	a5,8(sp)
    80005cd6:	0207b423          	sd	zero,40(a5)
    80005cda:	67e2                	ld	a5,24(sp)
    80005cdc:	6722                	ld	a4,8(sp)
    80005cde:	e398                	sd	a4,0(a5)
    80005ce0:	67e2                	ld	a5,24(sp)
    80005ce2:	6722                	ld	a4,8(sp)
    80005ce4:	e798                	sd	a4,8(a5)
    80005ce6:	a815                	j	80005d1a <OS_RdyListInsertTail+0x7c>
    80005ce8:	67e2                	ld	a5,24(sp)
    80005cea:	0107d783          	lhu	a5,16(a5)
    80005cee:	2785                	addw	a5,a5,1
    80005cf0:	03079713          	sll	a4,a5,0x30
    80005cf4:	9341                	srl	a4,a4,0x30
    80005cf6:	67e2                	ld	a5,24(sp)
    80005cf8:	00e79823          	sh	a4,16(a5)
    80005cfc:	67a2                	ld	a5,8(sp)
    80005cfe:	0207b023          	sd	zero,32(a5)
    80005d02:	67e2                	ld	a5,24(sp)
    80005d04:	679c                	ld	a5,8(a5)
    80005d06:	e83e                	sd	a5,16(sp)
    80005d08:	67a2                	ld	a5,8(sp)
    80005d0a:	6742                	ld	a4,16(sp)
    80005d0c:	f798                	sd	a4,40(a5)
    80005d0e:	67c2                	ld	a5,16(sp)
    80005d10:	6722                	ld	a4,8(sp)
    80005d12:	f398                	sd	a4,32(a5)
    80005d14:	67e2                	ld	a5,24(sp)
    80005d16:	6722                	ld	a4,8(sp)
    80005d18:	e798                	sd	a4,8(a5)
    80005d1a:	0001                	nop
    80005d1c:	6105                	add	sp,sp,32
    80005d1e:	8082                	ret

0000000080005d20 <OS_RdyListMoveHeadToTail>:
    80005d20:	7179                	add	sp,sp,-48
    80005d22:	e42a                	sd	a0,8(sp)
    80005d24:	67a2                	ld	a5,8(sp)
    80005d26:	6398                	ld	a4,0(a5)
    80005d28:	67a2                	ld	a5,8(sp)
    80005d2a:	679c                	ld	a5,8(a5)
    80005d2c:	06f70d63          	beq	a4,a5,80005da6 <OS_RdyListMoveHeadToTail+0x86>
    80005d30:	67a2                	ld	a5,8(sp)
    80005d32:	639c                	ld	a5,0(a5)
    80005d34:	7398                	ld	a4,32(a5)
    80005d36:	67a2                	ld	a5,8(sp)
    80005d38:	679c                	ld	a5,8(a5)
    80005d3a:	02f71b63          	bne	a4,a5,80005d70 <OS_RdyListMoveHeadToTail+0x50>
    80005d3e:	67a2                	ld	a5,8(sp)
    80005d40:	639c                	ld	a5,0(a5)
    80005d42:	f43e                	sd	a5,40(sp)
    80005d44:	67a2                	ld	a5,8(sp)
    80005d46:	679c                	ld	a5,8(a5)
    80005d48:	f03e                	sd	a5,32(sp)
    80005d4a:	77a2                	ld	a5,40(sp)
    80005d4c:	7702                	ld	a4,32(sp)
    80005d4e:	f798                	sd	a4,40(a5)
    80005d50:	77a2                	ld	a5,40(sp)
    80005d52:	0207b023          	sd	zero,32(a5)
    80005d56:	7782                	ld	a5,32(sp)
    80005d58:	0207b423          	sd	zero,40(a5)
    80005d5c:	7782                	ld	a5,32(sp)
    80005d5e:	7722                	ld	a4,40(sp)
    80005d60:	f398                	sd	a4,32(a5)
    80005d62:	67a2                	ld	a5,8(sp)
    80005d64:	7702                	ld	a4,32(sp)
    80005d66:	e398                	sd	a4,0(a5)
    80005d68:	67a2                	ld	a5,8(sp)
    80005d6a:	7722                	ld	a4,40(sp)
    80005d6c:	e798                	sd	a4,8(a5)
    80005d6e:	a825                	j	80005da6 <OS_RdyListMoveHeadToTail+0x86>
    80005d70:	67a2                	ld	a5,8(sp)
    80005d72:	639c                	ld	a5,0(a5)
    80005d74:	f43e                	sd	a5,40(sp)
    80005d76:	67a2                	ld	a5,8(sp)
    80005d78:	679c                	ld	a5,8(a5)
    80005d7a:	f03e                	sd	a5,32(sp)
    80005d7c:	77a2                	ld	a5,40(sp)
    80005d7e:	739c                	ld	a5,32(a5)
    80005d80:	ec3e                	sd	a5,24(sp)
    80005d82:	67e2                	ld	a5,24(sp)
    80005d84:	0207b423          	sd	zero,40(a5)
    80005d88:	77a2                	ld	a5,40(sp)
    80005d8a:	0207b023          	sd	zero,32(a5)
    80005d8e:	77a2                	ld	a5,40(sp)
    80005d90:	7702                	ld	a4,32(sp)
    80005d92:	f798                	sd	a4,40(a5)
    80005d94:	7782                	ld	a5,32(sp)
    80005d96:	7722                	ld	a4,40(sp)
    80005d98:	f398                	sd	a4,32(a5)
    80005d9a:	67a2                	ld	a5,8(sp)
    80005d9c:	6762                	ld	a4,24(sp)
    80005d9e:	e398                	sd	a4,0(a5)
    80005da0:	67a2                	ld	a5,8(sp)
    80005da2:	7722                	ld	a4,40(sp)
    80005da4:	e798                	sd	a4,8(a5)
    80005da6:	0001                	nop
    80005da8:	6145                	add	sp,sp,48
    80005daa:	8082                	ret

0000000080005dac <OS_RdyListRemove>:
    80005dac:	7139                	add	sp,sp,-64
    80005dae:	fc06                	sd	ra,56(sp)
    80005db0:	e42a                	sd	a0,8(sp)
    80005db2:	67a2                	ld	a5,8(sp)
    80005db4:	0737c783          	lbu	a5,115(a5)
    80005db8:	0007871b          	sext.w	a4,a5
    80005dbc:	87ba                	mv	a5,a4
    80005dbe:	0786                	sll	a5,a5,0x1
    80005dc0:	97ba                	add	a5,a5,a4
    80005dc2:	078e                	sll	a5,a5,0x3
    80005dc4:	00017717          	auipc	a4,0x17
    80005dc8:	08c70713          	add	a4,a4,140 # 8001ce50 <OSRdyList>
    80005dcc:	97ba                	add	a5,a5,a4
    80005dce:	f43e                	sd	a5,40(sp)
    80005dd0:	67a2                	ld	a5,8(sp)
    80005dd2:	779c                	ld	a5,40(a5)
    80005dd4:	f03e                	sd	a5,32(sp)
    80005dd6:	67a2                	ld	a5,8(sp)
    80005dd8:	739c                	ld	a5,32(a5)
    80005dda:	ec3e                	sd	a5,24(sp)
    80005ddc:	7782                	ld	a5,32(sp)
    80005dde:	e7a1                	bnez	a5,80005e26 <OS_RdyListRemove+0x7a>
    80005de0:	67e2                	ld	a5,24(sp)
    80005de2:	e38d                	bnez	a5,80005e04 <OS_RdyListRemove+0x58>
    80005de4:	77a2                	ld	a5,40(sp)
    80005de6:	00079823          	sh	zero,16(a5)
    80005dea:	77a2                	ld	a5,40(sp)
    80005dec:	0007b023          	sd	zero,0(a5)
    80005df0:	77a2                	ld	a5,40(sp)
    80005df2:	0007b423          	sd	zero,8(a5)
    80005df6:	67a2                	ld	a5,8(sp)
    80005df8:	0737c783          	lbu	a5,115(a5)
    80005dfc:	853e                	mv	a0,a5
    80005dfe:	5cc010ef          	jal	800073ca <OS_PrioRemove>
    80005e02:	a881                	j	80005e52 <OS_RdyListRemove+0xa6>
    80005e04:	77a2                	ld	a5,40(sp)
    80005e06:	0107d783          	lhu	a5,16(a5)
    80005e0a:	37fd                	addw	a5,a5,-1
    80005e0c:	03079713          	sll	a4,a5,0x30
    80005e10:	9341                	srl	a4,a4,0x30
    80005e12:	77a2                	ld	a5,40(sp)
    80005e14:	00e79823          	sh	a4,16(a5)
    80005e18:	67e2                	ld	a5,24(sp)
    80005e1a:	0207b423          	sd	zero,40(a5)
    80005e1e:	77a2                	ld	a5,40(sp)
    80005e20:	6762                	ld	a4,24(sp)
    80005e22:	e398                	sd	a4,0(a5)
    80005e24:	a03d                	j	80005e52 <OS_RdyListRemove+0xa6>
    80005e26:	77a2                	ld	a5,40(sp)
    80005e28:	0107d783          	lhu	a5,16(a5)
    80005e2c:	37fd                	addw	a5,a5,-1
    80005e2e:	03079713          	sll	a4,a5,0x30
    80005e32:	9341                	srl	a4,a4,0x30
    80005e34:	77a2                	ld	a5,40(sp)
    80005e36:	00e79823          	sh	a4,16(a5)
    80005e3a:	7782                	ld	a5,32(sp)
    80005e3c:	6762                	ld	a4,24(sp)
    80005e3e:	f398                	sd	a4,32(a5)
    80005e40:	67e2                	ld	a5,24(sp)
    80005e42:	e789                	bnez	a5,80005e4c <OS_RdyListRemove+0xa0>
    80005e44:	77a2                	ld	a5,40(sp)
    80005e46:	7702                	ld	a4,32(sp)
    80005e48:	e798                	sd	a4,8(a5)
    80005e4a:	a021                	j	80005e52 <OS_RdyListRemove+0xa6>
    80005e4c:	67e2                	ld	a5,24(sp)
    80005e4e:	7702                	ld	a4,32(sp)
    80005e50:	f798                	sd	a4,40(a5)
    80005e52:	67a2                	ld	a5,8(sp)
    80005e54:	0207b423          	sd	zero,40(a5)
    80005e58:	67a2                	ld	a5,8(sp)
    80005e5a:	0207b023          	sd	zero,32(a5)
    80005e5e:	0001                	nop
    80005e60:	70e2                	ld	ra,56(sp)
    80005e62:	6121                	add	sp,sp,64
    80005e64:	8082                	ret

0000000080005e66 <OS_SchedRoundRobin>:
    80005e66:	7179                	add	sp,sp,-48
    80005e68:	f406                	sd	ra,40(sp)
    80005e6a:	e42a                	sd	a0,8(sp)
    80005e6c:	ec02                	sd	zero,24(sp)
    80005e6e:	00006797          	auipc	a5,0x6
    80005e72:	af278793          	add	a5,a5,-1294 # 8000b960 <OSSchedRoundRobinEn>
    80005e76:	0007c783          	lbu	a5,0(a5)
    80005e7a:	873e                	mv	a4,a5
    80005e7c:	4785                	li	a5,1
    80005e7e:	0cf71063          	bne	a4,a5,80005f3e <OS_SchedRoundRobin+0xd8>
    80005e82:	c8cfb0ef          	jal	8000130e <CPU_SR_Save>
    80005e86:	ec2a                	sd	a0,24(sp)
    80005e88:	67a2                	ld	a5,8(sp)
    80005e8a:	639c                	ld	a5,0(a5)
    80005e8c:	e83e                	sd	a5,16(sp)
    80005e8e:	67c2                	ld	a5,16(sp)
    80005e90:	e789                	bnez	a5,80005e9a <OS_SchedRoundRobin+0x34>
    80005e92:	6562                	ld	a0,24(sp)
    80005e94:	c86fb0ef          	jal	8000131a <CPU_SR_Restore>
    80005e98:	a065                	j	80005f40 <OS_SchedRoundRobin+0xda>
    80005e9a:	6742                	ld	a4,16(sp)
    80005e9c:	00017797          	auipc	a5,0x17
    80005ea0:	e7478793          	add	a5,a5,-396 # 8001cd10 <OSIdleTaskTCB>
    80005ea4:	00f71663          	bne	a4,a5,80005eb0 <OS_SchedRoundRobin+0x4a>
    80005ea8:	6562                	ld	a0,24(sp)
    80005eaa:	c70fb0ef          	jal	8000131a <CPU_SR_Restore>
    80005eae:	a849                	j	80005f40 <OS_SchedRoundRobin+0xda>
    80005eb0:	67c2                	ld	a5,16(sp)
    80005eb2:	09c7a783          	lw	a5,156(a5)
    80005eb6:	cb91                	beqz	a5,80005eca <OS_SchedRoundRobin+0x64>
    80005eb8:	67c2                	ld	a5,16(sp)
    80005eba:	09c7a783          	lw	a5,156(a5)
    80005ebe:	37fd                	addw	a5,a5,-1
    80005ec0:	0007871b          	sext.w	a4,a5
    80005ec4:	67c2                	ld	a5,16(sp)
    80005ec6:	08e7ae23          	sw	a4,156(a5)
    80005eca:	67c2                	ld	a5,16(sp)
    80005ecc:	09c7a783          	lw	a5,156(a5)
    80005ed0:	c789                	beqz	a5,80005eda <OS_SchedRoundRobin+0x74>
    80005ed2:	6562                	ld	a0,24(sp)
    80005ed4:	c46fb0ef          	jal	8000131a <CPU_SR_Restore>
    80005ed8:	a0a5                	j	80005f40 <OS_SchedRoundRobin+0xda>
    80005eda:	67a2                	ld	a5,8(sp)
    80005edc:	6398                	ld	a4,0(a5)
    80005ede:	67a2                	ld	a5,8(sp)
    80005ee0:	679c                	ld	a5,8(a5)
    80005ee2:	00f71663          	bne	a4,a5,80005eee <OS_SchedRoundRobin+0x88>
    80005ee6:	6562                	ld	a0,24(sp)
    80005ee8:	c32fb0ef          	jal	8000131a <CPU_SR_Restore>
    80005eec:	a891                	j	80005f40 <OS_SchedRoundRobin+0xda>
    80005eee:	00006797          	auipc	a5,0x6
    80005ef2:	a6c78793          	add	a5,a5,-1428 # 8000b95a <OSSchedLockNestingCtr>
    80005ef6:	0007c783          	lbu	a5,0(a5)
    80005efa:	c789                	beqz	a5,80005f04 <OS_SchedRoundRobin+0x9e>
    80005efc:	6562                	ld	a0,24(sp)
    80005efe:	c1cfb0ef          	jal	8000131a <CPU_SR_Restore>
    80005f02:	a83d                	j	80005f40 <OS_SchedRoundRobin+0xda>
    80005f04:	6522                	ld	a0,8(sp)
    80005f06:	e1bff0ef          	jal	80005d20 <OS_RdyListMoveHeadToTail>
    80005f0a:	67a2                	ld	a5,8(sp)
    80005f0c:	639c                	ld	a5,0(a5)
    80005f0e:	e83e                	sd	a5,16(sp)
    80005f10:	67c2                	ld	a5,16(sp)
    80005f12:	0987a783          	lw	a5,152(a5)
    80005f16:	eb91                	bnez	a5,80005f2a <OS_SchedRoundRobin+0xc4>
    80005f18:	00006797          	auipc	a5,0x6
    80005f1c:	a4478793          	add	a5,a5,-1468 # 8000b95c <OSSchedRoundRobinDfltTimeQuanta>
    80005f20:	4398                	lw	a4,0(a5)
    80005f22:	67c2                	ld	a5,16(sp)
    80005f24:	08e7ae23          	sw	a4,156(a5)
    80005f28:	a039                	j	80005f36 <OS_SchedRoundRobin+0xd0>
    80005f2a:	67c2                	ld	a5,16(sp)
    80005f2c:	0987a703          	lw	a4,152(a5)
    80005f30:	67c2                	ld	a5,16(sp)
    80005f32:	08e7ae23          	sw	a4,156(a5)
    80005f36:	6562                	ld	a0,24(sp)
    80005f38:	be2fb0ef          	jal	8000131a <CPU_SR_Restore>
    80005f3c:	a011                	j	80005f40 <OS_SchedRoundRobin+0xda>
    80005f3e:	0001                	nop
    80005f40:	70a2                	ld	ra,40(sp)
    80005f42:	6145                	add	sp,sp,48
    80005f44:	8082                	ret

0000000080005f46 <OS_TaskBlock>:
    80005f46:	1101                	add	sp,sp,-32
    80005f48:	ec06                	sd	ra,24(sp)
    80005f4a:	e42a                	sd	a0,8(sp)
    80005f4c:	87ae                	mv	a5,a1
    80005f4e:	c23e                	sw	a5,4(sp)
    80005f50:	4792                	lw	a5,4(sp)
    80005f52:	2781                	sext.w	a5,a5
    80005f54:	c395                	beqz	a5,80005f78 <OS_TaskBlock+0x32>
    80005f56:	00006797          	auipc	a5,0x6
    80005f5a:	a4678793          	add	a5,a5,-1466 # 8000b99c <OSTickCtr>
    80005f5e:	439c                	lw	a5,0(a5)
    80005f60:	4712                	lw	a4,4(sp)
    80005f62:	86ba                	mv	a3,a4
    80005f64:	863e                	mv	a2,a5
    80005f66:	4581                	li	a1,0
    80005f68:	6522                	ld	a0,8(sp)
    80005f6a:	3bf000ef          	jal	80006b28 <OS_TickListInsert>
    80005f6e:	67a2                	ld	a5,8(sp)
    80005f70:	470d                	li	a4,3
    80005f72:	06e78923          	sb	a4,114(a5)
    80005f76:	a029                	j	80005f80 <OS_TaskBlock+0x3a>
    80005f78:	67a2                	ld	a5,8(sp)
    80005f7a:	4709                	li	a4,2
    80005f7c:	06e78923          	sb	a4,114(a5)
    80005f80:	6522                	ld	a0,8(sp)
    80005f82:	e2bff0ef          	jal	80005dac <OS_RdyListRemove>
    80005f86:	0001                	nop
    80005f88:	60e2                	ld	ra,24(sp)
    80005f8a:	6105                	add	sp,sp,32
    80005f8c:	8082                	ret

0000000080005f8e <OSMutexCreate>:
    80005f8e:	7139                	add	sp,sp,-64
    80005f90:	fc06                	sd	ra,56(sp)
    80005f92:	ec2a                	sd	a0,24(sp)
    80005f94:	e82e                	sd	a1,16(sp)
    80005f96:	e432                	sd	a2,8(sp)
    80005f98:	f402                	sd	zero,40(sp)
    80005f9a:	00006797          	auipc	a5,0x6
    80005f9e:	97278793          	add	a5,a5,-1678 # 8000b90c <OSIntNestingCtr>
    80005fa2:	0007c783          	lbu	a5,0(a5)
    80005fa6:	c799                	beqz	a5,80005fb4 <OSMutexCreate+0x26>
    80005fa8:	67a2                	ld	a5,8(sp)
    80005faa:	670d                	lui	a4,0x3
    80005fac:	ee170713          	add	a4,a4,-287 # 2ee1 <CPU_MSTATUS_MIE+0x2ed9>
    80005fb0:	c398                	sw	a4,0(a5)
    80005fb2:	a871                	j	8000604e <OSMutexCreate+0xc0>
    80005fb4:	67e2                	ld	a5,24(sp)
    80005fb6:	e799                	bnez	a5,80005fc4 <OSMutexCreate+0x36>
    80005fb8:	67a2                	ld	a5,8(sp)
    80005fba:	6719                	lui	a4,0x6
    80005fbc:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80005fc0:	c398                	sw	a4,0(a5)
    80005fc2:	a071                	j	8000604e <OSMutexCreate+0xc0>
    80005fc4:	b4afb0ef          	jal	8000130e <CPU_SR_Save>
    80005fc8:	f42a                	sd	a0,40(sp)
    80005fca:	67e2                	ld	a5,24(sp)
    80005fcc:	439c                	lw	a5,0(a5)
    80005fce:	873e                	mv	a4,a5
    80005fd0:	585457b7          	lui	a5,0x58545
    80005fd4:	54d78793          	add	a5,a5,1357 # 5854554d <CPU_MSTATUS_MIE+0x58545545>
    80005fd8:	00f71b63          	bne	a4,a5,80005fee <OSMutexCreate+0x60>
    80005fdc:	7522                	ld	a0,40(sp)
    80005fde:	b3cfb0ef          	jal	8000131a <CPU_SR_Restore>
    80005fe2:	67a2                	ld	a5,8(sp)
    80005fe4:	6719                	lui	a4,0x6
    80005fe6:	dc170713          	add	a4,a4,-575 # 5dc1 <CPU_MSTATUS_MIE+0x5db9>
    80005fea:	c398                	sw	a4,0(a5)
    80005fec:	a08d                	j	8000604e <OSMutexCreate+0xc0>
    80005fee:	67e2                	ld	a5,24(sp)
    80005ff0:	58545737          	lui	a4,0x58545
    80005ff4:	54d70713          	add	a4,a4,1357 # 5854554d <CPU_MSTATUS_MIE+0x58545545>
    80005ff8:	c398                	sw	a4,0(a5)
    80005ffa:	67e2                	ld	a5,24(sp)
    80005ffc:	6742                	ld	a4,16(sp)
    80005ffe:	e798                	sd	a4,8(a5)
    80006000:	67e2                	ld	a5,24(sp)
    80006002:	0407b023          	sd	zero,64(a5)
    80006006:	67e2                	ld	a5,24(sp)
    80006008:	0407b423          	sd	zero,72(a5)
    8000600c:	67e2                	ld	a5,24(sp)
    8000600e:	04078823          	sb	zero,80(a5)
    80006012:	67e2                	ld	a5,24(sp)
    80006014:	07c1                	add	a5,a5,16
    80006016:	853e                	mv	a0,a5
    80006018:	8e3ff0ef          	jal	800058fa <OS_PendListInit>
    8000601c:	6562                	ld	a0,24(sp)
    8000601e:	0a7000ef          	jal	800068c4 <OS_MutexDbgListAdd>
    80006022:	00006797          	auipc	a5,0x6
    80006026:	91e78793          	add	a5,a5,-1762 # 8000b940 <OSMutexQty>
    8000602a:	0007d783          	lhu	a5,0(a5)
    8000602e:	2785                	addw	a5,a5,1
    80006030:	03079713          	sll	a4,a5,0x30
    80006034:	9341                	srl	a4,a4,0x30
    80006036:	00006797          	auipc	a5,0x6
    8000603a:	90a78793          	add	a5,a5,-1782 # 8000b940 <OSMutexQty>
    8000603e:	00e79023          	sh	a4,0(a5)
    80006042:	7522                	ld	a0,40(sp)
    80006044:	ad6fb0ef          	jal	8000131a <CPU_SR_Restore>
    80006048:	67a2                	ld	a5,8(sp)
    8000604a:	0007a023          	sw	zero,0(a5)
    8000604e:	70e2                	ld	ra,56(sp)
    80006050:	6121                	add	sp,sp,64
    80006052:	8082                	ret

0000000080006054 <OSMutexDel>:
    80006054:	7159                	add	sp,sp,-112
    80006056:	f486                	sd	ra,104(sp)
    80006058:	ec2a                	sd	a0,24(sp)
    8000605a:	87ae                	mv	a5,a1
    8000605c:	e432                	sd	a2,8(sp)
    8000605e:	00f11b23          	sh	a5,22(sp)
    80006062:	e882                	sd	zero,80(sp)
    80006064:	00006797          	auipc	a5,0x6
    80006068:	8a878793          	add	a5,a5,-1880 # 8000b90c <OSIntNestingCtr>
    8000606c:	0007c783          	lbu	a5,0(a5)
    80006070:	cb81                	beqz	a5,80006080 <OSMutexDel+0x2c>
    80006072:	67a2                	ld	a5,8(sp)
    80006074:	670d                	lui	a4,0x3
    80006076:	2c970713          	add	a4,a4,713 # 32c9 <CPU_MSTATUS_MIE+0x32c1>
    8000607a:	c398                	sw	a4,0(a5)
    8000607c:	4781                	li	a5,0
    8000607e:	aa4d                	j	80006230 <OSMutexDel+0x1dc>
    80006080:	00006797          	auipc	a5,0x6
    80006084:	88d78793          	add	a5,a5,-1907 # 8000b90d <OSRunning>
    80006088:	0007c783          	lbu	a5,0(a5)
    8000608c:	873e                	mv	a4,a5
    8000608e:	4785                	li	a5,1
    80006090:	00f70963          	beq	a4,a5,800060a2 <OSMutexDel+0x4e>
    80006094:	67a2                	ld	a5,8(sp)
    80006096:	6719                	lui	a4,0x6
    80006098:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    8000609c:	c398                	sw	a4,0(a5)
    8000609e:	4781                	li	a5,0
    800060a0:	aa41                	j	80006230 <OSMutexDel+0x1dc>
    800060a2:	67e2                	ld	a5,24(sp)
    800060a4:	eb81                	bnez	a5,800060b4 <OSMutexDel+0x60>
    800060a6:	67a2                	ld	a5,8(sp)
    800060a8:	6719                	lui	a4,0x6
    800060aa:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    800060ae:	c398                	sw	a4,0(a5)
    800060b0:	4781                	li	a5,0
    800060b2:	aabd                	j	80006230 <OSMutexDel+0x1dc>
    800060b4:	67e2                	ld	a5,24(sp)
    800060b6:	439c                	lw	a5,0(a5)
    800060b8:	873e                	mv	a4,a5
    800060ba:	585457b7          	lui	a5,0x58545
    800060be:	54d78793          	add	a5,a5,1357 # 5854554d <CPU_MSTATUS_MIE+0x58545545>
    800060c2:	00f70963          	beq	a4,a5,800060d4 <OSMutexDel+0x80>
    800060c6:	67a2                	ld	a5,8(sp)
    800060c8:	6719                	lui	a4,0x6
    800060ca:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    800060ce:	c398                	sw	a4,0(a5)
    800060d0:	4781                	li	a5,0
    800060d2:	aab9                	j	80006230 <OSMutexDel+0x1dc>
    800060d4:	a3afb0ef          	jal	8000130e <CPU_SR_Save>
    800060d8:	e8aa                	sd	a0,80(sp)
    800060da:	67e2                	ld	a5,24(sp)
    800060dc:	07c1                	add	a5,a5,16
    800060de:	e4be                	sd	a5,72(sp)
    800060e0:	04011f23          	sh	zero,94(sp)
    800060e4:	01615783          	lhu	a5,22(sp)
    800060e8:	2781                	sext.w	a5,a5
    800060ea:	c791                	beqz	a5,800060f6 <OSMutexDel+0xa2>
    800060ec:	873e                	mv	a4,a5
    800060ee:	4785                	li	a5,1
    800060f0:	06f70563          	beq	a4,a5,8000615a <OSMutexDel+0x106>
    800060f4:	a21d                	j	8000621a <OSMutexDel+0x1c6>
    800060f6:	67a6                	ld	a5,72(sp)
    800060f8:	639c                	ld	a5,0(a5)
    800060fa:	e7b9                	bnez	a5,80006148 <OSMutexDel+0xf4>
    800060fc:	6562                	ld	a0,24(sp)
    800060fe:	01f000ef          	jal	8000691c <OS_MutexDbgListRemove>
    80006102:	00006797          	auipc	a5,0x6
    80006106:	83e78793          	add	a5,a5,-1986 # 8000b940 <OSMutexQty>
    8000610a:	0007d783          	lhu	a5,0(a5)
    8000610e:	37fd                	addw	a5,a5,-1
    80006110:	03079713          	sll	a4,a5,0x30
    80006114:	9341                	srl	a4,a4,0x30
    80006116:	00006797          	auipc	a5,0x6
    8000611a:	82a78793          	add	a5,a5,-2006 # 8000b940 <OSMutexQty>
    8000611e:	00e79023          	sh	a4,0(a5)
    80006122:	67e2                	ld	a5,24(sp)
    80006124:	67bc                	ld	a5,72(a5)
    80006126:	c799                	beqz	a5,80006134 <OSMutexDel+0xe0>
    80006128:	67e2                	ld	a5,24(sp)
    8000612a:	67bc                	ld	a5,72(a5)
    8000612c:	65e2                	ld	a1,24(sp)
    8000612e:	853e                	mv	a0,a5
    80006130:	069000ef          	jal	80006998 <OS_MutexGrpRemove>
    80006134:	6562                	ld	a0,24(sp)
    80006136:	74c000ef          	jal	80006882 <OS_MutexClr>
    8000613a:	6546                	ld	a0,80(sp)
    8000613c:	9defb0ef          	jal	8000131a <CPU_SR_Restore>
    80006140:	67a2                	ld	a5,8(sp)
    80006142:	0007a023          	sw	zero,0(a5)
    80006146:	a0dd                	j	8000622c <OSMutexDel+0x1d8>
    80006148:	6546                	ld	a0,80(sp)
    8000614a:	9d0fb0ef          	jal	8000131a <CPU_SR_Restore>
    8000614e:	67a2                	ld	a5,8(sp)
    80006150:	671d                	lui	a4,0x7
    80006152:	15f70713          	add	a4,a4,351 # 715f <CPU_MSTATUS_MIE+0x7157>
    80006156:	c398                	sw	a4,0(a5)
    80006158:	a8d1                	j	8000622c <OSMutexDel+0x1d8>
    8000615a:	c282                	sw	zero,68(sp)
    8000615c:	a839                	j	8000617a <OSMutexDel+0x126>
    8000615e:	67a6                	ld	a5,72(sp)
    80006160:	639c                	ld	a5,0(a5)
    80006162:	f43e                	sd	a5,40(sp)
    80006164:	4796                	lw	a5,68(sp)
    80006166:	4609                	li	a2,2
    80006168:	85be                	mv	a1,a5
    8000616a:	7522                	ld	a0,40(sp)
    8000616c:	dd0ff0ef          	jal	8000573c <OS_PendAbort>
    80006170:	05e15783          	lhu	a5,94(sp)
    80006174:	2785                	addw	a5,a5,1
    80006176:	04f11f23          	sh	a5,94(sp)
    8000617a:	67a6                	ld	a5,72(sp)
    8000617c:	639c                	ld	a5,0(a5)
    8000617e:	f3e5                	bnez	a5,8000615e <OSMutexDel+0x10a>
    80006180:	6562                	ld	a0,24(sp)
    80006182:	79a000ef          	jal	8000691c <OS_MutexDbgListRemove>
    80006186:	00005797          	auipc	a5,0x5
    8000618a:	7ba78793          	add	a5,a5,1978 # 8000b940 <OSMutexQty>
    8000618e:	0007d783          	lhu	a5,0(a5)
    80006192:	37fd                	addw	a5,a5,-1
    80006194:	03079713          	sll	a4,a5,0x30
    80006198:	9341                	srl	a4,a4,0x30
    8000619a:	00005797          	auipc	a5,0x5
    8000619e:	7a678793          	add	a5,a5,1958 # 8000b940 <OSMutexQty>
    800061a2:	00e79023          	sh	a4,0(a5)
    800061a6:	67e2                	ld	a5,24(sp)
    800061a8:	67bc                	ld	a5,72(a5)
    800061aa:	fc3e                	sd	a5,56(sp)
    800061ac:	77e2                	ld	a5,56(sp)
    800061ae:	c789                	beqz	a5,800061b8 <OSMutexDel+0x164>
    800061b0:	65e2                	ld	a1,24(sp)
    800061b2:	7562                	ld	a0,56(sp)
    800061b4:	7e4000ef          	jal	80006998 <OS_MutexGrpRemove>
    800061b8:	77e2                	ld	a5,56(sp)
    800061ba:	c7a1                	beqz	a5,80006202 <OSMutexDel+0x1ae>
    800061bc:	77e2                	ld	a5,56(sp)
    800061be:	0737c703          	lbu	a4,115(a5)
    800061c2:	77e2                	ld	a5,56(sp)
    800061c4:	0747c783          	lbu	a5,116(a5)
    800061c8:	02f70d63          	beq	a4,a5,80006202 <OSMutexDel+0x1ae>
    800061cc:	7562                	ld	a0,56(sp)
    800061ce:	7fe000ef          	jal	800069cc <OS_MutexGrpPrioFindHighest>
    800061d2:	87aa                	mv	a5,a0
    800061d4:	02f10ba3          	sb	a5,55(sp)
    800061d8:	77e2                	ld	a5,56(sp)
    800061da:	0747c783          	lbu	a5,116(a5)
    800061de:	863e                	mv	a2,a5
    800061e0:	03714783          	lbu	a5,55(sp)
    800061e4:	0ff7f693          	zext.b	a3,a5
    800061e8:	0ff67713          	zext.b	a4,a2
    800061ec:	00d77363          	bgeu	a4,a3,800061f2 <OSMutexDel+0x19e>
    800061f0:	87b2                	mv	a5,a2
    800061f2:	02f10ba3          	sb	a5,55(sp)
    800061f6:	03714783          	lbu	a5,55(sp)
    800061fa:	85be                	mv	a1,a5
    800061fc:	7562                	ld	a0,56(sp)
    800061fe:	a45fe0ef          	jal	80004c42 <OS_TaskChangePrio>
    80006202:	6562                	ld	a0,24(sp)
    80006204:	67e000ef          	jal	80006882 <OS_MutexClr>
    80006208:	6546                	ld	a0,80(sp)
    8000620a:	910fb0ef          	jal	8000131a <CPU_SR_Restore>
    8000620e:	f39fe0ef          	jal	80005146 <OSSched>
    80006212:	67a2                	ld	a5,8(sp)
    80006214:	0007a023          	sw	zero,0(a5)
    80006218:	a811                	j	8000622c <OSMutexDel+0x1d8>
    8000621a:	6546                	ld	a0,80(sp)
    8000621c:	8fefb0ef          	jal	8000131a <CPU_SR_Restore>
    80006220:	67a2                	ld	a5,8(sp)
    80006222:	6719                	lui	a4,0x6
    80006224:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80006228:	c398                	sw	a4,0(a5)
    8000622a:	0001                	nop
    8000622c:	05e15783          	lhu	a5,94(sp)
    80006230:	853e                	mv	a0,a5
    80006232:	70a6                	ld	ra,104(sp)
    80006234:	6165                	add	sp,sp,112
    80006236:	8082                	ret

0000000080006238 <OSMutexPend>:
    80006238:	7139                	add	sp,sp,-64
    8000623a:	fc06                	sd	ra,56(sp)
    8000623c:	ec2a                	sd	a0,24(sp)
    8000623e:	87ae                	mv	a5,a1
    80006240:	e436                	sd	a3,8(sp)
    80006242:	e03a                	sd	a4,0(sp)
    80006244:	ca3e                	sw	a5,20(sp)
    80006246:	87b2                	mv	a5,a2
    80006248:	00f11923          	sh	a5,18(sp)
    8000624c:	f402                	sd	zero,40(sp)
    8000624e:	00005797          	auipc	a5,0x5
    80006252:	6be78793          	add	a5,a5,1726 # 8000b90c <OSIntNestingCtr>
    80006256:	0007c783          	lbu	a5,0(a5)
    8000625a:	c799                	beqz	a5,80006268 <OSMutexPend+0x30>
    8000625c:	6782                	ld	a5,0(sp)
    8000625e:	6719                	lui	a4,0x6
    80006260:	1ae70713          	add	a4,a4,430 # 61ae <CPU_MSTATUS_MIE+0x61a6>
    80006264:	c398                	sw	a4,0(a5)
    80006266:	ac29                	j	80006480 <OSMutexPend+0x248>
    80006268:	00005797          	auipc	a5,0x5
    8000626c:	6a578793          	add	a5,a5,1701 # 8000b90d <OSRunning>
    80006270:	0007c783          	lbu	a5,0(a5)
    80006274:	873e                	mv	a4,a5
    80006276:	4785                	li	a5,1
    80006278:	00f70863          	beq	a4,a5,80006288 <OSMutexPend+0x50>
    8000627c:	6782                	ld	a5,0(sp)
    8000627e:	6719                	lui	a4,0x6
    80006280:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80006284:	c398                	sw	a4,0(a5)
    80006286:	aaed                	j	80006480 <OSMutexPend+0x248>
    80006288:	67e2                	ld	a5,24(sp)
    8000628a:	e799                	bnez	a5,80006298 <OSMutexPend+0x60>
    8000628c:	6782                	ld	a5,0(sp)
    8000628e:	6719                	lui	a4,0x6
    80006290:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80006294:	c398                	sw	a4,0(a5)
    80006296:	a2ed                	j	80006480 <OSMutexPend+0x248>
    80006298:	01215783          	lhu	a5,18(sp)
    8000629c:	2781                	sext.w	a5,a5
    8000629e:	cb99                	beqz	a5,800062b4 <OSMutexPend+0x7c>
    800062a0:	873e                	mv	a4,a5
    800062a2:	67a1                	lui	a5,0x8
    800062a4:	00f70863          	beq	a4,a5,800062b4 <OSMutexPend+0x7c>
    800062a8:	6782                	ld	a5,0(sp)
    800062aa:	6719                	lui	a4,0x6
    800062ac:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800062b0:	c398                	sw	a4,0(a5)
    800062b2:	a2f9                	j	80006480 <OSMutexPend+0x248>
    800062b4:	0001                	nop
    800062b6:	67e2                	ld	a5,24(sp)
    800062b8:	439c                	lw	a5,0(a5)
    800062ba:	873e                	mv	a4,a5
    800062bc:	585457b7          	lui	a5,0x58545
    800062c0:	54d78793          	add	a5,a5,1357 # 5854554d <CPU_MSTATUS_MIE+0x58545545>
    800062c4:	00f70863          	beq	a4,a5,800062d4 <OSMutexPend+0x9c>
    800062c8:	6782                	ld	a5,0(sp)
    800062ca:	6719                	lui	a4,0x6
    800062cc:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    800062d0:	c398                	sw	a4,0(a5)
    800062d2:	a27d                	j	80006480 <OSMutexPend+0x248>
    800062d4:	83afb0ef          	jal	8000130e <CPU_SR_Save>
    800062d8:	f42a                	sd	a0,40(sp)
    800062da:	67e2                	ld	a5,24(sp)
    800062dc:	0507c783          	lbu	a5,80(a5)
    800062e0:	ef85                	bnez	a5,80006318 <OSMutexPend+0xe0>
    800062e2:	00005797          	auipc	a5,0x5
    800062e6:	6e678793          	add	a5,a5,1766 # 8000b9c8 <OSTCBCurPtr>
    800062ea:	6398                	ld	a4,0(a5)
    800062ec:	67e2                	ld	a5,24(sp)
    800062ee:	e7b8                	sd	a4,72(a5)
    800062f0:	67e2                	ld	a5,24(sp)
    800062f2:	4705                	li	a4,1
    800062f4:	04e78823          	sb	a4,80(a5)
    800062f8:	00005797          	auipc	a5,0x5
    800062fc:	6d078793          	add	a5,a5,1744 # 8000b9c8 <OSTCBCurPtr>
    80006300:	639c                	ld	a5,0(a5)
    80006302:	65e2                	ld	a1,24(sp)
    80006304:	853e                	mv	a0,a5
    80006306:	678000ef          	jal	8000697e <OS_MutexGrpAdd>
    8000630a:	7522                	ld	a0,40(sp)
    8000630c:	80efb0ef          	jal	8000131a <CPU_SR_Restore>
    80006310:	6782                	ld	a5,0(sp)
    80006312:	0007a023          	sw	zero,0(a5)
    80006316:	a2ad                	j	80006480 <OSMutexPend+0x248>
    80006318:	67e2                	ld	a5,24(sp)
    8000631a:	67b8                	ld	a4,72(a5)
    8000631c:	00005797          	auipc	a5,0x5
    80006320:	6ac78793          	add	a5,a5,1708 # 8000b9c8 <OSTCBCurPtr>
    80006324:	639c                	ld	a5,0(a5)
    80006326:	04f71563          	bne	a4,a5,80006370 <OSMutexPend+0x138>
    8000632a:	67e2                	ld	a5,24(sp)
    8000632c:	0507c783          	lbu	a5,80(a5)
    80006330:	873e                	mv	a4,a5
    80006332:	0ff00793          	li	a5,255
    80006336:	00f71b63          	bne	a4,a5,8000634c <OSMutexPend+0x114>
    8000633a:	7522                	ld	a0,40(sp)
    8000633c:	fdffa0ef          	jal	8000131a <CPU_SR_Restore>
    80006340:	6782                	ld	a5,0(sp)
    80006342:	6715                	lui	a4,0x5
    80006344:	78470713          	add	a4,a4,1924 # 5784 <CPU_MSTATUS_MIE+0x577c>
    80006348:	c398                	sw	a4,0(a5)
    8000634a:	aa1d                	j	80006480 <OSMutexPend+0x248>
    8000634c:	67e2                	ld	a5,24(sp)
    8000634e:	0507c783          	lbu	a5,80(a5)
    80006352:	2785                	addw	a5,a5,1
    80006354:	0ff7f713          	zext.b	a4,a5
    80006358:	67e2                	ld	a5,24(sp)
    8000635a:	04e78823          	sb	a4,80(a5)
    8000635e:	7522                	ld	a0,40(sp)
    80006360:	fbbfa0ef          	jal	8000131a <CPU_SR_Restore>
    80006364:	6782                	ld	a5,0(sp)
    80006366:	6715                	lui	a4,0x5
    80006368:	78270713          	add	a4,a4,1922 # 5782 <CPU_MSTATUS_MIE+0x577a>
    8000636c:	c398                	sw	a4,0(a5)
    8000636e:	aa09                	j	80006480 <OSMutexPend+0x248>
    80006370:	01211783          	lh	a5,18(sp)
    80006374:	0007db63          	bgez	a5,8000638a <OSMutexPend+0x152>
    80006378:	7522                	ld	a0,40(sp)
    8000637a:	fa1fa0ef          	jal	8000131a <CPU_SR_Restore>
    8000637e:	6782                	ld	a5,0(sp)
    80006380:	6719                	lui	a4,0x6
    80006382:	1b070713          	add	a4,a4,432 # 61b0 <CPU_MSTATUS_MIE+0x61a8>
    80006386:	c398                	sw	a4,0(a5)
    80006388:	a8e5                	j	80006480 <OSMutexPend+0x248>
    8000638a:	00005797          	auipc	a5,0x5
    8000638e:	5d078793          	add	a5,a5,1488 # 8000b95a <OSSchedLockNestingCtr>
    80006392:	0007c783          	lbu	a5,0(a5)
    80006396:	cb91                	beqz	a5,800063aa <OSMutexPend+0x172>
    80006398:	7522                	ld	a0,40(sp)
    8000639a:	f81fa0ef          	jal	8000131a <CPU_SR_Restore>
    8000639e:	6782                	ld	a5,0(sp)
    800063a0:	671d                	lui	a4,0x7
    800063a2:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    800063a6:	c398                	sw	a4,0(a5)
    800063a8:	a8e1                	j	80006480 <OSMutexPend+0x248>
    800063aa:	67e2                	ld	a5,24(sp)
    800063ac:	67bc                	ld	a5,72(a5)
    800063ae:	f03e                	sd	a5,32(sp)
    800063b0:	7782                	ld	a5,32(sp)
    800063b2:	0737c703          	lbu	a4,115(a5)
    800063b6:	00005797          	auipc	a5,0x5
    800063ba:	61278793          	add	a5,a5,1554 # 8000b9c8 <OSTCBCurPtr>
    800063be:	639c                	ld	a5,0(a5)
    800063c0:	0737c783          	lbu	a5,115(a5)
    800063c4:	00e7fd63          	bgeu	a5,a4,800063de <OSMutexPend+0x1a6>
    800063c8:	00005797          	auipc	a5,0x5
    800063cc:	60078793          	add	a5,a5,1536 # 8000b9c8 <OSTCBCurPtr>
    800063d0:	639c                	ld	a5,0(a5)
    800063d2:	0737c783          	lbu	a5,115(a5)
    800063d6:	85be                	mv	a1,a5
    800063d8:	7502                	ld	a0,32(sp)
    800063da:	869fe0ef          	jal	80004c42 <OS_TaskChangePrio>
    800063de:	00005797          	auipc	a5,0x5
    800063e2:	5ea78793          	add	a5,a5,1514 # 8000b9c8 <OSTCBCurPtr>
    800063e6:	639c                	ld	a5,0(a5)
    800063e8:	4752                	lw	a4,20(sp)
    800063ea:	86ba                	mv	a3,a4
    800063ec:	4611                	li	a2,4
    800063ee:	85be                	mv	a1,a5
    800063f0:	6562                	ld	a0,24(sp)
    800063f2:	aecff0ef          	jal	800056de <OS_Pend>
    800063f6:	7522                	ld	a0,40(sp)
    800063f8:	f23fa0ef          	jal	8000131a <CPU_SR_Restore>
    800063fc:	d4bfe0ef          	jal	80005146 <OSSched>
    80006400:	f0ffa0ef          	jal	8000130e <CPU_SR_Save>
    80006404:	f42a                	sd	a0,40(sp)
    80006406:	00005797          	auipc	a5,0x5
    8000640a:	5c278793          	add	a5,a5,1474 # 8000b9c8 <OSTCBCurPtr>
    8000640e:	639c                	ld	a5,0(a5)
    80006410:	0717c783          	lbu	a5,113(a5)
    80006414:	2781                	sext.w	a5,a5
    80006416:	86be                	mv	a3,a5
    80006418:	470d                	li	a4,3
    8000641a:	02e68e63          	beq	a3,a4,80006456 <OSMutexPend+0x21e>
    8000641e:	86be                	mv	a3,a5
    80006420:	470d                	li	a4,3
    80006422:	04d74663          	blt	a4,a3,8000646e <OSMutexPend+0x236>
    80006426:	86be                	mv	a3,a5
    80006428:	4709                	li	a4,2
    8000642a:	02e68c63          	beq	a3,a4,80006462 <OSMutexPend+0x22a>
    8000642e:	86be                	mv	a3,a5
    80006430:	4709                	li	a4,2
    80006432:	02d74e63          	blt	a4,a3,8000646e <OSMutexPend+0x236>
    80006436:	c791                	beqz	a5,80006442 <OSMutexPend+0x20a>
    80006438:	873e                	mv	a4,a5
    8000643a:	4785                	li	a5,1
    8000643c:	00f70763          	beq	a4,a5,8000644a <OSMutexPend+0x212>
    80006440:	a03d                	j	8000646e <OSMutexPend+0x236>
    80006442:	6782                	ld	a5,0(sp)
    80006444:	0007a023          	sw	zero,0(a5)
    80006448:	a80d                	j	8000647a <OSMutexPend+0x242>
    8000644a:	6782                	ld	a5,0(sp)
    8000644c:	6719                	lui	a4,0x6
    8000644e:	1a970713          	add	a4,a4,425 # 61a9 <CPU_MSTATUS_MIE+0x61a1>
    80006452:	c398                	sw	a4,0(a5)
    80006454:	a01d                	j	8000647a <OSMutexPend+0x242>
    80006456:	6782                	ld	a5,0(sp)
    80006458:	671d                	lui	a4,0x7
    8000645a:	2d970713          	add	a4,a4,729 # 72d9 <CPU_MSTATUS_MIE+0x72d1>
    8000645e:	c398                	sw	a4,0(a5)
    80006460:	a829                	j	8000647a <OSMutexPend+0x242>
    80006462:	6782                	ld	a5,0(sp)
    80006464:	6719                	lui	a4,0x6
    80006466:	dc270713          	add	a4,a4,-574 # 5dc2 <CPU_MSTATUS_MIE+0x5dba>
    8000646a:	c398                	sw	a4,0(a5)
    8000646c:	a039                	j	8000647a <OSMutexPend+0x242>
    8000646e:	6782                	ld	a5,0(sp)
    80006470:	671d                	lui	a4,0x7
    80006472:	e2e70713          	add	a4,a4,-466 # 6e2e <CPU_MSTATUS_MIE+0x6e26>
    80006476:	c398                	sw	a4,0(a5)
    80006478:	0001                	nop
    8000647a:	7522                	ld	a0,40(sp)
    8000647c:	e9ffa0ef          	jal	8000131a <CPU_SR_Restore>
    80006480:	70e2                	ld	ra,56(sp)
    80006482:	6121                	add	sp,sp,64
    80006484:	8082                	ret

0000000080006486 <OSMutexPendAbort>:
    80006486:	711d                	add	sp,sp,-96
    80006488:	ec86                	sd	ra,88(sp)
    8000648a:	ec2a                	sd	a0,24(sp)
    8000648c:	87ae                	mv	a5,a1
    8000648e:	e432                	sd	a2,8(sp)
    80006490:	00f11b23          	sh	a5,22(sp)
    80006494:	e082                	sd	zero,64(sp)
    80006496:	00005797          	auipc	a5,0x5
    8000649a:	47678793          	add	a5,a5,1142 # 8000b90c <OSIntNestingCtr>
    8000649e:	0007c783          	lbu	a5,0(a5)
    800064a2:	cb81                	beqz	a5,800064b2 <OSMutexPendAbort+0x2c>
    800064a4:	67a2                	ld	a5,8(sp)
    800064a6:	6719                	lui	a4,0x6
    800064a8:	1aa70713          	add	a4,a4,426 # 61aa <CPU_MSTATUS_MIE+0x61a2>
    800064ac:	c398                	sw	a4,0(a5)
    800064ae:	4781                	li	a5,0
    800064b0:	aa61                	j	80006648 <OSMutexPendAbort+0x1c2>
    800064b2:	00005797          	auipc	a5,0x5
    800064b6:	45b78793          	add	a5,a5,1115 # 8000b90d <OSRunning>
    800064ba:	0007c783          	lbu	a5,0(a5)
    800064be:	873e                	mv	a4,a5
    800064c0:	4785                	li	a5,1
    800064c2:	00f70963          	beq	a4,a5,800064d4 <OSMutexPendAbort+0x4e>
    800064c6:	67a2                	ld	a5,8(sp)
    800064c8:	6719                	lui	a4,0x6
    800064ca:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    800064ce:	c398                	sw	a4,0(a5)
    800064d0:	4781                	li	a5,0
    800064d2:	aa9d                	j	80006648 <OSMutexPendAbort+0x1c2>
    800064d4:	67e2                	ld	a5,24(sp)
    800064d6:	eb81                	bnez	a5,800064e6 <OSMutexPendAbort+0x60>
    800064d8:	67a2                	ld	a5,8(sp)
    800064da:	6719                	lui	a4,0x6
    800064dc:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    800064e0:	c398                	sw	a4,0(a5)
    800064e2:	4781                	li	a5,0
    800064e4:	a295                	j	80006648 <OSMutexPendAbort+0x1c2>
    800064e6:	01615783          	lhu	a5,22(sp)
    800064ea:	2781                	sext.w	a5,a5
    800064ec:	86be                	mv	a3,a5
    800064ee:	6721                	lui	a4,0x8
    800064f0:	10070713          	add	a4,a4,256 # 8100 <CPU_MSTATUS_MIE+0x80f8>
    800064f4:	02e68d63          	beq	a3,a4,8000652e <OSMutexPendAbort+0xa8>
    800064f8:	86be                	mv	a3,a5
    800064fa:	6721                	lui	a4,0x8
    800064fc:	10070713          	add	a4,a4,256 # 8100 <CPU_MSTATUS_MIE+0x80f8>
    80006500:	02d74063          	blt	a4,a3,80006520 <OSMutexPendAbort+0x9a>
    80006504:	86be                	mv	a3,a5
    80006506:	6721                	lui	a4,0x8
    80006508:	02e68363          	beq	a3,a4,8000652e <OSMutexPendAbort+0xa8>
    8000650c:	86be                	mv	a3,a5
    8000650e:	6721                	lui	a4,0x8
    80006510:	00d74863          	blt	a4,a3,80006520 <OSMutexPendAbort+0x9a>
    80006514:	cf89                	beqz	a5,8000652e <OSMutexPendAbort+0xa8>
    80006516:	873e                	mv	a4,a5
    80006518:	10000793          	li	a5,256
    8000651c:	00f70963          	beq	a4,a5,8000652e <OSMutexPendAbort+0xa8>
    80006520:	67a2                	ld	a5,8(sp)
    80006522:	6719                	lui	a4,0x6
    80006524:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80006528:	c398                	sw	a4,0(a5)
    8000652a:	4781                	li	a5,0
    8000652c:	aa31                	j	80006648 <OSMutexPendAbort+0x1c2>
    8000652e:	0001                	nop
    80006530:	67e2                	ld	a5,24(sp)
    80006532:	439c                	lw	a5,0(a5)
    80006534:	873e                	mv	a4,a5
    80006536:	585457b7          	lui	a5,0x58545
    8000653a:	54d78793          	add	a5,a5,1357 # 5854554d <CPU_MSTATUS_MIE+0x58545545>
    8000653e:	00f70963          	beq	a4,a5,80006550 <OSMutexPendAbort+0xca>
    80006542:	67a2                	ld	a5,8(sp)
    80006544:	6719                	lui	a4,0x6
    80006546:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    8000654a:	c398                	sw	a4,0(a5)
    8000654c:	4781                	li	a5,0
    8000654e:	a8ed                	j	80006648 <OSMutexPendAbort+0x1c2>
    80006550:	dbffa0ef          	jal	8000130e <CPU_SR_Save>
    80006554:	e0aa                	sd	a0,64(sp)
    80006556:	67e2                	ld	a5,24(sp)
    80006558:	07c1                	add	a5,a5,16
    8000655a:	fc3e                	sd	a5,56(sp)
    8000655c:	77e2                	ld	a5,56(sp)
    8000655e:	639c                	ld	a5,0(a5)
    80006560:	eb99                	bnez	a5,80006576 <OSMutexPendAbort+0xf0>
    80006562:	6506                	ld	a0,64(sp)
    80006564:	db7fa0ef          	jal	8000131a <CPU_SR_Restore>
    80006568:	67a2                	ld	a5,8(sp)
    8000656a:	6719                	lui	a4,0x6
    8000656c:	1ab70713          	add	a4,a4,427 # 61ab <CPU_MSTATUS_MIE+0x61a3>
    80006570:	c398                	sw	a4,0(a5)
    80006572:	4781                	li	a5,0
    80006574:	a8d1                	j	80006648 <OSMutexPendAbort+0x1c2>
    80006576:	04011723          	sh	zero,78(sp)
    8000657a:	da02                	sw	zero,52(sp)
    8000657c:	a05d                	j	80006622 <OSMutexPendAbort+0x19c>
    8000657e:	77e2                	ld	a5,56(sp)
    80006580:	639c                	ld	a5,0(a5)
    80006582:	f43e                	sd	a5,40(sp)
    80006584:	57d2                	lw	a5,52(sp)
    80006586:	4605                	li	a2,1
    80006588:	85be                	mv	a1,a5
    8000658a:	7522                	ld	a0,40(sp)
    8000658c:	9b0ff0ef          	jal	8000573c <OS_PendAbort>
    80006590:	67e2                	ld	a5,24(sp)
    80006592:	67bc                	ld	a5,72(a5)
    80006594:	f03e                	sd	a5,32(sp)
    80006596:	7782                	ld	a5,32(sp)
    80006598:	0737c783          	lbu	a5,115(a5)
    8000659c:	04f106a3          	sb	a5,77(sp)
    800065a0:	7782                	ld	a5,32(sp)
    800065a2:	0737c703          	lbu	a4,115(a5)
    800065a6:	7782                	ld	a5,32(sp)
    800065a8:	0747c783          	lbu	a5,116(a5)
    800065ac:	02f70f63          	beq	a4,a5,800065ea <OSMutexPendAbort+0x164>
    800065b0:	7782                	ld	a5,32(sp)
    800065b2:	0737c703          	lbu	a4,115(a5)
    800065b6:	77a2                	ld	a5,40(sp)
    800065b8:	0737c783          	lbu	a5,115(a5)
    800065bc:	02f71763          	bne	a4,a5,800065ea <OSMutexPendAbort+0x164>
    800065c0:	7502                	ld	a0,32(sp)
    800065c2:	40a000ef          	jal	800069cc <OS_MutexGrpPrioFindHighest>
    800065c6:	87aa                	mv	a5,a0
    800065c8:	04f106a3          	sb	a5,77(sp)
    800065cc:	7782                	ld	a5,32(sp)
    800065ce:	0747c783          	lbu	a5,116(a5)
    800065d2:	863e                	mv	a2,a5
    800065d4:	04d14783          	lbu	a5,77(sp)
    800065d8:	0ff7f693          	zext.b	a3,a5
    800065dc:	0ff67713          	zext.b	a4,a2
    800065e0:	00d77363          	bgeu	a4,a3,800065e6 <OSMutexPendAbort+0x160>
    800065e4:	87b2                	mv	a5,a2
    800065e6:	04f106a3          	sb	a5,77(sp)
    800065ea:	7782                	ld	a5,32(sp)
    800065ec:	0737c703          	lbu	a4,115(a5)
    800065f0:	04d14783          	lbu	a5,77(sp)
    800065f4:	0ff7f793          	zext.b	a5,a5
    800065f8:	00e78863          	beq	a5,a4,80006608 <OSMutexPendAbort+0x182>
    800065fc:	04d14783          	lbu	a5,77(sp)
    80006600:	85be                	mv	a1,a5
    80006602:	7502                	ld	a0,32(sp)
    80006604:	e3efe0ef          	jal	80004c42 <OS_TaskChangePrio>
    80006608:	04e15783          	lhu	a5,78(sp)
    8000660c:	2785                	addw	a5,a5,1
    8000660e:	04f11723          	sh	a5,78(sp)
    80006612:	01615783          	lhu	a5,22(sp)
    80006616:	0007871b          	sext.w	a4,a5
    8000661a:	10000793          	li	a5,256
    8000661e:	00f71663          	bne	a4,a5,8000662a <OSMutexPendAbort+0x1a4>
    80006622:	77e2                	ld	a5,56(sp)
    80006624:	639c                	ld	a5,0(a5)
    80006626:	ffa1                	bnez	a5,8000657e <OSMutexPendAbort+0xf8>
    80006628:	a011                	j	8000662c <OSMutexPendAbort+0x1a6>
    8000662a:	0001                	nop
    8000662c:	6506                	ld	a0,64(sp)
    8000662e:	cedfa0ef          	jal	8000131a <CPU_SR_Restore>
    80006632:	01611783          	lh	a5,22(sp)
    80006636:	0007c463          	bltz	a5,8000663e <OSMutexPendAbort+0x1b8>
    8000663a:	b0dfe0ef          	jal	80005146 <OSSched>
    8000663e:	67a2                	ld	a5,8(sp)
    80006640:	0007a023          	sw	zero,0(a5)
    80006644:	04e15783          	lhu	a5,78(sp)
    80006648:	853e                	mv	a0,a5
    8000664a:	60e6                	ld	ra,88(sp)
    8000664c:	6125                	add	sp,sp,96
    8000664e:	8082                	ret

0000000080006650 <OSMutexPost>:
    80006650:	711d                	add	sp,sp,-96
    80006652:	ec86                	sd	ra,88(sp)
    80006654:	ec2a                	sd	a0,24(sp)
    80006656:	87ae                	mv	a5,a1
    80006658:	e432                	sd	a2,8(sp)
    8000665a:	00f11b23          	sh	a5,22(sp)
    8000665e:	e482                	sd	zero,72(sp)
    80006660:	00005797          	auipc	a5,0x5
    80006664:	2ac78793          	add	a5,a5,684 # 8000b90c <OSIntNestingCtr>
    80006668:	0007c783          	lbu	a5,0(a5)
    8000666c:	c799                	beqz	a5,8000667a <OSMutexPost+0x2a>
    8000666e:	67a2                	ld	a5,8(sp)
    80006670:	6719                	lui	a4,0x6
    80006672:	20e70713          	add	a4,a4,526 # 620e <CPU_MSTATUS_MIE+0x6206>
    80006676:	c398                	sw	a4,0(a5)
    80006678:	a411                	j	8000687c <OSMutexPost+0x22c>
    8000667a:	00005797          	auipc	a5,0x5
    8000667e:	29378793          	add	a5,a5,659 # 8000b90d <OSRunning>
    80006682:	0007c783          	lbu	a5,0(a5)
    80006686:	873e                	mv	a4,a5
    80006688:	4785                	li	a5,1
    8000668a:	00f70863          	beq	a4,a5,8000669a <OSMutexPost+0x4a>
    8000668e:	67a2                	ld	a5,8(sp)
    80006690:	6719                	lui	a4,0x6
    80006692:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80006696:	c398                	sw	a4,0(a5)
    80006698:	a2d5                	j	8000687c <OSMutexPost+0x22c>
    8000669a:	67e2                	ld	a5,24(sp)
    8000669c:	e799                	bnez	a5,800066aa <OSMutexPost+0x5a>
    8000669e:	67a2                	ld	a5,8(sp)
    800066a0:	6719                	lui	a4,0x6
    800066a2:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    800066a6:	c398                	sw	a4,0(a5)
    800066a8:	aad1                	j	8000687c <OSMutexPost+0x22c>
    800066aa:	01615783          	lhu	a5,22(sp)
    800066ae:	2781                	sext.w	a5,a5
    800066b0:	cb99                	beqz	a5,800066c6 <OSMutexPost+0x76>
    800066b2:	873e                	mv	a4,a5
    800066b4:	67a1                	lui	a5,0x8
    800066b6:	00f70863          	beq	a4,a5,800066c6 <OSMutexPost+0x76>
    800066ba:	67a2                	ld	a5,8(sp)
    800066bc:	6719                	lui	a4,0x6
    800066be:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800066c2:	c398                	sw	a4,0(a5)
    800066c4:	aa65                	j	8000687c <OSMutexPost+0x22c>
    800066c6:	0001                	nop
    800066c8:	67e2                	ld	a5,24(sp)
    800066ca:	439c                	lw	a5,0(a5)
    800066cc:	873e                	mv	a4,a5
    800066ce:	585457b7          	lui	a5,0x58545
    800066d2:	54d78793          	add	a5,a5,1357 # 5854554d <CPU_MSTATUS_MIE+0x58545545>
    800066d6:	00f70863          	beq	a4,a5,800066e6 <OSMutexPost+0x96>
    800066da:	67a2                	ld	a5,8(sp)
    800066dc:	6719                	lui	a4,0x6
    800066de:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    800066e2:	c398                	sw	a4,0(a5)
    800066e4:	aa61                	j	8000687c <OSMutexPost+0x22c>
    800066e6:	c29fa0ef          	jal	8000130e <CPU_SR_Save>
    800066ea:	e4aa                	sd	a0,72(sp)
    800066ec:	67e2                	ld	a5,24(sp)
    800066ee:	67b8                	ld	a4,72(a5)
    800066f0:	00005797          	auipc	a5,0x5
    800066f4:	2d878793          	add	a5,a5,728 # 8000b9c8 <OSTCBCurPtr>
    800066f8:	639c                	ld	a5,0(a5)
    800066fa:	00f70b63          	beq	a4,a5,80006710 <OSMutexPost+0xc0>
    800066fe:	6526                	ld	a0,72(sp)
    80006700:	c1bfa0ef          	jal	8000131a <CPU_SR_Restore>
    80006704:	67a2                	ld	a5,8(sp)
    80006706:	6715                	lui	a4,0x5
    80006708:	78170713          	add	a4,a4,1921 # 5781 <CPU_MSTATUS_MIE+0x5779>
    8000670c:	c398                	sw	a4,0(a5)
    8000670e:	a2bd                	j	8000687c <OSMutexPost+0x22c>
    80006710:	c282                	sw	zero,68(sp)
    80006712:	67e2                	ld	a5,24(sp)
    80006714:	0507c783          	lbu	a5,80(a5)
    80006718:	37fd                	addw	a5,a5,-1
    8000671a:	0ff7f713          	zext.b	a4,a5
    8000671e:	67e2                	ld	a5,24(sp)
    80006720:	04e78823          	sb	a4,80(a5)
    80006724:	67e2                	ld	a5,24(sp)
    80006726:	0507c783          	lbu	a5,80(a5)
    8000672a:	cb91                	beqz	a5,8000673e <OSMutexPost+0xee>
    8000672c:	6526                	ld	a0,72(sp)
    8000672e:	bedfa0ef          	jal	8000131a <CPU_SR_Restore>
    80006732:	67a2                	ld	a5,8(sp)
    80006734:	6715                	lui	a4,0x5
    80006736:	78370713          	add	a4,a4,1923 # 5783 <CPU_MSTATUS_MIE+0x577b>
    8000673a:	c398                	sw	a4,0(a5)
    8000673c:	a281                	j	8000687c <OSMutexPost+0x22c>
    8000673e:	00005797          	auipc	a5,0x5
    80006742:	28a78793          	add	a5,a5,650 # 8000b9c8 <OSTCBCurPtr>
    80006746:	639c                	ld	a5,0(a5)
    80006748:	65e2                	ld	a1,24(sp)
    8000674a:	853e                	mv	a0,a5
    8000674c:	24c000ef          	jal	80006998 <OS_MutexGrpRemove>
    80006750:	67e2                	ld	a5,24(sp)
    80006752:	07c1                	add	a5,a5,16
    80006754:	fc3e                	sd	a5,56(sp)
    80006756:	77e2                	ld	a5,56(sp)
    80006758:	639c                	ld	a5,0(a5)
    8000675a:	ef91                	bnez	a5,80006776 <OSMutexPost+0x126>
    8000675c:	67e2                	ld	a5,24(sp)
    8000675e:	0407b423          	sd	zero,72(a5)
    80006762:	67e2                	ld	a5,24(sp)
    80006764:	04078823          	sb	zero,80(a5)
    80006768:	6526                	ld	a0,72(sp)
    8000676a:	bb1fa0ef          	jal	8000131a <CPU_SR_Restore>
    8000676e:	67a2                	ld	a5,8(sp)
    80006770:	0007a023          	sw	zero,0(a5)
    80006774:	a221                	j	8000687c <OSMutexPost+0x22c>
    80006776:	00005797          	auipc	a5,0x5
    8000677a:	25278793          	add	a5,a5,594 # 8000b9c8 <OSTCBCurPtr>
    8000677e:	639c                	ld	a5,0(a5)
    80006780:	0737c703          	lbu	a4,115(a5)
    80006784:	00005797          	auipc	a5,0x5
    80006788:	24478793          	add	a5,a5,580 # 8000b9c8 <OSTCBCurPtr>
    8000678c:	639c                	ld	a5,0(a5)
    8000678e:	0747c783          	lbu	a5,116(a5)
    80006792:	0af70363          	beq	a4,a5,80006838 <OSMutexPost+0x1e8>
    80006796:	00005797          	auipc	a5,0x5
    8000679a:	23278793          	add	a5,a5,562 # 8000b9c8 <OSTCBCurPtr>
    8000679e:	639c                	ld	a5,0(a5)
    800067a0:	853e                	mv	a0,a5
    800067a2:	22a000ef          	jal	800069cc <OS_MutexGrpPrioFindHighest>
    800067a6:	87aa                	mv	a5,a0
    800067a8:	02f10ba3          	sb	a5,55(sp)
    800067ac:	00005797          	auipc	a5,0x5
    800067b0:	21c78793          	add	a5,a5,540 # 8000b9c8 <OSTCBCurPtr>
    800067b4:	639c                	ld	a5,0(a5)
    800067b6:	0747c783          	lbu	a5,116(a5)
    800067ba:	863e                	mv	a2,a5
    800067bc:	03714783          	lbu	a5,55(sp)
    800067c0:	0ff7f693          	zext.b	a3,a5
    800067c4:	0ff67713          	zext.b	a4,a2
    800067c8:	00d77363          	bgeu	a4,a3,800067ce <OSMutexPost+0x17e>
    800067cc:	87b2                	mv	a5,a2
    800067ce:	02f10ba3          	sb	a5,55(sp)
    800067d2:	00005797          	auipc	a5,0x5
    800067d6:	1f678793          	add	a5,a5,502 # 8000b9c8 <OSTCBCurPtr>
    800067da:	639c                	ld	a5,0(a5)
    800067dc:	0737c703          	lbu	a4,115(a5)
    800067e0:	03714783          	lbu	a5,55(sp)
    800067e4:	0ff7f793          	zext.b	a5,a5
    800067e8:	04f77863          	bgeu	a4,a5,80006838 <OSMutexPost+0x1e8>
    800067ec:	00005797          	auipc	a5,0x5
    800067f0:	1dc78793          	add	a5,a5,476 # 8000b9c8 <OSTCBCurPtr>
    800067f4:	639c                	ld	a5,0(a5)
    800067f6:	853e                	mv	a0,a5
    800067f8:	db4ff0ef          	jal	80005dac <OS_RdyListRemove>
    800067fc:	00005797          	auipc	a5,0x5
    80006800:	1cc78793          	add	a5,a5,460 # 8000b9c8 <OSTCBCurPtr>
    80006804:	639c                	ld	a5,0(a5)
    80006806:	03714703          	lbu	a4,55(sp)
    8000680a:	06e789a3          	sb	a4,115(a5)
    8000680e:	03714783          	lbu	a5,55(sp)
    80006812:	853e                	mv	a0,a5
    80006814:	383000ef          	jal	80007396 <OS_PrioInsert>
    80006818:	00005797          	auipc	a5,0x5
    8000681c:	1b078793          	add	a5,a5,432 # 8000b9c8 <OSTCBCurPtr>
    80006820:	639c                	ld	a5,0(a5)
    80006822:	853e                	mv	a0,a5
    80006824:	c7aff0ef          	jal	80005c9e <OS_RdyListInsertTail>
    80006828:	00005797          	auipc	a5,0x5
    8000682c:	11a78793          	add	a5,a5,282 # 8000b942 <OSPrioCur>
    80006830:	03714703          	lbu	a4,55(sp)
    80006834:	00e78023          	sb	a4,0(a5)
    80006838:	77e2                	ld	a5,56(sp)
    8000683a:	639c                	ld	a5,0(a5)
    8000683c:	f43e                	sd	a5,40(sp)
    8000683e:	67e2                	ld	a5,24(sp)
    80006840:	7722                	ld	a4,40(sp)
    80006842:	e7b8                	sd	a4,72(a5)
    80006844:	67e2                	ld	a5,24(sp)
    80006846:	4705                	li	a4,1
    80006848:	04e78823          	sb	a4,80(a5)
    8000684c:	65e2                	ld	a1,24(sp)
    8000684e:	7522                	ld	a0,40(sp)
    80006850:	12e000ef          	jal	8000697e <OS_MutexGrpAdd>
    80006854:	4796                	lw	a5,68(sp)
    80006856:	873e                	mv	a4,a5
    80006858:	4681                	li	a3,0
    8000685a:	4601                	li	a2,0
    8000685c:	75a2                	ld	a1,40(sp)
    8000685e:	6562                	ld	a0,24(sp)
    80006860:	a2eff0ef          	jal	80005a8e <OS_Post>
    80006864:	6526                	ld	a0,72(sp)
    80006866:	ab5fa0ef          	jal	8000131a <CPU_SR_Restore>
    8000686a:	01611783          	lh	a5,22(sp)
    8000686e:	0007c463          	bltz	a5,80006876 <OSMutexPost+0x226>
    80006872:	8d5fe0ef          	jal	80005146 <OSSched>
    80006876:	67a2                	ld	a5,8(sp)
    80006878:	0007a023          	sw	zero,0(a5)
    8000687c:	60e6                	ld	ra,88(sp)
    8000687e:	6125                	add	sp,sp,96
    80006880:	8082                	ret

0000000080006882 <OS_MutexClr>:
    80006882:	1101                	add	sp,sp,-32
    80006884:	ec06                	sd	ra,24(sp)
    80006886:	e42a                	sd	a0,8(sp)
    80006888:	67a2                	ld	a5,8(sp)
    8000688a:	454e5737          	lui	a4,0x454e5
    8000688e:	f4e70713          	add	a4,a4,-178 # 454e4f4e <CPU_MSTATUS_MIE+0x454e4f46>
    80006892:	c398                	sw	a4,0(a5)
    80006894:	67a2                	ld	a5,8(sp)
    80006896:	00005717          	auipc	a4,0x5
    8000689a:	c1a70713          	add	a4,a4,-998 # 8000b4b0 <CPU_CntLeadZerosTbl+0x1f0>
    8000689e:	e798                	sd	a4,8(a5)
    800068a0:	67a2                	ld	a5,8(sp)
    800068a2:	0407b023          	sd	zero,64(a5)
    800068a6:	67a2                	ld	a5,8(sp)
    800068a8:	0407b423          	sd	zero,72(a5)
    800068ac:	67a2                	ld	a5,8(sp)
    800068ae:	04078823          	sb	zero,80(a5)
    800068b2:	67a2                	ld	a5,8(sp)
    800068b4:	07c1                	add	a5,a5,16
    800068b6:	853e                	mv	a0,a5
    800068b8:	842ff0ef          	jal	800058fa <OS_PendListInit>
    800068bc:	0001                	nop
    800068be:	60e2                	ld	ra,24(sp)
    800068c0:	6105                	add	sp,sp,32
    800068c2:	8082                	ret

00000000800068c4 <OS_MutexDbgListAdd>:
    800068c4:	1141                	add	sp,sp,-16
    800068c6:	e42a                	sd	a0,8(sp)
    800068c8:	67a2                	ld	a5,8(sp)
    800068ca:	00005717          	auipc	a4,0x5
    800068ce:	bee70713          	add	a4,a4,-1042 # 8000b4b8 <CPU_CntLeadZerosTbl+0x1f8>
    800068d2:	ff98                	sd	a4,56(a5)
    800068d4:	67a2                	ld	a5,8(sp)
    800068d6:	0207b423          	sd	zero,40(a5)
    800068da:	00005797          	auipc	a5,0x5
    800068de:	05e78793          	add	a5,a5,94 # 8000b938 <OSMutexDbgListPtr>
    800068e2:	639c                	ld	a5,0(a5)
    800068e4:	e789                	bnez	a5,800068ee <OS_MutexDbgListAdd+0x2a>
    800068e6:	67a2                	ld	a5,8(sp)
    800068e8:	0207b823          	sd	zero,48(a5)
    800068ec:	a839                	j	8000690a <OS_MutexDbgListAdd+0x46>
    800068ee:	00005797          	auipc	a5,0x5
    800068f2:	04a78793          	add	a5,a5,74 # 8000b938 <OSMutexDbgListPtr>
    800068f6:	6398                	ld	a4,0(a5)
    800068f8:	67a2                	ld	a5,8(sp)
    800068fa:	fb98                	sd	a4,48(a5)
    800068fc:	00005797          	auipc	a5,0x5
    80006900:	03c78793          	add	a5,a5,60 # 8000b938 <OSMutexDbgListPtr>
    80006904:	639c                	ld	a5,0(a5)
    80006906:	6722                	ld	a4,8(sp)
    80006908:	f798                	sd	a4,40(a5)
    8000690a:	00005797          	auipc	a5,0x5
    8000690e:	02e78793          	add	a5,a5,46 # 8000b938 <OSMutexDbgListPtr>
    80006912:	6722                	ld	a4,8(sp)
    80006914:	e398                	sd	a4,0(a5)
    80006916:	0001                	nop
    80006918:	0141                	add	sp,sp,16
    8000691a:	8082                	ret

000000008000691c <OS_MutexDbgListRemove>:
    8000691c:	1101                	add	sp,sp,-32
    8000691e:	e42a                	sd	a0,8(sp)
    80006920:	67a2                	ld	a5,8(sp)
    80006922:	779c                	ld	a5,40(a5)
    80006924:	ec3e                	sd	a5,24(sp)
    80006926:	67a2                	ld	a5,8(sp)
    80006928:	7b9c                	ld	a5,48(a5)
    8000692a:	e83e                	sd	a5,16(sp)
    8000692c:	67e2                	ld	a5,24(sp)
    8000692e:	e385                	bnez	a5,8000694e <OS_MutexDbgListRemove+0x32>
    80006930:	00005797          	auipc	a5,0x5
    80006934:	00878793          	add	a5,a5,8 # 8000b938 <OSMutexDbgListPtr>
    80006938:	6742                	ld	a4,16(sp)
    8000693a:	e398                	sd	a4,0(a5)
    8000693c:	67c2                	ld	a5,16(sp)
    8000693e:	c781                	beqz	a5,80006946 <OS_MutexDbgListRemove+0x2a>
    80006940:	67c2                	ld	a5,16(sp)
    80006942:	0207b423          	sd	zero,40(a5)
    80006946:	67a2                	ld	a5,8(sp)
    80006948:	0207b823          	sd	zero,48(a5)
    8000694c:	a035                	j	80006978 <OS_MutexDbgListRemove+0x5c>
    8000694e:	67c2                	ld	a5,16(sp)
    80006950:	eb81                	bnez	a5,80006960 <OS_MutexDbgListRemove+0x44>
    80006952:	67e2                	ld	a5,24(sp)
    80006954:	0207b823          	sd	zero,48(a5)
    80006958:	67a2                	ld	a5,8(sp)
    8000695a:	0207b423          	sd	zero,40(a5)
    8000695e:	a829                	j	80006978 <OS_MutexDbgListRemove+0x5c>
    80006960:	67e2                	ld	a5,24(sp)
    80006962:	6742                	ld	a4,16(sp)
    80006964:	fb98                	sd	a4,48(a5)
    80006966:	67c2                	ld	a5,16(sp)
    80006968:	6762                	ld	a4,24(sp)
    8000696a:	f798                	sd	a4,40(a5)
    8000696c:	67a2                	ld	a5,8(sp)
    8000696e:	0207b823          	sd	zero,48(a5)
    80006972:	67a2                	ld	a5,8(sp)
    80006974:	0207b423          	sd	zero,40(a5)
    80006978:	0001                	nop
    8000697a:	6105                	add	sp,sp,32
    8000697c:	8082                	ret

000000008000697e <OS_MutexGrpAdd>:
    8000697e:	1141                	add	sp,sp,-16
    80006980:	e42a                	sd	a0,8(sp)
    80006982:	e02e                	sd	a1,0(sp)
    80006984:	67a2                	ld	a5,8(sp)
    80006986:	7fb8                	ld	a4,120(a5)
    80006988:	6782                	ld	a5,0(sp)
    8000698a:	e3b8                	sd	a4,64(a5)
    8000698c:	67a2                	ld	a5,8(sp)
    8000698e:	6702                	ld	a4,0(sp)
    80006990:	ffb8                	sd	a4,120(a5)
    80006992:	0001                	nop
    80006994:	0141                	add	sp,sp,16
    80006996:	8082                	ret

0000000080006998 <OS_MutexGrpRemove>:
    80006998:	1101                	add	sp,sp,-32
    8000699a:	e42a                	sd	a0,8(sp)
    8000699c:	e02e                	sd	a1,0(sp)
    8000699e:	67a2                	ld	a5,8(sp)
    800069a0:	07878793          	add	a5,a5,120
    800069a4:	ec3e                	sd	a5,24(sp)
    800069a6:	a031                	j	800069b2 <OS_MutexGrpRemove+0x1a>
    800069a8:	67e2                	ld	a5,24(sp)
    800069aa:	639c                	ld	a5,0(a5)
    800069ac:	04078793          	add	a5,a5,64
    800069b0:	ec3e                	sd	a5,24(sp)
    800069b2:	67e2                	ld	a5,24(sp)
    800069b4:	639c                	ld	a5,0(a5)
    800069b6:	6702                	ld	a4,0(sp)
    800069b8:	fef718e3          	bne	a4,a5,800069a8 <OS_MutexGrpRemove+0x10>
    800069bc:	67e2                	ld	a5,24(sp)
    800069be:	639c                	ld	a5,0(a5)
    800069c0:	63b8                	ld	a4,64(a5)
    800069c2:	67e2                	ld	a5,24(sp)
    800069c4:	e398                	sd	a4,0(a5)
    800069c6:	0001                	nop
    800069c8:	6105                	add	sp,sp,32
    800069ca:	8082                	ret

00000000800069cc <OS_MutexGrpPrioFindHighest>:
    800069cc:	7179                	add	sp,sp,-48
    800069ce:	e42a                	sd	a0,8(sp)
    800069d0:	03f00793          	li	a5,63
    800069d4:	02f103a3          	sb	a5,39(sp)
    800069d8:	67a2                	ld	a5,8(sp)
    800069da:	07878793          	add	a5,a5,120
    800069de:	f43e                	sd	a5,40(sp)
    800069e0:	a081                	j	80006a20 <OS_MutexGrpPrioFindHighest+0x54>
    800069e2:	77a2                	ld	a5,40(sp)
    800069e4:	639c                	ld	a5,0(a5)
    800069e6:	6b9c                	ld	a5,16(a5)
    800069e8:	ec3e                	sd	a5,24(sp)
    800069ea:	67e2                	ld	a5,24(sp)
    800069ec:	c78d                	beqz	a5,80006a16 <OS_MutexGrpPrioFindHighest+0x4a>
    800069ee:	67e2                	ld	a5,24(sp)
    800069f0:	0737c783          	lbu	a5,115(a5)
    800069f4:	00f10ba3          	sb	a5,23(sp)
    800069f8:	01714783          	lbu	a5,23(sp)
    800069fc:	873e                	mv	a4,a5
    800069fe:	02714783          	lbu	a5,39(sp)
    80006a02:	0ff77713          	zext.b	a4,a4
    80006a06:	0ff7f793          	zext.b	a5,a5
    80006a0a:	00f77663          	bgeu	a4,a5,80006a16 <OS_MutexGrpPrioFindHighest+0x4a>
    80006a0e:	01714783          	lbu	a5,23(sp)
    80006a12:	02f103a3          	sb	a5,39(sp)
    80006a16:	77a2                	ld	a5,40(sp)
    80006a18:	639c                	ld	a5,0(a5)
    80006a1a:	04078793          	add	a5,a5,64
    80006a1e:	f43e                	sd	a5,40(sp)
    80006a20:	77a2                	ld	a5,40(sp)
    80006a22:	639c                	ld	a5,0(a5)
    80006a24:	ffdd                	bnez	a5,800069e2 <OS_MutexGrpPrioFindHighest+0x16>
    80006a26:	02714783          	lbu	a5,39(sp)
    80006a2a:	853e                	mv	a0,a5
    80006a2c:	6145                	add	sp,sp,48
    80006a2e:	8082                	ret

0000000080006a30 <OS_MutexGrpPostAll>:
    80006a30:	715d                	add	sp,sp,-80
    80006a32:	e486                	sd	ra,72(sp)
    80006a34:	e42a                	sd	a0,8(sp)
    80006a36:	67a2                	ld	a5,8(sp)
    80006a38:	7fbc                	ld	a5,120(a5)
    80006a3a:	fc3e                	sd	a5,56(sp)
    80006a3c:	a8b1                	j	80006a98 <OS_MutexGrpPostAll+0x68>
    80006a3e:	77e2                	ld	a5,56(sp)
    80006a40:	63bc                	ld	a5,64(a5)
    80006a42:	f83e                	sd	a5,48(sp)
    80006a44:	d602                	sw	zero,44(sp)
    80006a46:	75e2                	ld	a1,56(sp)
    80006a48:	6522                	ld	a0,8(sp)
    80006a4a:	f4fff0ef          	jal	80006998 <OS_MutexGrpRemove>
    80006a4e:	77e2                	ld	a5,56(sp)
    80006a50:	07c1                	add	a5,a5,16
    80006a52:	f03e                	sd	a5,32(sp)
    80006a54:	7782                	ld	a5,32(sp)
    80006a56:	639c                	ld	a5,0(a5)
    80006a58:	eb81                	bnez	a5,80006a68 <OS_MutexGrpPostAll+0x38>
    80006a5a:	77e2                	ld	a5,56(sp)
    80006a5c:	04078823          	sb	zero,80(a5)
    80006a60:	77e2                	ld	a5,56(sp)
    80006a62:	0407b423          	sd	zero,72(a5)
    80006a66:	a03d                	j	80006a94 <OS_MutexGrpPostAll+0x64>
    80006a68:	7782                	ld	a5,32(sp)
    80006a6a:	639c                	ld	a5,0(a5)
    80006a6c:	ec3e                	sd	a5,24(sp)
    80006a6e:	77e2                	ld	a5,56(sp)
    80006a70:	6722                	ld	a4,8(sp)
    80006a72:	e7b8                	sd	a4,72(a5)
    80006a74:	77e2                	ld	a5,56(sp)
    80006a76:	4705                	li	a4,1
    80006a78:	04e78823          	sb	a4,80(a5)
    80006a7c:	75e2                	ld	a1,56(sp)
    80006a7e:	6562                	ld	a0,24(sp)
    80006a80:	effff0ef          	jal	8000697e <OS_MutexGrpAdd>
    80006a84:	57b2                	lw	a5,44(sp)
    80006a86:	873e                	mv	a4,a5
    80006a88:	4681                	li	a3,0
    80006a8a:	4601                	li	a2,0
    80006a8c:	65e2                	ld	a1,24(sp)
    80006a8e:	7562                	ld	a0,56(sp)
    80006a90:	ffffe0ef          	jal	80005a8e <OS_Post>
    80006a94:	77c2                	ld	a5,48(sp)
    80006a96:	fc3e                	sd	a5,56(sp)
    80006a98:	77e2                	ld	a5,56(sp)
    80006a9a:	f3d5                	bnez	a5,80006a3e <OS_MutexGrpPostAll+0xe>
    80006a9c:	0001                	nop
    80006a9e:	0001                	nop
    80006aa0:	60a6                	ld	ra,72(sp)
    80006aa2:	6161                	add	sp,sp,80
    80006aa4:	8082                	ret

0000000080006aa6 <OS_TickInit>:
    80006aa6:	1141                	add	sp,sp,-16
    80006aa8:	e42a                	sd	a0,8(sp)
    80006aaa:	67a2                	ld	a5,8(sp)
    80006aac:	0007a023          	sw	zero,0(a5)
    80006ab0:	00005797          	auipc	a5,0x5
    80006ab4:	eec78793          	add	a5,a5,-276 # 8000b99c <OSTickCtr>
    80006ab8:	0007a023          	sw	zero,0(a5)
    80006abc:	00017797          	auipc	a5,0x17
    80006ac0:	ac478793          	add	a5,a5,-1340 # 8001d580 <OSTickList>
    80006ac4:	0007b023          	sd	zero,0(a5)
    80006ac8:	00017797          	auipc	a5,0x17
    80006acc:	ab878793          	add	a5,a5,-1352 # 8001d580 <OSTickList>
    80006ad0:	00079423          	sh	zero,8(a5)
    80006ad4:	00017797          	auipc	a5,0x17
    80006ad8:	aac78793          	add	a5,a5,-1364 # 8001d580 <OSTickList>
    80006adc:	00079523          	sh	zero,10(a5)
    80006ae0:	0001                	nop
    80006ae2:	0141                	add	sp,sp,16
    80006ae4:	8082                	ret

0000000080006ae6 <OS_TickUpdate>:
    80006ae6:	7179                	add	sp,sp,-48
    80006ae8:	f406                	sd	ra,40(sp)
    80006aea:	87aa                	mv	a5,a0
    80006aec:	c63e                	sw	a5,12(sp)
    80006aee:	ec02                	sd	zero,24(sp)
    80006af0:	81ffa0ef          	jal	8000130e <CPU_SR_Save>
    80006af4:	ec2a                	sd	a0,24(sp)
    80006af6:	00005797          	auipc	a5,0x5
    80006afa:	ea678793          	add	a5,a5,-346 # 8000b99c <OSTickCtr>
    80006afe:	439c                	lw	a5,0(a5)
    80006b00:	4732                	lw	a4,12(sp)
    80006b02:	9fb9                	addw	a5,a5,a4
    80006b04:	0007871b          	sext.w	a4,a5
    80006b08:	00005797          	auipc	a5,0x5
    80006b0c:	e9478793          	add	a5,a5,-364 # 8000b99c <OSTickCtr>
    80006b10:	c398                	sw	a4,0(a5)
    80006b12:	47b2                	lw	a5,12(sp)
    80006b14:	853e                	mv	a0,a5
    80006b16:	380000ef          	jal	80006e96 <OS_TickListUpdate>
    80006b1a:	6562                	ld	a0,24(sp)
    80006b1c:	ffefa0ef          	jal	8000131a <CPU_SR_Restore>
    80006b20:	0001                	nop
    80006b22:	70a2                	ld	ra,40(sp)
    80006b24:	6145                	add	sp,sp,48
    80006b26:	8082                	ret

0000000080006b28 <OS_TickListInsert>:
    80006b28:	715d                	add	sp,sp,-80
    80006b2a:	ec2a                	sd	a0,24(sp)
    80006b2c:	87ae                	mv	a5,a1
    80006b2e:	8736                	mv	a4,a3
    80006b30:	ca3e                	sw	a5,20(sp)
    80006b32:	87b2                	mv	a5,a2
    80006b34:	c83e                	sw	a5,16(sp)
    80006b36:	87ba                	mv	a5,a4
    80006b38:	c63e                	sw	a5,12(sp)
    80006b3a:	47b2                	lw	a5,12(sp)
    80006b3c:	873e                	mv	a4,a5
    80006b3e:	47c2                	lw	a5,16(sp)
    80006b40:	9fb9                	addw	a5,a5,a4
    80006b42:	0007871b          	sext.w	a4,a5
    80006b46:	00005797          	auipc	a5,0x5
    80006b4a:	e5678793          	add	a5,a5,-426 # 8000b99c <OSTickCtr>
    80006b4e:	439c                	lw	a5,0(a5)
    80006b50:	46d2                	lw	a3,20(sp)
    80006b52:	9fb5                	addw	a5,a5,a3
    80006b54:	2781                	sext.w	a5,a5
    80006b56:	40f707bb          	subw	a5,a4,a5
    80006b5a:	de3e                	sw	a5,60(sp)
    80006b5c:	57f2                	lw	a5,60(sp)
    80006b5e:	2781                	sext.w	a5,a5
    80006b60:	e791                	bnez	a5,80006b6c <OS_TickListInsert+0x44>
    80006b62:	67e2                	ld	a5,24(sp)
    80006b64:	0807a823          	sw	zero,144(a5)
    80006b68:	4781                	li	a5,0
    80006b6a:	a2a1                	j	80006cb2 <OS_TickListInsert+0x18a>
    80006b6c:	00017797          	auipc	a5,0x17
    80006b70:	a1478793          	add	a5,a5,-1516 # 8001d580 <OSTickList>
    80006b74:	f83e                	sd	a5,48(sp)
    80006b76:	77c2                	ld	a5,48(sp)
    80006b78:	639c                	ld	a5,0(a5)
    80006b7a:	e785                	bnez	a5,80006ba2 <OS_TickListInsert+0x7a>
    80006b7c:	67e2                	ld	a5,24(sp)
    80006b7e:	5772                	lw	a4,60(sp)
    80006b80:	08e7a823          	sw	a4,144(a5)
    80006b84:	67e2                	ld	a5,24(sp)
    80006b86:	0207b823          	sd	zero,48(a5)
    80006b8a:	67e2                	ld	a5,24(sp)
    80006b8c:	0207bc23          	sd	zero,56(a5)
    80006b90:	77c2                	ld	a5,48(sp)
    80006b92:	6762                	ld	a4,24(sp)
    80006b94:	e398                	sd	a4,0(a5)
    80006b96:	77c2                	ld	a5,48(sp)
    80006b98:	4705                	li	a4,1
    80006b9a:	00e79423          	sh	a4,8(a5)
    80006b9e:	4785                	li	a5,1
    80006ba0:	aa09                	j	80006cb2 <OS_TickListInsert+0x18a>
    80006ba2:	77c2                	ld	a5,48(sp)
    80006ba4:	0087d783          	lhu	a5,8(a5)
    80006ba8:	2785                	addw	a5,a5,1
    80006baa:	03079713          	sll	a4,a5,0x30
    80006bae:	9341                	srl	a4,a4,0x30
    80006bb0:	77c2                	ld	a5,48(sp)
    80006bb2:	00e79423          	sh	a4,8(a5)
    80006bb6:	77c2                	ld	a5,48(sp)
    80006bb8:	639c                	ld	a5,0(a5)
    80006bba:	e0be                	sd	a5,64(sp)
    80006bbc:	6786                	ld	a5,64(sp)
    80006bbe:	0907a783          	lw	a5,144(a5)
    80006bc2:	4752                	lw	a4,20(sp)
    80006bc4:	9f99                	subw	a5,a5,a4
    80006bc6:	d63e                	sw	a5,44(sp)
    80006bc8:	57f2                	lw	a5,60(sp)
    80006bca:	873e                	mv	a4,a5
    80006bcc:	57b2                	lw	a5,44(sp)
    80006bce:	2701                	sext.w	a4,a4
    80006bd0:	2781                	sext.w	a5,a5
    80006bd2:	04f77163          	bgeu	a4,a5,80006c14 <OS_TickListInsert+0xec>
    80006bd6:	6786                	ld	a5,64(sp)
    80006bd8:	7f9c                	ld	a5,56(a5)
    80006bda:	ef8d                	bnez	a5,80006c14 <OS_TickListInsert+0xec>
    80006bdc:	67e2                	ld	a5,24(sp)
    80006bde:	5772                	lw	a4,60(sp)
    80006be0:	08e7a823          	sw	a4,144(a5)
    80006be4:	57b2                	lw	a5,44(sp)
    80006be6:	873e                	mv	a4,a5
    80006be8:	57f2                	lw	a5,60(sp)
    80006bea:	40f707bb          	subw	a5,a4,a5
    80006bee:	0007871b          	sext.w	a4,a5
    80006bf2:	6786                	ld	a5,64(sp)
    80006bf4:	08e7a823          	sw	a4,144(a5)
    80006bf8:	67e2                	ld	a5,24(sp)
    80006bfa:	0207bc23          	sd	zero,56(a5)
    80006bfe:	67e2                	ld	a5,24(sp)
    80006c00:	6706                	ld	a4,64(sp)
    80006c02:	fb98                	sd	a4,48(a5)
    80006c04:	6786                	ld	a5,64(sp)
    80006c06:	6762                	ld	a4,24(sp)
    80006c08:	ff98                	sd	a4,56(a5)
    80006c0a:	77c2                	ld	a5,48(sp)
    80006c0c:	6762                	ld	a4,24(sp)
    80006c0e:	e398                	sd	a4,0(a5)
    80006c10:	4785                	li	a5,1
    80006c12:	a045                	j	80006cb2 <OS_TickListInsert+0x18a>
    80006c14:	57f2                	lw	a5,60(sp)
    80006c16:	873e                	mv	a4,a5
    80006c18:	57b2                	lw	a5,44(sp)
    80006c1a:	40f707bb          	subw	a5,a4,a5
    80006c1e:	de3e                	sw	a5,60(sp)
    80006c20:	6786                	ld	a5,64(sp)
    80006c22:	e4be                	sd	a5,72(sp)
    80006c24:	67a6                	ld	a5,72(sp)
    80006c26:	7b9c                	ld	a5,48(a5)
    80006c28:	e0be                	sd	a5,64(sp)
    80006c2a:	a829                	j	80006c44 <OS_TickListInsert+0x11c>
    80006c2c:	6786                	ld	a5,64(sp)
    80006c2e:	0907a783          	lw	a5,144(a5)
    80006c32:	5772                	lw	a4,60(sp)
    80006c34:	40f707bb          	subw	a5,a4,a5
    80006c38:	de3e                	sw	a5,60(sp)
    80006c3a:	6786                	ld	a5,64(sp)
    80006c3c:	e4be                	sd	a5,72(sp)
    80006c3e:	6786                	ld	a5,64(sp)
    80006c40:	7b9c                	ld	a5,48(a5)
    80006c42:	e0be                	sd	a5,64(sp)
    80006c44:	6786                	ld	a5,64(sp)
    80006c46:	cb81                	beqz	a5,80006c56 <OS_TickListInsert+0x12e>
    80006c48:	6786                	ld	a5,64(sp)
    80006c4a:	0907a703          	lw	a4,144(a5)
    80006c4e:	57f2                	lw	a5,60(sp)
    80006c50:	2781                	sext.w	a5,a5
    80006c52:	fce7fde3          	bgeu	a5,a4,80006c2c <OS_TickListInsert+0x104>
    80006c56:	6786                	ld	a5,64(sp)
    80006c58:	cf9d                	beqz	a5,80006c96 <OS_TickListInsert+0x16e>
    80006c5a:	6786                	ld	a5,64(sp)
    80006c5c:	7f9c                	ld	a5,56(a5)
    80006c5e:	e4be                	sd	a5,72(sp)
    80006c60:	67e2                	ld	a5,24(sp)
    80006c62:	5772                	lw	a4,60(sp)
    80006c64:	08e7a823          	sw	a4,144(a5)
    80006c68:	67e2                	ld	a5,24(sp)
    80006c6a:	6726                	ld	a4,72(sp)
    80006c6c:	ff98                	sd	a4,56(a5)
    80006c6e:	67e2                	ld	a5,24(sp)
    80006c70:	6706                	ld	a4,64(sp)
    80006c72:	fb98                	sd	a4,48(a5)
    80006c74:	6786                	ld	a5,64(sp)
    80006c76:	0907a783          	lw	a5,144(a5)
    80006c7a:	5772                	lw	a4,60(sp)
    80006c7c:	9f99                	subw	a5,a5,a4
    80006c7e:	0007871b          	sext.w	a4,a5
    80006c82:	6786                	ld	a5,64(sp)
    80006c84:	08e7a823          	sw	a4,144(a5)
    80006c88:	6786                	ld	a5,64(sp)
    80006c8a:	6762                	ld	a4,24(sp)
    80006c8c:	ff98                	sd	a4,56(a5)
    80006c8e:	67a6                	ld	a5,72(sp)
    80006c90:	6762                	ld	a4,24(sp)
    80006c92:	fb98                	sd	a4,48(a5)
    80006c94:	a831                	j	80006cb0 <OS_TickListInsert+0x188>
    80006c96:	67e2                	ld	a5,24(sp)
    80006c98:	5772                	lw	a4,60(sp)
    80006c9a:	08e7a823          	sw	a4,144(a5)
    80006c9e:	67e2                	ld	a5,24(sp)
    80006ca0:	6726                	ld	a4,72(sp)
    80006ca2:	ff98                	sd	a4,56(a5)
    80006ca4:	67e2                	ld	a5,24(sp)
    80006ca6:	0207b823          	sd	zero,48(a5)
    80006caa:	67a6                	ld	a5,72(sp)
    80006cac:	6762                	ld	a4,24(sp)
    80006cae:	fb98                	sd	a4,48(a5)
    80006cb0:	4785                	li	a5,1
    80006cb2:	853e                	mv	a0,a5
    80006cb4:	6161                	add	sp,sp,80
    80006cb6:	8082                	ret

0000000080006cb8 <OS_TickListInsertDly>:
    80006cb8:	7139                	add	sp,sp,-64
    80006cba:	fc06                	sd	ra,56(sp)
    80006cbc:	ec2a                	sd	a0,24(sp)
    80006cbe:	87ae                	mv	a5,a1
    80006cc0:	8732                	mv	a4,a2
    80006cc2:	e436                	sd	a3,8(sp)
    80006cc4:	ca3e                	sw	a5,20(sp)
    80006cc6:	87ba                	mv	a5,a4
    80006cc8:	00f11923          	sh	a5,18(sp)
    80006ccc:	d402                	sw	zero,40(sp)
    80006cce:	01215783          	lhu	a5,18(sp)
    80006cd2:	0007871b          	sext.w	a4,a5
    80006cd6:	4791                	li	a5,4
    80006cd8:	00f71463          	bne	a4,a5,80006ce0 <OS_TickListInsertDly+0x28>
    80006cdc:	d602                	sw	zero,44(sp)
    80006cde:	a055                	j	80006d82 <OS_TickListInsertDly+0xca>
    80006ce0:	01215783          	lhu	a5,18(sp)
    80006ce4:	0007871b          	sext.w	a4,a5
    80006ce8:	47a1                	li	a5,8
    80006cea:	08f71663          	bne	a4,a5,80006d76 <OS_TickListInsertDly+0xbe>
    80006cee:	47d2                	lw	a5,20(sp)
    80006cf0:	2781                	sext.w	a5,a5
    80006cf2:	e799                	bnez	a5,80006d00 <OS_TickListInsertDly+0x48>
    80006cf4:	67a2                	ld	a5,8(sp)
    80006cf6:	671d                	lui	a4,0x7
    80006cf8:	27e70713          	add	a4,a4,638 # 727e <CPU_MSTATUS_MIE+0x7276>
    80006cfc:	c398                	sw	a4,0(a5)
    80006cfe:	a0c9                	j	80006dc0 <OS_TickListInsertDly+0x108>
    80006d00:	67e2                	ld	a5,24(sp)
    80006d02:	0947a783          	lw	a5,148(a5)
    80006d06:	d63e                	sw	a5,44(sp)
    80006d08:	00005797          	auipc	a5,0x5
    80006d0c:	c9478793          	add	a5,a5,-876 # 8000b99c <OSTickCtr>
    80006d10:	439c                	lw	a5,0(a5)
    80006d12:	5732                	lw	a4,44(sp)
    80006d14:	9f99                	subw	a5,a5,a4
    80006d16:	d23e                	sw	a5,36(sp)
    80006d18:	5792                	lw	a5,36(sp)
    80006d1a:	873e                	mv	a4,a5
    80006d1c:	47d2                	lw	a5,20(sp)
    80006d1e:	2701                	sext.w	a4,a4
    80006d20:	2781                	sext.w	a5,a5
    80006d22:	02f76f63          	bltu	a4,a5,80006d60 <OS_TickListInsertDly+0xa8>
    80006d26:	5792                	lw	a5,36(sp)
    80006d28:	873e                	mv	a4,a5
    80006d2a:	47d2                	lw	a5,20(sp)
    80006d2c:	02f757bb          	divuw	a5,a4,a5
    80006d30:	2781                	sext.w	a5,a5
    80006d32:	4752                	lw	a4,20(sp)
    80006d34:	02f707bb          	mulw	a5,a4,a5
    80006d38:	2781                	sext.w	a5,a5
    80006d3a:	5732                	lw	a4,44(sp)
    80006d3c:	9fb9                	addw	a5,a5,a4
    80006d3e:	d63e                	sw	a5,44(sp)
    80006d40:	5792                	lw	a5,36(sp)
    80006d42:	873e                	mv	a4,a5
    80006d44:	47d2                	lw	a5,20(sp)
    80006d46:	02f777bb          	remuw	a5,a4,a5
    80006d4a:	2781                	sext.w	a5,a5
    80006d4c:	c791                	beqz	a5,80006d58 <OS_TickListInsertDly+0xa0>
    80006d4e:	57b2                	lw	a5,44(sp)
    80006d50:	873e                	mv	a4,a5
    80006d52:	47d2                	lw	a5,20(sp)
    80006d54:	9fb9                	addw	a5,a5,a4
    80006d56:	d63e                	sw	a5,44(sp)
    80006d58:	67e2                	ld	a5,24(sp)
    80006d5a:	5732                	lw	a4,44(sp)
    80006d5c:	08e7aa23          	sw	a4,148(a5)
    80006d60:	67e2                	ld	a5,24(sp)
    80006d62:	0947a783          	lw	a5,148(a5)
    80006d66:	4752                	lw	a4,20(sp)
    80006d68:	9fb9                	addw	a5,a5,a4
    80006d6a:	0007871b          	sext.w	a4,a5
    80006d6e:	67e2                	ld	a5,24(sp)
    80006d70:	08e7aa23          	sw	a4,148(a5)
    80006d74:	a039                	j	80006d82 <OS_TickListInsertDly+0xca>
    80006d76:	00005797          	auipc	a5,0x5
    80006d7a:	c2678793          	add	a5,a5,-986 # 8000b99c <OSTickCtr>
    80006d7e:	439c                	lw	a5,0(a5)
    80006d80:	d63e                	sw	a5,44(sp)
    80006d82:	46d2                	lw	a3,20(sp)
    80006d84:	5732                	lw	a4,44(sp)
    80006d86:	57a2                	lw	a5,40(sp)
    80006d88:	863a                	mv	a2,a4
    80006d8a:	85be                	mv	a1,a5
    80006d8c:	6562                	ld	a0,24(sp)
    80006d8e:	d9bff0ef          	jal	80006b28 <OS_TickListInsert>
    80006d92:	87aa                	mv	a5,a0
    80006d94:	02f101a3          	sb	a5,35(sp)
    80006d98:	02314783          	lbu	a5,35(sp)
    80006d9c:	0ff7f713          	zext.b	a4,a5
    80006da0:	4785                	li	a5,1
    80006da2:	00f71a63          	bne	a4,a5,80006db6 <OS_TickListInsertDly+0xfe>
    80006da6:	67e2                	ld	a5,24(sp)
    80006da8:	4705                	li	a4,1
    80006daa:	06e78923          	sb	a4,114(a5)
    80006dae:	67a2                	ld	a5,8(sp)
    80006db0:	0007a023          	sw	zero,0(a5)
    80006db4:	a031                	j	80006dc0 <OS_TickListInsertDly+0x108>
    80006db6:	67a2                	ld	a5,8(sp)
    80006db8:	671d                	lui	a4,0x7
    80006dba:	27e70713          	add	a4,a4,638 # 727e <CPU_MSTATUS_MIE+0x7276>
    80006dbe:	c398                	sw	a4,0(a5)
    80006dc0:	70e2                	ld	ra,56(sp)
    80006dc2:	6121                	add	sp,sp,64
    80006dc4:	8082                	ret

0000000080006dc6 <OS_TickListRemove>:
    80006dc6:	7179                	add	sp,sp,-48
    80006dc8:	e42a                	sd	a0,8(sp)
    80006dca:	67a2                	ld	a5,8(sp)
    80006dcc:	7f9c                	ld	a5,56(a5)
    80006dce:	f43e                	sd	a5,40(sp)
    80006dd0:	67a2                	ld	a5,8(sp)
    80006dd2:	7b9c                	ld	a5,48(a5)
    80006dd4:	f03e                	sd	a5,32(sp)
    80006dd6:	00016797          	auipc	a5,0x16
    80006dda:	7aa78793          	add	a5,a5,1962 # 8001d580 <OSTickList>
    80006dde:	ec3e                	sd	a5,24(sp)
    80006de0:	77a2                	ld	a5,40(sp)
    80006de2:	e3a5                	bnez	a5,80006e42 <OS_TickListRemove+0x7c>
    80006de4:	7782                	ld	a5,32(sp)
    80006de6:	eb99                	bnez	a5,80006dfc <OS_TickListRemove+0x36>
    80006de8:	67e2                	ld	a5,24(sp)
    80006dea:	0007b023          	sd	zero,0(a5)
    80006dee:	67e2                	ld	a5,24(sp)
    80006df0:	00079423          	sh	zero,8(a5)
    80006df4:	67a2                	ld	a5,8(sp)
    80006df6:	0807a823          	sw	zero,144(a5)
    80006dfa:	a859                	j	80006e90 <OS_TickListRemove+0xca>
    80006dfc:	7782                	ld	a5,32(sp)
    80006dfe:	0207bc23          	sd	zero,56(a5)
    80006e02:	7782                	ld	a5,32(sp)
    80006e04:	0907a703          	lw	a4,144(a5)
    80006e08:	67a2                	ld	a5,8(sp)
    80006e0a:	0907a783          	lw	a5,144(a5)
    80006e0e:	9fb9                	addw	a5,a5,a4
    80006e10:	0007871b          	sext.w	a4,a5
    80006e14:	7782                	ld	a5,32(sp)
    80006e16:	08e7a823          	sw	a4,144(a5)
    80006e1a:	67e2                	ld	a5,24(sp)
    80006e1c:	7702                	ld	a4,32(sp)
    80006e1e:	e398                	sd	a4,0(a5)
    80006e20:	67e2                	ld	a5,24(sp)
    80006e22:	0087d783          	lhu	a5,8(a5)
    80006e26:	37fd                	addw	a5,a5,-1
    80006e28:	03079713          	sll	a4,a5,0x30
    80006e2c:	9341                	srl	a4,a4,0x30
    80006e2e:	67e2                	ld	a5,24(sp)
    80006e30:	00e79423          	sh	a4,8(a5)
    80006e34:	67a2                	ld	a5,8(sp)
    80006e36:	0207b823          	sd	zero,48(a5)
    80006e3a:	67a2                	ld	a5,8(sp)
    80006e3c:	0807a823          	sw	zero,144(a5)
    80006e40:	a881                	j	80006e90 <OS_TickListRemove+0xca>
    80006e42:	77a2                	ld	a5,40(sp)
    80006e44:	7702                	ld	a4,32(sp)
    80006e46:	fb98                	sd	a4,48(a5)
    80006e48:	7782                	ld	a5,32(sp)
    80006e4a:	c385                	beqz	a5,80006e6a <OS_TickListRemove+0xa4>
    80006e4c:	7782                	ld	a5,32(sp)
    80006e4e:	7722                	ld	a4,40(sp)
    80006e50:	ff98                	sd	a4,56(a5)
    80006e52:	7782                	ld	a5,32(sp)
    80006e54:	0907a703          	lw	a4,144(a5)
    80006e58:	67a2                	ld	a5,8(sp)
    80006e5a:	0907a783          	lw	a5,144(a5)
    80006e5e:	9fb9                	addw	a5,a5,a4
    80006e60:	0007871b          	sext.w	a4,a5
    80006e64:	7782                	ld	a5,32(sp)
    80006e66:	08e7a823          	sw	a4,144(a5)
    80006e6a:	67a2                	ld	a5,8(sp)
    80006e6c:	0207bc23          	sd	zero,56(a5)
    80006e70:	67e2                	ld	a5,24(sp)
    80006e72:	0087d783          	lhu	a5,8(a5)
    80006e76:	37fd                	addw	a5,a5,-1
    80006e78:	03079713          	sll	a4,a5,0x30
    80006e7c:	9341                	srl	a4,a4,0x30
    80006e7e:	67e2                	ld	a5,24(sp)
    80006e80:	00e79423          	sh	a4,8(a5)
    80006e84:	67a2                	ld	a5,8(sp)
    80006e86:	0207b823          	sd	zero,48(a5)
    80006e8a:	67a2                	ld	a5,8(sp)
    80006e8c:	0807a823          	sw	zero,144(a5)
    80006e90:	0001                	nop
    80006e92:	6145                	add	sp,sp,48
    80006e94:	8082                	ret

0000000080006e96 <OS_TickListUpdate>:
    80006e96:	715d                	add	sp,sp,-80
    80006e98:	e486                	sd	ra,72(sp)
    80006e9a:	87aa                	mv	a5,a0
    80006e9c:	c63e                	sw	a5,12(sp)
    80006e9e:	02011b23          	sh	zero,54(sp)
    80006ea2:	00016797          	auipc	a5,0x16
    80006ea6:	6de78793          	add	a5,a5,1758 # 8001d580 <OSTickList>
    80006eaa:	f03e                	sd	a5,32(sp)
    80006eac:	7782                	ld	a5,32(sp)
    80006eae:	639c                	ld	a5,0(a5)
    80006eb0:	fc3e                	sd	a5,56(sp)
    80006eb2:	77e2                	ld	a5,56(sp)
    80006eb4:	1c078463          	beqz	a5,8000707c <OS_TickListUpdate+0x1e6>
    80006eb8:	77e2                	ld	a5,56(sp)
    80006eba:	0907a703          	lw	a4,144(a5)
    80006ebe:	47b2                	lw	a5,12(sp)
    80006ec0:	2781                	sext.w	a5,a5
    80006ec2:	00e7ed63          	bltu	a5,a4,80006edc <OS_TickListUpdate+0x46>
    80006ec6:	77e2                	ld	a5,56(sp)
    80006ec8:	0907a783          	lw	a5,144(a5)
    80006ecc:	4732                	lw	a4,12(sp)
    80006ece:	40f707bb          	subw	a5,a4,a5
    80006ed2:	c63e                	sw	a5,12(sp)
    80006ed4:	77e2                	ld	a5,56(sp)
    80006ed6:	0807a823          	sw	zero,144(a5)
    80006eda:	aa61                	j	80007072 <OS_TickListUpdate+0x1dc>
    80006edc:	77e2                	ld	a5,56(sp)
    80006ede:	0907a783          	lw	a5,144(a5)
    80006ee2:	4732                	lw	a4,12(sp)
    80006ee4:	9f99                	subw	a5,a5,a4
    80006ee6:	0007871b          	sext.w	a4,a5
    80006eea:	77e2                	ld	a5,56(sp)
    80006eec:	08e7a823          	sw	a4,144(a5)
    80006ef0:	a249                	j	80007072 <OS_TickListUpdate+0x1dc>
    80006ef2:	03615783          	lhu	a5,54(sp)
    80006ef6:	2785                	addw	a5,a5,1
    80006ef8:	02f11b23          	sh	a5,54(sp)
    80006efc:	77e2                	ld	a5,56(sp)
    80006efe:	0727c783          	lbu	a5,114(a5)
    80006f02:	0007871b          	sext.w	a4,a5
    80006f06:	86ba                	mv	a3,a4
    80006f08:	4785                	li	a5,1
    80006f0a:	00f68663          	beq	a3,a5,80006f16 <OS_TickListUpdate+0x80>
    80006f0e:	4795                	li	a5,5
    80006f10:	00f70a63          	beq	a4,a5,80006f24 <OS_TickListUpdate+0x8e>
    80006f14:	a829                	j	80006f2e <OS_TickListUpdate+0x98>
    80006f16:	77e2                	ld	a5,56(sp)
    80006f18:	06078923          	sb	zero,114(a5)
    80006f1c:	7562                	ld	a0,56(sp)
    80006f1e:	cbffe0ef          	jal	80005bdc <OS_RdyListInsert>
    80006f22:	a0d5                	j	80007006 <OS_TickListUpdate+0x170>
    80006f24:	77e2                	ld	a5,56(sp)
    80006f26:	4711                	li	a4,4
    80006f28:	06e78923          	sb	a4,114(a5)
    80006f2c:	a8e9                	j	80007006 <OS_TickListUpdate+0x170>
    80006f2e:	f402                	sd	zero,40(sp)
    80006f30:	77e2                	ld	a5,56(sp)
    80006f32:	0707c783          	lbu	a5,112(a5)
    80006f36:	873e                	mv	a4,a5
    80006f38:	4791                	li	a5,4
    80006f3a:	00f71663          	bne	a4,a5,80006f46 <OS_TickListUpdate+0xb0>
    80006f3e:	77e2                	ld	a5,56(sp)
    80006f40:	77bc                	ld	a5,104(a5)
    80006f42:	67bc                	ld	a5,72(a5)
    80006f44:	f43e                	sd	a5,40(sp)
    80006f46:	77e2                	ld	a5,56(sp)
    80006f48:	0a07b023          	sd	zero,160(a5)
    80006f4c:	77e2                	ld	a5,56(sp)
    80006f4e:	0a079423          	sh	zero,168(a5)
    80006f52:	7562                	ld	a0,56(sp)
    80006f54:	a9bfe0ef          	jal	800059ee <OS_PendListRemove>
    80006f58:	77e2                	ld	a5,56(sp)
    80006f5a:	0727c783          	lbu	a5,114(a5)
    80006f5e:	0007871b          	sext.w	a4,a5
    80006f62:	86ba                	mv	a3,a4
    80006f64:	478d                	li	a5,3
    80006f66:	00f68663          	beq	a3,a5,80006f72 <OS_TickListUpdate+0xdc>
    80006f6a:	479d                	li	a5,7
    80006f6c:	00f70a63          	beq	a4,a5,80006f80 <OS_TickListUpdate+0xea>
    80006f70:	a829                	j	80006f8a <OS_TickListUpdate+0xf4>
    80006f72:	7562                	ld	a0,56(sp)
    80006f74:	c69fe0ef          	jal	80005bdc <OS_RdyListInsert>
    80006f78:	77e2                	ld	a5,56(sp)
    80006f7a:	06078923          	sb	zero,114(a5)
    80006f7e:	a031                	j	80006f8a <OS_TickListUpdate+0xf4>
    80006f80:	77e2                	ld	a5,56(sp)
    80006f82:	4711                	li	a4,4
    80006f84:	06e78923          	sb	a4,114(a5)
    80006f88:	0001                	nop
    80006f8a:	77e2                	ld	a5,56(sp)
    80006f8c:	470d                	li	a4,3
    80006f8e:	06e788a3          	sb	a4,113(a5)
    80006f92:	77e2                	ld	a5,56(sp)
    80006f94:	06078823          	sb	zero,112(a5)
    80006f98:	77a2                	ld	a5,40(sp)
    80006f9a:	c7ad                	beqz	a5,80007004 <OS_TickListUpdate+0x16e>
    80006f9c:	77a2                	ld	a5,40(sp)
    80006f9e:	0737c703          	lbu	a4,115(a5)
    80006fa2:	77a2                	ld	a5,40(sp)
    80006fa4:	0747c783          	lbu	a5,116(a5)
    80006fa8:	04f70e63          	beq	a4,a5,80007004 <OS_TickListUpdate+0x16e>
    80006fac:	77a2                	ld	a5,40(sp)
    80006fae:	0737c703          	lbu	a4,115(a5)
    80006fb2:	77e2                	ld	a5,56(sp)
    80006fb4:	0737c783          	lbu	a5,115(a5)
    80006fb8:	04f71663          	bne	a4,a5,80007004 <OS_TickListUpdate+0x16e>
    80006fbc:	7522                	ld	a0,40(sp)
    80006fbe:	a0fff0ef          	jal	800069cc <OS_MutexGrpPrioFindHighest>
    80006fc2:	87aa                	mv	a5,a0
    80006fc4:	00f10fa3          	sb	a5,31(sp)
    80006fc8:	77a2                	ld	a5,40(sp)
    80006fca:	0747c783          	lbu	a5,116(a5)
    80006fce:	863e                	mv	a2,a5
    80006fd0:	01f14783          	lbu	a5,31(sp)
    80006fd4:	0ff7f693          	zext.b	a3,a5
    80006fd8:	0ff67713          	zext.b	a4,a2
    80006fdc:	00d77363          	bgeu	a4,a3,80006fe2 <OS_TickListUpdate+0x14c>
    80006fe0:	87b2                	mv	a5,a2
    80006fe2:	00f10fa3          	sb	a5,31(sp)
    80006fe6:	77a2                	ld	a5,40(sp)
    80006fe8:	0737c703          	lbu	a4,115(a5)
    80006fec:	01f14783          	lbu	a5,31(sp)
    80006ff0:	0ff7f793          	zext.b	a5,a5
    80006ff4:	00e78863          	beq	a5,a4,80007004 <OS_TickListUpdate+0x16e>
    80006ff8:	01f14783          	lbu	a5,31(sp)
    80006ffc:	85be                	mv	a1,a5
    80006ffe:	7522                	ld	a0,40(sp)
    80007000:	c43fd0ef          	jal	80004c42 <OS_TaskChangePrio>
    80007004:	0001                	nop
    80007006:	77e2                	ld	a5,56(sp)
    80007008:	7b98                	ld	a4,48(a5)
    8000700a:	7782                	ld	a5,32(sp)
    8000700c:	e398                	sd	a4,0(a5)
    8000700e:	7782                	ld	a5,32(sp)
    80007010:	639c                	ld	a5,0(a5)
    80007012:	fc3e                	sd	a5,56(sp)
    80007014:	77e2                	ld	a5,56(sp)
    80007016:	e789                	bnez	a5,80007020 <OS_TickListUpdate+0x18a>
    80007018:	7782                	ld	a5,32(sp)
    8000701a:	00079423          	sh	zero,8(a5)
    8000701e:	a8b9                	j	8000707c <OS_TickListUpdate+0x1e6>
    80007020:	7782                	ld	a5,32(sp)
    80007022:	0087d783          	lhu	a5,8(a5)
    80007026:	37fd                	addw	a5,a5,-1
    80007028:	03079713          	sll	a4,a5,0x30
    8000702c:	9341                	srl	a4,a4,0x30
    8000702e:	7782                	ld	a5,32(sp)
    80007030:	00e79423          	sh	a4,8(a5)
    80007034:	77e2                	ld	a5,56(sp)
    80007036:	0207bc23          	sd	zero,56(a5)
    8000703a:	77e2                	ld	a5,56(sp)
    8000703c:	0907a703          	lw	a4,144(a5)
    80007040:	47b2                	lw	a5,12(sp)
    80007042:	2781                	sext.w	a5,a5
    80007044:	00e7ed63          	bltu	a5,a4,8000705e <OS_TickListUpdate+0x1c8>
    80007048:	77e2                	ld	a5,56(sp)
    8000704a:	0907a783          	lw	a5,144(a5)
    8000704e:	4732                	lw	a4,12(sp)
    80007050:	40f707bb          	subw	a5,a4,a5
    80007054:	c63e                	sw	a5,12(sp)
    80007056:	77e2                	ld	a5,56(sp)
    80007058:	0807a823          	sw	zero,144(a5)
    8000705c:	a819                	j	80007072 <OS_TickListUpdate+0x1dc>
    8000705e:	77e2                	ld	a5,56(sp)
    80007060:	0907a783          	lw	a5,144(a5)
    80007064:	4732                	lw	a4,12(sp)
    80007066:	9f99                	subw	a5,a5,a4
    80007068:	0007871b          	sext.w	a4,a5
    8000706c:	77e2                	ld	a5,56(sp)
    8000706e:	08e7a823          	sw	a4,144(a5)
    80007072:	77e2                	ld	a5,56(sp)
    80007074:	0907a783          	lw	a5,144(a5)
    80007078:	e6078de3          	beqz	a5,80006ef2 <OS_TickListUpdate+0x5c>
    8000707c:	7782                	ld	a5,32(sp)
    8000707e:	03615703          	lhu	a4,54(sp)
    80007082:	00e79523          	sh	a4,10(a5)
    80007086:	0001                	nop
    80007088:	60a6                	ld	ra,72(sp)
    8000708a:	6161                	add	sp,sp,80
    8000708c:	8082                	ret

000000008000708e <OS_Dbg_Init>:
    8000708e:	1101                	add	sp,sp,-32
    80007090:	00004797          	auipc	a5,0x4
    80007094:	02078793          	add	a5,a5,32 # 8000b0b0 <OSDbg_DbgEn>
    80007098:	ec3e                	sd	a5,24(sp)
    8000709a:	00004797          	auipc	a5,0x4
    8000709e:	07678793          	add	a5,a5,118 # 8000b110 <OSDbg_DataSize>
    800070a2:	e43e                	sd	a5,8(sp)
    800070a4:	00004797          	auipc	a5,0x4
    800070a8:	00d78793          	add	a5,a5,13 # 8000b0b1 <OSDbg_ArgChkEn>
    800070ac:	ec3e                	sd	a5,24(sp)
    800070ae:	00004797          	auipc	a5,0x4
    800070b2:	00478793          	add	a5,a5,4 # 8000b0b2 <OSDbg_AppHooksEn>
    800070b6:	ec3e                	sd	a5,24(sp)
    800070b8:	00004797          	auipc	a5,0x4
    800070bc:	ffc78793          	add	a5,a5,-4 # 8000b0b4 <OSDbg_EndiannessTest>
    800070c0:	e43e                	sd	a5,8(sp)
    800070c2:	00004797          	auipc	a5,0x4
    800070c6:	ff678793          	add	a5,a5,-10 # 8000b0b8 <OSDbg_CalledFromISRChkEn>
    800070ca:	ec3e                	sd	a5,24(sp)
    800070cc:	00004797          	auipc	a5,0x4
    800070d0:	3f478793          	add	a5,a5,1012 # 8000b4c0 <OSDbg_FlagGrp>
    800070d4:	e83e                	sd	a5,16(sp)
    800070d6:	00004797          	auipc	a5,0x4
    800070da:	fe378793          	add	a5,a5,-29 # 8000b0b9 <OSDbg_FlagEn>
    800070de:	ec3e                	sd	a5,24(sp)
    800070e0:	00004797          	auipc	a5,0x4
    800070e4:	fda78793          	add	a5,a5,-38 # 8000b0ba <OSDbg_FlagDelEn>
    800070e8:	ec3e                	sd	a5,24(sp)
    800070ea:	00004797          	auipc	a5,0x4
    800070ee:	fd178793          	add	a5,a5,-47 # 8000b0bb <OSDbg_FlagModeClrEn>
    800070f2:	ec3e                	sd	a5,24(sp)
    800070f4:	00004797          	auipc	a5,0x4
    800070f8:	fc878793          	add	a5,a5,-56 # 8000b0bc <OSDbg_FlagPendAbortEn>
    800070fc:	ec3e                	sd	a5,24(sp)
    800070fe:	00004797          	auipc	a5,0x4
    80007102:	fc078793          	add	a5,a5,-64 # 8000b0be <OSDbg_FlagGrpSize>
    80007106:	e83e                	sd	a5,16(sp)
    80007108:	00004797          	auipc	a5,0x4
    8000710c:	fb878793          	add	a5,a5,-72 # 8000b0c0 <OSDbg_FlagWidth>
    80007110:	e83e                	sd	a5,16(sp)
    80007112:	00004797          	auipc	a5,0x4
    80007116:	3f678793          	add	a5,a5,1014 # 8000b508 <OSDbg_Mem>
    8000711a:	e83e                	sd	a5,16(sp)
    8000711c:	00004797          	auipc	a5,0x4
    80007120:	fa678793          	add	a5,a5,-90 # 8000b0c2 <OSDbg_MemEn>
    80007124:	ec3e                	sd	a5,24(sp)
    80007126:	00004797          	auipc	a5,0x4
    8000712a:	f9e78793          	add	a5,a5,-98 # 8000b0c4 <OSDbg_MemSize>
    8000712e:	e83e                	sd	a5,16(sp)
    80007130:	00004797          	auipc	a5,0x4
    80007134:	f9678793          	add	a5,a5,-106 # 8000b0c6 <OSDbg_MsgEn>
    80007138:	ec3e                	sd	a5,24(sp)
    8000713a:	00004797          	auipc	a5,0x4
    8000713e:	f8e78793          	add	a5,a5,-114 # 8000b0c8 <OSDbg_MsgSize>
    80007142:	e83e                	sd	a5,16(sp)
    80007144:	00004797          	auipc	a5,0x4
    80007148:	f8678793          	add	a5,a5,-122 # 8000b0ca <OSDbg_MsgPoolSize>
    8000714c:	e83e                	sd	a5,16(sp)
    8000714e:	00004797          	auipc	a5,0x4
    80007152:	f7e78793          	add	a5,a5,-130 # 8000b0cc <OSDbg_MsgQSize>
    80007156:	e83e                	sd	a5,16(sp)
    80007158:	00004797          	auipc	a5,0x4
    8000715c:	3e878793          	add	a5,a5,1000 # 8000b540 <OSDbg_Mutex>
    80007160:	e83e                	sd	a5,16(sp)
    80007162:	00004797          	auipc	a5,0x4
    80007166:	f6c78793          	add	a5,a5,-148 # 8000b0ce <OSDbg_MutexEn>
    8000716a:	ec3e                	sd	a5,24(sp)
    8000716c:	00004797          	auipc	a5,0x4
    80007170:	f6378793          	add	a5,a5,-157 # 8000b0cf <OSDbg_MutexDelEn>
    80007174:	ec3e                	sd	a5,24(sp)
    80007176:	00004797          	auipc	a5,0x4
    8000717a:	f5a78793          	add	a5,a5,-166 # 8000b0d0 <OSDbg_MutexPendAbortEn>
    8000717e:	ec3e                	sd	a5,24(sp)
    80007180:	00004797          	auipc	a5,0x4
    80007184:	f5278793          	add	a5,a5,-174 # 8000b0d2 <OSDbg_MutexSize>
    80007188:	e83e                	sd	a5,16(sp)
    8000718a:	00004797          	auipc	a5,0x4
    8000718e:	f4a78793          	add	a5,a5,-182 # 8000b0d4 <OSDbg_ObjTypeChkEn>
    80007192:	ec3e                	sd	a5,24(sp)
    80007194:	00004797          	auipc	a5,0x4
    80007198:	f4178793          	add	a5,a5,-191 # 8000b0d5 <OSDbg_ObjCreatedChkEn>
    8000719c:	ec3e                	sd	a5,24(sp)
    8000719e:	00004797          	auipc	a5,0x4
    800071a2:	f3878793          	add	a5,a5,-200 # 8000b0d6 <OSDbg_PendListSize>
    800071a6:	e83e                	sd	a5,16(sp)
    800071a8:	00004797          	auipc	a5,0x4
    800071ac:	f3078793          	add	a5,a5,-208 # 8000b0d8 <OSDbg_PendObjSize>
    800071b0:	e83e                	sd	a5,16(sp)
    800071b2:	00004797          	auipc	a5,0x4
    800071b6:	f2878793          	add	a5,a5,-216 # 8000b0da <OSDbg_PrioMax>
    800071ba:	e83e                	sd	a5,16(sp)
    800071bc:	00004797          	auipc	a5,0x4
    800071c0:	f2078793          	add	a5,a5,-224 # 8000b0dc <OSDbg_PrioTblSize>
    800071c4:	e83e                	sd	a5,16(sp)
    800071c6:	00004797          	auipc	a5,0x4
    800071ca:	f1878793          	add	a5,a5,-232 # 8000b0de <OSDbg_PtrSize>
    800071ce:	e83e                	sd	a5,16(sp)
    800071d0:	00004797          	auipc	a5,0x4
    800071d4:	3c878793          	add	a5,a5,968 # 8000b598 <OSDbg_Q>
    800071d8:	e83e                	sd	a5,16(sp)
    800071da:	00004797          	auipc	a5,0x4
    800071de:	f0678793          	add	a5,a5,-250 # 8000b0e0 <OSDbg_QEn>
    800071e2:	ec3e                	sd	a5,24(sp)
    800071e4:	00004797          	auipc	a5,0x4
    800071e8:	efd78793          	add	a5,a5,-259 # 8000b0e1 <OSDbg_QDelEn>
    800071ec:	ec3e                	sd	a5,24(sp)
    800071ee:	00004797          	auipc	a5,0x4
    800071f2:	ef478793          	add	a5,a5,-268 # 8000b0e2 <OSDbg_QFlushEn>
    800071f6:	ec3e                	sd	a5,24(sp)
    800071f8:	00004797          	auipc	a5,0x4
    800071fc:	eeb78793          	add	a5,a5,-277 # 8000b0e3 <OSDbg_QPendAbortEn>
    80007200:	ec3e                	sd	a5,24(sp)
    80007202:	00004797          	auipc	a5,0x4
    80007206:	ee278793          	add	a5,a5,-286 # 8000b0e4 <OSDbg_QSize>
    8000720a:	e83e                	sd	a5,16(sp)
    8000720c:	00004797          	auipc	a5,0x4
    80007210:	eda78793          	add	a5,a5,-294 # 8000b0e6 <OSDbg_SchedRoundRobinEn>
    80007214:	e83e                	sd	a5,16(sp)
    80007216:	00004797          	auipc	a5,0x4
    8000721a:	3da78793          	add	a5,a5,986 # 8000b5f0 <OSDbg_Sem>
    8000721e:	e83e                	sd	a5,16(sp)
    80007220:	00004797          	auipc	a5,0x4
    80007224:	ec778793          	add	a5,a5,-313 # 8000b0e7 <OSDbg_SemEn>
    80007228:	ec3e                	sd	a5,24(sp)
    8000722a:	00004797          	auipc	a5,0x4
    8000722e:	ebe78793          	add	a5,a5,-322 # 8000b0e8 <OSDbg_SemDelEn>
    80007232:	ec3e                	sd	a5,24(sp)
    80007234:	00004797          	auipc	a5,0x4
    80007238:	eb578793          	add	a5,a5,-331 # 8000b0e9 <OSDbg_SemPendAbortEn>
    8000723c:	ec3e                	sd	a5,24(sp)
    8000723e:	00004797          	auipc	a5,0x4
    80007242:	eac78793          	add	a5,a5,-340 # 8000b0ea <OSDbg_SemSetEn>
    80007246:	e83e                	sd	a5,16(sp)
    80007248:	00004797          	auipc	a5,0x4
    8000724c:	ea478793          	add	a5,a5,-348 # 8000b0ec <OSDbg_SemSize>
    80007250:	e83e                	sd	a5,16(sp)
    80007252:	00004797          	auipc	a5,0x4
    80007256:	e9c78793          	add	a5,a5,-356 # 8000b0ee <OSDbg_RdyList>
    8000725a:	e83e                	sd	a5,16(sp)
    8000725c:	00004797          	auipc	a5,0x4
    80007260:	e9478793          	add	a5,a5,-364 # 8000b0f0 <OSDbg_RdyListSize>
    80007264:	e43e                	sd	a5,8(sp)
    80007266:	00004797          	auipc	a5,0x4
    8000726a:	e8e78793          	add	a5,a5,-370 # 8000b0f4 <OSDbg_StkWidth>
    8000726e:	e83e                	sd	a5,16(sp)
    80007270:	00004797          	auipc	a5,0x4
    80007274:	e8578793          	add	a5,a5,-379 # 8000b0f5 <OSDbg_StatTaskEn>
    80007278:	ec3e                	sd	a5,24(sp)
    8000727a:	00004797          	auipc	a5,0x4
    8000727e:	e7c78793          	add	a5,a5,-388 # 8000b0f6 <OSDbg_StatTaskStkChkEn>
    80007282:	ec3e                	sd	a5,24(sp)
    80007284:	00004797          	auipc	a5,0x4
    80007288:	e7378793          	add	a5,a5,-397 # 8000b0f7 <OSDbg_TaskChangePrioEn>
    8000728c:	ec3e                	sd	a5,24(sp)
    8000728e:	00004797          	auipc	a5,0x4
    80007292:	e6a78793          	add	a5,a5,-406 # 8000b0f8 <OSDbg_TaskDelEn>
    80007296:	ec3e                	sd	a5,24(sp)
    80007298:	00004797          	auipc	a5,0x4
    8000729c:	e6178793          	add	a5,a5,-415 # 8000b0f9 <OSDbg_TaskQEn>
    800072a0:	ec3e                	sd	a5,24(sp)
    800072a2:	00004797          	auipc	a5,0x4
    800072a6:	e5878793          	add	a5,a5,-424 # 8000b0fa <OSDbg_TaskQPendAbortEn>
    800072aa:	ec3e                	sd	a5,24(sp)
    800072ac:	00004797          	auipc	a5,0x4
    800072b0:	e4f78793          	add	a5,a5,-433 # 8000b0fb <OSDbg_TaskProfileEn>
    800072b4:	ec3e                	sd	a5,24(sp)
    800072b6:	00004797          	auipc	a5,0x4
    800072ba:	e4678793          	add	a5,a5,-442 # 8000b0fc <OSDbg_TaskRegTblSize>
    800072be:	e83e                	sd	a5,16(sp)
    800072c0:	00004797          	auipc	a5,0x4
    800072c4:	e3e78793          	add	a5,a5,-450 # 8000b0fe <OSDbg_TaskSemPendAbortEn>
    800072c8:	ec3e                	sd	a5,24(sp)
    800072ca:	00004797          	auipc	a5,0x4
    800072ce:	e3578793          	add	a5,a5,-459 # 8000b0ff <OSDbg_TaskSuspendEn>
    800072d2:	ec3e                	sd	a5,24(sp)
    800072d4:	00004797          	auipc	a5,0x4
    800072d8:	e2c78793          	add	a5,a5,-468 # 8000b100 <OSDbg_TCBSize>
    800072dc:	e83e                	sd	a5,16(sp)
    800072de:	00004797          	auipc	a5,0x4
    800072e2:	e2478793          	add	a5,a5,-476 # 8000b102 <OSDbg_TickListSize>
    800072e6:	e83e                	sd	a5,16(sp)
    800072e8:	00004797          	auipc	a5,0x4
    800072ec:	e1c78793          	add	a5,a5,-484 # 8000b104 <OSDbg_TimeDlyHMSMEn>
    800072f0:	ec3e                	sd	a5,24(sp)
    800072f2:	00004797          	auipc	a5,0x4
    800072f6:	e1378793          	add	a5,a5,-493 # 8000b105 <OSDbg_TimeDlyResumeEn>
    800072fa:	ec3e                	sd	a5,24(sp)
    800072fc:	00004797          	auipc	a5,0x4
    80007300:	e0a78793          	add	a5,a5,-502 # 8000b106 <OSDbg_TLS_TblSize>
    80007304:	e83e                	sd	a5,16(sp)
    80007306:	00004797          	auipc	a5,0x4
    8000730a:	33278793          	add	a5,a5,818 # 8000b638 <OSDbg_Tmr>
    8000730e:	e83e                	sd	a5,16(sp)
    80007310:	00004797          	auipc	a5,0x4
    80007314:	df878793          	add	a5,a5,-520 # 8000b108 <OSDbg_TmrEn>
    80007318:	ec3e                	sd	a5,24(sp)
    8000731a:	00004797          	auipc	a5,0x4
    8000731e:	def78793          	add	a5,a5,-529 # 8000b109 <OSDbg_TmrDelEn>
    80007322:	ec3e                	sd	a5,24(sp)
    80007324:	00004797          	auipc	a5,0x4
    80007328:	de678793          	add	a5,a5,-538 # 8000b10a <OSDbg_TmrSize>
    8000732c:	e83e                	sd	a5,16(sp)
    8000732e:	00004797          	auipc	a5,0x4
    80007332:	dde78793          	add	a5,a5,-546 # 8000b10c <OSDbg_VersionNbr>
    80007336:	e83e                	sd	a5,16(sp)
    80007338:	67e2                	ld	a5,24(sp)
    8000733a:	ec3e                	sd	a5,24(sp)
    8000733c:	67c2                	ld	a5,16(sp)
    8000733e:	e83e                	sd	a5,16(sp)
    80007340:	67a2                	ld	a5,8(sp)
    80007342:	e43e                	sd	a5,8(sp)
    80007344:	0001                	nop
    80007346:	6105                	add	sp,sp,32
    80007348:	8082                	ret

000000008000734a <OS_PrioInit>:
    8000734a:	1141                	add	sp,sp,-16
    8000734c:	e402                	sd	zero,8(sp)
    8000734e:	a829                	j	80007368 <OS_PrioInit+0x1e>
    80007350:	00004717          	auipc	a4,0x4
    80007354:	5f870713          	add	a4,a4,1528 # 8000b948 <OSPrioTbl>
    80007358:	67a2                	ld	a5,8(sp)
    8000735a:	078e                	sll	a5,a5,0x3
    8000735c:	97ba                	add	a5,a5,a4
    8000735e:	0007b023          	sd	zero,0(a5)
    80007362:	67a2                	ld	a5,8(sp)
    80007364:	0785                	add	a5,a5,1
    80007366:	e43e                	sd	a5,8(sp)
    80007368:	67a2                	ld	a5,8(sp)
    8000736a:	d3fd                	beqz	a5,80007350 <OS_PrioInit+0x6>
    8000736c:	0001                	nop
    8000736e:	0001                	nop
    80007370:	0141                	add	sp,sp,16
    80007372:	8082                	ret

0000000080007374 <OS_PrioGetHighest>:
    80007374:	1141                	add	sp,sp,-16
    80007376:	e406                	sd	ra,8(sp)
    80007378:	00004797          	auipc	a5,0x4
    8000737c:	5d078793          	add	a5,a5,1488 # 8000b948 <OSPrioTbl>
    80007380:	639c                	ld	a5,0(a5)
    80007382:	853e                	mv	a0,a5
    80007384:	fa5f90ef          	jal	80001328 <CPU_CntLeadZeros>
    80007388:	87aa                	mv	a5,a0
    8000738a:	0ff7f793          	zext.b	a5,a5
    8000738e:	853e                	mv	a0,a5
    80007390:	60a2                	ld	ra,8(sp)
    80007392:	0141                	add	sp,sp,16
    80007394:	8082                	ret

0000000080007396 <OS_PrioInsert>:
    80007396:	1141                	add	sp,sp,-16
    80007398:	87aa                	mv	a5,a0
    8000739a:	00f107a3          	sb	a5,15(sp)
    8000739e:	00004797          	auipc	a5,0x4
    800073a2:	5aa78793          	add	a5,a5,1450 # 8000b948 <OSPrioTbl>
    800073a6:	6398                	ld	a4,0(a5)
    800073a8:	00f14783          	lbu	a5,15(sp)
    800073ac:	2781                	sext.w	a5,a5
    800073ae:	86be                	mv	a3,a5
    800073b0:	57fd                	li	a5,-1
    800073b2:	17fe                	sll	a5,a5,0x3f
    800073b4:	00d7d7b3          	srl	a5,a5,a3
    800073b8:	8f5d                	or	a4,a4,a5
    800073ba:	00004797          	auipc	a5,0x4
    800073be:	58e78793          	add	a5,a5,1422 # 8000b948 <OSPrioTbl>
    800073c2:	e398                	sd	a4,0(a5)
    800073c4:	0001                	nop
    800073c6:	0141                	add	sp,sp,16
    800073c8:	8082                	ret

00000000800073ca <OS_PrioRemove>:
    800073ca:	1141                	add	sp,sp,-16
    800073cc:	87aa                	mv	a5,a0
    800073ce:	00f107a3          	sb	a5,15(sp)
    800073d2:	00004797          	auipc	a5,0x4
    800073d6:	57678793          	add	a5,a5,1398 # 8000b948 <OSPrioTbl>
    800073da:	6398                	ld	a4,0(a5)
    800073dc:	00f14783          	lbu	a5,15(sp)
    800073e0:	2781                	sext.w	a5,a5
    800073e2:	86be                	mv	a3,a5
    800073e4:	57fd                	li	a5,-1
    800073e6:	17fe                	sll	a5,a5,0x3f
    800073e8:	00d7d7b3          	srl	a5,a5,a3
    800073ec:	fff7c793          	not	a5,a5
    800073f0:	8f7d                	and	a4,a4,a5
    800073f2:	00004797          	auipc	a5,0x4
    800073f6:	55678793          	add	a5,a5,1366 # 8000b948 <OSPrioTbl>
    800073fa:	e398                	sd	a4,0(a5)
    800073fc:	0001                	nop
    800073fe:	0141                	add	sp,sp,16
    80007400:	8082                	ret

0000000080007402 <OSTimeDly>:
    80007402:	7179                	add	sp,sp,-48
    80007404:	f406                	sd	ra,40(sp)
    80007406:	87aa                	mv	a5,a0
    80007408:	872e                	mv	a4,a1
    8000740a:	e032                	sd	a2,0(sp)
    8000740c:	c63e                	sw	a5,12(sp)
    8000740e:	87ba                	mv	a5,a4
    80007410:	00f11523          	sh	a5,10(sp)
    80007414:	ec02                	sd	zero,24(sp)
    80007416:	00004797          	auipc	a5,0x4
    8000741a:	4f678793          	add	a5,a5,1270 # 8000b90c <OSIntNestingCtr>
    8000741e:	0007c783          	lbu	a5,0(a5)
    80007422:	c799                	beqz	a5,80007430 <OSTimeDly+0x2e>
    80007424:	6782                	ld	a5,0(sp)
    80007426:	671d                	lui	a4,0x7
    80007428:	27570713          	add	a4,a4,629 # 7275 <CPU_MSTATUS_MIE+0x726d>
    8000742c:	c398                	sw	a4,0(a5)
    8000742e:	a87d                	j	800074ec <OSTimeDly+0xea>
    80007430:	00004797          	auipc	a5,0x4
    80007434:	4dd78793          	add	a5,a5,1245 # 8000b90d <OSRunning>
    80007438:	0007c783          	lbu	a5,0(a5)
    8000743c:	873e                	mv	a4,a5
    8000743e:	4785                	li	a5,1
    80007440:	00f70863          	beq	a4,a5,80007450 <OSTimeDly+0x4e>
    80007444:	6782                	ld	a5,0(sp)
    80007446:	6719                	lui	a4,0x6
    80007448:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    8000744c:	c398                	sw	a4,0(a5)
    8000744e:	a879                	j	800074ec <OSTimeDly+0xea>
    80007450:	00004797          	auipc	a5,0x4
    80007454:	50a78793          	add	a5,a5,1290 # 8000b95a <OSSchedLockNestingCtr>
    80007458:	0007c783          	lbu	a5,0(a5)
    8000745c:	c799                	beqz	a5,8000746a <OSTimeDly+0x68>
    8000745e:	6782                	ld	a5,0(sp)
    80007460:	671d                	lui	a4,0x7
    80007462:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80007466:	c398                	sw	a4,0(a5)
    80007468:	a051                	j	800074ec <OSTimeDly+0xea>
    8000746a:	00a15783          	lhu	a5,10(sp)
    8000746e:	2781                	sext.w	a5,a5
    80007470:	0007871b          	sext.w	a4,a5
    80007474:	86ba                	mv	a3,a4
    80007476:	47a1                	li	a5,8
    80007478:	00d7b7b3          	sltu	a5,a5,a3
    8000747c:	0ff7f793          	zext.b	a5,a5
    80007480:	eb99                	bnez	a5,80007496 <OSTimeDly+0x94>
    80007482:	11500793          	li	a5,277
    80007486:	00e7d7b3          	srl	a5,a5,a4
    8000748a:	8b85                	and	a5,a5,1
    8000748c:	00f037b3          	snez	a5,a5
    80007490:	0ff7f793          	zext.b	a5,a5
    80007494:	e799                	bnez	a5,800074a2 <OSTimeDly+0xa0>
    80007496:	6782                	ld	a5,0(sp)
    80007498:	6719                	lui	a4,0x6
    8000749a:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    8000749e:	c398                	sw	a4,0(a5)
    800074a0:	a0b1                	j	800074ec <OSTimeDly+0xea>
    800074a2:	0001                	nop
    800074a4:	e6bf90ef          	jal	8000130e <CPU_SR_Save>
    800074a8:	ec2a                	sd	a0,24(sp)
    800074aa:	00004797          	auipc	a5,0x4
    800074ae:	51e78793          	add	a5,a5,1310 # 8000b9c8 <OSTCBCurPtr>
    800074b2:	639c                	ld	a5,0(a5)
    800074b4:	00a15603          	lhu	a2,10(sp)
    800074b8:	4732                	lw	a4,12(sp)
    800074ba:	6682                	ld	a3,0(sp)
    800074bc:	85ba                	mv	a1,a4
    800074be:	853e                	mv	a0,a5
    800074c0:	ff8ff0ef          	jal	80006cb8 <OS_TickListInsertDly>
    800074c4:	6782                	ld	a5,0(sp)
    800074c6:	439c                	lw	a5,0(a5)
    800074c8:	c789                	beqz	a5,800074d2 <OSTimeDly+0xd0>
    800074ca:	6562                	ld	a0,24(sp)
    800074cc:	e4ff90ef          	jal	8000131a <CPU_SR_Restore>
    800074d0:	a831                	j	800074ec <OSTimeDly+0xea>
    800074d2:	00004797          	auipc	a5,0x4
    800074d6:	4f678793          	add	a5,a5,1270 # 8000b9c8 <OSTCBCurPtr>
    800074da:	639c                	ld	a5,0(a5)
    800074dc:	853e                	mv	a0,a5
    800074de:	8cffe0ef          	jal	80005dac <OS_RdyListRemove>
    800074e2:	6562                	ld	a0,24(sp)
    800074e4:	e37f90ef          	jal	8000131a <CPU_SR_Restore>
    800074e8:	c5ffd0ef          	jal	80005146 <OSSched>
    800074ec:	70a2                	ld	ra,40(sp)
    800074ee:	6145                	add	sp,sp,48
    800074f0:	8082                	ret

00000000800074f2 <OSTimeDlyHMSM>:
    800074f2:	715d                	add	sp,sp,-80
    800074f4:	e486                	sd	ra,72(sp)
    800074f6:	e43e                	sd	a5,8(sp)
    800074f8:	87aa                	mv	a5,a0
    800074fa:	00f11f23          	sh	a5,30(sp)
    800074fe:	87ae                	mv	a5,a1
    80007500:	00f11e23          	sh	a5,28(sp)
    80007504:	87b2                	mv	a5,a2
    80007506:	00f11d23          	sh	a5,26(sp)
    8000750a:	87b6                	mv	a5,a3
    8000750c:	ca3e                	sw	a5,20(sp)
    8000750e:	87ba                	mv	a5,a4
    80007510:	00f11c23          	sh	a5,24(sp)
    80007514:	fc02                	sd	zero,56(sp)
    80007516:	00004797          	auipc	a5,0x4
    8000751a:	3f678793          	add	a5,a5,1014 # 8000b90c <OSIntNestingCtr>
    8000751e:	0007c783          	lbu	a5,0(a5)
    80007522:	c799                	beqz	a5,80007530 <OSTimeDlyHMSM+0x3e>
    80007524:	67a2                	ld	a5,8(sp)
    80007526:	671d                	lui	a4,0x7
    80007528:	27570713          	add	a4,a4,629 # 7275 <CPU_MSTATUS_MIE+0x726d>
    8000752c:	c398                	sw	a4,0(a5)
    8000752e:	a481                	j	8000776e <OSTimeDlyHMSM+0x27c>
    80007530:	00004797          	auipc	a5,0x4
    80007534:	3dd78793          	add	a5,a5,989 # 8000b90d <OSRunning>
    80007538:	0007c783          	lbu	a5,0(a5)
    8000753c:	873e                	mv	a4,a5
    8000753e:	4785                	li	a5,1
    80007540:	00f70863          	beq	a4,a5,80007550 <OSTimeDlyHMSM+0x5e>
    80007544:	67a2                	ld	a5,8(sp)
    80007546:	6719                	lui	a4,0x6
    80007548:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    8000754c:	c398                	sw	a4,0(a5)
    8000754e:	a405                	j	8000776e <OSTimeDlyHMSM+0x27c>
    80007550:	00004797          	auipc	a5,0x4
    80007554:	40a78793          	add	a5,a5,1034 # 8000b95a <OSSchedLockNestingCtr>
    80007558:	0007c783          	lbu	a5,0(a5)
    8000755c:	c799                	beqz	a5,8000756a <OSTimeDlyHMSM+0x78>
    8000755e:	67a2                	ld	a5,8(sp)
    80007560:	671d                	lui	a4,0x7
    80007562:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80007566:	c398                	sw	a4,0(a5)
    80007568:	a419                	j	8000776e <OSTimeDlyHMSM+0x27c>
    8000756a:	01815783          	lhu	a5,24(sp)
    8000756e:	8bb9                	and	a5,a5,14
    80007570:	02f11b23          	sh	a5,54(sp)
    80007574:	03615783          	lhu	a5,54(sp)
    80007578:	2781                	sext.w	a5,a5
    8000757a:	0007871b          	sext.w	a4,a5
    8000757e:	86ba                	mv	a3,a4
    80007580:	47a1                	li	a5,8
    80007582:	00d7b7b3          	sltu	a5,a5,a3
    80007586:	0ff7f793          	zext.b	a5,a5
    8000758a:	eb99                	bnez	a5,800075a0 <OSTimeDlyHMSM+0xae>
    8000758c:	11500793          	li	a5,277
    80007590:	00e7d7b3          	srl	a5,a5,a4
    80007594:	8b85                	and	a5,a5,1
    80007596:	00f037b3          	snez	a5,a5
    8000759a:	0ff7f793          	zext.b	a5,a5
    8000759e:	e799                	bnez	a5,800075ac <OSTimeDlyHMSM+0xba>
    800075a0:	67a2                	ld	a5,8(sp)
    800075a2:	6719                	lui	a4,0x6
    800075a4:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800075a8:	c398                	sw	a4,0(a5)
    800075aa:	a2d1                	j	8000776e <OSTimeDlyHMSM+0x27c>
    800075ac:	0001                	nop
    800075ae:	01815783          	lhu	a5,24(sp)
    800075b2:	2781                	sext.w	a5,a5
    800075b4:	9b85                	and	a5,a5,-31
    800075b6:	2781                	sext.w	a5,a5
    800075b8:	00f037b3          	snez	a5,a5
    800075bc:	0ff7f793          	zext.b	a5,a5
    800075c0:	02f10aa3          	sb	a5,53(sp)
    800075c4:	03514783          	lbu	a5,53(sp)
    800075c8:	0ff7f713          	zext.b	a4,a5
    800075cc:	4785                	li	a5,1
    800075ce:	00f71863          	bne	a4,a5,800075de <OSTimeDlyHMSM+0xec>
    800075d2:	67a2                	ld	a5,8(sp)
    800075d4:	6719                	lui	a4,0x6
    800075d6:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800075da:	c398                	sw	a4,0(a5)
    800075dc:	aa49                	j	8000776e <OSTimeDlyHMSM+0x27c>
    800075de:	01815783          	lhu	a5,24(sp)
    800075e2:	2781                	sext.w	a5,a5
    800075e4:	8bc1                	and	a5,a5,16
    800075e6:	2781                	sext.w	a5,a5
    800075e8:	00f037b3          	snez	a5,a5
    800075ec:	0ff7f793          	zext.b	a5,a5
    800075f0:	02f10a23          	sb	a5,52(sp)
    800075f4:	03414783          	lbu	a5,52(sp)
    800075f8:	0ff7f713          	zext.b	a4,a5
    800075fc:	4785                	li	a5,1
    800075fe:	06f70963          	beq	a4,a5,80007670 <OSTimeDlyHMSM+0x17e>
    80007602:	47d2                	lw	a5,20(sp)
    80007604:	0007871b          	sext.w	a4,a5
    80007608:	3e700793          	li	a5,999
    8000760c:	00e7f863          	bgeu	a5,a4,8000761c <OSTimeDlyHMSM+0x12a>
    80007610:	67a2                	ld	a5,8(sp)
    80007612:	671d                	lui	a4,0x7
    80007614:	27b70713          	add	a4,a4,635 # 727b <CPU_MSTATUS_MIE+0x7273>
    80007618:	c398                	sw	a4,0(a5)
    8000761a:	aa91                	j	8000776e <OSTimeDlyHMSM+0x27c>
    8000761c:	01a15783          	lhu	a5,26(sp)
    80007620:	0007871b          	sext.w	a4,a5
    80007624:	03b00793          	li	a5,59
    80007628:	00e7f863          	bgeu	a5,a4,80007638 <OSTimeDlyHMSM+0x146>
    8000762c:	67a2                	ld	a5,8(sp)
    8000762e:	671d                	lui	a4,0x7
    80007630:	27a70713          	add	a4,a4,634 # 727a <CPU_MSTATUS_MIE+0x7272>
    80007634:	c398                	sw	a4,0(a5)
    80007636:	aa25                	j	8000776e <OSTimeDlyHMSM+0x27c>
    80007638:	01c15783          	lhu	a5,28(sp)
    8000763c:	0007871b          	sext.w	a4,a5
    80007640:	03b00793          	li	a5,59
    80007644:	00e7f863          	bgeu	a5,a4,80007654 <OSTimeDlyHMSM+0x162>
    80007648:	67a2                	ld	a5,8(sp)
    8000764a:	671d                	lui	a4,0x7
    8000764c:	27970713          	add	a4,a4,633 # 7279 <CPU_MSTATUS_MIE+0x7271>
    80007650:	c398                	sw	a4,0(a5)
    80007652:	aa31                	j	8000776e <OSTimeDlyHMSM+0x27c>
    80007654:	01e15783          	lhu	a5,30(sp)
    80007658:	0007871b          	sext.w	a4,a5
    8000765c:	06300793          	li	a5,99
    80007660:	04e7f563          	bgeu	a5,a4,800076aa <OSTimeDlyHMSM+0x1b8>
    80007664:	67a2                	ld	a5,8(sp)
    80007666:	671d                	lui	a4,0x7
    80007668:	27870713          	add	a4,a4,632 # 7278 <CPU_MSTATUS_MIE+0x7270>
    8000766c:	c398                	sw	a4,0(a5)
    8000766e:	a201                	j	8000776e <OSTimeDlyHMSM+0x27c>
    80007670:	01c15783          	lhu	a5,28(sp)
    80007674:	0007871b          	sext.w	a4,a5
    80007678:	6789                	lui	a5,0x2
    8000767a:	70f78793          	add	a5,a5,1807 # 270f <CPU_MSTATUS_MIE+0x2707>
    8000767e:	00e7f863          	bgeu	a5,a4,8000768e <OSTimeDlyHMSM+0x19c>
    80007682:	67a2                	ld	a5,8(sp)
    80007684:	671d                	lui	a4,0x7
    80007686:	27970713          	add	a4,a4,633 # 7279 <CPU_MSTATUS_MIE+0x7271>
    8000768a:	c398                	sw	a4,0(a5)
    8000768c:	a0cd                	j	8000776e <OSTimeDlyHMSM+0x27c>
    8000768e:	01e15783          	lhu	a5,30(sp)
    80007692:	0007871b          	sext.w	a4,a5
    80007696:	3e700793          	li	a5,999
    8000769a:	00e7f863          	bgeu	a5,a4,800076aa <OSTimeDlyHMSM+0x1b8>
    8000769e:	67a2                	ld	a5,8(sp)
    800076a0:	671d                	lui	a4,0x7
    800076a2:	27870713          	add	a4,a4,632 # 7278 <CPU_MSTATUS_MIE+0x7270>
    800076a6:	c398                	sw	a4,0(a5)
    800076a8:	a0d9                	j	8000776e <OSTimeDlyHMSM+0x27c>
    800076aa:	00004797          	auipc	a5,0x4
    800076ae:	9d678793          	add	a5,a5,-1578 # 8000b080 <OSCfg_TickRate_Hz>
    800076b2:	439c                	lw	a5,0(a5)
    800076b4:	d83e                	sw	a5,48(sp)
    800076b6:	01e15783          	lhu	a5,30(sp)
    800076ba:	0007871b          	sext.w	a4,a5
    800076be:	6785                	lui	a5,0x1
    800076c0:	e107879b          	addw	a5,a5,-496 # e10 <CPU_MSTATUS_MIE+0xe08>
    800076c4:	02f707bb          	mulw	a5,a4,a5
    800076c8:	0007871b          	sext.w	a4,a5
    800076cc:	01c15783          	lhu	a5,28(sp)
    800076d0:	2781                	sext.w	a5,a5
    800076d2:	86be                	mv	a3,a5
    800076d4:	87b6                	mv	a5,a3
    800076d6:	0047979b          	sllw	a5,a5,0x4
    800076da:	9f95                	subw	a5,a5,a3
    800076dc:	0027979b          	sllw	a5,a5,0x2
    800076e0:	2781                	sext.w	a5,a5
    800076e2:	9fb9                	addw	a5,a5,a4
    800076e4:	0007871b          	sext.w	a4,a5
    800076e8:	01a15783          	lhu	a5,26(sp)
    800076ec:	2781                	sext.w	a5,a5
    800076ee:	9fb9                	addw	a5,a5,a4
    800076f0:	2781                	sext.w	a5,a5
    800076f2:	5742                	lw	a4,48(sp)
    800076f4:	02f707bb          	mulw	a5,a4,a5
    800076f8:	0007871b          	sext.w	a4,a5
    800076fc:	1f400793          	li	a5,500
    80007700:	56c2                	lw	a3,48(sp)
    80007702:	02d7d7bb          	divuw	a5,a5,a3
    80007706:	2781                	sext.w	a5,a5
    80007708:	46d2                	lw	a3,20(sp)
    8000770a:	9fb5                	addw	a5,a5,a3
    8000770c:	2781                	sext.w	a5,a5
    8000770e:	56c2                	lw	a3,48(sp)
    80007710:	02f687bb          	mulw	a5,a3,a5
    80007714:	2781                	sext.w	a5,a5
    80007716:	86be                	mv	a3,a5
    80007718:	3e800793          	li	a5,1000
    8000771c:	02f6d7bb          	divuw	a5,a3,a5
    80007720:	2781                	sext.w	a5,a5
    80007722:	9fb9                	addw	a5,a5,a4
    80007724:	d63e                	sw	a5,44(sp)
    80007726:	be9f90ef          	jal	8000130e <CPU_SR_Save>
    8000772a:	fc2a                	sd	a0,56(sp)
    8000772c:	00004797          	auipc	a5,0x4
    80007730:	29c78793          	add	a5,a5,668 # 8000b9c8 <OSTCBCurPtr>
    80007734:	639c                	ld	a5,0(a5)
    80007736:	03615603          	lhu	a2,54(sp)
    8000773a:	5732                	lw	a4,44(sp)
    8000773c:	66a2                	ld	a3,8(sp)
    8000773e:	85ba                	mv	a1,a4
    80007740:	853e                	mv	a0,a5
    80007742:	d76ff0ef          	jal	80006cb8 <OS_TickListInsertDly>
    80007746:	67a2                	ld	a5,8(sp)
    80007748:	439c                	lw	a5,0(a5)
    8000774a:	c789                	beqz	a5,80007754 <OSTimeDlyHMSM+0x262>
    8000774c:	7562                	ld	a0,56(sp)
    8000774e:	bcdf90ef          	jal	8000131a <CPU_SR_Restore>
    80007752:	a831                	j	8000776e <OSTimeDlyHMSM+0x27c>
    80007754:	00004797          	auipc	a5,0x4
    80007758:	27478793          	add	a5,a5,628 # 8000b9c8 <OSTCBCurPtr>
    8000775c:	639c                	ld	a5,0(a5)
    8000775e:	853e                	mv	a0,a5
    80007760:	e4cfe0ef          	jal	80005dac <OS_RdyListRemove>
    80007764:	7562                	ld	a0,56(sp)
    80007766:	bb5f90ef          	jal	8000131a <CPU_SR_Restore>
    8000776a:	9ddfd0ef          	jal	80005146 <OSSched>
    8000776e:	60a6                	ld	ra,72(sp)
    80007770:	6161                	add	sp,sp,80
    80007772:	8082                	ret

0000000080007774 <OSTimeDlyResume>:
    80007774:	7179                	add	sp,sp,-48
    80007776:	f406                	sd	ra,40(sp)
    80007778:	e42a                	sd	a0,8(sp)
    8000777a:	e02e                	sd	a1,0(sp)
    8000777c:	ec02                	sd	zero,24(sp)
    8000777e:	00004797          	auipc	a5,0x4
    80007782:	18e78793          	add	a5,a5,398 # 8000b90c <OSIntNestingCtr>
    80007786:	0007c783          	lbu	a5,0(a5)
    8000778a:	c799                	beqz	a5,80007798 <OSTimeDlyResume+0x24>
    8000778c:	6782                	ld	a5,0(sp)
    8000778e:	671d                	lui	a4,0x7
    80007790:	27670713          	add	a4,a4,630 # 7276 <CPU_MSTATUS_MIE+0x726e>
    80007794:	c398                	sw	a4,0(a5)
    80007796:	a8c1                	j	80007866 <OSTimeDlyResume+0xf2>
    80007798:	67a2                	ld	a5,8(sp)
    8000779a:	e799                	bnez	a5,800077a8 <OSTimeDlyResume+0x34>
    8000779c:	6782                	ld	a5,0(sp)
    8000779e:	671d                	lui	a4,0x7
    800077a0:	1ad70713          	add	a4,a4,429 # 71ad <CPU_MSTATUS_MIE+0x71a5>
    800077a4:	c398                	sw	a4,0(a5)
    800077a6:	a0c1                	j	80007866 <OSTimeDlyResume+0xf2>
    800077a8:	00004797          	auipc	a5,0x4
    800077ac:	16578793          	add	a5,a5,357 # 8000b90d <OSRunning>
    800077b0:	0007c783          	lbu	a5,0(a5)
    800077b4:	873e                	mv	a4,a5
    800077b6:	4785                	li	a5,1
    800077b8:	00f70863          	beq	a4,a5,800077c8 <OSTimeDlyResume+0x54>
    800077bc:	6782                	ld	a5,0(sp)
    800077be:	6719                	lui	a4,0x6
    800077c0:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    800077c4:	c398                	sw	a4,0(a5)
    800077c6:	a045                	j	80007866 <OSTimeDlyResume+0xf2>
    800077c8:	b47f90ef          	jal	8000130e <CPU_SR_Save>
    800077cc:	ec2a                	sd	a0,24(sp)
    800077ce:	67a2                	ld	a5,8(sp)
    800077d0:	0727c783          	lbu	a5,114(a5)
    800077d4:	2781                	sext.w	a5,a5
    800077d6:	86be                	mv	a3,a5
    800077d8:	471d                	li	a4,7
    800077da:	06d76b63          	bltu	a4,a3,80007850 <OSTimeDlyResume+0xdc>
    800077de:	00279713          	sll	a4,a5,0x2
    800077e2:	00004797          	auipc	a5,0x4
    800077e6:	ea678793          	add	a5,a5,-346 # 8000b688 <OSDbg_Tmr+0x50>
    800077ea:	97ba                	add	a5,a5,a4
    800077ec:	439c                	lw	a5,0(a5)
    800077ee:	0007871b          	sext.w	a4,a5
    800077f2:	00004797          	auipc	a5,0x4
    800077f6:	e9678793          	add	a5,a5,-362 # 8000b688 <OSDbg_Tmr+0x50>
    800077fa:	97ba                	add	a5,a5,a4
    800077fc:	8782                	jr	a5
    800077fe:	6562                	ld	a0,24(sp)
    80007800:	b1bf90ef          	jal	8000131a <CPU_SR_Restore>
    80007804:	6782                	ld	a5,0(sp)
    80007806:	671d                	lui	a4,0x7
    80007808:	15170713          	add	a4,a4,337 # 7151 <CPU_MSTATUS_MIE+0x7149>
    8000780c:	c398                	sw	a4,0(a5)
    8000780e:	a891                	j	80007862 <OSTimeDlyResume+0xee>
    80007810:	67a2                	ld	a5,8(sp)
    80007812:	06078923          	sb	zero,114(a5)
    80007816:	6522                	ld	a0,8(sp)
    80007818:	daeff0ef          	jal	80006dc6 <OS_TickListRemove>
    8000781c:	6522                	ld	a0,8(sp)
    8000781e:	bbefe0ef          	jal	80005bdc <OS_RdyListInsert>
    80007822:	6562                	ld	a0,24(sp)
    80007824:	af7f90ef          	jal	8000131a <CPU_SR_Restore>
    80007828:	6782                	ld	a5,0(sp)
    8000782a:	0007a023          	sw	zero,0(a5)
    8000782e:	a815                	j	80007862 <OSTimeDlyResume+0xee>
    80007830:	67a2                	ld	a5,8(sp)
    80007832:	4711                	li	a4,4
    80007834:	06e78923          	sb	a4,114(a5)
    80007838:	6522                	ld	a0,8(sp)
    8000783a:	d8cff0ef          	jal	80006dc6 <OS_TickListRemove>
    8000783e:	6562                	ld	a0,24(sp)
    80007840:	adbf90ef          	jal	8000131a <CPU_SR_Restore>
    80007844:	6782                	ld	a5,0(sp)
    80007846:	671d                	lui	a4,0x7
    80007848:	15a70713          	add	a4,a4,346 # 715a <CPU_MSTATUS_MIE+0x7152>
    8000784c:	c398                	sw	a4,0(a5)
    8000784e:	a811                	j	80007862 <OSTimeDlyResume+0xee>
    80007850:	6562                	ld	a0,24(sp)
    80007852:	ac9f90ef          	jal	8000131a <CPU_SR_Restore>
    80007856:	6782                	ld	a5,0(sp)
    80007858:	671d                	lui	a4,0x7
    8000785a:	e2d70713          	add	a4,a4,-467 # 6e2d <CPU_MSTATUS_MIE+0x6e25>
    8000785e:	c398                	sw	a4,0(a5)
    80007860:	0001                	nop
    80007862:	8e5fd0ef          	jal	80005146 <OSSched>
    80007866:	70a2                	ld	ra,40(sp)
    80007868:	6145                	add	sp,sp,48
    8000786a:	8082                	ret

000000008000786c <OSTimeGet>:
    8000786c:	7179                	add	sp,sp,-48
    8000786e:	f406                	sd	ra,40(sp)
    80007870:	e42a                	sd	a0,8(sp)
    80007872:	ec02                	sd	zero,24(sp)
    80007874:	a9bf90ef          	jal	8000130e <CPU_SR_Save>
    80007878:	ec2a                	sd	a0,24(sp)
    8000787a:	00004797          	auipc	a5,0x4
    8000787e:	12278793          	add	a5,a5,290 # 8000b99c <OSTickCtr>
    80007882:	439c                	lw	a5,0(a5)
    80007884:	ca3e                	sw	a5,20(sp)
    80007886:	6562                	ld	a0,24(sp)
    80007888:	a93f90ef          	jal	8000131a <CPU_SR_Restore>
    8000788c:	67a2                	ld	a5,8(sp)
    8000788e:	0007a023          	sw	zero,0(a5)
    80007892:	47d2                	lw	a5,20(sp)
    80007894:	853e                	mv	a0,a5
    80007896:	70a2                	ld	ra,40(sp)
    80007898:	6145                	add	sp,sp,48
    8000789a:	8082                	ret

000000008000789c <OSTimeSet>:
    8000789c:	7179                	add	sp,sp,-48
    8000789e:	f406                	sd	ra,40(sp)
    800078a0:	87aa                	mv	a5,a0
    800078a2:	e02e                	sd	a1,0(sp)
    800078a4:	c63e                	sw	a5,12(sp)
    800078a6:	ec02                	sd	zero,24(sp)
    800078a8:	a67f90ef          	jal	8000130e <CPU_SR_Save>
    800078ac:	ec2a                	sd	a0,24(sp)
    800078ae:	00004797          	auipc	a5,0x4
    800078b2:	0ee78793          	add	a5,a5,238 # 8000b99c <OSTickCtr>
    800078b6:	4732                	lw	a4,12(sp)
    800078b8:	c398                	sw	a4,0(a5)
    800078ba:	6562                	ld	a0,24(sp)
    800078bc:	a5ff90ef          	jal	8000131a <CPU_SR_Restore>
    800078c0:	6782                	ld	a5,0(sp)
    800078c2:	0007a023          	sw	zero,0(a5)
    800078c6:	0001                	nop
    800078c8:	70a2                	ld	ra,40(sp)
    800078ca:	6145                	add	sp,sp,48
    800078cc:	8082                	ret

00000000800078ce <OSTimeTick>:
    800078ce:	1141                	add	sp,sp,-16
    800078d0:	e406                	sd	ra,8(sp)
    800078d2:	00004797          	auipc	a5,0x4
    800078d6:	03b78793          	add	a5,a5,59 # 8000b90d <OSRunning>
    800078da:	0007c783          	lbu	a5,0(a5)
    800078de:	873e                	mv	a4,a5
    800078e0:	4785                	li	a5,1
    800078e2:	02f71c63          	bne	a4,a5,8000791a <OSTimeTick+0x4c>
    800078e6:	bc8fa0ef          	jal	80001cae <OSTimeTickHook>
    800078ea:	00004797          	auipc	a5,0x4
    800078ee:	05878793          	add	a5,a5,88 # 8000b942 <OSPrioCur>
    800078f2:	0007c783          	lbu	a5,0(a5)
    800078f6:	0007871b          	sext.w	a4,a5
    800078fa:	87ba                	mv	a5,a4
    800078fc:	0786                	sll	a5,a5,0x1
    800078fe:	97ba                	add	a5,a5,a4
    80007900:	078e                	sll	a5,a5,0x3
    80007902:	00015717          	auipc	a4,0x15
    80007906:	54e70713          	add	a4,a4,1358 # 8001ce50 <OSRdyList>
    8000790a:	97ba                	add	a5,a5,a4
    8000790c:	853e                	mv	a0,a5
    8000790e:	d58fe0ef          	jal	80005e66 <OS_SchedRoundRobin>
    80007912:	4505                	li	a0,1
    80007914:	9d2ff0ef          	jal	80006ae6 <OS_TickUpdate>
    80007918:	a011                	j	8000791c <OSTimeTick+0x4e>
    8000791a:	0001                	nop
    8000791c:	60a2                	ld	ra,8(sp)
    8000791e:	0141                	add	sp,sp,16
    80007920:	8082                	ret

0000000080007922 <OSFlagCreate>:
    80007922:	7139                	add	sp,sp,-64
    80007924:	fc06                	sd	ra,56(sp)
    80007926:	ec2a                	sd	a0,24(sp)
    80007928:	e82e                	sd	a1,16(sp)
    8000792a:	87b2                	mv	a5,a2
    8000792c:	e036                	sd	a3,0(sp)
    8000792e:	c63e                	sw	a5,12(sp)
    80007930:	f402                	sd	zero,40(sp)
    80007932:	00004797          	auipc	a5,0x4
    80007936:	fda78793          	add	a5,a5,-38 # 8000b90c <OSIntNestingCtr>
    8000793a:	0007c783          	lbu	a5,0(a5)
    8000793e:	c799                	beqz	a5,8000794c <OSFlagCreate+0x2a>
    80007940:	6782                	ld	a5,0(sp)
    80007942:	670d                	lui	a4,0x3
    80007944:	ee170713          	add	a4,a4,-287 # 2ee1 <CPU_MSTATUS_MIE+0x2ed9>
    80007948:	c398                	sw	a4,0(a5)
    8000794a:	a841                	j	800079da <OSFlagCreate+0xb8>
    8000794c:	67e2                	ld	a5,24(sp)
    8000794e:	e799                	bnez	a5,8000795c <OSFlagCreate+0x3a>
    80007950:	6782                	ld	a5,0(sp)
    80007952:	6719                	lui	a4,0x6
    80007954:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80007958:	c398                	sw	a4,0(a5)
    8000795a:	a041                	j	800079da <OSFlagCreate+0xb8>
    8000795c:	9b3f90ef          	jal	8000130e <CPU_SR_Save>
    80007960:	f42a                	sd	a0,40(sp)
    80007962:	67e2                	ld	a5,24(sp)
    80007964:	439c                	lw	a5,0(a5)
    80007966:	873e                	mv	a4,a5
    80007968:	474157b7          	lui	a5,0x47415
    8000796c:	c4678793          	add	a5,a5,-954 # 47414c46 <CPU_MSTATUS_MIE+0x47414c3e>
    80007970:	00f71b63          	bne	a4,a5,80007986 <OSFlagCreate+0x64>
    80007974:	7522                	ld	a0,40(sp)
    80007976:	9a5f90ef          	jal	8000131a <CPU_SR_Restore>
    8000797a:	6782                	ld	a5,0(sp)
    8000797c:	6719                	lui	a4,0x6
    8000797e:	dc170713          	add	a4,a4,-575 # 5dc1 <CPU_MSTATUS_MIE+0x5db9>
    80007982:	c398                	sw	a4,0(a5)
    80007984:	a899                	j	800079da <OSFlagCreate+0xb8>
    80007986:	67e2                	ld	a5,24(sp)
    80007988:	47415737          	lui	a4,0x47415
    8000798c:	c4670713          	add	a4,a4,-954 # 47414c46 <CPU_MSTATUS_MIE+0x47414c3e>
    80007990:	c398                	sw	a4,0(a5)
    80007992:	67e2                	ld	a5,24(sp)
    80007994:	6742                	ld	a4,16(sp)
    80007996:	e798                	sd	a4,8(a5)
    80007998:	67e2                	ld	a5,24(sp)
    8000799a:	4732                	lw	a4,12(sp)
    8000799c:	c3b8                	sw	a4,64(a5)
    8000799e:	67e2                	ld	a5,24(sp)
    800079a0:	07c1                	add	a5,a5,16
    800079a2:	853e                	mv	a0,a5
    800079a4:	f57fd0ef          	jal	800058fa <OS_PendListInit>
    800079a8:	6562                	ld	a0,24(sp)
    800079aa:	477000ef          	jal	80008620 <OS_FlagDbgListAdd>
    800079ae:	00004797          	auipc	a5,0x4
    800079b2:	f7278793          	add	a5,a5,-142 # 8000b920 <OSFlagQty>
    800079b6:	0007d783          	lhu	a5,0(a5)
    800079ba:	2785                	addw	a5,a5,1
    800079bc:	03079713          	sll	a4,a5,0x30
    800079c0:	9341                	srl	a4,a4,0x30
    800079c2:	00004797          	auipc	a5,0x4
    800079c6:	f5e78793          	add	a5,a5,-162 # 8000b920 <OSFlagQty>
    800079ca:	00e79023          	sh	a4,0(a5)
    800079ce:	7522                	ld	a0,40(sp)
    800079d0:	94bf90ef          	jal	8000131a <CPU_SR_Restore>
    800079d4:	6782                	ld	a5,0(sp)
    800079d6:	0007a023          	sw	zero,0(a5)
    800079da:	70e2                	ld	ra,56(sp)
    800079dc:	6121                	add	sp,sp,64
    800079de:	8082                	ret

00000000800079e0 <OSFlagDel>:
    800079e0:	711d                	add	sp,sp,-96
    800079e2:	ec86                	sd	ra,88(sp)
    800079e4:	ec2a                	sd	a0,24(sp)
    800079e6:	87ae                	mv	a5,a1
    800079e8:	e432                	sd	a2,8(sp)
    800079ea:	00f11b23          	sh	a5,22(sp)
    800079ee:	e082                	sd	zero,64(sp)
    800079f0:	00004797          	auipc	a5,0x4
    800079f4:	f1c78793          	add	a5,a5,-228 # 8000b90c <OSIntNestingCtr>
    800079f8:	0007c783          	lbu	a5,0(a5)
    800079fc:	cb81                	beqz	a5,80007a0c <OSFlagDel+0x2c>
    800079fe:	67a2                	ld	a5,8(sp)
    80007a00:	670d                	lui	a4,0x3
    80007a02:	2c970713          	add	a4,a4,713 # 32c9 <CPU_MSTATUS_MIE+0x32c1>
    80007a06:	c398                	sw	a4,0(a5)
    80007a08:	4781                	li	a5,0
    80007a0a:	a291                	j	80007b4e <OSFlagDel+0x16e>
    80007a0c:	00004797          	auipc	a5,0x4
    80007a10:	f0178793          	add	a5,a5,-255 # 8000b90d <OSRunning>
    80007a14:	0007c783          	lbu	a5,0(a5)
    80007a18:	873e                	mv	a4,a5
    80007a1a:	4785                	li	a5,1
    80007a1c:	00f70963          	beq	a4,a5,80007a2e <OSFlagDel+0x4e>
    80007a20:	67a2                	ld	a5,8(sp)
    80007a22:	6719                	lui	a4,0x6
    80007a24:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80007a28:	c398                	sw	a4,0(a5)
    80007a2a:	4781                	li	a5,0
    80007a2c:	a20d                	j	80007b4e <OSFlagDel+0x16e>
    80007a2e:	67e2                	ld	a5,24(sp)
    80007a30:	eb81                	bnez	a5,80007a40 <OSFlagDel+0x60>
    80007a32:	67a2                	ld	a5,8(sp)
    80007a34:	6719                	lui	a4,0x6
    80007a36:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80007a3a:	c398                	sw	a4,0(a5)
    80007a3c:	4781                	li	a5,0
    80007a3e:	aa01                	j	80007b4e <OSFlagDel+0x16e>
    80007a40:	67e2                	ld	a5,24(sp)
    80007a42:	439c                	lw	a5,0(a5)
    80007a44:	873e                	mv	a4,a5
    80007a46:	474157b7          	lui	a5,0x47415
    80007a4a:	c4678793          	add	a5,a5,-954 # 47414c46 <CPU_MSTATUS_MIE+0x47414c3e>
    80007a4e:	00f70963          	beq	a4,a5,80007a60 <OSFlagDel+0x80>
    80007a52:	67a2                	ld	a5,8(sp)
    80007a54:	6719                	lui	a4,0x6
    80007a56:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80007a5a:	c398                	sw	a4,0(a5)
    80007a5c:	4781                	li	a5,0
    80007a5e:	a8c5                	j	80007b4e <OSFlagDel+0x16e>
    80007a60:	8aff90ef          	jal	8000130e <CPU_SR_Save>
    80007a64:	e0aa                	sd	a0,64(sp)
    80007a66:	67e2                	ld	a5,24(sp)
    80007a68:	07c1                	add	a5,a5,16
    80007a6a:	fc3e                	sd	a5,56(sp)
    80007a6c:	04011723          	sh	zero,78(sp)
    80007a70:	01615783          	lhu	a5,22(sp)
    80007a74:	2781                	sext.w	a5,a5
    80007a76:	c791                	beqz	a5,80007a82 <OSFlagDel+0xa2>
    80007a78:	873e                	mv	a4,a5
    80007a7a:	4785                	li	a5,1
    80007a7c:	04f70c63          	beq	a4,a5,80007ad4 <OSFlagDel+0xf4>
    80007a80:	a865                	j	80007b38 <OSFlagDel+0x158>
    80007a82:	77e2                	ld	a5,56(sp)
    80007a84:	639c                	ld	a5,0(a5)
    80007a86:	ef95                	bnez	a5,80007ac2 <OSFlagDel+0xe2>
    80007a88:	6562                	ld	a0,24(sp)
    80007a8a:	3ef000ef          	jal	80008678 <OS_FlagDbgListRemove>
    80007a8e:	00004797          	auipc	a5,0x4
    80007a92:	e9278793          	add	a5,a5,-366 # 8000b920 <OSFlagQty>
    80007a96:	0007d783          	lhu	a5,0(a5)
    80007a9a:	37fd                	addw	a5,a5,-1
    80007a9c:	03079713          	sll	a4,a5,0x30
    80007aa0:	9341                	srl	a4,a4,0x30
    80007aa2:	00004797          	auipc	a5,0x4
    80007aa6:	e7e78793          	add	a5,a5,-386 # 8000b920 <OSFlagQty>
    80007aaa:	00e79023          	sh	a4,0(a5)
    80007aae:	6562                	ld	a0,24(sp)
    80007ab0:	339000ef          	jal	800085e8 <OS_FlagClr>
    80007ab4:	6506                	ld	a0,64(sp)
    80007ab6:	865f90ef          	jal	8000131a <CPU_SR_Restore>
    80007aba:	67a2                	ld	a5,8(sp)
    80007abc:	0007a023          	sw	zero,0(a5)
    80007ac0:	a069                	j	80007b4a <OSFlagDel+0x16a>
    80007ac2:	6506                	ld	a0,64(sp)
    80007ac4:	857f90ef          	jal	8000131a <CPU_SR_Restore>
    80007ac8:	67a2                	ld	a5,8(sp)
    80007aca:	671d                	lui	a4,0x7
    80007acc:	15f70713          	add	a4,a4,351 # 715f <CPU_MSTATUS_MIE+0x7157>
    80007ad0:	c398                	sw	a4,0(a5)
    80007ad2:	a8a5                	j	80007b4a <OSFlagDel+0x16a>
    80007ad4:	da02                	sw	zero,52(sp)
    80007ad6:	a839                	j	80007af4 <OSFlagDel+0x114>
    80007ad8:	77e2                	ld	a5,56(sp)
    80007ada:	639c                	ld	a5,0(a5)
    80007adc:	f43e                	sd	a5,40(sp)
    80007ade:	57d2                	lw	a5,52(sp)
    80007ae0:	4609                	li	a2,2
    80007ae2:	85be                	mv	a1,a5
    80007ae4:	7522                	ld	a0,40(sp)
    80007ae6:	c57fd0ef          	jal	8000573c <OS_PendAbort>
    80007aea:	04e15783          	lhu	a5,78(sp)
    80007aee:	2785                	addw	a5,a5,1
    80007af0:	04f11723          	sh	a5,78(sp)
    80007af4:	77e2                	ld	a5,56(sp)
    80007af6:	639c                	ld	a5,0(a5)
    80007af8:	f3e5                	bnez	a5,80007ad8 <OSFlagDel+0xf8>
    80007afa:	6562                	ld	a0,24(sp)
    80007afc:	37d000ef          	jal	80008678 <OS_FlagDbgListRemove>
    80007b00:	00004797          	auipc	a5,0x4
    80007b04:	e2078793          	add	a5,a5,-480 # 8000b920 <OSFlagQty>
    80007b08:	0007d783          	lhu	a5,0(a5)
    80007b0c:	37fd                	addw	a5,a5,-1
    80007b0e:	03079713          	sll	a4,a5,0x30
    80007b12:	9341                	srl	a4,a4,0x30
    80007b14:	00004797          	auipc	a5,0x4
    80007b18:	e0c78793          	add	a5,a5,-500 # 8000b920 <OSFlagQty>
    80007b1c:	00e79023          	sh	a4,0(a5)
    80007b20:	6562                	ld	a0,24(sp)
    80007b22:	2c7000ef          	jal	800085e8 <OS_FlagClr>
    80007b26:	6506                	ld	a0,64(sp)
    80007b28:	ff2f90ef          	jal	8000131a <CPU_SR_Restore>
    80007b2c:	e1afd0ef          	jal	80005146 <OSSched>
    80007b30:	67a2                	ld	a5,8(sp)
    80007b32:	0007a023          	sw	zero,0(a5)
    80007b36:	a811                	j	80007b4a <OSFlagDel+0x16a>
    80007b38:	6506                	ld	a0,64(sp)
    80007b3a:	fe0f90ef          	jal	8000131a <CPU_SR_Restore>
    80007b3e:	67a2                	ld	a5,8(sp)
    80007b40:	6719                	lui	a4,0x6
    80007b42:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80007b46:	c398                	sw	a4,0(a5)
    80007b48:	0001                	nop
    80007b4a:	04e15783          	lhu	a5,78(sp)
    80007b4e:	853e                	mv	a0,a5
    80007b50:	60e6                	ld	ra,88(sp)
    80007b52:	6125                	add	sp,sp,96
    80007b54:	8082                	ret

0000000080007b56 <OSFlagPend>:
    80007b56:	711d                	add	sp,sp,-96
    80007b58:	ec86                	sd	ra,88(sp)
    80007b5a:	f42a                	sd	a0,40(sp)
    80007b5c:	e83a                	sd	a4,16(sp)
    80007b5e:	e43e                	sd	a5,8(sp)
    80007b60:	87ae                	mv	a5,a1
    80007b62:	d23e                	sw	a5,36(sp)
    80007b64:	87b2                	mv	a5,a2
    80007b66:	d03e                	sw	a5,32(sp)
    80007b68:	87b6                	mv	a5,a3
    80007b6a:	00f11f23          	sh	a5,30(sp)
    80007b6e:	e082                	sd	zero,64(sp)
    80007b70:	00004797          	auipc	a5,0x4
    80007b74:	d9c78793          	add	a5,a5,-612 # 8000b90c <OSIntNestingCtr>
    80007b78:	0007c783          	lbu	a5,0(a5)
    80007b7c:	cf81                	beqz	a5,80007b94 <OSFlagPend+0x3e>
    80007b7e:	01e11783          	lh	a5,30(sp)
    80007b82:	0007c963          	bltz	a5,80007b94 <OSFlagPend+0x3e>
    80007b86:	67a2                	ld	a5,8(sp)
    80007b88:	6719                	lui	a4,0x6
    80007b8a:	1ae70713          	add	a4,a4,430 # 61ae <CPU_MSTATUS_MIE+0x61a6>
    80007b8e:	c398                	sw	a4,0(a5)
    80007b90:	4781                	li	a5,0
    80007b92:	ab7d                	j	80008150 <OSFlagPend+0x5fa>
    80007b94:	00004797          	auipc	a5,0x4
    80007b98:	d7978793          	add	a5,a5,-647 # 8000b90d <OSRunning>
    80007b9c:	0007c783          	lbu	a5,0(a5)
    80007ba0:	873e                	mv	a4,a5
    80007ba2:	4785                	li	a5,1
    80007ba4:	00f70963          	beq	a4,a5,80007bb6 <OSFlagPend+0x60>
    80007ba8:	67a2                	ld	a5,8(sp)
    80007baa:	6719                	lui	a4,0x6
    80007bac:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80007bb0:	c398                	sw	a4,0(a5)
    80007bb2:	4781                	li	a5,0
    80007bb4:	ab71                	j	80008150 <OSFlagPend+0x5fa>
    80007bb6:	77a2                	ld	a5,40(sp)
    80007bb8:	eb81                	bnez	a5,80007bc8 <OSFlagPend+0x72>
    80007bba:	67a2                	ld	a5,8(sp)
    80007bbc:	6719                	lui	a4,0x6
    80007bbe:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80007bc2:	c398                	sw	a4,0(a5)
    80007bc4:	4781                	li	a5,0
    80007bc6:	a369                	j	80008150 <OSFlagPend+0x5fa>
    80007bc8:	01e15783          	lhu	a5,30(sp)
    80007bcc:	2781                	sext.w	a5,a5
    80007bce:	86be                	mv	a3,a5
    80007bd0:	6721                	lui	a4,0x8
    80007bd2:	10870713          	add	a4,a4,264 # 8108 <CPU_MSTATUS_MIE+0x8100>
    80007bd6:	0cd74563          	blt	a4,a3,80007ca0 <OSFlagPend+0x14a>
    80007bda:	86be                	mv	a3,a5
    80007bdc:	6721                	lui	a4,0x8
    80007bde:	10170713          	add	a4,a4,257 # 8101 <CPU_MSTATUS_MIE+0x80f9>
    80007be2:	02e6d363          	bge	a3,a4,80007c08 <OSFlagPend+0xb2>
    80007be6:	86be                	mv	a3,a5
    80007be8:	6721                	lui	a4,0x8
    80007bea:	0721                	add	a4,a4,8 # 8008 <CPU_MSTATUS_MIE+0x8000>
    80007bec:	0ad74a63          	blt	a4,a3,80007ca0 <OSFlagPend+0x14a>
    80007bf0:	86be                	mv	a3,a5
    80007bf2:	6721                	lui	a4,0x8
    80007bf4:	02d74d63          	blt	a4,a3,80007c2e <OSFlagPend+0xd8>
    80007bf8:	86be                	mv	a3,a5
    80007bfa:	4721                	li	a4,8
    80007bfc:	08d74863          	blt	a4,a3,80007c8c <OSFlagPend+0x136>
    80007c00:	873e                	mv	a4,a5
    80007c02:	06e04863          	bgtz	a4,80007c72 <OSFlagPend+0x11c>
    80007c06:	a869                	j	80007ca0 <OSFlagPend+0x14a>
    80007c08:	0007871b          	sext.w	a4,a5
    80007c0c:	77e1                	lui	a5,0xffff8
    80007c0e:	eff7879b          	addw	a5,a5,-257 # ffffffffffff7eff <taskStk_2+0xffffffff7ffca40f>
    80007c12:	9fb9                	addw	a5,a5,a4
    80007c14:	2781                	sext.w	a5,a5
    80007c16:	873e                	mv	a4,a5
    80007c18:	08b00793          	li	a5,139
    80007c1c:	00e7d7b3          	srl	a5,a5,a4
    80007c20:	8b85                	and	a5,a5,1
    80007c22:	00f037b3          	snez	a5,a5
    80007c26:	0ff7f793          	zext.b	a5,a5
    80007c2a:	e3d1                	bnez	a5,80007cae <OSFlagPend+0x158>
    80007c2c:	a895                	j	80007ca0 <OSFlagPend+0x14a>
    80007c2e:	0007871b          	sext.w	a4,a5
    80007c32:	77e1                	lui	a5,0xffff8
    80007c34:	37fd                	addw	a5,a5,-1 # ffffffffffff7fff <taskStk_2+0xffffffff7ffca50f>
    80007c36:	9fb9                	addw	a5,a5,a4
    80007c38:	2781                	sext.w	a5,a5
    80007c3a:	873e                	mv	a4,a5
    80007c3c:	08b00793          	li	a5,139
    80007c40:	00e7d7b3          	srl	a5,a5,a4
    80007c44:	8b85                	and	a5,a5,1
    80007c46:	00f037b3          	snez	a5,a5
    80007c4a:	0ff7f793          	zext.b	a5,a5
    80007c4e:	e3a5                	bnez	a5,80007cae <OSFlagPend+0x158>
    80007c50:	a881                	j	80007ca0 <OSFlagPend+0x14a>
    80007c52:	2781                	sext.w	a5,a5
    80007c54:	eff7879b          	addw	a5,a5,-257
    80007c58:	2781                	sext.w	a5,a5
    80007c5a:	873e                	mv	a4,a5
    80007c5c:	08b00793          	li	a5,139
    80007c60:	00e7d7b3          	srl	a5,a5,a4
    80007c64:	8b85                	and	a5,a5,1
    80007c66:	00f037b3          	snez	a5,a5
    80007c6a:	0ff7f793          	zext.b	a5,a5
    80007c6e:	e3a1                	bnez	a5,80007cae <OSFlagPend+0x158>
    80007c70:	a805                	j	80007ca0 <OSFlagPend+0x14a>
    80007c72:	2781                	sext.w	a5,a5
    80007c74:	873e                	mv	a4,a5
    80007c76:	11600793          	li	a5,278
    80007c7a:	00e7d7b3          	srl	a5,a5,a4
    80007c7e:	8b85                	and	a5,a5,1
    80007c80:	00f037b3          	snez	a5,a5
    80007c84:	0ff7f793          	zext.b	a5,a5
    80007c88:	e39d                	bnez	a5,80007cae <OSFlagPend+0x158>
    80007c8a:	a819                	j	80007ca0 <OSFlagPend+0x14a>
    80007c8c:	86be                	mv	a3,a5
    80007c8e:	10800713          	li	a4,264
    80007c92:	00d74763          	blt	a4,a3,80007ca0 <OSFlagPend+0x14a>
    80007c96:	86be                	mv	a3,a5
    80007c98:	10100713          	li	a4,257
    80007c9c:	fae6dbe3          	bge	a3,a4,80007c52 <OSFlagPend+0xfc>
    80007ca0:	67a2                	ld	a5,8(sp)
    80007ca2:	6719                	lui	a4,0x6
    80007ca4:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80007ca8:	c398                	sw	a4,0(a5)
    80007caa:	4781                	li	a5,0
    80007cac:	a155                	j	80008150 <OSFlagPend+0x5fa>
    80007cae:	0001                	nop
    80007cb0:	77a2                	ld	a5,40(sp)
    80007cb2:	439c                	lw	a5,0(a5)
    80007cb4:	873e                	mv	a4,a5
    80007cb6:	474157b7          	lui	a5,0x47415
    80007cba:	c4678793          	add	a5,a5,-954 # 47414c46 <CPU_MSTATUS_MIE+0x47414c3e>
    80007cbe:	00f70963          	beq	a4,a5,80007cd0 <OSFlagPend+0x17a>
    80007cc2:	67a2                	ld	a5,8(sp)
    80007cc4:	6719                	lui	a4,0x6
    80007cc6:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80007cca:	c398                	sw	a4,0(a5)
    80007ccc:	4781                	li	a5,0
    80007cce:	a149                	j	80008150 <OSFlagPend+0x5fa>
    80007cd0:	01e15783          	lhu	a5,30(sp)
    80007cd4:	2781                	sext.w	a5,a5
    80007cd6:	1007f793          	and	a5,a5,256
    80007cda:	2781                	sext.w	a5,a5
    80007cdc:	c789                	beqz	a5,80007ce6 <OSFlagPend+0x190>
    80007cde:	4785                	li	a5,1
    80007ce0:	04f107a3          	sb	a5,79(sp)
    80007ce4:	a019                	j	80007cea <OSFlagPend+0x194>
    80007ce6:	040107a3          	sb	zero,79(sp)
    80007cea:	67c2                	ld	a5,16(sp)
    80007cec:	c781                	beqz	a5,80007cf4 <OSFlagPend+0x19e>
    80007cee:	67c2                	ld	a5,16(sp)
    80007cf0:	0007a023          	sw	zero,0(a5)
    80007cf4:	01e15783          	lhu	a5,30(sp)
    80007cf8:	8bbd                	and	a5,a5,15
    80007cfa:	02f11f23          	sh	a5,62(sp)
    80007cfe:	e10f90ef          	jal	8000130e <CPU_SR_Save>
    80007d02:	e0aa                	sd	a0,64(sp)
    80007d04:	03e15783          	lhu	a5,62(sp)
    80007d08:	2781                	sext.w	a5,a5
    80007d0a:	86be                	mv	a3,a5
    80007d0c:	4721                	li	a4,8
    80007d0e:	0ee68163          	beq	a3,a4,80007df0 <OSFlagPend+0x29a>
    80007d12:	86be                	mv	a3,a5
    80007d14:	4721                	li	a4,8
    80007d16:	2ed74363          	blt	a4,a3,80007ffc <OSFlagPend+0x4a6>
    80007d1a:	86be                	mv	a3,a5
    80007d1c:	4711                	li	a4,4
    80007d1e:	00e68f63          	beq	a3,a4,80007d3c <OSFlagPend+0x1e6>
    80007d22:	86be                	mv	a3,a5
    80007d24:	4711                	li	a4,4
    80007d26:	2cd74b63          	blt	a4,a3,80007ffc <OSFlagPend+0x4a6>
    80007d2a:	86be                	mv	a3,a5
    80007d2c:	4705                	li	a4,1
    80007d2e:	16e68763          	beq	a3,a4,80007e9c <OSFlagPend+0x346>
    80007d32:	873e                	mv	a4,a5
    80007d34:	4789                	li	a5,2
    80007d36:	20f70d63          	beq	a4,a5,80007f50 <OSFlagPend+0x3fa>
    80007d3a:	a4c9                	j	80007ffc <OSFlagPend+0x4a6>
    80007d3c:	77a2                	ld	a5,40(sp)
    80007d3e:	43bc                	lw	a5,64(a5)
    80007d40:	5712                	lw	a4,36(sp)
    80007d42:	8ff9                	and	a5,a5,a4
    80007d44:	dc3e                	sw	a5,56(sp)
    80007d46:	57e2                	lw	a5,56(sp)
    80007d48:	873e                	mv	a4,a5
    80007d4a:	5792                	lw	a5,36(sp)
    80007d4c:	2701                	sext.w	a4,a4
    80007d4e:	2781                	sext.w	a5,a5
    80007d50:	04f71463          	bne	a4,a5,80007d98 <OSFlagPend+0x242>
    80007d54:	04f14783          	lbu	a5,79(sp)
    80007d58:	0ff7f713          	zext.b	a4,a5
    80007d5c:	4785                	li	a5,1
    80007d5e:	00f71d63          	bne	a4,a5,80007d78 <OSFlagPend+0x222>
    80007d62:	77a2                	ld	a5,40(sp)
    80007d64:	43b8                	lw	a4,64(a5)
    80007d66:	57e2                	lw	a5,56(sp)
    80007d68:	fff7c793          	not	a5,a5
    80007d6c:	2781                	sext.w	a5,a5
    80007d6e:	8ff9                	and	a5,a5,a4
    80007d70:	0007871b          	sext.w	a4,a5
    80007d74:	77a2                	ld	a5,40(sp)
    80007d76:	c3b8                	sw	a4,64(a5)
    80007d78:	00004797          	auipc	a5,0x4
    80007d7c:	c5078793          	add	a5,a5,-944 # 8000b9c8 <OSTCBCurPtr>
    80007d80:	639c                	ld	a5,0(a5)
    80007d82:	5762                	lw	a4,56(sp)
    80007d84:	0ce7ae23          	sw	a4,220(a5)
    80007d88:	6506                	ld	a0,64(sp)
    80007d8a:	d90f90ef          	jal	8000131a <CPU_SR_Restore>
    80007d8e:	67a2                	ld	a5,8(sp)
    80007d90:	0007a023          	sw	zero,0(a5)
    80007d94:	57e2                	lw	a5,56(sp)
    80007d96:	ae6d                	j	80008150 <OSFlagPend+0x5fa>
    80007d98:	01e11783          	lh	a5,30(sp)
    80007d9c:	0007dc63          	bgez	a5,80007db4 <OSFlagPend+0x25e>
    80007da0:	6506                	ld	a0,64(sp)
    80007da2:	d78f90ef          	jal	8000131a <CPU_SR_Restore>
    80007da6:	67a2                	ld	a5,8(sp)
    80007da8:	6719                	lui	a4,0x6
    80007daa:	1b070713          	add	a4,a4,432 # 61b0 <CPU_MSTATUS_MIE+0x61a8>
    80007dae:	c398                	sw	a4,0(a5)
    80007db0:	4781                	li	a5,0
    80007db2:	ae79                	j	80008150 <OSFlagPend+0x5fa>
    80007db4:	00004797          	auipc	a5,0x4
    80007db8:	ba678793          	add	a5,a5,-1114 # 8000b95a <OSSchedLockNestingCtr>
    80007dbc:	0007c783          	lbu	a5,0(a5)
    80007dc0:	cb99                	beqz	a5,80007dd6 <OSFlagPend+0x280>
    80007dc2:	6506                	ld	a0,64(sp)
    80007dc4:	d56f90ef          	jal	8000131a <CPU_SR_Restore>
    80007dc8:	67a2                	ld	a5,8(sp)
    80007dca:	671d                	lui	a4,0x7
    80007dcc:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80007dd0:	c398                	sw	a4,0(a5)
    80007dd2:	4781                	li	a5,0
    80007dd4:	aeb5                	j	80008150 <OSFlagPend+0x5fa>
    80007dd6:	5682                	lw	a3,32(sp)
    80007dd8:	01e15703          	lhu	a4,30(sp)
    80007ddc:	5792                	lw	a5,36(sp)
    80007dde:	863a                	mv	a2,a4
    80007de0:	85be                	mv	a1,a5
    80007de2:	7522                	ld	a0,40(sp)
    80007de4:	79e000ef          	jal	80008582 <OS_FlagBlock>
    80007de8:	6506                	ld	a0,64(sp)
    80007dea:	d30f90ef          	jal	8000131a <CPU_SR_Restore>
    80007dee:	a40d                	j	80008010 <OSFlagPend+0x4ba>
    80007df0:	77a2                	ld	a5,40(sp)
    80007df2:	43bc                	lw	a5,64(a5)
    80007df4:	5712                	lw	a4,36(sp)
    80007df6:	8ff9                	and	a5,a5,a4
    80007df8:	dc3e                	sw	a5,56(sp)
    80007dfa:	57e2                	lw	a5,56(sp)
    80007dfc:	2781                	sext.w	a5,a5
    80007dfe:	c3b9                	beqz	a5,80007e44 <OSFlagPend+0x2ee>
    80007e00:	04f14783          	lbu	a5,79(sp)
    80007e04:	0ff7f713          	zext.b	a4,a5
    80007e08:	4785                	li	a5,1
    80007e0a:	00f71d63          	bne	a4,a5,80007e24 <OSFlagPend+0x2ce>
    80007e0e:	77a2                	ld	a5,40(sp)
    80007e10:	43b8                	lw	a4,64(a5)
    80007e12:	57e2                	lw	a5,56(sp)
    80007e14:	fff7c793          	not	a5,a5
    80007e18:	2781                	sext.w	a5,a5
    80007e1a:	8ff9                	and	a5,a5,a4
    80007e1c:	0007871b          	sext.w	a4,a5
    80007e20:	77a2                	ld	a5,40(sp)
    80007e22:	c3b8                	sw	a4,64(a5)
    80007e24:	00004797          	auipc	a5,0x4
    80007e28:	ba478793          	add	a5,a5,-1116 # 8000b9c8 <OSTCBCurPtr>
    80007e2c:	639c                	ld	a5,0(a5)
    80007e2e:	5762                	lw	a4,56(sp)
    80007e30:	0ce7ae23          	sw	a4,220(a5)
    80007e34:	6506                	ld	a0,64(sp)
    80007e36:	ce4f90ef          	jal	8000131a <CPU_SR_Restore>
    80007e3a:	67a2                	ld	a5,8(sp)
    80007e3c:	0007a023          	sw	zero,0(a5)
    80007e40:	57e2                	lw	a5,56(sp)
    80007e42:	a639                	j	80008150 <OSFlagPend+0x5fa>
    80007e44:	01e11783          	lh	a5,30(sp)
    80007e48:	0007dc63          	bgez	a5,80007e60 <OSFlagPend+0x30a>
    80007e4c:	6506                	ld	a0,64(sp)
    80007e4e:	cccf90ef          	jal	8000131a <CPU_SR_Restore>
    80007e52:	67a2                	ld	a5,8(sp)
    80007e54:	6719                	lui	a4,0x6
    80007e56:	1b070713          	add	a4,a4,432 # 61b0 <CPU_MSTATUS_MIE+0x61a8>
    80007e5a:	c398                	sw	a4,0(a5)
    80007e5c:	4781                	li	a5,0
    80007e5e:	accd                	j	80008150 <OSFlagPend+0x5fa>
    80007e60:	00004797          	auipc	a5,0x4
    80007e64:	afa78793          	add	a5,a5,-1286 # 8000b95a <OSSchedLockNestingCtr>
    80007e68:	0007c783          	lbu	a5,0(a5)
    80007e6c:	cb99                	beqz	a5,80007e82 <OSFlagPend+0x32c>
    80007e6e:	6506                	ld	a0,64(sp)
    80007e70:	caaf90ef          	jal	8000131a <CPU_SR_Restore>
    80007e74:	67a2                	ld	a5,8(sp)
    80007e76:	671d                	lui	a4,0x7
    80007e78:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80007e7c:	c398                	sw	a4,0(a5)
    80007e7e:	4781                	li	a5,0
    80007e80:	acc1                	j	80008150 <OSFlagPend+0x5fa>
    80007e82:	5682                	lw	a3,32(sp)
    80007e84:	01e15703          	lhu	a4,30(sp)
    80007e88:	5792                	lw	a5,36(sp)
    80007e8a:	863a                	mv	a2,a4
    80007e8c:	85be                	mv	a1,a5
    80007e8e:	7522                	ld	a0,40(sp)
    80007e90:	6f2000ef          	jal	80008582 <OS_FlagBlock>
    80007e94:	6506                	ld	a0,64(sp)
    80007e96:	c84f90ef          	jal	8000131a <CPU_SR_Restore>
    80007e9a:	aa9d                	j	80008010 <OSFlagPend+0x4ba>
    80007e9c:	77a2                	ld	a5,40(sp)
    80007e9e:	43bc                	lw	a5,64(a5)
    80007ea0:	fff7c793          	not	a5,a5
    80007ea4:	2781                	sext.w	a5,a5
    80007ea6:	5712                	lw	a4,36(sp)
    80007ea8:	8ff9                	and	a5,a5,a4
    80007eaa:	dc3e                	sw	a5,56(sp)
    80007eac:	57e2                	lw	a5,56(sp)
    80007eae:	873e                	mv	a4,a5
    80007eb0:	5792                	lw	a5,36(sp)
    80007eb2:	2701                	sext.w	a4,a4
    80007eb4:	2781                	sext.w	a5,a5
    80007eb6:	04f71163          	bne	a4,a5,80007ef8 <OSFlagPend+0x3a2>
    80007eba:	04f14783          	lbu	a5,79(sp)
    80007ebe:	0ff7f713          	zext.b	a4,a5
    80007ec2:	4785                	li	a5,1
    80007ec4:	00f71a63          	bne	a4,a5,80007ed8 <OSFlagPend+0x382>
    80007ec8:	77a2                	ld	a5,40(sp)
    80007eca:	43bc                	lw	a5,64(a5)
    80007ecc:	5762                	lw	a4,56(sp)
    80007ece:	8fd9                	or	a5,a5,a4
    80007ed0:	0007871b          	sext.w	a4,a5
    80007ed4:	77a2                	ld	a5,40(sp)
    80007ed6:	c3b8                	sw	a4,64(a5)
    80007ed8:	00004797          	auipc	a5,0x4
    80007edc:	af078793          	add	a5,a5,-1296 # 8000b9c8 <OSTCBCurPtr>
    80007ee0:	639c                	ld	a5,0(a5)
    80007ee2:	5762                	lw	a4,56(sp)
    80007ee4:	0ce7ae23          	sw	a4,220(a5)
    80007ee8:	6506                	ld	a0,64(sp)
    80007eea:	c30f90ef          	jal	8000131a <CPU_SR_Restore>
    80007eee:	67a2                	ld	a5,8(sp)
    80007ef0:	0007a023          	sw	zero,0(a5)
    80007ef4:	57e2                	lw	a5,56(sp)
    80007ef6:	aca9                	j	80008150 <OSFlagPend+0x5fa>
    80007ef8:	01e11783          	lh	a5,30(sp)
    80007efc:	0007dc63          	bgez	a5,80007f14 <OSFlagPend+0x3be>
    80007f00:	6506                	ld	a0,64(sp)
    80007f02:	c18f90ef          	jal	8000131a <CPU_SR_Restore>
    80007f06:	67a2                	ld	a5,8(sp)
    80007f08:	6719                	lui	a4,0x6
    80007f0a:	1b070713          	add	a4,a4,432 # 61b0 <CPU_MSTATUS_MIE+0x61a8>
    80007f0e:	c398                	sw	a4,0(a5)
    80007f10:	4781                	li	a5,0
    80007f12:	ac3d                	j	80008150 <OSFlagPend+0x5fa>
    80007f14:	00004797          	auipc	a5,0x4
    80007f18:	a4678793          	add	a5,a5,-1466 # 8000b95a <OSSchedLockNestingCtr>
    80007f1c:	0007c783          	lbu	a5,0(a5)
    80007f20:	cb99                	beqz	a5,80007f36 <OSFlagPend+0x3e0>
    80007f22:	6506                	ld	a0,64(sp)
    80007f24:	bf6f90ef          	jal	8000131a <CPU_SR_Restore>
    80007f28:	67a2                	ld	a5,8(sp)
    80007f2a:	671d                	lui	a4,0x7
    80007f2c:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80007f30:	c398                	sw	a4,0(a5)
    80007f32:	4781                	li	a5,0
    80007f34:	ac31                	j	80008150 <OSFlagPend+0x5fa>
    80007f36:	5682                	lw	a3,32(sp)
    80007f38:	01e15703          	lhu	a4,30(sp)
    80007f3c:	5792                	lw	a5,36(sp)
    80007f3e:	863a                	mv	a2,a4
    80007f40:	85be                	mv	a1,a5
    80007f42:	7522                	ld	a0,40(sp)
    80007f44:	63e000ef          	jal	80008582 <OS_FlagBlock>
    80007f48:	6506                	ld	a0,64(sp)
    80007f4a:	bd0f90ef          	jal	8000131a <CPU_SR_Restore>
    80007f4e:	a0c9                	j	80008010 <OSFlagPend+0x4ba>
    80007f50:	77a2                	ld	a5,40(sp)
    80007f52:	43bc                	lw	a5,64(a5)
    80007f54:	fff7c793          	not	a5,a5
    80007f58:	2781                	sext.w	a5,a5
    80007f5a:	5712                	lw	a4,36(sp)
    80007f5c:	8ff9                	and	a5,a5,a4
    80007f5e:	dc3e                	sw	a5,56(sp)
    80007f60:	57e2                	lw	a5,56(sp)
    80007f62:	2781                	sext.w	a5,a5
    80007f64:	c3a1                	beqz	a5,80007fa4 <OSFlagPend+0x44e>
    80007f66:	04f14783          	lbu	a5,79(sp)
    80007f6a:	0ff7f713          	zext.b	a4,a5
    80007f6e:	4785                	li	a5,1
    80007f70:	00f71a63          	bne	a4,a5,80007f84 <OSFlagPend+0x42e>
    80007f74:	77a2                	ld	a5,40(sp)
    80007f76:	43bc                	lw	a5,64(a5)
    80007f78:	5762                	lw	a4,56(sp)
    80007f7a:	8fd9                	or	a5,a5,a4
    80007f7c:	0007871b          	sext.w	a4,a5
    80007f80:	77a2                	ld	a5,40(sp)
    80007f82:	c3b8                	sw	a4,64(a5)
    80007f84:	00004797          	auipc	a5,0x4
    80007f88:	a4478793          	add	a5,a5,-1468 # 8000b9c8 <OSTCBCurPtr>
    80007f8c:	639c                	ld	a5,0(a5)
    80007f8e:	5762                	lw	a4,56(sp)
    80007f90:	0ce7ae23          	sw	a4,220(a5)
    80007f94:	6506                	ld	a0,64(sp)
    80007f96:	b84f90ef          	jal	8000131a <CPU_SR_Restore>
    80007f9a:	67a2                	ld	a5,8(sp)
    80007f9c:	0007a023          	sw	zero,0(a5)
    80007fa0:	57e2                	lw	a5,56(sp)
    80007fa2:	a27d                	j	80008150 <OSFlagPend+0x5fa>
    80007fa4:	01e11783          	lh	a5,30(sp)
    80007fa8:	0007dc63          	bgez	a5,80007fc0 <OSFlagPend+0x46a>
    80007fac:	6506                	ld	a0,64(sp)
    80007fae:	b6cf90ef          	jal	8000131a <CPU_SR_Restore>
    80007fb2:	67a2                	ld	a5,8(sp)
    80007fb4:	6719                	lui	a4,0x6
    80007fb6:	1b070713          	add	a4,a4,432 # 61b0 <CPU_MSTATUS_MIE+0x61a8>
    80007fba:	c398                	sw	a4,0(a5)
    80007fbc:	4781                	li	a5,0
    80007fbe:	aa49                	j	80008150 <OSFlagPend+0x5fa>
    80007fc0:	00004797          	auipc	a5,0x4
    80007fc4:	99a78793          	add	a5,a5,-1638 # 8000b95a <OSSchedLockNestingCtr>
    80007fc8:	0007c783          	lbu	a5,0(a5)
    80007fcc:	cb99                	beqz	a5,80007fe2 <OSFlagPend+0x48c>
    80007fce:	6506                	ld	a0,64(sp)
    80007fd0:	b4af90ef          	jal	8000131a <CPU_SR_Restore>
    80007fd4:	67a2                	ld	a5,8(sp)
    80007fd6:	671d                	lui	a4,0x7
    80007fd8:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80007fdc:	c398                	sw	a4,0(a5)
    80007fde:	4781                	li	a5,0
    80007fe0:	aa85                	j	80008150 <OSFlagPend+0x5fa>
    80007fe2:	5682                	lw	a3,32(sp)
    80007fe4:	01e15703          	lhu	a4,30(sp)
    80007fe8:	5792                	lw	a5,36(sp)
    80007fea:	863a                	mv	a2,a4
    80007fec:	85be                	mv	a1,a5
    80007fee:	7522                	ld	a0,40(sp)
    80007ff0:	592000ef          	jal	80008582 <OS_FlagBlock>
    80007ff4:	6506                	ld	a0,64(sp)
    80007ff6:	b24f90ef          	jal	8000131a <CPU_SR_Restore>
    80007ffa:	a819                	j	80008010 <OSFlagPend+0x4ba>
    80007ffc:	6506                	ld	a0,64(sp)
    80007ffe:	b1cf90ef          	jal	8000131a <CPU_SR_Restore>
    80008002:	67a2                	ld	a5,8(sp)
    80008004:	6719                	lui	a4,0x6
    80008006:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    8000800a:	c398                	sw	a4,0(a5)
    8000800c:	4781                	li	a5,0
    8000800e:	a289                	j	80008150 <OSFlagPend+0x5fa>
    80008010:	936fd0ef          	jal	80005146 <OSSched>
    80008014:	afaf90ef          	jal	8000130e <CPU_SR_Save>
    80008018:	e0aa                	sd	a0,64(sp)
    8000801a:	00004797          	auipc	a5,0x4
    8000801e:	9ae78793          	add	a5,a5,-1618 # 8000b9c8 <OSTCBCurPtr>
    80008022:	639c                	ld	a5,0(a5)
    80008024:	0717c783          	lbu	a5,113(a5)
    80008028:	2781                	sext.w	a5,a5
    8000802a:	86be                	mv	a3,a5
    8000802c:	470d                	li	a4,3
    8000802e:	04e68163          	beq	a3,a4,80008070 <OSFlagPend+0x51a>
    80008032:	86be                	mv	a3,a5
    80008034:	470d                	li	a4,3
    80008036:	06d74463          	blt	a4,a3,8000809e <OSFlagPend+0x548>
    8000803a:	86be                	mv	a3,a5
    8000803c:	4709                	li	a4,2
    8000803e:	04e68763          	beq	a3,a4,8000808c <OSFlagPend+0x536>
    80008042:	86be                	mv	a3,a5
    80008044:	4709                	li	a4,2
    80008046:	04d74c63          	blt	a4,a3,8000809e <OSFlagPend+0x548>
    8000804a:	c791                	beqz	a5,80008056 <OSFlagPend+0x500>
    8000804c:	873e                	mv	a4,a5
    8000804e:	4785                	li	a5,1
    80008050:	00f70763          	beq	a4,a5,8000805e <OSFlagPend+0x508>
    80008054:	a0a9                	j	8000809e <OSFlagPend+0x548>
    80008056:	67a2                	ld	a5,8(sp)
    80008058:	0007a023          	sw	zero,0(a5)
    8000805c:	a891                	j	800080b0 <OSFlagPend+0x55a>
    8000805e:	6506                	ld	a0,64(sp)
    80008060:	abaf90ef          	jal	8000131a <CPU_SR_Restore>
    80008064:	67a2                	ld	a5,8(sp)
    80008066:	6719                	lui	a4,0x6
    80008068:	1a970713          	add	a4,a4,425 # 61a9 <CPU_MSTATUS_MIE+0x61a1>
    8000806c:	c398                	sw	a4,0(a5)
    8000806e:	a089                	j	800080b0 <OSFlagPend+0x55a>
    80008070:	67c2                	ld	a5,16(sp)
    80008072:	c781                	beqz	a5,8000807a <OSFlagPend+0x524>
    80008074:	67c2                	ld	a5,16(sp)
    80008076:	0007a023          	sw	zero,0(a5)
    8000807a:	6506                	ld	a0,64(sp)
    8000807c:	a9ef90ef          	jal	8000131a <CPU_SR_Restore>
    80008080:	67a2                	ld	a5,8(sp)
    80008082:	671d                	lui	a4,0x7
    80008084:	2d970713          	add	a4,a4,729 # 72d9 <CPU_MSTATUS_MIE+0x72d1>
    80008088:	c398                	sw	a4,0(a5)
    8000808a:	a01d                	j	800080b0 <OSFlagPend+0x55a>
    8000808c:	6506                	ld	a0,64(sp)
    8000808e:	a8cf90ef          	jal	8000131a <CPU_SR_Restore>
    80008092:	67a2                	ld	a5,8(sp)
    80008094:	6719                	lui	a4,0x6
    80008096:	dc270713          	add	a4,a4,-574 # 5dc2 <CPU_MSTATUS_MIE+0x5dba>
    8000809a:	c398                	sw	a4,0(a5)
    8000809c:	a811                	j	800080b0 <OSFlagPend+0x55a>
    8000809e:	6506                	ld	a0,64(sp)
    800080a0:	a7af90ef          	jal	8000131a <CPU_SR_Restore>
    800080a4:	67a2                	ld	a5,8(sp)
    800080a6:	671d                	lui	a4,0x7
    800080a8:	e2e70713          	add	a4,a4,-466 # 6e2e <CPU_MSTATUS_MIE+0x6e26>
    800080ac:	c398                	sw	a4,0(a5)
    800080ae:	0001                	nop
    800080b0:	67a2                	ld	a5,8(sp)
    800080b2:	439c                	lw	a5,0(a5)
    800080b4:	c399                	beqz	a5,800080ba <OSFlagPend+0x564>
    800080b6:	4781                	li	a5,0
    800080b8:	a861                	j	80008150 <OSFlagPend+0x5fa>
    800080ba:	00004797          	auipc	a5,0x4
    800080be:	90e78793          	add	a5,a5,-1778 # 8000b9c8 <OSTCBCurPtr>
    800080c2:	639c                	ld	a5,0(a5)
    800080c4:	0dc7a783          	lw	a5,220(a5)
    800080c8:	dc3e                	sw	a5,56(sp)
    800080ca:	04f14783          	lbu	a5,79(sp)
    800080ce:	0ff7f713          	zext.b	a4,a5
    800080d2:	4785                	li	a5,1
    800080d4:	06f71763          	bne	a4,a5,80008142 <OSFlagPend+0x5ec>
    800080d8:	03e15783          	lhu	a5,62(sp)
    800080dc:	2781                	sext.w	a5,a5
    800080de:	86be                	mv	a3,a5
    800080e0:	4721                	li	a4,8
    800080e2:	02e68163          	beq	a3,a4,80008104 <OSFlagPend+0x5ae>
    800080e6:	86be                	mv	a3,a5
    800080e8:	4721                	li	a4,8
    800080ea:	04d74263          	blt	a4,a3,8000812e <OSFlagPend+0x5d8>
    800080ee:	86be                	mv	a3,a5
    800080f0:	4709                	li	a4,2
    800080f2:	00d74563          	blt	a4,a3,800080fc <OSFlagPend+0x5a6>
    800080f6:	02f04363          	bgtz	a5,8000811c <OSFlagPend+0x5c6>
    800080fa:	a815                	j	8000812e <OSFlagPend+0x5d8>
    800080fc:	873e                	mv	a4,a5
    800080fe:	4791                	li	a5,4
    80008100:	02f71763          	bne	a4,a5,8000812e <OSFlagPend+0x5d8>
    80008104:	77a2                	ld	a5,40(sp)
    80008106:	43b8                	lw	a4,64(a5)
    80008108:	57e2                	lw	a5,56(sp)
    8000810a:	fff7c793          	not	a5,a5
    8000810e:	2781                	sext.w	a5,a5
    80008110:	8ff9                	and	a5,a5,a4
    80008112:	0007871b          	sext.w	a4,a5
    80008116:	77a2                	ld	a5,40(sp)
    80008118:	c3b8                	sw	a4,64(a5)
    8000811a:	a025                	j	80008142 <OSFlagPend+0x5ec>
    8000811c:	77a2                	ld	a5,40(sp)
    8000811e:	43bc                	lw	a5,64(a5)
    80008120:	5762                	lw	a4,56(sp)
    80008122:	8fd9                	or	a5,a5,a4
    80008124:	0007871b          	sext.w	a4,a5
    80008128:	77a2                	ld	a5,40(sp)
    8000812a:	c3b8                	sw	a4,64(a5)
    8000812c:	a819                	j	80008142 <OSFlagPend+0x5ec>
    8000812e:	6506                	ld	a0,64(sp)
    80008130:	9eaf90ef          	jal	8000131a <CPU_SR_Restore>
    80008134:	67a2                	ld	a5,8(sp)
    80008136:	6719                	lui	a4,0x6
    80008138:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    8000813c:	c398                	sw	a4,0(a5)
    8000813e:	4781                	li	a5,0
    80008140:	a801                	j	80008150 <OSFlagPend+0x5fa>
    80008142:	6506                	ld	a0,64(sp)
    80008144:	9d6f90ef          	jal	8000131a <CPU_SR_Restore>
    80008148:	67a2                	ld	a5,8(sp)
    8000814a:	0007a023          	sw	zero,0(a5)
    8000814e:	57e2                	lw	a5,56(sp)
    80008150:	853e                	mv	a0,a5
    80008152:	60e6                	ld	ra,88(sp)
    80008154:	6125                	add	sp,sp,96
    80008156:	8082                	ret

0000000080008158 <OSFlagPendAbort>:
    80008158:	711d                	add	sp,sp,-96
    8000815a:	ec86                	sd	ra,88(sp)
    8000815c:	ec2a                	sd	a0,24(sp)
    8000815e:	87ae                	mv	a5,a1
    80008160:	e432                	sd	a2,8(sp)
    80008162:	00f11b23          	sh	a5,22(sp)
    80008166:	e082                	sd	zero,64(sp)
    80008168:	00003797          	auipc	a5,0x3
    8000816c:	7a478793          	add	a5,a5,1956 # 8000b90c <OSIntNestingCtr>
    80008170:	0007c783          	lbu	a5,0(a5)
    80008174:	cb81                	beqz	a5,80008184 <OSFlagPendAbort+0x2c>
    80008176:	67a2                	ld	a5,8(sp)
    80008178:	6719                	lui	a4,0x6
    8000817a:	1aa70713          	add	a4,a4,426 # 61aa <CPU_MSTATUS_MIE+0x61a2>
    8000817e:	c398                	sw	a4,0(a5)
    80008180:	4781                	li	a5,0
    80008182:	a205                	j	800082a2 <OSFlagPendAbort+0x14a>
    80008184:	00003797          	auipc	a5,0x3
    80008188:	78978793          	add	a5,a5,1929 # 8000b90d <OSRunning>
    8000818c:	0007c783          	lbu	a5,0(a5)
    80008190:	873e                	mv	a4,a5
    80008192:	4785                	li	a5,1
    80008194:	00f70963          	beq	a4,a5,800081a6 <OSFlagPendAbort+0x4e>
    80008198:	67a2                	ld	a5,8(sp)
    8000819a:	6719                	lui	a4,0x6
    8000819c:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    800081a0:	c398                	sw	a4,0(a5)
    800081a2:	4781                	li	a5,0
    800081a4:	a8fd                	j	800082a2 <OSFlagPendAbort+0x14a>
    800081a6:	67e2                	ld	a5,24(sp)
    800081a8:	eb81                	bnez	a5,800081b8 <OSFlagPendAbort+0x60>
    800081aa:	67a2                	ld	a5,8(sp)
    800081ac:	6719                	lui	a4,0x6
    800081ae:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    800081b2:	c398                	sw	a4,0(a5)
    800081b4:	4781                	li	a5,0
    800081b6:	a0f5                	j	800082a2 <OSFlagPendAbort+0x14a>
    800081b8:	01615783          	lhu	a5,22(sp)
    800081bc:	2781                	sext.w	a5,a5
    800081be:	86be                	mv	a3,a5
    800081c0:	6721                	lui	a4,0x8
    800081c2:	10070713          	add	a4,a4,256 # 8100 <CPU_MSTATUS_MIE+0x80f8>
    800081c6:	02e68d63          	beq	a3,a4,80008200 <OSFlagPendAbort+0xa8>
    800081ca:	86be                	mv	a3,a5
    800081cc:	6721                	lui	a4,0x8
    800081ce:	10070713          	add	a4,a4,256 # 8100 <CPU_MSTATUS_MIE+0x80f8>
    800081d2:	02d74063          	blt	a4,a3,800081f2 <OSFlagPendAbort+0x9a>
    800081d6:	86be                	mv	a3,a5
    800081d8:	6721                	lui	a4,0x8
    800081da:	02e68363          	beq	a3,a4,80008200 <OSFlagPendAbort+0xa8>
    800081de:	86be                	mv	a3,a5
    800081e0:	6721                	lui	a4,0x8
    800081e2:	00d74863          	blt	a4,a3,800081f2 <OSFlagPendAbort+0x9a>
    800081e6:	cf89                	beqz	a5,80008200 <OSFlagPendAbort+0xa8>
    800081e8:	873e                	mv	a4,a5
    800081ea:	10000793          	li	a5,256
    800081ee:	00f70963          	beq	a4,a5,80008200 <OSFlagPendAbort+0xa8>
    800081f2:	67a2                	ld	a5,8(sp)
    800081f4:	6719                	lui	a4,0x6
    800081f6:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800081fa:	c398                	sw	a4,0(a5)
    800081fc:	4781                	li	a5,0
    800081fe:	a055                	j	800082a2 <OSFlagPendAbort+0x14a>
    80008200:	0001                	nop
    80008202:	67e2                	ld	a5,24(sp)
    80008204:	439c                	lw	a5,0(a5)
    80008206:	873e                	mv	a4,a5
    80008208:	474157b7          	lui	a5,0x47415
    8000820c:	c4678793          	add	a5,a5,-954 # 47414c46 <CPU_MSTATUS_MIE+0x47414c3e>
    80008210:	00f70963          	beq	a4,a5,80008222 <OSFlagPendAbort+0xca>
    80008214:	67a2                	ld	a5,8(sp)
    80008216:	6719                	lui	a4,0x6
    80008218:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    8000821c:	c398                	sw	a4,0(a5)
    8000821e:	4781                	li	a5,0
    80008220:	a049                	j	800082a2 <OSFlagPendAbort+0x14a>
    80008222:	8ecf90ef          	jal	8000130e <CPU_SR_Save>
    80008226:	e0aa                	sd	a0,64(sp)
    80008228:	67e2                	ld	a5,24(sp)
    8000822a:	07c1                	add	a5,a5,16
    8000822c:	fc3e                	sd	a5,56(sp)
    8000822e:	77e2                	ld	a5,56(sp)
    80008230:	639c                	ld	a5,0(a5)
    80008232:	eb99                	bnez	a5,80008248 <OSFlagPendAbort+0xf0>
    80008234:	6506                	ld	a0,64(sp)
    80008236:	8e4f90ef          	jal	8000131a <CPU_SR_Restore>
    8000823a:	67a2                	ld	a5,8(sp)
    8000823c:	6719                	lui	a4,0x6
    8000823e:	1ab70713          	add	a4,a4,427 # 61ab <CPU_MSTATUS_MIE+0x61a3>
    80008242:	c398                	sw	a4,0(a5)
    80008244:	4781                	li	a5,0
    80008246:	a8b1                	j	800082a2 <OSFlagPendAbort+0x14a>
    80008248:	04011723          	sh	zero,78(sp)
    8000824c:	da02                	sw	zero,52(sp)
    8000824e:	a03d                	j	8000827c <OSFlagPendAbort+0x124>
    80008250:	77e2                	ld	a5,56(sp)
    80008252:	639c                	ld	a5,0(a5)
    80008254:	f43e                	sd	a5,40(sp)
    80008256:	57d2                	lw	a5,52(sp)
    80008258:	4605                	li	a2,1
    8000825a:	85be                	mv	a1,a5
    8000825c:	7522                	ld	a0,40(sp)
    8000825e:	cdefd0ef          	jal	8000573c <OS_PendAbort>
    80008262:	04e15783          	lhu	a5,78(sp)
    80008266:	2785                	addw	a5,a5,1
    80008268:	04f11723          	sh	a5,78(sp)
    8000826c:	01615783          	lhu	a5,22(sp)
    80008270:	0007871b          	sext.w	a4,a5
    80008274:	10000793          	li	a5,256
    80008278:	00f71663          	bne	a4,a5,80008284 <OSFlagPendAbort+0x12c>
    8000827c:	77e2                	ld	a5,56(sp)
    8000827e:	639c                	ld	a5,0(a5)
    80008280:	fbe1                	bnez	a5,80008250 <OSFlagPendAbort+0xf8>
    80008282:	a011                	j	80008286 <OSFlagPendAbort+0x12e>
    80008284:	0001                	nop
    80008286:	6506                	ld	a0,64(sp)
    80008288:	892f90ef          	jal	8000131a <CPU_SR_Restore>
    8000828c:	01611783          	lh	a5,22(sp)
    80008290:	0007c463          	bltz	a5,80008298 <OSFlagPendAbort+0x140>
    80008294:	eb3fc0ef          	jal	80005146 <OSSched>
    80008298:	67a2                	ld	a5,8(sp)
    8000829a:	0007a023          	sw	zero,0(a5)
    8000829e:	04e15783          	lhu	a5,78(sp)
    800082a2:	853e                	mv	a0,a5
    800082a4:	60e6                	ld	ra,88(sp)
    800082a6:	6125                	add	sp,sp,96
    800082a8:	8082                	ret

00000000800082aa <OSFlagPendGetFlagsRdy>:
    800082aa:	7179                	add	sp,sp,-48
    800082ac:	f406                	sd	ra,40(sp)
    800082ae:	e42a                	sd	a0,8(sp)
    800082b0:	ec02                	sd	zero,24(sp)
    800082b2:	00003797          	auipc	a5,0x3
    800082b6:	65b78793          	add	a5,a5,1627 # 8000b90d <OSRunning>
    800082ba:	0007c783          	lbu	a5,0(a5)
    800082be:	873e                	mv	a4,a5
    800082c0:	4785                	li	a5,1
    800082c2:	00f70963          	beq	a4,a5,800082d4 <OSFlagPendGetFlagsRdy+0x2a>
    800082c6:	67a2                	ld	a5,8(sp)
    800082c8:	6719                	lui	a4,0x6
    800082ca:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    800082ce:	c398                	sw	a4,0(a5)
    800082d0:	4781                	li	a5,0
    800082d2:	a089                	j	80008314 <OSFlagPendGetFlagsRdy+0x6a>
    800082d4:	00003797          	auipc	a5,0x3
    800082d8:	63878793          	add	a5,a5,1592 # 8000b90c <OSIntNestingCtr>
    800082dc:	0007c783          	lbu	a5,0(a5)
    800082e0:	cb81                	beqz	a5,800082f0 <OSFlagPendGetFlagsRdy+0x46>
    800082e2:	67a2                	ld	a5,8(sp)
    800082e4:	6719                	lui	a4,0x6
    800082e6:	1ae70713          	add	a4,a4,430 # 61ae <CPU_MSTATUS_MIE+0x61a6>
    800082ea:	c398                	sw	a4,0(a5)
    800082ec:	4781                	li	a5,0
    800082ee:	a01d                	j	80008314 <OSFlagPendGetFlagsRdy+0x6a>
    800082f0:	81ef90ef          	jal	8000130e <CPU_SR_Save>
    800082f4:	ec2a                	sd	a0,24(sp)
    800082f6:	00003797          	auipc	a5,0x3
    800082fa:	6d278793          	add	a5,a5,1746 # 8000b9c8 <OSTCBCurPtr>
    800082fe:	639c                	ld	a5,0(a5)
    80008300:	0dc7a783          	lw	a5,220(a5)
    80008304:	ca3e                	sw	a5,20(sp)
    80008306:	6562                	ld	a0,24(sp)
    80008308:	812f90ef          	jal	8000131a <CPU_SR_Restore>
    8000830c:	67a2                	ld	a5,8(sp)
    8000830e:	0007a023          	sw	zero,0(a5)
    80008312:	47d2                	lw	a5,20(sp)
    80008314:	853e                	mv	a0,a5
    80008316:	70a2                	ld	ra,40(sp)
    80008318:	6145                	add	sp,sp,48
    8000831a:	8082                	ret

000000008000831c <OSFlagPost>:
    8000831c:	7159                	add	sp,sp,-112
    8000831e:	f486                	sd	ra,104(sp)
    80008320:	ec2a                	sd	a0,24(sp)
    80008322:	87ae                	mv	a5,a1
    80008324:	8732                	mv	a4,a2
    80008326:	e436                	sd	a3,8(sp)
    80008328:	ca3e                	sw	a5,20(sp)
    8000832a:	87ba                	mv	a5,a4
    8000832c:	00f11923          	sh	a5,18(sp)
    80008330:	e882                	sd	zero,80(sp)
    80008332:	00003797          	auipc	a5,0x3
    80008336:	5db78793          	add	a5,a5,1499 # 8000b90d <OSRunning>
    8000833a:	0007c783          	lbu	a5,0(a5)
    8000833e:	873e                	mv	a4,a5
    80008340:	4785                	li	a5,1
    80008342:	00f70963          	beq	a4,a5,80008354 <OSFlagPost+0x38>
    80008346:	67a2                	ld	a5,8(sp)
    80008348:	6719                	lui	a4,0x6
    8000834a:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    8000834e:	c398                	sw	a4,0(a5)
    80008350:	4781                	li	a5,0
    80008352:	a425                	j	8000857a <OSFlagPost+0x25e>
    80008354:	67e2                	ld	a5,24(sp)
    80008356:	eb81                	bnez	a5,80008366 <OSFlagPost+0x4a>
    80008358:	67a2                	ld	a5,8(sp)
    8000835a:	6719                	lui	a4,0x6
    8000835c:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80008360:	c398                	sw	a4,0(a5)
    80008362:	4781                	li	a5,0
    80008364:	ac19                	j	8000857a <OSFlagPost+0x25e>
    80008366:	67e2                	ld	a5,24(sp)
    80008368:	439c                	lw	a5,0(a5)
    8000836a:	873e                	mv	a4,a5
    8000836c:	474157b7          	lui	a5,0x47415
    80008370:	c4678793          	add	a5,a5,-954 # 47414c46 <CPU_MSTATUS_MIE+0x47414c3e>
    80008374:	00f70963          	beq	a4,a5,80008386 <OSFlagPost+0x6a>
    80008378:	67a2                	ld	a5,8(sp)
    8000837a:	6719                	lui	a4,0x6
    8000837c:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80008380:	c398                	sw	a4,0(a5)
    80008382:	4781                	li	a5,0
    80008384:	aadd                	j	8000857a <OSFlagPost+0x25e>
    80008386:	c682                	sw	zero,76(sp)
    80008388:	01215783          	lhu	a5,18(sp)
    8000838c:	2781                	sext.w	a5,a5
    8000838e:	86be                	mv	a3,a5
    80008390:	6721                	lui	a4,0x8
    80008392:	0705                	add	a4,a4,1 # 8001 <CPU_MSTATUS_MIE+0x7ff9>
    80008394:	04e68163          	beq	a3,a4,800083d6 <OSFlagPost+0xba>
    80008398:	86be                	mv	a3,a5
    8000839a:	6721                	lui	a4,0x8
    8000839c:	0705                	add	a4,a4,1 # 8001 <CPU_MSTATUS_MIE+0x7ff9>
    8000839e:	04d74b63          	blt	a4,a3,800083f4 <OSFlagPost+0xd8>
    800083a2:	86be                	mv	a3,a5
    800083a4:	6721                	lui	a4,0x8
    800083a6:	00e68c63          	beq	a3,a4,800083be <OSFlagPost+0xa2>
    800083aa:	86be                	mv	a3,a5
    800083ac:	6721                	lui	a4,0x8
    800083ae:	04d74363          	blt	a4,a3,800083f4 <OSFlagPost+0xd8>
    800083b2:	c791                	beqz	a5,800083be <OSFlagPost+0xa2>
    800083b4:	873e                	mv	a4,a5
    800083b6:	4785                	li	a5,1
    800083b8:	00f70f63          	beq	a4,a5,800083d6 <OSFlagPost+0xba>
    800083bc:	a825                	j	800083f4 <OSFlagPost+0xd8>
    800083be:	f51f80ef          	jal	8000130e <CPU_SR_Save>
    800083c2:	e8aa                	sd	a0,80(sp)
    800083c4:	67e2                	ld	a5,24(sp)
    800083c6:	43bc                	lw	a5,64(a5)
    800083c8:	4752                	lw	a4,20(sp)
    800083ca:	8fd9                	or	a5,a5,a4
    800083cc:	0007871b          	sext.w	a4,a5
    800083d0:	67e2                	ld	a5,24(sp)
    800083d2:	c3b8                	sw	a4,64(a5)
    800083d4:	a03d                	j	80008402 <OSFlagPost+0xe6>
    800083d6:	f39f80ef          	jal	8000130e <CPU_SR_Save>
    800083da:	e8aa                	sd	a0,80(sp)
    800083dc:	67e2                	ld	a5,24(sp)
    800083de:	43b8                	lw	a4,64(a5)
    800083e0:	47d2                	lw	a5,20(sp)
    800083e2:	fff7c793          	not	a5,a5
    800083e6:	2781                	sext.w	a5,a5
    800083e8:	8ff9                	and	a5,a5,a4
    800083ea:	0007871b          	sext.w	a4,a5
    800083ee:	67e2                	ld	a5,24(sp)
    800083f0:	c3b8                	sw	a4,64(a5)
    800083f2:	a801                	j	80008402 <OSFlagPost+0xe6>
    800083f4:	67a2                	ld	a5,8(sp)
    800083f6:	6719                	lui	a4,0x6
    800083f8:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800083fc:	c398                	sw	a4,0(a5)
    800083fe:	4781                	li	a5,0
    80008400:	aaad                	j	8000857a <OSFlagPost+0x25e>
    80008402:	67e2                	ld	a5,24(sp)
    80008404:	07c1                	add	a5,a5,16
    80008406:	e0be                	sd	a5,64(sp)
    80008408:	6786                	ld	a5,64(sp)
    8000840a:	639c                	ld	a5,0(a5)
    8000840c:	eb91                	bnez	a5,80008420 <OSFlagPost+0x104>
    8000840e:	6546                	ld	a0,80(sp)
    80008410:	f0bf80ef          	jal	8000131a <CPU_SR_Restore>
    80008414:	67a2                	ld	a5,8(sp)
    80008416:	0007a023          	sw	zero,0(a5)
    8000841a:	67e2                	ld	a5,24(sp)
    8000841c:	43bc                	lw	a5,64(a5)
    8000841e:	aab1                	j	8000857a <OSFlagPost+0x25e>
    80008420:	6786                	ld	a5,64(sp)
    80008422:	639c                	ld	a5,0(a5)
    80008424:	ecbe                	sd	a5,88(sp)
    80008426:	a20d                	j	80008548 <OSFlagPost+0x22c>
    80008428:	67e6                	ld	a5,88(sp)
    8000842a:	6fbc                	ld	a5,88(a5)
    8000842c:	f83e                	sd	a5,48(sp)
    8000842e:	67e6                	ld	a5,88(sp)
    80008430:	0e07d783          	lhu	a5,224(a5)
    80008434:	8bbd                	and	a5,a5,15
    80008436:	02f11723          	sh	a5,46(sp)
    8000843a:	02e15783          	lhu	a5,46(sp)
    8000843e:	2781                	sext.w	a5,a5
    80008440:	86be                	mv	a3,a5
    80008442:	4721                	li	a4,8
    80008444:	04e68d63          	beq	a3,a4,8000849e <OSFlagPost+0x182>
    80008448:	86be                	mv	a3,a5
    8000844a:	4721                	li	a4,8
    8000844c:	0cd74b63          	blt	a4,a3,80008522 <OSFlagPost+0x206>
    80008450:	86be                	mv	a3,a5
    80008452:	4711                	li	a4,4
    80008454:	00e68f63          	beq	a3,a4,80008472 <OSFlagPost+0x156>
    80008458:	86be                	mv	a3,a5
    8000845a:	4711                	li	a4,4
    8000845c:	0cd74363          	blt	a4,a3,80008522 <OSFlagPost+0x206>
    80008460:	86be                	mv	a3,a5
    80008462:	4705                	li	a4,1
    80008464:	04e68f63          	beq	a3,a4,800084c2 <OSFlagPost+0x1a6>
    80008468:	873e                	mv	a4,a5
    8000846a:	4789                	li	a5,2
    8000846c:	08f70563          	beq	a4,a5,800084f6 <OSFlagPost+0x1da>
    80008470:	a84d                	j	80008522 <OSFlagPost+0x206>
    80008472:	67e2                	ld	a5,24(sp)
    80008474:	43b8                	lw	a4,64(a5)
    80008476:	67e6                	ld	a5,88(sp)
    80008478:	0d87a783          	lw	a5,216(a5)
    8000847c:	8ff9                	and	a5,a5,a4
    8000847e:	d43e                	sw	a5,40(sp)
    80008480:	67e6                	ld	a5,88(sp)
    80008482:	0d87a703          	lw	a4,216(a5)
    80008486:	57a2                	lw	a5,40(sp)
    80008488:	2781                	sext.w	a5,a5
    8000848a:	0ae79663          	bne	a5,a4,80008536 <OSFlagPost+0x21a>
    8000848e:	4736                	lw	a4,76(sp)
    80008490:	57a2                	lw	a5,40(sp)
    80008492:	863a                	mv	a2,a4
    80008494:	85be                	mv	a1,a5
    80008496:	6566                	ld	a0,88(sp)
    80008498:	242000ef          	jal	800086da <OS_FlagTaskRdy>
    8000849c:	a869                	j	80008536 <OSFlagPost+0x21a>
    8000849e:	67e2                	ld	a5,24(sp)
    800084a0:	43b8                	lw	a4,64(a5)
    800084a2:	67e6                	ld	a5,88(sp)
    800084a4:	0d87a783          	lw	a5,216(a5)
    800084a8:	8ff9                	and	a5,a5,a4
    800084aa:	d43e                	sw	a5,40(sp)
    800084ac:	57a2                	lw	a5,40(sp)
    800084ae:	2781                	sext.w	a5,a5
    800084b0:	c7c9                	beqz	a5,8000853a <OSFlagPost+0x21e>
    800084b2:	4736                	lw	a4,76(sp)
    800084b4:	57a2                	lw	a5,40(sp)
    800084b6:	863a                	mv	a2,a4
    800084b8:	85be                	mv	a1,a5
    800084ba:	6566                	ld	a0,88(sp)
    800084bc:	21e000ef          	jal	800086da <OS_FlagTaskRdy>
    800084c0:	a8ad                	j	8000853a <OSFlagPost+0x21e>
    800084c2:	67e2                	ld	a5,24(sp)
    800084c4:	43bc                	lw	a5,64(a5)
    800084c6:	fff7c793          	not	a5,a5
    800084ca:	0007871b          	sext.w	a4,a5
    800084ce:	67e6                	ld	a5,88(sp)
    800084d0:	0d87a783          	lw	a5,216(a5)
    800084d4:	8ff9                	and	a5,a5,a4
    800084d6:	d43e                	sw	a5,40(sp)
    800084d8:	67e6                	ld	a5,88(sp)
    800084da:	0d87a703          	lw	a4,216(a5)
    800084de:	57a2                	lw	a5,40(sp)
    800084e0:	2781                	sext.w	a5,a5
    800084e2:	04e79e63          	bne	a5,a4,8000853e <OSFlagPost+0x222>
    800084e6:	4736                	lw	a4,76(sp)
    800084e8:	57a2                	lw	a5,40(sp)
    800084ea:	863a                	mv	a2,a4
    800084ec:	85be                	mv	a1,a5
    800084ee:	6566                	ld	a0,88(sp)
    800084f0:	1ea000ef          	jal	800086da <OS_FlagTaskRdy>
    800084f4:	a0a9                	j	8000853e <OSFlagPost+0x222>
    800084f6:	67e2                	ld	a5,24(sp)
    800084f8:	43bc                	lw	a5,64(a5)
    800084fa:	fff7c793          	not	a5,a5
    800084fe:	0007871b          	sext.w	a4,a5
    80008502:	67e6                	ld	a5,88(sp)
    80008504:	0d87a783          	lw	a5,216(a5)
    80008508:	8ff9                	and	a5,a5,a4
    8000850a:	d43e                	sw	a5,40(sp)
    8000850c:	57a2                	lw	a5,40(sp)
    8000850e:	2781                	sext.w	a5,a5
    80008510:	cb8d                	beqz	a5,80008542 <OSFlagPost+0x226>
    80008512:	4736                	lw	a4,76(sp)
    80008514:	57a2                	lw	a5,40(sp)
    80008516:	863a                	mv	a2,a4
    80008518:	85be                	mv	a1,a5
    8000851a:	6566                	ld	a0,88(sp)
    8000851c:	1be000ef          	jal	800086da <OS_FlagTaskRdy>
    80008520:	a00d                	j	80008542 <OSFlagPost+0x226>
    80008522:	6546                	ld	a0,80(sp)
    80008524:	df7f80ef          	jal	8000131a <CPU_SR_Restore>
    80008528:	67a2                	ld	a5,8(sp)
    8000852a:	6711                	lui	a4,0x4
    8000852c:	aff70713          	add	a4,a4,-1281 # 3aff <CPU_MSTATUS_MIE+0x3af7>
    80008530:	c398                	sw	a4,0(a5)
    80008532:	4781                	li	a5,0
    80008534:	a099                	j	8000857a <OSFlagPost+0x25e>
    80008536:	0001                	nop
    80008538:	a031                	j	80008544 <OSFlagPost+0x228>
    8000853a:	0001                	nop
    8000853c:	a021                	j	80008544 <OSFlagPost+0x228>
    8000853e:	0001                	nop
    80008540:	a011                	j	80008544 <OSFlagPost+0x228>
    80008542:	0001                	nop
    80008544:	77c2                	ld	a5,48(sp)
    80008546:	ecbe                	sd	a5,88(sp)
    80008548:	67e6                	ld	a5,88(sp)
    8000854a:	ec079fe3          	bnez	a5,80008428 <OSFlagPost+0x10c>
    8000854e:	6546                	ld	a0,80(sp)
    80008550:	dcbf80ef          	jal	8000131a <CPU_SR_Restore>
    80008554:	01211783          	lh	a5,18(sp)
    80008558:	0007c463          	bltz	a5,80008560 <OSFlagPost+0x244>
    8000855c:	bebfc0ef          	jal	80005146 <OSSched>
    80008560:	daff80ef          	jal	8000130e <CPU_SR_Save>
    80008564:	e8aa                	sd	a0,80(sp)
    80008566:	67e2                	ld	a5,24(sp)
    80008568:	43bc                	lw	a5,64(a5)
    8000856a:	de3e                	sw	a5,60(sp)
    8000856c:	6546                	ld	a0,80(sp)
    8000856e:	dadf80ef          	jal	8000131a <CPU_SR_Restore>
    80008572:	67a2                	ld	a5,8(sp)
    80008574:	0007a023          	sw	zero,0(a5)
    80008578:	57f2                	lw	a5,60(sp)
    8000857a:	853e                	mv	a0,a5
    8000857c:	70a6                	ld	ra,104(sp)
    8000857e:	6165                	add	sp,sp,112
    80008580:	8082                	ret

0000000080008582 <OS_FlagBlock>:
    80008582:	7179                	add	sp,sp,-48
    80008584:	f406                	sd	ra,40(sp)
    80008586:	ec2a                	sd	a0,24(sp)
    80008588:	87ae                	mv	a5,a1
    8000858a:	8736                	mv	a4,a3
    8000858c:	ca3e                	sw	a5,20(sp)
    8000858e:	87b2                	mv	a5,a2
    80008590:	00f11923          	sh	a5,18(sp)
    80008594:	87ba                	mv	a5,a4
    80008596:	c63e                	sw	a5,12(sp)
    80008598:	00003797          	auipc	a5,0x3
    8000859c:	43078793          	add	a5,a5,1072 # 8000b9c8 <OSTCBCurPtr>
    800085a0:	639c                	ld	a5,0(a5)
    800085a2:	4752                	lw	a4,20(sp)
    800085a4:	0ce7ac23          	sw	a4,216(a5)
    800085a8:	00003797          	auipc	a5,0x3
    800085ac:	42078793          	add	a5,a5,1056 # 8000b9c8 <OSTCBCurPtr>
    800085b0:	639c                	ld	a5,0(a5)
    800085b2:	01215703          	lhu	a4,18(sp)
    800085b6:	0ee79023          	sh	a4,224(a5)
    800085ba:	00003797          	auipc	a5,0x3
    800085be:	40e78793          	add	a5,a5,1038 # 8000b9c8 <OSTCBCurPtr>
    800085c2:	639c                	ld	a5,0(a5)
    800085c4:	0c07ae23          	sw	zero,220(a5)
    800085c8:	00003797          	auipc	a5,0x3
    800085cc:	40078793          	add	a5,a5,1024 # 8000b9c8 <OSTCBCurPtr>
    800085d0:	639c                	ld	a5,0(a5)
    800085d2:	4732                	lw	a4,12(sp)
    800085d4:	86ba                	mv	a3,a4
    800085d6:	4605                	li	a2,1
    800085d8:	85be                	mv	a1,a5
    800085da:	6562                	ld	a0,24(sp)
    800085dc:	902fd0ef          	jal	800056de <OS_Pend>
    800085e0:	0001                	nop
    800085e2:	70a2                	ld	ra,40(sp)
    800085e4:	6145                	add	sp,sp,48
    800085e6:	8082                	ret

00000000800085e8 <OS_FlagClr>:
    800085e8:	7179                	add	sp,sp,-48
    800085ea:	f406                	sd	ra,40(sp)
    800085ec:	e42a                	sd	a0,8(sp)
    800085ee:	67a2                	ld	a5,8(sp)
    800085f0:	454e5737          	lui	a4,0x454e5
    800085f4:	f4e70713          	add	a4,a4,-178 # 454e4f4e <CPU_MSTATUS_MIE+0x454e4f46>
    800085f8:	c398                	sw	a4,0(a5)
    800085fa:	67a2                	ld	a5,8(sp)
    800085fc:	00003717          	auipc	a4,0x3
    80008600:	0ac70713          	add	a4,a4,172 # 8000b6a8 <OSDbg_Tmr+0x70>
    80008604:	e798                	sd	a4,8(a5)
    80008606:	67a2                	ld	a5,8(sp)
    80008608:	0407a023          	sw	zero,64(a5)
    8000860c:	67a2                	ld	a5,8(sp)
    8000860e:	07c1                	add	a5,a5,16
    80008610:	ec3e                	sd	a5,24(sp)
    80008612:	6562                	ld	a0,24(sp)
    80008614:	ae6fd0ef          	jal	800058fa <OS_PendListInit>
    80008618:	0001                	nop
    8000861a:	70a2                	ld	ra,40(sp)
    8000861c:	6145                	add	sp,sp,48
    8000861e:	8082                	ret

0000000080008620 <OS_FlagDbgListAdd>:
    80008620:	1141                	add	sp,sp,-16
    80008622:	e42a                	sd	a0,8(sp)
    80008624:	67a2                	ld	a5,8(sp)
    80008626:	00003717          	auipc	a4,0x3
    8000862a:	08a70713          	add	a4,a4,138 # 8000b6b0 <OSDbg_Tmr+0x78>
    8000862e:	ff98                	sd	a4,56(a5)
    80008630:	67a2                	ld	a5,8(sp)
    80008632:	0207b423          	sd	zero,40(a5)
    80008636:	00003797          	auipc	a5,0x3
    8000863a:	2e278793          	add	a5,a5,738 # 8000b918 <OSFlagDbgListPtr>
    8000863e:	639c                	ld	a5,0(a5)
    80008640:	e789                	bnez	a5,8000864a <OS_FlagDbgListAdd+0x2a>
    80008642:	67a2                	ld	a5,8(sp)
    80008644:	0207b823          	sd	zero,48(a5)
    80008648:	a839                	j	80008666 <OS_FlagDbgListAdd+0x46>
    8000864a:	00003797          	auipc	a5,0x3
    8000864e:	2ce78793          	add	a5,a5,718 # 8000b918 <OSFlagDbgListPtr>
    80008652:	6398                	ld	a4,0(a5)
    80008654:	67a2                	ld	a5,8(sp)
    80008656:	fb98                	sd	a4,48(a5)
    80008658:	00003797          	auipc	a5,0x3
    8000865c:	2c078793          	add	a5,a5,704 # 8000b918 <OSFlagDbgListPtr>
    80008660:	639c                	ld	a5,0(a5)
    80008662:	6722                	ld	a4,8(sp)
    80008664:	f798                	sd	a4,40(a5)
    80008666:	00003797          	auipc	a5,0x3
    8000866a:	2b278793          	add	a5,a5,690 # 8000b918 <OSFlagDbgListPtr>
    8000866e:	6722                	ld	a4,8(sp)
    80008670:	e398                	sd	a4,0(a5)
    80008672:	0001                	nop
    80008674:	0141                	add	sp,sp,16
    80008676:	8082                	ret

0000000080008678 <OS_FlagDbgListRemove>:
    80008678:	1101                	add	sp,sp,-32
    8000867a:	e42a                	sd	a0,8(sp)
    8000867c:	67a2                	ld	a5,8(sp)
    8000867e:	779c                	ld	a5,40(a5)
    80008680:	ec3e                	sd	a5,24(sp)
    80008682:	67a2                	ld	a5,8(sp)
    80008684:	7b9c                	ld	a5,48(a5)
    80008686:	e83e                	sd	a5,16(sp)
    80008688:	67e2                	ld	a5,24(sp)
    8000868a:	e385                	bnez	a5,800086aa <OS_FlagDbgListRemove+0x32>
    8000868c:	00003797          	auipc	a5,0x3
    80008690:	28c78793          	add	a5,a5,652 # 8000b918 <OSFlagDbgListPtr>
    80008694:	6742                	ld	a4,16(sp)
    80008696:	e398                	sd	a4,0(a5)
    80008698:	67c2                	ld	a5,16(sp)
    8000869a:	c781                	beqz	a5,800086a2 <OS_FlagDbgListRemove+0x2a>
    8000869c:	67c2                	ld	a5,16(sp)
    8000869e:	0207b423          	sd	zero,40(a5)
    800086a2:	67a2                	ld	a5,8(sp)
    800086a4:	0207b823          	sd	zero,48(a5)
    800086a8:	a035                	j	800086d4 <OS_FlagDbgListRemove+0x5c>
    800086aa:	67c2                	ld	a5,16(sp)
    800086ac:	eb81                	bnez	a5,800086bc <OS_FlagDbgListRemove+0x44>
    800086ae:	67e2                	ld	a5,24(sp)
    800086b0:	0207b823          	sd	zero,48(a5)
    800086b4:	67a2                	ld	a5,8(sp)
    800086b6:	0207b423          	sd	zero,40(a5)
    800086ba:	a829                	j	800086d4 <OS_FlagDbgListRemove+0x5c>
    800086bc:	67e2                	ld	a5,24(sp)
    800086be:	6742                	ld	a4,16(sp)
    800086c0:	fb98                	sd	a4,48(a5)
    800086c2:	67c2                	ld	a5,16(sp)
    800086c4:	6762                	ld	a4,24(sp)
    800086c6:	f798                	sd	a4,40(a5)
    800086c8:	67a2                	ld	a5,8(sp)
    800086ca:	0207b823          	sd	zero,48(a5)
    800086ce:	67a2                	ld	a5,8(sp)
    800086d0:	0207b423          	sd	zero,40(a5)
    800086d4:	0001                	nop
    800086d6:	6105                	add	sp,sp,32
    800086d8:	8082                	ret

00000000800086da <OS_FlagTaskRdy>:
    800086da:	1101                	add	sp,sp,-32
    800086dc:	ec06                	sd	ra,24(sp)
    800086de:	e42a                	sd	a0,8(sp)
    800086e0:	87ae                	mv	a5,a1
    800086e2:	8732                	mv	a4,a2
    800086e4:	c23e                	sw	a5,4(sp)
    800086e6:	87ba                	mv	a5,a4
    800086e8:	c03e                	sw	a5,0(sp)
    800086ea:	67a2                	ld	a5,8(sp)
    800086ec:	4712                	lw	a4,4(sp)
    800086ee:	0ce7ae23          	sw	a4,220(a5)
    800086f2:	67a2                	ld	a5,8(sp)
    800086f4:	060788a3          	sb	zero,113(a5)
    800086f8:	67a2                	ld	a5,8(sp)
    800086fa:	06078823          	sb	zero,112(a5)
    800086fe:	67a2                	ld	a5,8(sp)
    80008700:	0727c783          	lbu	a5,114(a5)
    80008704:	2781                	sext.w	a5,a5
    80008706:	86be                	mv	a3,a5
    80008708:	470d                	li	a4,3
    8000870a:	00d74763          	blt	a4,a3,80008718 <OS_FlagTaskRdy+0x3e>
    8000870e:	873e                	mv	a4,a5
    80008710:	4789                	li	a5,2
    80008712:	00f75b63          	bge	a4,a5,80008728 <OS_FlagTaskRdy+0x4e>
    80008716:	a889                	j	80008768 <OS_FlagTaskRdy+0x8e>
    80008718:	2781                	sext.w	a5,a5
    8000871a:	37e9                	addw	a5,a5,-6
    8000871c:	2781                	sext.w	a5,a5
    8000871e:	873e                	mv	a4,a5
    80008720:	4785                	li	a5,1
    80008722:	04e7e363          	bltu	a5,a4,80008768 <OS_FlagTaskRdy+0x8e>
    80008726:	a015                	j	8000874a <OS_FlagTaskRdy+0x70>
    80008728:	67a2                	ld	a5,8(sp)
    8000872a:	0727c783          	lbu	a5,114(a5)
    8000872e:	873e                	mv	a4,a5
    80008730:	478d                	li	a5,3
    80008732:	00f71563          	bne	a4,a5,8000873c <OS_FlagTaskRdy+0x62>
    80008736:	6522                	ld	a0,8(sp)
    80008738:	e8efe0ef          	jal	80006dc6 <OS_TickListRemove>
    8000873c:	6522                	ld	a0,8(sp)
    8000873e:	c9efd0ef          	jal	80005bdc <OS_RdyListInsert>
    80008742:	67a2                	ld	a5,8(sp)
    80008744:	06078923          	sb	zero,114(a5)
    80008748:	a00d                	j	8000876a <OS_FlagTaskRdy+0x90>
    8000874a:	67a2                	ld	a5,8(sp)
    8000874c:	0727c783          	lbu	a5,114(a5)
    80008750:	873e                	mv	a4,a5
    80008752:	479d                	li	a5,7
    80008754:	00f71563          	bne	a4,a5,8000875e <OS_FlagTaskRdy+0x84>
    80008758:	6522                	ld	a0,8(sp)
    8000875a:	e6cfe0ef          	jal	80006dc6 <OS_TickListRemove>
    8000875e:	67a2                	ld	a5,8(sp)
    80008760:	4711                	li	a4,4
    80008762:	06e78923          	sb	a4,114(a5)
    80008766:	a011                	j	8000876a <OS_FlagTaskRdy+0x90>
    80008768:	0001                	nop
    8000876a:	6522                	ld	a0,8(sp)
    8000876c:	a82fd0ef          	jal	800059ee <OS_PendListRemove>
    80008770:	0001                	nop
    80008772:	60e2                	ld	ra,24(sp)
    80008774:	6105                	add	sp,sp,32
    80008776:	8082                	ret

0000000080008778 <OSQCreate>:
    80008778:	7139                	add	sp,sp,-64
    8000877a:	fc06                	sd	ra,56(sp)
    8000877c:	ec2a                	sd	a0,24(sp)
    8000877e:	e82e                	sd	a1,16(sp)
    80008780:	87b2                	mv	a5,a2
    80008782:	e036                	sd	a3,0(sp)
    80008784:	00f11723          	sh	a5,14(sp)
    80008788:	f402                	sd	zero,40(sp)
    8000878a:	00003797          	auipc	a5,0x3
    8000878e:	18278793          	add	a5,a5,386 # 8000b90c <OSIntNestingCtr>
    80008792:	0007c783          	lbu	a5,0(a5)
    80008796:	c799                	beqz	a5,800087a4 <OSQCreate+0x2c>
    80008798:	6782                	ld	a5,0(sp)
    8000879a:	670d                	lui	a4,0x3
    8000879c:	ee170713          	add	a4,a4,-287 # 2ee1 <CPU_MSTATUS_MIE+0x2ed9>
    800087a0:	c398                	sw	a4,0(a5)
    800087a2:	a845                	j	80008852 <OSQCreate+0xda>
    800087a4:	67e2                	ld	a5,24(sp)
    800087a6:	e799                	bnez	a5,800087b4 <OSQCreate+0x3c>
    800087a8:	6782                	ld	a5,0(sp)
    800087aa:	6719                	lui	a4,0x6
    800087ac:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    800087b0:	c398                	sw	a4,0(a5)
    800087b2:	a045                	j	80008852 <OSQCreate+0xda>
    800087b4:	00e15783          	lhu	a5,14(sp)
    800087b8:	2781                	sext.w	a5,a5
    800087ba:	e799                	bnez	a5,800087c8 <OSQCreate+0x50>
    800087bc:	6782                	ld	a5,0(sp)
    800087be:	6719                	lui	a4,0x6
    800087c0:	59470713          	add	a4,a4,1428 # 6594 <CPU_MSTATUS_MIE+0x658c>
    800087c4:	c398                	sw	a4,0(a5)
    800087c6:	a071                	j	80008852 <OSQCreate+0xda>
    800087c8:	b47f80ef          	jal	8000130e <CPU_SR_Save>
    800087cc:	f42a                	sd	a0,40(sp)
    800087ce:	67e2                	ld	a5,24(sp)
    800087d0:	439c                	lw	a5,0(a5)
    800087d2:	873e                	mv	a4,a5
    800087d4:	554557b7          	lui	a5,0x55455
    800087d8:	55178793          	add	a5,a5,1361 # 55455551 <CPU_MSTATUS_MIE+0x55455549>
    800087dc:	00f71b63          	bne	a4,a5,800087f2 <OSQCreate+0x7a>
    800087e0:	7522                	ld	a0,40(sp)
    800087e2:	b39f80ef          	jal	8000131a <CPU_SR_Restore>
    800087e6:	6782                	ld	a5,0(sp)
    800087e8:	6719                	lui	a4,0x6
    800087ea:	dc170713          	add	a4,a4,-575 # 5dc1 <CPU_MSTATUS_MIE+0x5db9>
    800087ee:	c398                	sw	a4,0(a5)
    800087f0:	a08d                	j	80008852 <OSQCreate+0xda>
    800087f2:	67e2                	ld	a5,24(sp)
    800087f4:	55455737          	lui	a4,0x55455
    800087f8:	55170713          	add	a4,a4,1361 # 55455551 <CPU_MSTATUS_MIE+0x55455549>
    800087fc:	c398                	sw	a4,0(a5)
    800087fe:	67e2                	ld	a5,24(sp)
    80008800:	6742                	ld	a4,16(sp)
    80008802:	e798                	sd	a4,8(a5)
    80008804:	67e2                	ld	a5,24(sp)
    80008806:	04078793          	add	a5,a5,64
    8000880a:	00e15703          	lhu	a4,14(sp)
    8000880e:	85ba                	mv	a1,a4
    80008810:	853e                	mv	a0,a5
    80008812:	99dfa0ef          	jal	800031ae <OS_MsgQInit>
    80008816:	67e2                	ld	a5,24(sp)
    80008818:	07c1                	add	a5,a5,16
    8000881a:	853e                	mv	a0,a5
    8000881c:	8defd0ef          	jal	800058fa <OS_PendListInit>
    80008820:	6562                	ld	a0,24(sp)
    80008822:	7b8000ef          	jal	80008fda <OS_QDbgListAdd>
    80008826:	00003797          	auipc	a5,0x3
    8000882a:	13278793          	add	a5,a5,306 # 8000b958 <OSQQty>
    8000882e:	0007d783          	lhu	a5,0(a5)
    80008832:	2785                	addw	a5,a5,1
    80008834:	03079713          	sll	a4,a5,0x30
    80008838:	9341                	srl	a4,a4,0x30
    8000883a:	00003797          	auipc	a5,0x3
    8000883e:	11e78793          	add	a5,a5,286 # 8000b958 <OSQQty>
    80008842:	00e79023          	sh	a4,0(a5)
    80008846:	7522                	ld	a0,40(sp)
    80008848:	ad3f80ef          	jal	8000131a <CPU_SR_Restore>
    8000884c:	6782                	ld	a5,0(sp)
    8000884e:	0007a023          	sw	zero,0(a5)
    80008852:	70e2                	ld	ra,56(sp)
    80008854:	6121                	add	sp,sp,64
    80008856:	8082                	ret

0000000080008858 <OSQDel>:
    80008858:	711d                	add	sp,sp,-96
    8000885a:	ec86                	sd	ra,88(sp)
    8000885c:	ec2a                	sd	a0,24(sp)
    8000885e:	87ae                	mv	a5,a1
    80008860:	e432                	sd	a2,8(sp)
    80008862:	00f11b23          	sh	a5,22(sp)
    80008866:	e082                	sd	zero,64(sp)
    80008868:	00003797          	auipc	a5,0x3
    8000886c:	0a478793          	add	a5,a5,164 # 8000b90c <OSIntNestingCtr>
    80008870:	0007c783          	lbu	a5,0(a5)
    80008874:	cb81                	beqz	a5,80008884 <OSQDel+0x2c>
    80008876:	67a2                	ld	a5,8(sp)
    80008878:	670d                	lui	a4,0x3
    8000887a:	2c970713          	add	a4,a4,713 # 32c9 <CPU_MSTATUS_MIE+0x32c1>
    8000887e:	c398                	sw	a4,0(a5)
    80008880:	4781                	li	a5,0
    80008882:	a291                	j	800089c6 <OSQDel+0x16e>
    80008884:	00003797          	auipc	a5,0x3
    80008888:	08978793          	add	a5,a5,137 # 8000b90d <OSRunning>
    8000888c:	0007c783          	lbu	a5,0(a5)
    80008890:	873e                	mv	a4,a5
    80008892:	4785                	li	a5,1
    80008894:	00f70963          	beq	a4,a5,800088a6 <OSQDel+0x4e>
    80008898:	67a2                	ld	a5,8(sp)
    8000889a:	6719                	lui	a4,0x6
    8000889c:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    800088a0:	c398                	sw	a4,0(a5)
    800088a2:	4781                	li	a5,0
    800088a4:	a20d                	j	800089c6 <OSQDel+0x16e>
    800088a6:	67e2                	ld	a5,24(sp)
    800088a8:	eb81                	bnez	a5,800088b8 <OSQDel+0x60>
    800088aa:	67a2                	ld	a5,8(sp)
    800088ac:	6719                	lui	a4,0x6
    800088ae:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    800088b2:	c398                	sw	a4,0(a5)
    800088b4:	4781                	li	a5,0
    800088b6:	aa01                	j	800089c6 <OSQDel+0x16e>
    800088b8:	67e2                	ld	a5,24(sp)
    800088ba:	439c                	lw	a5,0(a5)
    800088bc:	873e                	mv	a4,a5
    800088be:	554557b7          	lui	a5,0x55455
    800088c2:	55178793          	add	a5,a5,1361 # 55455551 <CPU_MSTATUS_MIE+0x55455549>
    800088c6:	00f70963          	beq	a4,a5,800088d8 <OSQDel+0x80>
    800088ca:	67a2                	ld	a5,8(sp)
    800088cc:	6719                	lui	a4,0x6
    800088ce:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    800088d2:	c398                	sw	a4,0(a5)
    800088d4:	4781                	li	a5,0
    800088d6:	a8c5                	j	800089c6 <OSQDel+0x16e>
    800088d8:	a37f80ef          	jal	8000130e <CPU_SR_Save>
    800088dc:	e0aa                	sd	a0,64(sp)
    800088de:	67e2                	ld	a5,24(sp)
    800088e0:	07c1                	add	a5,a5,16
    800088e2:	fc3e                	sd	a5,56(sp)
    800088e4:	04011723          	sh	zero,78(sp)
    800088e8:	01615783          	lhu	a5,22(sp)
    800088ec:	2781                	sext.w	a5,a5
    800088ee:	c791                	beqz	a5,800088fa <OSQDel+0xa2>
    800088f0:	873e                	mv	a4,a5
    800088f2:	4785                	li	a5,1
    800088f4:	04f70c63          	beq	a4,a5,8000894c <OSQDel+0xf4>
    800088f8:	a865                	j	800089b0 <OSQDel+0x158>
    800088fa:	77e2                	ld	a5,56(sp)
    800088fc:	639c                	ld	a5,0(a5)
    800088fe:	ef95                	bnez	a5,8000893a <OSQDel+0xe2>
    80008900:	6562                	ld	a0,24(sp)
    80008902:	730000ef          	jal	80009032 <OS_QDbgListRemove>
    80008906:	00003797          	auipc	a5,0x3
    8000890a:	05278793          	add	a5,a5,82 # 8000b958 <OSQQty>
    8000890e:	0007d783          	lhu	a5,0(a5)
    80008912:	37fd                	addw	a5,a5,-1
    80008914:	03079713          	sll	a4,a5,0x30
    80008918:	9341                	srl	a4,a4,0x30
    8000891a:	00003797          	auipc	a5,0x3
    8000891e:	03e78793          	add	a5,a5,62 # 8000b958 <OSQQty>
    80008922:	00e79023          	sh	a4,0(a5)
    80008926:	6562                	ld	a0,24(sp)
    80008928:	668000ef          	jal	80008f90 <OS_QClr>
    8000892c:	6506                	ld	a0,64(sp)
    8000892e:	9edf80ef          	jal	8000131a <CPU_SR_Restore>
    80008932:	67a2                	ld	a5,8(sp)
    80008934:	0007a023          	sw	zero,0(a5)
    80008938:	a069                	j	800089c2 <OSQDel+0x16a>
    8000893a:	6506                	ld	a0,64(sp)
    8000893c:	9dff80ef          	jal	8000131a <CPU_SR_Restore>
    80008940:	67a2                	ld	a5,8(sp)
    80008942:	671d                	lui	a4,0x7
    80008944:	15f70713          	add	a4,a4,351 # 715f <CPU_MSTATUS_MIE+0x7157>
    80008948:	c398                	sw	a4,0(a5)
    8000894a:	a8a5                	j	800089c2 <OSQDel+0x16a>
    8000894c:	da02                	sw	zero,52(sp)
    8000894e:	a839                	j	8000896c <OSQDel+0x114>
    80008950:	77e2                	ld	a5,56(sp)
    80008952:	639c                	ld	a5,0(a5)
    80008954:	f43e                	sd	a5,40(sp)
    80008956:	57d2                	lw	a5,52(sp)
    80008958:	4609                	li	a2,2
    8000895a:	85be                	mv	a1,a5
    8000895c:	7522                	ld	a0,40(sp)
    8000895e:	ddffc0ef          	jal	8000573c <OS_PendAbort>
    80008962:	04e15783          	lhu	a5,78(sp)
    80008966:	2785                	addw	a5,a5,1
    80008968:	04f11723          	sh	a5,78(sp)
    8000896c:	77e2                	ld	a5,56(sp)
    8000896e:	639c                	ld	a5,0(a5)
    80008970:	f3e5                	bnez	a5,80008950 <OSQDel+0xf8>
    80008972:	6562                	ld	a0,24(sp)
    80008974:	6be000ef          	jal	80009032 <OS_QDbgListRemove>
    80008978:	00003797          	auipc	a5,0x3
    8000897c:	fe078793          	add	a5,a5,-32 # 8000b958 <OSQQty>
    80008980:	0007d783          	lhu	a5,0(a5)
    80008984:	37fd                	addw	a5,a5,-1
    80008986:	03079713          	sll	a4,a5,0x30
    8000898a:	9341                	srl	a4,a4,0x30
    8000898c:	00003797          	auipc	a5,0x3
    80008990:	fcc78793          	add	a5,a5,-52 # 8000b958 <OSQQty>
    80008994:	00e79023          	sh	a4,0(a5)
    80008998:	6562                	ld	a0,24(sp)
    8000899a:	5f6000ef          	jal	80008f90 <OS_QClr>
    8000899e:	6506                	ld	a0,64(sp)
    800089a0:	97bf80ef          	jal	8000131a <CPU_SR_Restore>
    800089a4:	fa2fc0ef          	jal	80005146 <OSSched>
    800089a8:	67a2                	ld	a5,8(sp)
    800089aa:	0007a023          	sw	zero,0(a5)
    800089ae:	a811                	j	800089c2 <OSQDel+0x16a>
    800089b0:	6506                	ld	a0,64(sp)
    800089b2:	969f80ef          	jal	8000131a <CPU_SR_Restore>
    800089b6:	67a2                	ld	a5,8(sp)
    800089b8:	6719                	lui	a4,0x6
    800089ba:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    800089be:	c398                	sw	a4,0(a5)
    800089c0:	0001                	nop
    800089c2:	04e15783          	lhu	a5,78(sp)
    800089c6:	853e                	mv	a0,a5
    800089c8:	60e6                	ld	ra,88(sp)
    800089ca:	6125                	add	sp,sp,96
    800089cc:	8082                	ret

00000000800089ce <OSQFlush>:
    800089ce:	7179                	add	sp,sp,-48
    800089d0:	f406                	sd	ra,40(sp)
    800089d2:	e42a                	sd	a0,8(sp)
    800089d4:	e02e                	sd	a1,0(sp)
    800089d6:	ec02                	sd	zero,24(sp)
    800089d8:	00003797          	auipc	a5,0x3
    800089dc:	f3478793          	add	a5,a5,-204 # 8000b90c <OSIntNestingCtr>
    800089e0:	0007c783          	lbu	a5,0(a5)
    800089e4:	cb81                	beqz	a5,800089f4 <OSQFlush+0x26>
    800089e6:	6782                	ld	a5,0(sp)
    800089e8:	6711                	lui	a4,0x4
    800089ea:	b0070713          	add	a4,a4,-1280 # 3b00 <CPU_MSTATUS_MIE+0x3af8>
    800089ee:	c398                	sw	a4,0(a5)
    800089f0:	4781                	li	a5,0
    800089f2:	a8bd                	j	80008a70 <OSQFlush+0xa2>
    800089f4:	00003797          	auipc	a5,0x3
    800089f8:	f1978793          	add	a5,a5,-231 # 8000b90d <OSRunning>
    800089fc:	0007c783          	lbu	a5,0(a5)
    80008a00:	873e                	mv	a4,a5
    80008a02:	4785                	li	a5,1
    80008a04:	00f70963          	beq	a4,a5,80008a16 <OSQFlush+0x48>
    80008a08:	6782                	ld	a5,0(sp)
    80008a0a:	6719                	lui	a4,0x6
    80008a0c:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80008a10:	c398                	sw	a4,0(a5)
    80008a12:	4781                	li	a5,0
    80008a14:	a8b1                	j	80008a70 <OSQFlush+0xa2>
    80008a16:	67a2                	ld	a5,8(sp)
    80008a18:	eb81                	bnez	a5,80008a28 <OSQFlush+0x5a>
    80008a1a:	6782                	ld	a5,0(sp)
    80008a1c:	6719                	lui	a4,0x6
    80008a1e:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80008a22:	c398                	sw	a4,0(a5)
    80008a24:	4781                	li	a5,0
    80008a26:	a0a9                	j	80008a70 <OSQFlush+0xa2>
    80008a28:	67a2                	ld	a5,8(sp)
    80008a2a:	439c                	lw	a5,0(a5)
    80008a2c:	873e                	mv	a4,a5
    80008a2e:	554557b7          	lui	a5,0x55455
    80008a32:	55178793          	add	a5,a5,1361 # 55455551 <CPU_MSTATUS_MIE+0x55455549>
    80008a36:	00f70963          	beq	a4,a5,80008a48 <OSQFlush+0x7a>
    80008a3a:	6782                	ld	a5,0(sp)
    80008a3c:	6719                	lui	a4,0x6
    80008a3e:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80008a42:	c398                	sw	a4,0(a5)
    80008a44:	4781                	li	a5,0
    80008a46:	a02d                	j	80008a70 <OSQFlush+0xa2>
    80008a48:	8c7f80ef          	jal	8000130e <CPU_SR_Save>
    80008a4c:	ec2a                	sd	a0,24(sp)
    80008a4e:	67a2                	ld	a5,8(sp)
    80008a50:	04078793          	add	a5,a5,64
    80008a54:	853e                	mv	a0,a5
    80008a56:	eb0fa0ef          	jal	80003106 <OS_MsgQFreeAll>
    80008a5a:	87aa                	mv	a5,a0
    80008a5c:	00f11b23          	sh	a5,22(sp)
    80008a60:	6562                	ld	a0,24(sp)
    80008a62:	8b9f80ef          	jal	8000131a <CPU_SR_Restore>
    80008a66:	6782                	ld	a5,0(sp)
    80008a68:	0007a023          	sw	zero,0(a5)
    80008a6c:	01615783          	lhu	a5,22(sp)
    80008a70:	853e                	mv	a0,a5
    80008a72:	70a2                	ld	ra,40(sp)
    80008a74:	6145                	add	sp,sp,48
    80008a76:	8082                	ret

0000000080008a78 <OSQPend>:
    80008a78:	715d                	add	sp,sp,-80
    80008a7a:	e486                	sd	ra,72(sp)
    80008a7c:	f42a                	sd	a0,40(sp)
    80008a7e:	ec36                	sd	a3,24(sp)
    80008a80:	e83a                	sd	a4,16(sp)
    80008a82:	e43e                	sd	a5,8(sp)
    80008a84:	87ae                	mv	a5,a1
    80008a86:	d23e                	sw	a5,36(sp)
    80008a88:	87b2                	mv	a5,a2
    80008a8a:	02f11123          	sh	a5,34(sp)
    80008a8e:	f802                	sd	zero,48(sp)
    80008a90:	00003797          	auipc	a5,0x3
    80008a94:	e7c78793          	add	a5,a5,-388 # 8000b90c <OSIntNestingCtr>
    80008a98:	0007c783          	lbu	a5,0(a5)
    80008a9c:	cf81                	beqz	a5,80008ab4 <OSQPend+0x3c>
    80008a9e:	02211783          	lh	a5,34(sp)
    80008aa2:	0007c963          	bltz	a5,80008ab4 <OSQPend+0x3c>
    80008aa6:	67a2                	ld	a5,8(sp)
    80008aa8:	6719                	lui	a4,0x6
    80008aaa:	1ae70713          	add	a4,a4,430 # 61ae <CPU_MSTATUS_MIE+0x61a6>
    80008aae:	c398                	sw	a4,0(a5)
    80008ab0:	4781                	li	a5,0
    80008ab2:	a2c5                	j	80008c92 <OSQPend+0x21a>
    80008ab4:	00003797          	auipc	a5,0x3
    80008ab8:	e5978793          	add	a5,a5,-423 # 8000b90d <OSRunning>
    80008abc:	0007c783          	lbu	a5,0(a5)
    80008ac0:	873e                	mv	a4,a5
    80008ac2:	4785                	li	a5,1
    80008ac4:	00f70963          	beq	a4,a5,80008ad6 <OSQPend+0x5e>
    80008ac8:	67a2                	ld	a5,8(sp)
    80008aca:	6719                	lui	a4,0x6
    80008acc:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80008ad0:	c398                	sw	a4,0(a5)
    80008ad2:	4781                	li	a5,0
    80008ad4:	aa7d                	j	80008c92 <OSQPend+0x21a>
    80008ad6:	77a2                	ld	a5,40(sp)
    80008ad8:	eb81                	bnez	a5,80008ae8 <OSQPend+0x70>
    80008ada:	67a2                	ld	a5,8(sp)
    80008adc:	6719                	lui	a4,0x6
    80008ade:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80008ae2:	c398                	sw	a4,0(a5)
    80008ae4:	4781                	li	a5,0
    80008ae6:	a275                	j	80008c92 <OSQPend+0x21a>
    80008ae8:	67e2                	ld	a5,24(sp)
    80008aea:	eb81                	bnez	a5,80008afa <OSQPend+0x82>
    80008aec:	67a2                	ld	a5,8(sp)
    80008aee:	6719                	lui	a4,0x6
    80008af0:	2d570713          	add	a4,a4,725 # 62d5 <CPU_MSTATUS_MIE+0x62cd>
    80008af4:	c398                	sw	a4,0(a5)
    80008af6:	4781                	li	a5,0
    80008af8:	aa69                	j	80008c92 <OSQPend+0x21a>
    80008afa:	02215783          	lhu	a5,34(sp)
    80008afe:	2781                	sext.w	a5,a5
    80008b00:	cf81                	beqz	a5,80008b18 <OSQPend+0xa0>
    80008b02:	873e                	mv	a4,a5
    80008b04:	67a1                	lui	a5,0x8
    80008b06:	00f70963          	beq	a4,a5,80008b18 <OSQPend+0xa0>
    80008b0a:	67a2                	ld	a5,8(sp)
    80008b0c:	6719                	lui	a4,0x6
    80008b0e:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80008b12:	c398                	sw	a4,0(a5)
    80008b14:	4781                	li	a5,0
    80008b16:	aab5                	j	80008c92 <OSQPend+0x21a>
    80008b18:	0001                	nop
    80008b1a:	77a2                	ld	a5,40(sp)
    80008b1c:	439c                	lw	a5,0(a5)
    80008b1e:	873e                	mv	a4,a5
    80008b20:	554557b7          	lui	a5,0x55455
    80008b24:	55178793          	add	a5,a5,1361 # 55455551 <CPU_MSTATUS_MIE+0x55455549>
    80008b28:	00f70963          	beq	a4,a5,80008b3a <OSQPend+0xc2>
    80008b2c:	67a2                	ld	a5,8(sp)
    80008b2e:	6719                	lui	a4,0x6
    80008b30:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80008b34:	c398                	sw	a4,0(a5)
    80008b36:	4781                	li	a5,0
    80008b38:	aaa9                	j	80008c92 <OSQPend+0x21a>
    80008b3a:	67c2                	ld	a5,16(sp)
    80008b3c:	c781                	beqz	a5,80008b44 <OSQPend+0xcc>
    80008b3e:	67c2                	ld	a5,16(sp)
    80008b40:	0007a023          	sw	zero,0(a5)
    80008b44:	fcaf80ef          	jal	8000130e <CPU_SR_Save>
    80008b48:	f82a                	sd	a0,48(sp)
    80008b4a:	77a2                	ld	a5,40(sp)
    80008b4c:	04078793          	add	a5,a5,64
    80008b50:	66a2                	ld	a3,8(sp)
    80008b52:	6642                	ld	a2,16(sp)
    80008b54:	65e2                	ld	a1,24(sp)
    80008b56:	853e                	mv	a0,a5
    80008b58:	e88fa0ef          	jal	800031e0 <OS_MsgQGet>
    80008b5c:	fc2a                	sd	a0,56(sp)
    80008b5e:	67a2                	ld	a5,8(sp)
    80008b60:	439c                	lw	a5,0(a5)
    80008b62:	e791                	bnez	a5,80008b6e <OSQPend+0xf6>
    80008b64:	7542                	ld	a0,48(sp)
    80008b66:	fb4f80ef          	jal	8000131a <CPU_SR_Restore>
    80008b6a:	77e2                	ld	a5,56(sp)
    80008b6c:	a21d                	j	80008c92 <OSQPend+0x21a>
    80008b6e:	02211783          	lh	a5,34(sp)
    80008b72:	0007dc63          	bgez	a5,80008b8a <OSQPend+0x112>
    80008b76:	7542                	ld	a0,48(sp)
    80008b78:	fa2f80ef          	jal	8000131a <CPU_SR_Restore>
    80008b7c:	67a2                	ld	a5,8(sp)
    80008b7e:	6719                	lui	a4,0x6
    80008b80:	1b070713          	add	a4,a4,432 # 61b0 <CPU_MSTATUS_MIE+0x61a8>
    80008b84:	c398                	sw	a4,0(a5)
    80008b86:	4781                	li	a5,0
    80008b88:	a229                	j	80008c92 <OSQPend+0x21a>
    80008b8a:	00003797          	auipc	a5,0x3
    80008b8e:	dd078793          	add	a5,a5,-560 # 8000b95a <OSSchedLockNestingCtr>
    80008b92:	0007c783          	lbu	a5,0(a5)
    80008b96:	cb99                	beqz	a5,80008bac <OSQPend+0x134>
    80008b98:	7542                	ld	a0,48(sp)
    80008b9a:	f80f80ef          	jal	8000131a <CPU_SR_Restore>
    80008b9e:	67a2                	ld	a5,8(sp)
    80008ba0:	671d                	lui	a4,0x7
    80008ba2:	d6370713          	add	a4,a4,-669 # 6d63 <CPU_MSTATUS_MIE+0x6d5b>
    80008ba6:	c398                	sw	a4,0(a5)
    80008ba8:	4781                	li	a5,0
    80008baa:	a0e5                	j	80008c92 <OSQPend+0x21a>
    80008bac:	00003797          	auipc	a5,0x3
    80008bb0:	e1c78793          	add	a5,a5,-484 # 8000b9c8 <OSTCBCurPtr>
    80008bb4:	639c                	ld	a5,0(a5)
    80008bb6:	5712                	lw	a4,36(sp)
    80008bb8:	86ba                	mv	a3,a4
    80008bba:	4615                	li	a2,5
    80008bbc:	85be                	mv	a1,a5
    80008bbe:	7522                	ld	a0,40(sp)
    80008bc0:	b1ffc0ef          	jal	800056de <OS_Pend>
    80008bc4:	7542                	ld	a0,48(sp)
    80008bc6:	f54f80ef          	jal	8000131a <CPU_SR_Restore>
    80008bca:	d7cfc0ef          	jal	80005146 <OSSched>
    80008bce:	f40f80ef          	jal	8000130e <CPU_SR_Save>
    80008bd2:	f82a                	sd	a0,48(sp)
    80008bd4:	00003797          	auipc	a5,0x3
    80008bd8:	df478793          	add	a5,a5,-524 # 8000b9c8 <OSTCBCurPtr>
    80008bdc:	639c                	ld	a5,0(a5)
    80008bde:	0717c783          	lbu	a5,113(a5)
    80008be2:	2781                	sext.w	a5,a5
    80008be4:	86be                	mv	a3,a5
    80008be6:	470d                	li	a4,3
    80008be8:	06e68363          	beq	a3,a4,80008c4e <OSQPend+0x1d6>
    80008bec:	86be                	mv	a3,a5
    80008bee:	470d                	li	a4,3
    80008bf0:	08d74363          	blt	a4,a3,80008c76 <OSQPend+0x1fe>
    80008bf4:	86be                	mv	a3,a5
    80008bf6:	4709                	li	a4,2
    80008bf8:	06e68563          	beq	a3,a4,80008c62 <OSQPend+0x1ea>
    80008bfc:	86be                	mv	a3,a5
    80008bfe:	4709                	li	a4,2
    80008c00:	06d74b63          	blt	a4,a3,80008c76 <OSQPend+0x1fe>
    80008c04:	c791                	beqz	a5,80008c10 <OSQPend+0x198>
    80008c06:	873e                	mv	a4,a5
    80008c08:	4785                	li	a5,1
    80008c0a:	02f70863          	beq	a4,a5,80008c3a <OSQPend+0x1c2>
    80008c0e:	a0a5                	j	80008c76 <OSQPend+0x1fe>
    80008c10:	00003797          	auipc	a5,0x3
    80008c14:	db878793          	add	a5,a5,-584 # 8000b9c8 <OSTCBCurPtr>
    80008c18:	639c                	ld	a5,0(a5)
    80008c1a:	73dc                	ld	a5,160(a5)
    80008c1c:	fc3e                	sd	a5,56(sp)
    80008c1e:	00003797          	auipc	a5,0x3
    80008c22:	daa78793          	add	a5,a5,-598 # 8000b9c8 <OSTCBCurPtr>
    80008c26:	639c                	ld	a5,0(a5)
    80008c28:	0a87d703          	lhu	a4,168(a5)
    80008c2c:	67e2                	ld	a5,24(sp)
    80008c2e:	00e79023          	sh	a4,0(a5)
    80008c32:	67a2                	ld	a5,8(sp)
    80008c34:	0007a023          	sw	zero,0(a5)
    80008c38:	a889                	j	80008c8a <OSQPend+0x212>
    80008c3a:	fc02                	sd	zero,56(sp)
    80008c3c:	67e2                	ld	a5,24(sp)
    80008c3e:	00079023          	sh	zero,0(a5)
    80008c42:	67a2                	ld	a5,8(sp)
    80008c44:	6719                	lui	a4,0x6
    80008c46:	1a970713          	add	a4,a4,425 # 61a9 <CPU_MSTATUS_MIE+0x61a1>
    80008c4a:	c398                	sw	a4,0(a5)
    80008c4c:	a83d                	j	80008c8a <OSQPend+0x212>
    80008c4e:	fc02                	sd	zero,56(sp)
    80008c50:	67e2                	ld	a5,24(sp)
    80008c52:	00079023          	sh	zero,0(a5)
    80008c56:	67a2                	ld	a5,8(sp)
    80008c58:	671d                	lui	a4,0x7
    80008c5a:	2d970713          	add	a4,a4,729 # 72d9 <CPU_MSTATUS_MIE+0x72d1>
    80008c5e:	c398                	sw	a4,0(a5)
    80008c60:	a02d                	j	80008c8a <OSQPend+0x212>
    80008c62:	fc02                	sd	zero,56(sp)
    80008c64:	67e2                	ld	a5,24(sp)
    80008c66:	00079023          	sh	zero,0(a5)
    80008c6a:	67a2                	ld	a5,8(sp)
    80008c6c:	6719                	lui	a4,0x6
    80008c6e:	dc270713          	add	a4,a4,-574 # 5dc2 <CPU_MSTATUS_MIE+0x5dba>
    80008c72:	c398                	sw	a4,0(a5)
    80008c74:	a819                	j	80008c8a <OSQPend+0x212>
    80008c76:	fc02                	sd	zero,56(sp)
    80008c78:	67e2                	ld	a5,24(sp)
    80008c7a:	00079023          	sh	zero,0(a5)
    80008c7e:	67a2                	ld	a5,8(sp)
    80008c80:	671d                	lui	a4,0x7
    80008c82:	e2e70713          	add	a4,a4,-466 # 6e2e <CPU_MSTATUS_MIE+0x6e26>
    80008c86:	c398                	sw	a4,0(a5)
    80008c88:	0001                	nop
    80008c8a:	7542                	ld	a0,48(sp)
    80008c8c:	e8ef80ef          	jal	8000131a <CPU_SR_Restore>
    80008c90:	77e2                	ld	a5,56(sp)
    80008c92:	853e                	mv	a0,a5
    80008c94:	60a6                	ld	ra,72(sp)
    80008c96:	6161                	add	sp,sp,80
    80008c98:	8082                	ret

0000000080008c9a <OSQPendAbort>:
    80008c9a:	711d                	add	sp,sp,-96
    80008c9c:	ec86                	sd	ra,88(sp)
    80008c9e:	ec2a                	sd	a0,24(sp)
    80008ca0:	87ae                	mv	a5,a1
    80008ca2:	e432                	sd	a2,8(sp)
    80008ca4:	00f11b23          	sh	a5,22(sp)
    80008ca8:	e082                	sd	zero,64(sp)
    80008caa:	00003797          	auipc	a5,0x3
    80008cae:	c6278793          	add	a5,a5,-926 # 8000b90c <OSIntNestingCtr>
    80008cb2:	0007c783          	lbu	a5,0(a5)
    80008cb6:	cb81                	beqz	a5,80008cc6 <OSQPendAbort+0x2c>
    80008cb8:	67a2                	ld	a5,8(sp)
    80008cba:	6719                	lui	a4,0x6
    80008cbc:	1aa70713          	add	a4,a4,426 # 61aa <CPU_MSTATUS_MIE+0x61a2>
    80008cc0:	c398                	sw	a4,0(a5)
    80008cc2:	4781                	li	a5,0
    80008cc4:	a205                	j	80008de4 <OSQPendAbort+0x14a>
    80008cc6:	00003797          	auipc	a5,0x3
    80008cca:	c4778793          	add	a5,a5,-953 # 8000b90d <OSRunning>
    80008cce:	0007c783          	lbu	a5,0(a5)
    80008cd2:	873e                	mv	a4,a5
    80008cd4:	4785                	li	a5,1
    80008cd6:	00f70963          	beq	a4,a5,80008ce8 <OSQPendAbort+0x4e>
    80008cda:	67a2                	ld	a5,8(sp)
    80008cdc:	6719                	lui	a4,0x6
    80008cde:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80008ce2:	c398                	sw	a4,0(a5)
    80008ce4:	4781                	li	a5,0
    80008ce6:	a8fd                	j	80008de4 <OSQPendAbort+0x14a>
    80008ce8:	67e2                	ld	a5,24(sp)
    80008cea:	eb81                	bnez	a5,80008cfa <OSQPendAbort+0x60>
    80008cec:	67a2                	ld	a5,8(sp)
    80008cee:	6719                	lui	a4,0x6
    80008cf0:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80008cf4:	c398                	sw	a4,0(a5)
    80008cf6:	4781                	li	a5,0
    80008cf8:	a0f5                	j	80008de4 <OSQPendAbort+0x14a>
    80008cfa:	01615783          	lhu	a5,22(sp)
    80008cfe:	2781                	sext.w	a5,a5
    80008d00:	86be                	mv	a3,a5
    80008d02:	6721                	lui	a4,0x8
    80008d04:	10070713          	add	a4,a4,256 # 8100 <CPU_MSTATUS_MIE+0x80f8>
    80008d08:	02e68d63          	beq	a3,a4,80008d42 <OSQPendAbort+0xa8>
    80008d0c:	86be                	mv	a3,a5
    80008d0e:	6721                	lui	a4,0x8
    80008d10:	10070713          	add	a4,a4,256 # 8100 <CPU_MSTATUS_MIE+0x80f8>
    80008d14:	02d74063          	blt	a4,a3,80008d34 <OSQPendAbort+0x9a>
    80008d18:	86be                	mv	a3,a5
    80008d1a:	6721                	lui	a4,0x8
    80008d1c:	02e68363          	beq	a3,a4,80008d42 <OSQPendAbort+0xa8>
    80008d20:	86be                	mv	a3,a5
    80008d22:	6721                	lui	a4,0x8
    80008d24:	00d74863          	blt	a4,a3,80008d34 <OSQPendAbort+0x9a>
    80008d28:	cf89                	beqz	a5,80008d42 <OSQPendAbort+0xa8>
    80008d2a:	873e                	mv	a4,a5
    80008d2c:	10000793          	li	a5,256
    80008d30:	00f70963          	beq	a4,a5,80008d42 <OSQPendAbort+0xa8>
    80008d34:	67a2                	ld	a5,8(sp)
    80008d36:	6719                	lui	a4,0x6
    80008d38:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80008d3c:	c398                	sw	a4,0(a5)
    80008d3e:	4781                	li	a5,0
    80008d40:	a055                	j	80008de4 <OSQPendAbort+0x14a>
    80008d42:	0001                	nop
    80008d44:	67e2                	ld	a5,24(sp)
    80008d46:	439c                	lw	a5,0(a5)
    80008d48:	873e                	mv	a4,a5
    80008d4a:	554557b7          	lui	a5,0x55455
    80008d4e:	55178793          	add	a5,a5,1361 # 55455551 <CPU_MSTATUS_MIE+0x55455549>
    80008d52:	00f70963          	beq	a4,a5,80008d64 <OSQPendAbort+0xca>
    80008d56:	67a2                	ld	a5,8(sp)
    80008d58:	6719                	lui	a4,0x6
    80008d5a:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80008d5e:	c398                	sw	a4,0(a5)
    80008d60:	4781                	li	a5,0
    80008d62:	a049                	j	80008de4 <OSQPendAbort+0x14a>
    80008d64:	daaf80ef          	jal	8000130e <CPU_SR_Save>
    80008d68:	e0aa                	sd	a0,64(sp)
    80008d6a:	67e2                	ld	a5,24(sp)
    80008d6c:	07c1                	add	a5,a5,16
    80008d6e:	fc3e                	sd	a5,56(sp)
    80008d70:	77e2                	ld	a5,56(sp)
    80008d72:	639c                	ld	a5,0(a5)
    80008d74:	eb99                	bnez	a5,80008d8a <OSQPendAbort+0xf0>
    80008d76:	6506                	ld	a0,64(sp)
    80008d78:	da2f80ef          	jal	8000131a <CPU_SR_Restore>
    80008d7c:	67a2                	ld	a5,8(sp)
    80008d7e:	6719                	lui	a4,0x6
    80008d80:	1ab70713          	add	a4,a4,427 # 61ab <CPU_MSTATUS_MIE+0x61a3>
    80008d84:	c398                	sw	a4,0(a5)
    80008d86:	4781                	li	a5,0
    80008d88:	a8b1                	j	80008de4 <OSQPendAbort+0x14a>
    80008d8a:	04011723          	sh	zero,78(sp)
    80008d8e:	da02                	sw	zero,52(sp)
    80008d90:	a03d                	j	80008dbe <OSQPendAbort+0x124>
    80008d92:	77e2                	ld	a5,56(sp)
    80008d94:	639c                	ld	a5,0(a5)
    80008d96:	f43e                	sd	a5,40(sp)
    80008d98:	57d2                	lw	a5,52(sp)
    80008d9a:	4605                	li	a2,1
    80008d9c:	85be                	mv	a1,a5
    80008d9e:	7522                	ld	a0,40(sp)
    80008da0:	99dfc0ef          	jal	8000573c <OS_PendAbort>
    80008da4:	04e15783          	lhu	a5,78(sp)
    80008da8:	2785                	addw	a5,a5,1
    80008daa:	04f11723          	sh	a5,78(sp)
    80008dae:	01615783          	lhu	a5,22(sp)
    80008db2:	0007871b          	sext.w	a4,a5
    80008db6:	10000793          	li	a5,256
    80008dba:	00f71663          	bne	a4,a5,80008dc6 <OSQPendAbort+0x12c>
    80008dbe:	77e2                	ld	a5,56(sp)
    80008dc0:	639c                	ld	a5,0(a5)
    80008dc2:	fbe1                	bnez	a5,80008d92 <OSQPendAbort+0xf8>
    80008dc4:	a011                	j	80008dc8 <OSQPendAbort+0x12e>
    80008dc6:	0001                	nop
    80008dc8:	6506                	ld	a0,64(sp)
    80008dca:	d50f80ef          	jal	8000131a <CPU_SR_Restore>
    80008dce:	01611783          	lh	a5,22(sp)
    80008dd2:	0007c463          	bltz	a5,80008dda <OSQPendAbort+0x140>
    80008dd6:	b70fc0ef          	jal	80005146 <OSSched>
    80008dda:	67a2                	ld	a5,8(sp)
    80008ddc:	0007a023          	sw	zero,0(a5)
    80008de0:	04e15783          	lhu	a5,78(sp)
    80008de4:	853e                	mv	a0,a5
    80008de6:	60e6                	ld	ra,88(sp)
    80008de8:	6125                	add	sp,sp,96
    80008dea:	8082                	ret

0000000080008dec <OSQPost>:
    80008dec:	711d                	add	sp,sp,-96
    80008dee:	ec86                	sd	ra,88(sp)
    80008df0:	ec2a                	sd	a0,24(sp)
    80008df2:	e82e                	sd	a1,16(sp)
    80008df4:	87b2                	mv	a5,a2
    80008df6:	e03a                	sd	a4,0(sp)
    80008df8:	00f11723          	sh	a5,14(sp)
    80008dfc:	87b6                	mv	a5,a3
    80008dfe:	00f11623          	sh	a5,12(sp)
    80008e02:	fc02                	sd	zero,56(sp)
    80008e04:	00003797          	auipc	a5,0x3
    80008e08:	b0978793          	add	a5,a5,-1271 # 8000b90d <OSRunning>
    80008e0c:	0007c783          	lbu	a5,0(a5)
    80008e10:	873e                	mv	a4,a5
    80008e12:	4785                	li	a5,1
    80008e14:	00f70863          	beq	a4,a5,80008e24 <OSQPost+0x38>
    80008e18:	6782                	ld	a5,0(sp)
    80008e1a:	6719                	lui	a4,0x6
    80008e1c:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80008e20:	c398                	sw	a4,0(a5)
    80008e22:	a2a5                	j	80008f8a <OSQPost+0x19e>
    80008e24:	67e2                	ld	a5,24(sp)
    80008e26:	e799                	bnez	a5,80008e34 <OSQPost+0x48>
    80008e28:	6782                	ld	a5,0(sp)
    80008e2a:	6719                	lui	a4,0x6
    80008e2c:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    80008e30:	c398                	sw	a4,0(a5)
    80008e32:	aaa1                	j	80008f8a <OSQPost+0x19e>
    80008e34:	00c15783          	lhu	a5,12(sp)
    80008e38:	2781                	sext.w	a5,a5
    80008e3a:	86be                	mv	a3,a5
    80008e3c:	6721                	lui	a4,0x8
    80008e3e:	21070713          	add	a4,a4,528 # 8210 <CPU_MSTATUS_MIE+0x8208>
    80008e42:	08e68563          	beq	a3,a4,80008ecc <OSQPost+0xe0>
    80008e46:	86be                	mv	a3,a5
    80008e48:	6721                	lui	a4,0x8
    80008e4a:	21070713          	add	a4,a4,528 # 8210 <CPU_MSTATUS_MIE+0x8208>
    80008e4e:	06d74963          	blt	a4,a3,80008ec0 <OSQPost+0xd4>
    80008e52:	86be                	mv	a3,a5
    80008e54:	6721                	lui	a4,0x8
    80008e56:	20070713          	add	a4,a4,512 # 8200 <CPU_MSTATUS_MIE+0x81f8>
    80008e5a:	06e68963          	beq	a3,a4,80008ecc <OSQPost+0xe0>
    80008e5e:	86be                	mv	a3,a5
    80008e60:	6721                	lui	a4,0x8
    80008e62:	20070713          	add	a4,a4,512 # 8200 <CPU_MSTATUS_MIE+0x81f8>
    80008e66:	04d74d63          	blt	a4,a3,80008ec0 <OSQPost+0xd4>
    80008e6a:	86be                	mv	a3,a5
    80008e6c:	6721                	lui	a4,0x8
    80008e6e:	0741                	add	a4,a4,16 # 8010 <CPU_MSTATUS_MIE+0x8008>
    80008e70:	04e68e63          	beq	a3,a4,80008ecc <OSQPost+0xe0>
    80008e74:	86be                	mv	a3,a5
    80008e76:	6721                	lui	a4,0x8
    80008e78:	0741                	add	a4,a4,16 # 8010 <CPU_MSTATUS_MIE+0x8008>
    80008e7a:	04d74363          	blt	a4,a3,80008ec0 <OSQPost+0xd4>
    80008e7e:	86be                	mv	a3,a5
    80008e80:	6721                	lui	a4,0x8
    80008e82:	04e68563          	beq	a3,a4,80008ecc <OSQPost+0xe0>
    80008e86:	86be                	mv	a3,a5
    80008e88:	6721                	lui	a4,0x8
    80008e8a:	02d74b63          	blt	a4,a3,80008ec0 <OSQPost+0xd4>
    80008e8e:	86be                	mv	a3,a5
    80008e90:	21000713          	li	a4,528
    80008e94:	02e68c63          	beq	a3,a4,80008ecc <OSQPost+0xe0>
    80008e98:	86be                	mv	a3,a5
    80008e9a:	21000713          	li	a4,528
    80008e9e:	02d74163          	blt	a4,a3,80008ec0 <OSQPost+0xd4>
    80008ea2:	86be                	mv	a3,a5
    80008ea4:	20000713          	li	a4,512
    80008ea8:	02e68263          	beq	a3,a4,80008ecc <OSQPost+0xe0>
    80008eac:	86be                	mv	a3,a5
    80008eae:	20000713          	li	a4,512
    80008eb2:	00d74763          	blt	a4,a3,80008ec0 <OSQPost+0xd4>
    80008eb6:	cb99                	beqz	a5,80008ecc <OSQPost+0xe0>
    80008eb8:	873e                	mv	a4,a5
    80008eba:	47c1                	li	a5,16
    80008ebc:	00f70863          	beq	a4,a5,80008ecc <OSQPost+0xe0>
    80008ec0:	6782                	ld	a5,0(sp)
    80008ec2:	6719                	lui	a4,0x6
    80008ec4:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80008ec8:	c398                	sw	a4,0(a5)
    80008eca:	a0c1                	j	80008f8a <OSQPost+0x19e>
    80008ecc:	0001                	nop
    80008ece:	67e2                	ld	a5,24(sp)
    80008ed0:	439c                	lw	a5,0(a5)
    80008ed2:	873e                	mv	a4,a5
    80008ed4:	554557b7          	lui	a5,0x55455
    80008ed8:	55178793          	add	a5,a5,1361 # 55455551 <CPU_MSTATUS_MIE+0x55455549>
    80008edc:	00f70863          	beq	a4,a5,80008eec <OSQPost+0x100>
    80008ee0:	6782                	ld	a5,0(sp)
    80008ee2:	6719                	lui	a4,0x6
    80008ee4:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80008ee8:	c398                	sw	a4,0(a5)
    80008eea:	a045                	j	80008f8a <OSQPost+0x19e>
    80008eec:	da02                	sw	zero,52(sp)
    80008eee:	c20f80ef          	jal	8000130e <CPU_SR_Save>
    80008ef2:	fc2a                	sd	a0,56(sp)
    80008ef4:	67e2                	ld	a5,24(sp)
    80008ef6:	07c1                	add	a5,a5,16
    80008ef8:	f43e                	sd	a5,40(sp)
    80008efa:	77a2                	ld	a5,40(sp)
    80008efc:	639c                	ld	a5,0(a5)
    80008efe:	ef8d                	bnez	a5,80008f38 <OSQPost+0x14c>
    80008f00:	00c15783          	lhu	a5,12(sp)
    80008f04:	2781                	sext.w	a5,a5
    80008f06:	8bc1                	and	a5,a5,16
    80008f08:	2781                	sext.w	a5,a5
    80008f0a:	e781                	bnez	a5,80008f12 <OSQPost+0x126>
    80008f0c:	04011723          	sh	zero,78(sp)
    80008f10:	a021                	j	80008f18 <OSQPost+0x12c>
    80008f12:	47c1                	li	a5,16
    80008f14:	04f11723          	sh	a5,78(sp)
    80008f18:	67e2                	ld	a5,24(sp)
    80008f1a:	04078513          	add	a0,a5,64
    80008f1e:	5752                	lw	a4,52(sp)
    80008f20:	04e15683          	lhu	a3,78(sp)
    80008f24:	00e15603          	lhu	a2,14(sp)
    80008f28:	6782                	ld	a5,0(sp)
    80008f2a:	65c2                	ld	a1,16(sp)
    80008f2c:	b8afa0ef          	jal	800032b6 <OS_MsgQPut>
    80008f30:	7562                	ld	a0,56(sp)
    80008f32:	be8f80ef          	jal	8000131a <CPU_SR_Restore>
    80008f36:	a891                	j	80008f8a <OSQPost+0x19e>
    80008f38:	77a2                	ld	a5,40(sp)
    80008f3a:	639c                	ld	a5,0(a5)
    80008f3c:	e0be                	sd	a5,64(sp)
    80008f3e:	a035                	j	80008f6a <OSQPost+0x17e>
    80008f40:	6786                	ld	a5,64(sp)
    80008f42:	6fbc                	ld	a5,88(a5)
    80008f44:	f03e                	sd	a5,32(sp)
    80008f46:	5752                	lw	a4,52(sp)
    80008f48:	00e15783          	lhu	a5,14(sp)
    80008f4c:	86be                	mv	a3,a5
    80008f4e:	6642                	ld	a2,16(sp)
    80008f50:	6586                	ld	a1,64(sp)
    80008f52:	6562                	ld	a0,24(sp)
    80008f54:	b3bfc0ef          	jal	80005a8e <OS_Post>
    80008f58:	00c15783          	lhu	a5,12(sp)
    80008f5c:	2781                	sext.w	a5,a5
    80008f5e:	2007f793          	and	a5,a5,512
    80008f62:	2781                	sext.w	a5,a5
    80008f64:	c791                	beqz	a5,80008f70 <OSQPost+0x184>
    80008f66:	7782                	ld	a5,32(sp)
    80008f68:	e0be                	sd	a5,64(sp)
    80008f6a:	6786                	ld	a5,64(sp)
    80008f6c:	fbf1                	bnez	a5,80008f40 <OSQPost+0x154>
    80008f6e:	a011                	j	80008f72 <OSQPost+0x186>
    80008f70:	0001                	nop
    80008f72:	7562                	ld	a0,56(sp)
    80008f74:	ba6f80ef          	jal	8000131a <CPU_SR_Restore>
    80008f78:	00c11783          	lh	a5,12(sp)
    80008f7c:	0007c463          	bltz	a5,80008f84 <OSQPost+0x198>
    80008f80:	9c6fc0ef          	jal	80005146 <OSSched>
    80008f84:	6782                	ld	a5,0(sp)
    80008f86:	0007a023          	sw	zero,0(a5)
    80008f8a:	60e6                	ld	ra,88(sp)
    80008f8c:	6125                	add	sp,sp,96
    80008f8e:	8082                	ret

0000000080008f90 <OS_QClr>:
    80008f90:	1101                	add	sp,sp,-32
    80008f92:	ec06                	sd	ra,24(sp)
    80008f94:	e42a                	sd	a0,8(sp)
    80008f96:	67a2                	ld	a5,8(sp)
    80008f98:	04078793          	add	a5,a5,64
    80008f9c:	853e                	mv	a0,a5
    80008f9e:	968fa0ef          	jal	80003106 <OS_MsgQFreeAll>
    80008fa2:	67a2                	ld	a5,8(sp)
    80008fa4:	454e5737          	lui	a4,0x454e5
    80008fa8:	f4e70713          	add	a4,a4,-178 # 454e4f4e <CPU_MSTATUS_MIE+0x454e4f46>
    80008fac:	c398                	sw	a4,0(a5)
    80008fae:	67a2                	ld	a5,8(sp)
    80008fb0:	00002717          	auipc	a4,0x2
    80008fb4:	70870713          	add	a4,a4,1800 # 8000b6b8 <OSDbg_Tmr+0x80>
    80008fb8:	e798                	sd	a4,8(a5)
    80008fba:	67a2                	ld	a5,8(sp)
    80008fbc:	04078793          	add	a5,a5,64
    80008fc0:	4581                	li	a1,0
    80008fc2:	853e                	mv	a0,a5
    80008fc4:	9eafa0ef          	jal	800031ae <OS_MsgQInit>
    80008fc8:	67a2                	ld	a5,8(sp)
    80008fca:	07c1                	add	a5,a5,16
    80008fcc:	853e                	mv	a0,a5
    80008fce:	92dfc0ef          	jal	800058fa <OS_PendListInit>
    80008fd2:	0001                	nop
    80008fd4:	60e2                	ld	ra,24(sp)
    80008fd6:	6105                	add	sp,sp,32
    80008fd8:	8082                	ret

0000000080008fda <OS_QDbgListAdd>:
    80008fda:	1141                	add	sp,sp,-16
    80008fdc:	e42a                	sd	a0,8(sp)
    80008fde:	67a2                	ld	a5,8(sp)
    80008fe0:	00002717          	auipc	a4,0x2
    80008fe4:	6e070713          	add	a4,a4,1760 # 8000b6c0 <OSDbg_Tmr+0x88>
    80008fe8:	ff98                	sd	a4,56(a5)
    80008fea:	67a2                	ld	a5,8(sp)
    80008fec:	0207b423          	sd	zero,40(a5)
    80008ff0:	00003797          	auipc	a5,0x3
    80008ff4:	96078793          	add	a5,a5,-1696 # 8000b950 <OSQDbgListPtr>
    80008ff8:	639c                	ld	a5,0(a5)
    80008ffa:	e789                	bnez	a5,80009004 <OS_QDbgListAdd+0x2a>
    80008ffc:	67a2                	ld	a5,8(sp)
    80008ffe:	0207b823          	sd	zero,48(a5)
    80009002:	a839                	j	80009020 <OS_QDbgListAdd+0x46>
    80009004:	00003797          	auipc	a5,0x3
    80009008:	94c78793          	add	a5,a5,-1716 # 8000b950 <OSQDbgListPtr>
    8000900c:	6398                	ld	a4,0(a5)
    8000900e:	67a2                	ld	a5,8(sp)
    80009010:	fb98                	sd	a4,48(a5)
    80009012:	00003797          	auipc	a5,0x3
    80009016:	93e78793          	add	a5,a5,-1730 # 8000b950 <OSQDbgListPtr>
    8000901a:	639c                	ld	a5,0(a5)
    8000901c:	6722                	ld	a4,8(sp)
    8000901e:	f798                	sd	a4,40(a5)
    80009020:	00003797          	auipc	a5,0x3
    80009024:	93078793          	add	a5,a5,-1744 # 8000b950 <OSQDbgListPtr>
    80009028:	6722                	ld	a4,8(sp)
    8000902a:	e398                	sd	a4,0(a5)
    8000902c:	0001                	nop
    8000902e:	0141                	add	sp,sp,16
    80009030:	8082                	ret

0000000080009032 <OS_QDbgListRemove>:
    80009032:	1101                	add	sp,sp,-32
    80009034:	e42a                	sd	a0,8(sp)
    80009036:	67a2                	ld	a5,8(sp)
    80009038:	779c                	ld	a5,40(a5)
    8000903a:	ec3e                	sd	a5,24(sp)
    8000903c:	67a2                	ld	a5,8(sp)
    8000903e:	7b9c                	ld	a5,48(a5)
    80009040:	e83e                	sd	a5,16(sp)
    80009042:	67e2                	ld	a5,24(sp)
    80009044:	e385                	bnez	a5,80009064 <OS_QDbgListRemove+0x32>
    80009046:	00003797          	auipc	a5,0x3
    8000904a:	90a78793          	add	a5,a5,-1782 # 8000b950 <OSQDbgListPtr>
    8000904e:	6742                	ld	a4,16(sp)
    80009050:	e398                	sd	a4,0(a5)
    80009052:	67c2                	ld	a5,16(sp)
    80009054:	c781                	beqz	a5,8000905c <OS_QDbgListRemove+0x2a>
    80009056:	67c2                	ld	a5,16(sp)
    80009058:	0207b423          	sd	zero,40(a5)
    8000905c:	67a2                	ld	a5,8(sp)
    8000905e:	0207b823          	sd	zero,48(a5)
    80009062:	a035                	j	8000908e <OS_QDbgListRemove+0x5c>
    80009064:	67c2                	ld	a5,16(sp)
    80009066:	eb81                	bnez	a5,80009076 <OS_QDbgListRemove+0x44>
    80009068:	67e2                	ld	a5,24(sp)
    8000906a:	0207b823          	sd	zero,48(a5)
    8000906e:	67a2                	ld	a5,8(sp)
    80009070:	0207b423          	sd	zero,40(a5)
    80009074:	a829                	j	8000908e <OS_QDbgListRemove+0x5c>
    80009076:	67e2                	ld	a5,24(sp)
    80009078:	6742                	ld	a4,16(sp)
    8000907a:	fb98                	sd	a4,48(a5)
    8000907c:	67c2                	ld	a5,16(sp)
    8000907e:	6762                	ld	a4,24(sp)
    80009080:	f798                	sd	a4,40(a5)
    80009082:	67a2                	ld	a5,8(sp)
    80009084:	0207b823          	sd	zero,48(a5)
    80009088:	67a2                	ld	a5,8(sp)
    8000908a:	0207b423          	sd	zero,40(a5)
    8000908e:	0001                	nop
    80009090:	6105                	add	sp,sp,32
    80009092:	8082                	ret

0000000080009094 <OSTmrCreate>:
    80009094:	715d                	add	sp,sp,-80
    80009096:	e486                	sd	ra,72(sp)
    80009098:	fc2a                	sd	a0,56(sp)
    8000909a:	f82e                	sd	a1,48(sp)
    8000909c:	ec3e                	sd	a5,24(sp)
    8000909e:	e842                	sd	a6,16(sp)
    800090a0:	e446                	sd	a7,8(sp)
    800090a2:	87b2                	mv	a5,a2
    800090a4:	d63e                	sw	a5,44(sp)
    800090a6:	87b6                	mv	a5,a3
    800090a8:	d43e                	sw	a5,40(sp)
    800090aa:	87ba                	mv	a5,a4
    800090ac:	02f11323          	sh	a5,38(sp)
    800090b0:	00003797          	auipc	a5,0x3
    800090b4:	85c78793          	add	a5,a5,-1956 # 8000b90c <OSIntNestingCtr>
    800090b8:	0007c783          	lbu	a5,0(a5)
    800090bc:	c799                	beqz	a5,800090ca <OSTmrCreate+0x36>
    800090be:	67a2                	ld	a5,8(sp)
    800090c0:	671d                	lui	a4,0x7
    800090c2:	34370713          	add	a4,a4,835 # 7343 <CPU_MSTATUS_MIE+0x733b>
    800090c6:	c398                	sw	a4,0(a5)
    800090c8:	aa8d                	j	8000923a <OSTmrCreate+0x1a6>
    800090ca:	77e2                	ld	a5,56(sp)
    800090cc:	e799                	bnez	a5,800090da <OSTmrCreate+0x46>
    800090ce:	67a2                	ld	a5,8(sp)
    800090d0:	6719                	lui	a4,0x6
    800090d2:	dc370713          	add	a4,a4,-573 # 5dc3 <CPU_MSTATUS_MIE+0x5dbb>
    800090d6:	c398                	sw	a4,0(a5)
    800090d8:	a28d                	j	8000923a <OSTmrCreate+0x1a6>
    800090da:	02615783          	lhu	a5,38(sp)
    800090de:	0007871b          	sext.w	a4,a5
    800090e2:	86ba                	mv	a3,a4
    800090e4:	4785                	li	a5,1
    800090e6:	02f68663          	beq	a3,a5,80009112 <OSTmrCreate+0x7e>
    800090ea:	4789                	li	a5,2
    800090ec:	02f71c63          	bne	a4,a5,80009124 <OSTmrCreate+0x90>
    800090f0:	57a2                	lw	a5,40(sp)
    800090f2:	2781                	sext.w	a5,a5
    800090f4:	e799                	bnez	a5,80009102 <OSTmrCreate+0x6e>
    800090f6:	67a2                	ld	a5,8(sp)
    800090f8:	671d                	lui	a4,0x7
    800090fa:	34070713          	add	a4,a4,832 # 7340 <CPU_MSTATUS_MIE+0x7338>
    800090fe:	c398                	sw	a4,0(a5)
    80009100:	aa2d                	j	8000923a <OSTmrCreate+0x1a6>
    80009102:	67e2                	ld	a5,24(sp)
    80009104:	e795                	bnez	a5,80009130 <OSTmrCreate+0x9c>
    80009106:	67a2                	ld	a5,8(sp)
    80009108:	671d                	lui	a4,0x7
    8000910a:	34a70713          	add	a4,a4,842 # 734a <CPU_MSTATUS_MIE+0x7342>
    8000910e:	c398                	sw	a4,0(a5)
    80009110:	a22d                	j	8000923a <OSTmrCreate+0x1a6>
    80009112:	57b2                	lw	a5,44(sp)
    80009114:	2781                	sext.w	a5,a5
    80009116:	ef99                	bnez	a5,80009134 <OSTmrCreate+0xa0>
    80009118:	67a2                	ld	a5,8(sp)
    8000911a:	671d                	lui	a4,0x7
    8000911c:	33f70713          	add	a4,a4,831 # 733f <CPU_MSTATUS_MIE+0x7337>
    80009120:	c398                	sw	a4,0(a5)
    80009122:	aa21                	j	8000923a <OSTmrCreate+0x1a6>
    80009124:	67a2                	ld	a5,8(sp)
    80009126:	6719                	lui	a4,0x6
    80009128:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    8000912c:	c398                	sw	a4,0(a5)
    8000912e:	a231                	j	8000923a <OSTmrCreate+0x1a6>
    80009130:	0001                	nop
    80009132:	a011                	j	80009136 <OSTmrCreate+0xa2>
    80009134:	0001                	nop
    80009136:	00002797          	auipc	a5,0x2
    8000913a:	7d778793          	add	a5,a5,2007 # 8000b90d <OSRunning>
    8000913e:	0007c783          	lbu	a5,0(a5)
    80009142:	873e                	mv	a4,a5
    80009144:	4785                	li	a5,1
    80009146:	00f71463          	bne	a4,a5,8000914e <OSTmrCreate+0xba>
    8000914a:	04a010ef          	jal	8000a194 <OS_TmrLock>
    8000914e:	77e2                	ld	a5,56(sp)
    80009150:	439c                	lw	a5,0(a5)
    80009152:	873e                	mv	a4,a5
    80009154:	205257b7          	lui	a5,0x20525
    80009158:	d5478793          	add	a5,a5,-684 # 20524d54 <CPU_MSTATUS_MIE+0x20524d4c>
    8000915c:	02f71463          	bne	a4,a5,80009184 <OSTmrCreate+0xf0>
    80009160:	00002797          	auipc	a5,0x2
    80009164:	7ad78793          	add	a5,a5,1965 # 8000b90d <OSRunning>
    80009168:	0007c783          	lbu	a5,0(a5)
    8000916c:	873e                	mv	a4,a5
    8000916e:	4785                	li	a5,1
    80009170:	00f71463          	bne	a4,a5,80009178 <OSTmrCreate+0xe4>
    80009174:	042010ef          	jal	8000a1b6 <OS_TmrUnlock>
    80009178:	67a2                	ld	a5,8(sp)
    8000917a:	6719                	lui	a4,0x6
    8000917c:	dc170713          	add	a4,a4,-575 # 5dc1 <CPU_MSTATUS_MIE+0x5db9>
    80009180:	c398                	sw	a4,0(a5)
    80009182:	a865                	j	8000923a <OSTmrCreate+0x1a6>
    80009184:	77e2                	ld	a5,56(sp)
    80009186:	20525737          	lui	a4,0x20525
    8000918a:	d5470713          	add	a4,a4,-684 # 20524d54 <CPU_MSTATUS_MIE+0x20524d4c>
    8000918e:	c398                	sw	a4,0(a5)
    80009190:	77e2                	ld	a5,56(sp)
    80009192:	4705                	li	a4,1
    80009194:	02e78f23          	sb	a4,62(a5)
    80009198:	77e2                	ld	a5,56(sp)
    8000919a:	7742                	ld	a4,48(sp)
    8000919c:	e798                	sd	a4,8(a5)
    8000919e:	00003797          	auipc	a5,0x3
    800091a2:	82278793          	add	a5,a5,-2014 # 8000b9c0 <OSTmrToTicksMult>
    800091a6:	439c                	lw	a5,0(a5)
    800091a8:	5732                	lw	a4,44(sp)
    800091aa:	02f707bb          	mulw	a5,a4,a5
    800091ae:	0007871b          	sext.w	a4,a5
    800091b2:	77e2                	ld	a5,56(sp)
    800091b4:	dbd8                	sw	a4,52(a5)
    800091b6:	77e2                	ld	a5,56(sp)
    800091b8:	0207a823          	sw	zero,48(a5)
    800091bc:	00003797          	auipc	a5,0x3
    800091c0:	80478793          	add	a5,a5,-2044 # 8000b9c0 <OSTmrToTicksMult>
    800091c4:	439c                	lw	a5,0(a5)
    800091c6:	5722                	lw	a4,40(sp)
    800091c8:	02f707bb          	mulw	a5,a4,a5
    800091cc:	0007871b          	sext.w	a4,a5
    800091d0:	77e2                	ld	a5,56(sp)
    800091d2:	df98                	sw	a4,56(a5)
    800091d4:	77e2                	ld	a5,56(sp)
    800091d6:	02615703          	lhu	a4,38(sp)
    800091da:	02e79e23          	sh	a4,60(a5)
    800091de:	77e2                	ld	a5,56(sp)
    800091e0:	6762                	ld	a4,24(sp)
    800091e2:	eb98                	sd	a4,16(a5)
    800091e4:	77e2                	ld	a5,56(sp)
    800091e6:	6742                	ld	a4,16(sp)
    800091e8:	ef98                	sd	a4,24(a5)
    800091ea:	77e2                	ld	a5,56(sp)
    800091ec:	0207b023          	sd	zero,32(a5)
    800091f0:	77e2                	ld	a5,56(sp)
    800091f2:	0207b423          	sd	zero,40(a5)
    800091f6:	7562                	ld	a0,56(sp)
    800091f8:	11f000ef          	jal	80009b16 <OS_TmrDbgListAdd>
    800091fc:	00002797          	auipc	a5,0x2
    80009200:	7bc78793          	add	a5,a5,1980 # 8000b9b8 <OSTmrQty>
    80009204:	0007d783          	lhu	a5,0(a5)
    80009208:	2785                	addw	a5,a5,1
    8000920a:	03079713          	sll	a4,a5,0x30
    8000920e:	9341                	srl	a4,a4,0x30
    80009210:	00002797          	auipc	a5,0x2
    80009214:	7a878793          	add	a5,a5,1960 # 8000b9b8 <OSTmrQty>
    80009218:	00e79023          	sh	a4,0(a5)
    8000921c:	00002797          	auipc	a5,0x2
    80009220:	6f178793          	add	a5,a5,1777 # 8000b90d <OSRunning>
    80009224:	0007c783          	lbu	a5,0(a5)
    80009228:	873e                	mv	a4,a5
    8000922a:	4785                	li	a5,1
    8000922c:	00f71463          	bne	a4,a5,80009234 <OSTmrCreate+0x1a0>
    80009230:	787000ef          	jal	8000a1b6 <OS_TmrUnlock>
    80009234:	67a2                	ld	a5,8(sp)
    80009236:	0007a023          	sw	zero,0(a5)
    8000923a:	60a6                	ld	ra,72(sp)
    8000923c:	6161                	add	sp,sp,80
    8000923e:	8082                	ret

0000000080009240 <OSTmrDel>:
    80009240:	7179                	add	sp,sp,-48
    80009242:	f406                	sd	ra,40(sp)
    80009244:	e42a                	sd	a0,8(sp)
    80009246:	e02e                	sd	a1,0(sp)
    80009248:	e802                	sd	zero,16(sp)
    8000924a:	00002797          	auipc	a5,0x2
    8000924e:	6c278793          	add	a5,a5,1730 # 8000b90c <OSIntNestingCtr>
    80009252:	0007c783          	lbu	a5,0(a5)
    80009256:	cb81                	beqz	a5,80009266 <OSTmrDel+0x26>
    80009258:	6782                	ld	a5,0(sp)
    8000925a:	671d                	lui	a4,0x7
    8000925c:	34370713          	add	a4,a4,835 # 7343 <CPU_MSTATUS_MIE+0x733b>
    80009260:	c398                	sw	a4,0(a5)
    80009262:	4781                	li	a5,0
    80009264:	a29d                	j	800093ca <OSTmrDel+0x18a>
    80009266:	00002797          	auipc	a5,0x2
    8000926a:	6a778793          	add	a5,a5,1703 # 8000b90d <OSRunning>
    8000926e:	0007c783          	lbu	a5,0(a5)
    80009272:	873e                	mv	a4,a5
    80009274:	4785                	li	a5,1
    80009276:	00f70963          	beq	a4,a5,80009288 <OSTmrDel+0x48>
    8000927a:	6782                	ld	a5,0(sp)
    8000927c:	6719                	lui	a4,0x6
    8000927e:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80009282:	c398                	sw	a4,0(a5)
    80009284:	4781                	li	a5,0
    80009286:	a291                	j	800093ca <OSTmrDel+0x18a>
    80009288:	67a2                	ld	a5,8(sp)
    8000928a:	eb81                	bnez	a5,8000929a <OSTmrDel+0x5a>
    8000928c:	6782                	ld	a5,0(sp)
    8000928e:	671d                	lui	a4,0x7
    80009290:	34270713          	add	a4,a4,834 # 7342 <CPU_MSTATUS_MIE+0x733a>
    80009294:	c398                	sw	a4,0(a5)
    80009296:	4781                	li	a5,0
    80009298:	aa0d                	j	800093ca <OSTmrDel+0x18a>
    8000929a:	67a2                	ld	a5,8(sp)
    8000929c:	439c                	lw	a5,0(a5)
    8000929e:	873e                	mv	a4,a5
    800092a0:	205257b7          	lui	a5,0x20525
    800092a4:	d5478793          	add	a5,a5,-684 # 20524d54 <CPU_MSTATUS_MIE+0x20524d4c>
    800092a8:	00f70963          	beq	a4,a5,800092ba <OSTmrDel+0x7a>
    800092ac:	6782                	ld	a5,0(sp)
    800092ae:	6719                	lui	a4,0x6
    800092b0:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    800092b4:	c398                	sw	a4,0(a5)
    800092b6:	4781                	li	a5,0
    800092b8:	aa09                	j	800093ca <OSTmrDel+0x18a>
    800092ba:	6db000ef          	jal	8000a194 <OS_TmrLock>
    800092be:	850f80ef          	jal	8000130e <CPU_SR_Save>
    800092c2:	e82a                	sd	a0,16(sp)
    800092c4:	00002797          	auipc	a5,0x2
    800092c8:	70478793          	add	a5,a5,1796 # 8000b9c8 <OSTCBCurPtr>
    800092cc:	6398                	ld	a4,0(a5)
    800092ce:	00014797          	auipc	a5,0x14
    800092d2:	36278793          	add	a5,a5,866 # 8001d630 <OSTmrTaskTCB>
    800092d6:	00f71963          	bne	a4,a5,800092e8 <OSTmrDel+0xa8>
    800092da:	00002797          	auipc	a5,0x2
    800092de:	6e278793          	add	a5,a5,1762 # 8000b9bc <OSTmrTaskTickBase>
    800092e2:	439c                	lw	a5,0(a5)
    800092e4:	cc3e                	sw	a5,24(sp)
    800092e6:	a039                	j	800092f4 <OSTmrDel+0xb4>
    800092e8:	00002797          	auipc	a5,0x2
    800092ec:	6b478793          	add	a5,a5,1716 # 8000b99c <OSTickCtr>
    800092f0:	439c                	lw	a5,0(a5)
    800092f2:	cc3e                	sw	a5,24(sp)
    800092f4:	6542                	ld	a0,16(sp)
    800092f6:	824f80ef          	jal	8000131a <CPU_SR_Restore>
    800092fa:	6522                	ld	a0,8(sp)
    800092fc:	067000ef          	jal	80009b62 <OS_TmrDbgListRemove>
    80009300:	67a2                	ld	a5,8(sp)
    80009302:	03e7c783          	lbu	a5,62(a5)
    80009306:	2781                	sext.w	a5,a5
    80009308:	86be                	mv	a3,a5
    8000930a:	4711                	li	a4,4
    8000930c:	0ad76363          	bltu	a4,a3,800093b2 <OSTmrDel+0x172>
    80009310:	00279713          	sll	a4,a5,0x2
    80009314:	00002797          	auipc	a5,0x2
    80009318:	3b078793          	add	a5,a5,944 # 8000b6c4 <OSDbg_Tmr+0x8c>
    8000931c:	97ba                	add	a5,a5,a4
    8000931e:	439c                	lw	a5,0(a5)
    80009320:	0007871b          	sext.w	a4,a5
    80009324:	00002797          	auipc	a5,0x2
    80009328:	3a078793          	add	a5,a5,928 # 8000b6c4 <OSDbg_Tmr+0x8c>
    8000932c:	97ba                	add	a5,a5,a4
    8000932e:	8782                	jr	a5
    80009330:	47e2                	lw	a5,24(sp)
    80009332:	85be                	mv	a1,a5
    80009334:	6522                	ld	a0,8(sp)
    80009336:	357000ef          	jal	80009e8c <OS_TmrUnlink>
    8000933a:	6522                	ld	a0,8(sp)
    8000933c:	782000ef          	jal	80009abe <OS_TmrClr>
    80009340:	00002797          	auipc	a5,0x2
    80009344:	67878793          	add	a5,a5,1656 # 8000b9b8 <OSTmrQty>
    80009348:	0007d783          	lhu	a5,0(a5)
    8000934c:	37fd                	addw	a5,a5,-1
    8000934e:	03079713          	sll	a4,a5,0x30
    80009352:	9341                	srl	a4,a4,0x30
    80009354:	00002797          	auipc	a5,0x2
    80009358:	66478793          	add	a5,a5,1636 # 8000b9b8 <OSTmrQty>
    8000935c:	00e79023          	sh	a4,0(a5)
    80009360:	6782                	ld	a5,0(sp)
    80009362:	0007a023          	sw	zero,0(a5)
    80009366:	4785                	li	a5,1
    80009368:	00f10fa3          	sb	a5,31(sp)
    8000936c:	a899                	j	800093c2 <OSTmrDel+0x182>
    8000936e:	6522                	ld	a0,8(sp)
    80009370:	74e000ef          	jal	80009abe <OS_TmrClr>
    80009374:	00002797          	auipc	a5,0x2
    80009378:	64478793          	add	a5,a5,1604 # 8000b9b8 <OSTmrQty>
    8000937c:	0007d783          	lhu	a5,0(a5)
    80009380:	37fd                	addw	a5,a5,-1
    80009382:	03079713          	sll	a4,a5,0x30
    80009386:	9341                	srl	a4,a4,0x30
    80009388:	00002797          	auipc	a5,0x2
    8000938c:	63078793          	add	a5,a5,1584 # 8000b9b8 <OSTmrQty>
    80009390:	00e79023          	sh	a4,0(a5)
    80009394:	6782                	ld	a5,0(sp)
    80009396:	0007a023          	sw	zero,0(a5)
    8000939a:	4785                	li	a5,1
    8000939c:	00f10fa3          	sb	a5,31(sp)
    800093a0:	a00d                	j	800093c2 <OSTmrDel+0x182>
    800093a2:	6782                	ld	a5,0(sp)
    800093a4:	671d                	lui	a4,0x7
    800093a6:	33d70713          	add	a4,a4,829 # 733d <CPU_MSTATUS_MIE+0x7335>
    800093aa:	c398                	sw	a4,0(a5)
    800093ac:	00010fa3          	sb	zero,31(sp)
    800093b0:	a809                	j	800093c2 <OSTmrDel+0x182>
    800093b2:	6782                	ld	a5,0(sp)
    800093b4:	671d                	lui	a4,0x7
    800093b6:	34170713          	add	a4,a4,833 # 7341 <CPU_MSTATUS_MIE+0x7339>
    800093ba:	c398                	sw	a4,0(a5)
    800093bc:	00010fa3          	sb	zero,31(sp)
    800093c0:	0001                	nop
    800093c2:	5f5000ef          	jal	8000a1b6 <OS_TmrUnlock>
    800093c6:	01f14783          	lbu	a5,31(sp)
    800093ca:	853e                	mv	a0,a5
    800093cc:	70a2                	ld	ra,40(sp)
    800093ce:	6145                	add	sp,sp,48
    800093d0:	8082                	ret

00000000800093d2 <OSTmrRemainGet>:
    800093d2:	7179                	add	sp,sp,-48
    800093d4:	f406                	sd	ra,40(sp)
    800093d6:	e42a                	sd	a0,8(sp)
    800093d8:	e02e                	sd	a1,0(sp)
    800093da:	00002797          	auipc	a5,0x2
    800093de:	53278793          	add	a5,a5,1330 # 8000b90c <OSIntNestingCtr>
    800093e2:	0007c783          	lbu	a5,0(a5)
    800093e6:	cb81                	beqz	a5,800093f6 <OSTmrRemainGet+0x24>
    800093e8:	6782                	ld	a5,0(sp)
    800093ea:	671d                	lui	a4,0x7
    800093ec:	34370713          	add	a4,a4,835 # 7343 <CPU_MSTATUS_MIE+0x733b>
    800093f0:	c398                	sw	a4,0(a5)
    800093f2:	4781                	li	a5,0
    800093f4:	a28d                	j	80009556 <OSTmrRemainGet+0x184>
    800093f6:	00002797          	auipc	a5,0x2
    800093fa:	51778793          	add	a5,a5,1303 # 8000b90d <OSRunning>
    800093fe:	0007c783          	lbu	a5,0(a5)
    80009402:	873e                	mv	a4,a5
    80009404:	4785                	li	a5,1
    80009406:	00f70963          	beq	a4,a5,80009418 <OSTmrRemainGet+0x46>
    8000940a:	6782                	ld	a5,0(sp)
    8000940c:	6719                	lui	a4,0x6
    8000940e:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80009412:	c398                	sw	a4,0(a5)
    80009414:	4781                	li	a5,0
    80009416:	a281                	j	80009556 <OSTmrRemainGet+0x184>
    80009418:	67a2                	ld	a5,8(sp)
    8000941a:	eb81                	bnez	a5,8000942a <OSTmrRemainGet+0x58>
    8000941c:	6782                	ld	a5,0(sp)
    8000941e:	671d                	lui	a4,0x7
    80009420:	34270713          	add	a4,a4,834 # 7342 <CPU_MSTATUS_MIE+0x733a>
    80009424:	c398                	sw	a4,0(a5)
    80009426:	4781                	li	a5,0
    80009428:	a23d                	j	80009556 <OSTmrRemainGet+0x184>
    8000942a:	67a2                	ld	a5,8(sp)
    8000942c:	439c                	lw	a5,0(a5)
    8000942e:	873e                	mv	a4,a5
    80009430:	205257b7          	lui	a5,0x20525
    80009434:	d5478793          	add	a5,a5,-684 # 20524d54 <CPU_MSTATUS_MIE+0x20524d4c>
    80009438:	00f70963          	beq	a4,a5,8000944a <OSTmrRemainGet+0x78>
    8000943c:	6782                	ld	a5,0(sp)
    8000943e:	6719                	lui	a4,0x6
    80009440:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80009444:	c398                	sw	a4,0(a5)
    80009446:	4781                	li	a5,0
    80009448:	a239                	j	80009556 <OSTmrRemainGet+0x184>
    8000944a:	54b000ef          	jal	8000a194 <OS_TmrLock>
    8000944e:	67a2                	ld	a5,8(sp)
    80009450:	03e7c783          	lbu	a5,62(a5)
    80009454:	2781                	sext.w	a5,a5
    80009456:	86be                	mv	a3,a5
    80009458:	4711                	li	a4,4
    8000945a:	0ed74463          	blt	a4,a3,80009542 <OSTmrRemainGet+0x170>
    8000945e:	86be                	mv	a3,a5
    80009460:	470d                	li	a4,3
    80009462:	0ce6d463          	bge	a3,a4,8000952a <OSTmrRemainGet+0x158>
    80009466:	86be                	mv	a3,a5
    80009468:	4709                	li	a4,2
    8000946a:	00e68c63          	beq	a3,a4,80009482 <OSTmrRemainGet+0xb0>
    8000946e:	86be                	mv	a3,a5
    80009470:	4709                	li	a4,2
    80009472:	0cd74863          	blt	a4,a3,80009542 <OSTmrRemainGet+0x170>
    80009476:	cfdd                	beqz	a5,80009534 <OSTmrRemainGet+0x162>
    80009478:	873e                	mv	a4,a5
    8000947a:	4785                	li	a5,1
    8000947c:	04f70863          	beq	a4,a5,800094cc <OSTmrRemainGet+0xfa>
    80009480:	a0c9                	j	80009542 <OSTmrRemainGet+0x170>
    80009482:	00002797          	auipc	a5,0x2
    80009486:	52e78793          	add	a5,a5,1326 # 8000b9b0 <OSTmrListPtr>
    8000948a:	639c                	ld	a5,0(a5)
    8000948c:	ec3e                	sd	a5,24(sp)
    8000948e:	ca02                	sw	zero,20(sp)
    80009490:	a829                	j	800094aa <OSTmrRemainGet+0xd8>
    80009492:	67e2                	ld	a5,24(sp)
    80009494:	5b9c                	lw	a5,48(a5)
    80009496:	4752                	lw	a4,20(sp)
    80009498:	9fb9                	addw	a5,a5,a4
    8000949a:	ca3e                	sw	a5,20(sp)
    8000949c:	6762                	ld	a4,24(sp)
    8000949e:	67a2                	ld	a5,8(sp)
    800094a0:	00f70863          	beq	a4,a5,800094b0 <OSTmrRemainGet+0xde>
    800094a4:	67e2                	ld	a5,24(sp)
    800094a6:	739c                	ld	a5,32(a5)
    800094a8:	ec3e                	sd	a5,24(sp)
    800094aa:	67e2                	ld	a5,24(sp)
    800094ac:	f3fd                	bnez	a5,80009492 <OSTmrRemainGet+0xc0>
    800094ae:	a011                	j	800094b2 <OSTmrRemainGet+0xe0>
    800094b0:	0001                	nop
    800094b2:	00002797          	auipc	a5,0x2
    800094b6:	50e78793          	add	a5,a5,1294 # 8000b9c0 <OSTmrToTicksMult>
    800094ba:	439c                	lw	a5,0(a5)
    800094bc:	4752                	lw	a4,20(sp)
    800094be:	02f757bb          	divuw	a5,a4,a5
    800094c2:	ca3e                	sw	a5,20(sp)
    800094c4:	6782                	ld	a5,0(sp)
    800094c6:	0007a023          	sw	zero,0(a5)
    800094ca:	a059                	j	80009550 <OSTmrRemainGet+0x17e>
    800094cc:	67a2                	ld	a5,8(sp)
    800094ce:	03c7d783          	lhu	a5,60(a5)
    800094d2:	0007871b          	sext.w	a4,a5
    800094d6:	4789                	li	a5,2
    800094d8:	02f71b63          	bne	a4,a5,8000950e <OSTmrRemainGet+0x13c>
    800094dc:	67a2                	ld	a5,8(sp)
    800094de:	5bdc                	lw	a5,52(a5)
    800094e0:	ef81                	bnez	a5,800094f8 <OSTmrRemainGet+0x126>
    800094e2:	67a2                	ld	a5,8(sp)
    800094e4:	5f98                	lw	a4,56(a5)
    800094e6:	00002797          	auipc	a5,0x2
    800094ea:	4da78793          	add	a5,a5,1242 # 8000b9c0 <OSTmrToTicksMult>
    800094ee:	439c                	lw	a5,0(a5)
    800094f0:	02f757bb          	divuw	a5,a4,a5
    800094f4:	ca3e                	sw	a5,20(sp)
    800094f6:	a035                	j	80009522 <OSTmrRemainGet+0x150>
    800094f8:	67a2                	ld	a5,8(sp)
    800094fa:	5bd8                	lw	a4,52(a5)
    800094fc:	00002797          	auipc	a5,0x2
    80009500:	4c478793          	add	a5,a5,1220 # 8000b9c0 <OSTmrToTicksMult>
    80009504:	439c                	lw	a5,0(a5)
    80009506:	02f757bb          	divuw	a5,a4,a5
    8000950a:	ca3e                	sw	a5,20(sp)
    8000950c:	a819                	j	80009522 <OSTmrRemainGet+0x150>
    8000950e:	67a2                	ld	a5,8(sp)
    80009510:	5bd8                	lw	a4,52(a5)
    80009512:	00002797          	auipc	a5,0x2
    80009516:	4ae78793          	add	a5,a5,1198 # 8000b9c0 <OSTmrToTicksMult>
    8000951a:	439c                	lw	a5,0(a5)
    8000951c:	02f757bb          	divuw	a5,a4,a5
    80009520:	ca3e                	sw	a5,20(sp)
    80009522:	6782                	ld	a5,0(sp)
    80009524:	0007a023          	sw	zero,0(a5)
    80009528:	a025                	j	80009550 <OSTmrRemainGet+0x17e>
    8000952a:	6782                	ld	a5,0(sp)
    8000952c:	0007a023          	sw	zero,0(a5)
    80009530:	ca02                	sw	zero,20(sp)
    80009532:	a839                	j	80009550 <OSTmrRemainGet+0x17e>
    80009534:	6782                	ld	a5,0(sp)
    80009536:	671d                	lui	a4,0x7
    80009538:	33d70713          	add	a4,a4,829 # 733d <CPU_MSTATUS_MIE+0x7335>
    8000953c:	c398                	sw	a4,0(a5)
    8000953e:	ca02                	sw	zero,20(sp)
    80009540:	a801                	j	80009550 <OSTmrRemainGet+0x17e>
    80009542:	6782                	ld	a5,0(sp)
    80009544:	671d                	lui	a4,0x7
    80009546:	34170713          	add	a4,a4,833 # 7341 <CPU_MSTATUS_MIE+0x7339>
    8000954a:	c398                	sw	a4,0(a5)
    8000954c:	ca02                	sw	zero,20(sp)
    8000954e:	0001                	nop
    80009550:	467000ef          	jal	8000a1b6 <OS_TmrUnlock>
    80009554:	47d2                	lw	a5,20(sp)
    80009556:	853e                	mv	a0,a5
    80009558:	70a2                	ld	ra,40(sp)
    8000955a:	6145                	add	sp,sp,48
    8000955c:	8082                	ret

000000008000955e <OSTmrSet>:
    8000955e:	7139                	add	sp,sp,-64
    80009560:	fc06                	sd	ra,56(sp)
    80009562:	f42a                	sd	a0,40(sp)
    80009564:	ec36                	sd	a3,24(sp)
    80009566:	e83a                	sd	a4,16(sp)
    80009568:	e43e                	sd	a5,8(sp)
    8000956a:	87ae                	mv	a5,a1
    8000956c:	d23e                	sw	a5,36(sp)
    8000956e:	87b2                	mv	a5,a2
    80009570:	d03e                	sw	a5,32(sp)
    80009572:	00002797          	auipc	a5,0x2
    80009576:	39a78793          	add	a5,a5,922 # 8000b90c <OSIntNestingCtr>
    8000957a:	0007c783          	lbu	a5,0(a5)
    8000957e:	c799                	beqz	a5,8000958c <OSTmrSet+0x2e>
    80009580:	67a2                	ld	a5,8(sp)
    80009582:	671d                	lui	a4,0x7
    80009584:	34370713          	add	a4,a4,835 # 7343 <CPU_MSTATUS_MIE+0x733b>
    80009588:	c398                	sw	a4,0(a5)
    8000958a:	a8e5                	j	80009682 <OSTmrSet+0x124>
    8000958c:	00002797          	auipc	a5,0x2
    80009590:	38178793          	add	a5,a5,897 # 8000b90d <OSRunning>
    80009594:	0007c783          	lbu	a5,0(a5)
    80009598:	873e                	mv	a4,a5
    8000959a:	4785                	li	a5,1
    8000959c:	00f70863          	beq	a4,a5,800095ac <OSTmrSet+0x4e>
    800095a0:	67a2                	ld	a5,8(sp)
    800095a2:	6719                	lui	a4,0x6
    800095a4:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    800095a8:	c398                	sw	a4,0(a5)
    800095aa:	a8e1                	j	80009682 <OSTmrSet+0x124>
    800095ac:	77a2                	ld	a5,40(sp)
    800095ae:	e799                	bnez	a5,800095bc <OSTmrSet+0x5e>
    800095b0:	67a2                	ld	a5,8(sp)
    800095b2:	671d                	lui	a4,0x7
    800095b4:	34270713          	add	a4,a4,834 # 7342 <CPU_MSTATUS_MIE+0x733a>
    800095b8:	c398                	sw	a4,0(a5)
    800095ba:	a0e1                	j	80009682 <OSTmrSet+0x124>
    800095bc:	77a2                	ld	a5,40(sp)
    800095be:	439c                	lw	a5,0(a5)
    800095c0:	873e                	mv	a4,a5
    800095c2:	205257b7          	lui	a5,0x20525
    800095c6:	d5478793          	add	a5,a5,-684 # 20524d54 <CPU_MSTATUS_MIE+0x20524d4c>
    800095ca:	00f70863          	beq	a4,a5,800095da <OSTmrSet+0x7c>
    800095ce:	67a2                	ld	a5,8(sp)
    800095d0:	6719                	lui	a4,0x6
    800095d2:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    800095d6:	c398                	sw	a4,0(a5)
    800095d8:	a06d                	j	80009682 <OSTmrSet+0x124>
    800095da:	77a2                	ld	a5,40(sp)
    800095dc:	03c7d783          	lhu	a5,60(a5)
    800095e0:	0007871b          	sext.w	a4,a5
    800095e4:	86ba                	mv	a3,a4
    800095e6:	4785                	li	a5,1
    800095e8:	02f68663          	beq	a3,a5,80009614 <OSTmrSet+0xb6>
    800095ec:	4789                	li	a5,2
    800095ee:	02f71c63          	bne	a4,a5,80009626 <OSTmrSet+0xc8>
    800095f2:	5782                	lw	a5,32(sp)
    800095f4:	2781                	sext.w	a5,a5
    800095f6:	e799                	bnez	a5,80009604 <OSTmrSet+0xa6>
    800095f8:	67a2                	ld	a5,8(sp)
    800095fa:	671d                	lui	a4,0x7
    800095fc:	34070713          	add	a4,a4,832 # 7340 <CPU_MSTATUS_MIE+0x7338>
    80009600:	c398                	sw	a4,0(a5)
    80009602:	a041                	j	80009682 <OSTmrSet+0x124>
    80009604:	67e2                	ld	a5,24(sp)
    80009606:	e795                	bnez	a5,80009632 <OSTmrSet+0xd4>
    80009608:	67a2                	ld	a5,8(sp)
    8000960a:	671d                	lui	a4,0x7
    8000960c:	34a70713          	add	a4,a4,842 # 734a <CPU_MSTATUS_MIE+0x7342>
    80009610:	c398                	sw	a4,0(a5)
    80009612:	a885                	j	80009682 <OSTmrSet+0x124>
    80009614:	5792                	lw	a5,36(sp)
    80009616:	2781                	sext.w	a5,a5
    80009618:	ef99                	bnez	a5,80009636 <OSTmrSet+0xd8>
    8000961a:	67a2                	ld	a5,8(sp)
    8000961c:	671d                	lui	a4,0x7
    8000961e:	33f70713          	add	a4,a4,831 # 733f <CPU_MSTATUS_MIE+0x7337>
    80009622:	c398                	sw	a4,0(a5)
    80009624:	a8b9                	j	80009682 <OSTmrSet+0x124>
    80009626:	67a2                	ld	a5,8(sp)
    80009628:	671d                	lui	a4,0x7
    8000962a:	34270713          	add	a4,a4,834 # 7342 <CPU_MSTATUS_MIE+0x733a>
    8000962e:	c398                	sw	a4,0(a5)
    80009630:	a889                	j	80009682 <OSTmrSet+0x124>
    80009632:	0001                	nop
    80009634:	a011                	j	80009638 <OSTmrSet+0xda>
    80009636:	0001                	nop
    80009638:	35d000ef          	jal	8000a194 <OS_TmrLock>
    8000963c:	00002797          	auipc	a5,0x2
    80009640:	38478793          	add	a5,a5,900 # 8000b9c0 <OSTmrToTicksMult>
    80009644:	439c                	lw	a5,0(a5)
    80009646:	5712                	lw	a4,36(sp)
    80009648:	02f707bb          	mulw	a5,a4,a5
    8000964c:	0007871b          	sext.w	a4,a5
    80009650:	77a2                	ld	a5,40(sp)
    80009652:	dbd8                	sw	a4,52(a5)
    80009654:	00002797          	auipc	a5,0x2
    80009658:	36c78793          	add	a5,a5,876 # 8000b9c0 <OSTmrToTicksMult>
    8000965c:	439c                	lw	a5,0(a5)
    8000965e:	5702                	lw	a4,32(sp)
    80009660:	02f707bb          	mulw	a5,a4,a5
    80009664:	0007871b          	sext.w	a4,a5
    80009668:	77a2                	ld	a5,40(sp)
    8000966a:	df98                	sw	a4,56(a5)
    8000966c:	77a2                	ld	a5,40(sp)
    8000966e:	6762                	ld	a4,24(sp)
    80009670:	eb98                	sd	a4,16(a5)
    80009672:	77a2                	ld	a5,40(sp)
    80009674:	6742                	ld	a4,16(sp)
    80009676:	ef98                	sd	a4,24(a5)
    80009678:	67a2                	ld	a5,8(sp)
    8000967a:	0007a023          	sw	zero,0(a5)
    8000967e:	339000ef          	jal	8000a1b6 <OS_TmrUnlock>
    80009682:	70e2                	ld	ra,56(sp)
    80009684:	6121                	add	sp,sp,64
    80009686:	8082                	ret

0000000080009688 <OSTmrStart>:
    80009688:	7179                	add	sp,sp,-48
    8000968a:	f406                	sd	ra,40(sp)
    8000968c:	e42a                	sd	a0,8(sp)
    8000968e:	e02e                	sd	a1,0(sp)
    80009690:	e802                	sd	zero,16(sp)
    80009692:	00002797          	auipc	a5,0x2
    80009696:	27a78793          	add	a5,a5,634 # 8000b90c <OSIntNestingCtr>
    8000969a:	0007c783          	lbu	a5,0(a5)
    8000969e:	cb81                	beqz	a5,800096ae <OSTmrStart+0x26>
    800096a0:	6782                	ld	a5,0(sp)
    800096a2:	671d                	lui	a4,0x7
    800096a4:	34370713          	add	a4,a4,835 # 7343 <CPU_MSTATUS_MIE+0x733b>
    800096a8:	c398                	sw	a4,0(a5)
    800096aa:	4781                	li	a5,0
    800096ac:	a2a5                	j	80009814 <OSTmrStart+0x18c>
    800096ae:	00002797          	auipc	a5,0x2
    800096b2:	25f78793          	add	a5,a5,607 # 8000b90d <OSRunning>
    800096b6:	0007c783          	lbu	a5,0(a5)
    800096ba:	873e                	mv	a4,a5
    800096bc:	4785                	li	a5,1
    800096be:	00f70963          	beq	a4,a5,800096d0 <OSTmrStart+0x48>
    800096c2:	6782                	ld	a5,0(sp)
    800096c4:	6719                	lui	a4,0x6
    800096c6:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    800096ca:	c398                	sw	a4,0(a5)
    800096cc:	4781                	li	a5,0
    800096ce:	a299                	j	80009814 <OSTmrStart+0x18c>
    800096d0:	67a2                	ld	a5,8(sp)
    800096d2:	eb81                	bnez	a5,800096e2 <OSTmrStart+0x5a>
    800096d4:	6782                	ld	a5,0(sp)
    800096d6:	671d                	lui	a4,0x7
    800096d8:	34270713          	add	a4,a4,834 # 7342 <CPU_MSTATUS_MIE+0x733a>
    800096dc:	c398                	sw	a4,0(a5)
    800096de:	4781                	li	a5,0
    800096e0:	aa15                	j	80009814 <OSTmrStart+0x18c>
    800096e2:	67a2                	ld	a5,8(sp)
    800096e4:	439c                	lw	a5,0(a5)
    800096e6:	873e                	mv	a4,a5
    800096e8:	205257b7          	lui	a5,0x20525
    800096ec:	d5478793          	add	a5,a5,-684 # 20524d54 <CPU_MSTATUS_MIE+0x20524d4c>
    800096f0:	00f70963          	beq	a4,a5,80009702 <OSTmrStart+0x7a>
    800096f4:	6782                	ld	a5,0(sp)
    800096f6:	6719                	lui	a4,0x6
    800096f8:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    800096fc:	c398                	sw	a4,0(a5)
    800096fe:	4781                	li	a5,0
    80009700:	aa11                	j	80009814 <OSTmrStart+0x18c>
    80009702:	293000ef          	jal	8000a194 <OS_TmrLock>
    80009706:	c09f70ef          	jal	8000130e <CPU_SR_Save>
    8000970a:	e82a                	sd	a0,16(sp)
    8000970c:	00002797          	auipc	a5,0x2
    80009710:	2bc78793          	add	a5,a5,700 # 8000b9c8 <OSTCBCurPtr>
    80009714:	6398                	ld	a4,0(a5)
    80009716:	00014797          	auipc	a5,0x14
    8000971a:	f1a78793          	add	a5,a5,-230 # 8001d630 <OSTmrTaskTCB>
    8000971e:	00f71963          	bne	a4,a5,80009730 <OSTmrStart+0xa8>
    80009722:	00002797          	auipc	a5,0x2
    80009726:	29a78793          	add	a5,a5,666 # 8000b9bc <OSTmrTaskTickBase>
    8000972a:	439c                	lw	a5,0(a5)
    8000972c:	cc3e                	sw	a5,24(sp)
    8000972e:	a039                	j	8000973c <OSTmrStart+0xb4>
    80009730:	00002797          	auipc	a5,0x2
    80009734:	26c78793          	add	a5,a5,620 # 8000b99c <OSTickCtr>
    80009738:	439c                	lw	a5,0(a5)
    8000973a:	cc3e                	sw	a5,24(sp)
    8000973c:	6542                	ld	a0,16(sp)
    8000973e:	bddf70ef          	jal	8000131a <CPU_SR_Restore>
    80009742:	67a2                	ld	a5,8(sp)
    80009744:	03e7c783          	lbu	a5,62(a5)
    80009748:	2781                	sext.w	a5,a5
    8000974a:	86be                	mv	a3,a5
    8000974c:	4711                	li	a4,4
    8000974e:	0ad76763          	bltu	a4,a3,800097fc <OSTmrStart+0x174>
    80009752:	00279713          	sll	a4,a5,0x2
    80009756:	00002797          	auipc	a5,0x2
    8000975a:	f8278793          	add	a5,a5,-126 # 8000b6d8 <OSDbg_Tmr+0xa0>
    8000975e:	97ba                	add	a5,a5,a4
    80009760:	439c                	lw	a5,0(a5)
    80009762:	0007871b          	sext.w	a4,a5
    80009766:	00002797          	auipc	a5,0x2
    8000976a:	f7278793          	add	a5,a5,-142 # 8000b6d8 <OSDbg_Tmr+0xa0>
    8000976e:	97ba                	add	a5,a5,a4
    80009770:	8782                	jr	a5
    80009772:	67a2                	ld	a5,8(sp)
    80009774:	4709                	li	a4,2
    80009776:	02e78f23          	sb	a4,62(a5)
    8000977a:	47e2                	lw	a5,24(sp)
    8000977c:	85be                	mv	a1,a5
    8000977e:	6522                	ld	a0,8(sp)
    80009780:	70c000ef          	jal	80009e8c <OS_TmrUnlink>
    80009784:	67a2                	ld	a5,8(sp)
    80009786:	5bdc                	lw	a5,52(a5)
    80009788:	e791                	bnez	a5,80009794 <OSTmrStart+0x10c>
    8000978a:	67a2                	ld	a5,8(sp)
    8000978c:	5f98                	lw	a4,56(a5)
    8000978e:	67a2                	ld	a5,8(sp)
    80009790:	db98                	sw	a4,48(a5)
    80009792:	a029                	j	8000979c <OSTmrStart+0x114>
    80009794:	67a2                	ld	a5,8(sp)
    80009796:	5bd8                	lw	a4,52(a5)
    80009798:	67a2                	ld	a5,8(sp)
    8000979a:	db98                	sw	a4,48(a5)
    8000979c:	47e2                	lw	a5,24(sp)
    8000979e:	85be                	mv	a1,a5
    800097a0:	6522                	ld	a0,8(sp)
    800097a2:	562000ef          	jal	80009d04 <OS_TmrLink>
    800097a6:	6782                	ld	a5,0(sp)
    800097a8:	0007a023          	sw	zero,0(a5)
    800097ac:	4785                	li	a5,1
    800097ae:	00f10fa3          	sb	a5,31(sp)
    800097b2:	a8a9                	j	8000980c <OSTmrStart+0x184>
    800097b4:	67a2                	ld	a5,8(sp)
    800097b6:	4709                	li	a4,2
    800097b8:	02e78f23          	sb	a4,62(a5)
    800097bc:	67a2                	ld	a5,8(sp)
    800097be:	5bdc                	lw	a5,52(a5)
    800097c0:	e791                	bnez	a5,800097cc <OSTmrStart+0x144>
    800097c2:	67a2                	ld	a5,8(sp)
    800097c4:	5f98                	lw	a4,56(a5)
    800097c6:	67a2                	ld	a5,8(sp)
    800097c8:	db98                	sw	a4,48(a5)
    800097ca:	a029                	j	800097d4 <OSTmrStart+0x14c>
    800097cc:	67a2                	ld	a5,8(sp)
    800097ce:	5bd8                	lw	a4,52(a5)
    800097d0:	67a2                	ld	a5,8(sp)
    800097d2:	db98                	sw	a4,48(a5)
    800097d4:	47e2                	lw	a5,24(sp)
    800097d6:	85be                	mv	a1,a5
    800097d8:	6522                	ld	a0,8(sp)
    800097da:	52a000ef          	jal	80009d04 <OS_TmrLink>
    800097de:	6782                	ld	a5,0(sp)
    800097e0:	0007a023          	sw	zero,0(a5)
    800097e4:	4785                	li	a5,1
    800097e6:	00f10fa3          	sb	a5,31(sp)
    800097ea:	a00d                	j	8000980c <OSTmrStart+0x184>
    800097ec:	6782                	ld	a5,0(sp)
    800097ee:	671d                	lui	a4,0x7
    800097f0:	33d70713          	add	a4,a4,829 # 733d <CPU_MSTATUS_MIE+0x7335>
    800097f4:	c398                	sw	a4,0(a5)
    800097f6:	00010fa3          	sb	zero,31(sp)
    800097fa:	a809                	j	8000980c <OSTmrStart+0x184>
    800097fc:	6782                	ld	a5,0(sp)
    800097fe:	671d                	lui	a4,0x7
    80009800:	34170713          	add	a4,a4,833 # 7341 <CPU_MSTATUS_MIE+0x7339>
    80009804:	c398                	sw	a4,0(a5)
    80009806:	00010fa3          	sb	zero,31(sp)
    8000980a:	0001                	nop
    8000980c:	1ab000ef          	jal	8000a1b6 <OS_TmrUnlock>
    80009810:	01f14783          	lbu	a5,31(sp)
    80009814:	853e                	mv	a0,a5
    80009816:	70a2                	ld	ra,40(sp)
    80009818:	6145                	add	sp,sp,48
    8000981a:	8082                	ret

000000008000981c <OSTmrStateGet>:
    8000981c:	7179                	add	sp,sp,-48
    8000981e:	f406                	sd	ra,40(sp)
    80009820:	e42a                	sd	a0,8(sp)
    80009822:	e02e                	sd	a1,0(sp)
    80009824:	00002797          	auipc	a5,0x2
    80009828:	0e878793          	add	a5,a5,232 # 8000b90c <OSIntNestingCtr>
    8000982c:	0007c783          	lbu	a5,0(a5)
    80009830:	cb81                	beqz	a5,80009840 <OSTmrStateGet+0x24>
    80009832:	6782                	ld	a5,0(sp)
    80009834:	671d                	lui	a4,0x7
    80009836:	34370713          	add	a4,a4,835 # 7343 <CPU_MSTATUS_MIE+0x733b>
    8000983a:	c398                	sw	a4,0(a5)
    8000983c:	4781                	li	a5,0
    8000983e:	a841                	j	800098ce <OSTmrStateGet+0xb2>
    80009840:	00002797          	auipc	a5,0x2
    80009844:	0cd78793          	add	a5,a5,205 # 8000b90d <OSRunning>
    80009848:	0007c783          	lbu	a5,0(a5)
    8000984c:	873e                	mv	a4,a5
    8000984e:	4785                	li	a5,1
    80009850:	00f70963          	beq	a4,a5,80009862 <OSTmrStateGet+0x46>
    80009854:	6782                	ld	a5,0(sp)
    80009856:	6719                	lui	a4,0x6
    80009858:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    8000985c:	c398                	sw	a4,0(a5)
    8000985e:	4781                	li	a5,0
    80009860:	a0bd                	j	800098ce <OSTmrStateGet+0xb2>
    80009862:	67a2                	ld	a5,8(sp)
    80009864:	eb81                	bnez	a5,80009874 <OSTmrStateGet+0x58>
    80009866:	6782                	ld	a5,0(sp)
    80009868:	671d                	lui	a4,0x7
    8000986a:	34270713          	add	a4,a4,834 # 7342 <CPU_MSTATUS_MIE+0x733a>
    8000986e:	c398                	sw	a4,0(a5)
    80009870:	4781                	li	a5,0
    80009872:	a8b1                	j	800098ce <OSTmrStateGet+0xb2>
    80009874:	67a2                	ld	a5,8(sp)
    80009876:	439c                	lw	a5,0(a5)
    80009878:	873e                	mv	a4,a5
    8000987a:	205257b7          	lui	a5,0x20525
    8000987e:	d5478793          	add	a5,a5,-684 # 20524d54 <CPU_MSTATUS_MIE+0x20524d4c>
    80009882:	00f70963          	beq	a4,a5,80009894 <OSTmrStateGet+0x78>
    80009886:	6782                	ld	a5,0(sp)
    80009888:	6719                	lui	a4,0x6
    8000988a:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    8000988e:	c398                	sw	a4,0(a5)
    80009890:	4781                	li	a5,0
    80009892:	a835                	j	800098ce <OSTmrStateGet+0xb2>
    80009894:	101000ef          	jal	8000a194 <OS_TmrLock>
    80009898:	67a2                	ld	a5,8(sp)
    8000989a:	03e7c783          	lbu	a5,62(a5)
    8000989e:	00f10fa3          	sb	a5,31(sp)
    800098a2:	01f14783          	lbu	a5,31(sp)
    800098a6:	2781                	sext.w	a5,a5
    800098a8:	2781                	sext.w	a5,a5
    800098aa:	873e                	mv	a4,a5
    800098ac:	4791                	li	a5,4
    800098ae:	00e7e663          	bltu	a5,a4,800098ba <OSTmrStateGet+0x9e>
    800098b2:	6782                	ld	a5,0(sp)
    800098b4:	0007a023          	sw	zero,0(a5)
    800098b8:	a039                	j	800098c6 <OSTmrStateGet+0xaa>
    800098ba:	6782                	ld	a5,0(sp)
    800098bc:	671d                	lui	a4,0x7
    800098be:	34170713          	add	a4,a4,833 # 7341 <CPU_MSTATUS_MIE+0x7339>
    800098c2:	c398                	sw	a4,0(a5)
    800098c4:	0001                	nop
    800098c6:	0f1000ef          	jal	8000a1b6 <OS_TmrUnlock>
    800098ca:	01f14783          	lbu	a5,31(sp)
    800098ce:	853e                	mv	a0,a5
    800098d0:	70a2                	ld	ra,40(sp)
    800098d2:	6145                	add	sp,sp,48
    800098d4:	8082                	ret

00000000800098d6 <OSTmrStop>:
    800098d6:	715d                	add	sp,sp,-80
    800098d8:	e486                	sd	ra,72(sp)
    800098da:	ec2a                	sd	a0,24(sp)
    800098dc:	87ae                	mv	a5,a1
    800098de:	e432                	sd	a2,8(sp)
    800098e0:	e036                	sd	a3,0(sp)
    800098e2:	00f11b23          	sh	a5,22(sp)
    800098e6:	f802                	sd	zero,48(sp)
    800098e8:	00002797          	auipc	a5,0x2
    800098ec:	02478793          	add	a5,a5,36 # 8000b90c <OSIntNestingCtr>
    800098f0:	0007c783          	lbu	a5,0(a5)
    800098f4:	cb81                	beqz	a5,80009904 <OSTmrStop+0x2e>
    800098f6:	6782                	ld	a5,0(sp)
    800098f8:	671d                	lui	a4,0x7
    800098fa:	34370713          	add	a4,a4,835 # 7343 <CPU_MSTATUS_MIE+0x733b>
    800098fe:	c398                	sw	a4,0(a5)
    80009900:	4781                	li	a5,0
    80009902:	aa55                	j	80009ab6 <OSTmrStop+0x1e0>
    80009904:	00002797          	auipc	a5,0x2
    80009908:	00978793          	add	a5,a5,9 # 8000b90d <OSRunning>
    8000990c:	0007c783          	lbu	a5,0(a5)
    80009910:	873e                	mv	a4,a5
    80009912:	4785                	li	a5,1
    80009914:	00f70963          	beq	a4,a5,80009926 <OSTmrStop+0x50>
    80009918:	6782                	ld	a5,0(sp)
    8000991a:	6719                	lui	a4,0x6
    8000991c:	e8970713          	add	a4,a4,-375 # 5e89 <CPU_MSTATUS_MIE+0x5e81>
    80009920:	c398                	sw	a4,0(a5)
    80009922:	4781                	li	a5,0
    80009924:	aa49                	j	80009ab6 <OSTmrStop+0x1e0>
    80009926:	67e2                	ld	a5,24(sp)
    80009928:	eb81                	bnez	a5,80009938 <OSTmrStop+0x62>
    8000992a:	6782                	ld	a5,0(sp)
    8000992c:	671d                	lui	a4,0x7
    8000992e:	34270713          	add	a4,a4,834 # 7342 <CPU_MSTATUS_MIE+0x733a>
    80009932:	c398                	sw	a4,0(a5)
    80009934:	4781                	li	a5,0
    80009936:	a241                	j	80009ab6 <OSTmrStop+0x1e0>
    80009938:	67e2                	ld	a5,24(sp)
    8000993a:	439c                	lw	a5,0(a5)
    8000993c:	873e                	mv	a4,a5
    8000993e:	205257b7          	lui	a5,0x20525
    80009942:	d5478793          	add	a5,a5,-684 # 20524d54 <CPU_MSTATUS_MIE+0x20524d4c>
    80009946:	00f70963          	beq	a4,a5,80009958 <OSTmrStop+0x82>
    8000994a:	6782                	ld	a5,0(sp)
    8000994c:	6719                	lui	a4,0x6
    8000994e:	dc470713          	add	a4,a4,-572 # 5dc4 <CPU_MSTATUS_MIE+0x5dbc>
    80009952:	c398                	sw	a4,0(a5)
    80009954:	4781                	li	a5,0
    80009956:	a285                	j	80009ab6 <OSTmrStop+0x1e0>
    80009958:	03d000ef          	jal	8000a194 <OS_TmrLock>
    8000995c:	9b3f70ef          	jal	8000130e <CPU_SR_Save>
    80009960:	f82a                	sd	a0,48(sp)
    80009962:	00002797          	auipc	a5,0x2
    80009966:	06678793          	add	a5,a5,102 # 8000b9c8 <OSTCBCurPtr>
    8000996a:	6398                	ld	a4,0(a5)
    8000996c:	00014797          	auipc	a5,0x14
    80009970:	cc478793          	add	a5,a5,-828 # 8001d630 <OSTmrTaskTCB>
    80009974:	00f71963          	bne	a4,a5,80009986 <OSTmrStop+0xb0>
    80009978:	00002797          	auipc	a5,0x2
    8000997c:	04478793          	add	a5,a5,68 # 8000b9bc <OSTmrTaskTickBase>
    80009980:	439c                	lw	a5,0(a5)
    80009982:	dc3e                	sw	a5,56(sp)
    80009984:	a039                	j	80009992 <OSTmrStop+0xbc>
    80009986:	00002797          	auipc	a5,0x2
    8000998a:	01678793          	add	a5,a5,22 # 8000b99c <OSTickCtr>
    8000998e:	439c                	lw	a5,0(a5)
    80009990:	dc3e                	sw	a5,56(sp)
    80009992:	7542                	ld	a0,48(sp)
    80009994:	987f70ef          	jal	8000131a <CPU_SR_Restore>
    80009998:	67e2                	ld	a5,24(sp)
    8000999a:	03e7c783          	lbu	a5,62(a5)
    8000999e:	2781                	sext.w	a5,a5
    800099a0:	86be                	mv	a3,a5
    800099a2:	4711                	li	a4,4
    800099a4:	0ed76d63          	bltu	a4,a3,80009a9e <OSTmrStop+0x1c8>
    800099a8:	00279713          	sll	a4,a5,0x2
    800099ac:	00002797          	auipc	a5,0x2
    800099b0:	d4078793          	add	a5,a5,-704 # 8000b6ec <OSDbg_Tmr+0xb4>
    800099b4:	97ba                	add	a5,a5,a4
    800099b6:	439c                	lw	a5,0(a5)
    800099b8:	0007871b          	sext.w	a4,a5
    800099bc:	00002797          	auipc	a5,0x2
    800099c0:	d3078793          	add	a5,a5,-720 # 8000b6ec <OSDbg_Tmr+0xb4>
    800099c4:	97ba                	add	a5,a5,a4
    800099c6:	8782                	jr	a5
    800099c8:	67e2                	ld	a5,24(sp)
    800099ca:	4705                	li	a4,1
    800099cc:	02e78f23          	sb	a4,62(a5)
    800099d0:	01615783          	lhu	a5,22(sp)
    800099d4:	2781                	sext.w	a5,a5
    800099d6:	86be                	mv	a3,a5
    800099d8:	4711                	li	a4,4
    800099da:	04e68263          	beq	a3,a4,80009a1e <OSTmrStop+0x148>
    800099de:	86be                	mv	a3,a5
    800099e0:	4711                	li	a4,4
    800099e2:	06d74963          	blt	a4,a3,80009a54 <OSTmrStop+0x17e>
    800099e6:	c3ad                	beqz	a5,80009a48 <OSTmrStop+0x172>
    800099e8:	873e                	mv	a4,a5
    800099ea:	478d                	li	a5,3
    800099ec:	06f71463          	bne	a4,a5,80009a54 <OSTmrStop+0x17e>
    800099f0:	57e2                	lw	a5,56(sp)
    800099f2:	85be                	mv	a1,a5
    800099f4:	6562                	ld	a0,24(sp)
    800099f6:	496000ef          	jal	80009e8c <OS_TmrUnlink>
    800099fa:	67e2                	ld	a5,24(sp)
    800099fc:	6b9c                	ld	a5,16(a5)
    800099fe:	f43e                	sd	a5,40(sp)
    80009a00:	77a2                	ld	a5,40(sp)
    80009a02:	cb81                	beqz	a5,80009a12 <OSTmrStop+0x13c>
    80009a04:	67e2                	ld	a5,24(sp)
    80009a06:	6f98                	ld	a4,24(a5)
    80009a08:	77a2                	ld	a5,40(sp)
    80009a0a:	85ba                	mv	a1,a4
    80009a0c:	6562                	ld	a0,24(sp)
    80009a0e:	9782                	jalr	a5
    80009a10:	a899                	j	80009a66 <OSTmrStop+0x190>
    80009a12:	6782                	ld	a5,0(sp)
    80009a14:	671d                	lui	a4,0x7
    80009a16:	34470713          	add	a4,a4,836 # 7344 <CPU_MSTATUS_MIE+0x733c>
    80009a1a:	c398                	sw	a4,0(a5)
    80009a1c:	a0a9                	j	80009a66 <OSTmrStop+0x190>
    80009a1e:	57e2                	lw	a5,56(sp)
    80009a20:	85be                	mv	a1,a5
    80009a22:	6562                	ld	a0,24(sp)
    80009a24:	468000ef          	jal	80009e8c <OS_TmrUnlink>
    80009a28:	67e2                	ld	a5,24(sp)
    80009a2a:	6b9c                	ld	a5,16(a5)
    80009a2c:	f43e                	sd	a5,40(sp)
    80009a2e:	77a2                	ld	a5,40(sp)
    80009a30:	c791                	beqz	a5,80009a3c <OSTmrStop+0x166>
    80009a32:	77a2                	ld	a5,40(sp)
    80009a34:	65a2                	ld	a1,8(sp)
    80009a36:	6562                	ld	a0,24(sp)
    80009a38:	9782                	jalr	a5
    80009a3a:	a035                	j	80009a66 <OSTmrStop+0x190>
    80009a3c:	6782                	ld	a5,0(sp)
    80009a3e:	671d                	lui	a4,0x7
    80009a40:	34470713          	add	a4,a4,836 # 7344 <CPU_MSTATUS_MIE+0x733c>
    80009a44:	c398                	sw	a4,0(a5)
    80009a46:	a005                	j	80009a66 <OSTmrStop+0x190>
    80009a48:	57e2                	lw	a5,56(sp)
    80009a4a:	85be                	mv	a1,a5
    80009a4c:	6562                	ld	a0,24(sp)
    80009a4e:	43e000ef          	jal	80009e8c <OS_TmrUnlink>
    80009a52:	a811                	j	80009a66 <OSTmrStop+0x190>
    80009a54:	762000ef          	jal	8000a1b6 <OS_TmrUnlock>
    80009a58:	6782                	ld	a5,0(sp)
    80009a5a:	6719                	lui	a4,0x6
    80009a5c:	e2570713          	add	a4,a4,-475 # 5e25 <CPU_MSTATUS_MIE+0x5e1d>
    80009a60:	c398                	sw	a4,0(a5)
    80009a62:	4781                	li	a5,0
    80009a64:	a889                	j	80009ab6 <OSTmrStop+0x1e0>
    80009a66:	6782                	ld	a5,0(sp)
    80009a68:	0007a023          	sw	zero,0(a5)
    80009a6c:	4785                	li	a5,1
    80009a6e:	02f10fa3          	sb	a5,63(sp)
    80009a72:	a835                	j	80009aae <OSTmrStop+0x1d8>
    80009a74:	67e2                	ld	a5,24(sp)
    80009a76:	4705                	li	a4,1
    80009a78:	02e78f23          	sb	a4,62(a5)
    80009a7c:	6782                	ld	a5,0(sp)
    80009a7e:	671d                	lui	a4,0x7
    80009a80:	34970713          	add	a4,a4,841 # 7349 <CPU_MSTATUS_MIE+0x7341>
    80009a84:	c398                	sw	a4,0(a5)
    80009a86:	4785                	li	a5,1
    80009a88:	02f10fa3          	sb	a5,63(sp)
    80009a8c:	a00d                	j	80009aae <OSTmrStop+0x1d8>
    80009a8e:	6782                	ld	a5,0(sp)
    80009a90:	671d                	lui	a4,0x7
    80009a92:	33d70713          	add	a4,a4,829 # 733d <CPU_MSTATUS_MIE+0x7335>
    80009a96:	c398                	sw	a4,0(a5)
    80009a98:	02010fa3          	sb	zero,63(sp)
    80009a9c:	a809                	j	80009aae <OSTmrStop+0x1d8>
    80009a9e:	6782                	ld	a5,0(sp)
    80009aa0:	671d                	lui	a4,0x7
    80009aa2:	34170713          	add	a4,a4,833 # 7341 <CPU_MSTATUS_MIE+0x7339>
    80009aa6:	c398                	sw	a4,0(a5)
    80009aa8:	02010fa3          	sb	zero,63(sp)
    80009aac:	0001                	nop
    80009aae:	708000ef          	jal	8000a1b6 <OS_TmrUnlock>
    80009ab2:	03f14783          	lbu	a5,63(sp)
    80009ab6:	853e                	mv	a0,a5
    80009ab8:	60a6                	ld	ra,72(sp)
    80009aba:	6161                	add	sp,sp,80
    80009abc:	8082                	ret

0000000080009abe <OS_TmrClr>:
    80009abe:	1141                	add	sp,sp,-16
    80009ac0:	e42a                	sd	a0,8(sp)
    80009ac2:	67a2                	ld	a5,8(sp)
    80009ac4:	02078f23          	sb	zero,62(a5)
    80009ac8:	67a2                	ld	a5,8(sp)
    80009aca:	454e5737          	lui	a4,0x454e5
    80009ace:	f4e70713          	add	a4,a4,-178 # 454e4f4e <CPU_MSTATUS_MIE+0x454e4f46>
    80009ad2:	c398                	sw	a4,0(a5)
    80009ad4:	67a2                	ld	a5,8(sp)
    80009ad6:	00002717          	auipc	a4,0x2
    80009ada:	c2a70713          	add	a4,a4,-982 # 8000b700 <OSDbg_Tmr+0xc8>
    80009ade:	e798                	sd	a4,8(a5)
    80009ae0:	67a2                	ld	a5,8(sp)
    80009ae2:	0207aa23          	sw	zero,52(a5)
    80009ae6:	67a2                	ld	a5,8(sp)
    80009ae8:	0207a823          	sw	zero,48(a5)
    80009aec:	67a2                	ld	a5,8(sp)
    80009aee:	0207ac23          	sw	zero,56(a5)
    80009af2:	67a2                	ld	a5,8(sp)
    80009af4:	02079e23          	sh	zero,60(a5)
    80009af8:	67a2                	ld	a5,8(sp)
    80009afa:	0007b823          	sd	zero,16(a5)
    80009afe:	67a2                	ld	a5,8(sp)
    80009b00:	0007bc23          	sd	zero,24(a5)
    80009b04:	67a2                	ld	a5,8(sp)
    80009b06:	0207b023          	sd	zero,32(a5)
    80009b0a:	67a2                	ld	a5,8(sp)
    80009b0c:	0207b423          	sd	zero,40(a5)
    80009b10:	0001                	nop
    80009b12:	0141                	add	sp,sp,16
    80009b14:	8082                	ret

0000000080009b16 <OS_TmrDbgListAdd>:
    80009b16:	1141                	add	sp,sp,-16
    80009b18:	e42a                	sd	a0,8(sp)
    80009b1a:	67a2                	ld	a5,8(sp)
    80009b1c:	0407b023          	sd	zero,64(a5)
    80009b20:	00002797          	auipc	a5,0x2
    80009b24:	e8078793          	add	a5,a5,-384 # 8000b9a0 <OSTmrDbgListPtr>
    80009b28:	639c                	ld	a5,0(a5)
    80009b2a:	e789                	bnez	a5,80009b34 <OS_TmrDbgListAdd+0x1e>
    80009b2c:	67a2                	ld	a5,8(sp)
    80009b2e:	0407b423          	sd	zero,72(a5)
    80009b32:	a839                	j	80009b50 <OS_TmrDbgListAdd+0x3a>
    80009b34:	00002797          	auipc	a5,0x2
    80009b38:	e6c78793          	add	a5,a5,-404 # 8000b9a0 <OSTmrDbgListPtr>
    80009b3c:	6398                	ld	a4,0(a5)
    80009b3e:	67a2                	ld	a5,8(sp)
    80009b40:	e7b8                	sd	a4,72(a5)
    80009b42:	00002797          	auipc	a5,0x2
    80009b46:	e5e78793          	add	a5,a5,-418 # 8000b9a0 <OSTmrDbgListPtr>
    80009b4a:	639c                	ld	a5,0(a5)
    80009b4c:	6722                	ld	a4,8(sp)
    80009b4e:	e3b8                	sd	a4,64(a5)
    80009b50:	00002797          	auipc	a5,0x2
    80009b54:	e5078793          	add	a5,a5,-432 # 8000b9a0 <OSTmrDbgListPtr>
    80009b58:	6722                	ld	a4,8(sp)
    80009b5a:	e398                	sd	a4,0(a5)
    80009b5c:	0001                	nop
    80009b5e:	0141                	add	sp,sp,16
    80009b60:	8082                	ret

0000000080009b62 <OS_TmrDbgListRemove>:
    80009b62:	1101                	add	sp,sp,-32
    80009b64:	e42a                	sd	a0,8(sp)
    80009b66:	67a2                	ld	a5,8(sp)
    80009b68:	63bc                	ld	a5,64(a5)
    80009b6a:	ec3e                	sd	a5,24(sp)
    80009b6c:	67a2                	ld	a5,8(sp)
    80009b6e:	67bc                	ld	a5,72(a5)
    80009b70:	e83e                	sd	a5,16(sp)
    80009b72:	67e2                	ld	a5,24(sp)
    80009b74:	e385                	bnez	a5,80009b94 <OS_TmrDbgListRemove+0x32>
    80009b76:	00002797          	auipc	a5,0x2
    80009b7a:	e2a78793          	add	a5,a5,-470 # 8000b9a0 <OSTmrDbgListPtr>
    80009b7e:	6742                	ld	a4,16(sp)
    80009b80:	e398                	sd	a4,0(a5)
    80009b82:	67c2                	ld	a5,16(sp)
    80009b84:	c781                	beqz	a5,80009b8c <OS_TmrDbgListRemove+0x2a>
    80009b86:	67c2                	ld	a5,16(sp)
    80009b88:	0407b023          	sd	zero,64(a5)
    80009b8c:	67a2                	ld	a5,8(sp)
    80009b8e:	0407b423          	sd	zero,72(a5)
    80009b92:	a035                	j	80009bbe <OS_TmrDbgListRemove+0x5c>
    80009b94:	67c2                	ld	a5,16(sp)
    80009b96:	eb81                	bnez	a5,80009ba6 <OS_TmrDbgListRemove+0x44>
    80009b98:	67e2                	ld	a5,24(sp)
    80009b9a:	0407b423          	sd	zero,72(a5)
    80009b9e:	67a2                	ld	a5,8(sp)
    80009ba0:	0407b023          	sd	zero,64(a5)
    80009ba4:	a829                	j	80009bbe <OS_TmrDbgListRemove+0x5c>
    80009ba6:	67e2                	ld	a5,24(sp)
    80009ba8:	6742                	ld	a4,16(sp)
    80009baa:	e7b8                	sd	a4,72(a5)
    80009bac:	67c2                	ld	a5,16(sp)
    80009bae:	6762                	ld	a4,24(sp)
    80009bb0:	e3b8                	sd	a4,64(a5)
    80009bb2:	67a2                	ld	a5,8(sp)
    80009bb4:	0407b423          	sd	zero,72(a5)
    80009bb8:	67a2                	ld	a5,8(sp)
    80009bba:	0407b023          	sd	zero,64(a5)
    80009bbe:	0001                	nop
    80009bc0:	6105                	add	sp,sp,32
    80009bc2:	8082                	ret

0000000080009bc4 <OS_TmrInit>:
    80009bc4:	715d                	add	sp,sp,-80
    80009bc6:	e486                	sd	ra,72(sp)
    80009bc8:	fc2a                	sd	a0,56(sp)
    80009bca:	00002797          	auipc	a5,0x2
    80009bce:	dee78793          	add	a5,a5,-530 # 8000b9b8 <OSTmrQty>
    80009bd2:	00079023          	sh	zero,0(a5)
    80009bd6:	00002797          	auipc	a5,0x2
    80009bda:	dca78793          	add	a5,a5,-566 # 8000b9a0 <OSTmrDbgListPtr>
    80009bde:	0007b023          	sd	zero,0(a5)
    80009be2:	00002797          	auipc	a5,0x2
    80009be6:	dce78793          	add	a5,a5,-562 # 8000b9b0 <OSTmrListPtr>
    80009bea:	0007b023          	sd	zero,0(a5)
    80009bee:	00002797          	auipc	a5,0x2
    80009bf2:	dba78793          	add	a5,a5,-582 # 8000b9a8 <OSTmrListEntries>
    80009bf6:	00079023          	sh	zero,0(a5)
    80009bfa:	00001797          	auipc	a5,0x1
    80009bfe:	48678793          	add	a5,a5,1158 # 8000b080 <OSCfg_TickRate_Hz>
    80009c02:	4398                	lw	a4,0(a5)
    80009c04:	00001797          	auipc	a5,0x1
    80009c08:	48478793          	add	a5,a5,1156 # 8000b088 <OSCfg_TmrTaskRate_Hz>
    80009c0c:	439c                	lw	a5,0(a5)
    80009c0e:	02f757bb          	divuw	a5,a4,a5
    80009c12:	0007871b          	sext.w	a4,a5
    80009c16:	00002797          	auipc	a5,0x2
    80009c1a:	daa78793          	add	a5,a5,-598 # 8000b9c0 <OSTmrToTicksMult>
    80009c1e:	c398                	sw	a4,0(a5)
    80009c20:	7662                	ld	a2,56(sp)
    80009c22:	00002597          	auipc	a1,0x2
    80009c26:	ae658593          	add	a1,a1,-1306 # 8000b708 <OSDbg_Tmr+0xd0>
    80009c2a:	00014517          	auipc	a0,0x14
    80009c2e:	9ae50513          	add	a0,a0,-1618 # 8001d5d8 <OSTmrMutex>
    80009c32:	b5cfc0ef          	jal	80005f8e <OSMutexCreate>
    80009c36:	77e2                	ld	a5,56(sp)
    80009c38:	439c                	lw	a5,0(a5)
    80009c3a:	e3e9                	bnez	a5,80009cfc <OS_TmrInit+0x138>
    80009c3c:	598000ef          	jal	8000a1d4 <OS_TmrCondCreate>
    80009c40:	00001797          	auipc	a5,0x1
    80009c44:	45078793          	add	a5,a5,1104 # 8000b090 <OSCfg_TmrTaskStkBasePtr>
    80009c48:	639c                	ld	a5,0(a5)
    80009c4a:	e799                	bnez	a5,80009c58 <OS_TmrInit+0x94>
    80009c4c:	77e2                	ld	a5,56(sp)
    80009c4e:	671d                	lui	a4,0x7
    80009c50:	34770713          	add	a4,a4,839 # 7347 <CPU_MSTATUS_MIE+0x733f>
    80009c54:	c398                	sw	a4,0(a5)
    80009c56:	a065                	j	80009cfe <OS_TmrInit+0x13a>
    80009c58:	00001797          	auipc	a5,0x1
    80009c5c:	44878793          	add	a5,a5,1096 # 8000b0a0 <OSCfg_TmrTaskStkSize>
    80009c60:	6398                	ld	a4,0(a5)
    80009c62:	00001797          	auipc	a5,0x1
    80009c66:	41678793          	add	a5,a5,1046 # 8000b078 <OSCfg_StkSizeMin>
    80009c6a:	639c                	ld	a5,0(a5)
    80009c6c:	00f77863          	bgeu	a4,a5,80009c7c <OS_TmrInit+0xb8>
    80009c70:	77e2                	ld	a5,56(sp)
    80009c72:	671d                	lui	a4,0x7
    80009c74:	34870713          	add	a4,a4,840 # 7348 <CPU_MSTATUS_MIE+0x7340>
    80009c78:	c398                	sw	a4,0(a5)
    80009c7a:	a051                	j	80009cfe <OS_TmrInit+0x13a>
    80009c7c:	00001797          	auipc	a5,0x1
    80009c80:	40878793          	add	a5,a5,1032 # 8000b084 <OSCfg_TmrTaskPrio>
    80009c84:	0007c783          	lbu	a5,0(a5)
    80009c88:	873e                	mv	a4,a5
    80009c8a:	03e00793          	li	a5,62
    80009c8e:	00e7f863          	bgeu	a5,a4,80009c9e <OS_TmrInit+0xda>
    80009c92:	77e2                	ld	a5,56(sp)
    80009c94:	671d                	lui	a4,0x7
    80009c96:	34670713          	add	a4,a4,838 # 7346 <CPU_MSTATUS_MIE+0x733e>
    80009c9a:	c398                	sw	a4,0(a5)
    80009c9c:	a08d                	j	80009cfe <OS_TmrInit+0x13a>
    80009c9e:	00001797          	auipc	a5,0x1
    80009ca2:	3e678793          	add	a5,a5,998 # 8000b084 <OSCfg_TmrTaskPrio>
    80009ca6:	0007c703          	lbu	a4,0(a5)
    80009caa:	00001797          	auipc	a5,0x1
    80009cae:	3e678793          	add	a5,a5,998 # 8000b090 <OSCfg_TmrTaskStkBasePtr>
    80009cb2:	6394                	ld	a3,0(a5)
    80009cb4:	00001797          	auipc	a5,0x1
    80009cb8:	3e478793          	add	a5,a5,996 # 8000b098 <OSCfg_TmrTaskStkLimit>
    80009cbc:	6390                	ld	a2,0(a5)
    80009cbe:	00001797          	auipc	a5,0x1
    80009cc2:	3e278793          	add	a5,a5,994 # 8000b0a0 <OSCfg_TmrTaskStkSize>
    80009cc6:	638c                	ld	a1,0(a5)
    80009cc8:	77e2                	ld	a5,56(sp)
    80009cca:	f03e                	sd	a5,32(sp)
    80009ccc:	47ad                	li	a5,11
    80009cce:	ec3e                	sd	a5,24(sp)
    80009cd0:	e802                	sd	zero,16(sp)
    80009cd2:	e402                	sd	zero,8(sp)
    80009cd4:	e002                	sd	zero,0(sp)
    80009cd6:	88ae                	mv	a7,a1
    80009cd8:	8832                	mv	a6,a2
    80009cda:	87b6                	mv	a5,a3
    80009cdc:	4681                	li	a3,0
    80009cde:	00000617          	auipc	a2,0x0
    80009ce2:	33860613          	add	a2,a2,824 # 8000a016 <OS_TmrTask>
    80009ce6:	00002597          	auipc	a1,0x2
    80009cea:	a3258593          	add	a1,a1,-1486 # 8000b718 <OSDbg_Tmr+0xe0>
    80009cee:	00014517          	auipc	a0,0x14
    80009cf2:	94250513          	add	a0,a0,-1726 # 8001d630 <OSTmrTaskTCB>
    80009cf6:	86ff90ef          	jal	80003564 <OSTaskCreate>
    80009cfa:	a011                	j	80009cfe <OS_TmrInit+0x13a>
    80009cfc:	0001                	nop
    80009cfe:	60a6                	ld	ra,72(sp)
    80009d00:	6161                	add	sp,sp,80
    80009d02:	8082                	ret

0000000080009d04 <OS_TmrLink>:
    80009d04:	7139                	add	sp,sp,-64
    80009d06:	fc06                	sd	ra,56(sp)
    80009d08:	e42a                	sd	a0,8(sp)
    80009d0a:	87ae                	mv	a5,a1
    80009d0c:	c23e                	sw	a5,4(sp)
    80009d0e:	00002797          	auipc	a5,0x2
    80009d12:	ca278793          	add	a5,a5,-862 # 8000b9b0 <OSTmrListPtr>
    80009d16:	639c                	ld	a5,0(a5)
    80009d18:	ef8d                	bnez	a5,80009d52 <OS_TmrLink+0x4e>
    80009d1a:	67a2                	ld	a5,8(sp)
    80009d1c:	0207b023          	sd	zero,32(a5)
    80009d20:	67a2                	ld	a5,8(sp)
    80009d22:	0207b423          	sd	zero,40(a5)
    80009d26:	00002797          	auipc	a5,0x2
    80009d2a:	c8a78793          	add	a5,a5,-886 # 8000b9b0 <OSTmrListPtr>
    80009d2e:	6722                	ld	a4,8(sp)
    80009d30:	e398                	sd	a4,0(a5)
    80009d32:	00002797          	auipc	a5,0x2
    80009d36:	c7678793          	add	a5,a5,-906 # 8000b9a8 <OSTmrListEntries>
    80009d3a:	4705                	li	a4,1
    80009d3c:	00e79023          	sh	a4,0(a5)
    80009d40:	00002797          	auipc	a5,0x2
    80009d44:	c7c78793          	add	a5,a5,-900 # 8000b9bc <OSTmrTaskTickBase>
    80009d48:	4712                	lw	a4,4(sp)
    80009d4a:	c398                	sw	a4,0(a5)
    80009d4c:	684000ef          	jal	8000a3d0 <OS_TmrCondSignal>
    80009d50:	aa1d                	j	80009e86 <OS_TmrLink+0x182>
    80009d52:	00002797          	auipc	a5,0x2
    80009d56:	c5678793          	add	a5,a5,-938 # 8000b9a8 <OSTmrListEntries>
    80009d5a:	0007d783          	lhu	a5,0(a5)
    80009d5e:	2785                	addw	a5,a5,1
    80009d60:	03079713          	sll	a4,a5,0x30
    80009d64:	9341                	srl	a4,a4,0x30
    80009d66:	00002797          	auipc	a5,0x2
    80009d6a:	c4278793          	add	a5,a5,-958 # 8000b9a8 <OSTmrListEntries>
    80009d6e:	00e79023          	sh	a4,0(a5)
    80009d72:	67a2                	ld	a5,8(sp)
    80009d74:	5b9c                	lw	a5,48(a5)
    80009d76:	4712                	lw	a4,4(sp)
    80009d78:	9fb9                	addw	a5,a5,a4
    80009d7a:	0007871b          	sext.w	a4,a5
    80009d7e:	00002797          	auipc	a5,0x2
    80009d82:	c3e78793          	add	a5,a5,-962 # 8000b9bc <OSTmrTaskTickBase>
    80009d86:	439c                	lw	a5,0(a5)
    80009d88:	40f707bb          	subw	a5,a4,a5
    80009d8c:	ce3e                	sw	a5,28(sp)
    80009d8e:	00002797          	auipc	a5,0x2
    80009d92:	c2278793          	add	a5,a5,-990 # 8000b9b0 <OSTmrListPtr>
    80009d96:	639c                	ld	a5,0(a5)
    80009d98:	f03e                	sd	a5,32(sp)
    80009d9a:	7782                	ld	a5,32(sp)
    80009d9c:	5b9c                	lw	a5,48(a5)
    80009d9e:	cc3e                	sw	a5,24(sp)
    80009da0:	47f2                	lw	a5,28(sp)
    80009da2:	873e                	mv	a4,a5
    80009da4:	47e2                	lw	a5,24(sp)
    80009da6:	2701                	sext.w	a4,a4
    80009da8:	2781                	sext.w	a5,a5
    80009daa:	04f77663          	bgeu	a4,a5,80009df6 <OS_TmrLink+0xf2>
    80009dae:	7782                	ld	a5,32(sp)
    80009db0:	779c                	ld	a5,40(a5)
    80009db2:	e3b1                	bnez	a5,80009df6 <OS_TmrLink+0xf2>
    80009db4:	47e2                	lw	a5,24(sp)
    80009db6:	873e                	mv	a4,a5
    80009db8:	47f2                	lw	a5,28(sp)
    80009dba:	40f707bb          	subw	a5,a4,a5
    80009dbe:	0007871b          	sext.w	a4,a5
    80009dc2:	7782                	ld	a5,32(sp)
    80009dc4:	db98                	sw	a4,48(a5)
    80009dc6:	67a2                	ld	a5,8(sp)
    80009dc8:	0207b423          	sd	zero,40(a5)
    80009dcc:	67a2                	ld	a5,8(sp)
    80009dce:	7702                	ld	a4,32(sp)
    80009dd0:	f398                	sd	a4,32(a5)
    80009dd2:	7782                	ld	a5,32(sp)
    80009dd4:	6722                	ld	a4,8(sp)
    80009dd6:	f798                	sd	a4,40(a5)
    80009dd8:	00002797          	auipc	a5,0x2
    80009ddc:	bd878793          	add	a5,a5,-1064 # 8000b9b0 <OSTmrListPtr>
    80009de0:	6722                	ld	a4,8(sp)
    80009de2:	e398                	sd	a4,0(a5)
    80009de4:	00002797          	auipc	a5,0x2
    80009de8:	bd878793          	add	a5,a5,-1064 # 8000b9bc <OSTmrTaskTickBase>
    80009dec:	4712                	lw	a4,4(sp)
    80009dee:	c398                	sw	a4,0(a5)
    80009df0:	5e0000ef          	jal	8000a3d0 <OS_TmrCondSignal>
    80009df4:	a849                	j	80009e86 <OS_TmrLink+0x182>
    80009df6:	47f2                	lw	a5,28(sp)
    80009df8:	873e                	mv	a4,a5
    80009dfa:	47e2                	lw	a5,24(sp)
    80009dfc:	40f707bb          	subw	a5,a4,a5
    80009e00:	ce3e                	sw	a5,28(sp)
    80009e02:	7782                	ld	a5,32(sp)
    80009e04:	f43e                	sd	a5,40(sp)
    80009e06:	77a2                	ld	a5,40(sp)
    80009e08:	739c                	ld	a5,32(a5)
    80009e0a:	f03e                	sd	a5,32(sp)
    80009e0c:	a821                	j	80009e24 <OS_TmrLink+0x120>
    80009e0e:	7782                	ld	a5,32(sp)
    80009e10:	5b9c                	lw	a5,48(a5)
    80009e12:	4772                	lw	a4,28(sp)
    80009e14:	40f707bb          	subw	a5,a4,a5
    80009e18:	ce3e                	sw	a5,28(sp)
    80009e1a:	7782                	ld	a5,32(sp)
    80009e1c:	f43e                	sd	a5,40(sp)
    80009e1e:	7782                	ld	a5,32(sp)
    80009e20:	739c                	ld	a5,32(a5)
    80009e22:	f03e                	sd	a5,32(sp)
    80009e24:	7782                	ld	a5,32(sp)
    80009e26:	c799                	beqz	a5,80009e34 <OS_TmrLink+0x130>
    80009e28:	7782                	ld	a5,32(sp)
    80009e2a:	5b98                	lw	a4,48(a5)
    80009e2c:	47f2                	lw	a5,28(sp)
    80009e2e:	2781                	sext.w	a5,a5
    80009e30:	fce7ffe3          	bgeu	a5,a4,80009e0e <OS_TmrLink+0x10a>
    80009e34:	7782                	ld	a5,32(sp)
    80009e36:	cf85                	beqz	a5,80009e6e <OS_TmrLink+0x16a>
    80009e38:	7782                	ld	a5,32(sp)
    80009e3a:	779c                	ld	a5,40(a5)
    80009e3c:	f43e                	sd	a5,40(sp)
    80009e3e:	67a2                	ld	a5,8(sp)
    80009e40:	4772                	lw	a4,28(sp)
    80009e42:	db98                	sw	a4,48(a5)
    80009e44:	67a2                	ld	a5,8(sp)
    80009e46:	7722                	ld	a4,40(sp)
    80009e48:	f798                	sd	a4,40(a5)
    80009e4a:	67a2                	ld	a5,8(sp)
    80009e4c:	7702                	ld	a4,32(sp)
    80009e4e:	f398                	sd	a4,32(a5)
    80009e50:	7782                	ld	a5,32(sp)
    80009e52:	5b9c                	lw	a5,48(a5)
    80009e54:	4772                	lw	a4,28(sp)
    80009e56:	9f99                	subw	a5,a5,a4
    80009e58:	0007871b          	sext.w	a4,a5
    80009e5c:	7782                	ld	a5,32(sp)
    80009e5e:	db98                	sw	a4,48(a5)
    80009e60:	7782                	ld	a5,32(sp)
    80009e62:	6722                	ld	a4,8(sp)
    80009e64:	f798                	sd	a4,40(a5)
    80009e66:	77a2                	ld	a5,40(sp)
    80009e68:	6722                	ld	a4,8(sp)
    80009e6a:	f398                	sd	a4,32(a5)
    80009e6c:	a829                	j	80009e86 <OS_TmrLink+0x182>
    80009e6e:	67a2                	ld	a5,8(sp)
    80009e70:	4772                	lw	a4,28(sp)
    80009e72:	db98                	sw	a4,48(a5)
    80009e74:	67a2                	ld	a5,8(sp)
    80009e76:	7722                	ld	a4,40(sp)
    80009e78:	f798                	sd	a4,40(a5)
    80009e7a:	67a2                	ld	a5,8(sp)
    80009e7c:	0207b023          	sd	zero,32(a5)
    80009e80:	77a2                	ld	a5,40(sp)
    80009e82:	6722                	ld	a4,8(sp)
    80009e84:	f398                	sd	a4,32(a5)
    80009e86:	70e2                	ld	ra,56(sp)
    80009e88:	6121                	add	sp,sp,64
    80009e8a:	8082                	ret

0000000080009e8c <OS_TmrUnlink>:
    80009e8c:	7139                	add	sp,sp,-64
    80009e8e:	fc06                	sd	ra,56(sp)
    80009e90:	e42a                	sd	a0,8(sp)
    80009e92:	87ae                	mv	a5,a1
    80009e94:	c23e                	sw	a5,4(sp)
    80009e96:	67a2                	ld	a5,8(sp)
    80009e98:	779c                	ld	a5,40(a5)
    80009e9a:	ec3e                	sd	a5,24(sp)
    80009e9c:	67a2                	ld	a5,8(sp)
    80009e9e:	739c                	ld	a5,32(a5)
    80009ea0:	f43e                	sd	a5,40(sp)
    80009ea2:	67e2                	ld	a5,24(sp)
    80009ea4:	10079b63          	bnez	a5,80009fba <OS_TmrUnlink+0x12e>
    80009ea8:	77a2                	ld	a5,40(sp)
    80009eaa:	eb8d                	bnez	a5,80009edc <OS_TmrUnlink+0x50>
    80009eac:	00002797          	auipc	a5,0x2
    80009eb0:	b0478793          	add	a5,a5,-1276 # 8000b9b0 <OSTmrListPtr>
    80009eb4:	0007b023          	sd	zero,0(a5)
    80009eb8:	00002797          	auipc	a5,0x2
    80009ebc:	af078793          	add	a5,a5,-1296 # 8000b9a8 <OSTmrListEntries>
    80009ec0:	00079023          	sh	zero,0(a5)
    80009ec4:	67a2                	ld	a5,8(sp)
    80009ec6:	0207a823          	sw	zero,48(a5)
    80009eca:	00002797          	auipc	a5,0x2
    80009ece:	af278793          	add	a5,a5,-1294 # 8000b9bc <OSTmrTaskTickBase>
    80009ed2:	4712                	lw	a4,4(sp)
    80009ed4:	c398                	sw	a4,0(a5)
    80009ed6:	4fa000ef          	jal	8000a3d0 <OS_TmrCondSignal>
    80009eda:	aa15                	j	8000a00e <OS_TmrUnlink+0x182>
    80009edc:	00002797          	auipc	a5,0x2
    80009ee0:	acc78793          	add	a5,a5,-1332 # 8000b9a8 <OSTmrListEntries>
    80009ee4:	0007d783          	lhu	a5,0(a5)
    80009ee8:	37fd                	addw	a5,a5,-1
    80009eea:	03079713          	sll	a4,a5,0x30
    80009eee:	9341                	srl	a4,a4,0x30
    80009ef0:	00002797          	auipc	a5,0x2
    80009ef4:	ab878793          	add	a5,a5,-1352 # 8000b9a8 <OSTmrListEntries>
    80009ef8:	00e79023          	sh	a4,0(a5)
    80009efc:	00002797          	auipc	a5,0x2
    80009f00:	ac078793          	add	a5,a5,-1344 # 8000b9bc <OSTmrTaskTickBase>
    80009f04:	439c                	lw	a5,0(a5)
    80009f06:	4712                	lw	a4,4(sp)
    80009f08:	40f707bb          	subw	a5,a4,a5
    80009f0c:	d23e                	sw	a5,36(sp)
    80009f0e:	77a2                	ld	a5,40(sp)
    80009f10:	0207b423          	sd	zero,40(a5)
    80009f14:	77a2                	ld	a5,40(sp)
    80009f16:	5b98                	lw	a4,48(a5)
    80009f18:	67a2                	ld	a5,8(sp)
    80009f1a:	5b9c                	lw	a5,48(a5)
    80009f1c:	9fb9                	addw	a5,a5,a4
    80009f1e:	0007871b          	sext.w	a4,a5
    80009f22:	77a2                	ld	a5,40(sp)
    80009f24:	db98                	sw	a4,48(a5)
    80009f26:	00002797          	auipc	a5,0x2
    80009f2a:	a8a78793          	add	a5,a5,-1398 # 8000b9b0 <OSTmrListPtr>
    80009f2e:	7722                	ld	a4,40(sp)
    80009f30:	e398                	sd	a4,0(a5)
    80009f32:	a83d                	j	80009f70 <OS_TmrUnlink+0xe4>
    80009f34:	77a2                	ld	a5,40(sp)
    80009f36:	5b98                	lw	a4,48(a5)
    80009f38:	5792                	lw	a5,36(sp)
    80009f3a:	2781                	sext.w	a5,a5
    80009f3c:	00f77c63          	bgeu	a4,a5,80009f54 <OS_TmrUnlink+0xc8>
    80009f40:	77a2                	ld	a5,40(sp)
    80009f42:	5b9c                	lw	a5,48(a5)
    80009f44:	5712                	lw	a4,36(sp)
    80009f46:	40f707bb          	subw	a5,a4,a5
    80009f4a:	d23e                	sw	a5,36(sp)
    80009f4c:	77a2                	ld	a5,40(sp)
    80009f4e:	0207a823          	sw	zero,48(a5)
    80009f52:	a811                	j	80009f66 <OS_TmrUnlink+0xda>
    80009f54:	77a2                	ld	a5,40(sp)
    80009f56:	5b9c                	lw	a5,48(a5)
    80009f58:	5712                	lw	a4,36(sp)
    80009f5a:	9f99                	subw	a5,a5,a4
    80009f5c:	0007871b          	sext.w	a4,a5
    80009f60:	77a2                	ld	a5,40(sp)
    80009f62:	db98                	sw	a4,48(a5)
    80009f64:	d202                	sw	zero,36(sp)
    80009f66:	77a2                	ld	a5,40(sp)
    80009f68:	ec3e                	sd	a5,24(sp)
    80009f6a:	67e2                	ld	a5,24(sp)
    80009f6c:	739c                	ld	a5,32(a5)
    80009f6e:	f43e                	sd	a5,40(sp)
    80009f70:	5792                	lw	a5,36(sp)
    80009f72:	2781                	sext.w	a5,a5
    80009f74:	c399                	beqz	a5,80009f7a <OS_TmrUnlink+0xee>
    80009f76:	77a2                	ld	a5,40(sp)
    80009f78:	ffd5                	bnez	a5,80009f34 <OS_TmrUnlink+0xa8>
    80009f7a:	00002797          	auipc	a5,0x2
    80009f7e:	a3678793          	add	a5,a5,-1482 # 8000b9b0 <OSTmrListPtr>
    80009f82:	639c                	ld	a5,0(a5)
    80009f84:	5b98                	lw	a4,48(a5)
    80009f86:	67a2                	ld	a5,8(sp)
    80009f88:	5b9c                	lw	a5,48(a5)
    80009f8a:	00f71963          	bne	a4,a5,80009f9c <OS_TmrUnlink+0x110>
    80009f8e:	00002797          	auipc	a5,0x2
    80009f92:	a2278793          	add	a5,a5,-1502 # 8000b9b0 <OSTmrListPtr>
    80009f96:	639c                	ld	a5,0(a5)
    80009f98:	5b9c                	lw	a5,48(a5)
    80009f9a:	eb89                	bnez	a5,80009fac <OS_TmrUnlink+0x120>
    80009f9c:	00002797          	auipc	a5,0x2
    80009fa0:	a2078793          	add	a5,a5,-1504 # 8000b9bc <OSTmrTaskTickBase>
    80009fa4:	4712                	lw	a4,4(sp)
    80009fa6:	c398                	sw	a4,0(a5)
    80009fa8:	428000ef          	jal	8000a3d0 <OS_TmrCondSignal>
    80009fac:	67a2                	ld	a5,8(sp)
    80009fae:	0207b023          	sd	zero,32(a5)
    80009fb2:	67a2                	ld	a5,8(sp)
    80009fb4:	0207a823          	sw	zero,48(a5)
    80009fb8:	a899                	j	8000a00e <OS_TmrUnlink+0x182>
    80009fba:	00002797          	auipc	a5,0x2
    80009fbe:	9ee78793          	add	a5,a5,-1554 # 8000b9a8 <OSTmrListEntries>
    80009fc2:	0007d783          	lhu	a5,0(a5)
    80009fc6:	37fd                	addw	a5,a5,-1
    80009fc8:	03079713          	sll	a4,a5,0x30
    80009fcc:	9341                	srl	a4,a4,0x30
    80009fce:	00002797          	auipc	a5,0x2
    80009fd2:	9da78793          	add	a5,a5,-1574 # 8000b9a8 <OSTmrListEntries>
    80009fd6:	00e79023          	sh	a4,0(a5)
    80009fda:	67e2                	ld	a5,24(sp)
    80009fdc:	7722                	ld	a4,40(sp)
    80009fde:	f398                	sd	a4,32(a5)
    80009fe0:	77a2                	ld	a5,40(sp)
    80009fe2:	cf89                	beqz	a5,80009ffc <OS_TmrUnlink+0x170>
    80009fe4:	77a2                	ld	a5,40(sp)
    80009fe6:	6762                	ld	a4,24(sp)
    80009fe8:	f798                	sd	a4,40(a5)
    80009fea:	77a2                	ld	a5,40(sp)
    80009fec:	5b98                	lw	a4,48(a5)
    80009fee:	67a2                	ld	a5,8(sp)
    80009ff0:	5b9c                	lw	a5,48(a5)
    80009ff2:	9fb9                	addw	a5,a5,a4
    80009ff4:	0007871b          	sext.w	a4,a5
    80009ff8:	77a2                	ld	a5,40(sp)
    80009ffa:	db98                	sw	a4,48(a5)
    80009ffc:	67a2                	ld	a5,8(sp)
    80009ffe:	0207b423          	sd	zero,40(a5)
    8000a002:	67a2                	ld	a5,8(sp)
    8000a004:	0207b023          	sd	zero,32(a5)
    8000a008:	67a2                	ld	a5,8(sp)
    8000a00a:	0207a823          	sw	zero,48(a5)
    8000a00e:	0001                	nop
    8000a010:	70e2                	ld	ra,56(sp)
    8000a012:	6121                	add	sp,sp,64
    8000a014:	8082                	ret

000000008000a016 <OS_TmrTask>:
    8000a016:	715d                	add	sp,sp,-80
    8000a018:	e486                	sd	ra,72(sp)
    8000a01a:	e42a                	sd	a0,8(sp)
    8000a01c:	f402                	sd	zero,40(sp)
    8000a01e:	176000ef          	jal	8000a194 <OS_TmrLock>
    8000a022:	00002797          	auipc	a5,0x2
    8000a026:	98e78793          	add	a5,a5,-1650 # 8000b9b0 <OSTmrListPtr>
    8000a02a:	639c                	ld	a5,0(a5)
    8000a02c:	e399                	bnez	a5,8000a032 <OS_TmrTask+0x1c>
    8000a02e:	da02                	sw	zero,52(sp)
    8000a030:	a801                	j	8000a040 <OS_TmrTask+0x2a>
    8000a032:	00002797          	auipc	a5,0x2
    8000a036:	97e78793          	add	a5,a5,-1666 # 8000b9b0 <OSTmrListPtr>
    8000a03a:	639c                	ld	a5,0(a5)
    8000a03c:	5b9c                	lw	a5,48(a5)
    8000a03e:	da3e                	sw	a5,52(sp)
    8000a040:	57d2                	lw	a5,52(sp)
    8000a042:	853e                	mv	a0,a5
    8000a044:	1da000ef          	jal	8000a21e <OS_TmrCondWait>
    8000a048:	00002797          	auipc	a5,0x2
    8000a04c:	96878793          	add	a5,a5,-1688 # 8000b9b0 <OSTmrListPtr>
    8000a050:	639c                	ld	a5,0(a5)
    8000a052:	12078f63          	beqz	a5,8000a190 <OS_TmrTask+0x17a>
    8000a056:	ab8f70ef          	jal	8000130e <CPU_SR_Save>
    8000a05a:	f42a                	sd	a0,40(sp)
    8000a05c:	00002797          	auipc	a5,0x2
    8000a060:	94078793          	add	a5,a5,-1728 # 8000b99c <OSTickCtr>
    8000a064:	439c                	lw	a5,0(a5)
    8000a066:	d23e                	sw	a5,36(sp)
    8000a068:	7522                	ld	a0,40(sp)
    8000a06a:	ab0f70ef          	jal	8000131a <CPU_SR_Restore>
    8000a06e:	00002797          	auipc	a5,0x2
    8000a072:	94e78793          	add	a5,a5,-1714 # 8000b9bc <OSTmrTaskTickBase>
    8000a076:	439c                	lw	a5,0(a5)
    8000a078:	5712                	lw	a4,36(sp)
    8000a07a:	40f707bb          	subw	a5,a4,a5
    8000a07e:	d83e                	sw	a5,48(sp)
    8000a080:	00002797          	auipc	a5,0x2
    8000a084:	93c78793          	add	a5,a5,-1732 # 8000b9bc <OSTmrTaskTickBase>
    8000a088:	5712                	lw	a4,36(sp)
    8000a08a:	c398                	sw	a4,0(a5)
    8000a08c:	00002797          	auipc	a5,0x2
    8000a090:	92478793          	add	a5,a5,-1756 # 8000b9b0 <OSTmrListPtr>
    8000a094:	639c                	ld	a5,0(a5)
    8000a096:	fc3e                	sd	a5,56(sp)
    8000a098:	a82d                	j	8000a0d2 <OS_TmrTask+0xbc>
    8000a09a:	77e2                	ld	a5,56(sp)
    8000a09c:	5b98                	lw	a4,48(a5)
    8000a09e:	57c2                	lw	a5,48(sp)
    8000a0a0:	2781                	sext.w	a5,a5
    8000a0a2:	00f77c63          	bgeu	a4,a5,8000a0ba <OS_TmrTask+0xa4>
    8000a0a6:	77e2                	ld	a5,56(sp)
    8000a0a8:	5b9c                	lw	a5,48(a5)
    8000a0aa:	5742                	lw	a4,48(sp)
    8000a0ac:	40f707bb          	subw	a5,a4,a5
    8000a0b0:	d83e                	sw	a5,48(sp)
    8000a0b2:	77e2                	ld	a5,56(sp)
    8000a0b4:	0207a823          	sw	zero,48(a5)
    8000a0b8:	a811                	j	8000a0cc <OS_TmrTask+0xb6>
    8000a0ba:	77e2                	ld	a5,56(sp)
    8000a0bc:	5b9c                	lw	a5,48(a5)
    8000a0be:	5742                	lw	a4,48(sp)
    8000a0c0:	9f99                	subw	a5,a5,a4
    8000a0c2:	0007871b          	sext.w	a4,a5
    8000a0c6:	77e2                	ld	a5,56(sp)
    8000a0c8:	db98                	sw	a4,48(a5)
    8000a0ca:	d802                	sw	zero,48(sp)
    8000a0cc:	77e2                	ld	a5,56(sp)
    8000a0ce:	739c                	ld	a5,32(a5)
    8000a0d0:	fc3e                	sd	a5,56(sp)
    8000a0d2:	57c2                	lw	a5,48(sp)
    8000a0d4:	2781                	sext.w	a5,a5
    8000a0d6:	c399                	beqz	a5,8000a0dc <OS_TmrTask+0xc6>
    8000a0d8:	77e2                	ld	a5,56(sp)
    8000a0da:	f3e1                	bnez	a5,8000a09a <OS_TmrTask+0x84>
    8000a0dc:	00002797          	auipc	a5,0x2
    8000a0e0:	8d478793          	add	a5,a5,-1836 # 8000b9b0 <OSTmrListPtr>
    8000a0e4:	639c                	ld	a5,0(a5)
    8000a0e6:	fc3e                	sd	a5,56(sp)
    8000a0e8:	a869                	j	8000a182 <OS_TmrTask+0x16c>
    8000a0ea:	77e2                	ld	a5,56(sp)
    8000a0ec:	4711                	li	a4,4
    8000a0ee:	02e78f23          	sb	a4,62(a5)
    8000a0f2:	77e2                	ld	a5,56(sp)
    8000a0f4:	6b9c                	ld	a5,16(a5)
    8000a0f6:	ec3e                	sd	a5,24(sp)
    8000a0f8:	67e2                	ld	a5,24(sp)
    8000a0fa:	c799                	beqz	a5,8000a108 <OS_TmrTask+0xf2>
    8000a0fc:	77e2                	ld	a5,56(sp)
    8000a0fe:	6f98                	ld	a4,24(a5)
    8000a100:	67e2                	ld	a5,24(sp)
    8000a102:	85ba                	mv	a1,a4
    8000a104:	7562                	ld	a0,56(sp)
    8000a106:	9782                	jalr	a5
    8000a108:	77e2                	ld	a5,56(sp)
    8000a10a:	03e7c783          	lbu	a5,62(a5)
    8000a10e:	873e                	mv	a4,a5
    8000a110:	4791                	li	a5,4
    8000a112:	06f71263          	bne	a4,a5,8000a176 <OS_TmrTask+0x160>
    8000a116:	00002797          	auipc	a5,0x2
    8000a11a:	8a678793          	add	a5,a5,-1882 # 8000b9bc <OSTmrTaskTickBase>
    8000a11e:	439c                	lw	a5,0(a5)
    8000a120:	85be                	mv	a1,a5
    8000a122:	7562                	ld	a0,56(sp)
    8000a124:	d69ff0ef          	jal	80009e8c <OS_TmrUnlink>
    8000a128:	77e2                	ld	a5,56(sp)
    8000a12a:	03c7d783          	lhu	a5,60(a5)
    8000a12e:	0007871b          	sext.w	a4,a5
    8000a132:	4789                	li	a5,2
    8000a134:	02f71463          	bne	a4,a5,8000a15c <OS_TmrTask+0x146>
    8000a138:	77e2                	ld	a5,56(sp)
    8000a13a:	4709                	li	a4,2
    8000a13c:	02e78f23          	sb	a4,62(a5)
    8000a140:	77e2                	ld	a5,56(sp)
    8000a142:	5f98                	lw	a4,56(a5)
    8000a144:	77e2                	ld	a5,56(sp)
    8000a146:	db98                	sw	a4,48(a5)
    8000a148:	00002797          	auipc	a5,0x2
    8000a14c:	87478793          	add	a5,a5,-1932 # 8000b9bc <OSTmrTaskTickBase>
    8000a150:	439c                	lw	a5,0(a5)
    8000a152:	85be                	mv	a1,a5
    8000a154:	7562                	ld	a0,56(sp)
    8000a156:	bafff0ef          	jal	80009d04 <OS_TmrLink>
    8000a15a:	a831                	j	8000a176 <OS_TmrTask+0x160>
    8000a15c:	77e2                	ld	a5,56(sp)
    8000a15e:	0207b423          	sd	zero,40(a5)
    8000a162:	77e2                	ld	a5,56(sp)
    8000a164:	0207b023          	sd	zero,32(a5)
    8000a168:	77e2                	ld	a5,56(sp)
    8000a16a:	0207a823          	sw	zero,48(a5)
    8000a16e:	77e2                	ld	a5,56(sp)
    8000a170:	470d                	li	a4,3
    8000a172:	02e78f23          	sb	a4,62(a5)
    8000a176:	00002797          	auipc	a5,0x2
    8000a17a:	83a78793          	add	a5,a5,-1990 # 8000b9b0 <OSTmrListPtr>
    8000a17e:	639c                	ld	a5,0(a5)
    8000a180:	fc3e                	sd	a5,56(sp)
    8000a182:	77e2                	ld	a5,56(sp)
    8000a184:	e8078fe3          	beqz	a5,8000a022 <OS_TmrTask+0xc>
    8000a188:	77e2                	ld	a5,56(sp)
    8000a18a:	5b9c                	lw	a5,48(a5)
    8000a18c:	dfb9                	beqz	a5,8000a0ea <OS_TmrTask+0xd4>
    8000a18e:	bd51                	j	8000a022 <OS_TmrTask+0xc>
    8000a190:	0001                	nop
    8000a192:	bd41                	j	8000a022 <OS_TmrTask+0xc>

000000008000a194 <OS_TmrLock>:
    8000a194:	1101                	add	sp,sp,-32
    8000a196:	ec06                	sd	ra,24(sp)
    8000a198:	007c                	add	a5,sp,12
    8000a19a:	873e                	mv	a4,a5
    8000a19c:	4681                	li	a3,0
    8000a19e:	4601                	li	a2,0
    8000a1a0:	4581                	li	a1,0
    8000a1a2:	00013517          	auipc	a0,0x13
    8000a1a6:	43650513          	add	a0,a0,1078 # 8001d5d8 <OSTmrMutex>
    8000a1aa:	88efc0ef          	jal	80006238 <OSMutexPend>
    8000a1ae:	0001                	nop
    8000a1b0:	60e2                	ld	ra,24(sp)
    8000a1b2:	6105                	add	sp,sp,32
    8000a1b4:	8082                	ret

000000008000a1b6 <OS_TmrUnlock>:
    8000a1b6:	1101                	add	sp,sp,-32
    8000a1b8:	ec06                	sd	ra,24(sp)
    8000a1ba:	007c                	add	a5,sp,12
    8000a1bc:	863e                	mv	a2,a5
    8000a1be:	4581                	li	a1,0
    8000a1c0:	00013517          	auipc	a0,0x13
    8000a1c4:	41850513          	add	a0,a0,1048 # 8001d5d8 <OSTmrMutex>
    8000a1c8:	c88fc0ef          	jal	80006650 <OSMutexPost>
    8000a1cc:	0001                	nop
    8000a1ce:	60e2                	ld	ra,24(sp)
    8000a1d0:	6105                	add	sp,sp,32
    8000a1d2:	8082                	ret

000000008000a1d4 <OS_TmrCondCreate>:
    8000a1d4:	1101                	add	sp,sp,-32
    8000a1d6:	ec06                	sd	ra,24(sp)
    8000a1d8:	e402                	sd	zero,8(sp)
    8000a1da:	934f70ef          	jal	8000130e <CPU_SR_Save>
    8000a1de:	e42a                	sd	a0,8(sp)
    8000a1e0:	00013797          	auipc	a5,0x13
    8000a1e4:	3b078793          	add	a5,a5,944 # 8001d590 <OSTmrCond>
    8000a1e8:	444e5737          	lui	a4,0x444e5
    8000a1ec:	f4370713          	add	a4,a4,-189 # 444e4f43 <CPU_MSTATUS_MIE+0x444e4f3b>
    8000a1f0:	c398                	sw	a4,0(a5)
    8000a1f2:	00013797          	auipc	a5,0x13
    8000a1f6:	39e78793          	add	a5,a5,926 # 8001d590 <OSTmrCond>
    8000a1fa:	00013717          	auipc	a4,0x13
    8000a1fe:	3de70713          	add	a4,a4,990 # 8001d5d8 <OSTmrMutex>
    8000a202:	e3b8                	sd	a4,64(a5)
    8000a204:	00013517          	auipc	a0,0x13
    8000a208:	39c50513          	add	a0,a0,924 # 8001d5a0 <OSTmrCond+0x10>
    8000a20c:	eeefb0ef          	jal	800058fa <OS_PendListInit>
    8000a210:	6522                	ld	a0,8(sp)
    8000a212:	908f70ef          	jal	8000131a <CPU_SR_Restore>
    8000a216:	0001                	nop
    8000a218:	60e2                	ld	ra,24(sp)
    8000a21a:	6105                	add	sp,sp,32
    8000a21c:	8082                	ret

000000008000a21e <OS_TmrCondWait>:
    8000a21e:	7139                	add	sp,sp,-64
    8000a220:	fc06                	sd	ra,56(sp)
    8000a222:	87aa                	mv	a5,a0
    8000a224:	c63e                	sw	a5,12(sp)
    8000a226:	f402                	sd	zero,40(sp)
    8000a228:	8e6f70ef          	jal	8000130e <CPU_SR_Save>
    8000a22c:	f42a                	sd	a0,40(sp)
    8000a22e:	d202                	sw	zero,36(sp)
    8000a230:	00013597          	auipc	a1,0x13
    8000a234:	3a858593          	add	a1,a1,936 # 8001d5d8 <OSTmrMutex>
    8000a238:	00013517          	auipc	a0,0x13
    8000a23c:	3f850513          	add	a0,a0,1016 # 8001d630 <OSTmrTaskTCB>
    8000a240:	f58fc0ef          	jal	80006998 <OS_MutexGrpRemove>
    8000a244:	00013797          	auipc	a5,0x13
    8000a248:	3a478793          	add	a5,a5,932 # 8001d5e8 <OSTmrMutex+0x10>
    8000a24c:	ec3e                	sd	a5,24(sp)
    8000a24e:	00013797          	auipc	a5,0x13
    8000a252:	3e278793          	add	a5,a5,994 # 8001d630 <OSTmrTaskTCB>
    8000a256:	0737c703          	lbu	a4,115(a5)
    8000a25a:	00013797          	auipc	a5,0x13
    8000a25e:	3d678793          	add	a5,a5,982 # 8001d630 <OSTmrTaskTCB>
    8000a262:	0747c783          	lbu	a5,116(a5)
    8000a266:	02f70a63          	beq	a4,a5,8000a29a <OS_TmrCondWait+0x7c>
    8000a26a:	00013797          	auipc	a5,0x13
    8000a26e:	3c678793          	add	a5,a5,966 # 8001d630 <OSTmrTaskTCB>
    8000a272:	0747c703          	lbu	a4,116(a5)
    8000a276:	00013797          	auipc	a5,0x13
    8000a27a:	3ba78793          	add	a5,a5,954 # 8001d630 <OSTmrTaskTCB>
    8000a27e:	06e789a3          	sb	a4,115(a5)
    8000a282:	00013797          	auipc	a5,0x13
    8000a286:	3ae78793          	add	a5,a5,942 # 8001d630 <OSTmrTaskTCB>
    8000a28a:	0747c703          	lbu	a4,116(a5)
    8000a28e:	00001797          	auipc	a5,0x1
    8000a292:	6b478793          	add	a5,a5,1716 # 8000b942 <OSPrioCur>
    8000a296:	00e78023          	sb	a4,0(a5)
    8000a29a:	67e2                	ld	a5,24(sp)
    8000a29c:	639c                	ld	a5,0(a5)
    8000a29e:	ef91                	bnez	a5,8000a2ba <OS_TmrCondWait+0x9c>
    8000a2a0:	00013797          	auipc	a5,0x13
    8000a2a4:	33878793          	add	a5,a5,824 # 8001d5d8 <OSTmrMutex>
    8000a2a8:	0407b423          	sd	zero,72(a5)
    8000a2ac:	00013797          	auipc	a5,0x13
    8000a2b0:	32c78793          	add	a5,a5,812 # 8001d5d8 <OSTmrMutex>
    8000a2b4:	04078823          	sb	zero,80(a5)
    8000a2b8:	a099                	j	8000a2fe <OS_TmrCondWait+0xe0>
    8000a2ba:	67e2                	ld	a5,24(sp)
    8000a2bc:	639c                	ld	a5,0(a5)
    8000a2be:	e83e                	sd	a5,16(sp)
    8000a2c0:	00013797          	auipc	a5,0x13
    8000a2c4:	31878793          	add	a5,a5,792 # 8001d5d8 <OSTmrMutex>
    8000a2c8:	6742                	ld	a4,16(sp)
    8000a2ca:	e7b8                	sd	a4,72(a5)
    8000a2cc:	00013797          	auipc	a5,0x13
    8000a2d0:	30c78793          	add	a5,a5,780 # 8001d5d8 <OSTmrMutex>
    8000a2d4:	4705                	li	a4,1
    8000a2d6:	04e78823          	sb	a4,80(a5)
    8000a2da:	00013597          	auipc	a1,0x13
    8000a2de:	2fe58593          	add	a1,a1,766 # 8001d5d8 <OSTmrMutex>
    8000a2e2:	6542                	ld	a0,16(sp)
    8000a2e4:	e9afc0ef          	jal	8000697e <OS_MutexGrpAdd>
    8000a2e8:	5792                	lw	a5,36(sp)
    8000a2ea:	873e                	mv	a4,a5
    8000a2ec:	4681                	li	a3,0
    8000a2ee:	4601                	li	a2,0
    8000a2f0:	65c2                	ld	a1,16(sp)
    8000a2f2:	00013517          	auipc	a0,0x13
    8000a2f6:	2e650513          	add	a0,a0,742 # 8001d5d8 <OSTmrMutex>
    8000a2fa:	f94fb0ef          	jal	80005a8e <OS_Post>
    8000a2fe:	47b2                	lw	a5,12(sp)
    8000a300:	86be                	mv	a3,a5
    8000a302:	460d                	li	a2,3
    8000a304:	00013597          	auipc	a1,0x13
    8000a308:	32c58593          	add	a1,a1,812 # 8001d630 <OSTmrTaskTCB>
    8000a30c:	00013517          	auipc	a0,0x13
    8000a310:	28450513          	add	a0,a0,644 # 8001d590 <OSTmrCond>
    8000a314:	bcafb0ef          	jal	800056de <OS_Pend>
    8000a318:	7522                	ld	a0,40(sp)
    8000a31a:	800f70ef          	jal	8000131a <CPU_SR_Restore>
    8000a31e:	e29fa0ef          	jal	80005146 <OSSched>
    8000a322:	fedf60ef          	jal	8000130e <CPU_SR_Save>
    8000a326:	f42a                	sd	a0,40(sp)
    8000a328:	00013797          	auipc	a5,0x13
    8000a32c:	2b078793          	add	a5,a5,688 # 8001d5d8 <OSTmrMutex>
    8000a330:	67bc                	ld	a5,72(a5)
    8000a332:	ef9d                	bnez	a5,8000a370 <OS_TmrCondWait+0x152>
    8000a334:	00013597          	auipc	a1,0x13
    8000a338:	2a458593          	add	a1,a1,676 # 8001d5d8 <OSTmrMutex>
    8000a33c:	00013517          	auipc	a0,0x13
    8000a340:	2f450513          	add	a0,a0,756 # 8001d630 <OSTmrTaskTCB>
    8000a344:	e3afc0ef          	jal	8000697e <OS_MutexGrpAdd>
    8000a348:	00013797          	auipc	a5,0x13
    8000a34c:	29078793          	add	a5,a5,656 # 8001d5d8 <OSTmrMutex>
    8000a350:	00013717          	auipc	a4,0x13
    8000a354:	2e070713          	add	a4,a4,736 # 8001d630 <OSTmrTaskTCB>
    8000a358:	e7b8                	sd	a4,72(a5)
    8000a35a:	00013797          	auipc	a5,0x13
    8000a35e:	27e78793          	add	a5,a5,638 # 8001d5d8 <OSTmrMutex>
    8000a362:	4705                	li	a4,1
    8000a364:	04e78823          	sb	a4,80(a5)
    8000a368:	7522                	ld	a0,40(sp)
    8000a36a:	fb1f60ef          	jal	8000131a <CPU_SR_Restore>
    8000a36e:	a8a9                	j	8000a3c8 <OS_TmrCondWait+0x1aa>
    8000a370:	00013797          	auipc	a5,0x13
    8000a374:	26878793          	add	a5,a5,616 # 8001d5d8 <OSTmrMutex>
    8000a378:	67bc                	ld	a5,72(a5)
    8000a37a:	e83e                	sd	a5,16(sp)
    8000a37c:	67c2                	ld	a5,16(sp)
    8000a37e:	0737c703          	lbu	a4,115(a5)
    8000a382:	00013797          	auipc	a5,0x13
    8000a386:	2ae78793          	add	a5,a5,686 # 8001d630 <OSTmrTaskTCB>
    8000a38a:	0737c783          	lbu	a5,115(a5)
    8000a38e:	00e7fc63          	bgeu	a5,a4,8000a3a6 <OS_TmrCondWait+0x188>
    8000a392:	00013797          	auipc	a5,0x13
    8000a396:	29e78793          	add	a5,a5,670 # 8001d630 <OSTmrTaskTCB>
    8000a39a:	0737c783          	lbu	a5,115(a5)
    8000a39e:	85be                	mv	a1,a5
    8000a3a0:	6542                	ld	a0,16(sp)
    8000a3a2:	8a1fa0ef          	jal	80004c42 <OS_TaskChangePrio>
    8000a3a6:	4681                	li	a3,0
    8000a3a8:	4611                	li	a2,4
    8000a3aa:	00013597          	auipc	a1,0x13
    8000a3ae:	28658593          	add	a1,a1,646 # 8001d630 <OSTmrTaskTCB>
    8000a3b2:	00013517          	auipc	a0,0x13
    8000a3b6:	22650513          	add	a0,a0,550 # 8001d5d8 <OSTmrMutex>
    8000a3ba:	b24fb0ef          	jal	800056de <OS_Pend>
    8000a3be:	7522                	ld	a0,40(sp)
    8000a3c0:	f5bf60ef          	jal	8000131a <CPU_SR_Restore>
    8000a3c4:	d83fa0ef          	jal	80005146 <OSSched>
    8000a3c8:	0001                	nop
    8000a3ca:	70e2                	ld	ra,56(sp)
    8000a3cc:	6121                	add	sp,sp,64
    8000a3ce:	8082                	ret

000000008000a3d0 <OS_TmrCondSignal>:
    8000a3d0:	7179                	add	sp,sp,-48
    8000a3d2:	f406                	sd	ra,40(sp)
    8000a3d4:	ec02                	sd	zero,24(sp)
    8000a3d6:	f39f60ef          	jal	8000130e <CPU_SR_Save>
    8000a3da:	ec2a                	sd	a0,24(sp)
    8000a3dc:	ca02                	sw	zero,20(sp)
    8000a3de:	00013797          	auipc	a5,0x13
    8000a3e2:	1c278793          	add	a5,a5,450 # 8001d5a0 <OSTmrCond+0x10>
    8000a3e6:	e43e                	sd	a5,8(sp)
    8000a3e8:	67a2                	ld	a5,8(sp)
    8000a3ea:	639c                	ld	a5,0(a5)
    8000a3ec:	e789                	bnez	a5,8000a3f6 <OS_TmrCondSignal+0x26>
    8000a3ee:	6562                	ld	a0,24(sp)
    8000a3f0:	f2bf60ef          	jal	8000131a <CPU_SR_Restore>
    8000a3f4:	a015                	j	8000a418 <OS_TmrCondSignal+0x48>
    8000a3f6:	47d2                	lw	a5,20(sp)
    8000a3f8:	873e                	mv	a4,a5
    8000a3fa:	4681                	li	a3,0
    8000a3fc:	4601                	li	a2,0
    8000a3fe:	00013597          	auipc	a1,0x13
    8000a402:	23258593          	add	a1,a1,562 # 8001d630 <OSTmrTaskTCB>
    8000a406:	00013517          	auipc	a0,0x13
    8000a40a:	18a50513          	add	a0,a0,394 # 8001d590 <OSTmrCond>
    8000a40e:	e80fb0ef          	jal	80005a8e <OS_Post>
    8000a412:	6562                	ld	a0,24(sp)
    8000a414:	f07f60ef          	jal	8000131a <CPU_SR_Restore>
    8000a418:	70a2                	ld	ra,40(sp)
    8000a41a:	6145                	add	sp,sp,48
    8000a41c:	8082                	ret

000000008000a41e <App_OS_SetAllHooks>:
    8000a41e:	1101                	add	sp,sp,-32
    8000a420:	ec06                	sd	ra,24(sp)
    8000a422:	e402                	sd	zero,8(sp)
    8000a424:	eebf60ef          	jal	8000130e <CPU_SR_Save>
    8000a428:	e42a                	sd	a0,8(sp)
    8000a42a:	00001797          	auipc	a5,0x1
    8000a42e:	4be78793          	add	a5,a5,1214 # 8000b8e8 <OS_AppIdleTaskHookPtr>
    8000a432:	00000717          	auipc	a4,0x0
    8000a436:	0f270713          	add	a4,a4,242 # 8000a524 <App_OS_IdleTaskHook>
    8000a43a:	e398                	sd	a4,0(a5)
    8000a43c:	00001797          	auipc	a5,0x1
    8000a440:	4b478793          	add	a5,a5,1204 # 8000b8f0 <OS_AppStatTaskHookPtr>
    8000a444:	00000717          	auipc	a4,0x0
    8000a448:	0e470713          	add	a4,a4,228 # 8000a528 <App_OS_StatTaskHook>
    8000a44c:	e398                	sd	a4,0(a5)
    8000a44e:	00001797          	auipc	a5,0x1
    8000a452:	48278793          	add	a5,a5,1154 # 8000b8d0 <OS_AppTaskCreateHookPtr>
    8000a456:	00000717          	auipc	a4,0x0
    8000a45a:	0d670713          	add	a4,a4,214 # 8000a52c <App_OS_TaskCreateHook>
    8000a45e:	e398                	sd	a4,0(a5)
    8000a460:	00001797          	auipc	a5,0x1
    8000a464:	47878793          	add	a5,a5,1144 # 8000b8d8 <OS_AppTaskDelHookPtr>
    8000a468:	00000717          	auipc	a4,0x0
    8000a46c:	0ce70713          	add	a4,a4,206 # 8000a536 <App_OS_TaskDelHook>
    8000a470:	e398                	sd	a4,0(a5)
    8000a472:	00001797          	auipc	a5,0x1
    8000a476:	46e78793          	add	a5,a5,1134 # 8000b8e0 <OS_AppTaskReturnHookPtr>
    8000a47a:	00000717          	auipc	a4,0x0
    8000a47e:	0c670713          	add	a4,a4,198 # 8000a540 <App_OS_TaskReturnHook>
    8000a482:	e398                	sd	a4,0(a5)
    8000a484:	00001797          	auipc	a5,0x1
    8000a488:	47478793          	add	a5,a5,1140 # 8000b8f8 <OS_AppTaskSwHookPtr>
    8000a48c:	00000717          	auipc	a4,0x0
    8000a490:	0be70713          	add	a4,a4,190 # 8000a54a <App_OS_TaskSwHook>
    8000a494:	e398                	sd	a4,0(a5)
    8000a496:	00001797          	auipc	a5,0x1
    8000a49a:	46a78793          	add	a5,a5,1130 # 8000b900 <OS_AppTimeTickHookPtr>
    8000a49e:	00000717          	auipc	a4,0x0
    8000a4a2:	0b070713          	add	a4,a4,176 # 8000a54e <App_OS_TimeTickHook>
    8000a4a6:	e398                	sd	a4,0(a5)
    8000a4a8:	6522                	ld	a0,8(sp)
    8000a4aa:	e71f60ef          	jal	8000131a <CPU_SR_Restore>
    8000a4ae:	0001                	nop
    8000a4b0:	60e2                	ld	ra,24(sp)
    8000a4b2:	6105                	add	sp,sp,32
    8000a4b4:	8082                	ret

000000008000a4b6 <App_OS_ClrAllHooks>:
    8000a4b6:	1101                	add	sp,sp,-32
    8000a4b8:	ec06                	sd	ra,24(sp)
    8000a4ba:	e402                	sd	zero,8(sp)
    8000a4bc:	e53f60ef          	jal	8000130e <CPU_SR_Save>
    8000a4c0:	e42a                	sd	a0,8(sp)
    8000a4c2:	00001797          	auipc	a5,0x1
    8000a4c6:	42678793          	add	a5,a5,1062 # 8000b8e8 <OS_AppIdleTaskHookPtr>
    8000a4ca:	0007b023          	sd	zero,0(a5)
    8000a4ce:	00001797          	auipc	a5,0x1
    8000a4d2:	42278793          	add	a5,a5,1058 # 8000b8f0 <OS_AppStatTaskHookPtr>
    8000a4d6:	0007b023          	sd	zero,0(a5)
    8000a4da:	00001797          	auipc	a5,0x1
    8000a4de:	3f678793          	add	a5,a5,1014 # 8000b8d0 <OS_AppTaskCreateHookPtr>
    8000a4e2:	0007b023          	sd	zero,0(a5)
    8000a4e6:	00001797          	auipc	a5,0x1
    8000a4ea:	3f278793          	add	a5,a5,1010 # 8000b8d8 <OS_AppTaskDelHookPtr>
    8000a4ee:	0007b023          	sd	zero,0(a5)
    8000a4f2:	00001797          	auipc	a5,0x1
    8000a4f6:	3ee78793          	add	a5,a5,1006 # 8000b8e0 <OS_AppTaskReturnHookPtr>
    8000a4fa:	0007b023          	sd	zero,0(a5)
    8000a4fe:	00001797          	auipc	a5,0x1
    8000a502:	3fa78793          	add	a5,a5,1018 # 8000b8f8 <OS_AppTaskSwHookPtr>
    8000a506:	0007b023          	sd	zero,0(a5)
    8000a50a:	00001797          	auipc	a5,0x1
    8000a50e:	3f678793          	add	a5,a5,1014 # 8000b900 <OS_AppTimeTickHookPtr>
    8000a512:	0007b023          	sd	zero,0(a5)
    8000a516:	6522                	ld	a0,8(sp)
    8000a518:	e03f60ef          	jal	8000131a <CPU_SR_Restore>
    8000a51c:	0001                	nop
    8000a51e:	60e2                	ld	ra,24(sp)
    8000a520:	6105                	add	sp,sp,32
    8000a522:	8082                	ret

000000008000a524 <App_OS_IdleTaskHook>:
    8000a524:	0001                	nop
    8000a526:	8082                	ret

000000008000a528 <App_OS_StatTaskHook>:
    8000a528:	0001                	nop
    8000a52a:	8082                	ret

000000008000a52c <App_OS_TaskCreateHook>:
    8000a52c:	1141                	add	sp,sp,-16
    8000a52e:	e42a                	sd	a0,8(sp)
    8000a530:	0001                	nop
    8000a532:	0141                	add	sp,sp,16
    8000a534:	8082                	ret

000000008000a536 <App_OS_TaskDelHook>:
    8000a536:	1141                	add	sp,sp,-16
    8000a538:	e42a                	sd	a0,8(sp)
    8000a53a:	0001                	nop
    8000a53c:	0141                	add	sp,sp,16
    8000a53e:	8082                	ret

000000008000a540 <App_OS_TaskReturnHook>:
    8000a540:	1141                	add	sp,sp,-16
    8000a542:	e42a                	sd	a0,8(sp)
    8000a544:	0001                	nop
    8000a546:	0141                	add	sp,sp,16
    8000a548:	8082                	ret

000000008000a54a <App_OS_TaskSwHook>:
    8000a54a:	0001                	nop
    8000a54c:	8082                	ret

000000008000a54e <App_OS_TimeTickHook>:
    8000a54e:	0001                	nop
    8000a550:	8082                	ret

000000008000a552 <main>:
    8000a552:	715d                	add	sp,sp,-80
    8000a554:	e486                	sd	ra,72(sp)
    8000a556:	dcbf60ef          	jal	80001320 <CPU_Init>
    8000a55a:	187c                	add	a5,sp,60
    8000a55c:	853e                	mv	a0,a5
    8000a55e:	85dfa0ef          	jal	80004dba <OSInit>
    8000a562:	57f2                	lw	a5,60(sp)
    8000a564:	c799                	beqz	a5,8000a572 <main+0x20>
    8000a566:	00001517          	auipc	a0,0x1
    8000a56a:	1ca50513          	add	a0,a0,458 # 8000b730 <OSDbg_Tmr+0xf8>
    8000a56e:	969f60ef          	jal	80000ed6 <panic>
    8000a572:	187c                	add	a5,sp,60
    8000a574:	f03e                	sd	a5,32(sp)
    8000a576:	478d                	li	a5,3
    8000a578:	ec3e                	sd	a5,24(sp)
    8000a57a:	e802                	sd	zero,16(sp)
    8000a57c:	4785                	li	a5,1
    8000a57e:	e43e                	sd	a5,8(sp)
    8000a580:	e002                	sd	zero,0(sp)
    8000a582:	6885                	lui	a7,0x1
    8000a584:	19900813          	li	a6,409
    8000a588:	00013797          	auipc	a5,0x13
    8000a58c:	1d878793          	add	a5,a5,472 # 8001d760 <init_stk>
    8000a590:	4709                	li	a4,2
    8000a592:	4681                	li	a3,0
    8000a594:	00000617          	auipc	a2,0x0
    8000a598:	1d060613          	add	a2,a2,464 # 8000a764 <Init>
    8000a59c:	00001597          	auipc	a1,0x1
    8000a5a0:	1ac58593          	add	a1,a1,428 # 8000b748 <OSDbg_Tmr+0x110>
    8000a5a4:	0001b517          	auipc	a0,0x1b
    8000a5a8:	1bc50513          	add	a0,a0,444 # 80025760 <init_tcb>
    8000a5ac:	fb9f80ef          	jal	80003564 <OSTaskCreate>
    8000a5b0:	57f2                	lw	a5,60(sp)
    8000a5b2:	c799                	beqz	a5,8000a5c0 <main+0x6e>
    8000a5b4:	00001517          	auipc	a0,0x1
    8000a5b8:	19c50513          	add	a0,a0,412 # 8000b750 <OSDbg_Tmr+0x118>
    8000a5bc:	91bf60ef          	jal	80000ed6 <panic>
    8000a5c0:	187c                	add	a5,sp,60
    8000a5c2:	853e                	mv	a0,a5
    8000a5c4:	f31fa0ef          	jal	800054f4 <OSStart>
    8000a5c8:	00001517          	auipc	a0,0x1
    8000a5cc:	1a850513          	add	a0,a0,424 # 8000b770 <OSDbg_Tmr+0x138>
    8000a5d0:	907f60ef          	jal	80000ed6 <panic>
    8000a5d4:	4781                	li	a5,0
    8000a5d6:	853e                	mv	a0,a5
    8000a5d8:	60a6                	ld	ra,72(sp)
    8000a5da:	6161                	add	sp,sp,80
    8000a5dc:	8082                	ret

000000008000a5de <PRT_ClkGetCycleCount64>:
    8000a5de:	0200c7b7          	lui	a5,0x200c
    8000a5e2:	17e1                	add	a5,a5,-8 # 200bff8 <CPU_MSTATUS_MIE+0x200bff0>
    8000a5e4:	639c                	ld	a5,0(a5)
    8000a5e6:	853e                	mv	a0,a5
    8000a5e8:	8082                	ret

000000008000a5ea <benchmark_timer_initialize>:
    8000a5ea:	1141                	add	sp,sp,-16
    8000a5ec:	e406                	sd	ra,8(sp)
    8000a5ee:	ff1ff0ef          	jal	8000a5de <PRT_ClkGetCycleCount64>
    8000a5f2:	872a                	mv	a4,a0
    8000a5f4:	00001797          	auipc	a5,0x1
    8000a5f8:	3e478793          	add	a5,a5,996 # 8000b9d8 <g_cycle>
    8000a5fc:	e398                	sd	a4,0(a5)
    8000a5fe:	0001                	nop
    8000a600:	60a2                	ld	ra,8(sp)
    8000a602:	0141                	add	sp,sp,16
    8000a604:	8082                	ret

000000008000a606 <benchmark_timer_read>:
    8000a606:	1101                	add	sp,sp,-32
    8000a608:	ec06                	sd	ra,24(sp)
    8000a60a:	fd5ff0ef          	jal	8000a5de <PRT_ClkGetCycleCount64>
    8000a60e:	e42a                	sd	a0,8(sp)
    8000a610:	00001797          	auipc	a5,0x1
    8000a614:	3c878793          	add	a5,a5,968 # 8000b9d8 <g_cycle>
    8000a618:	639c                	ld	a5,0(a5)
    8000a61a:	6722                	ld	a4,8(sp)
    8000a61c:	40f707b3          	sub	a5,a4,a5
    8000a620:	853e                	mv	a0,a5
    8000a622:	60e2                	ld	ra,24(sp)
    8000a624:	6105                	add	sp,sp,32
    8000a626:	8082                	ret

000000008000a628 <Task02>:
    8000a628:	715d                	add	sp,sp,-80
    8000a62a:	e486                	sd	ra,72(sp)
    8000a62c:	ec2a                	sd	a0,24(sp)
    8000a62e:	e82e                	sd	a1,16(sp)
    8000a630:	e432                	sd	a2,8(sp)
    8000a632:	e036                	sd	a3,0(sp)
    8000a634:	fb7ff0ef          	jal	8000a5ea <benchmark_timer_initialize>
    8000a638:	00001797          	auipc	a5,0x1
    8000a63c:	3c078793          	add	a5,a5,960 # 8000b9f8 <count1>
    8000a640:	0007a023          	sw	zero,0(a5)
    8000a644:	a015                	j	8000a668 <Task02+0x40>
    8000a646:	107c                	add	a5,sp,44
    8000a648:	853e                	mv	a0,a5
    8000a64a:	dbffa0ef          	jal	80005408 <OSSchedRoundRobinYield>
    8000a64e:	00001797          	auipc	a5,0x1
    8000a652:	3aa78793          	add	a5,a5,938 # 8000b9f8 <count1>
    8000a656:	439c                	lw	a5,0(a5)
    8000a658:	2785                	addw	a5,a5,1
    8000a65a:	0007871b          	sext.w	a4,a5
    8000a65e:	00001797          	auipc	a5,0x1
    8000a662:	39a78793          	add	a5,a5,922 # 8000b9f8 <count1>
    8000a666:	c398                	sw	a4,0(a5)
    8000a668:	00001797          	auipc	a5,0x1
    8000a66c:	39078793          	add	a5,a5,912 # 8000b9f8 <count1>
    8000a670:	439c                	lw	a5,0(a5)
    8000a672:	873e                	mv	a4,a5
    8000a674:	67b1                	lui	a5,0xc
    8000a676:	34e78793          	add	a5,a5,846 # c34e <CPU_MSTATUS_MIE+0xc346>
    8000a67a:	fce7f6e3          	bgeu	a5,a4,8000a646 <Task02+0x1e>
    8000a67e:	f89ff0ef          	jal	8000a606 <benchmark_timer_read>
    8000a682:	fc2a                	sd	a0,56(sp)
    8000a684:	75e2                	ld	a1,56(sp)
    8000a686:	00001517          	auipc	a0,0x1
    8000a68a:	10a50513          	add	a0,a0,266 # 8000b790 <OSDbg_Tmr+0x158>
    8000a68e:	ee7f50ef          	jal	80000574 <printf>
    8000a692:	00001797          	auipc	a5,0x1
    8000a696:	35678793          	add	a5,a5,854 # 8000b9e8 <loopCycle>
    8000a69a:	639c                	ld	a5,0(a5)
    8000a69c:	85be                	mv	a1,a5
    8000a69e:	00001517          	auipc	a0,0x1
    8000a6a2:	11a50513          	add	a0,a0,282 # 8000b7b8 <OSDbg_Tmr+0x180>
    8000a6a6:	ecff50ef          	jal	80000574 <printf>
    8000a6aa:	00001797          	auipc	a5,0x1
    8000a6ae:	33e78793          	add	a5,a5,830 # 8000b9e8 <loopCycle>
    8000a6b2:	639c                	ld	a5,0(a5)
    8000a6b4:	7762                	ld	a4,56(sp)
    8000a6b6:	8f1d                	sub	a4,a4,a5
    8000a6b8:	67e1                	lui	a5,0x18
    8000a6ba:	69f78793          	add	a5,a5,1695 # 1869f <CPU_MSTATUS_MIE+0x18697>
    8000a6be:	02f75733          	divu	a4,a4,a5
    8000a6c2:	00001797          	auipc	a5,0x1
    8000a6c6:	32e78793          	add	a5,a5,814 # 8000b9f0 <dirOverhead>
    8000a6ca:	639c                	ld	a5,0(a5)
    8000a6cc:	40f707b3          	sub	a5,a4,a5
    8000a6d0:	f83e                	sd	a5,48(sp)
    8000a6d2:	75c2                	ld	a1,48(sp)
    8000a6d4:	00001517          	auipc	a0,0x1
    8000a6d8:	10c50513          	add	a0,a0,268 # 8000b7e0 <OSDbg_Tmr+0x1a8>
    8000a6dc:	e99f50ef          	jal	80000574 <printf>
    8000a6e0:	7742                	ld	a4,48(sp)
    8000a6e2:	47a9                	li	a5,10
    8000a6e4:	02f757b3          	divu	a5,a4,a5
    8000a6e8:	85be                	mv	a1,a5
    8000a6ea:	00001517          	auipc	a0,0x1
    8000a6ee:	11e50513          	add	a0,a0,286 # 8000b808 <OSDbg_Tmr+0x1d0>
    8000a6f2:	e83f50ef          	jal	80000574 <printf>
    8000a6f6:	10500073          	wfi
    8000a6fa:	bff5                	j	8000a6f6 <Task02+0xce>

000000008000a6fc <Task01>:
    8000a6fc:	7179                	add	sp,sp,-48
    8000a6fe:	f406                	sd	ra,40(sp)
    8000a700:	e42a                	sd	a0,8(sp)
    8000a702:	087c                	add	a5,sp,28
    8000a704:	853e                	mv	a0,a5
    8000a706:	d03fa0ef          	jal	80005408 <OSSchedRoundRobinYield>
    8000a70a:	00001797          	auipc	a5,0x1
    8000a70e:	2f278793          	add	a5,a5,754 # 8000b9fc <count2>
    8000a712:	0007a023          	sw	zero,0(a5)
    8000a716:	a015                	j	8000a73a <Task01+0x3e>
    8000a718:	087c                	add	a5,sp,28
    8000a71a:	853e                	mv	a0,a5
    8000a71c:	cedfa0ef          	jal	80005408 <OSSchedRoundRobinYield>
    8000a720:	00001797          	auipc	a5,0x1
    8000a724:	2dc78793          	add	a5,a5,732 # 8000b9fc <count2>
    8000a728:	439c                	lw	a5,0(a5)
    8000a72a:	2785                	addw	a5,a5,1
    8000a72c:	0007871b          	sext.w	a4,a5
    8000a730:	00001797          	auipc	a5,0x1
    8000a734:	2cc78793          	add	a5,a5,716 # 8000b9fc <count2>
    8000a738:	c398                	sw	a4,0(a5)
    8000a73a:	00001797          	auipc	a5,0x1
    8000a73e:	2c278793          	add	a5,a5,706 # 8000b9fc <count2>
    8000a742:	439c                	lw	a5,0(a5)
    8000a744:	873e                	mv	a4,a5
    8000a746:	67b1                	lui	a5,0xc
    8000a748:	34f78793          	add	a5,a5,847 # c34f <CPU_MSTATUS_MIE+0xc347>
    8000a74c:	fce7f6e3          	bgeu	a5,a4,8000a718 <Task01+0x1c>
    8000a750:	00001517          	auipc	a0,0x1
    8000a754:	0e050513          	add	a0,a0,224 # 8000b830 <OSDbg_Tmr+0x1f8>
    8000a758:	f7ef60ef          	jal	80000ed6 <panic>
    8000a75c:	0001                	nop
    8000a75e:	70a2                	ld	ra,40(sp)
    8000a760:	6145                	add	sp,sp,48
    8000a762:	8082                	ret

000000008000a764 <Init>:
    8000a764:	711d                	add	sp,sp,-96
    8000a766:	ec86                	sd	ra,88(sp)
    8000a768:	fc2a                	sd	a0,56(sp)
    8000a76a:	00bc                	add	a5,sp,72
    8000a76c:	f03e                	sd	a5,32(sp)
    8000a76e:	478d                	li	a5,3
    8000a770:	ec3e                	sd	a5,24(sp)
    8000a772:	e802                	sd	zero,16(sp)
    8000a774:	67e1                	lui	a5,0x18
    8000a776:	6a078793          	add	a5,a5,1696 # 186a0 <CPU_MSTATUS_MIE+0x18698>
    8000a77a:	e43e                	sd	a5,8(sp)
    8000a77c:	e002                	sd	zero,0(sp)
    8000a77e:	6885                	lui	a7,0x1
    8000a780:	19900813          	li	a6,409
    8000a784:	0001b797          	auipc	a5,0x1b
    8000a788:	36c78793          	add	a5,a5,876 # 80025af0 <taskStk_1>
    8000a78c:	4711                	li	a4,4
    8000a78e:	4681                	li	a3,0
    8000a790:	00000617          	auipc	a2,0x0
    8000a794:	f6c60613          	add	a2,a2,-148 # 8000a6fc <Task01>
    8000a798:	00001597          	auipc	a1,0x1
    8000a79c:	0a058593          	add	a1,a1,160 # 8000b838 <OSDbg_Tmr+0x200>
    8000a7a0:	0001b517          	auipc	a0,0x1b
    8000a7a4:	0f050513          	add	a0,a0,240 # 80025890 <taskIds>
    8000a7a8:	dbdf80ef          	jal	80003564 <OSTaskCreate>
    8000a7ac:	47a6                	lw	a5,72(sp)
    8000a7ae:	c799                	beqz	a5,8000a7bc <Init+0x58>
    8000a7b0:	00001517          	auipc	a0,0x1
    8000a7b4:	09050513          	add	a0,a0,144 # 8000b840 <OSDbg_Tmr+0x208>
    8000a7b8:	f1ef60ef          	jal	80000ed6 <panic>
    8000a7bc:	00bc                	add	a5,sp,72
    8000a7be:	f03e                	sd	a5,32(sp)
    8000a7c0:	478d                	li	a5,3
    8000a7c2:	ec3e                	sd	a5,24(sp)
    8000a7c4:	e802                	sd	zero,16(sp)
    8000a7c6:	67e1                	lui	a5,0x18
    8000a7c8:	6a078793          	add	a5,a5,1696 # 186a0 <CPU_MSTATUS_MIE+0x18698>
    8000a7cc:	e43e                	sd	a5,8(sp)
    8000a7ce:	e002                	sd	zero,0(sp)
    8000a7d0:	6885                	lui	a7,0x1
    8000a7d2:	19900813          	li	a6,409
    8000a7d6:	00023797          	auipc	a5,0x23
    8000a7da:	31a78793          	add	a5,a5,794 # 8002daf0 <taskStk_2>
    8000a7de:	4711                	li	a4,4
    8000a7e0:	4681                	li	a3,0
    8000a7e2:	00000617          	auipc	a2,0x0
    8000a7e6:	e4660613          	add	a2,a2,-442 # 8000a628 <Task02>
    8000a7ea:	00001597          	auipc	a1,0x1
    8000a7ee:	06e58593          	add	a1,a1,110 # 8000b858 <OSDbg_Tmr+0x220>
    8000a7f2:	0001b517          	auipc	a0,0x1b
    8000a7f6:	1ce50513          	add	a0,a0,462 # 800259c0 <taskIds+0x130>
    8000a7fa:	d6bf80ef          	jal	80003564 <OSTaskCreate>
    8000a7fe:	47a6                	lw	a5,72(sp)
    8000a800:	c799                	beqz	a5,8000a80e <Init+0xaa>
    8000a802:	00001517          	auipc	a0,0x1
    8000a806:	05e50513          	add	a0,a0,94 # 8000b860 <OSDbg_Tmr+0x228>
    8000a80a:	eccf60ef          	jal	80000ed6 <panic>
    8000a80e:	dddff0ef          	jal	8000a5ea <benchmark_timer_initialize>
    8000a812:	00001797          	auipc	a5,0x1
    8000a816:	1e678793          	add	a5,a5,486 # 8000b9f8 <count1>
    8000a81a:	0007a023          	sw	zero,0(a5)
    8000a81e:	a831                	j	8000a83a <Init+0xd6>
    8000a820:	00001797          	auipc	a5,0x1
    8000a824:	1d878793          	add	a5,a5,472 # 8000b9f8 <count1>
    8000a828:	439c                	lw	a5,0(a5)
    8000a82a:	2785                	addw	a5,a5,1
    8000a82c:	0007871b          	sext.w	a4,a5
    8000a830:	00001797          	auipc	a5,0x1
    8000a834:	1c878793          	add	a5,a5,456 # 8000b9f8 <count1>
    8000a838:	c398                	sw	a4,0(a5)
    8000a83a:	00001797          	auipc	a5,0x1
    8000a83e:	1be78793          	add	a5,a5,446 # 8000b9f8 <count1>
    8000a842:	439c                	lw	a5,0(a5)
    8000a844:	873e                	mv	a4,a5
    8000a846:	67b1                	lui	a5,0xc
    8000a848:	34e78793          	add	a5,a5,846 # c34e <CPU_MSTATUS_MIE+0xc346>
    8000a84c:	fce7fae3          	bgeu	a5,a4,8000a820 <Init+0xbc>
    8000a850:	00001797          	auipc	a5,0x1
    8000a854:	1ac78793          	add	a5,a5,428 # 8000b9fc <count2>
    8000a858:	0007a023          	sw	zero,0(a5)
    8000a85c:	a831                	j	8000a878 <Init+0x114>
    8000a85e:	00001797          	auipc	a5,0x1
    8000a862:	19e78793          	add	a5,a5,414 # 8000b9fc <count2>
    8000a866:	439c                	lw	a5,0(a5)
    8000a868:	2785                	addw	a5,a5,1
    8000a86a:	0007871b          	sext.w	a4,a5
    8000a86e:	00001797          	auipc	a5,0x1
    8000a872:	18e78793          	add	a5,a5,398 # 8000b9fc <count2>
    8000a876:	c398                	sw	a4,0(a5)
    8000a878:	00001797          	auipc	a5,0x1
    8000a87c:	18478793          	add	a5,a5,388 # 8000b9fc <count2>
    8000a880:	439c                	lw	a5,0(a5)
    8000a882:	873e                	mv	a4,a5
    8000a884:	67b1                	lui	a5,0xc
    8000a886:	34f78793          	add	a5,a5,847 # c34f <CPU_MSTATUS_MIE+0xc347>
    8000a88a:	fce7fae3          	bgeu	a5,a4,8000a85e <Init+0xfa>
    8000a88e:	d79ff0ef          	jal	8000a606 <benchmark_timer_read>
    8000a892:	872a                	mv	a4,a0
    8000a894:	00001797          	auipc	a5,0x1
    8000a898:	15478793          	add	a5,a5,340 # 8000b9e8 <loopCycle>
    8000a89c:	e398                	sd	a4,0(a5)
    8000a89e:	00bc                	add	a5,sp,72
    8000a8a0:	853e                	mv	a0,a5
    8000a8a2:	b67fa0ef          	jal	80005408 <OSSchedRoundRobinYield>
    8000a8a6:	47a6                	lw	a5,72(sp)
    8000a8a8:	873e                	mv	a4,a5
    8000a8aa:	679d                	lui	a5,0x7
    8000a8ac:	97a78793          	add	a5,a5,-1670 # 697a <CPU_MSTATUS_MIE+0x6972>
    8000a8b0:	00f70863          	beq	a4,a5,8000a8c0 <Init+0x15c>
    8000a8b4:	00001517          	auipc	a0,0x1
    8000a8b8:	fc450513          	add	a0,a0,-60 # 8000b878 <OSDbg_Tmr+0x240>
    8000a8bc:	e1af60ef          	jal	80000ed6 <panic>
    8000a8c0:	c682                	sw	zero,76(sp)
    8000a8c2:	a805                	j	8000a8f2 <Init+0x18e>
    8000a8c4:	d27ff0ef          	jal	8000a5ea <benchmark_timer_initialize>
    8000a8c8:	00bc                	add	a5,sp,72
    8000a8ca:	853e                	mv	a0,a5
    8000a8cc:	b3dfa0ef          	jal	80005408 <OSSchedRoundRobinYield>
    8000a8d0:	d37ff0ef          	jal	8000a606 <benchmark_timer_read>
    8000a8d4:	872a                	mv	a4,a0
    8000a8d6:	00001797          	auipc	a5,0x1
    8000a8da:	11a78793          	add	a5,a5,282 # 8000b9f0 <dirOverhead>
    8000a8de:	639c                	ld	a5,0(a5)
    8000a8e0:	973e                	add	a4,a4,a5
    8000a8e2:	00001797          	auipc	a5,0x1
    8000a8e6:	10e78793          	add	a5,a5,270 # 8000b9f0 <dirOverhead>
    8000a8ea:	e398                	sd	a4,0(a5)
    8000a8ec:	47b6                	lw	a5,76(sp)
    8000a8ee:	2785                	addw	a5,a5,1
    8000a8f0:	c6be                	sw	a5,76(sp)
    8000a8f2:	47b6                	lw	a5,76(sp)
    8000a8f4:	0007871b          	sext.w	a4,a5
    8000a8f8:	1f300793          	li	a5,499
    8000a8fc:	fce7d4e3          	bge	a5,a4,8000a8c4 <Init+0x160>
    8000a900:	00001797          	auipc	a5,0x1
    8000a904:	0f078793          	add	a5,a5,240 # 8000b9f0 <dirOverhead>
    8000a908:	6398                	ld	a4,0(a5)
    8000a90a:	1f400793          	li	a5,500
    8000a90e:	02f75733          	divu	a4,a4,a5
    8000a912:	00001797          	auipc	a5,0x1
    8000a916:	0de78793          	add	a5,a5,222 # 8000b9f0 <dirOverhead>
    8000a91a:	e398                	sd	a4,0(a5)
    8000a91c:	00001517          	auipc	a0,0x1
    8000a920:	f6c50513          	add	a0,a0,-148 # 8000b888 <OSDbg_Tmr+0x250>
    8000a924:	c51f50ef          	jal	80000574 <printf>
    8000a928:	00bc                	add	a5,sp,72
    8000a92a:	85be                	mv	a1,a5
    8000a92c:	4501                	li	a0,0
    8000a92e:	ec9f80ef          	jal	800037f6 <OSTaskDel>
    8000a932:	00001517          	auipc	a0,0x1
    8000a936:	f6e50513          	add	a0,a0,-146 # 8000b8a0 <OSDbg_Tmr+0x268>
    8000a93a:	c3bf50ef          	jal	80000574 <printf>
    8000a93e:	00001517          	auipc	a0,0x1
    8000a942:	f8250513          	add	a0,a0,-126 # 8000b8c0 <OSDbg_Tmr+0x288>
    8000a946:	d90f60ef          	jal	80000ed6 <panic>
    8000a94a:	0001                	nop
    8000a94c:	60e6                	ld	ra,88(sp)
    8000a94e:	6125                	add	sp,sp,96
    8000a950:	8082                	ret
	...
