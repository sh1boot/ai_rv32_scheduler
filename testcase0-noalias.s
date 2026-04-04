# ../rv32/homebrew-qemu:     file format elf32-littleriscv



# Disassembly of section .text:

	.globl _start
_start:
	c.mv	s0,a0
	c.mv	s1,a1

.Lpcrel_hi0:
	auipc	sp,0x38
	addi	sp,sp,-4	# __stack_top
	lui	t1,0x10000
	addi	t2,zero,65
	sb	t2,0(t1)	# .Lline_table_start1+0xffb3eab

.Lpcrel_hi1:
	auipc	t0,0x22
	addi	t0,t0,-24	# _ZN13homebrew_qemu9rust_main10LAST_FRAME17heeea9d8509e68fa4E.0

.Lpcrel_hi2:
	auipc	t1,0x27
	addi	t1,t1,1760	# __bss_end

	.globl clear_bss
clear_bss:
	bgeu	t0,t1, bss_done
	sw	zero,0(t0)
	c.addi	t0,4
	c.j	 clear_bss

	.globl bss_done
bss_done:
	lui	t1,0x10000
	addi	t2,zero,66
	sb	t2,0(t1)	# .Lline_table_start1+0xffb3eab
	c.mv	a0,s0
	c.mv	a1,s1
	auipc	ra,0x0
	jalr	ra,376(ra)	# rust_main

	.globl halt
halt:
	wfi
	c.j	 halt
	# ... (zero-filled gap)

	.globl _RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind
_RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16

.Lbranch_8000005c:
	wfi
	c.j	 .Lbranch_8000005c
	# ... (zero-filled gap)

	.globl _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E
_ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a1,0x10000

.Lbranch_80000070:
	lbu	a2,5(a1)	# .Lline_table_start1+0xffb3eb0
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000070
	srli	a3,a0,0x1d
	c.li	a4,5
	srli	a2,a0,0x1c
	bltu	a3,a4, .Lbranch_8000008e
	addi	a2,a2,55
	c.j	 .Lbranch_80000092

.Lbranch_8000008e:
	addi	a2,a2,48

.Lbranch_80000092:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000009a:
	lbu	a2,5(a1)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_8000009a
	slli	a2,a0,0x4
	c.srli	a2,0x1c
	c.li	a3,10
	bltu	a2,a3, .Lbranch_800000b6
	addi	a2,a2,55
	c.j	 .Lbranch_800000ba

.Lbranch_800000b6:
	addi	a2,a2,48

.Lbranch_800000ba:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_800000c2:
	lbu	a2,5(a1)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_800000c2
	slli	a2,a0,0x8
	c.srli	a2,0x1c
	c.li	a3,10
	bltu	a2,a3, .Lbranch_800000de
	addi	a2,a2,55
	c.j	 .Lbranch_800000e2

.Lbranch_800000de:
	addi	a2,a2,48

.Lbranch_800000e2:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_800000ea:
	lbu	a2,5(a1)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_800000ea
	slli	a2,a0,0xc
	c.srli	a2,0x1c
	c.li	a3,10
	bltu	a2,a3, .Lbranch_80000106
	addi	a2,a2,55
	c.j	 .Lbranch_8000010a

.Lbranch_80000106:
	addi	a2,a2,48

.Lbranch_8000010a:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000112:
	lbu	a2,5(a1)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000112
	slli	a2,a0,0x10
	c.srli	a2,0x1c
	c.li	a3,10
	bltu	a2,a3, .Lbranch_8000012e
	addi	a2,a2,55
	c.j	 .Lbranch_80000132

.Lbranch_8000012e:
	addi	a2,a2,48

.Lbranch_80000132:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000013a:
	lbu	a2,5(a1)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_8000013a
	slli	a2,a0,0x14
	c.srli	a2,0x1c
	c.li	a3,10
	bltu	a2,a3, .Lbranch_80000156
	addi	a2,a2,55
	c.j	 .Lbranch_8000015a

.Lbranch_80000156:
	addi	a2,a2,48

.Lbranch_8000015a:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000162:
	lbu	a2,5(a1)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000162
	andi	a0,a0,255
	addi	a3,zero,160
	srli	a2,a0,0x4
	bltu	a0,a3, .Lbranch_80000182
	addi	a2,a2,55
	c.j	 .Lbranch_80000186

.Lbranch_80000182:
	addi	a2,a2,48

.Lbranch_80000186:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000018e:
	lbu	a2,5(a1)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_8000018e
	c.andi	a0,15
	c.li	a1,10
	bltu	a0,a1, .Lbranch_800001a6
	addi	a0,a0,55
	c.j	 .Lbranch_800001aa

.Lbranch_800001a6:
	addi	a0,a0,48

.Lbranch_800001aa:
	lui	a1,0x10000
	sb	a0,0(a1)	# .Lline_table_start1+0xffb3eab
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra
	# ... (zero-filled gap)

	.globl rust_main
rust_main:
	c.addi16sp	sp,-128
	c.swsp	ra,124(sp)
	c.swsp	s0,120(sp)
	c.swsp	s1,116(sp)
	c.swsp	s2,112(sp)
	c.swsp	s3,108(sp)
	c.swsp	s4,104(sp)
	c.swsp	s5,100(sp)
	c.swsp	s6,96(sp)
	c.swsp	s7,92(sp)
	c.swsp	s8,88(sp)
	c.swsp	s9,84(sp)
	c.swsp	s10,80(sp)
	c.swsp	s11,76(sp)
	c.addi4spn	s0,sp,128
	c.mv	s1,a1
	c.mv	s2,a0
	.insn	4, 0x30401073
	c.li	a0,8
	.insn	4, 0x30053073
	lui	s8,0x10000
	auipc	ra,0x6
	jalr	ra,-576(ra)	# _ZN11homebrew_os4heap9init_heap17h33c877372d05e6f1E
	addi	a0,zero,72
	sb	a0,0(s8)	# .Lline_table_start1+0xffb3eab
	addi	a0,zero,69
	sb	a0,0(s8)
	addi	a0,zero,76
	sb	a0,0(s8)
	sb	a0,0(s8)
	addi	a0,zero,79
	sb	a0,0(s8)
	c.li	a0,10
	sb	a0,0(s8)
	addi	a0,zero,128
	sb	zero,1(s8)
	sb	a0,3(s8)
	c.li	a0,2
	sb	a0,0(s8)
	c.li	a0,3
	sb	zero,1(s8)
	sb	a0,3(s8)
	c.li	a0,1
	sb	a0,2(s8)

.Lbranch_80000240:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000240
	c.li	a0,0
	lui	a1,0x10000
	addi	a3,zero,81
	lui	a2,0x80013
	addi	a2,a2,128	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.27
	sb	a3,0(a1)	# .Lline_table_start1+0xffb3eab
	c.li	a3,23

.Lbranch_80000262:
	add	a4,a2,a0
	lbu	a4,0(a4)

.Lbranch_8000026a:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_8000026a
	c.addi	a0,1
	sb	a4,0(a1)
	bne	a0,a3, .Lbranch_80000262
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,152	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.28
	lui	a2,0x10000
	c.li	a3,24

.Lbranch_8000028e:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80000296:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80000296
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_8000028e
	c.mv	a0,s2
	auipc	ra,0x0
	jalr	ra,-584(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_800002b4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800002b4
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800002ca:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800002ca
	lui	a0,0x10000
	addi	a1,zero,97
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800002e0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800002e0
	lui	a0,0x10000
	addi	a1,zero,49
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800002f6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800002f6
	lui	a0,0x10000
	addi	a1,zero,40
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000030c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000030c
	lui	a0,0x10000
	addi	a1,zero,102
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000322:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000322
	lui	a0,0x10000
	addi	a1,zero,100
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000338:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000338
	lui	a0,0x10000
	addi	a1,zero,116
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000034e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000034e
	lui	a0,0x10000
	addi	a1,zero,41
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000364:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000364
	lui	a0,0x10000
	addi	a1,zero,61
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000037a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000037a
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000390:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000390
	lui	a0,0x10000
	addi	a1,zero,120
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	c.mv	a0,s1
	auipc	ra,0x0
	jalr	ra,-836(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_800003b0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800003b0
	lui	a0,0x10000
	c.li	a1,10
	lui	a2,0x84000
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	bge	s1,a2, .Lbranch_800006fc
	andi	a0,s1,3
	c.beqz	a0, .Lbranch_800003d6
	jal	zero, .Lbranch_800034c4

.Lbranch_800003d6:
	c.lw	s1,0(s1)

.Lbranch_800003d8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800003d8
	lui	a0,0x10000
	addi	a1,zero,70
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800003ee:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800003ee
	lui	a0,0x10000
	addi	a1,zero,68
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000404:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000404
	lui	a0,0x10000
	addi	a1,zero,84
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000041a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000041a
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000430:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000430
	lui	a0,0x10000
	addi	a1,zero,109
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000446:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000446
	lui	a0,0x10000
	addi	a1,zero,97
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000045c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000045c
	lui	a0,0x10000
	addi	a1,zero,103
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000472:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000472
	lui	a0,0x10000
	addi	a1,zero,105
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000488:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000488
	lui	a0,0x10000
	addi	a1,zero,99
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000049e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000049e
	lui	a0,0x10000
	addi	a1,zero,58
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800004b4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800004b4
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800004ca:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800004ca
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800004e0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800004e0
	lui	a0,0x10000
	addi	a1,zero,120
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	c.mv	a0,s1
	auipc	ra,0x0
	jalr	ra,-1172(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E
	lui	a0,0xd00e0
	addi	a0,a0,-275	# __heap_end+0x4fddfeed
	bne	s1,a0, .Lbranch_800005c8

.Lbranch_8000050c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000050c
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000522:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000522
	lui	a0,0x10000
	addi	a1,zero,40
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000538:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000538
	lui	a0,0x10000
	addi	a1,zero,118
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000054e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000054e
	lui	a0,0x10000
	addi	a1,zero,97
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000564:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000564
	lui	a0,0x10000
	addi	a1,zero,108
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000057a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000057a
	lui	a0,0x10000
	addi	a1,zero,105
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000590:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000590
	lui	a0,0x10000
	addi	a1,zero,100
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800005a6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800005a6
	lui	a0,0x10000
	addi	a1,zero,41
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800005bc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800005bc
	c.j	 .Lbranch_800006f0

.Lbranch_800005c8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800005c8
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800005de:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800005de
	lui	a0,0x10000
	addi	a1,zero,40
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800005f4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800005f4
	lui	a0,0x10000
	addi	a1,zero,117
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000060a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000060a
	lui	a0,0x10000
	addi	a1,zero,110
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000620:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000620
	lui	a0,0x10000
	addi	a1,zero,101
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000636:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000636
	lui	a0,0x10000
	addi	a1,zero,120
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000064c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000064c
	lui	a0,0x10000
	addi	a1,zero,112
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000662:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000662
	lui	a0,0x10000
	addi	a1,zero,101
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000678:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000678
	lui	a0,0x10000
	addi	a1,zero,99
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000068e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000068e
	lui	a0,0x10000
	addi	a1,zero,116
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800006a4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800006a4
	lui	a0,0x10000
	addi	a1,zero,101
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800006ba:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800006ba
	lui	a0,0x10000
	addi	a1,zero,100
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800006d0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800006d0
	lui	a0,0x10000
	addi	a1,zero,41
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800006e6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800006e6

.Lbranch_800006f0:
	lui	a0,0x10000
	c.li	a1,10
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	c.j	 .Lbranch_8000072c

.Lbranch_800006fc:
	c.beqz	s1, .Lbranch_8000072c
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-908	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0xac
	lui	a2,0x10000
	addi	a3,zero,32

.Lbranch_80000710:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80000718:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80000718
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80000710

.Lbranch_8000072c:
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,192	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.31
	lui	a2,0x10000
	c.li	a3,27

.Lbranch_8000073c:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80000744:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80000744
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_8000073c

.Lbranch_80000758:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000758
	lui	a0,0x10000
	addi	a1,zero,68
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000076e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000076e
	lui	a0,0x10000
	addi	a1,zero,105
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000784:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000784
	lui	a0,0x10000
	addi	a1,zero,115
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000079a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000079a
	lui	a0,0x10000
	addi	a1,zero,112
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800007b0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800007b0
	lui	a0,0x10000
	addi	a1,zero,108
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800007c6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800007c6
	lui	a0,0x10000
	addi	a1,zero,97
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800007dc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800007dc
	lui	a0,0x10000
	addi	a1,zero,121
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800007f2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800007f2
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000808:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000808
	lui	a0,0x10000
	addi	a1,zero,99
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000081e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000081e
	lui	a0,0x10000
	addi	a1,zero,111
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000834:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000834
	lui	a0,0x10000
	addi	a1,zero,110
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000084a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000084a
	lui	a0,0x10000
	addi	a1,zero,102
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000860:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000860
	lui	a0,0x10000
	addi	a1,zero,105
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000876:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000876
	lui	a0,0x10000
	addi	a1,zero,103
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000088c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000088c
	lui	a0,0x10000
	addi	a1,zero,58
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800008a2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800008a2
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800008b8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800008b8
	lui	a0,0x10000
	addi	a1,zero,81
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800008ce:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800008ce
	lui	a0,0x10000
	addi	a1,zero,69
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800008e4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800008e4
	lui	a0,0x10000
	addi	a1,zero,77
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800008fa:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800008fa
	lui	a0,0x10000
	addi	a1,zero,85
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000910:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000910
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000926:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000926
	lui	a0,0x10000
	addi	a1,zero,49
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000093c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000093c
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000952:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000952
	lui	a0,0x10000
	addi	a1,zero,56
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000968:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000968
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000097e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000097e
	lui	a0,0x10000
	addi	a1,zero,120
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000994:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000994
	lui	a0,0x10000
	addi	a1,zero,55
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800009aa:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800009aa
	lui	a0,0x10000
	addi	a1,zero,50
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800009c0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800009c0
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800009d6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800009d6
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800009ec:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800009ec
	lui	a0,0x10000
	addi	a1,zero,40
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000a02:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000a02
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000a18:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000a18
	lui	a0,0x10000
	addi	a1,zero,52
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000a2e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000a2e
	lui	a0,0x10000
	addi	a1,zero,51
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000a44:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000a44
	lui	a0,0x10000
	addi	a1,zero,56
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000a5a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000a5a
	lui	a0,0x10000
	addi	a1,zero,120
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000a70:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000a70
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000a86:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000a86
	lui	a0,0x10000
	addi	a1,zero,50
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000a9c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000a9c
	lui	a0,0x10000
	addi	a1,zero,68
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000ab2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000ab2
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000ac8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000ac8
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000ade:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000ade
	lui	a0,0x10000
	addi	a1,zero,88
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000af4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000af4
	lui	a0,0x10000
	addi	a1,zero,82
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000b0a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000b0a
	lui	a0,0x10000
	addi	a1,zero,71
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000b20:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000b20
	lui	a0,0x10000
	addi	a1,zero,66
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000b36:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000b36
	lui	a0,0x10000
	addi	a1,zero,56
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000b4c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000b4c
	lui	a0,0x10000
	addi	a1,zero,56
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000b62:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000b62
	lui	a0,0x10000
	addi	a1,zero,56
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000b78:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000b78
	lui	a0,0x10000
	addi	a1,zero,56
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000b8e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000b8e
	lui	a0,0x10000
	addi	a1,zero,41
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000ba4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000ba4
	lui	s1,0x10000
	c.li	a0,10
	sb	a0,0(s1)	# .Lline_table_start1+0xffb3eab
	addi	a0,zero,1080
	addi	a1,zero,720
	auipc	ra,0x6
	jalr	ra,-372(ra)	# _ZN11homebrew_os12virtio_input21set_screen_dimensions17h6a324b5fc5e74e12E
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,220	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.32
	addi	a2,zero,39

.Lbranch_80000bd6:
	add	a3,a1,a0
	lbu	a3,0(a3)

.Lbranch_80000bde:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80000bde
	c.addi	a0,1
	sb	a3,0(s1)
	bne	a0,a2, .Lbranch_80000bd6
	auipc	ra,0x6
	jalr	ra,-1650(ra)	# _ZN11homebrew_os12virtio_input17scan_virtio_input17hd5fae2a7099670aaE
	c.mv	s1,a0
	c.beqz	a0, .Lbranch_80000c7e
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,316	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.34
	lui	a2,0x10000
	addi	a3,zero,63

.Lbranch_80000c10:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80000c18:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80000c18
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80000c10
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,380	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.35
	lui	a2,0x10000
	c.li	a3,23

.Lbranch_80000c3c:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80000c44:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80000c44
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80000c3c
	auipc	ra,0x6
	jalr	ra,-560(ra)	# _ZN11homebrew_os12virtio_input21get_virtio_input_base17h6be0520dd895412cE
	auipc	ra,0xfffff
	jalr	ra,1028(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_80000c68:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80000c68
	lui	a0,0x10000
	c.li	a1,10
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	c.j	 .Lbranch_80000caa

.Lbranch_80000c7e:
	lui	a1,0x80013
	addi	a1,a1,260	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.33
	lui	a2,0x10000
	addi	a3,zero,55

.Lbranch_80000c8e:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80000c96:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80000c96
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80000c8e

.Lbranch_80000caa:
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-1620	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.1
	lui	a2,0x10000
	c.li	a3,30

.Lbranch_80000cba:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80000cc2:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80000cc2
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80000cba
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-1232	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.14
	lui	a2,0x10000
	c.li	a3,20

.Lbranch_80000ce6:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80000cee:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80000cee
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80000ce6
	sw	s1,-112(s0)
	c.li	s1,0
	lui	s11,0x30000
	c.li	a1,10
	addi	t4,zero,32
	c.li	t1,7
	c.lui	s6,0x10
	lui	a4,0x10000
	addi	t0,zero,73
	addi	ra,zero,48
	addi	t2,zero,58
	addi	t3,zero,160
	c.lui	a5,0x1
	c.lui	a2,0x2
	lui	a0,0x80013
	addi	a0,a0,-1180	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.16
	addi	a3,s11,4	# .Lline_table_start1+0x2ffb3eaf
	sw	a3,-108(s0)
	c.addi	s6,-1	# .Lline_table_start0+0x1fa1
	addi	s2,a5,564	# .Lline_table_start0+0x1234
	addi	a2,a2,-1292	# .Lline_table_start0+0x1af4
	sw	a2,-100(s0)
	addi	t6,zero,39
	c.li	a5,5
	c.j	 .Lbranch_80000d5e

.Lbranch_80000d54:
	lw	a2,-104(s0)
	c.mv	s1,a2
	beq	a2,t4, .Lbranch_8000164c

.Lbranch_80000d5e:
	andi	a2,s1,15
	bltu	a2,a1, .Lbranch_80000d6c
	addi	s3,a2,55
	c.j	 .Lbranch_80000d70

.Lbranch_80000d6c:
	ori	s3,s1,48

.Lbranch_80000d70:
	c.li	a3,0
	addi	a2,s1,1
	sw	a2,-104(s0)
	slli	s5,s1,0xf
	c.srli	s1,0x4
	addi	s7,s1,48
	lw	s9,-108(s0)
	c.add	s9,s5
	c.j	 .Lbranch_80000d96

.Lbranch_80000d8c:
	lw	a2,8(s9)
	c.slli	a2,0x8
	bge	a2,zero, .Lbranch_80000d54

.Lbranch_80000d96:
	c.mv	s10,a3
	slli	s1,a3,0xc
	c.add	s1,s5
	or	a2,s1,s11
	lw	a7,0(a2)
	slli	s4,a7,0x10
	srli	a6,s4,0x10
	beq	a6,zero, .Lbranch_800010ac
	beq	a6,s6, .Lbranch_800010ac
	srli	t5,a7,0x10

.Lbranch_80000dba:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000dba
	addi	a2,zero,80
	sb	a2,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80000dcc:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000dcc
	addi	a2,zero,67
	sb	a2,0(a4)

.Lbranch_80000dde:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000dde
	sb	t0,0(a4)

.Lbranch_80000dec:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000dec
	sb	t4,0(a4)

.Lbranch_80000dfa:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000dfa
	sb	ra,0(a4)

.Lbranch_80000e08:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e08
	sb	ra,0(a4)

.Lbranch_80000e16:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e16
	sb	t2,0(a4)

.Lbranch_80000e24:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e24
	sb	s7,0(a4)

.Lbranch_80000e32:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e32
	sb	s3,0(a4)

.Lbranch_80000e40:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e40
	sb	t2,0(a4)

.Lbranch_80000e4e:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e4e
	sb	ra,0(a4)

.Lbranch_80000e5c:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e5c
	ori	a2,s10,48
	sb	a2,0(a4)

.Lbranch_80000e6e:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e6e
	sb	t4,0(a4)

.Lbranch_80000e7c:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e7c
	addi	a2,zero,45
	sb	a2,0(a4)

.Lbranch_80000e8e:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e8e
	sb	t4,0(a4)

.Lbranch_80000e9c:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000e9c
	srli	a2,s4,0x1c
	bltu	a2,a1, .Lbranch_80000eb4
	addi	a3,a2,55
	c.j	 .Lbranch_80000eb8

.Lbranch_80000eb4:
	addi	a3,a2,48

.Lbranch_80000eb8:
	sb	a3,0(a4)

.Lbranch_80000ebc:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000ebc
	slli	a2,a7,0x14
	c.srli	a2,0x1c
	bltu	a2,a1, .Lbranch_80000ed6
	addi	a3,a2,55
	c.j	 .Lbranch_80000eda

.Lbranch_80000ed6:
	addi	a3,a2,48

.Lbranch_80000eda:
	sb	a3,0(a4)

.Lbranch_80000ede:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000ede
	andi	a3,a7,255
	srli	a2,a3,0x4
	bltu	a3,t3, .Lbranch_80000efa
	addi	a2,a2,55
	c.j	 .Lbranch_80000efe

.Lbranch_80000efa:
	addi	a2,a2,48

.Lbranch_80000efe:
	sb	a2,0(a4)

.Lbranch_80000f02:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000f02
	c.andi	a3,15
	bltu	a3,a1, .Lbranch_80000f18
	addi	a2,a3,55
	c.j	 .Lbranch_80000f1c

.Lbranch_80000f18:
	addi	a2,a3,48

.Lbranch_80000f1c:
	sb	a2,0(a4)

.Lbranch_80000f20:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000f20
	sb	t2,0(a4)

.Lbranch_80000f2e:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000f2e
	srli	a3,a7,0x1d
	srli	a2,a7,0x1c
	bltu	a3,a5, .Lbranch_80000f4a
	addi	a2,a2,55
	c.j	 .Lbranch_80000f4e

.Lbranch_80000f4a:
	addi	a2,a2,48

.Lbranch_80000f4e:
	sb	a2,0(a4)

.Lbranch_80000f52:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000f52
	slli	a2,a7,0x4
	c.srli	a2,0x1c
	bltu	a2,a1, .Lbranch_80000f6c
	addi	a2,a2,55
	c.j	 .Lbranch_80000f70

.Lbranch_80000f6c:
	addi	a2,a2,48

.Lbranch_80000f70:
	sb	a2,0(a4)

.Lbranch_80000f74:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000f74
	andi	a3,t5,255
	srli	a2,a3,0x4
	bltu	a3,t3, .Lbranch_80000f90
	addi	a2,a2,55
	c.j	 .Lbranch_80000f94

.Lbranch_80000f90:
	addi	a2,a2,48

.Lbranch_80000f94:
	sb	a2,0(a4)

.Lbranch_80000f98:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000f98
	c.andi	a3,15
	bltu	a3,a1, .Lbranch_80001088
	addi	a2,a3,55
	sb	a2,0(a4)
	beq	a6,s2, .Lbranch_80001094

.Lbranch_80000fb4:
	lw	a2,-100(s0)
	bne	a6,a2, .Lbranch_8000109e

.Lbranch_80000fbc:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000fbc
	sb	t4,0(a4)

.Lbranch_80000fca:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000fca
	addi	a2,zero,40
	sb	a2,0(a4)

.Lbranch_80000fdc:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000fdc
	addi	a2,zero,86
	sb	a2,0(a4)

.Lbranch_80000fee:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000fee
	sb	t0,0(a4)

.Lbranch_80000ffc:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80000ffc
	addi	a2,zero,82
	sb	a2,0(a4)

.Lbranch_8000100e:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_8000100e
	addi	a2,zero,84
	sb	a2,0(a4)

.Lbranch_80001020:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80001020
	sb	t0,0(a4)

.Lbranch_8000102e:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_8000102e
	addi	a2,zero,79
	sb	a2,0(a4)

.Lbranch_80001040:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80001040
	srli	a2,a7,0x16
	addi	a3,zero,41
	sb	a3,0(a4)
	addi	a3,zero,65
	bltu	a2,a3, .Lbranch_8000109e
	c.lui	a2,0x1
	addi	a2,a2,82	# .Lline_table_start0+0x1052
	bne	t5,a2, .Lbranch_8000109e
	c.li	a3,0

.Lbranch_8000106a:
	add	a2,a0,a3
	lbu	s1,0(a2)

.Lbranch_80001072:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80001072
	c.addi	a3,1
	sb	s1,0(a4)
	bne	a3,t6, .Lbranch_8000106a
	c.j	 .Lbranch_8000109e

.Lbranch_80001088:
	addi	a2,a3,48
	sb	a2,0(a4)
	bne	a6,s2, .Lbranch_80000fb4

.Lbranch_80001094:
	c.lui	a2,0x1
	addi	a2,a2,273	# .Lline_table_start0+0x1111
	beq	t5,a2, .Lbranch_800010ba

.Lbranch_8000109e:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_8000109e
	sb	a1,0(a4)

.Lbranch_800010ac:
	addi	a3,s10,1
	beq	s10,zero, .Lbranch_80000d8c
	bltu	s10,t1, .Lbranch_80000d96
	c.j	 .Lbranch_80000d54

.Lbranch_800010ba:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800010ba
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800010d0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800010d0
	lui	a0,0x10000
	addi	a1,zero,40
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800010e6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800010e6
	lui	a0,0x10000
	addi	a1,zero,66
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800010fc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800010fc
	lui	a0,0x10000
	addi	a1,zero,79
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001112:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001112
	lui	a0,0x10000
	addi	a1,zero,67
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001128:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001128
	lui	a0,0x10000
	addi	a1,zero,72
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000113e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000113e
	lui	a0,0x10000
	addi	a1,zero,83
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001154:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001154
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000116a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000116a
	lui	a0,0x10000
	addi	a1,zero,68
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001180:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001180
	lui	a0,0x10000
	addi	a1,zero,73
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001196:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001196
	lui	a0,0x10000
	addi	a1,zero,83
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800011ac:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800011ac
	lui	a0,0x10000
	addi	a1,zero,80
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800011c2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800011c2
	lui	a0,0x10000
	addi	a1,zero,76
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800011d8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800011d8
	lui	a0,0x10000
	addi	a1,zero,65
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800011ee:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800011ee
	lui	a0,0x10000
	addi	a1,zero,89
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001204:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001204
	lui	a0,0x10000
	addi	a1,zero,41
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000121a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000121a
	lui	a0,0x10000
	c.li	a1,10
	lw	s5,-108(s0)
	c.add	s5,s1
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	lw	s2,12(s5)
	lw	s4,20(s5)

.Lbranch_8000123c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000123c
	lui	a0,0x10000
	addi	a1,zero,73
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001252:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001252
	lui	a0,0x10000
	addi	a1,zero,110
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001268:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001268
	lui	a0,0x10000
	addi	a1,zero,105
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000127e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000127e
	lui	a0,0x10000
	addi	a1,zero,116
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001294:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001294
	lui	a0,0x10000
	addi	a1,zero,105
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800012aa:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800012aa
	lui	a0,0x10000
	addi	a1,zero,97
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800012c0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800012c0
	lui	a0,0x10000
	addi	a1,zero,108
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800012d6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800012d6
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800012ec:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800012ec
	lui	a0,0x10000
	addi	a1,zero,66
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001302:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001302
	lui	a0,0x10000
	addi	a1,zero,65
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001318:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001318
	lui	a0,0x10000
	addi	a1,zero,82
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000132e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000132e
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001344:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001344
	lui	a0,0x10000
	addi	a1,zero,58
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000135a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000135a
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001370:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001370
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001386:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001386
	lui	a0,0x10000
	addi	a1,zero,120
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	c.mv	a0,s2
	auipc	ra,0xfffff
	jalr	ra,-826(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_800013a6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800013a6
	lui	a0,0x10000
	c.li	a1,10
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800013ba:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800013ba
	lui	a0,0x10000
	addi	a1,zero,73
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800013d0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800013d0
	lui	a0,0x10000
	addi	a1,zero,110
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800013e6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800013e6
	lui	a0,0x10000
	addi	a1,zero,105
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800013fc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800013fc
	lui	a0,0x10000
	addi	a1,zero,116
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001412:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001412
	lui	a0,0x10000
	addi	a1,zero,105
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001428:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001428
	lui	a0,0x10000
	addi	a1,zero,97
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000143e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000143e
	lui	a0,0x10000
	addi	a1,zero,108
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001454:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001454
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000146a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000146a
	lui	a0,0x10000
	addi	a1,zero,66
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001480:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001480
	lui	a0,0x10000
	addi	a1,zero,65
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001496:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001496
	lui	a0,0x10000
	addi	a1,zero,82
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800014ac:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800014ac
	lui	a0,0x10000
	addi	a1,zero,50
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800014c2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800014c2
	lui	a0,0x10000
	addi	a1,zero,58
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800014d8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800014d8
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_800014ee:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800014ee
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001504:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001504
	lui	a0,0x10000
	addi	a1,zero,120
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	c.mv	a0,s4
	auipc	ra,0xfffff
	jalr	ra,-1208(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_80001524:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001524
	lui	a0,0x10000
	c.li	a1,10
	andi	s9,s2,-16
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	beq	s9,zero, .Lbranch_80001548
	andi	s3,s4,-16
	bne	s3,zero, .Lbranch_800016e6

.Lbranch_80001548:
	c.li	a1,0
	lui	a2,0x80013
	addi	a2,a2,-1140	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.17
	c.li	a3,20

.Lbranch_80001554:
	add	a4,a2,a1
	lbu	a4,0(a4)

.Lbranch_8000155c:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_8000155c
	c.addi	a1,1
	sb	a4,0(a0)
	bne	a1,a3, .Lbranch_80001554
	c.li	a0,0
	lui	a1,0x40000
	lui	a2,0x41000
	c.addi	a1,8	# .Lline_table_start1+0x3ffb3eb3
	sw	a1,12(s5)
	sw	a2,20(s5)
	lw	a6,12(s5)
	lw	s2,20(s5)
	lui	a2,0x80013
	addi	a2,a2,-1120	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.18
	lui	a3,0x10000
	c.li	a4,17

.Lbranch_8000159a:
	add	a5,a2,a0
	lbu	a5,0(a5)

.Lbranch_800015a2:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800015a2
	c.addi	a0,1
	sb	a5,0(a3)	# .Lline_table_start1+0xffb3eab
	bne	a0,a4, .Lbranch_8000159a
	andi	s4,a6,-16
	c.mv	a0,s4
	auipc	ra,0xfffff
	jalr	ra,-1368(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-1100	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.19
	lui	a2,0x10000
	c.li	a3,18

.Lbranch_800015d4:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_800015dc:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_800015dc
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_800015d4
	andi	a0,s2,-16
	auipc	ra,0xfffff
	jalr	ra,-1424(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_800015fc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800015fc
	lui	a0,0x10000
	c.li	a1,10
	lui	s9,0x40000
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	lui	s3,0x41000
	lw	s2,-112(s0)
	beq	s4,s9, .Lbranch_80001722
	c.li	a1,0
	lui	a2,0x80013
	addi	a2,a2,-1080	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20
	addi	a3,zero,44

.Lbranch_8000162e:
	add	a4,a2,a1
	lbu	a4,0(a4)

.Lbranch_80001636:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001636
	c.addi	a1,1
	sb	a4,0(a0)
	bne	a1,a3, .Lbranch_8000162e
	c.j	 .Lbranch_8000167c

.Lbranch_8000164c:
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-1212	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.15
	lui	a2,0x10000
	c.li	a3,31
	lw	s2,-112(s0)

.Lbranch_80001660:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80001668:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001668
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80001660

.Lbranch_8000167c:
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,432	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.37
	lui	a2,0x10000
	addi	a3,zero,35

.Lbranch_8000168e:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80001696:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001696
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_8000168e
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,468	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.38
	lui	a2,0x10000
	c.li	a3,28

.Lbranch_800016ba:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_800016c2:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_800016c2
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_800016ba
	c.li	s9,0
	c.li	a0,1
	sw	a0,-104(s0)
	bne	s2,zero, .Lbranch_800024d0
	jal	zero, .Lbranch_80002558

.Lbranch_800016e6:
	c.li	a1,-17
	bltu	a1,s2, .Lbranch_80001548
	bltu	a1,s4, .Lbranch_80001548
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-652	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x1ac
	lui	a2,0x10000
	addi	a3,zero,32
	lw	s2,-112(s0)

.Lbranch_80001706:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_8000170e:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_8000170e
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80001706

.Lbranch_80001722:
	lw	a2,-108(s0)
	c.or	a2,s1
	c.lw	a1,0(a2)
	andi	a0,a1,2
	c.bnez	a0, .Lbranch_80001764
	addi	a3,a1,2
	lui	a1,0x80013
	addi	a1,a1,-204	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.22
	c.sw	a3,0(a2)
	lui	a2,0x10000
	addi	a3,zero,42

.Lbranch_80001746:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_8000174e:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_8000174e
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80001746
	c.j	 .Lbranch_80001790

.Lbranch_80001764:
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-160	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.23
	lui	a2,0x10000
	c.li	a3,30

.Lbranch_80001774:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_8000177c:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_8000177c
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80001774

.Lbranch_80001790:
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-128	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.24
	lui	a2,0x10000
	c.li	a3,19

.Lbranch_800017a0:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_800017a8:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_800017a8
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_800017a0
	c.mv	a0,s9
	auipc	ra,0xfffff
	jalr	ra,-1882(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_800017c6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800017c6
	c.li	a0,0
	lui	a1,0x10000
	c.li	a3,10
	lui	a2,0x80013
	addi	a2,a2,-108	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.25
	sb	a3,0(a1)	# .Lline_table_start1+0xffb3eab
	c.li	a3,20

.Lbranch_800017e6:
	add	a4,a2,a0
	lbu	a4,0(a4)

.Lbranch_800017ee:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_800017ee
	c.addi	a0,1
	sb	a4,0(a1)
	bne	a0,a3, .Lbranch_800017e6
	c.mv	a0,s3
	auipc	ra,0xfffff
	jalr	ra,-1952(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_8000180c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000180c
	c.li	a0,0
	lui	a1,0x10000
	c.li	a3,10
	lui	a2,0x80013
	addi	a2,a2,-1588	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.2
	sb	a3,0(a1)	# .Lline_table_start1+0xffb3eab
	c.li	a3,28

.Lbranch_8000182c:
	add	a4,a2,a0
	lbu	a4,0(a4)

.Lbranch_80001834:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001834
	c.addi	a0,1
	sb	a4,0(a1)
	bne	a0,a3, .Lbranch_8000182c
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-1560	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.3
	lui	a2,0x10000
	c.li	a3,18

.Lbranch_80001858:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80001860:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001860
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80001858
	c.mv	a0,s9
	auipc	ra,0xffffe
	jalr	ra,2030(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_8000187e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000187e
	c.li	a0,0
	lui	a1,0x10000
	c.li	a3,10
	lui	a2,0x80013
	addi	a2,a2,-1540	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.4
	sb	a3,0(a1)	# .Lline_table_start1+0xffb3eab
	c.li	a3,20

.Lbranch_8000189e:
	add	a4,a2,a0
	lbu	a4,0(a4)

.Lbranch_800018a6:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_800018a6
	c.addi	a0,1
	sb	a4,0(a1)
	bne	a0,a3, .Lbranch_8000189e
	c.mv	a0,s3
	auipc	ra,0xffffe
	jalr	ra,1960(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_800018c4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800018c4
	c.li	a0,0
	lui	a1,0x10000
	c.li	a3,10
	lui	a2,0x80013
	addi	a2,a2,-1520	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.5
	sb	a3,0(a1)	# .Lline_table_start1+0xffb3eab
	addi	a3,zero,38

.Lbranch_800018e6:
	add	a4,a2,a0
	lbu	a4,0(a4)

.Lbranch_800018ee:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_800018ee
	c.addi	a0,1
	sb	a4,0(a1)
	bne	a0,a3, .Lbranch_800018e6
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-1480	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.6
	lui	a2,0x10000
	addi	a3,zero,44

.Lbranch_80001914:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_8000191c:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_8000191c
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80001914
	lhu	a0,1280(s3)	# .Lline_table_start1+0x40fb43ab

.Lbranch_80001934:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80001934
	lui	a1,0x10000
	addi	a2,zero,86
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000194a:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000194a
	lui	a1,0x10000
	addi	a2,zero,66
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001960:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80001960
	lui	a1,0x10000
	addi	a2,zero,69
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001976:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80001976
	lui	a1,0x10000
	addi	a2,zero,32
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000198c:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000198c
	lui	a1,0x10000
	addi	a2,zero,73
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800019a2:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800019a2
	lui	a1,0x10000
	addi	a2,zero,68
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800019b8:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800019b8
	lui	a1,0x10000
	addi	a2,zero,58
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800019ce:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800019ce
	lui	a1,0x10000
	addi	a2,zero,32
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800019e4:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800019e4
	lui	a1,0x10000
	addi	a2,zero,48
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800019fa:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800019fa
	lui	a1,0x10000
	addi	a2,zero,120
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001a10:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80001a10
	srli	a1,a0,0xc
	c.li	a2,10
	bltu	a1,a2, .Lbranch_80001a2a
	addi	a1,a1,55
	c.j	 .Lbranch_80001a2e

.Lbranch_80001a2a:
	addi	a1,a1,48

.Lbranch_80001a2e:
	lui	a2,0x10000
	sb	a1,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001a36:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80001a36
	slli	a1,a0,0x14
	c.srli	a1,0x1c
	c.li	a2,10
	bltu	a1,a2, .Lbranch_80001a52
	addi	a1,a1,55
	c.j	 .Lbranch_80001a56

.Lbranch_80001a52:
	addi	a1,a1,48

.Lbranch_80001a56:
	lui	a2,0x10000
	sb	a1,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001a5e:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80001a5e
	andi	a1,a0,255
	addi	a3,zero,160
	srli	a2,a1,0x4
	bltu	a1,a3, .Lbranch_80001a7e
	addi	a2,a2,55
	c.j	 .Lbranch_80001a82

.Lbranch_80001a7e:
	addi	a2,a2,48

.Lbranch_80001a82:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001a8a:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80001a8a
	c.andi	a1,15
	c.li	a2,10
	bltu	a1,a2, .Lbranch_80001aa2
	addi	a1,a1,55
	c.j	 .Lbranch_80001aa6

.Lbranch_80001aa2:
	addi	a1,a1,48

.Lbranch_80001aa6:
	lui	a2,0x10000
	sb	a1,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001aae:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80001aae
	lui	a1,0x10000
	c.li	a2,10
	c.lui	a3,0x5
	addi	a3,a3,-192	# .Lline_table_start0+0x8d1
	c.add	a3,a0
	c.slli	a3,0x10
	c.srli	a3,0x10
	c.li	a4,6
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab
	bgeu	a3,a4, .Lbranch_80001afe
	c.li	a0,0
	lui	a2,0x80013
	addi	a2,a2,-1380	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.8
	c.li	a3,23

.Lbranch_80001ae0:
	add	a4,a2,a0
	lbu	a4,0(a4)

.Lbranch_80001ae8:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001ae8
	c.addi	a0,1
	sb	a4,0(a1)
	bne	a0,a3, .Lbranch_80001ae0
	c.j	 .Lbranch_80001b36

.Lbranch_80001afe:
	c.bnez	a0, .Lbranch_80001b36
	lui	a1,0x80013
	addi	a1,a1,-1436	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.7
	lui	a2,0x10000
	addi	a3,zero,53

.Lbranch_80001b10:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80001b18:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001b18
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80001b10
	c.lui	a0,0xb
	addi	a0,a0,197	# .Lline_table_start0+0x151e
	sh	a0,1280(s3)

.Lbranch_80001b36:
	c.li	a0,0
	sh	zero,1288(s3)
	lui	a1,0x80013
	addi	a1,a1,-1356	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.9
	lui	a2,0x10000
	c.li	a3,24

.Lbranch_80001b4a:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80001b52:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001b52
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80001b4a

.Lbranch_80001b66:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001b66
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001b7c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001b7c
	lui	a0,0x10000
	addi	a1,zero,52
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001b92:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001b92
	lui	a0,0x10000
	addi	a1,zero,51
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001ba8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001ba8
	lui	a0,0x10000
	addi	a1,zero,56
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001bbe:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001bbe
	c.li	a0,0
	lui	a1,0x10000
	c.li	a2,10
	addi	a3,zero,1080
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab
	lui	a2,0x80013
	addi	a2,a2,-1332	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.10
	sh	a3,1282(s3)
	c.li	a3,24

.Lbranch_80001be6:
	add	a4,a2,a0
	lbu	a4,0(a4)

.Lbranch_80001bee:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001bee
	c.addi	a0,1
	sb	a4,0(a1)
	bne	a0,a3, .Lbranch_80001be6

.Lbranch_80001c02:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001c02
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001c18:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001c18
	lui	a0,0x10000
	addi	a1,zero,50
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001c2e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001c2e
	lui	a0,0x10000
	addi	a1,zero,68
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001c44:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001c44
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001c5a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001c5a
	lui	a0,0x10000
	c.li	a1,10
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab
	addi	a0,zero,720
	addi	a1,zero,1080
	sh	a0,1284(s3)
	sh	a1,1292(s3)
	sh	a0,1294(s3)

.Lbranch_80001c82:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001c82
	lui	a0,0x10000
	addi	a1,zero,83
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001c98:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001c98
	lui	a0,0x10000
	addi	a1,zero,101
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001cae:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001cae
	lui	a0,0x10000
	addi	a1,zero,116
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001cc4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001cc4
	lui	a0,0x10000
	addi	a1,zero,116
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001cda:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001cda
	lui	a0,0x10000
	addi	a1,zero,105
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001cf0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001cf0
	lui	a0,0x10000
	addi	a1,zero,110
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001d06:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001d06
	lui	a0,0x10000
	addi	a1,zero,103
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001d1c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001d1c
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001d32:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001d32
	lui	a0,0x10000
	addi	a1,zero,66
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001d48:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001d48
	lui	a0,0x10000
	addi	a1,zero,80
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001d5e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001d5e
	lui	a0,0x10000
	addi	a1,zero,80
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001d74:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001d74
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001d8a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001d8a
	lui	a0,0x10000
	addi	a1,zero,116
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001da0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001da0
	lui	a0,0x10000
	addi	a1,zero,111
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001db6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001db6
	lui	a0,0x10000
	addi	a1,zero,32
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001dcc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001dcc
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001de2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001de2
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001df8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001df8
	lui	a0,0x10000
	addi	a1,zero,50
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001e0e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001e0e
	lui	a0,0x10000
	addi	a1,zero,48
	sb	a1,0(a0)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001e24:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80001e24
	c.li	a0,0
	lui	a1,0x10000
	c.li	a2,10
	addi	a3,zero,32
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab
	lui	a2,0x80013
	addi	a2,a2,-1308	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.11
	sh	a3,1286(s3)
	sh	zero,1290(s3)
	sh	zero,1296(s3)
	sh	zero,1298(s3)
	c.li	a3,26

.Lbranch_80001e58:
	add	a4,a2,a0
	lbu	a4,0(a4)

.Lbranch_80001e60:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80001e60
	c.addi	a0,1
	sb	a4,0(a1)
	bne	a0,a3, .Lbranch_80001e58
	addi	a0,zero,65
	sh	a0,1288(s3)
	lhu	a3,1282(s3)
	lhu	a2,1284(s3)
	lhu	a1,1286(s3)
	lhu	a0,1288(s3)

.Lbranch_80001e8c:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001e8c
	lui	a4,0x10000
	addi	a5,zero,82
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001ea2:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001ea2
	lui	a4,0x10000
	addi	a5,zero,101
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001eb8:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001eb8
	lui	a4,0x10000
	addi	a5,zero,97
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001ece:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001ece
	lui	a4,0x10000
	addi	a5,zero,100
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001ee4:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001ee4
	lui	a4,0x10000
	addi	a5,zero,98
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001efa:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001efa
	lui	a4,0x10000
	addi	a5,zero,97
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001f10:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001f10
	lui	a4,0x10000
	addi	a5,zero,99
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001f26:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001f26
	lui	a4,0x10000
	addi	a5,zero,107
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001f3c:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001f3c
	lui	a4,0x10000
	addi	a5,zero,32
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001f52:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001f52
	lui	a4,0x10000
	addi	a5,zero,45
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001f68:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001f68
	lui	a4,0x10000
	addi	a5,zero,32
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001f7e:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001f7e
	lui	a4,0x10000
	addi	a5,zero,88
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001f94:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001f94
	lui	a4,0x10000
	addi	a5,zero,58
	sb	a5,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001faa:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001faa
	srli	a4,a3,0xc
	c.li	a5,10
	bltu	a4,a5, .Lbranch_80001fc4
	addi	a4,a4,55
	c.j	 .Lbranch_80001fc8

.Lbranch_80001fc4:
	addi	a4,a4,48

.Lbranch_80001fc8:
	lui	a5,0x10000
	sb	a4,0(a5)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001fd0:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001fd0
	slli	a4,a3,0x14
	c.srli	a4,0x1c
	c.li	a5,10
	bltu	a4,a5, .Lbranch_80001fec
	addi	a4,a4,55
	c.j	 .Lbranch_80001ff0

.Lbranch_80001fec:
	addi	a4,a4,48

.Lbranch_80001ff0:
	lui	a5,0x10000
	sb	a4,0(a5)	# .Lline_table_start1+0xffb3eab

.Lbranch_80001ff8:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80001ff8
	andi	a3,a3,255
	addi	a5,zero,160
	srli	a4,a3,0x4
	bltu	a3,a5, .Lbranch_80002018
	addi	a4,a4,55
	c.j	 .Lbranch_8000201c

.Lbranch_80002018:
	addi	a4,a4,48

.Lbranch_8000201c:
	lui	a5,0x10000
	sb	a4,0(a5)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002024:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80002024
	c.andi	a3,15
	c.li	a4,10
	bltu	a3,a4, .Lbranch_8000203c
	addi	a3,a3,55
	c.j	 .Lbranch_80002040

.Lbranch_8000203c:
	addi	a3,a3,48

.Lbranch_80002040:
	lui	a4,0x10000
	sb	a3,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002048:
	lbu	a3,5(s8)
	andi	a3,a3,32
	c.beqz	a3, .Lbranch_80002048
	lui	a3,0x10000
	addi	a4,zero,32
	sb	a4,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000205e:
	lbu	a3,5(s8)
	andi	a3,a3,32
	c.beqz	a3, .Lbranch_8000205e
	lui	a3,0x10000
	addi	a4,zero,89
	sb	a4,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002074:
	lbu	a3,5(s8)
	andi	a3,a3,32
	c.beqz	a3, .Lbranch_80002074
	lui	a3,0x10000
	addi	a4,zero,58
	sb	a4,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000208a:
	lbu	a3,5(s8)
	andi	a3,a3,32
	c.beqz	a3, .Lbranch_8000208a
	srli	a3,a2,0xc
	c.li	a4,10
	bltu	a3,a4, .Lbranch_800020a4
	addi	a3,a3,55
	c.j	 .Lbranch_800020a8

.Lbranch_800020a4:
	addi	a3,a3,48

.Lbranch_800020a8:
	lui	a4,0x10000
	sb	a3,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_800020b0:
	lbu	a3,5(s8)
	andi	a3,a3,32
	c.beqz	a3, .Lbranch_800020b0
	slli	a3,a2,0x14
	c.srli	a3,0x1c
	c.li	a4,10
	bltu	a3,a4, .Lbranch_800020cc
	addi	a3,a3,55
	c.j	 .Lbranch_800020d0

.Lbranch_800020cc:
	addi	a3,a3,48

.Lbranch_800020d0:
	lui	a4,0x10000
	sb	a3,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_800020d8:
	lbu	a3,5(s8)
	andi	a3,a3,32
	c.beqz	a3, .Lbranch_800020d8
	andi	a2,a2,255
	addi	a4,zero,160
	srli	a3,a2,0x4
	bltu	a2,a4, .Lbranch_800020f8
	addi	a3,a3,55
	c.j	 .Lbranch_800020fc

.Lbranch_800020f8:
	addi	a3,a3,48

.Lbranch_800020fc:
	lui	a4,0x10000
	sb	a3,0(a4)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002104:
	lbu	a3,5(s8)
	andi	a3,a3,32
	c.beqz	a3, .Lbranch_80002104
	c.andi	a2,15
	c.li	a3,10
	bltu	a2,a3, .Lbranch_8000211c
	addi	a2,a2,55
	c.j	 .Lbranch_80002120

.Lbranch_8000211c:
	addi	a2,a2,48

.Lbranch_80002120:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002128:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002128
	lui	a2,0x10000
	addi	a3,zero,32
	sb	a3,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000213e:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_8000213e
	lui	a2,0x10000
	addi	a3,zero,66
	sb	a3,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002154:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002154
	lui	a2,0x10000
	addi	a3,zero,80
	sb	a3,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000216a:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_8000216a
	lui	a2,0x10000
	addi	a3,zero,80
	sb	a3,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002180:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002180
	lui	a2,0x10000
	addi	a3,zero,58
	sb	a3,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002196:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002196
	srli	a2,a1,0xc
	c.li	a3,10
	bltu	a2,a3, .Lbranch_800021b0
	addi	a2,a2,55
	c.j	 .Lbranch_800021b4

.Lbranch_800021b0:
	addi	a2,a2,48

.Lbranch_800021b4:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_800021bc:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_800021bc
	slli	a2,a1,0x14
	c.srli	a2,0x1c
	c.li	a3,10
	bltu	a2,a3, .Lbranch_800021d8
	addi	a2,a2,55
	c.j	 .Lbranch_800021dc

.Lbranch_800021d8:
	addi	a2,a2,48

.Lbranch_800021dc:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_800021e4:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_800021e4
	andi	a1,a1,255
	addi	a3,zero,160
	srli	a2,a1,0x4
	bltu	a1,a3, .Lbranch_80002204
	addi	a2,a2,55
	c.j	 .Lbranch_80002208

.Lbranch_80002204:
	addi	a2,a2,48

.Lbranch_80002208:
	lui	a3,0x10000
	sb	a2,0(a3)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002210:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002210
	c.andi	a1,15
	c.li	a2,10
	bltu	a1,a2, .Lbranch_80002228
	addi	a1,a1,55
	c.j	 .Lbranch_8000222c

.Lbranch_80002228:
	addi	a1,a1,48

.Lbranch_8000222c:
	lui	a2,0x10000
	sb	a1,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002234:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002234
	lui	a1,0x10000
	addi	a2,zero,32
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000224a:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000224a
	lui	a1,0x10000
	addi	a2,zero,69
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002260:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002260
	lui	a1,0x10000
	addi	a2,zero,110
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002276:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002276
	lui	a1,0x10000
	addi	a2,zero,97
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000228c:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000228c
	lui	a1,0x10000
	addi	a2,zero,98
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800022a2:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800022a2
	lui	a1,0x10000
	addi	a2,zero,108
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800022b8:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800022b8
	lui	a1,0x10000
	addi	a2,zero,101
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800022ce:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800022ce
	lui	a1,0x10000
	addi	a2,zero,58
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800022e4:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800022e4
	lui	a1,0x10000
	addi	a2,zero,48
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800022fa:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800022fa
	lui	a1,0x10000
	addi	a2,zero,120
	sb	a2,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002310:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002310
	srli	a1,a0,0xc
	c.li	a2,10
	bltu	a1,a2, .Lbranch_8000232a
	addi	a1,a1,55
	c.j	 .Lbranch_8000232e

.Lbranch_8000232a:
	addi	a1,a1,48

.Lbranch_8000232e:
	lui	a2,0x10000
	sb	a1,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_80002336:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002336
	slli	a1,a0,0x14
	c.srli	a1,0x1c
	c.li	a2,10
	bltu	a1,a2, .Lbranch_80002352
	addi	a1,a1,55
	c.j	 .Lbranch_80002356

.Lbranch_80002352:
	addi	a1,a1,48

.Lbranch_80002356:
	lui	a2,0x10000
	sb	a1,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000235e:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000235e
	andi	a0,a0,255
	addi	a2,zero,160
	srli	a1,a0,0x4
	bltu	a0,a2, .Lbranch_8000237e
	addi	a1,a1,55
	c.j	 .Lbranch_80002382

.Lbranch_8000237e:
	addi	a1,a1,48

.Lbranch_80002382:
	lui	a2,0x10000
	sb	a1,0(a2)	# .Lline_table_start1+0xffb3eab

.Lbranch_8000238a:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000238a
	c.andi	a0,15
	c.li	a1,10
	bltu	a0,a1, .Lbranch_800023a2
	addi	a0,a0,55
	c.j	 .Lbranch_800023a6

.Lbranch_800023a2:
	addi	a0,a0,48

.Lbranch_800023a6:
	lui	a1,0x10000
	sb	a0,0(a1)	# .Lline_table_start1+0xffb3eab

.Lbranch_800023ae:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800023ae
	c.li	a0,0
	lui	a1,0x10000
	c.li	a3,10
	lui	a2,0x80013
	addi	a2,a2,-1280	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.12
	sb	a3,0(a1)	# .Lline_table_start1+0xffb3eab
	c.li	a3,27

.Lbranch_800023ce:
	add	a4,a2,a0
	lbu	a4,0(a4)

.Lbranch_800023d6:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_800023d6
	c.addi	a0,1
	sb	a4,0(a1)
	bne	a0,a3, .Lbranch_800023ce
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,-1252	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.13
	lui	a2,0x10000
	c.li	a3,18

.Lbranch_800023fa:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80002402:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80002402
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_800023fa
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,404	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.36
	lui	a2,0x10000
	c.li	a3,27

.Lbranch_80002426:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_8000242e:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_8000242e
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80002426
	addi	a0,s0,-96
	addi	a2,zero,1080
	addi	a3,zero,720
	c.mv	a1,s9
	auipc	ra,0x3
	jalr	ra,-888(ra)	# _ZN11homebrew_os8showcase17Rgb565Framebuffer3new17hff84c3e3b6b7d648E
	auipc	ra,0x2
	jalr	ra,1964(ra)	# _ZN11homebrew_os11demos_basic16get_current_page17h158bb443700df5ddE
	c.mv	a2,a0
	lui	a1,0x80013
	addi	a1,a1,496	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.39
	addi	a0,s0,-96
	c.li	a3,0
	c.li	a4,0
	auipc	ra,0x1
	jalr	ra,650(ra)	# _ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E
	lui	s1,0x80013
	addi	s1,s1,544	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.40
	beq	s2,zero, .Lbranch_8000252e
	auipc	ra,0x4
	jalr	ra,714(ra)	# _ZN11homebrew_os12virtio_input18get_mouse_position17hde71303e6559bc97E
	c.mv	a4,a0
	c.mv	a5,a1
	addi	a1,zero,1080
	addi	a2,zero,720
	c.mv	a0,s9
	c.li	a3,0
	auipc	ra,0x9
	jalr	ra,-198(ra)	# _ZN11homebrew_os11framebuffer17draw_mouse_cursor17hd217d6df565dbfcdE
	c.li	a0,0
	lui	a1,0x10000
	addi	a2,zero,45

.Lbranch_800024b0:
	add	a3,s1,a0
	lbu	a3,0(a3)

.Lbranch_800024b8:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_800024b8
	c.addi	a0,1
	sb	a3,0(a1)	# .Lline_table_start1+0xffb3eab
	bne	a0,a2, .Lbranch_800024b0
	sw	zero,-104(s0)

.Lbranch_800024d0:
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,644	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.42
	lui	a2,0x10000
	addi	a3,zero,47

.Lbranch_800024e2:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_800024ea:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_800024ea
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_800024e2
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,692	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.43
	lui	a2,0x10000
	addi	a3,zero,51

.Lbranch_80002510:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80002518:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80002518
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_80002510
	c.j	 .Lbranch_80002586

.Lbranch_8000252e:
	c.li	a0,0
	lui	a1,0x10000
	addi	a2,zero,45

.Lbranch_80002538:
	add	a3,s1,a0
	lbu	a3,0(a3)

.Lbranch_80002540:
	lbu	a4,5(s8)
	andi	a4,a4,32
	c.beqz	a4, .Lbranch_80002540
	c.addi	a0,1
	sb	a3,0(a1)	# .Lline_table_start1+0xffb3eab
	bne	a0,a2, .Lbranch_80002538
	sw	zero,-104(s0)

.Lbranch_80002558:
	c.li	a0,0
	lui	a1,0x80013
	addi	a1,a1,592	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.41
	lui	a2,0x10000
	addi	a3,zero,49

.Lbranch_8000256a:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_80002572:
	lbu	a5,5(s8)
	andi	a5,a5,32
	c.beqz	a5, .Lbranch_80002572
	c.addi	a0,1
	sb	a4,0(a2)	# .Lline_table_start1+0xffb3eab
	bne	a0,a3, .Lbranch_8000256a

.Lbranch_80002586:
	xori	a0,s2,1
	c.li	s10,22
	c.li	s11,10
	lui	s2,0x10000
	addi	s6,zero,32
	lui	a1,0x74727
	c.lui	a2,0x5
	lw	a3,-104(s0)
	c.or	a0,a3
	sw	a0,-108(s0)
	addi	a0,a1,-1674	# .Lline_table_start1+0x746da821
	sw	a0,-100(s0)
	addi	a0,a2,1365	# .Lline_table_start0+0xee6
	sw	a0,-112(s0)
	addi	s3,zero,61
	sw	s9,-116(s0)

.Lbranch_800025be:
	auipc	ra,0x4
	jalr	ra,-1094(ra)	# _ZN11homebrew_os12virtio_input17poll_virtio_input17h58b863981976fb93E
	c.andi	a0,1
	c.bnez	a0, .Lbranch_800025d6
	lbu	a0,5(s8)
	c.andi	a0,1
	c.beqz	a0, .Lbranch_8000265a
	lbu	a1,0(s2)	# .Lline_table_start1+0xffb3eab

.Lbranch_800025d6:
	andi	a0,a1,255
	addi	a2,a0,-91
	bltu	s10,a2, .Lbranch_800029c0
	c.slli	a2,0x2
	lui	a0,0x80011
	addi	a0,a0,1984	# .LJTI2_0
	c.add	a2,a0
	c.lw	a0,0(a2)
	c.jr	a0
	lw	a0,-104(s0)
	bne	a0,zero, .Lbranch_80003468
	auipc	ra,0x2
	jalr	ra,1614(ra)	# _ZN11homebrew_os11demos_basic9prev_page17hb133f9494bd7ad39E
	c.mv	s1,a0
	addi	a0,s0,-96
	addi	a2,zero,1080
	addi	a3,zero,720
	c.mv	a1,s9
	auipc	ra,0x3
	jalr	ra,-1338(ra)	# _ZN11homebrew_os8showcase17Rgb565Framebuffer3new17hff84c3e3b6b7d648E
	addi	a0,s0,-96
	lui	a1,0x80013
	addi	a1,a1,496	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.39
	c.mv	a2,s1
	c.li	a3,0
	c.li	a4,0
	auipc	ra,0x1
	jalr	ra,208(ra)	# _ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E
	c.li	a0,0

.Lbranch_80002636:
	lui	a1,0x80013
	addi	a1,a1,812	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.47
	c.add	a1,a0
	lbu	a1,0(a1)

.Lbranch_80002644:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002644
	c.addi	a0,1
	sb	a1,0(s2)
	c.li	a1,17
	bne	a0,a1, .Lbranch_80002636

.Lbranch_8000265a:
	lw	a0,-104(s0)
	bne	a0,zero, .Lbranch_80003468
	jal	zero, .Lbranch_80003388

.Lbranch_80002666:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002666
	sb	s11,0(s2)
	addi	a1,zero,104
	lui	a3,0x80013
	addi	a3,a3,744	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.44
	c.li	a4,20

.Lbranch_80002682:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002682
	addi	a0,zero,67
	sb	a0,0(s2)

.Lbranch_80002694:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002694
	addi	a0,zero,111
	sb	a0,0(s2)

.Lbranch_800026a6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800026a6
	addi	a0,zero,109
	sb	a0,0(s2)

.Lbranch_800026b8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800026b8
	addi	a0,zero,109
	sb	a0,0(s2)

.Lbranch_800026ca:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800026ca
	addi	a0,zero,97
	sb	a0,0(s2)

.Lbranch_800026dc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800026dc
	addi	a0,zero,110
	sb	a0,0(s2)

.Lbranch_800026ee:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800026ee
	addi	a0,zero,100
	sb	a0,0(s2)

.Lbranch_80002700:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002700
	addi	a0,zero,115
	sb	a0,0(s2)

.Lbranch_80002712:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002712
	addi	a0,zero,58
	sb	a0,0(s2)

.Lbranch_80002724:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002724
	sb	s11,0(s2)

.Lbranch_80002732:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002732
	sb	s6,0(s2)

.Lbranch_80002740:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002740
	sb	s6,0(s2)

.Lbranch_8000274e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000274e
	sb	a1,0(s2)

.Lbranch_8000275c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000275c
	sb	s6,0(s2)

.Lbranch_8000276a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000276a
	addi	a0,zero,45
	sb	a0,0(s2)

.Lbranch_8000277c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000277c
	sb	s6,0(s2)

.Lbranch_8000278a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000278a
	addi	a0,zero,84
	sb	a0,0(s2)

.Lbranch_8000279c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000279c
	sb	a1,0(s2)

.Lbranch_800027aa:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800027aa
	addi	a0,zero,105
	sb	a0,0(s2)

.Lbranch_800027bc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800027bc
	addi	a0,zero,115
	sb	a0,0(s2)

.Lbranch_800027ce:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800027ce
	sb	s6,0(s2)

.Lbranch_800027dc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800027dc
	sb	a1,0(s2)

.Lbranch_800027ea:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800027ea
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_800027fc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800027fc
	addi	a0,zero,108
	sb	a0,0(s2)

.Lbranch_8000280e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000280e
	addi	a0,zero,112
	sb	a0,0(s2)

.Lbranch_80002820:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002820
	c.li	a0,0
	sb	s11,0(s2)

.Lbranch_80002830:
	add	a1,a3,a0
	lbu	a1,0(a1)

.Lbranch_80002838:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002838
	c.addi	a0,1
	sb	a1,0(s2)
	bne	a0,a4, .Lbranch_80002830

.Lbranch_8000284c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000284c
	sb	s6,0(s2)
	lui	a3,0x80013
	addi	a3,a3,764	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.45

.Lbranch_80002862:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002862
	sb	s6,0(s2)

.Lbranch_80002870:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002870
	addi	a0,zero,93
	sb	a0,0(s2)

.Lbranch_80002882:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002882
	sb	s6,0(s2)

.Lbranch_80002890:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002890
	addi	a0,zero,45
	sb	a0,0(s2)

.Lbranch_800028a2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800028a2
	sb	s6,0(s2)

.Lbranch_800028b0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800028b0
	addi	a0,zero,78
	sb	a0,0(s2)

.Lbranch_800028c2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800028c2
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_800028d4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800028d4
	addi	a0,zero,120
	sb	a0,0(s2)

.Lbranch_800028e6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800028e6
	addi	a0,zero,116
	sb	a0,0(s2)

.Lbranch_800028f8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800028f8
	sb	s6,0(s2)

.Lbranch_80002906:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002906
	addi	a0,zero,112
	sb	a0,0(s2)

.Lbranch_80002918:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002918
	addi	a0,zero,97
	sb	a0,0(s2)

.Lbranch_8000292a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000292a
	addi	a0,zero,103
	sb	a0,0(s2)

.Lbranch_8000293c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000293c
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_8000294e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000294e
	c.li	a0,0
	sb	s11,0(s2)

.Lbranch_8000295e:
	add	a1,a3,a0
	lbu	a1,0(a1)

.Lbranch_80002966:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002966
	c.addi	a0,1
	sb	a1,0(s2)
	bne	a0,s10, .Lbranch_8000295e
	c.li	a0,0
	lui	a3,0x80013
	addi	a3,a3,788	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.46

.Lbranch_80002984:
	add	a1,a3,a0
	lbu	a1,0(a1)

.Lbranch_8000298c:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_8000298c
	c.addi	a0,1
	sb	a1,0(s2)
	bne	a0,s10, .Lbranch_80002984

.Lbranch_800029a0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800029a0
	addi	a0,zero,62
	sb	a0,0(s2)

.Lbranch_800029b2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800029b2
	jal	zero, .Lbranch_80003312

.Lbranch_800029c0:
	beq	a0,s11, .Lbranch_800029ca
	c.li	a2,13
	bne	a0,a2, .Lbranch_800029f8

.Lbranch_800029ca:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800029ca
	sb	s11,0(s2)

.Lbranch_800029d8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800029d8
	addi	a0,zero,62
	sb	a0,0(s2)

.Lbranch_800029ea:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800029ea
	jal	zero, .Lbranch_80003312

.Lbranch_800029f8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800029f8
	sb	a1,0(s2)
	lw	a0,-104(s0)
	beq	a0,zero, .Lbranch_80003388
	jal	zero, .Lbranch_80003468
	lw	a0,-104(s0)
	bne	a0,zero, .Lbranch_80003468
	addi	a0,s0,-96
	addi	a2,zero,1080
	addi	a3,zero,720
	c.mv	a1,s9
	auipc	ra,0x2
	jalr	ra,1712(ra)	# _ZN11homebrew_os8showcase17Rgb565Framebuffer3new17hff84c3e3b6b7d648E
	auipc	ra,0x2
	jalr	ra,468(ra)	# _ZN11homebrew_os11demos_basic16get_current_page17h158bb443700df5ddE
	c.mv	a2,a0
	addi	a0,s0,-96
	lui	a1,0x80013
	addi	a1,a1,496	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.39
	c.li	a3,0
	c.li	a4,0
	auipc	ra,0x1
	jalr	ra,-846(ra)	# _ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E

.Lbranch_80002a52:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002a52
	sb	s11,0(s2)

.Lbranch_80002a60:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002a60
	addi	a0,zero,82
	sb	a0,0(s2)
	addi	a1,zero,104

.Lbranch_80002a76:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002a76
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_80002a88:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002a88
	addi	a0,zero,102
	sb	a0,0(s2)

.Lbranch_80002a9a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002a9a
	addi	a0,zero,114
	sb	a0,0(s2)

.Lbranch_80002aac:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002aac
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_80002abe:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002abe
	addi	a0,zero,115
	sb	a0,0(s2)

.Lbranch_80002ad0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002ad0
	sb	a1,0(s2)

.Lbranch_80002ade:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002ade
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_80002af0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002af0
	addi	a0,zero,100
	sb	a0,0(s2)

.Lbranch_80002b02:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002b02
	sb	s11,0(s2)

.Lbranch_80002b10:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002b10
	addi	a0,zero,62
	sb	a0,0(s2)

.Lbranch_80002b22:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002b22
	jal	zero, .Lbranch_80003384
	lw	a0,-104(s0)
	bne	a0,zero, .Lbranch_80003468
	auipc	ra,0x2
	jalr	ra,228(ra)	# _ZN11homebrew_os11demos_basic9next_page17hae4c73d94ac0226dE
	c.mv	s1,a0
	addi	a0,s0,-96
	addi	a2,zero,1080
	addi	a3,zero,720
	c.mv	a1,s9
	auipc	ra,0x2
	jalr	ra,1416(ra)	# _ZN11homebrew_os8showcase17Rgb565Framebuffer3new17hff84c3e3b6b7d648E
	addi	a0,s0,-96
	lui	a1,0x80013
	addi	a1,a1,496	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.39
	c.mv	a2,s1
	c.li	a3,0
	c.li	a4,0
	auipc	ra,0x1
	jalr	ra,-1134(ra)	# _ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E

.Lbranch_80002b72:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002b72
	sb	s11,0(s2)

.Lbranch_80002b80:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002b80
	addi	a0,zero,78
	sb	a0,0(s2)

.Lbranch_80002b92:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002b92
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_80002ba4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002ba4
	addi	a0,zero,120
	sb	a0,0(s2)

.Lbranch_80002bb6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002bb6
	addi	a0,zero,116
	sb	a0,0(s2)

.Lbranch_80002bc8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002bc8
	sb	s6,0(s2)

.Lbranch_80002bd6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002bd6
	addi	a0,zero,112
	sb	a0,0(s2)

.Lbranch_80002be8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002be8
	addi	a0,zero,97
	sb	a0,0(s2)

.Lbranch_80002bfa:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002bfa
	addi	a0,zero,103
	sb	a0,0(s2)

.Lbranch_80002c0c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002c0c
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_80002c1e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002c1e
	sb	s6,0(s2)

.Lbranch_80002c2c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002c2c
	addi	a0,zero,45
	sb	a0,0(s2)

.Lbranch_80002c3e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002c3e
	addi	a0,zero,62
	sb	a0,0(s2)

.Lbranch_80002c50:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002c50
	sb	s6,0(s2)
	auipc	ra,0x2
	jalr	ra,-90(ra)	# _ZN11homebrew_os11demos_basic16get_current_page17h158bb443700df5ddE
	c.addi	a0,1
	c.li	a1,8
	bltu	a1,a0, .Lbranch_80003348
	c.slli	a0,0x2
	lui	a1,0x80012
	addi	a1,a1,-2020	# .LJTI2_1
	c.add	a0,a1
	c.lw	a0,0(a0)
	c.jr	a0
	addi	a0,zero,49
	c.j	 .Lbranch_8000334c
	c.li	a0,0

.Lbranch_80002c86:
	lui	a1,0x80013
	addi	a1,a1,848	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.49
	c.add	a1,a0
	lbu	a1,0(a1)

.Lbranch_80002c94:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002c94
	c.addi	a0,1
	sb	a1,0(s2)
	c.li	a1,19
	bne	a0,a1, .Lbranch_80002c86
	c.li	s9,0
	lui	a0,0x10001
	sw	a0,-96(s0)
	lui	a0,0x10002
	sw	a0,-92(s0)
	lui	a0,0x10003
	sw	a0,-88(s0)
	lui	a0,0x10004
	sw	a0,-84(s0)
	lui	a0,0x10005
	sw	a0,-80(s0)
	lui	a0,0x10006
	sw	a0,-76(s0)
	lui	a0,0x10007
	sw	a0,-72(s0)
	lui	a0,0x10008
	sw	a0,-68(s0)
	c.j	 .Lbranch_80002cf4

.Lbranch_80002cee:
	c.addi	s9,4	# .Lline_table_start1+0x3ffb3eaf
	beq	s9,s6, .Lbranch_80002f24

.Lbranch_80002cf4:
	addi	a0,s0,-96
	c.add	a0,s9
	c.lw	a0,0(a0)
	andi	a1,a0,3
	bne	a1,zero, .Lbranch_80003476
	c.lw	a1,0(a0)
	lw	a2,-100(s0)
	bne	a1,a2, .Lbranch_80002cee
	c.li	a1,-5
	bltu	a1,a0, .Lbranch_80003494
	c.lw	s1,4(a0)
	c.li	a1,-9
	bltu	a1,a0, .Lbranch_800034a4
	lw	s7,8(a0)	# .Lline_table_start1+0xffbbeb3
	addi	a1,zero,-113
	bltu	a1,a0, .Lbranch_800034b4
	lw	s5,112(a0)
	lw	s4,96(a0)
	lw	zero,68(a0)

.Lbranch_80002d34:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002d34
	sb	s6,0(s2)

.Lbranch_80002d42:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002d42
	sb	s6,0(s2)

.Lbranch_80002d50:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002d50
	addi	a1,zero,48
	sb	a1,0(s2)

.Lbranch_80002d62:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002d62
	addi	a1,zero,120
	sb	a1,0(s2)
	auipc	ra,0xffffd
	jalr	ra,752(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_80002d7c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002d7c
	sb	s6,0(s2)

.Lbranch_80002d8a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002d8a
	addi	a0,zero,118
	sb	a0,0(s2)

.Lbranch_80002d9c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002d9c
	sb	s3,0(s2)
	c.mv	a0,s1
	auipc	ra,0xffffd
	jalr	ra,696(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_80002db4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002db4
	sb	s6,0(s2)

.Lbranch_80002dc2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002dc2
	addi	a0,zero,100
	sb	a0,0(s2)

.Lbranch_80002dd4:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002dd4
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_80002de6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002de6
	addi	a0,zero,118
	sb	a0,0(s2)

.Lbranch_80002df8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002df8
	addi	a0,zero,105
	sb	a0,0(s2)

.Lbranch_80002e0a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002e0a
	addi	a0,zero,100
	sb	a0,0(s2)

.Lbranch_80002e1c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002e1c
	sb	s3,0(s2)
	c.mv	a0,s7
	auipc	ra,0xffffd
	jalr	ra,568(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_80002e34:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002e34
	sb	s6,0(s2)

.Lbranch_80002e42:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002e42
	addi	a0,zero,115
	sb	a0,0(s2)

.Lbranch_80002e54:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002e54
	addi	a0,zero,116
	sb	a0,0(s2)

.Lbranch_80002e66:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002e66
	sb	s3,0(s2)
	c.mv	a0,s5
	auipc	ra,0xffffd
	jalr	ra,494(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_80002e7e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002e7e
	sb	s6,0(s2)

.Lbranch_80002e8c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002e8c
	addi	a0,zero,105
	sb	a0,0(s2)

.Lbranch_80002e9e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002e9e
	addi	a0,zero,110
	sb	a0,0(s2)

.Lbranch_80002eb0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002eb0
	addi	a0,zero,116
	sb	a0,0(s2)

.Lbranch_80002ec2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002ec2
	sb	s3,0(s2)
	c.mv	a0,s4
	auipc	ra,0xffffd
	jalr	ra,402(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_80002eda:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002eda
	sb	s11,0(s2)
	c.j	 .Lbranch_80002cee
	c.li	a0,0

.Lbranch_80002eec:
	lui	a1,0x80013
	addi	a1,a1,952	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.55
	c.add	a1,a0
	lbu	a1,0(a1)

.Lbranch_80002efa:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002efa
	c.addi	a0,1
	sb	a1,0(s2)
	c.li	a1,18
	bne	a0,a1, .Lbranch_80002eec
	lw	a0,-112(s0)
	lui	a1,0x100
	c.sw	a0,0(a1)
	lw	a0,-104(s0)
	bne	a0,zero, .Lbranch_80003468
	c.j	 .Lbranch_80003388

.Lbranch_80002f24:
	c.li	a0,0
	lw	s9,-116(s0)

.Lbranch_80002f2a:
	lui	a1,0x80013
	addi	a1,a1,868	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.50
	c.add	a1,a0
	lbu	a1,0(a1)

.Lbranch_80002f38:
	lbu	a2,5(s8)
	andi	a2,a2,32
	c.beqz	a2, .Lbranch_80002f38
	c.addi	a0,1
	sb	a1,0(s2)
	c.li	a1,17
	bne	a0,a1, .Lbranch_80002f2a
	auipc	ra,0x4
	jalr	ra,-1318(ra)	# _ZN11homebrew_os12virtio_input21get_virtio_input_base17h6be0520dd895412cE
	auipc	ra,0xffffd
	jalr	ra,270(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_80002f5e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80002f5e
	c.li	s1,0
	sb	s11,0(s2)
	c.li	s4,1
	c.j	 .Lbranch_80002f7e

.Lbranch_80002f72:
	andi	a0,s4,1
	c.li	s1,1
	c.li	s4,0
	beq	a0,zero, .Lbranch_80003224

.Lbranch_80002f7e:
	addi	a0,s0,-64
	c.mv	a1,s1
	auipc	ra,0x4
	jalr	ra,-1528(ra)	# _ZN11homebrew_os12virtio_input21get_device_debug_info17hc1251cc8b7a6264dE
	lw	a0,-64(s0)
	c.beqz	a0, .Lbranch_80002f72
	lw	a0,-60(s0)
	lhu	s5,-56(s0)
	lhu	s7,-54(s0)

.Lbranch_80002f9e:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002f9e
	sb	s6,0(s2)

.Lbranch_80002fac:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002fac
	sb	s6,0(s2)

.Lbranch_80002fba:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002fba
	addi	a1,zero,68
	sb	a1,0(s2)

.Lbranch_80002fcc:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002fcc
	addi	a1,zero,101
	sb	a1,0(s2)

.Lbranch_80002fde:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002fde
	addi	a1,zero,118
	sb	a1,0(s2)

.Lbranch_80002ff0:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80002ff0
	ori	a1,s1,48
	sb	a1,0(s2)

.Lbranch_80003002:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80003002
	sb	s6,0(s2)

.Lbranch_80003010:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80003010
	addi	a1,zero,48
	sb	a1,0(s2)

.Lbranch_80003022:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80003022
	addi	a1,zero,120
	sb	a1,0(s2)
	auipc	ra,0xffffd
	jalr	ra,48(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_8000303c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000303c
	sb	s6,0(s2)

.Lbranch_8000304a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000304a
	addi	a0,zero,117
	sb	a0,0(s2)

.Lbranch_8000305c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000305c
	addi	a0,zero,115
	sb	a0,0(s2)

.Lbranch_8000306e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000306e
	addi	a0,zero,101
	sb	a0,0(s2)

.Lbranch_80003080:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80003080
	addi	a0,zero,100
	sb	a0,0(s2)

.Lbranch_80003092:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80003092
	sb	s3,0(s2)

.Lbranch_800030a0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800030a0
	srli	a0,s7,0xc
	bltu	a0,s11, .Lbranch_800030b8
	addi	a0,a0,55
	c.j	 .Lbranch_800030bc

.Lbranch_800030b8:
	addi	a0,a0,48

.Lbranch_800030bc:
	sb	a0,0(s2)

.Lbranch_800030c0:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800030c0
	slli	a0,s7,0x14
	c.srli	a0,0x1c
	bltu	a0,s11, .Lbranch_800030da
	addi	a0,a0,55
	c.j	 .Lbranch_800030de

.Lbranch_800030da:
	addi	a0,a0,48

.Lbranch_800030de:
	sb	a0,0(s2)

.Lbranch_800030e2:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800030e2
	andi	a0,s7,255
	srli	a1,a0,0x4
	addi	a2,zero,160
	bltu	a0,a2, .Lbranch_80003102
	addi	a1,a1,55
	c.j	 .Lbranch_80003106

.Lbranch_80003102:
	addi	a1,a1,48

.Lbranch_80003106:
	sb	a1,0(s2)

.Lbranch_8000310a:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000310a
	c.andi	a0,15
	bltu	a0,s11, .Lbranch_80003120
	addi	a0,a0,55
	c.j	 .Lbranch_80003124

.Lbranch_80003120:
	addi	a0,a0,48

.Lbranch_80003124:
	sb	a0,0(s2)

.Lbranch_80003128:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80003128
	sb	s6,0(s2)

.Lbranch_80003136:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80003136
	addi	a0,zero,108
	sb	a0,0(s2)

.Lbranch_80003148:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80003148
	addi	a0,zero,97
	sb	a0,0(s2)

.Lbranch_8000315a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000315a
	addi	a0,zero,115
	sb	a0,0(s2)

.Lbranch_8000316c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000316c
	addi	a0,zero,116
	sb	a0,0(s2)

.Lbranch_8000317e:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000317e
	sb	s3,0(s2)

.Lbranch_8000318c:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000318c
	srli	a0,s5,0xc
	bltu	a0,s11, .Lbranch_800031a4
	addi	a0,a0,55
	c.j	 .Lbranch_800031a8

.Lbranch_800031a4:
	addi	a0,a0,48

.Lbranch_800031a8:
	sb	a0,0(s2)

.Lbranch_800031ac:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800031ac
	slli	a0,s5,0x14
	c.srli	a0,0x1c
	bltu	a0,s11, .Lbranch_800031c6
	addi	a0,a0,55
	c.j	 .Lbranch_800031ca

.Lbranch_800031c6:
	addi	a0,a0,48

.Lbranch_800031ca:
	sb	a0,0(s2)

.Lbranch_800031ce:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800031ce
	andi	a0,s5,255
	srli	a1,a0,0x4
	addi	a2,zero,160
	bltu	a0,a2, .Lbranch_800031ee
	addi	a1,a1,55
	c.j	 .Lbranch_800031f2

.Lbranch_800031ee:
	addi	a1,a1,48

.Lbranch_800031f2:
	sb	a1,0(s2)

.Lbranch_800031f6:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800031f6
	c.andi	a0,15
	bltu	a0,s11, .Lbranch_8000320c
	addi	a0,a0,55
	c.j	 .Lbranch_80003210

.Lbranch_8000320c:
	addi	a0,a0,48

.Lbranch_80003210:
	sb	a0,0(s2)

.Lbranch_80003214:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80003214
	sb	s11,0(s2)
	c.j	 .Lbranch_80002f72

.Lbranch_80003224:
	auipc	ra,0x3
	jalr	ra,1324(ra)	# _ZN11homebrew_os12virtio_input18get_mouse_position17hde71303e6559bc97E
	c.mv	s1,a1

.Lbranch_8000322e:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000322e
	sb	s6,0(s2)

.Lbranch_8000323c:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000323c
	sb	s6,0(s2)

.Lbranch_8000324a:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000324a
	addi	a1,zero,77
	sb	a1,0(s2)

.Lbranch_8000325c:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000325c
	addi	a1,zero,111
	sb	a1,0(s2)

.Lbranch_8000326e:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000326e
	addi	a1,zero,117
	sb	a1,0(s2)

.Lbranch_80003280:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80003280
	addi	a1,zero,115
	sb	a1,0(s2)

.Lbranch_80003292:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_80003292
	addi	a1,zero,101
	sb	a1,0(s2)

.Lbranch_800032a4:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800032a4
	addi	a1,zero,58
	sb	a1,0(s2)

.Lbranch_800032b6:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_800032b6
	sb	s6,0(s2)
	auipc	ra,0xffffd
	jalr	ra,-608(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_800032cc:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800032cc
	addi	a0,zero,44
	sb	a0,0(s2)
	c.mv	a0,s1
	auipc	ra,0xffffd
	jalr	ra,-636(ra)	# _ZN13homebrew_qemu13print_hex_u3217hf92fc475dbd09ff1E

.Lbranch_800032e8:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800032e8
	sb	s11,0(s2)

.Lbranch_800032f6:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_800032f6
	addi	a0,zero,62
	sb	a0,0(s2)

.Lbranch_80003308:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80003308

.Lbranch_80003312:
	sb	s6,0(s2)
	lw	a0,-104(s0)
	c.beqz	a0, .Lbranch_80003388
	c.j	 .Lbranch_80003468
	addi	a0,zero,50
	c.j	 .Lbranch_8000334c
	addi	a0,zero,51
	c.j	 .Lbranch_8000334c
	addi	a0,zero,52
	c.j	 .Lbranch_8000334c
	addi	a0,zero,53
	c.j	 .Lbranch_8000334c
	addi	a0,zero,54
	c.j	 .Lbranch_8000334c
	addi	a0,zero,55
	c.j	 .Lbranch_8000334c
	addi	a0,zero,56
	c.j	 .Lbranch_8000334c

.Lbranch_80003348:
	addi	a0,zero,63

.Lbranch_8000334c:
	lbu	a1,5(s8)
	andi	a1,a1,32
	c.beqz	a1, .Lbranch_8000334c
	sb	a0,0(s2)

.Lbranch_8000335a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000335a
	sb	s11,0(s2)

.Lbranch_80003368:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_80003368
	addi	a0,zero,62
	sb	a0,0(s2)

.Lbranch_8000337a:
	lbu	a0,5(s8)
	andi	a0,a0,32
	c.beqz	a0, .Lbranch_8000337a

.Lbranch_80003384:
	sb	s6,0(s2)

.Lbranch_80003388:
	auipc	ra,0x2
	jalr	ra,-1924(ra)	# _ZN11homebrew_os11demos_basic16get_current_page17h158bb443700df5ddE
	c.mv	s4,a0
	c.li	a0,5
	bltu	s4,a0, .Lbranch_8000341a
	lui	a0,0x80015
	addi	a0,a0,420	# _ZN11homebrew_os8hardware17riscv_clint_timer17RISCV_CLINT_TIMER17h1d86eac2e9802949E
	auipc	ra,0x3
	jalr	ra,1740(ra)	# _ZN11homebrew_os8hardware17riscv_clint_timer15RiscvClintTimer10get_cycles17h71c4e1bf1225940fE
	addi	a5,zero,50
	mul	a2,a1,a5
	mulhu	a3,a0,a5
	mulhu	a4,a1,a5
	add	a1,a3,a2
	sltu	a2,a1,a3
	sltu	a3,zero,a4
	c.or	a2,a3
	bne	a2,zero, .Lbranch_800034d6
	mul	a0,a0,a5
	lui	a2,0x80022
	lw	a2,0(a2)	# _ZN13homebrew_qemu9rust_main10LAST_FRAME17heeea9d8509e68fa4E.0
	c.srli	a0,0x16
	c.slli	a1,0xa
	or	s1,a0,a1
	beq	a2,s1, .Lbranch_8000341a
	lui	a0,0x80022
	sw	s1,0(a0)	# _ZN13homebrew_qemu9rust_main10LAST_FRAME17heeea9d8509e68fa4E.0
	addi	a0,s0,-96
	addi	a2,zero,1080
	addi	a3,zero,720
	c.mv	a1,s9
	auipc	ra,0x2
	jalr	ra,-800(ra)	# _ZN11homebrew_os8showcase17Rgb565Framebuffer3new17hff84c3e3b6b7d648E
	addi	a0,s0,-96
	lui	a1,0x80013
	addi	a1,a1,496	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.39
	c.mv	a2,s4
	c.mv	a3,s1
	c.mv	a4,s1
	auipc	ra,0x0
	jalr	ra,746(ra)	# _ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E

.Lbranch_8000341a:
	lw	a0,-108(s0)
	c.bnez	a0, .Lbranch_80003468
	auipc	ra,0x3
	jalr	ra,816(ra)	# _ZN11homebrew_os12virtio_input18get_mouse_position17hde71303e6559bc97E
	c.mv	s1,a0
	c.mv	s4,a1
	lui	a1,0x80021
	lw	a0,1392(a1)	# .L_MergedGlobals
	lui	s7,0x80021
	addi	s5,a1,1392
	bne	a0,s1, .Lbranch_80003448
	lw	a0,4(s5)
	beq	a0,s4, .Lbranch_80003468

.Lbranch_80003448:
	addi	a1,zero,1080
	addi	a2,zero,720
	c.mv	a0,s9
	c.li	a3,0
	c.mv	a4,s1
	c.mv	a5,s4
	auipc	ra,0x8
	jalr	ra,-128(ra)	# _ZN11homebrew_os11framebuffer17draw_mouse_cursor17hd217d6df565dbfcdE
	sw	s1,1392(s7)	# .L_MergedGlobals
	sw	s4,4(s5)

.Lbranch_80003468:
	addi	a0,zero,100

.Lbranch_8000346c:
	c.addi	zero,0
	c.addi	a0,-1
	c.bnez	a0, .Lbranch_8000346c
	jal	zero, .Lbranch_800025be

.Lbranch_80003476:
	lui	a0,0x80013
	addi	a0,a0,-88	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.26
	lui	a3,0x80013
	addi	a3,a3,888	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.51

.Lbranch_80003486:
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0xe
	jalr	ra,-36(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80003494:
	lui	a0,0x80013
	addi	a0,a0,904	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.52
	auipc	ra,0xe
	jalr	ra,-240(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_800034a4:
	lui	a0,0x80013
	addi	a0,a0,920	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.53
	auipc	ra,0xe
	jalr	ra,-256(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_800034b4:
	lui	a0,0x80013
	addi	a0,a0,936	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.54
	auipc	ra,0xe
	jalr	ra,-272(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_800034c4:
	lui	a0,0x80013
	addi	a0,a0,-88	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.26
	lui	a3,0x80013
	addi	a3,a3,176	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.30
	c.j	 .Lbranch_80003486

.Lbranch_800034d6:
	lui	a0,0x80013
	addi	a0,a0,972	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.56
	auipc	ra,0xe
	jalr	ra,-274(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E
	lui	a0,0x80013
	addi	a0,a0,832	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.48
	auipc	ra,0xe
	jalr	ra,-322(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl _RNvCs5QKde7ScR4H_7___rustc26___rust_alloc_error_handler
_RNvCs5QKde7ScR4H_7___rustc26___rust_alloc_error_handler:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	auipc	t1,0xb
	jalr	zero,-530(t1)	# _RNvCs5QKde7ScR4H_7___rustc25___rdl_alloc_error_handler
	# ... (zero-filled gap)

	.globl _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
_RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

	.globl _ZN11homebrew_os11demos_basic11draw_page_017h6cf67fab481da020E
_ZN11homebrew_os11demos_basic11draw_page_017h6cf67fab481da020E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.addi4spn	s0,sp,32
	c.mv	s2,a1
	c.lw	a1,24(a1)
	c.mv	s3,a0
	c.jalr	a1
	lw	a6,20(s2)
	c.mv	s1,a0
	lui	a0,0x224
	addi	a5,a0,1194	# .Lline_table_start1+0x1d8355
	addi	a4,zero,40
	c.mv	a0,s3
	c.li	a1,0
	c.li	a2,0
	c.mv	a3,s1
	c.jalr	a6
	lui	a0,0x80022
	lw	a0,4(a0)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.li	a1,7
	bltu	a1,a0, .Lbranch_80003570
	c.slli	a0,0x2
	lui	a1,0x80014
	addi	a1,a1,956	# .Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.9
	c.add	a0,a1
	c.lw	a3,0(a0)
	c.j	 .Lbranch_80003578

.Lbranch_80003570:
	lui	a3,0x80014
	addi	a3,a3,64	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137+0x74

.Lbranch_80003578:
	addi	a1,s1,-120
	bge	a1,s1, .Lbranch_800036ea
	lw	a5,32(s2)
	sw	a5,-24(s0)
	lui	s1,0x1000
	c.li	a2,12
	addi	a5,s1,-1	# .Lline_table_start1+0xfb3eaa
	c.li	a4,8
	c.mv	a0,s3
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1072	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.0
	addi	a5,s1,-256
	c.li	a1,20
	addi	a2,zero,60
	c.li	a4,24
	c.mv	a0,s3
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1096	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.1
	c.lui	s1,0x10
	c.li	a1,20
	addi	a2,zero,90
	addi	s2,s1,-1	# .Lline_table_start0+0x1fa1
	c.li	a4,21
	c.mv	a0,s3
	c.mv	a5,s2
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1120	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.2
	addi	s1,s1,-256
	c.li	a1,20
	addi	a2,zero,120
	c.li	a4,26
	c.mv	a0,s3
	c.mv	a5,s1
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1148	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.3
	c.li	a1,20
	addi	a2,zero,150
	c.li	a4,26
	c.mv	a0,s3
	c.mv	a5,s1
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1176	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.4
	c.li	a1,20
	addi	a2,zero,180
	c.li	a4,10
	c.mv	a0,s3
	c.mv	a5,s1
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1188	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.5
	c.li	a1,20
	addi	a2,zero,220
	c.li	a4,22
	c.mv	a0,s3
	c.mv	a5,s2
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1212	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.6
	lui	a0,0xff9
	c.li	a1,20
	addi	a2,zero,250
	addi	s1,a0,-2048	# .Lline_table_start1+0xfac6ab
	c.li	a4,30
	c.mv	a0,s3
	c.mv	a5,s1
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1244	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.7
	c.li	a1,20
	addi	a2,zero,280
	c.li	a4,2
	c.mv	a0,s3
	c.mv	a5,s1
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1248	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.8
	lui	s2,0xaab
	c.li	a1,20
	addi	a2,zero,320
	addi	s1,s2,-1366	# .Lline_table_start1+0xa5e955
	addi	a4,zero,51
	c.mv	a0,s3
	c.mv	a5,s1
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1300	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.9
	c.li	a1,20
	addi	a2,zero,350
	addi	a4,zero,36
	c.mv	a0,s3
	c.mv	a5,s1
	lw	t1,-24(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1336	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.10
	addi	a5,s2,-1400
	c.li	a1,20
	addi	a2,zero,420
	addi	a4,zero,60
	c.mv	a0,s3
	lw	t1,-24(s0)
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.addi16sp	sp,32
	c.jr	t1

.Lbranch_800036ea:
	lui	a0,0x80014
	addi	a0,a0,120	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.152
	auipc	ra,0xe
	jalr	ra,-742(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E
_ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E:
	c.addi16sp	sp,-448
	sw	ra,444(sp)
	sw	s0,440(sp)
	sw	s1,436(sp)
	sw	s2,432(sp)
	sw	s3,428(sp)
	sw	s4,424(sp)
	sw	s5,420(sp)
	sw	s6,416(sp)
	sw	s7,412(sp)
	sw	s8,408(sp)
	sw	s9,404(sp)
	sw	s10,400(sp)
	sw	s11,396(sp)
	c.addi4spn	s0,sp,448
	c.mv	s1,a2
	c.mv	s4,a1
	c.li	a1,4
	c.mv	s8,a0
	sw	a0,-424(s0)
	c.li	a0,5
	blt	a1,a2, .Lbranch_800037aa
	bgeu	s1,a0, .Lbranch_80003942
	lw	a2,16(s4)
	c.lui	a0,0x1
	addi	a1,a0,290	# .Lline_table_start0+0x1122
	c.mv	a0,s8
	c.jalr	a2
	c.slli	s1,0x2
	lui	a0,0x80013
	addi	a0,a0,988	# .LJTI2_0
	c.add	a0,s1
	c.lw	a0,0(a0)
	c.jr	a0
	lw	a1,24(s4)
	c.mv	a0,s8
	c.jalr	a1
	lw	a6,20(s4)
	c.mv	s1,a0
	lui	a0,0x224
	addi	a5,a0,1194	# .Lline_table_start1+0x1d8355
	addi	a4,zero,40
	c.mv	a0,s8
	c.li	a1,0
	c.li	a2,0
	c.mv	a3,s1
	c.jalr	a6
	lui	a0,0x80022
	lw	a0,4(a0)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.li	a1,7
	bltu	a1,a0, .Lbranch_80003ee0
	c.slli	a0,0x2
	lui	a1,0x80014
	addi	a1,a1,956	# .Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.9
	c.add	a0,a1
	c.lw	a3,0(a0)
	c.j	 .Lbranch_80003ee8

.Lbranch_800037aa:
	beq	s1,a0, .Lbranch_800037da
	c.li	a0,6
	beq	s1,a0, .Lbranch_800038d8
	c.li	a0,7
	bne	s1,a0, .Lbranch_80003942
	sw	a3,-416(s0)
	lui	s2,0x80021
	lui	s3,0x80022
	lw	a0,1416(s2)	# _ZN11homebrew_os11demos_basic11draw_page_79LAST_PAGE17h62ac622a16d464f1E.0
	lw	a1,4(s3)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	bne	a0,a1, .Lbranch_80003cce
	lw	s1,32(s4)
	jal	zero, .Lbranch_8000430e

.Lbranch_800037da:
	c.mv	s7,a3
	lw	s1,24(s4)
	c.mv	a0,s8
	c.jalr	s1
	lw	a1,28(s4)
	sw	a0,-416(s0)
	c.mv	a0,s8
	c.jalr	a1
	lui	s2,0x80021
	addi	s2,s2,1400	# .L_MergedGlobals
	lui	s3,0x80022
	lw	a1,8(s2)
	lw	a2,4(s3)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	sw	a0,-420(s0)
	beq	a1,a2, .Lbranch_80004068
	lw	a2,16(s4)
	c.lui	a0,0x1
	addi	a1,a0,290	# .Lline_table_start0+0x1122
	c.mv	a0,s8
	c.jalr	a2
	c.mv	a0,s8
	c.jalr	s1
	lw	s1,20(s4)
	c.mv	s5,a0
	lui	a0,0x224
	addi	a5,a0,1194	# .Lline_table_start1+0x1d8355
	addi	a4,zero,40
	c.mv	a0,s8
	c.li	a1,0
	c.li	a2,0
	c.mv	a3,s5
	c.jalr	s1
	lw	a0,4(s3)
	c.li	a1,7
	bltu	a1,a0, .Lbranch_80003ff6
	c.slli	a0,0x2
	lui	a1,0x80014
	addi	a1,a1,956	# .Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.9
	c.add	a0,a1
	c.lw	a3,0(a0)
	c.j	 .Lbranch_80003ffe
	lw	a1,24(s4)
	c.mv	a0,s8
	c.jalr	a1
	lw	a6,20(s4)
	c.mv	s1,a0
	lui	a0,0x224
	addi	a5,a0,1194	# .Lline_table_start1+0x1d8355
	addi	a4,zero,40
	c.mv	a0,s8
	c.li	a1,0
	c.li	a2,0
	c.mv	a3,s1
	c.jalr	a6
	lui	a0,0x80022
	lw	a0,4(a0)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.li	a1,7
	bltu	a1,a0, .Lbranch_800039d4
	c.slli	a0,0x2
	lui	a1,0x80014
	addi	a1,a1,956	# .Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.9
	c.add	a0,a1
	c.lw	a3,0(a0)
	c.j	 .Lbranch_800039dc
	lw	a1,24(s4)
	c.mv	a0,s8
	c.jalr	a1
	lw	a6,20(s4)
	c.mv	s1,a0
	lui	a0,0x224
	addi	a5,a0,1194	# .Lline_table_start1+0x1d8355
	addi	a4,zero,40
	c.mv	a0,s8
	c.li	a1,0
	c.li	a2,0
	c.mv	a3,s1
	c.jalr	a6
	lui	a0,0x80022
	lw	a0,4(a0)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.li	a1,7
	bltu	a1,a0, .Lbranch_80003b30
	c.slli	a0,0x2
	lui	a1,0x80014
	addi	a1,a1,956	# .Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.9
	c.add	a0,a1
	c.lw	a3,0(a0)
	c.j	 .Lbranch_80003b38

.Lbranch_800038d8:
	c.mv	s5,a4
	lw	s1,24(s4)
	c.mv	a0,s8
	c.jalr	s1
	lui	s2,0x80021
	lui	s6,0x80022
	lw	a1,1412(s2)	# _ZN11homebrew_os11demos_basic11draw_page_69LAST_PAGE17h0ccb8873bbf7525cE.0
	lw	a2,4(s6)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.mv	s3,a0
	beq	a1,a2, .Lbranch_800047b8
	lw	a2,16(s4)
	c.lui	a0,0x1
	addi	a1,a0,290	# .Lline_table_start0+0x1122
	c.mv	a0,s8
	c.jalr	a2
	c.mv	a0,s8
	c.jalr	s1
	lw	a6,20(s4)
	c.mv	s1,a0
	lui	a0,0x224
	addi	a5,a0,1194	# .Lline_table_start1+0x1d8355
	addi	a4,zero,40
	c.mv	a0,s8
	c.li	a1,0
	c.li	a2,0
	c.mv	a3,s1
	c.jalr	a6
	lw	a0,4(s6)
	c.li	a1,7
	bltu	a1,a0, .Lbranch_8000474a
	c.slli	a0,0x2
	lui	a1,0x80014
	addi	a1,a1,956	# .Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.9
	c.add	a0,a1
	c.lw	a3,0(a0)
	jal	zero, .Lbranch_80004752

.Lbranch_80003942:
	lw	a2,16(s4)
	c.lui	a0,0x1
	addi	a1,a0,290	# .Lline_table_start0+0x1122
	c.mv	a0,s8
	c.jalr	a2
	c.mv	a0,s8
	c.mv	a1,s4
	lw	ra,444(sp)
	lw	s0,440(sp)
	lw	s1,436(sp)
	lw	s2,432(sp)
	lw	s3,428(sp)
	lw	s4,424(sp)
	lw	s5,420(sp)
	lw	s6,416(sp)
	lw	s7,412(sp)
	lw	s8,408(sp)
	lw	s9,404(sp)
	lw	s10,400(sp)
	lw	s11,396(sp)
	c.addi16sp	sp,448
	auipc	t1,0x0
	jalr	zero,-1130(t1)	# _ZN11homebrew_os11demos_basic11draw_page_017h6cf67fab481da020E
	lw	a1,24(s4)
	c.mv	a0,s8
	c.jalr	a1
	lw	a6,20(s4)
	c.mv	s1,a0
	lui	a0,0x224
	addi	a5,a0,1194	# .Lline_table_start1+0x1d8355
	addi	a4,zero,40
	c.mv	a0,s8
	c.li	a1,0
	c.li	a2,0
	c.mv	a3,s1
	c.jalr	a6
	lui	a0,0x80022
	lw	a0,4(a0)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.li	a1,7
	bltu	a1,a0, .Lbranch_80003d1a
	c.slli	a0,0x2
	lui	a1,0x80014
	addi	a1,a1,956	# .Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.9
	c.add	a0,a1
	c.lw	a3,0(a0)
	c.j	 .Lbranch_80003d22

.Lbranch_800039d4:
	lui	a3,0x80014
	addi	a3,a3,64	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137+0x74

.Lbranch_800039dc:
	addi	a1,s1,-120
	blt	a1,s1, .Lbranch_800039e8
	jal	zero, .Lbranch_80004bf2

.Lbranch_800039e8:
	lw	a5,32(s4)
	sw	a5,-416(s0)
	lui	s1,0x1000
	c.li	a2,12
	c.addi	s1,-1	# .Lline_table_start1+0xfb3eaa
	c.li	a4,8
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1604	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.73
	c.lui	s2,0x10
	c.li	a1,20
	addi	a2,zero,70
	c.addi	s2,-1	# .Lline_table_start0+0x1fa1
	c.li	a4,18
	c.mv	a0,s8
	c.mv	a5,s2
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1584	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.74
	c.li	a1,20
	addi	a2,zero,100
	addi	a4,zero,33
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1548	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.75
	c.li	a1,20
	addi	a2,zero,130
	c.li	a4,30
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,-748	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x14c
	c.li	a1,20
	addi	a2,zero,160
	addi	a4,zero,32
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1516	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.77
	c.li	a1,20
	addi	a2,zero,200
	c.li	a4,15
	c.mv	a0,s8
	c.mv	a5,s2
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1500	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.78
	c.li	a1,20
	addi	a2,zero,230
	addi	a4,zero,35
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1464	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.79
	c.li	a1,20
	addi	a2,zero,260
	addi	a4,zero,41
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1420	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.80
	c.li	a1,20
	addi	a2,zero,290
	addi	a4,zero,45
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1372	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.81
	c.li	a1,20
	addi	a2,zero,330
	c.li	a4,13
	c.mv	a0,s8
	c.mv	a5,s2
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1356	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.82
	c.li	a1,20
	addi	a2,zero,360
	addi	a4,zero,33
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1320	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.83
	c.li	a1,20
	addi	a2,zero,390
	addi	a4,zero,38
	c.mv	a0,s8
	c.mv	a5,s1
	c.j	 .Lbranch_80003cb0

.Lbranch_80003b30:
	lui	a3,0x80014
	addi	a3,a3,64	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137+0x74

.Lbranch_80003b38:
	addi	a1,s1,-120
	blt	a1,s1, .Lbranch_80003b44
	jal	zero, .Lbranch_80004bf2

.Lbranch_80003b44:
	lw	a5,32(s4)
	sw	a5,-416(s0)
	lui	s4,0x1000
	c.li	a2,12
	addi	s1,s4,-1	# .Lline_table_start1+0xfb3eaa
	c.li	a4,8
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1672	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.47
	c.lui	s2,0x10
	c.li	a1,20
	addi	a2,zero,70
	c.addi	s2,-1	# .Lline_table_start0+0x1fa1
	c.li	a4,18
	c.mv	a0,s8
	c.mv	a5,s2
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1692	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.48
	c.li	a1,20
	addi	a2,zero,100
	addi	a4,zero,44
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1736	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.49
	c.li	a1,20
	addi	a2,zero,130
	addi	a4,zero,40
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1776	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.50
	c.li	a1,20
	addi	a2,zero,160
	addi	a4,zero,36
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1956	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x90
	c.li	a1,20
	addi	a2,zero,200
	c.li	a4,16
	c.mv	a0,s8
	c.mv	a5,s2
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1988	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.52
	c.li	a1,20
	addi	a2,zero,230
	addi	a4,zero,39
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,2028	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.53
	c.li	a1,20
	addi	a2,zero,260
	addi	a4,zero,38
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-2028	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.54
	c.li	a1,20
	addi	a2,zero,290
	addi	a4,zero,44
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1984	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.55
	c.li	a1,20
	addi	a2,zero,330
	c.li	a4,21
	c.mv	a0,s8
	c.mv	a5,s2
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1960	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.56
	lui	a0,0x890
	c.li	a1,20
	addi	a2,zero,360
	addi	a5,a0,-120	# .Lline_table_start1+0x843e33
	addi	a4,zero,41
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1916	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.57
	c.li	a1,20
	addi	a2,zero,390
	c.li	a4,31
	c.mv	a0,s8
	c.mv	a5,s2
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1884	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.58
	addi	a5,s4,-120
	c.li	a1,20
	addi	a2,zero,420
	addi	a4,zero,37
	c.mv	a0,s8

.Lbranch_80003cb0:
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1844	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.59
	lui	a0,0xaab
	c.li	a1,20
	addi	a2,zero,440
	addi	a5,a0,-1400	# .Lline_table_start1+0xa5e933
	c.j	 .Lbranch_80003ed8

.Lbranch_80003cce:
	lw	a2,16(s4)
	c.lui	a0,0x1
	addi	a1,a0,290	# .Lline_table_start0+0x1122
	c.mv	a0,s8
	c.jalr	a2
	lw	a1,24(s4)
	c.mv	a0,s8
	c.jalr	a1
	lw	a6,20(s4)
	c.mv	s1,a0
	lui	a0,0x224
	addi	a5,a0,1194	# .Lline_table_start1+0x1d8355
	addi	a4,zero,40
	c.mv	a0,s8
	c.li	a1,0
	c.li	a2,0
	c.mv	a3,s1
	c.jalr	a6
	lw	a0,4(s3)
	c.li	a1,7
	bltu	a1,a0, .Lbranch_800042aa
	c.slli	a0,0x2
	lui	a1,0x80014
	addi	a1,a1,956	# .Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.9
	c.add	a0,a1
	c.lw	a3,0(a0)
	c.j	 .Lbranch_800042b2

.Lbranch_80003d1a:
	lui	a3,0x80014
	addi	a3,a3,64	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137+0x74

.Lbranch_80003d22:
	addi	a1,s1,-120
	bge	a1,s1, .Lbranch_80004bf2
	lw	a5,32(s4)
	sw	a5,-416(s0)
	lui	s2,0x1000
	c.li	a2,12
	addi	s1,s2,-1	# .Lline_table_start1+0xfb3eaa
	c.li	a4,8
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1820	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.60
	c.li	a1,20
	addi	a2,zero,70
	c.li	a4,28
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1792	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.61
	c.li	a1,20
	addi	a2,zero,100
	c.li	a4,15
	lui	a5,0xff0
	lui	s3,0xff0
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1776	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.62
	c.lui	s4,0x10
	c.li	a1,20
	addi	a2,zero,130
	addi	a5,s4,-256	# .Lline_table_start0+0x1ea2
	c.li	a4,17
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1908	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x60
	c.li	a1,20
	addi	a2,zero,160
	c.li	a4,16
	addi	a5,zero,255
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1756	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.64
	addi	a5,s2,-256
	c.li	a1,20
	addi	a2,zero,190
	c.li	a4,18
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1828	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x10
	addi	a5,s4,-1
	c.li	a1,20
	addi	a2,zero,220
	c.li	a4,16
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1736	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.66
	addi	a5,s3,255	# .Lline_table_start1+0xfa3faa
	c.li	a1,20
	addi	a2,zero,250
	c.li	a4,19
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1716	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.67
	lui	a0,0xff9
	c.li	a1,20
	addi	a2,zero,280
	addi	a5,a0,-2048	# .Lline_table_start1+0xfac6ab
	c.li	a4,18
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1696	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.68
	lui	a0,0x880
	c.li	a1,20
	addi	a2,zero,310
	addi	a5,a0,255	# .Lline_table_start1+0x833faa
	c.li	a4,18
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1676	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.69
	addi	a1,zero,350
	addi	a2,zero,100
	c.li	a4,10
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1664	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.70
	addi	a1,zero,350
	addi	a2,zero,130
	c.li	a4,14
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1648	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.71
	addi	a1,zero,350
	addi	a2,zero,160
	c.li	a4,7
	c.mv	a0,s8
	c.mv	a5,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1640	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.72
	lui	s1,0xaab
	c.li	a1,20
	addi	a2,zero,360
	addi	a5,s1,-1281	# .Lline_table_start1+0xa5e9aa
	addi	a4,zero,36
	c.mv	a0,s8
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80014
	addi	a3,a3,-1844	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.59
	addi	a5,s1,-1400
	c.li	a1,20
	addi	a2,zero,440

.Lbranch_80003ed8:
	c.li	a4,22
	c.mv	a0,s8
	jal	zero, .Lbranch_80004ae6

.Lbranch_80003ee0:
	lui	a3,0x80014
	addi	a3,a3,64	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137+0x74

.Lbranch_80003ee8:
	addi	a1,s1,-120
	bge	a1,s1, .Lbranch_80004bf2
	sw	s4,-432(s0)
	lw	t1,32(s4)
	lui	a5,0x1000
	c.li	a2,12
	c.addi	a5,-1	# .Lline_table_start1+0xfb3eaa
	c.li	a4,8
	c.mv	a0,s8
	sw	t1,-416(s0)
	c.jalr	t1
	c.li	s1,0
	addi	s2,zero,88
	lui	s5,0x80013
	addi	s5,s5,1668	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.46
	c.li	s6,15
	lui	a0,0x889
	c.li	s7,16
	lui	s8,0x80013
	addi	s8,s8,1008	# .LJTI2_1
	lui	s10,0x80013
	addi	s10,s10,1648	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.41
	lui	s11,0x80013
	addi	s11,s11,1652	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.42
	lui	s9,0x80013
	addi	s9,s9,1656	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.43
	addi	s4,a0,-1912	# .Lline_table_start1+0x83c733
	lui	s3,0x80013
	addi	s3,s3,1660	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.44
	c.j	 .Lbranch_80003f6c
	c.mv	a3,s3

.Lbranch_80003f50:
	c.addi	s1,1
	addi	a2,zero,90
	c.li	a4,1
	lw	a0,-424(s0)
	c.mv	a1,s2
	c.mv	a5,s4
	lw	t1,-416(s0)
	c.jalr	t1
	c.addi	s2,22
	beq	s1,s7, .Lbranch_800049bc

.Lbranch_80003f6c:
	c.mv	a3,s5
	bltu	s6,s1, .Lbranch_80003f50
	slli	a0,s1,0x2
	c.add	a0,s8
	c.lw	a0,0(a0)
	c.jr	a0
	lui	a3,0x80013
	addi	a3,a3,1604	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.30
	c.j	 .Lbranch_80003f50
	c.mv	a3,s10
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1620	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.34
	c.j	 .Lbranch_80003f50
	c.mv	a3,s11
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1640	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.39
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1612	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.32
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1616	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.33
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1632	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.37
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1608	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.31
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1624	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.35
	c.j	 .Lbranch_80003f50
	c.mv	a3,s9
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1628	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.36
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1644	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.40
	c.j	 .Lbranch_80003f50
	lui	a3,0x80013
	addi	a3,a3,1636	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.38
	c.j	 .Lbranch_80003f50

.Lbranch_80003ff6:
	lui	a3,0x80014
	addi	a3,a3,64	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137+0x74

.Lbranch_80003ffe:
	addi	a1,s5,-120
	bge	a1,s5, .Lbranch_80004bf2
	lw	s1,32(s4)
	lui	a5,0x1000
	c.li	a2,12
	c.addi	a5,-1	# .Lline_table_start1+0xfb3eaa
	c.li	a4,8
	c.mv	a0,s8
	c.jalr	s1
	lui	a3,0x80014
	addi	a3,a3,-1280	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.84
	c.lui	a5,0x10
	c.li	a1,20
	addi	a2,zero,70
	c.addi	a5,-1	# .Lline_table_start0+0x1fa1
	c.li	a4,27
	c.mv	a0,s8
	c.jalr	s1
	lui	a3,0x80014
	addi	a3,a3,-1252	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.85
	lui	a0,0xaab
	c.li	a1,20
	addi	a2,zero,460
	addi	a5,a0,-1400	# .Lline_table_start1+0xa5e933
	addi	a4,zero,44
	c.mv	a0,s8
	c.jalr	s1
	lui	a0,0x80022
	lui	a1,0x80021
	lw	a0,4(a0)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.li	a2,-1
	addi	a3,a1,1400	# .L_MergedGlobals
	c.sw	a2,4(a3)
	c.sw	a0,8(a3)
	sw	a2,1400(a1)

.Lbranch_80004068:
	lui	a0,0x91a2b
	addi	a2,zero,1800
	addi	a3,zero,550
	addi	a1,a0,965	# __heap_end+0x1172b3c5
	c.mv	a0,s7
	mulhu	a4,s7,a1
	c.srli	a4,0xa
	mul	a2,a4,a2
	sub	a4,s7,a2
	addi	a5,zero,900
	mul	a2,a4,a3
	sw	s4,-432(s0)
	bgeu	a4,a5, .Lbranch_800040a4
	mulhu	a1,a2,a1
	c.srli	a1,0x9
	addi	s7,a1,50
	c.j	 .Lbranch_800040bc

.Lbranch_800040a4:
	lui	a3,0xfff87
	addi	a3,a3,616	# __heap_end+0x7fc87268
	c.add	a2,a3
	mulhu	a1,a2,a1
	c.srli	a1,0x9
	addi	a2,zero,600
	sub	s7,a2,a1

.Lbranch_800040bc:
	lui	a1,0x88889
	lui	a2,0x889
	addi	a1,a1,-1911	# __heap_end+0x8588889
	mulhu	a1,a0,a1
	c.srli	a1,0x8
	slli	a3,a1,0x9
	c.slli	a1,0x5
	c.sub	a1,a3
	addi	a3,zero,1024
	addi	a2,a2,-1911	# .Lline_table_start1+0x83c734
	c.add	a0,a1
	slli	a1,a0,0xa
	sltiu	a4,a0,240
	mulhu	a0,a1,a2
	addi	a1,a4,-1
	c.sub	a3,a0
	c.slli	a0,0x2
	andi	a1,a1,-2048
	c.add	a0,a1
	lui	a1,0x80021
	mul	a2,a0,a3
	lw	a0,1400(a1)	# .L_MergedGlobals
	c.addi	a4,9
	srl	a2,a2,a4
	addi	a3,zero,250
	mul	a2,a2,a3
	c.srli	a2,0xa
	addi	a2,a2,120
	sw	a2,-436(s0)
	blt	a0,zero, .Lbranch_800041c8
	addi	a1,a1,1400
	c.lw	a1,4(a1)
	blt	a1,zero, .Lbranch_800041c8
	bne	a0,s7, .Lbranch_80004138
	lw	a2,-436(s0)
	beq	a1,a2, .Lbranch_800041c8

.Lbranch_80004138:
	lw	a1,-432(s0)
	lw	s10,12(a1)
	c.li	s3,-4
	c.lui	a1,0x1
	addi	s5,a1,290	# .Lline_table_start0+0x1122
	lui	s9,0x80021
	c.li	s11,4

.Lbranch_8000414e:
	bne	s3,s11, .Lbranch_80004156
	c.li	a1,4
	c.j	 .Lbranch_8000415a

.Lbranch_80004156:
	addi	a1,s3,1

.Lbranch_8000415a:
	sw	a1,-428(s0)
	c.li	s1,-4
	slti	s4,s3,0

.Lbranch_80004164:
	c.li	s6,4
	beq	s1,s6, .Lbranch_8000416e
	addi	s6,s1,1

.Lbranch_8000416e:
	add	a1,a0,s1
	slt	a2,a1,a0
	slti	a3,s1,0
	bne	a3,a2, .Lbranch_80004b72
	lw	a3,4(s2)
	add	a2,a3,s3
	slt	a3,a2,a3
	bne	s4,a3, .Lbranch_80004b82
	lw	a3,-420(s0)
	bgeu	a2,a3, .Lbranch_800041b0
	lw	a3,-416(s0)
	bgeu	a1,a3, .Lbranch_800041b0
	or	a3,a2,a1
	blt	a3,zero, .Lbranch_800041b0
	c.mv	a0,s8
	c.mv	a3,s5
	c.jalr	s10
	lw	a0,1400(s9)	# .L_MergedGlobals

.Lbranch_800041b0:
	beq	s1,s11, .Lbranch_800041ba
	c.mv	s1,s6
	bge	s11,s6, .Lbranch_80004164

.Lbranch_800041ba:
	beq	s3,s11, .Lbranch_800041c8
	lw	a1,-428(s0)
	c.mv	s3,a1
	bge	s11,a1, .Lbranch_8000414e

.Lbranch_800041c8:
	lw	a0,-432(s0)
	c.lw	a0,12(a0)
	sw	a0,-428(s0)
	c.li	s10,-3
	c.li	s5,10
	c.li	s9,3

.Lbranch_800041d8:
	bne	s10,s9, .Lbranch_800041e0
	c.li	a0,3
	c.j	 .Lbranch_800041e4

.Lbranch_800041e0:
	addi	a0,s10,1

.Lbranch_800041e4:
	sw	a0,-432(s0)
	mulh	a0,s10,s10
	mul	s3,s10,s10
	lw	a3,-436(s0)
	add	s1,a3,s10
	slti	a1,s10,0
	c.li	s8,-3
	srai	a2,s3,0x1f
	c.xor	a0,a2
	slt	a2,s1,a3
	xor	s11,a1,a2
	sltu	s4,zero,a0
	slti	s6,s3,0

.Lbranch_80004214:
	c.li	s2,3
	beq	s8,s2, .Lbranch_8000421e
	addi	s2,s8,1

.Lbranch_8000421e:
	mulh	a1,s8,s8
	mul	a0,s8,s8
	srai	a2,a0,0x1f
	bne	a1,a2, .Lbranch_80004b32
	bne	s4,zero, .Lbranch_80004b42
	add	a1,a0,s3
	slt	a0,a1,a0
	bne	s6,a0, .Lbranch_80004b22
	bge	a1,s5, .Lbranch_8000427e
	add	a1,s7,s8
	slt	a0,a1,s7
	slti	a2,s8,0
	bne	a2,a0, .Lbranch_80004b62
	bne	s11,zero, .Lbranch_80004b52
	lw	a0,-416(s0)
	bgeu	a1,a0, .Lbranch_8000427e
	blt	a1,zero, .Lbranch_8000427e
	blt	s1,zero, .Lbranch_8000427e
	lw	a0,-420(s0)
	bgeu	s1,a0, .Lbranch_8000427e
	lui	a3,0xff0
	lw	a0,-424(s0)
	c.mv	a2,s1
	lw	a4,-428(s0)
	c.jalr	a4

.Lbranch_8000427e:
	beq	s8,s9, .Lbranch_80004288
	c.mv	s8,s2
	bge	s9,s2, .Lbranch_80004214

.Lbranch_80004288:
	beq	s10,s9, .Lbranch_80004296
	lw	a0,-432(s0)
	c.mv	s10,a0
	bge	s9,a0, .Lbranch_800041d8

.Lbranch_80004296:
	lui	a0,0x80021
	sw	s7,1400(a0)	# .L_MergedGlobals
	addi	a0,a0,1400
	lw	a1,-436(s0)
	c.sw	a1,4(a0)
	c.j	 .Lbranch_80004960

.Lbranch_800042aa:
	lui	a3,0x80014
	addi	a3,a3,64	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137+0x74

.Lbranch_800042b2:
	addi	a1,s1,-120
	bge	a1,s1, .Lbranch_80004bf2
	lw	s1,32(s4)
	lui	a5,0x1000
	c.li	a2,12
	c.addi	a5,-1	# .Lline_table_start1+0xfb3eaa
	c.li	a4,8
	c.mv	a0,s8
	c.jalr	s1
	lui	a3,0x80014
	addi	a3,a3,-448	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.105
	c.lui	a5,0x10
	c.li	a1,20
	addi	a2,zero,70
	c.addi	a5,-1	# .Lline_table_start0+0x1fa1
	c.li	a4,29
	c.mv	a0,s8
	c.jalr	s1
	lui	a3,0x80014
	addi	a3,a3,-416	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.106
	lui	a0,0xaab
	c.li	a1,20
	addi	a2,zero,480
	addi	a5,a0,-1400	# .Lline_table_start1+0xa5e933
	addi	a4,zero,48
	c.mv	a0,s8
	c.jalr	s1
	lui	a0,0x80022
	lw	a0,4(a0)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	sw	a0,1416(s2)

.Lbranch_8000430e:
	c.mv	s3,s4
	lui	a3,0x80014
	addi	a3,a3,-448	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.105
	c.lui	a5,0x10
	c.li	a1,20
	addi	a2,zero,70
	c.addi	a5,-1	# .Lline_table_start0+0x1fa1
	c.li	a4,29
	c.mv	a0,s8
	c.jalr	s1
	lui	a3,0x80014
	addi	a3,a3,-416	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.106
	lui	a0,0xaab
	c.li	a1,20
	addi	a2,zero,480
	addi	a5,a0,-1400	# .Lline_table_start1+0xa5e933
	addi	a4,zero,48
	c.mv	a0,s8
	sw	s1,-436(s0)
	c.jalr	s1
	lui	a4,0x80013
	addi	a4,a4,-940	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x8c
	addi	a0,zero,32
	lui	s5,0x80013
	addi	s5,s5,-364	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x2cc
	lui	a2,0x80013
	addi	a2,a2,-460	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x26c
	lui	s1,0x80014
	addi	s1,s1,-368	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.110
	addi	s6,zero,38
	lui	t2,0x80013
	addi	t2,t2,-300	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x30c
	lui	a6,0x80013
	addi	a6,a6,-620	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x1cc
	lui	a1,0x80013
	addi	a1,a1,-492	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x24c
	lui	t5,0x80014
	addi	t5,t5,-328	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.115
	lui	t4,0x80013
	addi	t4,t4,-524	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x22c
	lui	t1,0x80013
	addi	t1,t1,-396	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x2ac
	lui	a5,0x80013
	addi	a5,a5,-812	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x10c
	lui	s2,0x80013
	addi	s2,s2,-780	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x12c
	lui	a3,0x80013
	addi	a3,a3,-716	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x16c
	lui	s11,0x80013
	addi	s11,s11,-332	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x2ec
	lui	ra,0x80013
	addi	ra,ra,-588	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x1ec
	lui	s8,0x80013
	addi	s8,s8,-556	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x20c
	lui	s4,0x80013
	addi	s4,s4,-236	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x34c
	lui	s9,0x80013
	addi	s9,s9,-684	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x18c
	lui	t3,0x80013
	addi	t3,t3,-428	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x28c
	lui	t6,0x80013
	addi	t6,t6,-876	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0xcc
	lui	s7,0x80013
	addi	s7,s7,-844	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0xec
	sw	a4,-388(s0)
	lui	s10,0x80014
	addi	s10,s10,-292	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.129
	sw	s5,-380(s0)
	addi	s5,zero,45
	sw	s1,-364(s0)
	lui	t0,0x80013
	addi	t0,t0,-268	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x32c
	sw	a2,-372(s0)
	sw	a0,-368(s0)
	sw	s6,-360(s0)
	lui	a7,0x80014
	addi	a7,a7,-244	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.131
	sw	t2,-356(s0)
	lui	t2,0x80014
	addi	t2,t2,-208	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.132
	sw	a6,-348(s0)
	addi	a6,zero,40
	sw	a1,-332(s0)
	lui	a1,0x80013
	addi	a1,a1,-972	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x6c
	lui	a4,0x80013
	addi	a4,a4,-1036	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x2c
	sw	a4,-324(s0)
	sw	t5,-308(s0)
	addi	a4,zero,35
	sw	a4,-304(s0)
	addi	t5,zero,35
	sw	t4,-300(s0)
	sw	t1,-292(s0)
	addi	t4,zero,42
	sw	a3,-260(s0)
	lui	t1,0x80014
	addi	t1,t1,-88	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.136
	sw	s11,-252(s0)
	addi	s11,zero,33
	sw	ra,-244(s0)
	lui	s1,0x80014
	addi	s1,s1,-52	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137
	sw	s8,-236(s0)
	addi	ra,zero,41
	sw	s4,-220(s0)
	lw	s4,-416(s0)
	srli	a4,s4,0x1
	sw	s9,-212(s0)
	lui	s8,0x30c31
	lw	s6,36(s3)
	sw	t3,-204(s0)
	slli	a3,s4,0x3
	sw	t6,-196(s0)
	addi	t3,zero,336
	sw	a5,-284(s0)
	sw	a5,-188(s0)
	addi	t6,s0,-388
	sw	s7,-172(s0)
	addi	s9,zero,100
	sw	s10,-148(s0)
	addi	s3,zero,-336
	sw	s5,-144(s0)
	sw	t0,-140(s0)
	sw	a7,-132(s0)
	lui	a7,0x890
	sw	t5,-128(s0)
	sw	t2,-124(s0)
	sw	a6,-120(s0)
	sw	a1,-108(s0)
	lui	a6,0x1000
	sw	a2,-340(s0)
	sw	a2,-316(s0)
	sw	a2,-268(s0)
	sw	a2,-228(s0)
	sw	a2,-180(s0)
	sw	a2,-156(s0)
	sw	a2,-116(s0)
	sw	a2,-84(s0)
	lui	a1,0x666
	sw	t1,-76(s0)
	sw	a0,-80(s0)
	sw	s11,-72(s0)
	lui	a2,0x889
	sw	s1,-68(s0)
	c.lui	s1,0x1
	sw	a0,-384(s0)
	sw	a0,-376(s0)
	sw	a0,-352(s0)
	sw	a0,-344(s0)
	sw	a0,-336(s0)
	sw	a0,-328(s0)
	sw	a0,-320(s0)
	sw	a0,-312(s0)
	sw	a0,-296(s0)
	sw	a0,-288(s0)
	sw	a0,-280(s0)
	sw	s2,-276(s0)
	sw	a0,-272(s0)
	sw	a0,-264(s0)
	sw	a0,-256(s0)
	sw	a0,-248(s0)
	sw	a0,-240(s0)
	sw	a0,-232(s0)
	sw	a0,-224(s0)
	sw	a0,-216(s0)
	sw	a0,-208(s0)
	sw	a0,-200(s0)
	sw	a0,-192(s0)
	sw	a0,-184(s0)
	sw	a0,-176(s0)
	sw	a0,-168(s0)
	sw	s2,-164(s0)
	sw	a0,-160(s0)
	sw	a0,-152(s0)
	sw	a0,-136(s0)
	sw	a0,-112(s0)
	sw	a0,-104(s0)
	sw	ra,-64(s0)
	sw	s2,-60(s0)
	sw	a0,-56(s0)
	c.add	a3,t6
	lui	a0,0x80014
	addi	a0,a0,-168	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.134
	sw	a0,-100(s0)
	addi	a0,zero,36
	sw	a0,-96(s0)
	lui	a0,0x80014
	addi	a0,a0,-132	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.135
	sw	a0,-92(s0)
	sw	t4,-88(s0)
	addi	s7,s8,-975	# .Lline_table_start1+0x30be4adc
	mulhu	a0,a4,s7
	c.srli	a0,0x2
	mul	a4,a0,t4
	mul	a0,a0,t3
	lui	a5,0xff9
	addi	s2,a7,-120	# .Lline_table_start1+0x843e33
	sub	s11,s4,a4
	addi	a4,a6,-120	# .Lline_table_start1+0xfb3e33
	sw	a4,-420(s0)
	addi	a1,a1,1638	# .Lline_table_start1+0x61a511
	sw	a1,-432(s0)
	addi	a1,a2,-1912	# .Lline_table_start1+0x83c733
	sw	a1,-428(s0)
	addi	s8,s1,290	# .Lline_table_start0+0x1122
	sub	s4,a3,a0
	addi	s5,s4,4
	addi	a0,a5,-1793	# .Lline_table_start1+0xfac7aa
	sw	a0,-416(s0)
	c.j	 .Lbranch_80004660

.Lbranch_8000463e:
	addi	a1,zero,40
	lw	a0,-424(s0)
	c.mv	a2,s9
	c.mv	a3,s10
	c.mv	a4,s1
	c.mv	a6,s8
	c.jalr	s6
	c.addi	s9,20
	c.addi	s5,8
	c.addi	s11,1
	c.addi	s4,8
	addi	a0,zero,400
	beq	s9,a0, .Lbranch_80004724

.Lbranch_80004660:
	srli	a0,s11,0x1
	mulhu	a0,a0,s7
	c.srli	a0,0x2
	mul	a0,a0,s3
	add	a1,s5,a0
	c.add	a0,s4
	c.lw	s1,0(a1)
	lw	s10,0(a0)
	c.li	a0,8
	bltu	s1,a0, .Lbranch_8000469a
	c.li	a2,8
	lui	a0,0x80014
	addi	a0,a0,-8	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137+0x2c
	c.mv	a1,s10
	auipc	ra,0xd
	jalr	ra,272(ra)	# memcmp
	lw	a5,-416(s0)
	c.beqz	a0, .Lbranch_8000463e

.Lbranch_8000469a:
	c.li	a3,5
	c.mv	a0,s10
	c.mv	a1,s1
	lui	a2,0x80014
	addi	a2,a2,72	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139
	auipc	ra,0x0
	jalr	ra,1476(ra)	# _ZN4core3str21_$LT$impl$u20$str$GT$8contains17he9be11057f31b68dE
	c.mv	a5,s2
	c.bnez	a0, .Lbranch_8000463e
	c.li	a3,4
	c.mv	a0,s10
	c.mv	a1,s1
	lui	a2,0x80014
	addi	a2,a2,100	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0x1c
	auipc	ra,0x0
	jalr	ra,1450(ra)	# _ZN4core3str21_$LT$impl$u20$str$GT$8contains17he9be11057f31b68dE
	c.mv	a5,s2
	c.bnez	a0, .Lbranch_8000463e
	c.li	a0,6
	bltu	s1,a0, .Lbranch_800046ee
	c.li	a2,6
	lui	a0,0x80014
	addi	a0,a0,112	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.141
	c.mv	a1,s10
	auipc	ra,0xd
	jalr	ra,188(ra)	# memcmp
	lw	a5,-428(s0)
	c.beqz	a0, .Lbranch_8000463e

.Lbranch_800046ee:
	c.li	a3,4
	c.mv	a0,s10
	c.mv	a1,s1
	lui	a2,0x80014
	addi	a2,a2,88	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0x10
	auipc	ra,0x0
	jalr	ra,1392(ra)	# _ZN4core3str21_$LT$impl$u20$str$GT$8contains17he9be11057f31b68dE
	lw	a5,-420(s0)
	c.bnez	a0, .Lbranch_8000463e
	c.mv	a0,s10
	c.mv	a1,s1
	auipc	ra,0xa
	jalr	ra,-1910(ra)	# _ZN4core3str21_$LT$impl$u20$str$GT$12trim_matches17he6e51be3559aff03E
	lw	a5,-432(s0)
	c.beqz	a1, .Lbranch_8000463e
	lui	a5,0x1000
	c.addi	a5,-1	# .Lline_table_start1+0xfb3eaa
	c.j	 .Lbranch_8000463e

.Lbranch_80004724:
	lui	a3,0x80014
	addi	a3,a3,-416	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.106
	lui	a0,0xaab
	c.li	a1,20
	addi	a2,zero,480
	addi	a5,a0,-1400	# .Lline_table_start1+0xa5e933
	addi	a4,zero,48
	lw	a0,-424(s0)
	lw	s1,-436(s0)
	c.jalr	s1
	c.j	 .Lbranch_80004960

.Lbranch_8000474a:
	lui	a3,0x80014
	addi	a3,a3,64	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137+0x74

.Lbranch_80004752:
	addi	a1,s1,-120
	bge	a1,s1, .Lbranch_80004bf2
	lw	s1,32(s4)
	lui	a5,0x1000
	c.li	a2,12
	c.addi	a5,-1	# .Lline_table_start1+0xfb3eaa
	c.li	a4,8
	c.mv	a0,s8
	c.jalr	s1
	lui	a3,0x80014
	addi	a3,a3,-1096	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.93
	c.lui	a5,0x10
	c.li	a1,20
	addi	a2,zero,70
	c.addi	a5,-1	# .Lline_table_start0+0x1fa1
	c.li	a4,29
	c.mv	a0,s8
	c.jalr	s1
	lw	s1,36(s4)
	lui	a3,0x80014
	addi	a3,a3,-1064	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.94
	lui	a0,0xaab
	c.lui	a4,0x1
	c.li	a1,20
	addi	a2,zero,460
	addi	a5,a0,-1400	# .Lline_table_start1+0xa5e933
	addi	a6,a4,290	# .Lline_table_start0+0x1122
	addi	a4,zero,50
	c.mv	a0,s8
	c.jalr	s1
	lui	a0,0x80022
	lw	a0,4(a0)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	sw	a0,1412(s2)

.Lbranch_800047b8:
	c.li	s6,0
	lui	a6,0x80014
	addi	a6,a6,-1012	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.95
	addi	a7,zero,105
	lui	t0,0x80014
	addi	t0,t0,-904	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.96
	addi	t1,zero,65
	lui	t2,0x80014
	addi	t2,t2,-836	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.97
	addi	t3,zero,99
	lui	t4,0x80014
	addi	t4,t4,-736	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.98
	addi	t5,zero,91
	lui	t6,0x80014
	addi	t6,t6,-644	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.99
	addi	s2,zero,98
	lui	a4,0x80014
	addi	a4,a4,-544	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.100
	c.li	a5,31
	lui	a0,0xeef
	lui	a1,0x88f
	lui	a2,0xee9
	sw	s4,-432(s0)
	lw	s7,44(s4)
	addi	s8,s0,-412
	addi	s1,zero,120
	c.li	s9,1
	c.li	s4,-1
	sw	a6,-388(s0)
	sw	a7,-384(s0)
	sw	t0,-380(s0)
	sw	t1,-376(s0)
	lui	s10,0x80000
	sw	t2,-372(s0)
	sw	t3,-368(s0)
	sw	t4,-364(s0)
	sw	t5,-360(s0)
	c.lui	a3,0x1
	sw	t6,-356(s0)
	sw	s2,-352(s0)
	sw	a4,-348(s0)
	sw	a5,-344(s0)
	addi	a0,a0,-376	# .Lline_table_start1+0xea2d33
	addi	a1,a1,-376	# .Lline_table_start1+0x842d33
	addi	a2,a2,-1912	# .Lline_table_start1+0xe9c733
	addi	s11,a3,290	# .Lline_table_start0+0x1122
	addi	a3,a0,102
	addi	a4,a1,102
	sw	a3,-412(s0)
	sw	a1,-408(s0)
	sw	a0,-404(s0)
	sw	a2,-400(s0)
	addi	a0,a2,102
	sw	a4,-396(s0)
	sw	a0,-392(s0)
	addi	s2,zero,48
	c.j	 .Lbranch_800048c2

.Lbranch_80004890:
	rem	a4,a0,a3
	addi	a0,s0,-388
	c.add	a0,s6
	lw	a6,0(a0)
	lw	a7,4(a0)
	lw	a0,0(s8)
	c.addi	s6,8
	c.swsp	a0,0(sp)
	c.swsp	s11,4(sp)
	lw	a0,-424(s0)
	c.mv	a2,s1
	c.mv	a5,a3
	c.jalr	s7
	c.addi	s8,4
	addi	s1,s1,40
	c.addi	s9,1
	beq	s6,s2, .Lbranch_80004934

.Lbranch_800048c2:
	addi	a0,zero,40
	bne	s6,a0, .Lbranch_800048d6
	addi	a1,zero,100
	addi	a3,zero,120
	c.mv	a0,s5
	c.j	 .Lbranch_800048ea

.Lbranch_800048d6:
	mulhu	a0,s5,s9
	bne	a0,zero, .Lbranch_80004bc2
	beq	s3,zero, .Lbranch_80004bd2
	c.mv	a3,s3
	c.li	a1,0
	mul	a0,s5,s9

.Lbranch_800048ea:
	remu	a0,a0,a3
	slt	a2,zero,a0
	c.li	a4,20
	sub	a0,a4,a0
	slti	a4,a0,20
	bne	a2,a4, .Lbranch_80004b92
	bne	a3,s4, .Lbranch_80004908
	beq	a0,s10, .Lbranch_80004ba2

.Lbranch_80004908:
	rem	a2,a0,a3
	add	a0,a2,a3
	slt	a2,a0,a2
	slti	a4,a3,0
	bne	a4,a2, .Lbranch_80004bb2
	bne	a3,s4, .Lbranch_80004890
	bne	a0,s10, .Lbranch_80004890
	lui	a0,0x80014
	addi	a0,a0,-464	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.104
	auipc	ra,0xd
	jalr	ra,-1344(ra)	# _ZN4core9panicking11panic_const24panic_const_rem_overflow17h43cfcaccafa02be6E

.Lbranch_80004934:
	lw	a0,-432(s0)
	c.lw	s1,36(a0)
	lui	a3,0x80014
	addi	a3,a3,-1064	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.94
	lui	a0,0xaab
	c.lui	a4,0x1
	c.li	a1,20
	addi	a2,zero,460
	addi	a5,a0,-1400	# .Lline_table_start1+0xa5e933
	addi	a6,a4,290	# .Lline_table_start0+0x1122
	addi	a4,zero,50
	lw	a0,-424(s0)
	c.jalr	s1

.Lbranch_80004960:
	lw	ra,444(sp)
	lw	s0,440(sp)
	lw	s1,436(sp)
	lw	s2,432(sp)
	lw	s3,428(sp)
	lw	s4,424(sp)
	lw	s5,420(sp)
	lw	s6,416(sp)
	lw	s7,412(sp)
	lw	s8,408(sp)
	lw	s9,404(sp)
	lw	s10,400(sp)
	lw	s11,396(sp)
	c.addi16sp	sp,448
	c.jr	ra
	lui	a3,0x80013
	addi	a3,a3,1664	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.45
	lui	a0,0x889
	addi	a1,zero,418
	addi	a2,zero,90
	addi	a5,a0,-1912	# .Lline_table_start1+0x83c733
	c.li	a4,1
	lw	a0,-424(s0)
	lw	t1,-416(s0)
	c.jalr	t1

.Lbranch_800049bc:
	lw	a0,-432(s0)
	lw	s5,40(a0)
	c.li	s7,22
	lui	a0,0x889
	c.lui	a1,0x10
	c.li	s9,10
	addi	s10,zero,255
	lui	a2,0x1000
	addi	a0,a0,-1912	# .Lline_table_start1+0x83c733
	sw	a0,-420(s0)
	addi	s3,a1,-256	# .Lline_table_start0+0x1ea2
	addi	s8,a2,-1	# .Lline_table_start1+0xfb3eaa
	addi	a0,a2,-256
	sw	a0,-432(s0)
	c.addi	a1,-1
	sw	a1,-428(s0)
	addi	s2,zero,32
	c.j	 .Lbranch_80004a0e

.Lbranch_800049fa:
	mul	a0,s11,s7
	addi	a1,a0,80
	lw	a0,-424(s0)
	c.mv	a3,s1
	c.jalr	s5
	beq	s1,s10, .Lbranch_80004aa8

.Lbranch_80004a0e:
	c.mv	s6,s2
	addi	a0,s2,1
	andi	a1,a0,255
	andi	s1,s2,255
	addi	s2,zero,255
	c.beqz	a1, .Lbranch_80004a2c
	c.mv	s2,a0
	addi	a0,zero,32
	bltu	s1,a0, .Lbranch_80004be2

.Lbranch_80004a2c:
	addi	a0,s6,-32
	andi	a0,a0,240
	andi	s11,s6,15
	srli	a1,a0,0x3
	c.add	a0,a1
	addi	a2,a0,120
	bne	s11,zero, .Lbranch_80004a74
	andi	a0,s6,240
	c.srli	a0,0x2
	xori	a0,a0,32
	lui	a1,0x80014
	addi	a1,a1,892	# .Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.6
	c.add	a0,a1
	c.lw	a3,0(a0)
	addi	a1,zero,50
	c.li	a4,2
	lw	a0,-424(s0)
	c.mv	s4,a2
	lw	a5,-420(s0)
	lw	t1,-416(s0)
	c.jalr	t1
	c.mv	a2,s4

.Lbranch_80004a74:
	addi	a0,s6,-48
	andi	a0,a0,255
	c.mv	a4,s3
	bltu	a0,s9, .Lbranch_800049fa
	andi	a0,s6,223
	addi	a0,a0,-65
	andi	a0,a0,255
	c.mv	a4,s8
	c.li	a1,26
	bltu	a0,a1, .Lbranch_800049fa
	lw	a4,-428(s0)
	addi	a0,zero,127
	bltu	s1,a0, .Lbranch_800049fa
	lw	a4,-432(s0)
	c.j	 .Lbranch_800049fa

.Lbranch_80004aa8:
	lui	a3,0x80013
	addi	a3,a3,1396	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.11
	lui	s2,0xaab
	c.li	a1,20
	addi	a2,zero,440
	addi	a5,s2,-1368	# .Lline_table_start1+0xa5e953
	addi	a4,zero,65
	lw	s1,-424(s0)
	c.mv	a0,s1
	lw	t1,-416(s0)
	c.jalr	t1
	lui	a3,0x80013
	addi	a3,a3,1464	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.12
	addi	a5,s2,-1400
	c.li	a1,20
	addi	a2,zero,460
	addi	a4,zero,62
	c.mv	a0,s1

.Lbranch_80004ae6:
	lw	t1,-416(s0)
	lw	ra,444(sp)
	lw	s0,440(sp)
	lw	s1,436(sp)
	lw	s2,432(sp)
	lw	s3,428(sp)
	lw	s4,424(sp)
	lw	s5,420(sp)
	lw	s6,416(sp)
	lw	s7,412(sp)
	lw	s8,408(sp)
	lw	s9,404(sp)
	lw	s10,400(sp)
	lw	s11,396(sp)
	c.addi16sp	sp,448
	c.jr	t1

.Lbranch_80004b22:
	lui	a0,0x80014
	addi	a0,a0,-1176	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.88
	auipc	ra,0xd
	jalr	ra,-1918(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80004b32:
	lui	a0,0x80014
	addi	a0,a0,-1208	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.86
	auipc	ra,0xd
	jalr	ra,-1902(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80004b42:
	lui	a0,0x80014
	addi	a0,a0,-1192	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.87
	auipc	ra,0xd
	jalr	ra,-1918(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80004b52:
	lui	a0,0x80014
	addi	a0,a0,-1144	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.90
	auipc	ra,0xd
	jalr	ra,-1966(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80004b62:
	lui	a0,0x80014
	addi	a0,a0,-1160	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.89
	auipc	ra,0xd
	jalr	ra,-1982(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80004b72:
	lui	a0,0x80014
	addi	a0,a0,-1128	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.91
	auipc	ra,0xd
	jalr	ra,-1998(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80004b82:
	lui	a0,0x80014
	addi	a0,a0,-1112	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.92
	auipc	ra,0xd
	jalr	ra,-2014(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80004b92:
	lui	a0,0x80014
	addi	a0,a0,-480	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.103
	auipc	ra,0xd
	jalr	ra,-1934(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_80004ba2:
	lui	a0,0x80014
	addi	a0,a0,-480	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.103
	auipc	ra,0xd
	jalr	ra,-1982(ra)	# _ZN4core9panicking11panic_const24panic_const_rem_overflow17h43cfcaccafa02be6E

.Lbranch_80004bb2:
	lui	a0,0x80014
	addi	a0,a0,-464	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.104
	auipc	ra,0xc
	jalr	ra,2034(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80004bc2:
	lui	a0,0x80014
	addi	a0,a0,-512	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.101
	auipc	ra,0xd
	jalr	ra,-2046(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80004bd2:
	lui	a0,0x80014
	addi	a0,a0,-496	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.102
	auipc	ra,0xc
	jalr	ra,1970(ra)	# _ZN4core9panicking11panic_const23panic_const_rem_by_zero17h1e30600164aa306dE

.Lbranch_80004be2:
	lui	a0,0x80013
	addi	a0,a0,1528	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.14
	auipc	ra,0xd
	jalr	ra,-2014(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_80004bf2:
	lui	a0,0x80014
	addi	a0,a0,120	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.152
	auipc	ra,0xd
	jalr	ra,-2030(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os11demos_basic16get_current_page17h158bb443700df5ddE
_ZN11homebrew_os11demos_basic16get_current_page17h158bb443700df5ddE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a0,0x80022
	lw	a0,4(a0)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

	.globl _ZN11homebrew_os11demos_basic9next_page17hae4c73d94ac0226dE
_ZN11homebrew_os11demos_basic9next_page17hae4c73d94ac0226dE:
	lui	a1,0x80022
	lw	a0,4(a1)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.addi	a0,1
	c.beqz	a0, .Lbranch_80004c30
	c.andi	a0,7
	sw	a0,4(a1)
	c.jr	ra

.Lbranch_80004c30:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a0,0x80014
	addi	a0,a0,136	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.153
	auipc	ra,0xc
	jalr	ra,1900(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN11homebrew_os11demos_basic9prev_page17hb133f9494bd7ad39E
_ZN11homebrew_os11demos_basic9prev_page17hb133f9494bd7ad39E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a1,0x80022
	lw	a0,4(a1)	# _ZN11homebrew_os11demos_basic12CURRENT_PAGE17h2343669e809ae407E.0
	c.bnez	a0, .Lbranch_80004c5e
	c.li	a0,7
	c.j	 .Lbranch_80004c60

.Lbranch_80004c5e:
	c.addi	a0,-1

.Lbranch_80004c60:
	sw	a0,4(a1)
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

	.globl _ZN4core3str21_$LT$impl$u20$str$GT$8contains17he9be11057f31b68dE
_ZN4core3str21_$LT$impl$u20$str$GT$8contains17he9be11057f31b68dE:
	c.addi16sp	sp,-96
	c.swsp	ra,92(sp)
	c.swsp	s0,88(sp)
	c.addi4spn	s0,sp,96
	c.mv	a4,a3
	c.mv	a3,a2
	c.mv	a2,a1
	c.mv	a1,a0
	bgeu	a4,a2, .Lbranch_80004cb8
	addi	a0,s0,-72
	auipc	ra,0xb
	jalr	ra,1828(ra)	# _ZN4core3str7pattern11StrSearcher3new17h665d7cbb00f75ce2E
	lw	a0,-72(s0)
	c.beqz	a0, .Lbranch_80004cce
	lw	a0,-36(s0)
	lw	a2,-24(s0)
	lw	a3,-20(s0)
	lw	a4,-16(s0)
	lw	a5,-12(s0)
	c.li	a6,-1
	addi	a1,s0,-64
	beq	a0,a6, .Lbranch_80004d06
	addi	a0,s0,-84
	c.li	a6,0
	c.j	 .Lbranch_80004d0c

.Lbranch_80004cb8:
	bne	a4,a2, .Lbranch_80004cda
	c.mv	a0,a3
	c.mv	a2,a4
	auipc	ra,0xd
	jalr	ra,-1316(ra)	# memcmp
	sltiu	a0,a0,1
	c.j	 .Lbranch_80004ea0

.Lbranch_80004cce:
	lbu	a0,-58(s0)
	c.beqz	a0, .Lbranch_80004cde
	sw	zero,-84(s0)
	c.j	 .Lbranch_80004e9c

.Lbranch_80004cda:
	c.li	a0,0
	c.j	 .Lbranch_80004ea0

.Lbranch_80004cde:
	lw	a2,-68(s0)
	lbu	t1,-60(s0)
	lw	a0,-24(s0)
	lw	a1,-20(s0)
	add	a4,a0,a2
	c.beqz	a2, .Lbranch_80004d1a
	bgeu	a2,a1, .Lbranch_80004d16
	lb	a3,0(a4)
	addi	a5,zero,-64
	bge	a3,a5, .Lbranch_80004d1a
	c.j	 .Lbranch_80004dfc

.Lbranch_80004d06:
	addi	a0,s0,-84
	c.li	a6,1

.Lbranch_80004d0c:
	auipc	ra,0x0
	jalr	ra,520(ra)	# _ZN4core3str7pattern14TwoWaySearcher4next17hc584592cbc0fd2c2E
	c.j	 .Lbranch_80004e9c

.Lbranch_80004d16:
	bne	a2,a1, .Lbranch_80004dfc

.Lbranch_80004d1a:
	bltu	a1,a2, .Lbranch_80004ea8
	bne	a2,a1, .Lbranch_80004d2c
	andi	a0,t1,1
	bne	a0,zero, .Lbranch_80004e96
	c.j	 .Lbranch_80004e98

.Lbranch_80004d2c:
	lb	a5,0(a4)
	add	a6,a0,a1
	andi	t3,a5,255
	bge	a5,zero, .Lbranch_80004da4
	addi	a5,a4,1
	beq	a5,a6, .Lbranch_80004ee4
	lbu	a5,1(a4)
	andi	a7,t3,31
	addi	t2,zero,224
	andi	t0,a5,63
	bltu	t3,t2, .Lbranch_80004d96
	addi	a5,a4,2
	beq	a5,a6, .Lbranch_80004ef4
	lbu	a5,2(a4)
	c.slli	t0,0x6
	andi	a5,a5,63
	addi	t2,zero,240
	or	t0,t0,a5
	bltu	t3,t2, .Lbranch_80004d9e
	c.addi	a4,3
	beq	a4,a6, .Lbranch_80004f04
	lbu	a3,0(a4)
	c.slli	a7,0x1d
	srli	a4,a7,0xb
	c.slli	t0,0x6
	andi	a3,a3,63
	or	a3,t0,a3
	or	t3,a3,a4
	c.j	 .Lbranch_80004da4

.Lbranch_80004d96:
	c.slli	a7,0x6
	or	t3,a7,t0
	c.j	 .Lbranch_80004da4

.Lbranch_80004d9e:
	c.slli	a7,0xc
	or	t3,t0,a7

.Lbranch_80004da4:
	c.li	a4,27
	lui	a5,0xffef0
	c.slli	a4,0xb
	xor	a3,t3,a4
	c.add	a3,a5
	lui	a5,0xffef1
	addi	a5,a5,-2048	# __heap_end+0x7fbf0800
	bltu	a3,a5, .Lbranch_80004ec6
	andi	a3,t1,1
	c.bnez	a3, .Lbranch_80004e96
	addi	a3,zero,128
	bgeu	t3,a3, .Lbranch_80004dd0
	c.li	a3,1
	c.j	 .Lbranch_80004de4

.Lbranch_80004dd0:
	srli	a3,t3,0xb
	c.bnez	a3, .Lbranch_80004dda
	c.li	a3,2
	c.j	 .Lbranch_80004de4

.Lbranch_80004dda:
	srli	a3,t3,0x10
	sltu	a3,zero,a3
	c.addi	a3,3

.Lbranch_80004de4:
	c.add	a2,a3
	add	a3,a0,a2
	c.beqz	a2, .Lbranch_80004e12
	bgeu	a2,a1, .Lbranch_80004e0e
	lb	a7,0(a3)
	addi	a5,zero,-65
	blt	a5,a7, .Lbranch_80004e12

.Lbranch_80004dfc:
	lui	a4,0x80014
	addi	a4,a4,860	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.167
	c.mv	a3,a1
	auipc	ra,0xb
	jalr	ra,410(ra)	# _ZN4core3str16slice_error_fail17h073402faa99e0899E

.Lbranch_80004e0e:
	bne	a2,a1, .Lbranch_80004dfc

.Lbranch_80004e12:
	bltu	a1,a2, .Lbranch_80004ea8
	beq	a2,a1, .Lbranch_80004e96
	lb	a1,0(a3)
	andi	a0,a1,255
	bge	a1,zero, .Lbranch_80004e86
	addi	a1,a3,1
	beq	a1,a6, .Lbranch_80004ee4
	lbu	a2,1(a3)
	andi	a1,a0,31
	addi	a5,zero,223
	andi	a2,a2,63
	bgeu	a5,a0, .Lbranch_80004e78
	addi	a5,a3,2
	beq	a5,a6, .Lbranch_80004ef4
	lbu	a5,2(a3)
	c.slli	a2,0x6
	andi	a5,a5,63
	addi	a7,zero,239
	c.or	a2,a5
	bgeu	a7,a0, .Lbranch_80004e80
	c.addi	a3,3
	beq	a3,a6, .Lbranch_80004f04
	lbu	a0,0(a3)
	c.slli	a1,0x1d
	c.srli	a1,0xb
	c.slli	a2,0x6
	andi	a0,a0,63
	c.or	a0,a2
	c.or	a0,a1
	c.j	 .Lbranch_80004e86

.Lbranch_80004e78:
	slli	a0,a1,0x6
	c.or	a0,a2
	c.j	 .Lbranch_80004e86

.Lbranch_80004e80:
	slli	a0,a1,0xc
	c.or	a0,a2

.Lbranch_80004e86:
	c.xor	a0,a4
	lui	a1,0xffef0
	c.add	a0,a1
	addi	a1,a1,2047	# __heap_end+0x7fbf07ff
	bgeu	a1,a0, .Lbranch_80004ec6

.Lbranch_80004e96:
	c.li	a0,1

.Lbranch_80004e98:
	sw	a0,-84(s0)

.Lbranch_80004e9c:
	lw	a0,-84(s0)

.Lbranch_80004ea0:
	c.lwsp	ra,92(sp)
	c.lwsp	s0,88(sp)
	c.addi16sp	sp,96
	c.jr	ra

.Lbranch_80004ea8:
	lui	a0,0x80014
	addi	a0,a0,200	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.158
	lui	a3,0x80014
	addi	a3,a3,420	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.160
	addi	a1,zero,439
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,1450(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80004ec6:
	lui	a0,0x80014
	addi	a0,a0,484	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.165
	lui	a3,0x80014
	addi	a3,a3,876	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.169
	addi	a1,zero,349
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,1420(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80004ee4:
	lui	a0,0x80014
	addi	a0,a0,152	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.155
	auipc	ra,0x0
	jalr	ra,460(ra)	# _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE

.Lbranch_80004ef4:
	lui	a0,0x80014
	addi	a0,a0,168	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.156
	auipc	ra,0x0
	jalr	ra,444(ra)	# _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE

.Lbranch_80004f04:
	lui	a0,0x80014
	addi	a0,a0,184	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.157
	auipc	ra,0x0
	jalr	ra,428(ra)	# _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE

	.globl _ZN4core3str7pattern14TwoWaySearcher4next17hc584592cbc0fd2c2E
_ZN4core3str7pattern14TwoWaySearcher4next17hc584592cbc0fd2c2E:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.swsp	s1,36(sp)
	c.swsp	s2,32(sp)
	c.swsp	s3,28(sp)
	c.swsp	s4,24(sp)
	c.swsp	s5,20(sp)
	c.swsp	s6,16(sp)
	c.swsp	s7,12(sp)
	c.swsp	s8,8(sp)
	c.swsp	s9,4(sp)
	c.swsp	s10,0(sp)
	c.addi4spn	s0,sp,48
	lw	s5,20(a1)
	addi	t1,a5,-1
	add	s1,s5,t1
	bgeu	s1,a3, .Lbranch_8000503c
	lw	t2,4(a1)
	lw	t3,16(a1)
	lw	t4,8(a1)
	lw	t5,0(a1)
	lw	s4,28(a1)
	sub	t6,a5,t3
	sub	s3,zero,t4
	slli	s2,t2,0x1
	c.j	 .Lbranch_80004f72

.Lbranch_80004f62:
	c.li	s1,0

.Lbranch_80004f64:
	c.sw	s1,28(a1)
	c.mv	s4,s1

.Lbranch_80004f68:
	add	s1,t0,t1
	c.mv	s5,t0
	bgeu	s1,a3, .Lbranch_8000503c

.Lbranch_80004f72:
	c.add	s1,a2
	lbu	a7,0(s1)
	andi	t0,a7,63
	addi	s1,t0,-32
	blt	s1,zero, .Lbranch_80004fdc
	srl	s1,t2,t0
	c.andi	s1,1
	c.beqz	s1, .Lbranch_80004ff0

.Lbranch_80004f8c:
	c.mv	s1,s4
	bltu	t4,s4, .Lbranch_80004f94
	c.mv	s1,t4

.Lbranch_80004f94:
	c.mv	a7,t4
	bne	a6,zero, .Lbranch_80004f9c
	c.mv	a7,s1

.Lbranch_80004f9c:
	add	s6,a7,s5
	add	s7,a4,a7
	sub	s9,a5,a7
	add	t0,s6,s3
	add	s8,a2,s6
	sltu	s1,a5,s9
	c.addi	s1,-1
	and	s1,s1,s9

.Lbranch_80004fba:
	c.beqz	s1, .Lbranch_80004ffe
	bgeu	s6,a3, .Lbranch_80005074
	lbu	s9,0(s7)
	lbu	s10,0(s8)
	c.addi	t0,1
	c.addi	s8,1
	c.addi	s6,1
	c.addi	s7,1
	c.addi	s1,-1
	beq	s9,s10, .Lbranch_80004fba
	beq	a6,zero, .Lbranch_80004f62
	c.j	 .Lbranch_80004f68

.Lbranch_80004fdc:
	srl	a7,t5,a7
	xori	s1,t0,-1
	sll	s1,s2,s1
	or	s1,a7,s1
	c.andi	s1,1
	c.bnez	s1, .Lbranch_80004f8c

.Lbranch_80004ff0:
	add	t0,s5,a5
	sw	t0,20(a1)
	beq	a6,zero, .Lbranch_80004f62
	c.j	 .Lbranch_80004f68

.Lbranch_80004ffe:
	addi	s1,a6,-1
	and	s6,s1,s4
	c.mv	a7,t4

.Lbranch_80005008:
	bgeu	s6,a7, .Lbranch_80005042
	c.addi	a7,-1
	bgeu	a7,a5, .Lbranch_800050a4
	add	t0,a7,s5
	bgeu	t0,a3, .Lbranch_80005090
	add	s1,a4,a7
	c.add	t0,a2
	lbu	s7,0(s1)
	lbu	s1,0(t0)
	beq	s7,s1, .Lbranch_80005008
	add	t0,s5,t3
	sw	t0,20(a1)
	c.mv	s1,t6
	beq	a6,zero, .Lbranch_80004f64
	c.j	 .Lbranch_80004f68

.Lbranch_8000503c:
	c.li	a2,0
	c.sw	a3,20(a1)
	c.j	 .Lbranch_80005056

.Lbranch_80005042:
	c.add	a5,s5
	c.sw	a5,20(a1)
	bne	a6,zero, .Lbranch_8000504e
	sw	zero,28(a1)

.Lbranch_8000504e:
	sw	s5,4(a0)
	c.sw	a5,8(a0)
	c.li	a2,1

.Lbranch_80005056:
	c.sw	a2,0(a0)
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.lwsp	s4,24(sp)
	c.lwsp	s5,20(sp)
	c.lwsp	s6,16(sp)
	c.lwsp	s7,12(sp)
	c.lwsp	s8,8(sp)
	c.lwsp	s9,4(sp)
	c.lwsp	s10,0(sp)
	c.addi16sp	sp,48
	c.jr	ra

.Lbranch_80005074:
	c.add	a7,s5
	c.mv	a0,a3
	bltu	a7,a3, .Lbranch_8000507e
	c.mv	a0,a7

.Lbranch_8000507e:
	lui	a2,0x80014
	addi	a2,a2,468	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.164
	c.mv	a1,a3
	auipc	ra,0xc
	jalr	ra,932(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_80005090:
	lui	a2,0x80014
	addi	a2,a2,452	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.163
	c.mv	a0,t0
	c.mv	a1,a3
	auipc	ra,0xc
	jalr	ra,912(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_800050a4:
	lui	a2,0x80014
	addi	a2,a2,436	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.162
	c.mv	a0,a7
	c.mv	a1,a5
	auipc	ra,0xc
	jalr	ra,892(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

	.globl _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE
_ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a3,a0
	lui	a0,0x80014
	addi	a0,a0,660	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.166
	addi	a1,zero,399
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,920(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _ZN11homebrew_os8showcase17Rgb565Framebuffer3new17hff84c3e3b6b7d648E
_ZN11homebrew_os8showcase17Rgb565Framebuffer3new17hff84c3e3b6b7d648E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.sw	a1,0(a0)
	c.sw	a2,4(a0)
	c.sw	a3,8(a0)
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN95_$LT$homebrew_os..showcase..Rgb565Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$5width17h8c5a80cb41fb114dE
_ZN95_$LT$homebrew_os..showcase..Rgb565Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$5width17h8c5a80cb41fb114dE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a0,4(a0)
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN95_$LT$homebrew_os..showcase..Rgb565Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$6height17hc61ff4f06cbb0d69E
_ZN95_$LT$homebrew_os..showcase..Rgb565Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$6height17hc61ff4f06cbb0d69E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a0,8(a0)
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$11draw_string17h1b44ad6565da8cc7E
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$11draw_string17h1b44ad6565da8cc7E:
	c.addi16sp	sp,-96
	c.swsp	ra,92(sp)
	c.swsp	s0,88(sp)
	c.swsp	s1,84(sp)
	c.swsp	s2,80(sp)
	c.swsp	s3,76(sp)
	c.swsp	s4,72(sp)
	c.swsp	s5,68(sp)
	c.swsp	s6,64(sp)
	c.swsp	s7,60(sp)
	c.swsp	s8,56(sp)
	c.swsp	s9,52(sp)
	c.swsp	s10,48(sp)
	c.swsp	s11,44(sp)
	c.addi4spn	s0,sp,96
	c.mv	s8,a5
	c.mv	s1,a4
	c.mv	s2,a3
	sw	a2,-88(s0)
	c.mv	s4,a1
	c.mv	s7,a0
	lui	a1,0x80014
	addi	a1,a1,988	# .Lanon.94876b220182c162a7a9ea2366510c9c.0
	addi	a0,s0,-84
	c.li	a2,17
	auipc	ra,0x2
	jalr	ra,-1046(ra)	# _ZN11homebrew_os3grf7GrfFont9load_font17h619872f3550353d4E
	lw	a0,-84(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_80005232
	lw	a0,-84(s0)
	lw	a1,-80(s0)
	lw	a2,-76(s0)
	lw	a3,-72(s0)
	sw	a0,-68(s0)
	sw	a1,-64(s0)
	sw	a2,-60(s0)
	sw	a3,-56(s0)
	c.beqz	s1, .Lbranch_80005222
	lw	s5,0(s7)
	lw	s6,4(s7)
	lw	s7,8(s7)
	c.slli	s8,0x8
	lw	a0,-64(s0)
	lw	s9,-56(s0)
	c.lui	a1,0xfffff
	srli	s8,s8,0x8
	addi	s11,a0,2047
	addi	s3,a1,2038	# __heap_end+0x7fcff7f6
	c.j	 .Lbranch_800051b4

.Lbranch_800051ae:
	c.addi	s1,-1
	c.addi	s2,1
	c.beqz	s1, .Lbranch_80005222

.Lbranch_800051b4:
	lbu	a6,0(s2)
	slli	a0,a6,0x2
	c.add	a0,s9
	lbu	a1,11(a0)
	lbu	a2,10(a0)
	lbu	a3,12(a0)
	lbu	a0,13(a0)
	c.slli	a1,0x8
	c.or	a1,a2
	c.slli	a3,0x10
	c.slli	a0,0x18
	c.or	a0,a3
	or	s10,a0,a1
	c.li	a0,-1
	beq	s10,a0, .Lbranch_800051ae
	bgeu	s10,s3, .Lbranch_80005250
	addi	a0,s0,-68
	c.mv	a1,s5
	c.mv	a2,s6
	c.mv	a3,s7
	c.mv	a4,s4
	lw	a5,-88(s0)
	c.mv	a7,s8
	auipc	ra,0x2
	jalr	ra,-1896(ra)	# _ZN11homebrew_os3grf7GrfFont20render_char_xrgb888817h3b6fb4799d14cd98E
	c.add	s10,s11
	lb	a0,16(s10)	# .Lpcrel_hi0+0xc
	lbu	a1,15(s10)
	c.slli	a0,0x8
	c.or	a1,a0
	add	a0,s4,a1
	slt	a2,a0,s4
	slti	a1,a1,0
	bne	a1,a2, .Lbranch_80005260
	c.mv	s4,a0
	c.j	 .Lbranch_800051ae

.Lbranch_80005222:
	addi	a0,s0,-84
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0x1
	jalr	ra,-1862(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_80005232:
	c.lwsp	ra,92(sp)
	c.lwsp	s0,88(sp)
	c.lwsp	s1,84(sp)
	c.lwsp	s2,80(sp)
	c.lwsp	s3,76(sp)
	c.lwsp	s4,72(sp)
	c.lwsp	s5,68(sp)
	c.lwsp	s6,64(sp)
	c.lwsp	s7,60(sp)
	c.lwsp	s8,56(sp)
	c.lwsp	s9,52(sp)
	c.lwsp	s10,48(sp)
	c.lwsp	s11,44(sp)
	c.addi16sp	sp,96
	c.jr	ra

.Lbranch_80005250:
	lui	a0,0x80015
	addi	a0,a0,696	# anon.7a8bf03ce3225e035043929a408f9c7c.90.llvm.764523667040833331
	auipc	ra,0xc
	jalr	ra,340(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80005260:
	lui	a0,0x80015
	addi	a0,a0,680	# anon.7a8bf03ce3225e035043929a408f9c7c.65.llvm.764523667040833331
	auipc	ra,0xc
	jalr	ra,324(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$11write_pixel17he974d5e5446932c0E
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$11write_pixel17he974d5e5446932c0E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a4,4(a0)
	bgeu	a1,a4, .Lbranch_800052a6
	c.lw	a5,8(a0)
	bgeu	a2,a5, .Lbranch_800052a6
	mulhu	a5,a2,a4
	c.bnez	a5, .Lbranch_800052cc
	mul	a2,a2,a4
	c.add	a1,a2
	bltu	a1,a2, .Lbranch_800052dc
	c.lw	a0,0(a0)
	c.slli	a1,0x2
	c.add	a0,a1
	andi	a1,a0,3
	c.bnez	a1, .Lbranch_800052ae
	c.slli	a3,0x8
	c.srli	a3,0x8
	c.sw	a3,0(a0)

.Lbranch_800052a6:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_800052ae:
	lui	a0,0x80014
	addi	a0,a0,1008	# .Lanon.94876b220182c162a7a9ea2366510c9c.3
	lui	a3,0x80014
	addi	a3,a3,1240	# .Lanon.94876b220182c162a7a9ea2366510c9c.15
	addi	a1,zero,431
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,420(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800052cc:
	lui	a0,0x80014
	addi	a0,a0,1224	# .Lanon.94876b220182c162a7a9ea2366510c9c.14
	auipc	ra,0xc
	jalr	ra,248(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_800052dc:
	lui	a0,0x80014
	addi	a0,a0,1224	# .Lanon.94876b220182c162a7a9ea2366510c9c.14
	auipc	ra,0xc
	jalr	ra,200(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$19draw_string_with_bg17hbf06ff70b23a3df8E
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$19draw_string_with_bg17hbf06ff70b23a3df8E:
	c.addi16sp	sp,-96
	c.swsp	ra,92(sp)
	c.swsp	s0,88(sp)
	c.swsp	s1,84(sp)
	c.swsp	s2,80(sp)
	c.swsp	s3,76(sp)
	c.swsp	s4,72(sp)
	c.swsp	s5,68(sp)
	c.swsp	s6,64(sp)
	c.swsp	s7,60(sp)
	c.swsp	s8,56(sp)
	c.swsp	s9,52(sp)
	c.swsp	s10,48(sp)
	c.swsp	s11,44(sp)
	c.addi4spn	s0,sp,96
	c.mv	s9,a6
	c.mv	s7,a5
	c.mv	s6,a4
	c.mv	s2,a3
	sw	a2,-88(s0)
	c.mv	s4,a1
	c.mv	s10,a0
	lui	a1,0x80014
	addi	a1,a1,988	# .Lanon.94876b220182c162a7a9ea2366510c9c.0
	addi	a0,s0,-84
	c.li	a2,17
	auipc	ra,0x2
	jalr	ra,-1516(ra)	# _ZN11homebrew_os3grf7GrfFont9load_font17h619872f3550353d4E
	lw	a0,-84(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_800054ce
	lw	a1,-84(s0)
	lw	a2,-80(s0)
	lw	a3,-76(s0)
	lw	a4,-72(s0)
	c.li	s1,10
	slli	a5,s6,0x1
	slli	a0,s6,0x3
	mulh	s1,s6,s1
	c.add	a0,a5
	srai	a5,a0,0x1f
	sw	a1,-68(s0)
	sw	a2,-64(s0)
	sw	a3,-60(s0)
	sw	a4,-56(s0)
	bne	s1,a5, .Lbranch_8000554a
	lui	a6,0x1000
	lw	a1,-88(s0)
	or	a1,a1,s4
	c.addi	a6,-1	# .Lline_table_start1+0xfb3eaa
	blt	a1,zero, .Lbranch_8000541a
	add	a7,a0,s4
	bltu	a7,a0, .Lbranch_8000555a
	c.li	a0,16
	lw	a1,-88(s0)
	c.mv	a2,a1
	blt	a0,a1, .Lbranch_8000539c
	c.li	a2,16

.Lbranch_8000539c:
	lw	s5,4(s10)
	bltu	a7,s5, .Lbranch_800053a6
	c.mv	a7,s5

.Lbranch_800053a6:
	lw	a0,8(s10)
	addi	t2,a2,4
	c.addi	a2,-16
	sw	a0,-92(s0)
	bltu	t2,a0, .Lbranch_800053bc
	lw	t2,-92(s0)

.Lbranch_800053bc:
	lw	s8,0(s10)
	bgeu	a2,t2, .Lbranch_8000542a
	and	a4,s9,a6
	andi	a5,s8,3
	mul	t3,s5,a2
	slli	a0,s4,0x2
	slli	t0,s5,0x2
	slli	t4,t3,0x2
	c.add	a0,s8
	c.add	t3,s4
	c.add	t4,a0
	sub	t1,a7,s4
	c.j	 .Lbranch_800053f2

.Lbranch_800053e8:
	c.addi	a2,1
	c.add	t4,t0
	c.add	t3,s5
	beq	a2,t2, .Lbranch_8000542a

.Lbranch_800053f2:
	mulhu	a0,a2,s5
	bne	a0,zero, .Lbranch_8000553a
	bgeu	s4,a7, .Lbranch_800053e8
	mul	a3,a2,s5
	c.mv	s1,t1
	c.mv	a1,t3
	c.mv	a0,t4

.Lbranch_80005408:
	bltu	a1,a3, .Lbranch_8000550a
	c.bnez	a5, .Lbranch_800054ec
	c.sw	a4,0(a0)
	c.addi	a0,4
	c.addi	s1,-1
	c.addi	a1,1	# _start+0x1
	c.bnez	s1, .Lbranch_80005408
	c.j	 .Lbranch_800053e8

.Lbranch_8000541a:
	lw	s8,0(s10)
	lw	s5,4(s10)
	lw	a0,8(s10)
	sw	a0,-92(s0)

.Lbranch_8000542a:
	beq	s6,zero, .Lbranch_800054be
	and	s7,s7,a6
	lw	a0,-64(s0)
	lw	s9,-56(s0)
	c.li	s10,-1
	c.lui	a1,0xfffff
	addi	s11,a0,2047
	addi	s3,a1,2038	# __heap_end+0x7fcff7f6
	c.j	 .Lbranch_80005450

.Lbranch_80005448:
	c.addi	s6,-1
	c.addi	s2,1
	beq	s6,zero, .Lbranch_800054be

.Lbranch_80005450:
	lbu	a6,0(s2)
	slli	a0,a6,0x2
	c.add	a0,s9
	lbu	a1,11(a0)
	lbu	a2,10(a0)
	lbu	a3,12(a0)
	lbu	a0,13(a0)
	c.slli	a1,0x8
	c.or	a1,a2
	c.slli	a3,0x10
	c.slli	a0,0x18
	c.or	a0,a3
	or	s1,a0,a1
	beq	s1,s10, .Lbranch_80005448
	bgeu	s1,s3, .Lbranch_8000551a
	addi	a0,s0,-68
	c.mv	a1,s8
	c.mv	a2,s5
	lw	a3,-92(s0)
	c.mv	a4,s4
	lw	a5,-88(s0)
	c.mv	a7,s7
	auipc	ra,0x1
	jalr	ra,1532(ra)	# _ZN11homebrew_os3grf7GrfFont20render_char_xrgb888817h3b6fb4799d14cd98E
	c.add	s1,s11
	lb	a0,16(s1)
	lbu	a1,15(s1)
	c.slli	a0,0x8
	c.or	a1,a0
	add	a0,s4,a1
	slt	a2,a0,s4
	slti	a1,a1,0
	bne	a1,a2, .Lbranch_8000552a
	c.mv	s4,a0
	c.j	 .Lbranch_80005448

.Lbranch_800054be:
	addi	a0,s0,-84
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0x0
	jalr	ra,1566(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_800054ce:
	c.lwsp	ra,92(sp)
	c.lwsp	s0,88(sp)
	c.lwsp	s1,84(sp)
	c.lwsp	s2,80(sp)
	c.lwsp	s3,76(sp)
	c.lwsp	s4,72(sp)
	c.lwsp	s5,68(sp)
	c.lwsp	s6,64(sp)
	c.lwsp	s7,60(sp)
	c.lwsp	s8,56(sp)
	c.lwsp	s9,52(sp)
	c.lwsp	s10,48(sp)
	c.lwsp	s11,44(sp)
	c.addi16sp	sp,96
	c.jr	ra

.Lbranch_800054ec:
	lui	a0,0x80014
	addi	a0,a0,1008	# .Lanon.94876b220182c162a7a9ea2366510c9c.3
	lui	a3,0x80014
	addi	a3,a3,1320	# .Lanon.94876b220182c162a7a9ea2366510c9c.20
	addi	a1,zero,431
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,-154(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000550a:
	lui	a0,0x80014
	addi	a0,a0,1304	# .Lanon.94876b220182c162a7a9ea2366510c9c.19
	auipc	ra,0xc
	jalr	ra,-358(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000551a:
	lui	a0,0x80015
	addi	a0,a0,696	# anon.7a8bf03ce3225e035043929a408f9c7c.90.llvm.764523667040833331
	auipc	ra,0xc
	jalr	ra,-374(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000552a:
	lui	a0,0x80015
	addi	a0,a0,680	# anon.7a8bf03ce3225e035043929a408f9c7c.65.llvm.764523667040833331
	auipc	ra,0xc
	jalr	ra,-390(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000553a:
	lui	a0,0x80014
	addi	a0,a0,1288	# .Lanon.94876b220182c162a7a9ea2366510c9c.18
	auipc	ra,0xc
	jalr	ra,-374(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000554a:
	lui	a0,0x80014
	addi	a0,a0,1256	# .Lanon.94876b220182c162a7a9ea2366510c9c.16
	auipc	ra,0xc
	jalr	ra,-390(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000555a:
	lui	a0,0x80014
	addi	a0,a0,1272	# .Lanon.94876b220182c162a7a9ea2366510c9c.17
	auipc	ra,0xc
	jalr	ra,-438(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$21draw_string_scrolling17hf87cf8002ab09fbcE
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$21draw_string_scrolling17hf87cf8002ab09fbcE:
	c.addi16sp	sp,-112
	c.swsp	ra,108(sp)
	c.swsp	s0,104(sp)
	c.swsp	s1,100(sp)
	c.swsp	s2,96(sp)
	c.swsp	s3,92(sp)
	c.swsp	s4,88(sp)
	c.swsp	s5,84(sp)
	c.swsp	s6,80(sp)
	c.swsp	s7,76(sp)
	c.swsp	s8,72(sp)
	c.swsp	s9,68(sp)
	c.swsp	s10,64(sp)
	c.swsp	s11,60(sp)
	c.addi4spn	s0,sp,112
	c.mv	s7,a7
	c.mv	s2,a6
	c.mv	s3,a5
	c.mv	s4,a4
	c.mv	s1,a3
	sw	a2,-88(s0)
	c.mv	s6,a1
	c.mv	s10,a0
	lui	a1,0x80014
	addi	a1,a1,988	# .Lanon.94876b220182c162a7a9ea2366510c9c.0
	addi	a0,s0,-84
	c.li	a2,17
	auipc	ra,0x1
	jalr	ra,1938(ra)	# _ZN11homebrew_os3grf7GrfFont9load_font17h619872f3550353d4E
	lw	a0,-84(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_800057a4
	lw	a0,-84(s0)
	lw	a1,-80(s0)
	lw	a2,-76(s0)
	lw	a3,-72(s0)
	slt	a4,zero,s6
	sub	a4,zero,a4
	and	a7,a4,s6
	add	t0,s1,a7
	sw	a0,-68(s0)
	sw	a1,-64(s0)
	sw	a2,-60(s0)
	sw	a3,-56(s0)
	bltu	t0,s1, .Lbranch_80005880
	c.li	a0,16
	lw	a1,-88(s0)
	c.mv	t5,a1
	blt	a0,a1, .Lbranch_80005600
	c.li	t5,16

.Lbranch_80005600:
	lw	s8,4(s10)
	bltu	t0,s8, .Lbranch_8000560a
	c.mv	t0,s8

.Lbranch_8000560a:
	c.mv	t6,s1
	lw	a0,8(s10)
	lui	a6,0x1000
	addi	t1,t5,8
	c.addi	t5,-16
	sw	a0,-96(s0)
	bltu	t1,a0, .Lbranch_80005626
	lw	t1,-96(s0)

.Lbranch_80005626:
	c.addi	a6,-1	# .Lline_table_start1+0xfb3eaa
	bgeu	t5,t1, .Lbranch_80005688
	c.lw	a0,4(s0)
	lw	a1,0(s10)
	mul	t4,s8,t5
	slli	a3,a7,0x2
	slli	t3,s8,0x2
	slli	a4,t4,0x2
	c.add	t4,a7
	and	a2,a0,a6
	c.add	a3,a1
	c.andi	a1,3
	c.add	a3,a4
	sub	t2,t0,a7
	c.j	 .Lbranch_8000565e

.Lbranch_80005654:
	c.addi	t5,1
	c.add	a3,t3
	c.add	t4,s8
	beq	t5,t1, .Lbranch_80005688

.Lbranch_8000565e:
	mulhu	a0,t5,s8
	bne	a0,zero, .Lbranch_80005800
	bgeu	a7,t0, .Lbranch_80005654
	mul	a4,t5,s8
	c.mv	s1,t2
	c.mv	a0,t4
	c.mv	a5,a3

.Lbranch_80005674:
	bltu	a0,a4, .Lbranch_800057e0
	bne	a1,zero, .Lbranch_800057c2
	c.sw	a2,0(a5)
	c.addi	a5,4
	c.addi	s1,-1
	c.addi	a0,1
	c.bnez	s1, .Lbranch_80005674
	c.j	 .Lbranch_80005654

.Lbranch_80005688:
	beq	s7,zero, .Lbranch_80005794
	c.mv	s1,t6
	c.lw	a0,0(s0)
	lw	a1,0(s10)
	sw	a1,-100(s0)
	lw	s5,-56(s0)
	c.li	s9,-1
	slti	a1,s3,0
	sw	a1,-92(s0)
	and	a0,a0,a6
	sw	a0,-104(s0)
	c.lui	a0,0xfffff
	addi	s11,a0,2038	# __heap_end+0x7fcff7f6

.Lbranch_800056b4:
	lbu	a6,0(s2)
	slli	a0,a6,0x2
	c.add	a0,s5
	lbu	a1,11(a0)
	lbu	a2,10(a0)
	lbu	a3,12(a0)
	lbu	a0,13(a0)
	c.slli	a1,0x8
	c.or	a1,a2
	c.slli	a3,0x10
	c.slli	a0,0x18
	c.or	a0,a3
	c.or	a0,a1
	beq	a0,s9, .Lbranch_80005706
	bgeu	a0,s11, .Lbranch_80005810
	lw	a1,-64(s0)
	c.add	a0,a1
	addi	a0,a0,2047
	lb	a1,16(a0)
	lbu	a0,15(a0)
	c.slli	a1,0x8
	or	s10,a1,a0
	blt	s4,zero, .Lbranch_8000570c

.Lbranch_800056fe:
	c.mv	a0,s4
	bne	s3,zero, .Lbranch_8000573c
	c.j	 .Lbranch_80005820

.Lbranch_80005706:
	c.li	s10,8
	bge	s4,zero, .Lbranch_800056fe

.Lbranch_8000570c:
	beq	s3,zero, .Lbranch_80005860
	bne	s3,s9, .Lbranch_8000571c
	lui	a0,0x80000
	beq	s4,a0, .Lbranch_80005850

.Lbranch_8000571c:
	rem	a1,s4,s3
	add	a0,a1,s3
	slt	a1,a0,a1
	lw	a2,-92(s0)
	bne	a2,a1, .Lbranch_80005840
	bne	s3,s9, .Lbranch_8000573c
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_80005870

.Lbranch_8000573c:
	rem	a0,a0,s3
	bge	a0,s1, .Lbranch_8000577a
	add	a4,s6,a0
	slt	a1,a4,s6
	slti	a0,a0,0
	bne	a0,a1, .Lbranch_80005830
	blt	a4,zero, .Lbranch_8000577a
	bge	a4,s8, .Lbranch_8000577a
	addi	a0,s0,-68
	lw	a1,-100(s0)
	c.mv	a2,s8
	lw	a3,-96(s0)
	lw	a5,-88(s0)
	lw	a7,-104(s0)
	auipc	ra,0x1
	jalr	ra,798(ra)	# _ZN11homebrew_os3grf7GrfFont20render_char_xrgb888817h3b6fb4799d14cd98E

.Lbranch_8000577a:
	add	a0,s4,s10
	slt	a1,a0,s4
	slti	a2,s10,0
	bne	a2,a1, .Lbranch_800057f0
	c.addi	s7,-1
	c.addi	s2,1
	c.mv	s4,a0
	bne	s7,zero, .Lbranch_800056b4

.Lbranch_80005794:
	addi	a0,s0,-84
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0x0
	jalr	ra,840(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_800057a4:
	c.lwsp	ra,108(sp)
	c.lwsp	s0,104(sp)
	c.lwsp	s1,100(sp)
	c.lwsp	s2,96(sp)
	c.lwsp	s3,92(sp)
	c.lwsp	s4,88(sp)
	c.lwsp	s5,84(sp)
	c.lwsp	s6,80(sp)
	c.lwsp	s7,76(sp)
	c.lwsp	s8,72(sp)
	c.lwsp	s9,68(sp)
	c.lwsp	s10,64(sp)
	c.lwsp	s11,60(sp)
	c.addi16sp	sp,112
	c.jr	ra

.Lbranch_800057c2:
	lui	a0,0x80014
	addi	a0,a0,1008	# .Lanon.94876b220182c162a7a9ea2366510c9c.3
	lui	a3,0x80014
	addi	a3,a3,1464	# .Lanon.94876b220182c162a7a9ea2366510c9c.29
	addi	a1,zero,431
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,-880(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800057e0:
	lui	a0,0x80014
	addi	a0,a0,1448	# .Lanon.94876b220182c162a7a9ea2366510c9c.28
	auipc	ra,0xc
	jalr	ra,-1084(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_800057f0:
	lui	a0,0x80014
	addi	a0,a0,1416	# .Lanon.94876b220182c162a7a9ea2366510c9c.26
	auipc	ra,0xc
	jalr	ra,-1100(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80005800:
	lui	a0,0x80014
	addi	a0,a0,1432	# .Lanon.94876b220182c162a7a9ea2366510c9c.27
	auipc	ra,0xc
	jalr	ra,-1084(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80005810:
	lui	a0,0x80015
	addi	a0,a0,696	# anon.7a8bf03ce3225e035043929a408f9c7c.90.llvm.764523667040833331
	auipc	ra,0xc
	jalr	ra,-1132(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80005820:
	lui	a0,0x80014
	addi	a0,a0,1384	# .Lanon.94876b220182c162a7a9ea2366510c9c.24
	auipc	ra,0xc
	jalr	ra,-1180(ra)	# _ZN4core9panicking11panic_const23panic_const_rem_by_zero17h1e30600164aa306dE

.Lbranch_80005830:
	lui	a0,0x80014
	addi	a0,a0,1400	# .Lanon.94876b220182c162a7a9ea2366510c9c.25
	auipc	ra,0xc
	jalr	ra,-1164(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80005840:
	lui	a0,0x80014
	addi	a0,a0,1368	# .Lanon.94876b220182c162a7a9ea2366510c9c.23
	auipc	ra,0xc
	jalr	ra,-1180(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80005850:
	lui	a0,0x80014
	addi	a0,a0,1352	# .Lanon.94876b220182c162a7a9ea2366510c9c.22
	auipc	ra,0xc
	jalr	ra,-1132(ra)	# _ZN4core9panicking11panic_const24panic_const_rem_overflow17h43cfcaccafa02be6E

.Lbranch_80005860:
	lui	a0,0x80014
	addi	a0,a0,1352	# .Lanon.94876b220182c162a7a9ea2366510c9c.22
	auipc	ra,0xc
	jalr	ra,-1244(ra)	# _ZN4core9panicking11panic_const23panic_const_rem_by_zero17h1e30600164aa306dE

.Lbranch_80005870:
	lui	a0,0x80014
	addi	a0,a0,1368	# .Lanon.94876b220182c162a7a9ea2366510c9c.23
	auipc	ra,0xc
	jalr	ra,-1164(ra)	# _ZN4core9panicking11panic_const24panic_const_rem_overflow17h43cfcaccafa02be6E

.Lbranch_80005880:
	lui	a0,0x80014
	addi	a0,a0,1336	# .Lanon.94876b220182c162a7a9ea2366510c9c.21
	auipc	ra,0xc
	jalr	ra,-1244(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$5clear17hd3145774bb9f1f67E
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$5clear17hd3145774bb9f1f67E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a2,4(a0)
	c.lw	a3,8(a0)
	mulhu	a4,a2,a3
	c.bnez	a4, .Lbranch_800058e6
	mul	a2,a2,a3
	c.beqz	a2, .Lbranch_800058c0
	c.lw	a0,0(a0)
	andi	a3,a0,3
	c.bnez	a3, .Lbranch_800058c8
	c.slli	a1,0x8
	c.slli	a2,0x2
	c.srli	a1,0x8
	c.add	a2,a0

.Lbranch_800058b8:
	c.sw	a1,0(a0)
	c.addi	a0,4
	bne	a0,a2, .Lbranch_800058b8

.Lbranch_800058c0:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_800058c8:
	lui	a0,0x80014
	addi	a0,a0,1008	# .Lanon.94876b220182c162a7a9ea2366510c9c.3
	lui	a3,0x80014
	addi	a3,a3,1496	# .Lanon.94876b220182c162a7a9ea2366510c9c.31
	addi	a1,zero,431
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,-1142(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800058e6:
	lui	a0,0x80014
	addi	a0,a0,1480	# .Lanon.94876b220182c162a7a9ea2366510c9c.30
	auipc	ra,0xc
	jalr	ra,-1314(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E
	# ... (zero-filled gap)

	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$9draw_char17h7b5dd6bd0ca19445E
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$9draw_char17h7b5dd6bd0ca19445E:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.addi4spn	s0,sp,64
	c.mv	s5,a4
	c.mv	s2,a3
	c.mv	s3,a2
	c.mv	s4,a1
	c.mv	s1,a0
	lui	a1,0x80014
	addi	a1,a1,988	# .Lanon.94876b220182c162a7a9ea2366510c9c.0
	addi	a0,s0,-60
	c.li	a2,17
	auipc	ra,0x1
	jalr	ra,1050(ra)	# _ZN11homebrew_os3grf7GrfFont9load_font17h619872f3550353d4E
	lw	a0,-60(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_80005984
	lw	a0,-60(s0)
	lw	a4,-56(s0)
	lw	a5,-52(s0)
	lw	a6,-48(s0)
	c.lw	a1,0(s1)
	c.lw	a2,4(s1)
	c.lw	a3,8(s1)
	sw	a0,-44(s0)
	sw	a4,-40(s0)
	sw	a5,-36(s0)
	sw	a6,-32(s0)
	c.slli	s5,0x8
	srli	a7,s5,0x8
	addi	a0,s0,-44
	c.mv	a4,s4
	c.mv	a5,s3
	c.mv	a6,s2
	auipc	ra,0x1
	jalr	ra,292(ra)	# _ZN11homebrew_os3grf7GrfFont20render_char_xrgb888817h3b6fb4799d14cd98E
	addi	a0,s0,-60
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0x0
	jalr	ra,360(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_80005984:
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.addi16sp	sp,64
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$9fill_rect17h94ffd70de5cbea8eE
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$9fill_rect17h94ffd70de5cbea8eE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	add	a6,a3,a1
	bltu	a6,a3, .Lbranch_80005a64
	lw	t1,4(a0)
	bltu	a6,t1, .Lbranch_800059b2
	c.mv	a6,t1

.Lbranch_800059b2:
	add	a7,a4,a2
	bltu	a7,a4, .Lbranch_80005a74
	c.lw	a3,8(a0)
	bltu	a7,a3, .Lbranch_800059c2
	c.mv	a7,a3

.Lbranch_800059c2:
	bgeu	a2,a7, .Lbranch_80005a1e
	c.slli	a5,0x8
	lw	t4,0(a0)
	mul	t3,t1,a2
	slli	t0,t1,0x2
	srli	t5,a5,0x8
	c.add	t3,a1
	slli	a0,t3,0x2
	andi	t6,t4,3
	c.add	t4,a0
	sub	t2,a6,a1
	c.j	 .Lbranch_800059f4

.Lbranch_800059ea:
	c.addi	a2,1
	c.add	t4,t0
	c.add	t3,t1
	beq	a2,a7, .Lbranch_80005a1e

.Lbranch_800059f4:
	mulhu	a0,a2,t1
	c.bnez	a0, .Lbranch_80005a54
	bgeu	a1,a6, .Lbranch_800059ea
	mul	a5,a2,t1
	c.mv	a3,t2
	c.mv	a4,t3
	c.mv	a0,t4

.Lbranch_80005a08:
	bltu	a4,a5, .Lbranch_80005a44
	bne	t6,zero, .Lbranch_80005a26
	sw	t5,0(a0)
	c.addi	a0,4
	c.addi	a3,-1
	c.addi	a4,1
	c.bnez	a3, .Lbranch_80005a08
	c.j	 .Lbranch_800059ea

.Lbranch_80005a1e:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_80005a26:
	lui	a0,0x80014
	addi	a0,a0,1008	# .Lanon.94876b220182c162a7a9ea2366510c9c.3
	lui	a3,0x80014
	addi	a3,a3,1576	# .Lanon.94876b220182c162a7a9ea2366510c9c.36
	addi	a1,zero,431
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,-1492(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005a44:
	lui	a0,0x80014
	addi	a0,a0,1560	# .Lanon.94876b220182c162a7a9ea2366510c9c.35
	auipc	ra,0xc
	jalr	ra,-1696(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80005a54:
	lui	a0,0x80014
	addi	a0,a0,1544	# .Lanon.94876b220182c162a7a9ea2366510c9c.34
	auipc	ra,0xc
	jalr	ra,-1680(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80005a64:
	lui	a0,0x80014
	addi	a0,a0,1512	# .Lanon.94876b220182c162a7a9ea2366510c9c.32
	auipc	ra,0xc
	jalr	ra,-1728(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80005a74:
	lui	a0,0x80014
	addi	a0,a0,1528	# .Lanon.94876b220182c162a7a9ea2366510c9c.33
	auipc	ra,0xc
	jalr	ra,-1744(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0fabdc8fdffe7aacE
_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0fabdc8fdffe7aacE:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.addi4spn	s0,sp,32
	c.mv	s1,a0
	lw	s2,0(a0)
	c.slli	s2,0x1
	c.li	a0,4
	bltu	a0,s2, .Lbranch_80005aa0
	c.li	s2,4

.Lbranch_80005aa0:
	addi	a0,s0,-28
	c.li	a3,4
	addi	a4,zero,36
	c.mv	a1,s1
	c.mv	a2,s2
	auipc	ra,0x0
	jalr	ra,274(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h8d94dc0825276f1cE.llvm.5536013400419366916
	lw	a0,-28(s0)
	c.bnez	a0, .Lbranch_80005ad2
	lw	a0,-24(s0)
	sw	s2,0(s1)
	c.sw	a0,4(s1)
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_80005ad2:
	lw	a0,-24(s0)
	lw	a1,-20(s0)
	auipc	ra,0x9
	jalr	ra,974(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE
	# ... (zero-filled gap)

	.globl _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	addi	a3,s0,-12
	c.beqz	a2, .Lbranch_80005b20
	c.lw	a4,0(a0)
	c.beqz	a4, .Lbranch_80005b1e
	mulhu	a3,a2,a4
	c.bnez	a3, .Lbranch_80005b90
	addi	a3,a1,-1	# .Lline_table_start1+0x7ffb3eaa
	c.and	a3,a1
	c.bnez	a3, .Lbranch_80005b60
	mul	a2,a4,a2
	lui	a3,0x80000
	c.sub	a3,a1
	bltu	a3,a2, .Lbranch_80005b60
	c.lw	a0,4(a0)
	sw	a1,-12(s0)
	addi	a3,s0,-16
	c.j	 .Lbranch_80005b20

.Lbranch_80005b1e:
	c.li	a2,0

.Lbranch_80005b20:
	c.sw	a2,0(a3)
	lw	a1,-12(s0)
	c.beqz	a1, .Lbranch_80005b58
	lw	a2,-16(s0)
	c.beqz	a2, .Lbranch_80005b58
	addi	a3,a1,-1
	c.and	a3,a1
	c.bnez	a3, .Lbranch_80005b72
	lui	a3,0x80000
	c.sub	a3,a1
	bltu	a3,a2, .Lbranch_80005b72
	c.li	a1,3
	bgeu	a1,a0, .Lbranch_80005bae
	lui	a1,0x80022
	addi	a1,a1,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.lw	a2,8(a1)
	addi	a3,a0,-4
	c.sw	a2,0(a0)
	c.sw	a3,8(a1)

.Lbranch_80005b58:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_80005b60:
	lui	a0,0x80014
	addi	a0,a0,2004	# anon.f35598fd8d4aa665f0d160006d04b7cb.2.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1744	# anon.f35598fd8d4aa665f0d160006d04b7cb.10.llvm.5536013400419366916
	c.j	 .Lbranch_80005b82

.Lbranch_80005b72:
	lui	a0,0x80015
	addi	a0,a0,-1096	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147
	lui	a3,0x80015
	addi	a3,a3,-1128	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147

.Lbranch_80005b82:
	addi	a1,zero,563
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,-1824(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005b90:
	lui	a0,0x80014
	addi	a0,a0,1592	# anon.f35598fd8d4aa665f0d160006d04b7cb.0.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1760	# anon.f35598fd8d4aa665f0d160006d04b7cb.9.llvm.5536013400419366916
	addi	a1,zero,373
	c.li	a2,0
	auipc	ra,0xc
	jalr	ra,-1854(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005bae:
	lui	a0,0x80015
	addi	a0,a0,-732	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147
	auipc	ra,0xc
	jalr	ra,-1962(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
	# ... (zero-filled gap)

	.globl _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h8d94dc0825276f1cE.llvm.5536013400419366916
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h8d94dc0825276f1cE.llvm.5536013400419366916:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.swsp	s1,36(sp)
	c.swsp	s2,32(sp)
	c.swsp	s3,28(sp)
	c.swsp	s4,24(sp)
	c.swsp	s5,20(sp)
	c.addi4spn	s0,sp,48
	c.mv	s5,a3
	c.addi	a3,-1
	and	a5,s5,a3
	c.bnez	a5, .Lbranch_80005cb2
	c.add	a3,a4
	sub	a5,zero,s5
	c.and	a5,a3
	lui	a3,0x80000
	sub	a3,a3,s5
	bltu	a3,a5, .Lbranch_80005cb2
	c.mv	s2,a0
	mulhu	s1,a5,a2
	c.li	s4,1
	c.li	a0,4
	c.bnez	s1, .Lbranch_80005c22
	mul	s3,a5,a2
	bltu	a3,s3, .Lbranch_80005c22
	c.lw	a0,0(a1)
	c.beqz	a0, .Lbranch_80005c26
	mulhu	a2,a4,a0
	c.bnez	a2, .Lbranch_80005ce2
	mul	a0,a0,a4
	bltu	a3,a0, .Lbranch_80005cc4
	c.lw	a1,4(a1)
	sw	s5,-32(s0)
	addi	a2,s0,-36
	c.j	 .Lbranch_80005c2a

.Lbranch_80005c22:
	c.li	s3,0
	c.j	 .Lbranch_80005c96

.Lbranch_80005c26:
	addi	a2,s0,-32

.Lbranch_80005c2a:
	c.sw	a0,0(a2)
	lw	a0,-32(s0)
	c.beqz	a0, .Lbranch_80005c58
	bne	a0,s5, .Lbranch_80005d00
	lw	a3,-36(s0)
	c.beqz	a3, .Lbranch_80005c60
	bltu	s3,a3, .Lbranch_80005d12
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.mv	a2,s5
	c.mv	a4,s3
	auipc	ra,0x0
	jalr	ra,364(ra)	# _ZN4core5alloc6global11GlobalAlloc7realloc17h8bfc1a49f0ecea61E
	c.bnez	a0, .Lbranch_80005c82
	c.j	 .Lbranch_80005c90

.Lbranch_80005c58:
	bne	s3,zero, .Lbranch_80005c64
	c.mv	a0,s5
	c.j	 .Lbranch_80005c82

.Lbranch_80005c60:
	beq	s3,zero, .Lbranch_80005c8a

.Lbranch_80005c64:
	auipc	ra,0xffffe
	jalr	ra,-1876(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.mv	a1,s5
	c.mv	a2,s3
	auipc	ra,0x0
	jalr	ra,920(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	c.beqz	a0, .Lbranch_80005c90

.Lbranch_80005c82:
	c.li	s4,0
	sw	a0,4(s2)
	c.j	 .Lbranch_80005c94

.Lbranch_80005c8a:
	c.mv	a0,s5
	bne	s5,zero, .Lbranch_80005c82

.Lbranch_80005c90:
	sw	s5,4(s2)

.Lbranch_80005c94:
	c.li	a0,8

.Lbranch_80005c96:
	c.add	a0,s2
	sw	s3,0(a0)
	sw	s4,0(s2)
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.lwsp	s4,24(sp)
	c.lwsp	s5,20(sp)
	c.addi16sp	sp,48
	c.jr	ra

.Lbranch_80005cb2:
	lui	a0,0x80014
	addi	a0,a0,2004	# anon.f35598fd8d4aa665f0d160006d04b7cb.2.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1808	# anon.f35598fd8d4aa665f0d160006d04b7cb.4.llvm.5536013400419366916
	c.j	 .Lbranch_80005cd4

.Lbranch_80005cc4:
	lui	a0,0x80014
	addi	a0,a0,2004	# anon.f35598fd8d4aa665f0d160006d04b7cb.2.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1744	# anon.f35598fd8d4aa665f0d160006d04b7cb.10.llvm.5536013400419366916

.Lbranch_80005cd4:
	addi	a1,zero,563
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,1934(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005ce2:
	lui	a0,0x80014
	addi	a0,a0,1592	# anon.f35598fd8d4aa665f0d160006d04b7cb.0.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1760	# anon.f35598fd8d4aa665f0d160006d04b7cb.9.llvm.5536013400419366916
	addi	a1,zero,373
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,1904(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005d00:
	lui	a0,0x80014
	addi	a0,a0,1780	# .Lanon.f35598fd8d4aa665f0d160006d04b7cb.1
	lui	a3,0x80015
	addi	a3,a3,-1776	# .Lanon.f35598fd8d4aa665f0d160006d04b7cb.8
	c.j	 .Lbranch_80005d22

.Lbranch_80005d12:
	lui	a0,0x80014
	addi	a0,a0,1780	# .Lanon.f35598fd8d4aa665f0d160006d04b7cb.1
	lui	a3,0x80015
	addi	a3,a3,-1792	# .Lanon.f35598fd8d4aa665f0d160006d04b7cb.6

.Lbranch_80005d22:
	addi	a1,zero,443
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,1856(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.addi4spn	s0,sp,32
	c.bnez	a4, .Lbranch_80005d48

.Lbranch_80005d3e:
	c.li	a0,0
	auipc	ra,0x9
	jalr	ra,360(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_80005d48:
	add	s1,a2,a1
	bltu	s1,a2, .Lbranch_80005d3e
	c.lw	a1,0(a0)
	c.slli	a1,0x1
	bltu	a1,s1, .Lbranch_80005d5a
	c.mv	s1,a1

.Lbranch_80005d5a:
	addi	a1,zero,1025
	c.li	a2,1
	bltu	a4,a1, .Lbranch_80005d68
	c.li	a1,1
	c.j	 .Lbranch_80005d6a

.Lbranch_80005d68:
	c.li	a1,4

.Lbranch_80005d6a:
	bne	a4,a2, .Lbranch_80005d70
	c.li	a1,8

.Lbranch_80005d70:
	c.mv	s2,a0
	bltu	a1,s1, .Lbranch_80005d78
	c.mv	s1,a1

.Lbranch_80005d78:
	addi	a0,s0,-28
	c.mv	a1,s2
	c.mv	a2,s1
	auipc	ra,0x0
	jalr	ra,-448(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h8d94dc0825276f1cE.llvm.5536013400419366916
	lw	a0,-28(s0)
	c.bnez	a0, .Lbranch_80005da6
	lw	a0,-24(s0)
	sw	s1,0(s2)
	sw	a0,4(s2)
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_80005da6:
	lw	a0,-24(s0)
	lw	a1,-20(s0)
	auipc	ra,0x9
	jalr	ra,250(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE
	# ... (zero-filled gap)

	.globl _ZN4core5alloc6global11GlobalAlloc7realloc17h8bfc1a49f0ecea61E
_ZN4core5alloc6global11GlobalAlloc7realloc17h8bfc1a49f0ecea61E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.addi4spn	s0,sp,32
	c.mv	s3,a1
	addi	a1,a2,-1
	c.and	a1,a2
	c.bnez	a1, .Lbranch_80005e4a
	c.mv	s1,a4
	c.mv	s2,a0
	lui	a0,0x80000
	c.sub	a0,a2
	bltu	a0,a4, .Lbranch_80005e4a
	c.mv	s4,a3
	c.mv	a0,s2
	c.mv	a1,a2
	c.mv	a2,s1
	auipc	ra,0x0
	jalr	ra,552(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	c.beqz	a0, .Lbranch_80005e3a
	bltu	s1,s4, .Lbranch_80005df8
	c.mv	s1,s4

.Lbranch_80005df8:
	bne	s3,zero, .Lbranch_80005dfe
	c.bnez	s1, .Lbranch_80005e68

.Lbranch_80005dfe:
	bltu	a0,s3, .Lbranch_80005e08
	sub	a1,a0,s3
	c.j	 .Lbranch_80005e0c

.Lbranch_80005e08:
	sub	a1,s3,a0

.Lbranch_80005e0c:
	bltu	a1,s1, .Lbranch_80005e68
	c.mv	s4,a0
	c.mv	a1,s3
	c.mv	a2,s1
	auipc	ra,0x0
	jalr	ra,714(ra)	# memcpy
	c.mv	a0,s4
	beq	s3,zero, .Lbranch_80005e3a
	c.li	a1,4
	bltu	s3,a1, .Lbranch_80005e86
	lw	a1,8(s2)
	addi	a2,s3,-4
	sw	a1,0(s3)
	sw	a2,8(s2)

.Lbranch_80005e3a:
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_80005e4a:
	lui	a0,0x80015
	addi	a0,a0,-1412	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.5.llvm.2171931009800262987
	lui	a3,0x80015
	addi	a3,a3,-1444	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.3.llvm.2171931009800262987
	addi	a1,zero,563
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,1544(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005e68:
	lui	a0,0x80015
	addi	a0,a0,-1728	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.0.llvm.2171931009800262987
	lui	a3,0x80015
	addi	a3,a3,-1428	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.4.llvm.2171931009800262987
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,1514(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005e86:
	lui	a0,0x80015
	addi	a0,a0,-732	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	ra,1406(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
	# ... (zero-filled gap)

	.globl _RNvCs5QKde7ScR4H_7___rustc12___rust_alloc
_RNvCs5QKde7ScR4H_7___rustc12___rust_alloc:
	addi	a3,a1,-1
	xor	a4,a1,a3
	bgeu	a3,a4, .Lbranch_80005ec0
	c.mv	a2,a0
	lui	a0,0x80000
	c.sub	a0,a1
	bltu	a0,a2, .Lbranch_80005ec0
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	auipc	t1,0x0
	jalr	zero,344(t1)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE

.Lbranch_80005ec0:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a0,0x80015
	addi	a0,a0,-1096	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147
	lui	a3,0x80015
	addi	a3,a3,-1128	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147
	addi	a1,zero,563
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,1418(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _RNvCs5QKde7ScR4H_7___rustc14___rust_dealloc
_RNvCs5QKde7ScR4H_7___rustc14___rust_dealloc:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	addi	a3,a2,-1
	xor	a4,a2,a3
	bgeu	a3,a4, .Lbranch_80005f28
	lui	a3,0x80000
	c.sub	a3,a2
	bltu	a3,a1, .Lbranch_80005f28
	c.beqz	a0, .Lbranch_80005f20
	c.li	a1,4
	bltu	a0,a1, .Lbranch_80005f46
	lui	a1,0x80022
	addi	a1,a1,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.lw	a2,8(a1)
	addi	a3,a0,-4
	c.sw	a2,0(a0)
	c.sw	a3,8(a1)

.Lbranch_80005f20:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_80005f28:
	lui	a0,0x80015
	addi	a0,a0,-1096	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147
	lui	a3,0x80015
	addi	a3,a3,-1128	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147
	addi	a1,zero,563
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,1322(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005f46:
	lui	a0,0x80015
	addi	a0,a0,-732	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	ra,1214(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
	# ... (zero-filled gap)

	.globl _RNvCs5QKde7ScR4H_7___rustc14___rust_realloc
_RNvCs5QKde7ScR4H_7___rustc14___rust_realloc:
	addi	a5,a2,-1
	xor	a4,a2,a5
	bgeu	a5,a4, .Lbranch_80005f86
	c.mv	a6,a3
	c.mv	a3,a1
	c.mv	a1,a0
	lui	a0,0x80000
	c.sub	a0,a2
	bltu	a0,a3, .Lbranch_80005f86
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.mv	a4,a6
	auipc	t1,0x0
	jalr	zero,-454(t1)	# _ZN4core5alloc6global11GlobalAlloc7realloc17h8bfc1a49f0ecea61E

.Lbranch_80005f86:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a0,0x80015
	addi	a0,a0,-1096	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147
	lui	a3,0x80015
	addi	a3,a3,-1128	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147
	addi	a1,zero,563
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,1220(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _ZN11homebrew_os4heap9init_heap17h33c877372d05e6f1E
_ZN11homebrew_os4heap9init_heap17h33c877372d05e6f1E:
	lui	a1,0x80100
	addi	a1,a1,0	# __heap_start
	addi	a0,a1,3
	bltu	a0,a1, .Lbranch_80005ff6
	c.andi	a0,-4
	lui	a1,0x80300
	addi	a1,a1,0	# __heap_end
	bgeu	a0,a1, .Lbranch_80005ff4
	sub	a2,a1,a0
	lui	a3,0x80022
	sw	a0,8(a3)	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	addi	a3,a3,8
	c.li	a4,8
	c.sw	a1,4(a3)
	bltu	a2,a4, .Lbranch_80005ff4
	c.addi	a2,-8
	lui	a1,0x80022
	addi	a1,a1,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.sw	a2,0(a0)
	sw	zero,4(a0)
	c.sw	a0,8(a1)

.Lbranch_80005ff4:
	c.jr	ra

.Lbranch_80005ff6:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a0,0x80015
	addi	a0,a0,-1112	# .Lanon.98d8f5b3645f1dd0bd97de9ecfa06603.8
	auipc	ra,0xb
	jalr	ra,934(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
_ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a3,0(a0)
	c.beqz	a3, .Lbranch_80006054
	c.li	a3,8
	bltu	a3,a1, .Lbranch_80006024
	c.li	a1,8

.Lbranch_80006024:
	add	a3,a2,a1
	bltu	a3,a2, .Lbranch_8000608e
	c.beqz	a3, .Lbranch_8000609e
	c.lw	a2,8(a0)
	c.beqz	a2, .Lbranch_80006054
	c.addi	a3,-1
	c.lw	a4,0(a2)
	sub	a1,zero,a1
	c.and	a1,a3
	c.addi	a1,4
	bgeu	a4,a1, .Lbranch_80006058

.Lbranch_80006042:
	c.mv	a3,a2
	c.lw	a2,4(a2)
	c.beqz	a2, .Lbranch_80006054
	c.lw	a4,0(a2)
	bltu	a4,a1, .Lbranch_80006042
	c.lw	a4,4(a2)
	c.sw	a4,4(a3)
	c.j	 .Lbranch_8000605c

.Lbranch_80006054:
	c.li	a0,0
	c.j	 .Lbranch_80006086

.Lbranch_80006058:
	c.lw	a3,4(a2)
	c.sw	a3,8(a0)

.Lbranch_8000605c:
	c.lw	a3,0(a2)
	bltu	a3,a1, .Lbranch_800060ae
	c.sub	a3,a1
	c.li	a4,15
	bgeu	a4,a3, .Lbranch_8000607a
	add	a4,a1,a2
	bltu	a4,a1, .Lbranch_800060ce
	c.sw	a3,0(a4)
	c.lw	a3,8(a0)
	c.sw	a3,4(a4)
	c.sw	a4,8(a0)

.Lbranch_8000607a:
	c.li	a0,-5
	c.sw	a1,0(a2)
	bltu	a0,a2, .Lbranch_800060be
	addi	a0,a2,4

.Lbranch_80006086:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_8000608e:
	lui	a0,0x80015
	addi	a0,a0,-812	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.10.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	ra,790(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000609e:
	lui	a0,0x80015
	addi	a0,a0,-796	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.11.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	ra,870(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_800060ae:
	lui	a0,0x80015
	addi	a0,a0,-780	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.12.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	ra,854(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_800060be:
	lui	a0,0x80015
	addi	a0,a0,-748	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.14.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	ra,742(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_800060ce:
	lui	a0,0x80015
	addi	a0,a0,-764	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.13.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	ra,726(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl memcpy
memcpy:
	c.beqz	a2, .Lbranch_80006104
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.add	a2,a0
	c.mv	a3,a0

.Lbranch_800060ee:
	lbu	a4,0(a1)
	sb	a4,0(a3)
	c.addi	a3,1
	c.addi	a1,1
	bne	a3,a2, .Lbranch_800060ee
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16

.Lbranch_80006104:
	c.jr	ra
	# ... (zero-filled gap)

	.globl memmove
memmove:
	beq	a0,a1, .Lbranch_80006154
	c.beqz	a2, .Lbranch_80006154
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	bgeu	a0,a1, .Lbranch_80006130
	c.add	a2,a0
	c.mv	a3,a0

.Lbranch_8000611e:
	lbu	a4,0(a1)
	sb	a4,0(a3)
	c.addi	a3,1
	c.addi	a1,1
	bne	a3,a2, .Lbranch_8000611e
	c.j	 .Lbranch_8000614e

.Lbranch_80006130:
	sub	a3,zero,a2
	addi	a4,a2,-1
	add	a2,a0,a4
	c.add	a1,a4

.Lbranch_8000613e:
	lbu	a4,0(a1)
	c.addi	a3,1
	sb	a4,0(a2)
	c.addi	a2,-1
	c.addi	a1,-1
	c.bnez	a3, .Lbranch_8000613e

.Lbranch_8000614e:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16

.Lbranch_80006154:
	c.jr	ra
	# ... (zero-filled gap)

	.globl memset
memset:
	c.beqz	a2, .Lbranch_80006176
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.add	a2,a0
	c.mv	a3,a0

.Lbranch_80006166:
	sb	a1,0(a3)
	c.addi	a3,1
	bne	a3,a2, .Lbranch_80006166
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16

.Lbranch_80006176:
	c.jr	ra

	.globl _ZN11homebrew_os12virtio_input17poll_virtio_input17h58b863981976fb93E
_ZN11homebrew_os12virtio_input17poll_virtio_input17h58b863981976fb93E:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.swsp	s11,12(sp)
	c.addi4spn	s0,sp,64
	lui	s4,0x80027
	addi	s4,s4,0	# .L_MergedGlobals.1
	lw	s5,4(s4)
	beq	s5,zero, .Lbranch_80006486
	c.li	a0,0
	c.li	a5,0
	addi	a6,zero,-97
	c.li	a7,-3
	addi	t1,zero,64
	c.li	t2,1
	addi	s2,zero,-101

.Lbranch_800061ba:
	c.li	a1,2
	c.mv	t4,a5
	bltu	a1,a5, .Lbranch_800061c4
	c.li	t4,2

.Lbranch_800061c4:
	slli	a1,a5,0x9
	slli	s1,a5,0x4
	addi	s11,a1,50
	addi	ra,a1,52
	addi	t6,a1,48
	addi	a1,s1,28
	addi	a4,s1,16
	c.addi	s1,30
	c.j	 .Lbranch_800061fc

.Lbranch_800061e4:
	c.addi	a5,1
	addi	s11,s11,512
	addi	ra,ra,512
	addi	t6,t6,512
	c.addi	a1,16
	c.addi	a4,16
	c.addi	s1,16
	bgeu	a5,s5, .Lbranch_80006488

.Lbranch_800061fc:
	beq	t4,a5, .Lbranch_800064fc
	add	a2,s4,s1
	lbu	a2,0(a2)
	c.beqz	a2, .Lbranch_800061e4
	add	a2,s4,a4
	lw	t0,0(a2)
	bltu	a6,t0, .Lbranch_80006520
	andi	a3,t0,3
	bne	a3,zero, .Lbranch_800064a8
	lw	s6,4(a2)
	c.lw	a3,8(a2)
	lw	a2,96(t0)
	c.beqz	a2, .Lbranch_80006232
	bltu	s2,t0, .Lbranch_80006540
	sw	a2,100(t0)

.Lbranch_80006232:
	bltu	a7,a3, .Lbranch_80006530
	andi	a2,a3,1
	bne	a2,zero, .Lbranch_800064ba
	lhu	t5,2(a3)
	add	s7,s4,a1
	lhu	a2,0(s7)
	beq	t5,a2, .Lbranch_800061e4
	c.li	s3,-5
	bltu	s3,a3, .Lbranch_80006510
	addi	a4,a3,4
	andi	s8,a3,2
	andi	s9,s6,1
	addi	s10,s6,4
	c.addi	a5,1
	c.add	s11,s4
	c.add	ra,s4
	c.add	t6,s4
	c.j	 .Lbranch_8000627a

.Lbranch_8000626e:
	c.addi	a2,1
	slli	a1,a2,0x10
	c.srli	a1,0x10
	beq	a1,t5, .Lbranch_80006470

.Lbranch_8000627a:
	slli	a1,a2,0x1a
	c.srli	a1,0x17
	c.add	a1,a4
	bltu	a1,a4, .Lbranch_80006510
	bne	s8,zero, .Lbranch_800064cc
	lw	s2,0(a1)
	bgeu	s2,t1, .Lbranch_8000626e
	slli	a1,s2,0x3
	add	a3,t6,a1
	lhu	a3,0(a3)
	beq	a3,t2, .Lbranch_800062d8
	c.li	s1,3
	bne	a3,s1, .Lbranch_8000632e
	add	a3,s11,a1
	lhu	a3,0(a3)
	c.beqz	a3, .Lbranch_8000630e
	bne	a3,t2, .Lbranch_8000632e
	c.add	a1,ra
	lui	a3,0x80021
	lw	a3,1424(a3)	# _ZN11homebrew_os12virtio_input13SCREEN_HEIGHT17h471b6b177d2dd028E.0
	c.lw	a1,0(a1)
	mul	s1,a3,a1
	mulhu	a1,a3,a1
	c.slli	a1,0x11
	c.srli	s1,0xf
	c.or	a1,s1
	c.li	s3,-5
	sw	a1,12(s4)
	c.j	 .Lbranch_8000632e

.Lbranch_800062d8:
	add	a3,ra,a1
	c.lw	a3,0(a3)
	bne	a3,t2, .Lbranch_8000632e
	c.add	a1,s11
	lhu	a1,0(a1)
	c.addi	a1,-2
	addi	a3,zero,55
	bltu	a3,a1, .Lbranch_8000632e
	c.slli	a1,0x2
	lui	a3,0x80015
	addi	a3,a3,-716	# .LJTI0_0
	c.add	a1,a3
	c.lw	a3,0(a1)
	c.li	t4,1
	addi	a1,zero,49
	c.jr	a3
	addi	a1,zero,50
	c.j	 .Lbranch_80006332

.Lbranch_8000630e:
	c.add	a1,ra
	lui	a3,0x80021
	lw	a3,1420(a3)	# .L_MergedGlobals
	c.lw	a1,0(a1)
	mul	s1,a3,a1
	mulhu	a1,a3,a1
	c.slli	a1,0x11
	c.srli	s1,0xf
	c.or	a1,s1
	c.li	s3,-5
	sw	a1,8(s4)

.Lbranch_8000632e:
	c.mv	a1,t3
	c.mv	t4,a0

.Lbranch_80006332:
	bltu	a7,s6, .Lbranch_80006550
	bne	s9,zero, .Lbranch_800064de
	lhu	a0,2(s6)
	bltu	s3,s6, .Lbranch_80006570
	slli	a3,a0,0x1a
	c.srli	a3,0x19
	c.add	a3,s10
	bltu	a3,s10, .Lbranch_80006560
	sh	s2,0(a3)
	c.addi	a0,1
	sh	a0,2(s6)
	c.mv	t3,a1
	c.mv	a0,t4
	c.j	 .Lbranch_8000626e
	addi	a1,zero,109
	c.j	 .Lbranch_80006332
	addi	a1,zero,107
	c.j	 .Lbranch_80006332
	addi	a1,zero,99
	c.j	 .Lbranch_80006332
	addi	a1,zero,120
	c.j	 .Lbranch_80006332
	addi	a1,zero,92
	c.j	 .Lbranch_80006332
	addi	a1,zero,115
	c.j	 .Lbranch_80006332
	addi	a1,zero,44
	c.j	 .Lbranch_80006332
	addi	a1,zero,117
	c.j	 .Lbranch_80006332
	addi	a1,zero,108
	c.j	 .Lbranch_80006332
	addi	a1,zero,112
	c.j	 .Lbranch_80006332
	addi	a1,zero,119
	c.j	 .Lbranch_80006332
	addi	a1,zero,97
	c.j	 .Lbranch_80006332
	addi	a1,zero,57
	c.j	 .Lbranch_80006332
	addi	a1,zero,93
	c.j	 .Lbranch_80006332
	addi	a1,zero,118
	c.j	 .Lbranch_80006332
	addi	a1,zero,45
	c.j	 .Lbranch_80006332
	addi	a1,zero,102
	c.j	 .Lbranch_80006332
	addi	a1,zero,52
	c.j	 .Lbranch_80006332
	addi	a1,zero,51
	c.j	 .Lbranch_80006332
	addi	a1,zero,103
	c.j	 .Lbranch_80006332
	addi	a1,zero,106
	c.j	 .Lbranch_80006332
	addi	a1,zero,91
	c.j	 .Lbranch_80006332
	addi	a1,zero,113
	c.j	 .Lbranch_80006332
	addi	a1,zero,105
	c.j	 .Lbranch_80006332
	addi	a1,zero,53
	c.j	 .Lbranch_80006332
	addi	a1,zero,61
	c.j	 .Lbranch_80006332
	addi	a1,zero,98
	c.j	 .Lbranch_80006332
	addi	a1,zero,46
	c.j	 .Lbranch_80006332
	addi	a1,zero,54
	c.j	 .Lbranch_80006332
	c.li	a1,13
	c.j	 .Lbranch_80006332
	addi	a1,zero,47
	c.j	 .Lbranch_80006332
	addi	a1,zero,122
	c.j	 .Lbranch_80006332
	addi	a1,zero,104
	c.j	 .Lbranch_80006332
	addi	a1,zero,101
	c.j	 .Lbranch_80006332
	addi	a1,zero,114
	c.j	 .Lbranch_80006332
	addi	a1,zero,55
	c.j	 .Lbranch_80006332
	addi	a1,zero,56
	c.j	 .Lbranch_80006332
	addi	a1,zero,48
	c.j	 .Lbranch_80006332
	addi	a1,zero,59
	c.j	 .Lbranch_80006332
	addi	a1,zero,121
	c.j	 .Lbranch_80006332
	addi	a1,zero,116
	c.j	 .Lbranch_80006332
	addi	a1,zero,110
	c.j	 .Lbranch_80006332
	addi	a1,zero,111
	c.j	 .Lbranch_80006332
	addi	a1,zero,100
	c.j	 .Lbranch_80006332
	addi	a1,zero,39
	c.j	 .Lbranch_80006332
	addi	a1,zero,32
	c.j	 .Lbranch_80006332

.Lbranch_80006470:
	sh	t5,0(s7)
	fence	w,w
	sw	zero,80(t0)
	addi	s2,zero,-101
	bltu	a5,s5, .Lbranch_800061ba
	c.j	 .Lbranch_80006488

.Lbranch_80006486:
	c.li	a0,0

.Lbranch_80006488:
	c.mv	a1,t3
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.lwsp	s11,12(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_800064a8:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-460	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.3
	c.j	 .Lbranch_800064ee

.Lbranch_800064ba:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-412	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.6
	c.j	 .Lbranch_800064ee

.Lbranch_800064cc:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-380	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.8
	c.j	 .Lbranch_800064ee

.Lbranch_800064de:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-348	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.10

.Lbranch_800064ee:
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,-140(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800064fc:
	lui	a2,0x80015
	addi	a2,a2,-492	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.1
	c.li	a1,2
	c.mv	a0,t4
	auipc	ra,0xb
	jalr	ra,-220(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_80006510:
	lui	a0,0x80015
	addi	a0,a0,-396	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.7
	auipc	ra,0xb
	jalr	ra,-364(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006520:
	lui	a0,0x80015
	addi	a0,a0,-476	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.2
	auipc	ra,0xb
	jalr	ra,-380(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006530:
	lui	a0,0x80015
	addi	a0,a0,-428	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.5
	auipc	ra,0xb
	jalr	ra,-396(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006540:
	lui	a0,0x80015
	addi	a0,a0,-444	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.4
	auipc	ra,0xb
	jalr	ra,-412(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006550:
	lui	a0,0x80015
	addi	a0,a0,-364	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.9
	auipc	ra,0xb
	jalr	ra,-428(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006560:
	lui	a0,0x80015
	addi	a0,a0,-316	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.12
	auipc	ra,0xb
	jalr	ra,-444(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006570:
	lui	a0,0x80015
	addi	a0,a0,-332	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.11
	auipc	ra,0xb
	jalr	ra,-460(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN11homebrew_os12virtio_input17scan_virtio_input17hd5fae2a7099670aaE
_ZN11homebrew_os12virtio_input17scan_virtio_input17hd5fae2a7099670aaE:
	c.addi16sp	sp,-96
	c.swsp	ra,92(sp)
	c.swsp	s0,88(sp)
	c.swsp	s1,84(sp)
	c.swsp	s2,80(sp)
	c.swsp	s3,76(sp)
	c.swsp	s4,72(sp)
	c.swsp	s5,68(sp)
	c.swsp	s6,64(sp)
	c.swsp	s7,60(sp)
	c.swsp	s8,56(sp)
	c.swsp	s9,52(sp)
	c.swsp	s10,48(sp)
	c.swsp	s11,44(sp)
	c.addi4spn	s0,sp,96
	c.li	a0,0
	lui	a6,0x10001
	lui	a7,0x10002
	lui	t0,0x10003
	lui	a4,0x10004
	lui	a5,0x10005
	lui	s1,0x10006
	lui	a1,0x10007
	lui	a2,0x10008
	lui	s4,0x80027
	addi	s4,s4,0	# .L_MergedGlobals.1
	addi	s5,zero,32
	addi	s6,s0,-84
	c.li	s7,2
	lui	a3,0x74727
	c.li	s8,-9
	c.li	s9,18
	c.li	s2,1
	sw	a6,-84(s0)
	sw	a7,-80(s0)
	sw	t0,-76(s0)
	sw	a4,-72(s0)
	c.li	s11,3
	sw	a5,-68(s0)
	sw	s1,-64(s0)
	sw	a1,-60(s0)
	sw	a2,-56(s0)
	sw	zero,4(s4)
	addi	s10,a3,-1674	# .Lline_table_start1+0x746da821
	c.j	 .Lbranch_80006614

.Lbranch_80006608:
	lw	a0,4(s4)
	c.addi	s5,-4
	c.addi	s6,4
	beq	s5,zero, .Lbranch_800066c8

.Lbranch_80006614:
	bgeu	a0,s7, .Lbranch_800066cc
	lw	s1,0(s6)
	andi	a0,s1,3
	c.bnez	a0, .Lbranch_800066ec
	c.lw	a0,0(s1)
	bne	a0,s10, .Lbranch_80006608
	bltu	s8,s1, .Lbranch_8000670a
	c.lw	a0,8(s1)
	bne	a0,s9, .Lbranch_80006608
	c.lw	a2,4(s1)
	addi	a0,zero,-113
	bltu	a0,s1, .Lbranch_8000671a
	sw	zero,112(s1)	# .Lline_table_start1+0xffb9f1b
	sw	s2,112(s1)
	sw	s11,112(s1)
	bne	a2,s7, .Lbranch_8000668c
	sw	zero,20(s1)
	lw	zero,16(s1)
	sw	zero,36(s1)
	sw	zero,32(s1)
	sw	s2,20(s1)
	c.lw	a0,16(s1)
	sw	s2,36(s1)
	c.andi	a0,1
	c.sw	a0,32(s1)
	c.li	a0,11
	c.sw	a0,112(s1)
	c.lw	a0,112(s1)
	c.andi	a0,8
	c.beqz	a0, .Lbranch_80006608
	lw	s3,4(s4)
	c.li	a2,2
	c.mv	a0,s1
	c.mv	a1,s3
	auipc	ra,0x0
	jalr	ra,282(ra)	# _ZN11homebrew_os12virtio_input18setup_virtio_queue17h266c6690d2722370E
	c.beqz	a0, .Lbranch_80006608
	c.li	a0,15
	c.j	 .Lbranch_800066a8

.Lbranch_8000668c:
	lw	zero,16(s1)
	sw	zero,32(s1)
	lw	s3,4(s4)
	c.mv	a0,s1
	c.mv	a1,s3
	auipc	ra,0x0
	jalr	ra,252(ra)	# _ZN11homebrew_os12virtio_input18setup_virtio_queue17h266c6690d2722370E
	c.beqz	a0, .Lbranch_80006608
	c.li	a0,7

.Lbranch_800066a8:
	c.sw	a0,112(s1)
	bgeu	s3,s7, .Lbranch_8000672a
	lw	a0,4(s4)
	c.slli	s3,0x4
	c.add	s3,s4
	c.addi	a0,1
	sw	s1,16(s3)
	sb	s2,30(s3)
	c.beqz	a0, .Lbranch_8000673e
	sw	a0,4(s4)
	c.j	 .Lbranch_80006608

.Lbranch_800066c8:
	sltu	s2,zero,a0

.Lbranch_800066cc:
	c.mv	a0,s2
	c.lwsp	ra,92(sp)
	c.lwsp	s0,88(sp)
	c.lwsp	s1,84(sp)
	c.lwsp	s2,80(sp)
	c.lwsp	s3,76(sp)
	c.lwsp	s4,72(sp)
	c.lwsp	s5,68(sp)
	c.lwsp	s6,64(sp)
	c.lwsp	s7,60(sp)
	c.lwsp	s8,56(sp)
	c.lwsp	s9,52(sp)
	c.lwsp	s10,48(sp)
	c.lwsp	s11,44(sp)
	c.addi16sp	sp,96
	c.jr	ra

.Lbranch_800066ec:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-300	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.13
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,-666(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000670a:
	lui	a0,0x80015
	addi	a0,a0,-284	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.14
	auipc	ra,0xb
	jalr	ra,-870(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000671a:
	lui	a0,0x80015
	addi	a0,a0,-268	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.15
	auipc	ra,0xb
	jalr	ra,-886(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000672a:
	lui	a2,0x80015
	addi	a2,a2,-252	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.16
	c.li	a1,2
	c.mv	a0,s3
	auipc	ra,0xb
	jalr	ra,-778(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000673e:
	lui	a0,0x80015
	addi	a0,a0,-236	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.17
	auipc	ra,0xb
	jalr	ra,-922(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os12virtio_input18get_mouse_position17hde71303e6559bc97E
_ZN11homebrew_os12virtio_input18get_mouse_position17hde71303e6559bc97E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a2,0x80027
	lbu	a0,0(a2)	# .L_MergedGlobals.1
	c.beqz	a0, .Lbranch_80006770
	lui	a1,0x80027
	addi	a1,a1,0	# .L_MergedGlobals.1
	c.lw	a0,8(a1)
	c.lw	a1,12(a1)
	c.j	 .Lbranch_80006790

.Lbranch_80006770:
	lui	a0,0x80021
	addi	a1,a0,1420	# .L_MergedGlobals
	lw	a0,1420(a0)
	c.lw	a1,4(a1)
	addi	a3,a2,0
	c.srli	a0,0x1
	c.srli	a1,0x1
	c.sw	a0,8(a3)
	c.sw	a1,12(a3)
	c.li	a3,1
	sb	a3,0(a2)

.Lbranch_80006790:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

	.globl _ZN11homebrew_os12virtio_input18setup_virtio_queue17h266c6690d2722370E
_ZN11homebrew_os12virtio_input18setup_virtio_queue17h266c6690d2722370E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.li	a4,1
	andi	a3,a0,3
	bne	a2,a4, .Lbranch_800067b4
	bne	a3,zero, .Lbranch_800068ea
	c.lui	a3,0x1
	c.sw	a3,40(a0)
	c.j	 .Lbranch_800067b8

.Lbranch_800067b4:
	bne	a3,zero, .Lbranch_800068d8

.Lbranch_800067b8:
	sw	zero,48(a0)
	lw	a7,52(a0)
	beq	a7,zero, .Lbranch_800068cc
	addi	a3,zero,64
	c.mv	t4,a7
	bltu	a7,a3, .Lbranch_800067d2
	addi	t4,zero,64

.Lbranch_800067d2:
	c.li	a3,2
	sw	t4,56(a0)
	bgeu	a1,a3, .Lbranch_80006908
	slli	a3,a1,0xd
	lui	t0,0x80023
	addi	t0,t0,0	# _ZN11homebrew_os12virtio_input9QUEUE_MEM17h43e029b3a29c211aE
	add	t2,t0,a3
	c.lui	a5,0xfffff
	beq	t2,a5, .Lbranch_8000691c
	slli	a5,t4,0x4
	c.lui	a6,0x1
	slli	a4,a1,0x4
	lui	t1,0x80027
	addi	t1,t1,0	# .L_MergedGlobals.1
	c.add	a3,t0
	c.lui	t3,0x2
	or	t0,a5,t2
	c.add	a6,t2
	c.add	a4,t1
	sw	t0,20(a4)	# .Lline_table_start1+0xffb7ebf
	sw	a6,24(a4)
	sh	zero,28(a4)
	c.add	a3,t3
	c.mv	a4,t2

.Lbranch_80006820:
	sb	zero,0(a4)
	c.addi	a4,1
	bne	a4,a3, .Lbranch_80006820
	c.li	a5,0
	addi	a4,t0,4
	c.slli	a1,0x9
	c.li	t3,8
	c.add	a1,t1
	addi	a1,a1,48
	c.li	t1,2
	c.mv	a3,t2

.Lbranch_8000683e:
	addi	t5,a5,1	# __heap_end+0x7fcff001
	c.sw	a1,0(a3)
	sw	zero,4(a3)	# .Lline_table_start0+0x1004
	sw	t3,8(a3)
	sw	t1,12(a3)
	sh	a5,0(a4)
	c.addi	a4,2
	c.addi	a3,16
	c.addi	a1,8
	c.mv	a5,t5
	bne	t4,t5, .Lbranch_8000683e
	c.li	a1,2
	sh	t4,2(t0)
	bne	a2,a1, .Lbranch_800068ba
	addi	a1,zero,-129
	bltu	a1,a0, .Lbranch_8000692c
	addi	a1,zero,-133
	sw	t2,128(a0)
	bltu	a1,a0, .Lbranch_8000693c
	addi	a1,zero,-145
	sw	zero,132(a0)
	bltu	a1,a0, .Lbranch_8000694c
	addi	a1,zero,-149
	sw	t0,144(a0)
	bltu	a1,a0, .Lbranch_8000695c
	addi	a1,zero,-161
	sw	zero,148(a0)
	bltu	a1,a0, .Lbranch_8000696c
	addi	a1,zero,-165
	sw	a6,160(a0)
	bltu	a1,a0, .Lbranch_8000697c
	sw	zero,164(a0)
	addi	a1,a0,68
	c.li	a2,1
	c.j	 .Lbranch_800068c6

.Lbranch_800068ba:
	c.lui	a1,0x1
	c.sw	a1,60(a0)
	addi	a1,a0,64
	srli	a2,t2,0xc

.Lbranch_800068c6:
	c.sw	a2,0(a1)
	sw	zero,80(a0)

.Lbranch_800068cc:
	sltu	a0,zero,a7
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_800068d8:
	lui	a0,0x80015
	addi	a0,a0,204	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.39
	lui	a3,0x80015
	addi	a3,a3,-204	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.21
	c.j	 .Lbranch_800068fa

.Lbranch_800068ea:
	lui	a0,0x80015
	addi	a0,a0,204	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.39
	lui	a3,0x80015
	addi	a3,a3,-220	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.19

.Lbranch_800068fa:
	addi	a1,zero,431
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,-1176(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80006908:
	lui	a2,0x80015
	addi	a2,a2,-188	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.24
	c.mv	a0,a1
	c.li	a1,2
	auipc	ra,0xb
	jalr	ra,-1256(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000691c:
	lui	a0,0x80015
	addi	a0,a0,-172	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.25
	auipc	ra,0xb
	jalr	ra,-1400(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000692c:
	lui	a0,0x80015
	addi	a0,a0,-156	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.26
	auipc	ra,0xb
	jalr	ra,-1416(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000693c:
	lui	a0,0x80015
	addi	a0,a0,-140	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.27
	auipc	ra,0xb
	jalr	ra,-1432(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000694c:
	lui	a0,0x80015
	addi	a0,a0,-124	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.28
	auipc	ra,0xb
	jalr	ra,-1448(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000695c:
	lui	a0,0x80015
	addi	a0,a0,-108	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.29
	auipc	ra,0xb
	jalr	ra,-1464(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000696c:
	lui	a0,0x80015
	addi	a0,a0,-92	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.30
	auipc	ra,0xb
	jalr	ra,-1480(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000697c:
	lui	a0,0x80015
	addi	a0,a0,-76	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.31
	auipc	ra,0xb
	jalr	ra,-1496(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN11homebrew_os12virtio_input21get_device_debug_info17hc1251cc8b7a6264dE
_ZN11homebrew_os12virtio_input21get_device_debug_info17hc1251cc8b7a6264dE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a2,0x80027
	addi	a2,a2,0	# .L_MergedGlobals.1
	c.lw	a3,4(a2)
	bgeu	a1,a3, .Lbranch_800069d8
	c.li	a3,1
	bltu	a3,a1, .Lbranch_80006a02
	c.slli	a1,0x4
	c.add	a1,a2
	lbu	a2,30(a1)	# .Lline_table_start0+0x101e
	c.beqz	a2, .Lbranch_800069d8
	c.lw	a2,24(a1)
	c.li	a3,-3
	bltu	a3,a2, .Lbranch_80006a16
	andi	a3,a2,1
	c.bnez	a3, .Lbranch_800069e4
	lh	a2,2(a2)
	c.lw	a3,16(a1)
	lh	a1,28(a1)
	c.sw	a3,4(a0)
	sh	a1,8(a0)
	sh	a2,10(a0)
	c.li	a1,1
	c.j	 .Lbranch_800069da

.Lbranch_800069d8:
	c.li	a1,0

.Lbranch_800069da:
	c.sw	a1,0(a0)
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_800069e4:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-28	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.37
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0xb
	jalr	ra,-1426(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80006a02:
	lui	a2,0x80015
	addi	a2,a2,-60	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.35
	c.mv	a0,a1
	c.li	a1,2
	auipc	ra,0xb
	jalr	ra,-1506(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_80006a16:
	lui	a0,0x80015
	addi	a0,a0,-44	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.36
	auipc	ra,0xb
	jalr	ra,-1650(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os12virtio_input21get_virtio_input_base17h6be0520dd895412cE
_ZN11homebrew_os12virtio_input21get_virtio_input_base17h6be0520dd895412cE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a0,0x80027
	addi	a0,a0,0	# .L_MergedGlobals.1
	c.lw	a1,4(a0)
	c.lw	a0,16(a0)
	sltiu	a1,a1,1
	c.addi	a1,-1
	c.and	a0,a1
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

	.globl _ZN11homebrew_os12virtio_input21set_screen_dimensions17h6a324b5fc5e74e12E
_ZN11homebrew_os12virtio_input21set_screen_dimensions17h6a324b5fc5e74e12E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a2,0x80021
	sw	a0,1420(a2)	# .L_MergedGlobals
	addi	a0,a2,1420
	c.sw	a1,4(a0)
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os8hardware17riscv_clint_timer15RiscvClintTimer10get_cycles17h71c4e1bf1225940fE
_ZN11homebrew_os8hardware17riscv_clint_timer15RiscvClintTimer10get_cycles17h71c4e1bf1225940fE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a2,0x200c

.Lbranch_80006a78:
	lw	a1,-4(a2)	# .Lline_table_start1+0x1fbfea7
	lw	a0,-8(a2)
	lw	a3,-4(a2)
	bne	a1,a3, .Lbranch_80006a78
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

	.globl _ZN11homebrew_os3grf7GrfFont20render_char_xrgb888817h3b6fb4799d14cd98E
_ZN11homebrew_os3grf7GrfFont20render_char_xrgb888817h3b6fb4799d14cd98E:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.swsp	s11,12(sp)
	c.addi4spn	s0,sp,64
	c.lw	s1,12(a0)
	c.slli	a6,0x2
	c.add	a6,s1
	lbu	t1,11(a6)	# .Lline_table_start0+0x100b
	lbu	t0,10(a6)
	lbu	t2,12(a6)
	lbu	s1,13(a6)
	c.slli	t1,0x8
	or	a6,t1,t0
	c.slli	t2,0x10
	c.slli	s1,0x18
	or	s1,s1,t2
	or	t0,s1,a6
	c.li	a6,-1
	beq	t0,a6, .Lbranch_80006c6e
	c.lui	s1,0xfffff
	addi	s1,s1,2038	# __heap_end+0x7fcff7f6
	bgeu	t0,s1, .Lbranch_80006d0a
	c.lw	a0,4(a0)
	c.add	a0,t0
	addi	t1,a0,2047
	lbu	a6,20(t1)
	lbu	t0,19(t1)
	lbu	t2,22(t1)
	lbu	s1,21(t1)
	c.slli	a6,0x8
	or	a0,a6,t0
	c.slli	t2,0x8
	or	a6,t2,s1
	mul	t0,a6,a0
	blt	t0,zero, .Lbranch_80006c8c
	beq	t0,zero, .Lbranch_80006c6e
	lb	a0,12(t1)
	lbu	s1,11(t1)
	c.slli	a0,0x8
	c.or	a0,s1
	add	s8,a4,a0
	slt	a4,s8,a4
	slti	a0,a0,0
	bne	a0,a4, .Lbranch_80006d1a
	lb	a0,14(t1)
	lbu	a4,13(t1)
	c.slli	a0,0x8
	c.or	a0,a4
	slt	a4,zero,a0
	sub	s3,a5,a0
	slt	a0,s3,a5
	bne	a4,a0, .Lbranch_80006d2a
	beq	a6,zero, .Lbranch_80006c6e
	c.li	s9,0
	slli	a0,a7,0x8
	slli	a4,a7,0x10
	andi	t2,a7,255
	addi	t3,zero,239
	c.lui	a5,0x10
	srli	t4,a0,0x18
	srli	t5,a4,0x18
	addi	t6,a5,-256	# .Lline_table_start0+0x1ea2
	lui	s2,0xff0
	c.j	 .Lbranch_80006b7e

.Lbranch_80006b78:
	c.addi	s9,1
	beq	s9,a6, .Lbranch_80006c6e

.Lbranch_80006b7e:
	add	a0,s3,s9
	slt	a4,a0,s3
	slti	a5,s9,0
	bne	a5,a4, .Lbranch_80006cfa
	blt	a0,zero, .Lbranch_80006b78
	bge	a0,a3, .Lbranch_80006b78
	lbu	a4,20(t1)
	lbu	a5,19(t1)
	c.slli	a4,0x8
	or	s7,a4,a5
	beq	s7,zero, .Lbranch_80006b78
	c.li	s10,0
	mul	s4,a0,a2
	mulhu	a0,a0,a2
	sltu	s5,zero,a0
	c.j	 .Lbranch_80006bc2

.Lbranch_80006bb8:
	sw	a0,0(s6)

.Lbranch_80006bbc:
	c.addi	s10,1
	beq	s7,s10, .Lbranch_80006b78

.Lbranch_80006bc2:
	add	a0,s8,s10
	slt	a4,a0,s8
	slti	s1,s10,0
	bne	s1,a4, .Lbranch_80006caa
	blt	a0,zero, .Lbranch_80006bbc
	bge	a0,a2, .Lbranch_80006bbc
	lbu	a4,20(t1)
	lbu	a5,19(t1)
	c.slli	a4,0x8
	c.or	a4,a5
	mulh	s6,s9,a4
	mul	a5,s9,a4
	srai	a4,a5,0x1f
	bne	s6,a4, .Lbranch_80006cba
	add	a4,a5,s10
	slt	a5,a4,a5
	bne	s1,a5, .Lbranch_80006cca
	bgeu	a4,t0, .Lbranch_80006bbc
	c.add	a4,t1
	lbu	s1,23(a4)
	c.beqz	s1, .Lbranch_80006bbc
	bne	s5,zero, .Lbranch_80006cda
	add	a4,a0,s4
	bltu	a4,a0, .Lbranch_80006cea
	c.slli	a4,0x2
	add	s6,a1,a4
	c.mv	a0,a7
	bltu	t3,s1, .Lbranch_80006bb8
	lw	a0,0(s6)
	xori	a4,s1,255
	mul	s11,t4,s1
	slli	a5,a0,0x10
	andi	ra,a0,255
	c.slli	a0,0x8
	c.srli	a5,0x18
	c.srli	a0,0x18
	mul	ra,ra,a4
	mul	a0,a0,a4
	mul	a4,a5,a4
	mul	a5,t5,s1
	mul	s1,t2,s1
	c.add	s1,ra
	c.add	a0,s11
	c.add	a4,a5
	c.slli	s1,0x10
	and	a4,a4,t6
	c.srli	s1,0x18
	c.slli	a0,0x8
	and	a0,a0,s2
	c.or	a4,s1
	c.or	a0,a4
	c.j	 .Lbranch_80006bb8

.Lbranch_80006c6e:
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.lwsp	s11,12(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_80006c8c:
	lui	a0,0x8001b
	addi	a0,a0,-1736	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.92
	lui	a3,0x80015
	addi	a3,a3,420	# _ZN11homebrew_os8hardware17riscv_clint_timer17RISCV_CLINT_TIMER17h1d86eac2e9802949E
	addi	a1,zero,559
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,1990(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80006caa:
	lui	a0,0x80015
	addi	a0,a0,484	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.47
	auipc	ra,0xa
	jalr	ra,1786(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006cba:
	lui	a0,0x80015
	addi	a0,a0,500	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.48
	auipc	ra,0xa
	jalr	ra,1802(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80006cca:
	lui	a0,0x80015
	addi	a0,a0,516	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.49
	auipc	ra,0xa
	jalr	ra,1754(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006cda:
	lui	a0,0x80015
	addi	a0,a0,532	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.50
	auipc	ra,0xa
	jalr	ra,1770(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80006cea:
	lui	a0,0x80015
	addi	a0,a0,532	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.50
	auipc	ra,0xa
	jalr	ra,1722(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006cfa:
	lui	a0,0x80015
	addi	a0,a0,468	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.46
	auipc	ra,0xa
	jalr	ra,1706(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006d0a:
	lui	a0,0x80015
	addi	a0,a0,696	# anon.7a8bf03ce3225e035043929a408f9c7c.90.llvm.764523667040833331
	auipc	ra,0xa
	jalr	ra,1690(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006d1a:
	lui	a0,0x80015
	addi	a0,a0,436	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.44
	auipc	ra,0xa
	jalr	ra,1674(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006d2a:
	lui	a0,0x80015
	addi	a0,a0,452	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.45
	auipc	ra,0xa
	jalr	ra,1754(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os3grf7GrfFont9load_font17h619872f3550353d4E
_ZN11homebrew_os3grf7GrfFont9load_font17h619872f3550353d4E:
	c.addi16sp	sp,-176
	c.swsp	ra,172(sp)
	c.swsp	s0,168(sp)
	c.swsp	s1,164(sp)
	c.swsp	s2,160(sp)
	c.swsp	s3,156(sp)
	c.swsp	s4,152(sp)
	c.addi4spn	s0,sp,176
	c.mv	s4,a2
	c.mv	s3,a1
	c.li	a1,10
	c.mv	s2,a0
	beq	a2,a1, .Lbranch_80006df0
	c.li	a0,13
	beq	s4,a0, .Lbranch_80006d86
	c.li	a0,17
	bne	s4,a0, .Lbranch_80006e12
	lui	a1,0x80015
	addi	a1,a1,548	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.51
	c.li	a2,17
	c.mv	a0,s3
	auipc	ra,0xb
	jalr	ra,-1492(ra)	# memcmp
	c.bnez	a0, .Lbranch_80006e1c
	lui	a0,0x80015
	addi	a0,a0,660	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.63
	c.li	s1,20
	c.j	 .Lbranch_80006e20

.Lbranch_80006d86:
	lui	a1,0x80015
	addi	a1,a1,580	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.53
	c.li	a2,13
	c.mv	a0,s3
	auipc	ra,0xb
	jalr	ra,-1526(ra)	# memcmp
	c.li	s1,16
	beq	a0,zero, .Lbranch_80006f66
	lui	a1,0x80015
	addi	a1,a1,596	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.54
	c.li	a2,13
	c.mv	a0,s3
	auipc	ra,0xb
	jalr	ra,-1552(ra)	# memcmp
	beq	a0,zero, .Lbranch_80007044
	lui	a1,0x80015
	addi	a1,a1,612	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.55
	c.li	a2,13
	c.mv	a0,s3
	auipc	ra,0xb
	jalr	ra,-1576(ra)	# memcmp
	beq	a0,zero, .Lbranch_8000704e
	lui	a1,0x80015
	addi	a1,a1,628	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.56
	c.li	a2,13
	c.mv	a0,s3
	auipc	ra,0xb
	jalr	ra,-1600(ra)	# memcmp
	c.bnez	a0, .Lbranch_80006e1c
	lui	a0,0x80013
	addi	a0,a0,1844	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x20
	c.j	 .Lbranch_80006e20

.Lbranch_80006df0:
	lui	a1,0x80015
	addi	a1,a1,568	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.52
	c.li	a2,10
	c.mv	a0,s3
	auipc	ra,0xb
	jalr	ra,-1632(ra)	# memcmp
	c.bnez	a0, .Lbranch_80006e1c
	lui	a0,0x80015
	addi	a0,a0,644	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.62
	c.li	s1,13
	c.j	 .Lbranch_80006e20

.Lbranch_80006e12:
	c.li	a1,4
	c.mv	s1,s4
	c.mv	a0,s3
	bltu	s4,a1, .Lbranch_80006e20

.Lbranch_80006e1c:
	c.mv	s1,s4
	c.mv	a0,s3

.Lbranch_80006e20:
	lui	a1,0x80021
	addi	a1,a1,1436	# _ZN11homebrew_os6sdcard6SDCARD17h379c7efac5c6e208E.llvm.1505749371568489489
	lbu	a1,11(a1)
	c.li	a2,2
	sw	a0,-164(s0)
	sw	s1,-160(s0)
	beq	a1,a2, .Lbranch_80006fa4
	lui	a1,0x80021
	addi	a1,a1,1436	# _ZN11homebrew_os6sdcard6SDCARD17h379c7efac5c6e208E.llvm.1505749371568489489
	addi	a0,s0,-156
	auipc	ra,0x0
	jalr	ra,1874(ra)	# _ZN11homebrew_os5fat3213FatFilesystem12mount_direct17h69cd49ef6e09f7a1E
	lw	a0,-156(s0)
	beq	a0,zero, .Lbranch_80006fa4
	addi	a0,s0,-108
	addi	a1,s0,-156
	addi	a2,zero,48
	auipc	ra,0xfffff
	jalr	ra,638(ra)	# memcpy
	c.li	a0,1
	addi	a1,s0,-164
	lui	a2,0x8000b
	addi	a2,a2,948	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h7e91003129bfa5a6E
	sw	zero,-60(s0)
	sw	a0,-56(s0)
	sw	zero,-52(s0)
	sw	a1,-36(s0)
	sw	a2,-32(s0)
	lui	a1,0x80013
	addi	a1,a1,-1776	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.1.llvm.2171931009800262987+0x160
	addi	a0,s0,-48
	addi	a2,s0,-36
	auipc	ra,0x7
	jalr	ra,1580(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a1,-44(s0)
	lw	a2,-40(s0)
	addi	a0,s0,-108
	addi	a3,s0,-60
	auipc	ra,0x3
	jalr	ra,940(ra)	# _ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$9read_file17h0de8b06997d32bb8E
	c.beqz	a0, .Lbranch_80006ed4
	addi	a0,s0,-48
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xfffff
	jalr	ra,-994(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-60
	c.j	 .Lbranch_80006f8c

.Lbranch_80006ed4:
	lw	a0,-52(s0)
	lw	a1,-60(s0)
	lw	a2,-56(s0)
	addi	a3,zero,1029
	srli	a4,a0,0x1
	sw	a1,-36(s0)
	sw	a2,-32(s0)
	sw	a0,-28(s0)
	bltu	a4,a3, .Lbranch_80006f70
	lw	a0,-32(s0)
	lbu	a1,1(a0)
	lbu	a2,0(a0)
	lbu	a3,2(a0)
	lbu	a4,3(a0)
	c.slli	a1,0x8
	c.or	a1,a2
	c.slli	a3,0x10
	c.slli	a4,0x18
	c.or	a3,a4
	lui	a2,0x47524
	c.or	a1,a3
	addi	a2,a2,1584	# .Lline_table_start1+0x474d84db
	bne	a1,a2, .Lbranch_80006f70
	lw	s1,-60(s0)
	lw	a1,-56(s0)
	lw	a2,-52(s0)
	sw	s1,0(s2)	# .Lline_table_start1+0xfa3eab
	sw	a1,4(s2)
	sw	a2,8(s2)
	sw	a0,12(s2)
	addi	a0,s0,-48
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xfffff
	jalr	ra,-1124(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-108
	auipc	ra,0x4
	jalr	ra,-412(ra)	# _ZN4core3ptr54drop_in_place$LT$homebrew_os..fat32..FatFilesystem$GT$17h59521002a70f1b69E
	lui	a0,0x80000
	beq	s1,a0, .Lbranch_80006fa4
	c.j	 .Lbranch_80006fc8

.Lbranch_80006f66:
	lui	a0,0x80013
	addi	a0,a0,1972	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0xa0
	c.j	 .Lbranch_80006e20

.Lbranch_80006f70:
	lui	a0,0x80000
	sw	a0,0(s2)
	addi	a0,s0,-36
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xfffff
	jalr	ra,-1180(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-48

.Lbranch_80006f8c:
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xfffff
	jalr	ra,-1196(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-108
	auipc	ra,0x4
	jalr	ra,-484(ra)	# _ZN4core3ptr54drop_in_place$LT$homebrew_os..fat32..FatFilesystem$GT$17h59521002a70f1b69E

.Lbranch_80006fa4:
	c.li	a0,17
	bne	s4,a0, .Lbranch_80006fc0
	lui	a1,0x80015
	addi	a1,a1,548	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.51
	c.li	a2,17
	c.mv	a0,s3
	auipc	ra,0xa
	jalr	ra,2022(ra)	# memcmp
	c.beqz	a0, .Lbranch_80006fd8

.Lbranch_80006fc0:
	lui	a0,0x80000
	sw	a0,0(s2)

.Lbranch_80006fc8:
	c.lwsp	ra,172(sp)
	c.lwsp	s0,168(sp)
	c.lwsp	s1,164(sp)
	c.lwsp	s2,160(sp)
	c.lwsp	s3,156(sp)
	c.lwsp	s4,152(sp)
	c.addi16sp	sp,176
	c.jr	ra

.Lbranch_80006fd8:
	auipc	ra,0xffffc
	jalr	ra,1336(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.lui	a1,0x5
	addi	s3,a1,1647	# .Lline_table_start0+0x1000
	c.li	a1,1
	c.mv	a2,s3
	auipc	ra,0xfffff
	jalr	ra,30(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	c.beqz	a0, .Lbranch_80007076
	c.mv	s4,a0
	lui	a0,0x80015
	addi	a0,a0,712	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.91
	bltu	a0,s4, .Lbranch_80007010
	sub	a0,a0,s4
	c.j	 .Lbranch_80007014

.Lbranch_80007010:
	sub	a0,s4,a0

.Lbranch_80007014:
	c.lui	a1,0x5
	addi	s1,a1,1647	# .Lline_table_start0+0x1000
	bltu	a0,s1, .Lbranch_80007058
	lui	a1,0x80015
	addi	a1,a1,712	# .Lanon.7a8bf03ce3225e035043929a408f9c7c.91
	c.mv	a0,s4
	c.mv	a2,s1
	auipc	ra,0xfffff
	jalr	ra,182(ra)	# memcpy
	sw	s1,0(s2)
	sw	s4,4(s2)
	sw	s1,8(s2)
	sw	s4,12(s2)
	c.j	 .Lbranch_80006fc8

.Lbranch_80007044:
	lui	a0,0x80013
	addi	a0,a0,1924	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x70
	c.j	 .Lbranch_80006e20

.Lbranch_8000704e:
	lui	a0,0x80013
	addi	a0,a0,1860	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x30
	c.j	 .Lbranch_80006e20

.Lbranch_80007058:
	lui	a0,0x8001b
	addi	a0,a0,-1424	# anon.aec296b685f742a7405bc8100ce2f275.4.llvm.14967730159154455495
	lui	a3,0x8001b
	addi	a3,a3,104	# anon.aec296b685f742a7405bc8100ce2f275.21.llvm.14967730159154455495
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,1018(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80007076:
	c.li	a0,1
	c.mv	a1,s3
	auipc	ra,0x8
	jalr	ra,-466(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE
	# ... (zero-filled gap)

	.globl _ZN132_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$alloc..vec..spec_extend..SpecExtend$LT$$RF$T$C$core..slice..iter..Iter$LT$T$GT$$GT$$GT$11spec_extend17h0a24df4b2be1c256E
_ZN132_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$alloc..vec..spec_extend..SpecExtend$LT$$RF$T$C$core..slice..iter..Iter$LT$T$GT$$GT$$GT$11spec_extend17h0a24df4b2be1c256E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.addi4spn	s0,sp,32
	bltu	a2,a1, .Lbranch_80007106
	sub	s1,a2,a1
	blt	s1,zero, .Lbranch_800070e8
	c.mv	s2,a0
	c.lw	a0,0(a0)
	lw	s3,8(s2)
	sub	a0,a0,s3
	bltu	a0,s1, .Lbranch_80007124

.Lbranch_800070b0:
	lw	a0,4(s2)
	c.add	a0,s3
	bltu	a0,a1, .Lbranch_800070c0
	sub	a2,a0,a1
	c.j	 .Lbranch_800070c4

.Lbranch_800070c0:
	sub	a2,a1,a0

.Lbranch_800070c4:
	bltu	a2,s1, .Lbranch_80007140
	c.mv	a2,s1
	auipc	ra,0xfffff
	jalr	ra,22(ra)	# memcpy
	c.add	s1,s3
	sw	s1,8(s2)
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_800070e8:
	lui	a0,0x8001b
	addi	a0,a0,-476	# anon.aec296b685f742a7405bc8100ce2f275.16.llvm.14967730159154455495
	lui	a3,0x8001b
	addi	a3,a3,88	# anon.aec296b685f742a7405bc8100ce2f275.19.llvm.14967730159154455495
	addi	a1,zero,559
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,874(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80007106:
	lui	a0,0x8001b
	addi	a0,a0,-1140	# anon.aec296b685f742a7405bc8100ce2f275.5.llvm.14967730159154455495
	lui	a3,0x8001b
	addi	a3,a3,-1456	# anon.aec296b685f742a7405bc8100ce2f275.1.llvm.14967730159154455495
	addi	a1,zero,403
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,844(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80007124:
	c.li	a3,1
	c.li	a4,1
	c.mv	a0,s2
	c.mv	s4,a1
	c.mv	a1,s3
	c.mv	a2,s1
	auipc	ra,0xfffff
	jalr	ra,-1024(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE
	c.mv	a1,s4
	lw	s3,8(s2)
	c.j	 .Lbranch_800070b0

.Lbranch_80007140:
	lui	a0,0x8001b
	addi	a0,a0,-1424	# anon.aec296b685f742a7405bc8100ce2f275.4.llvm.14967730159154455495
	lui	a3,0x8001b
	addi	a3,a3,104	# anon.aec296b685f742a7405bc8100ce2f275.21.llvm.14967730159154455495
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,786(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _ZN67_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h9aa3a55fd397abf0E
_ZN67_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h9aa3a55fd397abf0E:
	c.addi16sp	sp,-80
	c.swsp	ra,76(sp)
	c.swsp	s0,72(sp)
	c.swsp	s1,68(sp)
	c.swsp	s2,64(sp)
	c.swsp	s3,60(sp)
	c.swsp	s4,56(sp)
	c.swsp	s5,52(sp)
	c.swsp	s6,48(sp)
	c.swsp	s7,44(sp)
	c.swsp	s8,40(sp)
	c.swsp	s9,36(sp)
	c.swsp	s10,32(sp)
	c.addi4spn	s0,sp,80
	c.mv	s2,a0
	lw	s5,8(a1)
	lui	a0,0x38e4
	slli	s1,s5,0x2
	slli	s4,s5,0x5
	addi	a0,a0,-1821	# .Lline_table_start1+0x389778e
	c.add	s4,s1
	bgeu	a0,s5, .Lbranch_800071a6
	c.li	s7,0

.Lbranch_8000719a:
	c.mv	a0,s7
	c.mv	a1,s4
	auipc	ra,0x8
	jalr	ra,-758(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_800071a6:
	beq	s4,zero, .Lbranch_80007274
	lw	s6,4(a1)
	auipc	ra,0xffffc
	jalr	ra,866(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,4
	c.li	s7,4
	c.mv	a2,s4
	auipc	ra,0xfffff
	jalr	ra,-436(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	c.beqz	a0, .Lbranch_8000719a
	c.mv	s3,a0
	c.andi	a0,3
	c.bnez	a0, .Lbranch_800072a2
	beq	s5,zero, .Lbranch_8000727a
	c.srli	s1,0x2
	addi	a0,s5,-1
	bltu	s1,a0, .Lbranch_800071e4
	c.mv	s1,a0

.Lbranch_800071e4:
	c.li	s7,0
	slli	a0,s1,0x2
	c.slli	s1,0x5
	c.add	a0,s1
	addi	s8,a0,36
	lui	s9,0x80000
	c.j	 .Lbranch_80007254

.Lbranch_800071f8:
	sw	s9,-60(s0)

.Lbranch_800071fc:
	add	s1,s3,s7
	addi	a1,s10,21
	lw	a0,-60(s0)
	lw	a2,-56(s0)
	lw	a3,-52(s0)
	lw	a4,12(s10)
	lw	a5,16(s10)
	lbu	a6,20(s10)
	lbu	s10,32(s10)
	sw	a0,-72(s0)
	sw	a2,-68(s0)
	sw	a3,-64(s0)
	c.sw	a0,0(s1)
	c.sw	a2,4(s1)
	c.sw	a3,8(s1)
	c.sw	a4,12(s1)
	c.sw	a5,16(s1)
	sb	a6,20(s1)
	addi	a0,s1,21
	c.li	a2,11
	auipc	ra,0xfffff
	jalr	ra,-352(ra)	# memcpy
	addi	s7,s7,36
	sb	s10,32(s1)
	beq	s7,s8, .Lbranch_8000727a

.Lbranch_80007254:
	beq	s4,s7, .Lbranch_8000727a
	add	s10,s6,s7
	lw	a0,0(s10)
	beq	a0,s9, .Lbranch_800071f8
	addi	a0,s0,-60
	c.mv	a1,s10
	auipc	ra,0x8
	jalr	ra,-638(ra)	# _ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h023a536b8922818aE
	c.j	 .Lbranch_800071fc

.Lbranch_80007274:
	bne	s5,zero, .Lbranch_800072c0
	c.li	s3,4

.Lbranch_8000727a:
	sw	s5,0(s2)
	sw	s3,4(s2)
	sw	s5,8(s2)
	c.lwsp	ra,76(sp)
	c.lwsp	s0,72(sp)
	c.lwsp	s1,68(sp)
	c.lwsp	s2,64(sp)
	c.lwsp	s3,60(sp)
	c.lwsp	s4,56(sp)
	c.lwsp	s5,52(sp)
	c.lwsp	s6,48(sp)
	c.lwsp	s7,44(sp)
	c.lwsp	s8,40(sp)
	c.lwsp	s9,36(sp)
	c.lwsp	s10,32(sp)
	c.addi16sp	sp,80
	c.jr	ra

.Lbranch_800072a2:
	lui	a0,0x8001b
	addi	a0,a0,-196	# anon.aec296b685f742a7405bc8100ce2f275.17.llvm.14967730159154455495
	lui	a3,0x8001b
	addi	a3,a3,584	# anon.aec296b685f742a7405bc8100ce2f275.29.llvm.14967730159154455495
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,432(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800072c0:
	lui	a0,0x8001b
	addi	a0,a0,-700	# anon.aec296b685f742a7405bc8100ce2f275.14.llvm.14967730159154455495
	lui	a3,0x8001b
	addi	a3,a3,320	# anon.aec296b685f742a7405bc8100ce2f275.24.llvm.14967730159154455495
	addi	a1,zero,443
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,402(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _ZN90_$LT$core..str..iter..Split$LT$P$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42fc3d73efed7744E
_ZN90_$LT$core..str..iter..Split$LT$P$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42fc3d73efed7744E:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.swsp	s11,12(sp)
	c.addi4spn	s0,sp,64
	c.mv	s4,a0
	lbu	a0,37(a0)
	c.beqz	a0, .Lbranch_8000730a

.Lbranch_80007306:
	c.li	a0,0
	c.j	 .Lbranch_800073f6

.Lbranch_8000730a:
	lw	s6,8(s4)
	lw	s7,16(s4)
	lw	s5,4(s4)
	bltu	s6,s7, .Lbranch_800073c8
	lw	s1,12(s4)
	bltu	s7,s1, .Lbranch_800073c8
	lbu	s2,24(s4)
	addi	a0,s2,-1
	c.li	a1,3
	bltu	a1,a0, .Lbranch_80007448
	addi	s3,s4,20
	c.add	a0,s3
	lbu	s8,0(a0)
	c.li	s9,8
	c.li	s10,5
	c.j	 .Lbranch_80007344

.Lbranch_80007340:
	bltu	s7,s1, .Lbranch_800073c8

.Lbranch_80007344:
	sub	a2,s7,s1
	add	a3,s5,s1
	bgeu	a2,s9, .Lbranch_8000736a
	c.li	a1,0
	c.beqz	a2, .Lbranch_8000737c

.Lbranch_80007354:
	add	a0,a3,a1
	lbu	a0,0(a0)
	beq	a0,s8, .Lbranch_8000737e
	c.addi	a1,1
	bne	a2,a1, .Lbranch_80007354
	c.mv	a1,a2
	c.j	 .Lbranch_800073c4

.Lbranch_8000736a:
	c.mv	a0,s8
	c.mv	a1,a3
	auipc	ra,0xa
	jalr	ra,-1614(ra)	# _ZN4core5slice6memchr14memchr_aligned17h88e38207834fe1c3E
	c.andi	a0,1
	c.bnez	a0, .Lbranch_80007384
	c.j	 .Lbranch_800073c4

.Lbranch_8000737c:
	c.j	 .Lbranch_800073c4

.Lbranch_8000737e:
	c.li	a0,1
	c.andi	a0,1
	c.beqz	a0, .Lbranch_800073c4

.Lbranch_80007384:
	c.add	a1,s1
	addi	s1,a1,1
	sw	s1,12(s4)
	bltu	s1,s2, .Lbranch_80007340
	bltu	s6,s1, .Lbranch_80007340
	bgeu	s2,s10, .Lbranch_80007414
	sub	s11,s1,s2
	add	a0,s5,s11
	c.mv	a1,s3
	c.mv	a2,s2
	auipc	ra,0xa
	jalr	ra,1014(ra)	# memcmp
	c.bnez	a0, .Lbranch_80007340
	lw	a0,28(s4)
	bltu	s11,a0, .Lbranch_8000742a
	sub	a1,s11,a0
	c.add	a0,s5
	sw	s1,28(s4)
	c.j	 .Lbranch_800073f6

.Lbranch_800073c4:
	sw	s7,12(s4)

.Lbranch_800073c8:
	lbu	a0,36(s4)
	c.li	a1,1
	sb	a1,37(s4)
	c.beqz	a0, .Lbranch_800073de
	lw	a0,28(s4)
	lw	a1,32(s4)
	c.j	 .Lbranch_800073ea

.Lbranch_800073de:
	lw	a0,28(s4)
	lw	a1,32(s4)
	beq	a1,a0, .Lbranch_80007306

.Lbranch_800073ea:
	bltu	s6,a1, .Lbranch_8000742a
	bltu	a1,a0, .Lbranch_8000742a
	c.sub	a1,a0
	c.add	a0,s5

.Lbranch_800073f6:
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.lwsp	s11,12(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_80007414:
	lui	a3,0x8001b
	addi	a3,a3,568	# .Lanon.aec296b685f742a7405bc8100ce2f275.28
	c.li	a2,4
	c.li	a0,0
	c.mv	a1,s2
	auipc	ra,0xa
	jalr	ra,-2002(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_8000742a:
	lui	a0,0x8001b
	addi	a0,a0,-920	# .Lanon.aec296b685f742a7405bc8100ce2f275.12
	lui	a3,0x8001b
	addi	a3,a3,-936	# .Lanon.aec296b685f742a7405bc8100ce2f275.11
	addi	a1,zero,439
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,40(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80007448:
	lui	a0,0x8001b
	addi	a0,a0,336	# .Lanon.aec296b685f742a7405bc8100ce2f275.25
	lui	a3,0x8001b
	addi	a3,a3,552	# .Lanon.aec296b685f742a7405bc8100ce2f275.27
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,10(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _ZN98_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter..SpecFromIter$LT$T$C$I$GT$$GT$9from_iter17h6c66ad93582d4b77E
_ZN98_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter..SpecFromIter$LT$T$C$I$GT$$GT$9from_iter17h6c66ad93582d4b77E:
	c.addi16sp	sp,-96
	c.swsp	ra,92(sp)
	c.swsp	s0,88(sp)
	c.swsp	s1,84(sp)
	c.swsp	s2,80(sp)
	c.swsp	s3,76(sp)
	c.swsp	s4,72(sp)
	c.swsp	s5,68(sp)
	c.swsp	s6,64(sp)
	c.addi4spn	s0,sp,96
	c.mv	s1,a1
	c.mv	s2,a0

.Lbranch_80007480:
	c.mv	a0,s1
	auipc	ra,0x0
	jalr	ra,-418(ra)	# _ZN90_$LT$core..str..iter..Split$LT$P$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42fc3d73efed7744E
	c.beqz	a0, .Lbranch_8000752e
	c.beqz	a1, .Lbranch_80007480
	c.mv	s5,a1
	c.mv	s6,a0
	auipc	ra,0xffffc
	jalr	ra,126(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,4
	addi	a2,zero,32
	c.li	s4,4
	auipc	ra,0xfffff
	jalr	ra,-1178(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	c.beqz	a0, .Lbranch_80007588
	c.mv	s3,a0
	sw	s6,0(a0)
	sw	s5,4(a0)
	c.li	s5,1
	sw	s4,-84(s0)
	sw	a0,-80(s0)
	sw	s5,-76(s0)
	addi	a0,s0,-72
	addi	a2,zero,40
	c.mv	a1,s1
	auipc	ra,0xfffff
	jalr	ra,-1014(ra)	# memcpy

.Lbranch_800074de:
	addi	a0,s0,-72
	auipc	ra,0x0
	jalr	ra,-514(ra)	# _ZN90_$LT$core..str..iter..Split$LT$P$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42fc3d73efed7744E
	c.beqz	a0, .Lbranch_8000753e
	c.beqz	a1, .Lbranch_800074de
	beq	s5,s4, .Lbranch_8000750c

.Lbranch_800074f2:
	slli	a2,s5,0x3
	c.add	a2,s3
	c.sw	a0,0(a2)
	c.sw	a1,4(a2)
	lw	s4,-84(s0)
	bgeu	s5,s4, .Lbranch_8000756a
	c.addi	s5,1
	sw	s5,-76(s0)
	c.j	 .Lbranch_800074de

.Lbranch_8000750c:
	c.mv	s3,a0
	addi	a0,s0,-84
	c.li	a2,1
	c.li	a3,4
	c.li	a4,8
	c.mv	s1,a1
	c.mv	a1,s4
	auipc	ra,0xfffff
	jalr	ra,-2028(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE
	c.mv	a1,s1
	c.mv	a0,s3
	lw	s3,-80(s0)
	c.j	 .Lbranch_800074f2

.Lbranch_8000752e:
	c.li	a0,4
	sw	zero,0(s2)
	sw	a0,4(s2)
	sw	zero,8(s2)
	c.j	 .Lbranch_80007556

.Lbranch_8000753e:
	lw	a0,-84(s0)
	lw	a1,-80(s0)
	lw	a2,-76(s0)
	sw	a0,0(s2)
	sw	a1,4(s2)
	sw	a2,8(s2)

.Lbranch_80007556:
	c.lwsp	ra,92(sp)
	c.lwsp	s0,88(sp)
	c.lwsp	s1,84(sp)
	c.lwsp	s2,80(sp)
	c.lwsp	s3,76(sp)
	c.lwsp	s4,72(sp)
	c.lwsp	s5,68(sp)
	c.lwsp	s6,64(sp)
	c.addi16sp	sp,96
	c.jr	ra

.Lbranch_8000756a:
	lui	a0,0x8001b
	addi	a0,a0,120	# anon.aec296b685f742a7405bc8100ce2f275.22.llvm.14967730159154455495
	lui	a3,0x8001b
	addi	a3,a3,-1440	# anon.aec296b685f742a7405bc8100ce2f275.3.llvm.14967730159154455495
	addi	a1,zero,397
	c.li	a2,0
	auipc	ra,0xa
	jalr	ra,-280(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80007588:
	c.li	a0,4
	addi	a1,zero,32
	auipc	ra,0x8
	jalr	ra,-1766(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os5fat3213FatFilesystem12mount_direct17h69cd49ef6e09f7a1E
_ZN11homebrew_os5fat3213FatFilesystem12mount_direct17h69cd49ef6e09f7a1E:
	addi	sp,sp,-672
	sw	ra,668(sp)
	sw	s0,664(sp)
	sw	s1,660(sp)
	sw	s2,656(sp)
	sw	s3,652(sp)
	sw	s4,648(sp)
	sw	s5,644(sp)
	sw	s6,640(sp)
	sw	s7,636(sp)
	sw	s8,632(sp)
	sw	s9,628(sp)
	sw	s10,624(sp)
	sw	s11,620(sp)
	c.addi4spn	s0,sp,672
	c.mv	s2,a1
	c.mv	s4,a0
	addi	a0,zero,1000
	lui	a1,0x80014

.Lbranch_800075de:
	lw	zero,84(a1)	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0xc
	c.addi	a0,-1
	c.bnez	a0, .Lbranch_800075de
	addi	a0,s0,-660
	c.mv	a1,s2
	auipc	ra,0x3
	jalr	ra,1436(ra)	# _ZN11homebrew_os3mbr3Mbr20read_partition_table17hd15281352b8e6865E
	lw	s1,-660(s0)
	lw	s3,-656(s0)
	lw	s5,-652(s0)
	c.li	a0,2
	bne	s1,a0, .Lbranch_80007616

.Lbranch_80007606:
	sw	zero,0(s4)
	sw	s3,4(s4)
	sw	s5,8(s4)
	jal	zero, .Lbranch_800080ac

.Lbranch_80007616:
	addi	a1,s0,-648
	addi	a0,s0,-104
	addi	a2,zero,52
	auipc	ra,0xfffff
	jalr	ra,-1346(ra)	# memcpy
	andi	a0,s1,1
	sw	s1,-116(s0)
	sw	s3,-112(s0)
	sw	s5,-108(s0)
	c.beqz	a0, .Lbranch_8000764e
	lbu	a0,-104(s0)
	addi	a1,a0,-11
	c.li	a2,2
	addi	a0,s0,-116
	bltu	a1,a2, .Lbranch_8000769e

.Lbranch_8000764e:
	lw	a0,-100(s0)
	c.beqz	a0, .Lbranch_80007666
	lbu	a0,-88(s0)
	c.addi	a0,-11
	c.li	a1,2
	bgeu	a0,a1, .Lbranch_80007666
	addi	a0,s0,-100
	c.j	 .Lbranch_8000769e

.Lbranch_80007666:
	lw	a0,-84(s0)
	c.beqz	a0, .Lbranch_8000767e
	lbu	a0,-72(s0)
	c.addi	a0,-11
	c.li	a1,2
	bgeu	a0,a1, .Lbranch_8000767e
	addi	a0,s0,-84
	c.j	 .Lbranch_8000769e

.Lbranch_8000767e:
	lw	a0,-68(s0)
	lui	s3,0x8001c
	addi	s3,s3,-1852	# anon.4f3670b34252f595ba15bc6ea6b03f16.1.llvm.9280728237393296864
	c.li	s5,24
	c.beqz	a0, .Lbranch_80007606
	lbu	a0,-56(s0)
	c.addi	a0,-11
	c.li	a1,2
	bgeu	a0,a1, .Lbranch_80007606
	addi	a0,s0,-68

.Lbranch_8000769e:
	lw	s3,4(a0)
	lui	s1,0xf0004
	addi	a0,s0,-664
	lui	s6,0x8000f
	addi	s6,s6,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	s3,-664(s0)
	sw	a0,-116(s0)
	sw	s6,-112(s0)
	lui	a1,0x80012
	addi	a1,a1,1316	# anon.3839376bf29ad69682d1272c1c63f1dd.31.llvm.7710812085696039936+0x84
	addi	a0,s0,-660
	addi	a2,s0,-116
	auipc	ra,0x7
	jalr	ra,-518(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-656(s0)
	lw	a1,-652(s0)

.Lbranch_800076de:
	lw	a2,-2044(s1)	# __heap_end+0x6fd03804
	c.bnez	a2, .Lbranch_800076de
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_800076ec:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800076ec
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_800076fa:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800076fa
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80007708:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007708
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80007716:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007716
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_80007724:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007724
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80007732:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007732
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80007758
	c.add	a1,a0

.Lbranch_80007744:
	lbu	a2,0(a0)

.Lbranch_80007748:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80007748
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80007744

.Lbranch_80007758:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80007758
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-660
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,888(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-660
	addi	a2,zero,512
	c.li	a1,0
	auipc	ra,0xfffff
	jalr	ra,-1574(ra)	# memset
	addi	a2,s0,-660
	addi	a3,zero,512
	c.mv	a0,s2
	c.mv	a1,s3
	auipc	ra,0x4
	jalr	ra,1686(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	c.beqz	a0, .Lbranch_800077ac
	addi	a0,zero,32
	lui	a1,0x80013
	addi	a1,a1,-1004	# .Lanon.50240f12f5a0150d632a0929b9f04c3b.20+0x4c
	jal	zero, .Lbranch_800080a0

.Lbranch_800077ac:
	lbu	a0,-649(s0)
	lbu	a1,-648(s0)
	lbu	s7,-647(s0)
	lbu	a2,-646(s0)
	lbu	a3,-645(s0)
	lbu	s9,-644(s0)
	lbu	a6,-624(s0)
	lbu	a5,-623(s0)
	c.slli	a1,0x8
	c.slli	a3,0x8
	or	a4,a1,a0
	or	s11,a3,a2
	lbu	a0,-621(s0)
	lbu	a1,-622(s0)
	lbu	a2,-616(s0)
	lbu	a3,-615(s0)
	c.slli	a0,0x18
	c.slli	a1,0x10
	c.slli	a5,0x8
	or	a6,a5,a6
	c.or	a0,a1
	lbu	a1,-614(s0)
	lbu	a5,-613(s0)
	c.slli	a3,0x8
	c.or	a2,a3
	sw	s7,-144(s0)
	sw	s9,-136(s0)
	c.slli	a5,0x18
	c.slli	a1,0x10
	c.or	a1,a5
	sw	a4,-672(s0)
	sw	a4,-148(s0)
	sw	s11,-140(s0)
	or	s8,a6,a0
	c.or	a1,a2
	sw	s8,-132(s0)
	sw	a1,-668(s0)
	sw	a1,-128(s0)
	auipc	ra,0xffffc
	jalr	ra,-796(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,1
	c.li	a2,27
	auipc	ra,0xffffe
	jalr	ra,2000(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	beq	a0,zero, .Lbranch_80008104
	c.mv	s5,a0
	lui	a0,0x8001b
	addi	a0,a0,600	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.1
	bltu	a0,s5, .Lbranch_80007860
	sub	a0,a0,s5
	c.j	 .Lbranch_80007864

.Lbranch_80007860:
	sub	a0,s5,a0

.Lbranch_80007864:
	c.li	a1,26
	bgeu	a1,a0, .Lbranch_800080e6
	c.mv	s10,s9
	lui	a1,0x8001b
	addi	a1,a1,600	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.1
	c.li	a2,27
	c.li	s9,27
	c.mv	a0,s5
	auipc	ra,0xfffff
	jalr	ra,-1946(ra)	# memcpy
	sw	s9,-116(s0)
	sw	s5,-112(s0)
	sw	s9,-108(s0)

.Lbranch_8000788e:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000788e
	addi	a0,zero,91
	sw	a0,-2048(s1)

.Lbranch_8000789c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000789c
	addi	a0,zero,68
	sw	a0,-2048(s1)
	c.mv	s9,s10

.Lbranch_800078ac:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_800078ac
	addi	a0,zero,93
	sw	a0,-2048(s1)

.Lbranch_800078ba:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_800078ba
	addi	a0,zero,48
	sw	a0,-2048(s1)

.Lbranch_800078c8:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_800078c8
	addi	a0,zero,54
	sw	a0,-2048(s1)

.Lbranch_800078d6:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_800078d6
	addi	a0,zero,58
	sw	a0,-2048(s1)

.Lbranch_800078e4:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_800078e4
	addi	a1,zero,32
	sw	a1,-2048(s1)
	c.li	a1,27

.Lbranch_800078f4:
	add	a2,s5,a0
	lbu	a2,0(a2)

.Lbranch_800078fc:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_800078fc
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_800078f4

.Lbranch_8000790c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000790c
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,452(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-148
	sw	a0,-124(s0)
	sw	s6,-120(s0)
	lui	a1,0x80012
	addi	a1,a1,-1396	# anon.3839376bf29ad69682d1272c1c63f1dd.7.llvm.7710812085696039936+0x1bc
	addi	a0,s0,-116
	addi	a2,s0,-124
	auipc	ra,0x7
	jalr	ra,-1148(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-112(s0)
	lw	a1,-108(s0)

.Lbranch_80007954:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007954
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80007962:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007962
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80007970:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007970
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000797e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000797e
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_8000798c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000798c
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_8000799a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000799a
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_800079a8:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800079a8
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_800079ce
	c.add	a1,a0

.Lbranch_800079ba:
	lbu	a2,0(a0)

.Lbranch_800079be:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_800079be
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_800079ba

.Lbranch_800079ce:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_800079ce
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,258(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-144
	sw	a0,-124(s0)
	sw	s6,-120(s0)
	lui	a1,0x80012
	addi	a1,a1,-1712	# anon.3839376bf29ad69682d1272c1c63f1dd.7.llvm.7710812085696039936+0x80
	addi	a0,s0,-116
	addi	a2,s0,-124
	auipc	ra,0x7
	jalr	ra,-1342(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-112(s0)
	lw	a1,-108(s0)

.Lbranch_80007a16:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007a16
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80007a24:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007a24
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80007a32:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007a32
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80007a40:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007a40
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80007a4e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007a4e
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_80007a5c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007a5c
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80007a6a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007a6a
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80007a90
	c.add	a1,a0

.Lbranch_80007a7c:
	lbu	a2,0(a0)

.Lbranch_80007a80:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80007a80
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80007a7c

.Lbranch_80007a90:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80007a90
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,64(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-140
	sw	a0,-124(s0)
	sw	s6,-120(s0)
	lui	a1,0x80012
	addi	a1,a1,360	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.0.llvm.3372952439789298147+0x174
	addi	a0,s0,-116
	addi	a2,s0,-124
	auipc	ra,0x7
	jalr	ra,-1536(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-112(s0)
	lw	a1,-108(s0)

.Lbranch_80007ad8:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007ad8
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80007ae6:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007ae6
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80007af4:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007af4
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80007b02:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007b02
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80007b10:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007b10
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_80007b1e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007b1e
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80007b2c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007b2c
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80007b52
	c.add	a1,a0

.Lbranch_80007b3e:
	lbu	a2,0(a0)

.Lbranch_80007b42:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80007b42
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80007b3e

.Lbranch_80007b52:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80007b52
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,-130(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-136
	sw	a0,-124(s0)
	sw	s6,-120(s0)
	lui	a1,0x80012
	addi	a1,a1,968	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x248
	addi	a0,s0,-116
	addi	a2,s0,-124
	auipc	ra,0x7
	jalr	ra,-1730(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-112(s0)
	lw	a1,-108(s0)

.Lbranch_80007b9a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007b9a
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80007ba8:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007ba8
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80007bb6:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007bb6
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80007bc4:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007bc4
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80007bd2:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007bd2
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_80007be0:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007be0
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80007bee:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007bee
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80007c14
	c.add	a1,a0

.Lbranch_80007c00:
	lbu	a2,0(a0)

.Lbranch_80007c04:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80007c04
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80007c00

.Lbranch_80007c14:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80007c14
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,-324(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-132
	sw	a0,-124(s0)
	sw	s6,-120(s0)
	lui	a1,0x80012
	addi	a1,a1,712	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x148
	addi	a0,s0,-116
	addi	a2,s0,-124
	auipc	ra,0x7
	jalr	ra,-1924(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-112(s0)
	lw	a1,-108(s0)

.Lbranch_80007c5c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007c5c
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80007c6a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007c6a
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80007c78:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007c78
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80007c86:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007c86
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80007c94:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007c94
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_80007ca2:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007ca2
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80007cb0:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007cb0
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80007cd6
	c.add	a1,a0

.Lbranch_80007cc2:
	lbu	a2,0(a0)

.Lbranch_80007cc6:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80007cc6
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80007cc2

.Lbranch_80007cd6:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80007cd6
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,-518(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-128
	sw	a0,-124(s0)
	sw	s6,-120(s0)
	lui	a1,0x80012
	addi	a1,a1,500	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x74
	addi	a0,s0,-116
	addi	a2,s0,-124
	auipc	ra,0x6
	jalr	ra,1978(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-112(s0)
	lw	a1,-108(s0)

.Lbranch_80007d1e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007d1e
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80007d2c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007d2c
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80007d3a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007d3a
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80007d48:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007d48
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80007d56:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007d56
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_80007d64:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007d64
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80007d72:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007d72
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80007d98
	c.add	a1,a0

.Lbranch_80007d84:
	lbu	a2,0(a0)

.Lbranch_80007d88:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80007d88
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80007d84

.Lbranch_80007d98:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80007d98
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,-712(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-664
	sw	a0,-124(s0)
	sw	s6,-120(s0)
	lui	a1,0x80012
	addi	a1,a1,1436	# anon.3839376bf29ad69682d1272c1c63f1dd.31.llvm.7710812085696039936+0xfc
	addi	a0,s0,-116
	addi	a2,s0,-124
	auipc	ra,0x6
	jalr	ra,1784(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-112(s0)
	lw	a1,-108(s0)

.Lbranch_80007de0:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007de0
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80007dee:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007dee
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80007dfc:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007dfc
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80007e0a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007e0a
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80007e18:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007e18
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_80007e26:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007e26
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80007e34:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007e34
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80007e5a
	c.add	a1,a0

.Lbranch_80007e46:
	lbu	a2,0(a0)

.Lbranch_80007e4a:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80007e4a
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80007e46

.Lbranch_80007e5a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80007e5a
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,-906(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	add	a0,s11,s3
	bltu	a0,s11, .Lbranch_80008110
	mulhu	a1,s9,s8
	bne	a1,zero, .Lbranch_80008120
	mul	a2,s9,s8
	add	a1,a2,a0
	bltu	a1,a2, .Lbranch_80008130
	c.li	a2,2
	lw	s11,-668(s0)
	bltu	s11,a2, .Lbranch_80008140
	c.addi	s11,-2
	mulhu	a2,s11,s7
	bne	a2,zero, .Lbranch_80008150
	mul	a3,s11,s7
	add	a2,a3,a1
	bltu	a2,a3, .Lbranch_80008160
	addi	a3,zero,512
	lw	a4,-672(s0)
	bne	a4,a3, .Lbranch_80007f06
	addi	a3,s7,-1
	c.slli	a3,0x18
	blt	a3,zero, .Lbranch_80007fd4
	sw	s2,0(s4)
	sw	s3,4(s4)
	sw	a2,8(s4)
	sw	a0,12(s4)
	lui	a0,0xf4
	lui	a2,0xdc
	addi	a0,a0,576	# .Lline_table_start1+0xa80eb
	addi	a2,a2,-1120	# .Lline_table_start1+0x8fa4b
	sw	a1,16(s4)
	sw	s7,20(s4)
	sw	a0,24(s4)
	sw	a2,28(s4)
	sw	zero,32(s4)
	sw	zero,36(s4)
	sw	zero,44(s4)
	c.j	 .Lbranch_800080ac

.Lbranch_80007f06:
	addi	a0,s0,-148
	sw	a0,-124(s0)
	sw	s6,-120(s0)
	lui	a1,0x80012
	addi	a1,a1,-332	# anon.7a8bf03ce3225e035043929a408f9c7c.0.llvm.764523667040833331+0xc
	addi	a0,s0,-116
	addi	a2,s0,-124
	auipc	ra,0x6
	jalr	ra,1446(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-112(s0)
	lw	a1,-108(s0)

.Lbranch_80007f32:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007f32
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80007f40:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007f40
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80007f4e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007f4e
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80007f5c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007f5c
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80007f6a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007f6a
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_80007f78:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007f78
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80007f86:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80007f86
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80007fac
	c.add	a1,a0

.Lbranch_80007f98:
	lbu	a2,0(a0)

.Lbranch_80007f9c:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80007f9c
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80007f98

.Lbranch_80007fac:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80007fac
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,-1244(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.li	a0,23
	lui	a1,0x8001b
	addi	a1,a1,744	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.19
	c.j	 .Lbranch_800080a0

.Lbranch_80007fd4:
	addi	a0,s0,-144
	sw	a0,-124(s0)
	sw	s6,-120(s0)
	lui	a1,0x80012
	addi	a1,a1,-872	# anon.20b29b1f91e363e9fbd85f55f7c77062.12.llvm.14406403243838317486+0xc8
	addi	a0,s0,-116
	addi	a2,s0,-124
	auipc	ra,0x6
	jalr	ra,1240(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-112(s0)
	lw	a1,-108(s0)

.Lbranch_80008000:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008000
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_8000800e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000800e
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_8000801c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000801c
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000802a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000802a
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80008038:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008038
	addi	a2,zero,54
	sw	a2,-2048(s1)

.Lbranch_80008046:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008046
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80008054:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008054
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_8000807a
	c.add	a1,a0

.Lbranch_80008066:
	lbu	a2,0(a0)

.Lbranch_8000806a:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_8000806a
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80008066

.Lbranch_8000807a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000807a
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-116
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffe
	jalr	ra,-1450(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.li	a0,20
	lui	a1,0x8001b
	addi	a1,a1,724	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.17

.Lbranch_800080a0:
	sw	zero,0(s4)
	sw	a1,4(s4)
	sw	a0,8(s4)

.Lbranch_800080ac:
	lw	ra,668(sp)
	lw	s0,664(sp)
	lw	s1,660(sp)
	lw	s2,656(sp)
	lw	s3,652(sp)
	lw	s4,648(sp)
	lw	s5,644(sp)
	lw	s6,640(sp)
	lw	s7,636(sp)
	lw	s8,632(sp)
	lw	s9,628(sp)
	lw	s10,624(sp)
	lw	s11,620(sp)
	addi	sp,sp,672
	c.jr	ra

.Lbranch_800080e6:
	lui	a0,0x8001b
	addi	a0,a0,1216	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.72
	lui	a3,0x8001b
	addi	a3,a3,1796	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.78
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x9
	jalr	ra,876(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80008104:
	c.li	a0,1
	c.li	a1,27
	auipc	ra,0x7
	jalr	ra,-608(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_80008110:
	lui	a0,0x8001b
	addi	a0,a0,628	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.10
	auipc	ra,0x9
	jalr	ra,660(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80008120:
	lui	a0,0x8001b
	addi	a0,a0,660	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.12
	auipc	ra,0x9
	jalr	ra,676(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80008130:
	lui	a0,0x8001b
	addi	a0,a0,644	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.11
	auipc	ra,0x9
	jalr	ra,628(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80008140:
	lui	a0,0x8001b
	addi	a0,a0,676	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.13
	auipc	ra,0x9
	jalr	ra,708(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_80008150:
	lui	a0,0x8001b
	addi	a0,a0,692	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.14
	auipc	ra,0x9
	jalr	ra,628(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80008160:
	lui	a0,0x8001b
	addi	a0,a0,708	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.15
	auipc	ra,0x9
	jalr	ra,580(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN11homebrew_os5fat3213FatFilesystem15parse_lfn_entry17h6d1ab544c69e0839E
_ZN11homebrew_os5fat3213FatFilesystem15parse_lfn_entry17h6d1ab544c69e0839E:
	c.addi16sp	sp,-144
	c.swsp	ra,140(sp)
	c.swsp	s0,136(sp)
	c.swsp	s1,132(sp)
	c.swsp	s2,128(sp)
	c.swsp	s3,124(sp)
	c.swsp	s4,120(sp)
	c.swsp	s5,116(sp)
	c.swsp	s6,112(sp)
	c.swsp	s7,108(sp)
	c.swsp	s8,104(sp)
	c.swsp	s9,100(sp)
	c.swsp	s10,96(sp)
	c.addi4spn	s0,sp,144
	c.mv	s2,a1
	lbu	a1,0(a0)
	andi	a1,a1,64
	sw	s2,-132(s0)
	c.beqz	a1, .Lbranch_800081a0
	sw	zero,8(s2)

.Lbranch_800081a0:
	c.li	s3,0
	sw	zero,-112(s0)
	sw	zero,-108(s0)
	sh	zero,-104(s0)
	lbu	a1,1(a0)
	lbu	a2,2(a0)
	sw	zero,-128(s0)
	sw	zero,-124(s0)
	sw	zero,-120(s0)
	sw	zero,-116(s0)
	c.slli	a2,0x8
	c.or	a2,a1
	slli	a3,a2,0x10
	c.srli	a3,0x10
	addi	a1,s0,-128
	c.beqz	a3, .Lbranch_80008288
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008288
	lbu	a3,4(a0)
	lbu	a4,3(a0)
	addi	a1,s0,-126
	sh	a2,-128(s0)
	slli	a2,a3,0x8
	c.or	a2,a4
	slli	a3,a2,0x10
	c.srli	a3,0x10
	c.li	s3,1
	c.beqz	a3, .Lbranch_80008288
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008288
	lbu	a3,6(a0)
	lbu	a4,5(a0)
	addi	a1,s0,-124
	sh	a2,-126(s0)
	slli	a2,a3,0x8
	c.or	a2,a4
	slli	a3,a2,0x10
	c.srli	a3,0x10
	c.li	s3,2
	c.beqz	a3, .Lbranch_80008288
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008288
	lbu	a3,8(a0)
	lbu	a4,7(a0)
	addi	a1,s0,-122
	sh	a2,-124(s0)
	slli	a2,a3,0x8
	c.or	a2,a4
	slli	a3,a2,0x10
	c.srli	a3,0x10
	c.li	s3,3
	c.beqz	a3, .Lbranch_80008288
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008288
	lbu	a3,10(a0)
	lbu	a4,9(a0)
	addi	a1,s0,-120
	sh	a2,-122(s0)
	slli	a2,a3,0x8
	c.or	a2,a4
	slli	a3,a2,0x10
	c.srli	a3,0x10
	c.li	s3,4
	c.beqz	a3, .Lbranch_80008288
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008288
	addi	a1,s0,-118
	sh	a2,-120(s0)
	c.li	s3,5

.Lbranch_80008288:
	lbu	a2,15(a0)
	lbu	a3,14(a0)
	c.slli	a2,0x8
	c.or	a2,a3
	slli	a3,a2,0x10
	c.srli	a3,0x10
	c.beqz	a3, .Lbranch_80008378
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008378
	lbu	a3,17(a0)
	lbu	a4,16(a0)
	sh	a2,0(a1)
	slli	a1,a3,0x8
	c.or	a1,a4
	slli	a3,a1,0x10
	c.srli	a3,0x10
	addi	a2,s3,1
	c.beqz	a3, .Lbranch_80008376
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008376
	c.slli	a2,0x1
	lbu	a3,18(a0)
	lbu	a4,19(a0)
	addi	a5,s0,-128
	c.add	a2,a5
	sh	a1,0(a2)
	slli	a1,a4,0x8
	c.or	a1,a3
	slli	a3,a1,0x10
	c.srli	a3,0x10
	addi	a2,s3,2
	c.beqz	a3, .Lbranch_80008376
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008376
	c.slli	a2,0x1
	lbu	a3,20(a0)
	lbu	a4,21(a0)
	c.add	a2,a5
	sh	a1,0(a2)
	slli	a1,a4,0x8
	c.or	a1,a3
	slli	a3,a1,0x10
	c.srli	a3,0x10
	addi	a2,s3,3
	c.beqz	a3, .Lbranch_80008376
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008376
	c.slli	a2,0x1
	lbu	a3,22(a0)
	lbu	a4,23(a0)
	c.add	a2,a5
	sh	a1,0(a2)
	slli	a1,a4,0x8
	c.or	a1,a3
	slli	a3,a1,0x10
	c.srli	a3,0x10
	addi	a2,s3,4
	c.beqz	a3, .Lbranch_80008376
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	beq	a3,a4, .Lbranch_80008376
	c.slli	a2,0x1
	lbu	a3,24(a0)
	lbu	a4,25(a0)
	c.add	a2,a5
	sh	a1,0(a2)
	slli	a1,a4,0x8
	c.or	a1,a3
	slli	a3,a1,0x10
	c.srli	a3,0x10
	addi	a2,s3,5
	c.beqz	a3, .Lbranch_80008376
	c.lui	a4,0x10
	c.addi	a4,-1	# .Lline_table_start0+0x1fa1
	bne	a3,a4, .Lbranch_80008694

.Lbranch_80008376:
	c.mv	s3,a2

.Lbranch_80008378:
	lbu	a1,29(a0)
	lbu	a2,28(a0)
	c.slli	a1,0x8
	c.or	a1,a2
	slli	a2,a1,0x10
	c.srli	a2,0x10
	c.beqz	a2, .Lbranch_80008394
	c.lui	a3,0x10
	c.addi	a3,-1	# .Lline_table_start0+0x1fa1
	bne	a2,a3, .Lbranch_8000855a

.Lbranch_80008394:
	c.li	a0,1
	sw	zero,-100(s0)
	sw	a0,-96(s0)
	sw	zero,-92(s0)
	bne	s3,zero, .Lbranch_800085aa

.Lbranch_800083a6:
	addi	a0,s0,-88
	c.mv	a1,s2
	auipc	ra,0x7
	jalr	ra,-960(ra)	# _ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h023a536b8922818aE
	lw	s1,-92(s0)
	sw	zero,8(s2)
	blt	s1,zero, .Lbranch_800086a4
	lw	a0,0(s2)
	lw	a1,-96(s0)
	bltu	a0,s1, .Lbranch_800086e0
	c.li	a0,0

.Lbranch_800083ce:
	lw	a2,4(s2)
	c.add	a0,a2
	bltu	a0,a1, .Lbranch_800083de
	sub	a2,a0,a1
	c.j	 .Lbranch_800083e2

.Lbranch_800083de:
	sub	a2,a1,a0

.Lbranch_800083e2:
	bltu	a2,s1, .Lbranch_800086c2
	c.mv	a2,s1
	auipc	ra,0xffffe
	jalr	ra,-776(ra)	# memcpy
	lw	a0,8(s2)
	lw	s3,-80(s0)
	c.add	s1,a0
	sw	s1,8(s2)
	blt	s3,zero, .Lbranch_800086a4
	lw	a0,0(s2)
	lw	a1,-84(s0)
	c.sub	a0,s1
	bltu	a0,s3, .Lbranch_800086fc

.Lbranch_80008410:
	lw	a0,4(s2)
	c.add	a0,s1
	bltu	a0,a1, .Lbranch_80008420
	sub	a2,a0,a1
	c.j	 .Lbranch_80008424

.Lbranch_80008420:
	sub	a2,a1,a0

.Lbranch_80008424:
	bltu	a2,s3, .Lbranch_800086c2
	lui	s1,0xf0004
	c.mv	a2,s3
	auipc	ra,0xffffe
	jalr	ra,-846(ra)	# memcpy
	lw	a0,8(s2)
	addi	a1,s0,-100
	c.add	a0,s3
	lui	a2,0x80009
	addi	a2,a2,-148	# _ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17h7de11463e977587fE
	sw	a0,8(s2)
	addi	a0,s0,-132
	lui	a3,0x8000e
	addi	a3,a3,-140	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6545979525451930E
	sw	a1,-64(s0)
	sw	a2,-60(s0)
	sw	a0,-56(s0)
	sw	a3,-52(s0)
	lui	a1,0x80012
	addi	a1,a1,1784	# anon.aec296b685f742a7405bc8100ce2f275.23.llvm.14967730159154455495+0x144
	addi	a0,s0,-76
	addi	a2,s0,-64
	auipc	ra,0x6
	jalr	ra,80(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-72(s0)
	lw	a1,-68(s0)

.Lbranch_80008488:
	lw	a2,-2044(s1)	# __heap_end+0x6fd03804
	c.bnez	a2, .Lbranch_80008488
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80008496:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008496
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_800084a4:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800084a4
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_800084b2:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800084b2
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_800084c0:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800084c0
	addi	a2,zero,50
	sw	a2,-2048(s1)

.Lbranch_800084ce:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800084ce
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_800084dc:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800084dc
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80008502
	c.add	a1,a0

.Lbranch_800084ee:
	lbu	a2,0(a0)

.Lbranch_800084f2:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_800084f2
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_800084ee

.Lbranch_80008502:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80008502
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-76
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffd
	jalr	ra,1486(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-88
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffd
	jalr	ra,1470(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-100
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffd
	jalr	ra,1454(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.lwsp	ra,140(sp)
	c.lwsp	s0,136(sp)
	c.lwsp	s1,132(sp)
	c.lwsp	s2,128(sp)
	c.lwsp	s3,124(sp)
	c.lwsp	s4,120(sp)
	c.lwsp	s5,116(sp)
	c.lwsp	s6,112(sp)
	c.lwsp	s7,108(sp)
	c.lwsp	s8,104(sp)
	c.lwsp	s9,100(sp)
	c.lwsp	s10,96(sp)
	c.addi16sp	sp,144
	c.jr	ra

.Lbranch_8000855a:
	slli	a2,s3,0x1
	lbu	a3,30(a0)
	lbu	a0,31(a0)
	addi	a4,s0,-128
	c.add	a2,a4
	sh	a1,0(a2)
	c.slli	a0,0x8
	or	a1,a0,a3
	slli	a2,a1,0x10
	c.srli	a2,0x10
	addi	a0,s3,1
	c.beqz	a2, .Lbranch_8000859a
	c.lui	a3,0x10
	c.addi	a3,-1	# .Lline_table_start0+0x1fa1
	beq	a2,a3, .Lbranch_8000859a
	c.slli	a0,0x1
	addi	a2,s0,-128
	c.add	a0,a2
	sh	a1,0(a0)
	addi	a0,s3,2

.Lbranch_8000859a:
	c.li	a1,1
	sw	zero,-100(s0)
	sw	a1,-96(s0)
	sw	zero,-92(s0)
	c.mv	s3,a0

.Lbranch_800085aa:
	c.li	a2,0
	c.li	a3,0
	c.li	a1,0
	c.li	s6,0
	c.li	a0,1
	addi	s9,s0,-128
	lui	a4,0xffefe
	lui	a5,0xffef1
	addi	s5,a4,-2048	# __heap_end+0x7fbfd800
	addi	s7,a5,-2048	# __heap_end+0x7fbf0800
	addi	s8,zero,128
	c.j	 .Lbranch_800085ee

.Lbranch_800085ce:
	sb	a1,0(a2)

.Lbranch_800085d2:
	lw	a3,-100(s0)
	add	a2,s4,s6
	bltu	a3,a2, .Lbranch_80008676
	sw	a2,-92(s0)
	c.mv	a1,a2
	c.mv	s6,a2

.Lbranch_800085e6:
	c.addi	s3,-1
	c.addi	s9,2	# _start+0x2
	beq	s3,zero, .Lbranch_800083a6

.Lbranch_800085ee:
	lhu	s1,0(s9)
	xor	a4,s1,s5
	bltu	a4,s7, .Lbranch_800085e6
	srli	s10,s1,0xb
	bgeu	s1,s8, .Lbranch_80008606
	c.li	s4,1
	c.j	 .Lbranch_8000860e

.Lbranch_80008606:
	sltiu	a4,s10,1
	xori	s4,a4,3

.Lbranch_8000860e:
	c.sub	a3,a1
	bltu	a3,s4, .Lbranch_8000865a

.Lbranch_80008614:
	c.add	a2,a0
	andi	a1,s1,255
	bltu	s1,s8, .Lbranch_800085ce
	andi	a1,a1,63
	slli	a3,s1,0x12
	addi	a1,a1,128
	c.srli	a3,0x18
	bne	s10,zero, .Lbranch_8000863e
	addi	a3,a3,192
	sb	a3,0(a2)
	sb	a1,1(a2)
	c.j	 .Lbranch_800085d2

.Lbranch_8000863e:
	c.srli	s1,0xc
	andi	a3,a3,63
	addi	a3,a3,128
	addi	a4,s1,224
	sb	a4,0(a2)
	sb	a3,1(a2)
	sb	a1,2(a2)
	c.j	 .Lbranch_800085d2

.Lbranch_8000865a:
	addi	a0,s0,-100
	c.li	a3,1
	c.li	a4,1
	c.mv	a2,s4
	auipc	ra,0xffffd
	jalr	ra,1740(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE
	lw	a0,-96(s0)
	lw	a2,-92(s0)
	c.j	 .Lbranch_80008614

.Lbranch_80008676:
	lui	a0,0x8001b
	addi	a0,a0,1812	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.79
	lui	a3,0x8001b
	addi	a3,a3,2012	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.81
	addi	a1,zero,397
	c.li	a2,0
	auipc	ra,0x9
	jalr	ra,-548(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80008694:
	c.slli	a2,0x1
	addi	a3,s0,-128
	c.add	a2,a3
	sh	a1,0(a2)
	c.addi	s3,6
	c.j	 .Lbranch_80008378

.Lbranch_800086a4:
	lui	a0,0x8001b
	addi	a0,a0,1500	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.74
	lui	a3,0x8001b
	addi	a3,a3,1780	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.76
	addi	a1,zero,559
	c.li	a2,0
	auipc	ra,0x9
	jalr	ra,-594(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800086c2:
	lui	a0,0x8001b
	addi	a0,a0,1216	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.72
	lui	a3,0x8001b
	addi	a3,a3,1796	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.78
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x9
	jalr	ra,-624(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800086e0:
	c.li	a3,1
	c.li	a4,1
	c.mv	a0,s2
	c.mv	s3,a1
	c.li	a1,0
	c.mv	a2,s1
	auipc	ra,0xffffd
	jalr	ra,1604(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE
	c.mv	a1,s3
	lw	a0,8(s2)
	c.j	 .Lbranch_800083ce

.Lbranch_800086fc:
	c.li	a3,1
	c.li	a4,1
	c.mv	a0,s2
	c.mv	s4,a1
	c.mv	a1,s1
	c.mv	a2,s3
	auipc	ra,0xffffd
	jalr	ra,1576(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE
	c.mv	a1,s4
	lw	s1,8(s2)
	c.j	 .Lbranch_80008410

	.globl _ZN11homebrew_os5fat3213FatFilesystem18read_cluster_chain17hf0011333f0efb2d8E
_ZN11homebrew_os5fat3213FatFilesystem18read_cluster_chain17hf0011333f0efb2d8E:
	addi	sp,sp,-672
	sw	ra,668(sp)
	sw	s0,664(sp)
	sw	s1,660(sp)
	sw	s2,656(sp)
	sw	s3,652(sp)
	sw	s4,648(sp)
	sw	s5,644(sp)
	sw	s6,640(sp)
	sw	s7,636(sp)
	sw	s8,632(sp)
	sw	s9,628(sp)
	sw	s10,624(sp)
	sw	s11,620(sp)
	c.addi4spn	s0,sp,672
	c.mv	s1,a2
	c.mv	s2,a1
	sw	a0,-656(s0)
	c.li	a0,4
	sw	zero,-648(s0)
	sw	a0,-644(s0)
	sw	zero,-640(s0)
	addi	a0,s0,-636
	addi	a2,zero,512
	c.li	a1,0
	auipc	ra,0xffffe
	jalr	ra,-1562(ra)	# memset
	c.li	a0,2
	bltu	s1,a0, .Lbranch_80008bda
	lw	s3,20(s2)
	c.addi	s1,-2
	mulhu	a0,s1,s3
	bne	a0,zero, .Lbranch_80008bea
	lw	a0,16(s2)
	mul	a1,s1,s3
	add	s4,a1,a0
	bltu	s4,a1, .Lbranch_80008bfa
	beq	s3,zero, .Lbranch_80008b5c
	c.li	a0,0
	lui	s1,0xf0004
	addi	s6,s0,-625
	addi	s7,s0,-636
	addi	s8,zero,229
	c.li	s9,16
	c.li	s10,15
	addi	s11,s0,-112
	sw	s2,-660(s0)
	sw	s3,-664(s0)
	sw	s4,-668(s0)
	c.j	 .Lbranch_800087f0

.Lbranch_800087ca:
	addi	a0,s0,-124
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffd
	jalr	ra,786(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	s2,-660(s0)
	lw	s3,-664(s0)
	lw	s4,-668(s0)

.Lbranch_800087e6:
	lw	a0,-652(s0)
	c.addi	a0,1
	beq	a0,s3, .Lbranch_80008b5c

.Lbranch_800087f0:
	add	a1,a0,s4
	sw	a0,-652(s0)
	bltu	a1,a0, .Lbranch_80008bca
	lw	a0,0(s2)
	addi	a2,s0,-636
	addi	a3,zero,512
	auipc	ra,0x3
	jalr	ra,1568(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	c.bnez	a0, .Lbranch_800087e6
	c.li	s4,0
	sw	zero,-124(s0)
	c.li	a0,1
	sw	a0,-120(s0)
	sw	zero,-116(s0)
	c.j	 .Lbranch_8000882e

.Lbranch_80008824:
	sw	zero,-116(s0)

.Lbranch_80008828:
	c.addi	s4,1
	beq	s4,s9, .Lbranch_800087ca

.Lbranch_8000882e:
	slli	a1,s4,0x5
	add	a0,s7,a1
	lbu	a2,0(a0)
	beq	a2,s8, .Lbranch_80008824
	beq	a2,zero, .Lbranch_80008b34
	c.add	a1,s6
	lbu	s5,0(a1)
	bne	s5,s10, .Lbranch_8000885a
	addi	a1,s0,-124
	auipc	ra,0x0
	jalr	ra,-1760(ra)	# _ZN11homebrew_os5fat3213FatFilesystem15parse_lfn_entry17h6d1ab544c69e0839E
	c.j	 .Lbranch_80008828

.Lbranch_8000885a:
	sw	zero,-112(s0)
	sw	zero,-108(s0)
	sh	zero,-104(s0)
	sb	zero,-102(s0)
	bltu	s11,a0, .Lbranch_80008874
	sub	a1,s11,a0
	c.j	 .Lbranch_80008878

.Lbranch_80008874:
	sub	a1,a0,s11

.Lbranch_80008878:
	c.li	a2,10
	bgeu	a2,a1, .Lbranch_80008bac
	lbu	a6,4(a0)
	lbu	a7,5(a0)
	lbu	t1,6(a0)
	lbu	a4,7(a0)
	lbu	a5,0(a0)
	lbu	a1,1(a0)
	lbu	t0,2(a0)
	lbu	t2,3(a0)
	lbu	a3,9(a0)
	lbu	a2,8(a0)
	lbu	t3,10(a0)
	lbu	s2,20(a0)
	c.slli	a3,0x8
	c.slli	a7,0x8
	c.slli	t1,0x10
	c.slli	a4,0x18
	c.slli	a1,0x8
	c.or	a2,a3
	or	a3,a7,a6
	or	a4,a4,t1
	c.or	a1,a5
	lbu	s3,21(a0)
	lbu	s8,26(a0)
	lbu	s10,27(a0)
	lbu	s6,28(a0)
	c.slli	t0,0x10
	c.slli	t2,0x18
	or	a5,t2,t0
	c.or	a3,a4
	lbu	s9,29(a0)
	lbu	s11,30(a0)
	lbu	s7,31(a0)
	c.or	a1,a5
	lw	a0,-116(s0)
	sw	a1,-112(s0)
	sw	a3,-108(s0)
	sh	a2,-104(s0)
	sb	t3,-102(s0)
	c.beqz	a0, .Lbranch_8000892c
	addi	a0,s0,-68
	addi	a1,s0,-124
	auipc	ra,0x6
	jalr	ra,1762(ra)	# _ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h023a536b8922818aE
	lw	a0,-68(s0)
	lw	a1,-64(s0)
	lw	a2,-60(s0)
	sw	a0,-100(s0)
	sw	a1,-96(s0)
	sw	a2,-92(s0)
	c.j	 .Lbranch_80008934

.Lbranch_8000892c:
	lui	a0,0x80000
	sw	a0,-100(s0)

.Lbranch_80008934:
	addi	a0,s0,-68
	addi	a1,s0,-112
	c.li	a2,11
	auipc	ra,0x8
	jalr	ra,-510(ra)	# _ZN4core3str8converts9from_utf817ha3661ecfe8ef34e6E
	lw	a0,-68(s0)
	c.bnez	a0, .Lbranch_80008956
	lw	a0,-64(s0)
	lw	a1,-60(s0)
	c.j	 .Lbranch_80008960

.Lbranch_80008956:
	c.li	a1,1
	lui	a0,0x8001b
	addi	a0,a0,816	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.28

.Lbranch_80008960:
	c.slli	s7,0x18
	c.slli	s11,0x10
	c.slli	s9,0x8
	c.slli	s10,0x8
	c.slli	s3,0x18
	c.slli	s2,0x10
	or	a2,s9,s6
	or	a3,s11,s7
	or	a4,s10,s8
	or	a5,s2,s3
	or	s8,a2,a3
	or	s2,a4,a5
	auipc	ra,0x5
	jalr	ra,1556(ra)	# _ZN4core3str21_$LT$impl$u20$str$GT$12trim_matches17he6e51be3559aff03E
	sw	a0,-88(s0)
	sw	a1,-84(s0)
	addi	a0,s0,-88
	sw	a0,-68(s0)
	lui	a0,0x8000b
	addi	a0,a0,948	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h7e91003129bfa5a6E
	sw	a0,-64(s0)
	addi	a0,s0,-100
	sw	a0,-60(s0)
	lui	a0,0x80009
	addi	a0,a0,-112	# _ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h60c5fd3d4b4ea226E
	sw	a0,-56(s0)
	addi	a0,s0,-80
	addi	a2,s0,-68
	lui	a1,0x80012
	addi	a1,a1,-1508	# anon.3839376bf29ad69682d1272c1c63f1dd.7.llvm.7710812085696039936+0x14c
	auipc	ra,0x6
	jalr	ra,-1284(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-76(s0)
	lw	a1,-72(s0)

.Lbranch_800089dc:
	lw	a2,-2044(s1)	# __heap_end+0x6fd03804
	c.bnez	a2, .Lbranch_800089dc
	addi	a2,zero,91
	sw	a2,-2048(s1)
	addi	s7,s0,-636
	c.li	s9,16
	c.li	s10,15
	addi	s11,s0,-112

.Lbranch_800089f6:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800089f6
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80008a04:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008a04
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80008a12:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008a12
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80008a20:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008a20
	addi	a2,zero,50
	sw	a2,-2048(s1)

.Lbranch_80008a2e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008a2e
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80008a3c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80008a3c
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80008a62
	c.add	a1,a0

.Lbranch_80008a4e:
	lbu	a2,0(a0)

.Lbranch_80008a52:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80008a52
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80008a4e

.Lbranch_80008a62:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80008a62
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-80
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffd
	jalr	ra,110(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	a6,-112(s0)
	lw	a7,-108(s0)
	lh	a2,-104(s0)
	lbu	a3,-102(s0)
	lw	a4,-100(s0)
	lw	a5,-96(s0)
	lw	a0,-92(s0)
	lw	a1,-648(s0)
	lw	s3,-640(s0)
	sw	a6,-80(s0)
	sw	a7,-76(s0)
	sh	a2,-72(s0)
	sb	a3,-70(s0)
	sw	a4,-68(s0)
	sw	a5,-64(s0)
	sw	a0,-60(s0)
	bne	s3,a1, .Lbranch_80008ace
	addi	a0,s0,-648
	auipc	ra,0xffffd
	jalr	ra,-66(ra)	# _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0fabdc8fdffe7aacE

.Lbranch_80008ace:
	lw	a0,-644(s0)
	slli	a1,s3,0x2
	lw	a2,-60(s0)
	slli	a3,s3,0x5
	c.add	a1,a3
	add	s6,a0,a1
	sw	a2,8(s6)
	lw	a0,-64(s0)
	sw	a0,4(s6)
	lw	a0,-68(s0)
	slli	a1,s5,0x1b
	c.srli	a1,0x1f
	sw	a0,0(s6)
	sw	s8,12(s6)
	sw	s2,16(s6)
	sb	a1,20(s6)
	addi	a0,s6,21
	addi	a1,s0,-80
	c.li	a2,11
	auipc	ra,0xffffd
	jalr	ra,1484(ra)	# memcpy
	sb	s5,32(s6)
	c.addi	s3,1
	sw	s3,-640(s0)
	sw	zero,-116(s0)
	addi	s6,s0,-625
	addi	s8,zero,229
	c.j	 .Lbranch_80008828

.Lbranch_80008b34:
	lw	a0,-648(s0)
	lw	a1,-644(s0)
	lw	a2,-640(s0)
	lw	a3,-656(s0)
	c.sw	a0,0(a3)
	c.sw	a1,4(a3)
	c.sw	a2,8(a3)
	addi	a0,s0,-124
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffd
	jalr	ra,-110(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_80008b72

.Lbranch_80008b5c:
	lw	a0,-648(s0)
	lw	a1,-644(s0)
	lw	a2,-640(s0)
	lw	a3,-656(s0)
	c.sw	a0,0(a3)
	c.sw	a1,4(a3)
	c.sw	a2,8(a3)

.Lbranch_80008b72:
	lw	ra,668(sp)
	lw	s0,664(sp)
	lw	s1,660(sp)
	lw	s2,656(sp)
	lw	s3,652(sp)
	lw	s4,648(sp)
	lw	s5,644(sp)
	lw	s6,640(sp)
	lw	s7,636(sp)
	lw	s8,632(sp)
	lw	s9,628(sp)
	lw	s10,624(sp)
	lw	s11,620(sp)
	addi	sp,sp,672
	c.jr	ra

.Lbranch_80008bac:
	lui	a0,0x8001c
	addi	a0,a0,-1804	# anon.3973a9c3f4224926bbecf4cad58bd903.0.llvm.1830756879319262441
	lui	a3,0x8001c
	addi	a3,a3,-1520	# anon.3973a9c3f4224926bbecf4cad58bd903.2.llvm.1830756879319262441
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x9
	jalr	ra,-1882(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80008bca:
	lui	a0,0x8001b
	addi	a0,a0,800	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.26
	auipc	ra,0x8
	jalr	ra,2010(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80008bda:
	lui	a0,0x8001b
	addi	a0,a0,768	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.24
	auipc	ra,0x9
	jalr	ra,-2006(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_80008bea:
	lui	a0,0x8001b
	addi	a0,a0,768	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.24
	auipc	ra,0x8
	jalr	ra,2010(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80008bfa:
	lui	a0,0x8001b
	addi	a0,a0,784	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.25
	auipc	ra,0x8
	jalr	ra,1962(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os5fat3213FatFilesystem27read_directory_by_raw_entry17h02340b49e9d2aff7E
_ZN11homebrew_os5fat3213FatFilesystem27read_directory_by_raw_entry17h02340b49e9d2aff7E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.addi4spn	s0,sp,32
	c.mv	s2,a1
	c.mv	s1,a0
	addi	a0,s0,-24
	auipc	ra,0x0
	jalr	ra,56(ra)	# _ZN11homebrew_os5fat3213FatFilesystem30extract_cluster_from_raw_entry17he5b6be46c7d692d2E
	lw	a0,-24(s0)
	lw	a2,-20(s0)
	c.beqz	a0, .Lbranch_80008c3e
	lui	a1,0x80000
	c.sw	a1,0(s1)
	c.sw	a0,4(s1)
	c.sw	a2,8(s1)
	c.j	 .Lbranch_80008c4a

.Lbranch_80008c3e:
	c.mv	a0,s1
	c.mv	a1,s2
	auipc	ra,0x0
	jalr	ra,-1322(ra)	# _ZN11homebrew_os5fat3213FatFilesystem18read_cluster_chain17hf0011333f0efb2d8E

.Lbranch_80008c4a:
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.addi16sp	sp,32
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os5fat3213FatFilesystem30extract_cluster_from_raw_entry17he5b6be46c7d692d2E
_ZN11homebrew_os5fat3213FatFilesystem30extract_cluster_from_raw_entry17he5b6be46c7d692d2E:
	addi	sp,sp,-576
	sw	ra,572(sp)
	sw	s0,568(sp)
	sw	s1,564(sp)
	sw	s2,560(sp)
	sw	s3,556(sp)
	sw	s4,552(sp)
	sw	s5,548(sp)
	sw	s6,544(sp)
	sw	s7,540(sp)
	sw	s8,536(sp)
	sw	s9,532(sp)
	sw	s10,528(sp)
	c.addi4spn	s0,sp,576
	c.mv	s2,a4
	c.mv	s1,a3
	c.mv	s4,a2
	c.mv	s5,a1
	c.mv	s3,a0
	addi	a0,s0,-572
	addi	a2,zero,512
	c.li	a1,0
	auipc	ra,0xffffd
	jalr	ra,1206(ra)	# memset
	c.beqz	s1, .Lbranch_80008cf2
	c.li	a0,2
	bltu	s4,a0, .Lbranch_80008e8c
	lw	a0,20(s5)
	c.addi	s4,-2
	mulhu	a1,s4,a0
	bne	a1,zero, .Lbranch_80008e9c
	lw	a1,16(s5)
	mul	a0,s4,a0
	c.add	a1,a0
	bltu	a1,a0, .Lbranch_80008eac
	lw	a0,0(s5)
	addi	a2,s0,-572
	addi	a3,zero,512
	auipc	ra,0x3
	jalr	ra,334(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	c.beqz	a0, .Lbranch_80008d18
	lui	a0,0x8001b
	addi	a0,a0,1176	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.53
	addi	a1,zero,39
	c.j	 .Lbranch_80008e30

.Lbranch_80008cf2:
	lw	a0,0(s5)
	addi	a2,s0,-572
	addi	a3,zero,512
	c.mv	a1,s4
	auipc	ra,0x3
	jalr	ra,296(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	c.beqz	a0, .Lbranch_80008d18
	lui	a0,0x8001b
	addi	a0,a0,1024	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.47
	addi	a1,zero,38
	c.j	 .Lbranch_80008e30

.Lbranch_80008d18:
	c.addi	s2,21
	addi	s1,s0,-572
	addi	s4,s0,-60
	c.li	s5,16
	addi	s6,zero,229
	c.li	s7,15
	sub	s8,s4,s1
	sub	s9,s1,s4
	c.li	s10,10
	c.j	 .Lbranch_80008d46

.Lbranch_80008d36:
	c.addi	s5,-1
	c.addi	s8,-32
	addi	s9,s9,32
	addi	s1,s1,32
	beq	s5,zero, .Lbranch_80008e24

.Lbranch_80008d46:
	lbu	a0,0(s1)
	beq	a0,s6, .Lbranch_80008d36
	c.beqz	a0, .Lbranch_80008e24
	lbu	a0,11(s1)
	beq	a0,s7, .Lbranch_80008d36
	sw	zero,-60(s0)
	sw	zero,-56(s0)
	sh	zero,-52(s0)
	sb	zero,-50(s0)
	c.mv	a1,s8
	bltu	s1,s4, .Lbranch_80008d70
	c.mv	a1,s9

.Lbranch_80008d70:
	bgeu	s10,a1, .Lbranch_80008e6e
	lbu	a7,8(s1)
	lbu	a2,9(s1)
	lbu	a6,10(s1)
	lbu	a4,4(s1)
	lbu	a5,5(s1)
	lbu	a3,6(s1)
	lbu	a1,7(s1)
	c.slli	a2,0x8
	c.slli	a5,0x8
	c.slli	a3,0x10
	c.slli	a1,0x18
	or	a7,a2,a7
	or	t0,a5,a4
	c.or	a1,a3
	lbu	a3,1(s1)
	lbu	a5,0(s1)
	lbu	a2,2(s1)
	lbu	a4,3(s1)
	c.slli	a3,0x8
	c.or	a3,a5
	c.slli	a2,0x10
	c.slli	a4,0x18
	c.or	a2,a4
	or	a1,a1,t0
	c.or	a2,a3
	c.andi	a0,16
	sw	a2,-60(s0)
	sw	a1,-56(s0)
	sh	a7,-52(s0)
	sb	a6,-50(s0)
	c.beqz	a0, .Lbranch_80008d36
	addi	a0,s0,-60
	c.li	a2,11
	c.mv	a1,s2
	auipc	ra,0x9
	jalr	ra,-1602(ra)	# memcmp
	c.bnez	a0, .Lbranch_80008d36
	lbu	a0,27(s1)
	lbu	a1,21(s1)
	lbu	a2,20(s1)
	lbu	a3,26(s1)
	c.slli	a0,0x8
	c.slli	a1,0x18
	c.slli	a2,0x10
	c.or	a0,a3
	c.or	a1,a2
	c.or	a0,a1
	sltu	a1,zero,a0
	c.addi	a1,-1	# .Lline_table_start1+0x7ffb3eaa
	lui	a2,0x8001b
	addi	a2,a2,1140	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.52
	c.and	a1,a2
	c.bnez	a0, .Lbranch_80008e1a
	addi	a0,zero,36

.Lbranch_80008e1a:
	sw	a1,0(s3)
	sw	a0,4(s3)
	c.j	 .Lbranch_80008e38

.Lbranch_80008e24:
	lui	a0,0x8001b
	addi	a0,a0,1096	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.50
	addi	a1,zero,42

.Lbranch_80008e30:
	sw	a0,0(s3)
	sw	a1,4(s3)

.Lbranch_80008e38:
	lw	ra,572(sp)
	lw	s0,568(sp)
	lw	s1,564(sp)
	lw	s2,560(sp)
	lw	s3,556(sp)
	lw	s4,552(sp)
	lw	s5,548(sp)
	lw	s6,544(sp)
	lw	s7,540(sp)
	lw	s8,536(sp)
	lw	s9,532(sp)
	lw	s10,528(sp)
	addi	sp,sp,576
	c.jr	ra

.Lbranch_80008e6e:
	lui	a0,0x8001c
	addi	a0,a0,-1804	# anon.3973a9c3f4224926bbecf4cad58bd903.0.llvm.1830756879319262441
	lui	a3,0x8001c
	addi	a3,a3,-1520	# anon.3973a9c3f4224926bbecf4cad58bd903.2.llvm.1830756879319262441
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x8
	jalr	ra,1508(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80008e8c:
	lui	a0,0x8001b
	addi	a0,a0,1064	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.48
	auipc	ra,0x8
	jalr	ra,1400(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_80008e9c:
	lui	a0,0x8001b
	addi	a0,a0,1064	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.48
	auipc	ra,0x8
	jalr	ra,1320(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80008eac:
	lui	a0,0x8001b
	addi	a0,a0,1080	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.49
	auipc	ra,0x8
	jalr	ra,1272(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN45_$LT$T$u20$as$u20$alloc..string..ToString$GT$9to_string17h360a1ba3600765bdE
_ZN45_$LT$T$u20$as$u20$alloc..string..ToString$GT$9to_string17h360a1ba3600765bdE:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.swsp	s5,4(sp)
	c.addi4spn	s0,sp,32
	c.mv	s1,a2
	bge	a2,zero, .Lbranch_80008ee2
	c.li	s4,0

.Lbranch_80008ed6:
	c.mv	a0,s4
	c.mv	a1,s1
	auipc	ra,0x6
	jalr	ra,-50(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_80008ee2:
	c.mv	s2,a0
	c.beqz	s1, .Lbranch_80008f16
	c.mv	s5,a1
	auipc	ra,0xffffa
	jalr	ra,1576(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,1
	c.li	s4,1
	c.mv	a2,s1
	auipc	ra,0xffffd
	jalr	ra,274(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	c.beqz	a0, .Lbranch_80008ed6
	c.mv	s3,a0
	c.mv	a1,s5
	bltu	a0,s5, .Lbranch_80008f1c

.Lbranch_80008f10:
	sub	a0,s3,a1
	c.j	 .Lbranch_80008f20

.Lbranch_80008f16:
	c.li	s3,1
	bgeu	s3,a1, .Lbranch_80008f10

.Lbranch_80008f1c:
	sub	a0,a1,s3

.Lbranch_80008f20:
	bltu	a0,s1, .Lbranch_80008f4e
	c.mv	a0,s3
	c.mv	a2,s1
	auipc	ra,0xffffd
	jalr	ra,440(ra)	# memcpy
	sw	s1,0(s2)
	sw	s3,4(s2)
	sw	s1,8(s2)
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.lwsp	s5,4(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_80008f4e:
	lui	a0,0x8001b
	addi	a0,a0,1216	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.72
	lui	a3,0x8001b
	addi	a3,a3,1796	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.78
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x8
	jalr	ra,1284(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17h7de11463e977587fE
_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17h7de11463e977587fE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a2,4(a0)
	c.lw	a3,8(a0)
	c.mv	a4,a1
	c.mv	a0,a2
	c.mv	a1,a3
	c.mv	a2,a4
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	auipc	t1,0x6
	jalr	zero,1178(t1)	# _ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h1caa923a37cafdf4E
	# ... (zero-filled gap)

	.globl _ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h60c5fd3d4b4ea226E
_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h60c5fd3d4b4ea226E:
	c.mv	a2,a0
	c.lw	a3,0(a0)
	lui	a4,0x80000
	c.mv	a0,a1
	bne	a3,a4, .Lbranch_80008fb0
	lui	a1,0x80014
	addi	a1,a1,104	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0x20
	c.li	a2,4
	auipc	t1,0x7
	jalr	zero,-16(t1)	# _ZN4core3fmt9Formatter9write_str17h294a432de2db79d0E

.Lbranch_80008fb0:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	sw	a2,-12(s0)
	lui	a1,0x80014
	addi	a1,a1,92	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0x14
	lui	a4,0x8001b
	addi	a4,a4,2028	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.85
	c.li	a2,4
	addi	a3,s0,-12
	auipc	ra,0x7
	jalr	ra,-810(ra)	# _ZN4core3fmt9Formatter25debug_tuple_field1_finish17hdbc93a39fb14fcabE
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$14list_directory17he8a03d10feae307bE
_ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$14list_directory17he8a03d10feae307bE:
	c.addi16sp	sp,-224
	c.swsp	ra,220(sp)
	c.swsp	s0,216(sp)
	c.swsp	s1,212(sp)
	c.swsp	s2,208(sp)
	c.swsp	s3,204(sp)
	c.swsp	s4,200(sp)
	c.swsp	s5,196(sp)
	c.swsp	s6,192(sp)
	c.swsp	s7,188(sp)
	c.swsp	s8,184(sp)
	c.swsp	s9,180(sp)
	c.swsp	s10,176(sp)
	c.swsp	s11,172(sp)
	c.addi4spn	s0,sp,224
	c.mv	s3,a3
	c.mv	s1,a2
	c.mv	s5,a1
	c.lw	a2,32(a1)
	lui	a1,0x80000
	c.addi	a1,-2	# .Lline_table_start1+0x7ffb3ea9
	c.mv	s4,a0
	bltu	a1,a2, .Lbranch_8000904a
	lw	a1,36(s5)
	addi	a0,a2,1
	sw	a0,32(s5)
	c.beqz	a1, .Lbranch_80009046
	lw	a2,40(s5)
	addi	a0,s0,-92
	c.mv	a3,s1
	c.mv	a4,s3
	auipc	ra,0x5
	jalr	ra,-724(ra)	# _ZN5alloc11collections5btree6search142_$LT$impl$u20$alloc..collections..btree..node..NodeRef$LT$BorrowType$C$K$C$V$C$alloc..collections..btree..node..marker..LeafOrInternal$GT$$GT$11search_tree17h9842314512386161E
	lw	a0,-92(s0)
	beq	a0,zero, .Lbranch_800095b2
	lw	a2,32(s5)
	c.addi	a2,-1

.Lbranch_80009046:
	sw	a2,32(s5)

.Lbranch_8000904a:
	beq	s3,zero, .Lbranch_80009060
	c.li	a0,1
	bne	s3,a0, .Lbranch_800090b8
	lbu	a1,0(s1)
	addi	a2,zero,47
	bne	a1,a2, .Lbranch_800090b8

.Lbranch_80009060:
	addi	a0,s0,-128
	c.mv	a1,s5
	auipc	ra,0x1
	jalr	ra,-1922(ra)	# _ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$19list_root_directory17h75191190115a3128E
	lw	a0,-128(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_80009698
	lw	a0,32(s5)
	bne	a0,zero, .Lbranch_80009698
	c.li	a0,-1
	sw	a0,32(s5)
	beq	s3,zero, .Lbranch_800095e4
	auipc	ra,0xffffa
	jalr	ra,1156(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,1
	c.mv	a2,s3
	auipc	ra,0xffffd
	jalr	ra,-144(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	beq	a0,zero, .Lbranch_800098d8
	c.mv	s2,a0
	bltu	a0,s1, .Lbranch_800095ea

.Lbranch_800090b2:
	sub	a0,s2,s1
	c.j	 .Lbranch_800095ee

.Lbranch_800090b8:
	addi	a1,zero,47
	sw	a1,-92(s0)
	sw	s1,-88(s0)
	sw	s3,-84(s0)
	sw	zero,-80(s0)
	sw	s3,-76(s0)
	sw	a1,-72(s0)
	sb	a0,-68(s0)
	sw	zero,-64(s0)
	sw	s3,-60(s0)
	sh	a0,-56(s0)
	addi	a0,s0,-180
	addi	a1,s0,-92
	auipc	ra,0xffffe
	jalr	ra,892(ra)	# _ZN98_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter..SpecFromIter$LT$T$C$I$GT$$GT$9from_iter17h6c66ad93582d4b77E
	lw	a0,-172(s0)
	beq	a0,zero, .Lbranch_80009578
	sw	s1,-216(s0)
	sw	s4,-188(s0)
	c.li	s1,0
	sw	zero,-184(s0)
	lui	s6,0xf0004
	lw	s9,-176(s0)
	slli	a1,a0,0x3
	lw	s7,8(s5)
	c.addi	a0,-1
	sw	a0,-208(s0)
	lui	s8,0x80000
	addi	s4,zero,58
	addi	s2,zero,32
	c.li	s10,10
	c.add	a1,s9
	sw	a1,-212(s0)

.Lbranch_80009134:
	sw	s9,-168(s0)
	lw	a1,0(s9)
	lw	a2,4(s9)
	addi	a0,s0,-164
	auipc	ra,0x5
	jalr	ra,1228(ra)	# _ZN5alloc3str21_$LT$impl$u20$str$GT$12to_uppercase17hec0b0999f9b1c5ebE
	c.andi	s1,1
	sw	s1,-192(s0)
	addi	a0,s0,-92
	c.mv	a1,s5
	c.beqz	s1, .Lbranch_80009166
	c.mv	a2,s7
	auipc	ra,0xfffff
	jalr	ra,1468(ra)	# _ZN11homebrew_os5fat3213FatFilesystem18read_cluster_chain17hf0011333f0efb2d8E
	c.j	 .Lbranch_8000916e

.Lbranch_80009166:
	auipc	ra,0x0
	jalr	ra,1918(ra)	# _ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$19list_root_directory17h75191190115a3128E

.Lbranch_8000916e:
	lw	a0,-92(s0)
	lw	s11,-88(s0)
	lw	s1,-84(s0)
	beq	a0,s8, .Lbranch_800096e0
	c.addi	s9,8
	lw	a1,-184(s0)
	c.addi	a1,1	# _start+0x1
	sw	a1,-196(s0)
	sw	a0,-152(s0)
	sw	s11,-148(s0)
	sw	s1,-144(s0)
	addi	a0,s0,-168
	sw	a0,-104(s0)
	lui	a0,0x8000b
	addi	a0,a0,912	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h362a8b237e242609E
	sw	a0,-100(s0)
	addi	a0,s0,-92
	addi	a2,s0,-104
	lui	a1,0x80012
	addi	a1,a1,1060	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x2a4
	auipc	ra,0x5
	jalr	ra,782(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-88(s0)
	lw	a1,-84(s0)

.Lbranch_800091ca:
	lw	a2,-2044(s6)	# __heap_end+0x6fd03804
	c.bnez	a2, .Lbranch_800091ca
	addi	a2,zero,91
	sw	a2,-2048(s6)

.Lbranch_800091d8:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_800091d8
	addi	a2,zero,68
	sw	a2,-2048(s6)

.Lbranch_800091e6:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_800091e6
	addi	a2,zero,93
	sw	a2,-2048(s6)

.Lbranch_800091f4:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_800091f4
	addi	a2,zero,48
	sw	a2,-2048(s6)

.Lbranch_80009202:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_80009202
	addi	a2,zero,50
	sw	a2,-2048(s6)

.Lbranch_80009210:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_80009210
	sw	s4,-2048(s6)

.Lbranch_8000921a:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000921a
	sw	s2,-2048(s6)
	c.beqz	a1, .Lbranch_8000923c
	c.add	a1,a0

.Lbranch_80009228:
	lbu	a2,0(a0)

.Lbranch_8000922c:
	lw	a3,-2044(s6)
	c.bnez	a3, .Lbranch_8000922c
	c.addi	a0,1
	sw	a2,-2048(s6)
	bne	a0,a1, .Lbranch_80009228

.Lbranch_8000923c:
	lw	a0,-2044(s6)
	c.bnez	a0, .Lbranch_8000923c
	sw	s10,-2048(s6)
	addi	a0,s0,-92
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffd
	jalr	ra,-1898(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	beq	s1,zero, .Lbranch_800096f2
	sw	s9,-204(s0)
	sw	s7,-200(s0)
	slli	a0,s1,0x2
	c.slli	s1,0x5
	c.add	a0,s1
	add	s9,s11,a0
	c.mv	s1,s11
	c.j	 .Lbranch_8000928a

.Lbranch_80009272:
	addi	a0,s0,-104
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffd
	jalr	ra,-1942(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_80009282:
	addi	s1,s1,36
	beq	s1,s9, .Lbranch_80009538

.Lbranch_8000928a:
	lbu	a0,20(s1)
	c.beqz	a0, .Lbranch_80009282
	c.lw	a0,0(s1)
	bne	a0,s8, .Lbranch_800092b4
	addi	a1,s1,21
	addi	a0,s0,-92
	c.li	a2,11
	auipc	ra,0x7
	jalr	ra,1184(ra)	# _ZN4core3str8converts9from_utf817ha3661ecfe8ef34e6E
	lw	a1,-92(s0)
	c.bnez	a1, .Lbranch_80009376
	lw	a0,-88(s0)
	c.j	 .Lbranch_80009378

.Lbranch_800092b4:
	c.lw	a1,4(s1)
	c.lw	a2,8(s1)
	sw	s1,-140(s0)
	addi	a0,s0,-104
	auipc	ra,0x5
	jalr	ra,848(ra)	# _ZN5alloc3str21_$LT$impl$u20$str$GT$12to_uppercase17hec0b0999f9b1c5ebE
	addi	a0,s0,-140
	sw	a0,-116(s0)
	lui	a0,0x8000e
	addi	a0,a0,-140	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6545979525451930E
	sw	a0,-112(s0)
	addi	a0,s0,-92
	addi	a2,s0,-116
	lui	a1,0x80012
	addi	a1,a1,-1984	# .LJTI2_1+0x24
	auipc	ra,0x5
	jalr	ra,476(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-88(s0)
	lw	a1,-84(s0)

.Lbranch_800092fc:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_800092fc
	addi	a2,zero,91
	sw	a2,-2048(s6)

.Lbranch_8000930a:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000930a
	addi	a2,zero,68
	sw	a2,-2048(s6)

.Lbranch_80009318:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_80009318
	addi	a2,zero,93
	sw	a2,-2048(s6)

.Lbranch_80009326:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_80009326
	addi	a2,zero,48
	sw	a2,-2048(s6)

.Lbranch_80009334:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_80009334
	addi	a2,zero,50
	sw	a2,-2048(s6)

.Lbranch_80009342:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_80009342
	sw	s4,-2048(s6)

.Lbranch_8000934c:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000934c
	sw	s2,-2048(s6)
	c.beqz	a1, .Lbranch_8000936e
	c.add	a1,a0

.Lbranch_8000935a:
	lbu	a2,0(a0)

.Lbranch_8000935e:
	lw	a3,-2044(s6)
	c.bnez	a3, .Lbranch_8000935e
	c.addi	a0,1
	sw	a2,-2048(s6)
	bne	a0,a1, .Lbranch_8000935a

.Lbranch_8000936e:
	lw	a0,-2044(s6)
	c.bnez	a0, .Lbranch_8000936e
	c.j	 .Lbranch_80009450

.Lbranch_80009376:
	c.li	a0,1

.Lbranch_80009378:
	lw	a2,-84(s0)
	c.addi	a1,-1
	c.and	a1,a2
	auipc	ra,0x5
	jalr	ra,-1000(ra)	# _ZN4core3str21_$LT$impl$u20$str$GT$12trim_matches17he6e51be3559aff03E
	c.mv	a2,a0
	c.mv	a3,a1
	sw	a0,-136(s0)
	sw	a1,-132(s0)
	addi	a0,s0,-104
	c.mv	a1,a2
	c.mv	a2,a3
	auipc	ra,0x5
	jalr	ra,628(ra)	# _ZN5alloc3str21_$LT$impl$u20$str$GT$12to_uppercase17hec0b0999f9b1c5ebE
	addi	a0,s0,-136
	sw	a0,-116(s0)
	lui	a0,0x8000b
	addi	a0,a0,948	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h7e91003129bfa5a6E
	sw	a0,-112(s0)
	addi	a0,s0,-92
	addi	a2,s0,-116
	lui	a1,0x80012
	addi	a1,a1,1828	# anon.aec296b685f742a7405bc8100ce2f275.23.llvm.14967730159154455495+0x170
	auipc	ra,0x5
	jalr	ra,256(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-88(s0)
	lw	a1,-84(s0)

.Lbranch_800093d8:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_800093d8
	addi	a2,zero,91
	sw	a2,-2048(s6)

.Lbranch_800093e6:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_800093e6
	addi	a2,zero,68
	sw	a2,-2048(s6)

.Lbranch_800093f4:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_800093f4
	addi	a2,zero,93
	sw	a2,-2048(s6)

.Lbranch_80009402:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_80009402
	addi	a2,zero,48
	sw	a2,-2048(s6)

.Lbranch_80009410:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_80009410
	addi	a2,zero,50
	sw	a2,-2048(s6)

.Lbranch_8000941e:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000941e
	sw	s4,-2048(s6)

.Lbranch_80009428:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_80009428
	sw	s2,-2048(s6)
	c.beqz	a1, .Lbranch_8000944a
	c.add	a1,a0

.Lbranch_80009436:
	lbu	a2,0(a0)

.Lbranch_8000943a:
	lw	a3,-2044(s6)
	c.bnez	a3, .Lbranch_8000943a
	c.addi	a0,1
	sw	a2,-2048(s6)
	bne	a0,a1, .Lbranch_80009436

.Lbranch_8000944a:
	lw	a0,-2044(s6)
	c.bnez	a0, .Lbranch_8000944a

.Lbranch_80009450:
	sw	s10,-2048(s6)
	addi	a0,s0,-92
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffc
	jalr	ra,1672(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	a2,-96(s0)
	lw	a0,-156(s0)
	bne	a2,a0, .Lbranch_80009272
	lw	a1,-160(s0)
	lw	a0,-100(s0)
	auipc	ra,0x8
	jalr	ra,804(ra)	# memcmp
	c.mv	s7,a0
	addi	a0,s0,-104
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffc
	jalr	ra,1626(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	bne	s7,zero, .Lbranch_80009282
	lw	a0,-208(s0)
	lw	a1,-184(s0)
	beq	a1,a0, .Lbranch_800097e4
	addi	a0,s0,-92
	c.mv	a1,s5
	lw	a2,-200(s0)
	lw	a3,-192(s0)
	c.mv	a4,s1
	auipc	ra,0xfffff
	jalr	ra,1958(ra)	# _ZN11homebrew_os5fat3213FatFilesystem30extract_cluster_from_raw_entry17he5b6be46c7d692d2E
	lw	a0,-92(s0)
	lw	s7,-88(s0)
	c.beqz	a0, .Lbranch_800094ce
	c.j	 .Lbranch_8000988a

.Lbranch_800094c6:
	addi	s11,s11,36
	beq	s11,s9, .Lbranch_800094e6

.Lbranch_800094ce:
	lw	a0,0(s11)
	beq	a0,s8, .Lbranch_800094c6
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s11
	auipc	ra,0xffffc
	jalr	ra,1544(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_800094c6

.Lbranch_800094e6:
	addi	a0,s0,-152
	c.li	a1,4
	addi	a2,zero,36
	auipc	ra,0xffffc
	jalr	ra,1524(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-164
	c.li	a1,1
	c.li	a2,1
	c.li	s1,1
	auipc	ra,0xffffc
	jalr	ra,1506(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	a0,-196(s0)
	sw	a0,-184(s0)
	lw	s9,-204(s0)
	lw	a0,-212(s0)
	bne	s9,a0, .Lbranch_80009134
	lui	a0,0x8001c
	addi	a0,a0,-2048	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.92
	c.li	a1,21
	lui	a2,0x80000
	lw	a3,-188(s0)
	c.sw	a2,0(a3)
	c.sw	a0,4(a3)
	c.sw	a1,8(a3)
	c.j	 .Lbranch_800097b6

.Lbranch_80009538:
	lui	a0,0x8001c
	addi	a0,a0,-2024	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.96
	addi	a1,zero,47
	lui	a2,0x80000
	lw	a3,-188(s0)
	c.sw	a2,0(a3)
	c.sw	a0,4(a3)
	c.sw	a1,8(a3)

.Lbranch_80009552:
	lui	s1,0x80000
	c.j	 .Lbranch_80009560

.Lbranch_80009558:
	addi	s11,s11,36
	beq	s11,s9, .Lbranch_8000970c

.Lbranch_80009560:
	lw	a0,0(s11)
	beq	a0,s1, .Lbranch_80009558
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s11
	auipc	ra,0xffffc
	jalr	ra,1398(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_80009558

.Lbranch_80009578:
	addi	a0,s0,-128
	c.mv	a1,s5
	auipc	ra,0x0
	jalr	ra,870(ra)	# _ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$19list_root_directory17h75191190115a3128E
	lw	a0,-128(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_8000979e
	lw	a0,32(s5)
	bne	a0,zero, .Lbranch_8000979e
	c.li	a0,-1
	sw	a0,32(s5)
	bge	s3,zero, .Lbranch_800096b2
	c.li	s6,0

.Lbranch_800095a6:
	c.mv	a0,s6
	c.mv	a1,s3
	auipc	ra,0x6
	jalr	ra,-1794(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_800095b2:
	lw	a0,-80(s0)
	c.li	a1,11
	bgeu	a0,a1, .Lbranch_8000989c
	lw	a1,-88(s0)
	slli	a2,a0,0x2
	c.slli	a0,0x4
	c.sub	a0,a2
	c.add	a0,a1
	addi	a1,a0,136
	c.mv	a0,s4
	auipc	ra,0xffffe
	jalr	ra,-1136(ra)	# _ZN67_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h9aa3a55fd397abf0E
	lw	a0,32(s5)
	c.addi	a0,-1
	sw	a0,32(s5)
	c.j	 .Lbranch_800097c6

.Lbranch_800095e4:
	c.li	s2,1
	bgeu	s2,s1, .Lbranch_800090b2

.Lbranch_800095ea:
	sub	a0,s1,s2

.Lbranch_800095ee:
	bltu	a0,s3, .Lbranch_800098ba
	addi	s6,s5,36
	c.mv	a0,s2
	c.mv	a1,s1
	c.mv	a2,s3
	auipc	ra,0xffffd
	jalr	ra,-1308(ra)	# memcpy
	sw	s3,-104(s0)
	sw	s2,-100(s0)
	sw	s3,-96(s0)
	addi	a0,s0,-92
	addi	a1,s0,-128
	auipc	ra,0xffffe
	jalr	ra,-1208(ra)	# _ZN67_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h9aa3a55fd397abf0E
	addi	a0,s0,-116
	addi	a2,s0,-104
	addi	a3,s0,-92
	c.mv	a1,s6
	auipc	ra,0x2
	jalr	ra,1258(ra)	# _ZN5alloc11collections5btree3map25BTreeMap$LT$K$C$V$C$A$GT$6insert17h1ede48cbef5aa3d1E
	lw	a0,-116(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_8000968e
	lw	a0,-108(s0)
	c.beqz	a0, .Lbranch_8000967c
	lw	s1,-112(s0)
	slli	a1,a0,0x2
	c.slli	a0,0x5
	c.add	a0,a1
	add	s2,s1,a0
	lui	s3,0x80000
	c.j	 .Lbranch_80009666

.Lbranch_8000965e:
	addi	s1,s1,36	# .Lpcrel_hi2+0x4
	beq	s1,s2, .Lbranch_8000967c

.Lbranch_80009666:
	c.lw	a0,0(s1)
	beq	a0,s3, .Lbranch_8000965e
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s1
	auipc	ra,0xffffc
	jalr	ra,1138(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_8000965e

.Lbranch_8000967c:
	addi	a0,s0,-116
	c.li	a1,4
	addi	a2,zero,36
	auipc	ra,0xffffc
	jalr	ra,1118(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_8000968e:
	lw	a0,32(s5)
	c.addi	a0,1
	sw	a0,32(s5)

.Lbranch_80009698:
	lw	a0,-128(s0)
	lw	a1,-124(s0)
	lw	a2,-120(s0)
	sw	a0,0(s4)
	sw	a1,4(s4)
	sw	a2,8(s4)
	c.j	 .Lbranch_800097c6

.Lbranch_800096b2:
	auipc	ra,0xffffa
	jalr	ra,-418(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,1
	c.li	s6,1
	c.mv	a2,s3
	auipc	ra,0xffffd
	jalr	ra,-1720(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	beq	a0,zero, .Lbranch_800095a6
	c.mv	s2,a0
	bltu	a0,s1, .Lbranch_80009730
	sub	a0,s2,s1
	c.j	 .Lbranch_80009734

.Lbranch_800096e0:
	lui	a0,0x80000
	lw	a1,-188(s0)
	c.sw	a0,0(a1)
	sw	s11,4(a1)	# .Lpcrel_hi0
	c.sw	s1,8(a1)
	c.j	 .Lbranch_8000971e

.Lbranch_800096f2:
	lui	a0,0x8001c
	addi	a0,a0,-2024	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.96
	addi	a1,zero,47
	lui	a2,0x80000
	lw	a3,-188(s0)
	c.sw	a2,0(a3)
	c.sw	a0,4(a3)
	c.sw	a1,8(a3)

.Lbranch_8000970c:
	addi	a0,s0,-152
	c.li	a1,4
	addi	a2,zero,36
	auipc	ra,0xffffc
	jalr	ra,974(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_8000971e:
	addi	a0,s0,-164
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffc
	jalr	ra,958(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_800097b6

.Lbranch_80009730:
	sub	a0,s1,s2

.Lbranch_80009734:
	bltu	a0,s3, .Lbranch_800098ba
	addi	s6,s5,36
	c.mv	a0,s2
	c.mv	a1,s1
	c.mv	a2,s3
	auipc	ra,0xffffd
	jalr	ra,-1634(ra)	# memcpy
	sw	s3,-104(s0)
	sw	s2,-100(s0)
	sw	s3,-96(s0)
	addi	a0,s0,-92
	addi	a1,s0,-128
	auipc	ra,0xffffe
	jalr	ra,-1534(ra)	# _ZN67_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h9aa3a55fd397abf0E
	addi	a0,s0,-116
	addi	a2,s0,-104
	addi	a3,s0,-92
	c.mv	a1,s6
	auipc	ra,0x2
	jalr	ra,932(ra)	# _ZN5alloc11collections5btree3map25BTreeMap$LT$K$C$V$C$A$GT$6insert17h1ede48cbef5aa3d1E
	lw	a0,-116(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_80009794
	addi	a0,s0,-116
	auipc	ra,0x1
	jalr	ra,1860(ra)	# _ZN4core3ptr77drop_in_place$LT$alloc..vec..Vec$LT$homebrew_os..filesystem..DirEntry$GT$$GT$17h606c86b2d1bb6f2bE

.Lbranch_80009794:
	lw	a0,32(s5)
	c.addi	a0,1
	sw	a0,32(s5)

.Lbranch_8000979e:
	lw	a0,-128(s0)
	lw	a1,-124(s0)
	lw	a2,-120(s0)
	sw	a0,0(s4)
	sw	a1,4(s4)
	sw	a2,8(s4)

.Lbranch_800097b6:
	addi	a0,s0,-180
	c.li	a1,4
	c.li	a2,8
	auipc	ra,0xffffc
	jalr	ra,806(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_800097c6:
	c.lwsp	ra,220(sp)
	c.lwsp	s0,216(sp)
	c.lwsp	s1,212(sp)
	c.lwsp	s2,208(sp)
	c.lwsp	s3,204(sp)
	c.lwsp	s4,200(sp)
	c.lwsp	s5,196(sp)
	c.lwsp	s6,192(sp)
	c.lwsp	s7,188(sp)
	c.lwsp	s8,184(sp)
	c.lwsp	s9,180(sp)
	c.lwsp	s10,176(sp)
	c.lwsp	s11,172(sp)
	c.addi16sp	sp,224
	c.jr	ra

.Lbranch_800097e4:
	addi	a0,s0,-128
	c.mv	a1,s5
	lw	a2,-200(s0)
	lw	a3,-192(s0)
	c.mv	a4,s1
	auipc	ra,0xfffff
	jalr	ra,1048(ra)	# _ZN11homebrew_os5fat3213FatFilesystem27read_directory_by_raw_entry17h02340b49e9d2aff7E
	lw	a0,-128(s0)
	lui	a1,0x80000
	lw	s1,-188(s0)
	beq	a0,a1, .Lbranch_80009876
	lw	a0,32(s5)
	c.bnez	a0, .Lbranch_80009876
	c.li	a0,-1
	sw	a0,32(s5)
	addi	s2,s5,36
	addi	a0,s0,-104
	lw	a1,-216(s0)
	c.mv	a2,s3
	auipc	ra,0xfffff
	jalr	ra,1686(ra)	# _ZN45_$LT$T$u20$as$u20$alloc..string..ToString$GT$9to_string17h360a1ba3600765bdE
	addi	a0,s0,-92
	addi	a1,s0,-128
	auipc	ra,0xffffe
	jalr	ra,-1750(ra)	# _ZN67_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h9aa3a55fd397abf0E
	addi	a0,s0,-116
	addi	a2,s0,-104
	addi	a3,s0,-92
	c.mv	a1,s2
	auipc	ra,0x2
	jalr	ra,716(ra)	# _ZN5alloc11collections5btree3map25BTreeMap$LT$K$C$V$C$A$GT$6insert17h1ede48cbef5aa3d1E
	lw	a0,-116(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_8000986c
	addi	a0,s0,-116
	auipc	ra,0x1
	jalr	ra,1644(ra)	# _ZN4core3ptr77drop_in_place$LT$alloc..vec..Vec$LT$homebrew_os..filesystem..DirEntry$GT$$GT$17h606c86b2d1bb6f2bE

.Lbranch_8000986c:
	lw	a0,32(s5)
	c.addi	a0,1
	sw	a0,32(s5)

.Lbranch_80009876:
	lw	a0,-128(s0)
	lw	a1,-124(s0)
	lw	a2,-120(s0)
	c.sw	a0,0(s1)
	c.sw	a1,4(s1)
	c.sw	a2,8(s1)
	c.j	 .Lbranch_80009552

.Lbranch_8000988a:
	lui	a1,0x80000
	lw	a2,-188(s0)
	c.sw	a1,0(a2)
	c.sw	a0,4(a2)
	sw	s7,8(a2)	# .Lpcrel_hi0+0x4
	c.j	 .Lbranch_80009552

.Lbranch_8000989c:
	lui	a0,0x8001d
	addi	a0,a0,-1176	# anon.3839376bf29ad69682d1272c1c63f1dd.33.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1360	# anon.3839376bf29ad69682d1272c1c63f1dd.22.llvm.7710812085696039936
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0x8
	jalr	ra,-1098(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800098ba:
	lui	a0,0x8001b
	addi	a0,a0,1216	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.72
	lui	a3,0x8001b
	addi	a3,a3,1796	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.78
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x8
	jalr	ra,-1128(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800098d8:
	c.li	a0,1
	c.li	a1,1
	auipc	ra,0x5
	jalr	ra,1484(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

	.globl _ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$19list_root_directory17h75191190115a3128E
_ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$19list_root_directory17h75191190115a3128E:
	addi	sp,sp,-944
	sw	ra,940(sp)
	sw	s0,936(sp)
	sw	s1,932(sp)
	sw	s2,928(sp)
	sw	s3,924(sp)
	sw	s4,920(sp)
	sw	s5,916(sp)
	sw	s6,912(sp)
	sw	s7,908(sp)
	sw	s8,904(sp)
	sw	s9,900(sp)
	sw	s10,896(sp)
	sw	s11,892(sp)
	c.addi4spn	s0,sp,944
	c.mv	s2,a1
	c.mv	s4,a0
	lui	s1,0xf0004
	c.li	a0,4
	sw	zero,-888(s0)
	sw	a0,-884(s0)
	sw	zero,-880(s0)
	addi	a0,s0,-876
	addi	a2,zero,512
	c.li	a1,0
	auipc	ra,0xffffd
	jalr	ra,-2022(ra)	# memset
	addi	a0,s2,8
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-328(s0)
	sw	a1,-324(s0)
	lui	a1,0x80013
	addi	a1,a1,-1840	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.1.llvm.2171931009800262987+0x120
	addi	a0,s0,-316
	addi	a2,s0,-328
	auipc	ra,0x5
	jalr	ra,-1186(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-312(s0)
	lw	a1,-308(s0)

.Lbranch_8000997a:
	lw	a2,-2044(s1)	# __heap_end+0x6fd03804
	c.bnez	a2, .Lbranch_8000997a
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80009988:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009988
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80009996:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009996
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_800099a4:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800099a4
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_800099b2:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800099b2
	addi	a2,zero,50
	sw	a2,-2048(s1)

.Lbranch_800099c0:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800099c0
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_800099ce:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_800099ce
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_800099f4
	c.add	a1,a0

.Lbranch_800099e0:
	lbu	a2,0(a0)

.Lbranch_800099e4:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_800099e4
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_800099e0

.Lbranch_800099f4:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_800099f4
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-316
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffc
	jalr	ra,220(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	a0,0(s2)
	lw	a1,8(s2)
	addi	a2,s0,-876
	addi	a3,zero,512
	auipc	ra,0x2
	jalr	ra,1032(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	beq	a0,zero, .Lbranch_80009b7c

.Lbranch_80009a2c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009a2c
	addi	a0,zero,91
	sw	a0,-2048(s1)

.Lbranch_80009a3a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009a3a
	addi	a0,zero,68
	sw	a0,-2048(s1)

.Lbranch_80009a48:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009a48
	addi	a0,zero,93
	sw	a0,-2048(s1)

.Lbranch_80009a56:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009a56
	addi	a0,zero,48
	sw	a0,-2048(s1)

.Lbranch_80009a64:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009a64
	addi	a0,zero,50
	sw	a0,-2048(s1)

.Lbranch_80009a72:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009a72
	addi	a0,zero,58
	sw	a0,-2048(s1)

.Lbranch_80009a80:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009a80
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,-1932	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.108
	sw	a2,-2048(s1)
	c.li	a2,26

.Lbranch_80009a98:
	add	a3,a1,a0
	lbu	a3,0(a3)

.Lbranch_80009aa0:
	lw	a4,-2044(s1)
	c.bnez	a4, .Lbranch_80009aa0
	c.addi	a0,1
	sw	a3,-2048(s1)
	bne	a0,a2, .Lbranch_80009a98

.Lbranch_80009ab0:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009ab0
	c.li	a0,10
	sw	a0,-2048(s1)
	lw	a0,-888(s0)
	lw	s3,-880(s0)
	bne	s3,a0, .Lbranch_80009ad4
	addi	a0,s0,-888
	auipc	ra,0xffffc
	jalr	ra,-72(ra)	# _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0fabdc8fdffe7aacE

.Lbranch_80009ad4:
	lw	a0,-884(s0)
	slli	a1,s3,0x2
	slli	a2,s3,0x5
	c.add	a1,a2
	lui	s2,0x80000
	add	s1,a0,a1
	c.li	a0,1
	sw	s2,0(s1)
	sw	zero,12(s1)
	sw	zero,16(s1)
	sb	a0,20(s1)
	addi	a0,s1,21
	lui	a1,0x8001c
	addi	a1,a1,-1904	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.109
	c.li	a2,11
	auipc	ra,0xffffc
	jalr	ra,1494(ra)	# memcpy
	c.li	a0,16
	sb	a0,32(s1)
	lw	a0,-888(s0)
	addi	s1,s3,1	# _start+0x1
	sw	s1,-880(s0)
	bne	s1,a0, .Lbranch_80009b34
	addi	a0,s0,-888
	auipc	ra,0xffffc
	jalr	ra,-168(ra)	# _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0fabdc8fdffe7aacE

.Lbranch_80009b34:
	lw	a0,-884(s0)
	slli	a1,s1,0x2
	c.slli	s1,0x5
	c.add	a1,s1
	addi	a2,zero,1024
	add	s1,a0,a1
	sw	s2,0(s1)
	c.sw	a2,12(s1)
	sw	zero,16(s1)
	sb	zero,20(s1)
	addi	a0,s1,21
	lui	a1,0x8001c
	addi	a1,a1,-1892	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.110
	c.li	a2,11
	auipc	ra,0xffffc
	jalr	ra,1404(ra)	# memcpy
	addi	a0,zero,32
	c.addi	s3,2
	sb	a0,32(s1)
	sw	s3,-880(s0)
	c.j	 .Lbranch_8000a1ee

.Lbranch_80009b7c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009b7c
	addi	a0,zero,91
	sw	a0,-2048(s1)

.Lbranch_80009b8a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009b8a
	addi	a0,zero,68
	sw	a0,-2048(s1)

.Lbranch_80009b98:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009b98
	addi	a0,zero,93
	sw	a0,-2048(s1)

.Lbranch_80009ba6:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009ba6
	addi	a0,zero,48
	sw	a0,-2048(s1)

.Lbranch_80009bb4:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009bb4
	addi	a0,zero,50
	sw	a0,-2048(s1)

.Lbranch_80009bc2:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009bc2
	addi	a0,zero,58
	sw	a0,-2048(s1)

.Lbranch_80009bd0:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009bd0
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,-1976	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.100
	sw	a2,-2048(s1)
	c.li	a2,30

.Lbranch_80009be8:
	add	a3,a1,a0
	lbu	a3,0(a3)

.Lbranch_80009bf0:
	lw	a4,-2044(s1)
	c.bnez	a4, .Lbranch_80009bf0
	c.addi	a0,1
	sw	a3,-2048(s1)
	bne	a0,a2, .Lbranch_80009be8

.Lbranch_80009c00:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009c00
	c.li	a1,10
	c.li	a0,1
	addi	a2,s0,-348
	addi	a3,s0,-316
	sw	a1,-2048(s1)
	sw	zero,-364(s0)
	sw	a0,-360(s0)
	sw	zero,-356(s0)
	bltu	a3,a2, .Lbranch_80009c2e
	c.sub	a3,a2
	sw	a3,-900(s0)
	c.j	 .Lbranch_80009c36

.Lbranch_80009c2e:
	sub	a0,a2,a3
	sw	a0,-900(s0)

.Lbranch_80009c36:
	c.li	s3,0
	addi	a0,s0,-876
	addi	s11,zero,229
	c.li	s2,16
	c.li	s9,15
	sub	a1,a0,a2
	sw	a1,-892(s0)
	c.sub	a2,a0
	sw	a2,-896(s0)

.Lbranch_80009c52:
	c.li	s10,0
	slli	s7,s3,0x5
	addi	s5,s0,-876
	c.add	s5,s7
	c.mv	s6,s3
	c.j	 .Lbranch_80009c70

.Lbranch_80009c62:
	sw	zero,-356(s0)

.Lbranch_80009c66:
	c.addi	s6,1
	addi	s10,s10,32
	beq	s6,s2, .Lbranch_8000a1de

.Lbranch_80009c70:
	add	a0,s5,s10
	lbu	a1,0(a0)
	sw	s6,-352(s0)
	beq	a1,s11, .Lbranch_80009c62
	beq	a1,zero, .Lbranch_8000a1de
	addi	a2,zero,222
	beq	a1,a2, .Lbranch_8000a114
	lbu	s8,11(a0)
	bne	s8,s9, .Lbranch_80009ca2
	addi	a1,s0,-364
	auipc	ra,0xffffe
	jalr	ra,1240(ra)	# _ZN11homebrew_os5fat3213FatFilesystem15parse_lfn_entry17h6d1ab544c69e0839E
	c.j	 .Lbranch_80009c66

.Lbranch_80009ca2:
	sw	zero,-348(s0)
	sw	zero,-344(s0)
	sh	zero,-340(s0)
	sb	zero,-338(s0)
	addi	a1,s0,-348
	bltu	a0,a1, .Lbranch_80009cc4
	lw	a1,-892(s0)
	c.add	s7,a1
	c.add	s10,s7
	c.j	 .Lbranch_80009cd0

.Lbranch_80009cc4:
	lw	a1,-896(s0)
	sub	a1,a1,s7
	sub	s10,a1,s10

.Lbranch_80009cd0:
	c.li	s7,10
	bgeu	s7,s10, .Lbranch_8000a240
	lbu	a7,4(a0)
	lbu	a2,5(a0)
	lbu	a6,6(a0)
	lbu	t0,7(a0)
	lbu	t2,0(a0)
	lbu	a3,1(a0)
	lbu	t1,2(a0)
	lbu	t4,3(a0)
	lbu	a1,9(a0)
	lbu	a5,8(a0)
	lbu	t3,10(a0)
	lbu	a4,20(a0)
	sw	a4,-908(s0)
	c.slli	a1,0x8
	c.slli	a2,0x8
	or	t5,a1,a5
	or	a7,a2,a7
	lbu	a1,21(a0)
	sw	a1,-916(s0)
	lbu	a1,26(a0)
	sw	a1,-912(s0)
	lbu	a1,27(a0)
	sw	a1,-920(s0)
	lbu	a5,28(a0)
	c.slli	a6,0x10
	c.slli	t0,0x18
	c.slli	a3,0x8
	or	a4,t0,a6
	or	a6,a3,t2
	lbu	a1,29(a0)
	lbu	a2,30(a0)
	lbu	a0,31(a0)
	c.slli	t1,0x10
	c.slli	t4,0x18
	or	a3,t4,t1
	c.slli	a1,0x8
	c.or	a1,a5
	c.slli	a0,0x18
	c.slli	a2,0x10
	c.or	a0,a2
	or	a2,a4,a7
	or	a3,a3,a6
	or	s3,a1,a0
	sw	a3,-348(s0)
	sw	a2,-344(s0)
	sh	t5,-340(s0)
	sb	t3,-338(s0)
	slli	a0,s8,0x1b
	c.srli	a0,0x1f
	sw	s3,-336(s0)
	sw	a0,-928(s0)
	sb	a0,-329(s0)
	addi	a0,s0,-316
	addi	a1,s0,-348
	c.li	a2,11
	auipc	ra,0x7
	jalr	ra,-1622(ra)	# _ZN4core3str8converts9from_utf817ha3661ecfe8ef34e6E
	lw	a0,-316(s0)
	sw	s3,-924(s0)
	c.bnez	a0, .Lbranch_80009db2
	lw	a0,-312(s0)
	lw	a1,-308(s0)
	c.j	 .Lbranch_80009dbc

.Lbranch_80009db2:
	c.li	a1,9
	lui	a0,0x8001c
	addi	a0,a0,-1944	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.103

.Lbranch_80009dbc:
	lui	s5,0x8000f
	addi	s5,s5,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	s10,s0,-316
	addi	s3,s6,1
	auipc	ra,0x4
	jalr	ra,460(ra)	# _ZN4core3str21_$LT$impl$u20$str$GT$12trim_matches17he6e51be3559aff03E
	sw	a0,-60(s0)
	sw	a1,-56(s0)
	addi	a0,s0,-60
	sw	a0,-316(s0)
	lui	a0,0x8000b
	addi	a0,a0,948	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h7e91003129bfa5a6E
	sw	a0,-312(s0)
	addi	a0,s0,-329
	sw	a0,-308(s0)
	lui	a0,0x8000f
	addi	a0,a0,1072	# _ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17hef7632af3fbf4ee8E
	sw	a0,-304(s0)
	addi	a0,s0,-336
	sw	a0,-300(s0)
	sw	s5,-296(s0)
	addi	a0,s0,-328
	addi	a2,s0,-316
	lui	a1,0x80012
	addi	a1,a1,-800	# anon.20b29b1f91e363e9fbd85f55f7c77062.12.llvm.14406403243838317486+0x110
	auipc	ra,0x4
	jalr	ra,1704(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-324(s0)
	lw	a1,-320(s0)

.Lbranch_80009e30:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009e30
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80009e3e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009e3e
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80009e4c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009e4c
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_80009e5a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009e5a
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_80009e68:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009e68
	addi	a2,zero,50
	sw	a2,-2048(s1)

.Lbranch_80009e76:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009e76
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_80009e84:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009e84
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_80009eaa
	c.add	a1,a0

.Lbranch_80009e96:
	lbu	a2,0(a0)

.Lbranch_80009e9a:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_80009e9a
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_80009e96

.Lbranch_80009eaa:
	lw	a0,-920(s0)
	c.slli	a0,0x8
	lw	a1,-916(s0)
	c.slli	a1,0x18
	lw	a2,-908(s0)
	c.slli	a2,0x10
	lw	a3,-912(s0)
	c.or	a0,a3
	c.or	a1,a2
	c.or	a0,a1
	sw	a0,-908(s0)

.Lbranch_80009eca:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_80009eca
	sw	s7,-2048(s1)
	addi	a0,s0,-328
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffc
	jalr	ra,-1016(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	s5,-356(s0)
	beq	s5,zero, .Lbranch_80009f18
	addi	a0,s0,-316
	addi	a2,zero,255
	c.li	a1,0
	auipc	ra,0xffffc
	jalr	ra,610(ra)	# memset
	addi	a0,zero,254
	bltu	s5,a0, .Lbranch_80009f0a
	addi	s5,zero,254

.Lbranch_80009f0a:
	lw	a0,-360(s0)
	bltu	s10,a0, .Lbranch_80009f44
	sub	a0,s10,a0
	c.j	 .Lbranch_80009f48

.Lbranch_80009f18:
	addi	a0,s0,-316
	addi	a2,zero,255
	c.li	a1,0
	auipc	ra,0xffffc
	jalr	ra,566(ra)	# memset
	lw	a0,-900(s0)
	bgeu	s7,a0, .Lbranch_8000a240
	lui	a0,0x80000
	sw	a0,-912(s0)
	lw	s10,-932(s0)
	lw	s5,-904(s0)
	c.j	 .Lbranch_80009f6c

.Lbranch_80009f44:
	sub	a0,a0,s10

.Lbranch_80009f48:
	bltu	a0,s5, .Lbranch_8000a240
	addi	a0,s0,-316
	addi	a1,s0,-364
	auipc	ra,0x5
	jalr	ra,152(ra)	# _ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h023a536b8922818aE
	lw	a0,-316(s0)
	sw	a0,-912(s0)
	lw	s10,-312(s0)
	lw	s5,-308(s0)

.Lbranch_80009f6c:
	addi	a0,s0,-316
	addi	a1,s0,-348
	c.li	a2,11
	auipc	ra,0x6
	jalr	ra,1994(ra)	# _ZN4core3str8converts9from_utf817ha3661ecfe8ef34e6E
	lw	a0,-316(s0)
	c.bnez	a0, .Lbranch_80009f8e
	lw	a0,-312(s0)
	lw	a1,-308(s0)
	c.j	 .Lbranch_80009f98

.Lbranch_80009f8e:
	c.li	a1,1
	lui	a0,0x8001b
	addi	a0,a0,816	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.28

.Lbranch_80009f98:
	auipc	ra,0x4
	jalr	ra,0(ra)	# _ZN4core3str21_$LT$impl$u20$str$GT$12trim_matches17he6e51be3559aff03E
	sw	a0,-60(s0)
	sw	a1,-56(s0)
	addi	a0,s0,-60
	sw	a0,-328(s0)
	lui	a0,0x8000b
	addi	a0,a0,948	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h7e91003129bfa5a6E
	sw	a0,-324(s0)
	addi	a0,s0,-316
	addi	a2,s0,-328
	lui	a1,0x80012
	addi	a1,a1,736	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x160
	auipc	ra,0x4
	jalr	ra,1276(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-312(s0)
	lw	a1,-308(s0)

.Lbranch_80009fdc:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009fdc
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_80009fea:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009fea
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_80009ff8:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_80009ff8
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000a006:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a006
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_8000a014:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a014
	addi	a2,zero,50
	sw	a2,-2048(s1)

.Lbranch_8000a022:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a022
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_8000a030:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a030
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_8000a056
	c.add	a1,a0

.Lbranch_8000a042:
	lbu	a2,0(a0)

.Lbranch_8000a046:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_8000a046
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_8000a042

.Lbranch_8000a056:
	sw	s5,-904(s0)

.Lbranch_8000a05a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000a05a
	sw	s7,-2048(s1)
	addi	a0,s0,-316
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffc
	jalr	ra,-1416(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	a0,-348(s0)
	lw	a1,-344(s0)
	lh	a2,-340(s0)
	lbu	a3,-338(s0)
	lw	a4,-888(s0)
	lw	s5,-880(s0)
	sw	a0,-316(s0)
	sw	a1,-312(s0)
	sh	a2,-308(s0)
	sb	a3,-306(s0)
	bne	s5,a4, .Lbranch_8000a0ac
	addi	a0,s0,-888
	auipc	ra,0xffffc
	jalr	ra,-1568(ra)	# _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0fabdc8fdffe7aacE

.Lbranch_8000a0ac:
	lw	a0,-884(s0)
	slli	a1,s5,0x2
	slli	a2,s5,0x5
	c.add	a1,a2
	add	s7,a0,a1
	lw	a0,-912(s0)
	sw	a0,0(s7)
	sw	s10,-932(s0)
	sw	s10,4(s7)
	lw	a0,-904(s0)
	sw	a0,8(s7)
	lw	a0,-924(s0)
	sw	a0,12(s7)
	lw	a0,-908(s0)
	sw	a0,16(s7)
	lw	a0,-928(s0)
	sb	a0,20(s7)
	addi	a0,s7,21
	addi	a1,s0,-316
	c.li	a2,11
	auipc	ra,0xffffc
	jalr	ra,-24(ra)	# memcpy
	sb	s8,32(s7)
	c.addi	s5,1
	sw	s5,-880(s0)
	sw	zero,-356(s0)
	bltu	s6,s9, .Lbranch_80009c52
	c.j	 .Lbranch_8000a1de

.Lbranch_8000a114:
	addi	a0,s0,-352
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-328(s0)
	sw	a1,-324(s0)
	lui	a1,0x80012
	addi	a1,a1,-1456	# anon.3839376bf29ad69682d1272c1c63f1dd.7.llvm.7710812085696039936+0x180
	addi	a0,s0,-316
	addi	a2,s0,-328
	auipc	ra,0x4
	jalr	ra,912(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-312(s0)
	lw	a1,-308(s0)

.Lbranch_8000a148:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a148
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_8000a156:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a156
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_8000a164:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a164
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000a172:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a172
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_8000a180:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a180
	addi	a2,zero,50
	sw	a2,-2048(s1)

.Lbranch_8000a18e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a18e
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_8000a19c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000a19c
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_8000a1c2
	c.add	a1,a0

.Lbranch_8000a1ae:
	lbu	a2,0(a0)

.Lbranch_8000a1b2:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_8000a1b2
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_8000a1ae

.Lbranch_8000a1c2:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000a1c2
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-316
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffc
	jalr	ra,-1778(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_8000a1de:
	addi	a0,s0,-364
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffc
	jalr	ra,-1794(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_8000a1ee:
	lw	a0,-888(s0)
	lw	a1,-884(s0)
	lw	a2,-880(s0)
	sw	a0,0(s4)
	sw	a1,4(s4)
	sw	a2,8(s4)
	lw	ra,940(sp)
	lw	s0,936(sp)
	lw	s1,932(sp)
	lw	s2,928(sp)
	lw	s3,924(sp)
	lw	s4,920(sp)
	lw	s5,916(sp)
	lw	s6,912(sp)
	lw	s7,908(sp)
	lw	s8,904(sp)
	lw	s9,900(sp)
	lw	s10,896(sp)
	lw	s11,892(sp)
	addi	sp,sp,944
	c.jr	ra

.Lbranch_8000a240:
	lui	a0,0x8001c
	addi	a0,a0,-1804	# anon.3973a9c3f4224926bbecf4cad58bd903.0.llvm.1830756879319262441
	lui	a3,0x8001c
	addi	a3,a3,-1520	# anon.3973a9c3f4224926bbecf4cad58bd903.2.llvm.1830756879319262441
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x7
	jalr	ra,530(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$9read_file17h0de8b06997d32bb8E
_ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$9read_file17h0de8b06997d32bb8E:
	addi	sp,sp,-672
	sw	ra,668(sp)
	sw	s0,664(sp)
	sw	s1,660(sp)
	sw	s2,656(sp)
	sw	s3,652(sp)
	sw	s4,648(sp)
	sw	s5,644(sp)
	sw	s6,640(sp)
	sw	s7,636(sp)
	sw	s8,632(sp)
	sw	s9,628(sp)
	sw	s10,624(sp)
	sw	s11,620(sp)
	c.addi4spn	s0,sp,672
	c.mv	s10,a3
	c.mv	s3,a0
	addi	a0,zero,47
	c.li	a3,1
	sw	a0,-564(s0)
	sw	a1,-560(s0)
	sw	a2,-556(s0)
	sw	zero,-552(s0)
	sw	a2,-548(s0)
	sw	a0,-544(s0)
	sb	a3,-540(s0)
	sw	zero,-536(s0)
	sw	a2,-532(s0)
	sh	a3,-528(s0)
	addi	a0,s0,-636
	addi	a1,s0,-564
	auipc	ra,0xffffd
	jalr	ra,404(ra)	# _ZN98_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter..SpecFromIter$LT$T$C$I$GT$$GT$9from_iter17h6c66ad93582d4b77E
	lw	a2,-628(s0)
	c.beqz	a2, .Lbranch_8000a348
	lw	a1,-632(s0)
	c.addi	a2,-1
	slli	a0,a2,0x3
	c.add	a0,a1
	c.lw	s1,0(a0)
	lw	s4,4(a0)
	c.beqz	a2, .Lbranch_8000a354
	lui	a3,0x8001b
	addi	a3,a3,2044	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.91
	addi	a0,s0,-576
	c.li	a4,1
	auipc	ra,0x1
	jalr	ra,-972(ra)	# _ZN5alloc3str75_$LT$impl$u20$alloc..slice..Join$LT$$RF$str$GT$$u20$for$u20$$u5b$S$u5d$$GT$4join17hd60a5951b4d2869dE
	lw	a2,-572(s0)
	lw	a3,-568(s0)
	addi	a0,s0,-564
	c.mv	a1,s3
	auipc	ra,0xfffff
	jalr	ra,-822(ra)	# _ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$14list_directory17he8a03d10feae307bE
	lw	a0,-564(s0)
	lw	s11,-560(s0)
	lw	s9,-556(s0)
	lui	a1,0x80000
	bne	a0,a1, .Lbranch_8000a384
	addi	a0,s0,-576
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,1958(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_8000a654

.Lbranch_8000a348:
	c.li	s9,10
	lui	s11,0x8001c
	addi	s11,s11,-1864	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.113
	c.j	 .Lbranch_8000a654

.Lbranch_8000a354:
	addi	a0,s0,-564
	c.mv	a1,s3
	auipc	ra,0xfffff
	jalr	ra,1418(ra)	# _ZN89_$LT$homebrew_os..fat32..FatFilesystem$u20$as$u20$homebrew_os..filesystem..Filesystem$GT$19list_root_directory17h75191190115a3128E
	lw	a0,-564(s0)
	lw	s11,-560(s0)
	lw	s9,-556(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_8000a654
	sw	a0,-624(s0)
	sw	s11,-620(s0)
	sw	s9,-616(s0)
	c.j	 .Lbranch_8000a3a0

.Lbranch_8000a384:
	sw	a0,-624(s0)
	sw	s11,-620(s0)
	sw	s9,-616(s0)
	addi	a0,s0,-576
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,1868(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_8000a3a0:
	addi	a0,s0,-612
	c.mv	a1,s1
	c.mv	a2,s4
	auipc	ra,0x4
	jalr	ra,616(ra)	# _ZN5alloc3str21_$LT$impl$u20$str$GT$12to_uppercase17hec0b0999f9b1c5ebE
	beq	s9,zero, .Lbranch_8000a628
	slli	s7,s9,0x2
	c.slli	s9,0x5
	lw	s4,-608(s0)
	lw	s5,-604(s0)
	c.add	s7,s9
	add	s2,s11,s7
	addi	s1,s11,21
	lui	s8,0x80000
	c.j	 .Lbranch_8000a3ee

.Lbranch_8000a3d2:
	addi	a0,s0,-564
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,1802(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_8000a3e2:
	addi	s7,s7,-36
	addi	s1,s1,36
	beq	s7,zero, .Lbranch_8000a5f2

.Lbranch_8000a3ee:
	lbu	a0,-1(s1)
	c.bnez	a0, .Lbranch_8000a3e2
	lw	a0,-21(s1)
	bne	a0,s8, .Lbranch_8000a418
	addi	a0,s0,-564
	c.li	a2,11
	c.mv	a1,s1
	auipc	ra,0x6
	jalr	ra,828(ra)	# _ZN4core3str8converts9from_utf817ha3661ecfe8ef34e6E
	lw	a1,-564(s0)
	c.bnez	a1, .Lbranch_8000a426
	lw	a0,-560(s0)
	c.j	 .Lbranch_8000a428

.Lbranch_8000a418:
	lw	a1,-17(s1)
	lw	a2,-13(s1)
	addi	a0,s0,-564
	c.j	 .Lbranch_8000a444

.Lbranch_8000a426:
	c.li	a0,1

.Lbranch_8000a428:
	lw	a2,-556(s0)
	c.addi	a1,-1	# .Lline_table_start1+0x7ffb3eaa
	c.and	a1,a2
	auipc	ra,0x4
	jalr	ra,-1176(ra)	# _ZN4core3str21_$LT$impl$u20$str$GT$12trim_matches17he6e51be3559aff03E
	c.mv	a2,a0
	c.mv	a3,a1
	addi	a0,s0,-564
	c.mv	a1,a2
	c.mv	a2,a3

.Lbranch_8000a444:
	auipc	ra,0x4
	jalr	ra,460(ra)	# _ZN5alloc3str21_$LT$impl$u20$str$GT$12to_uppercase17hec0b0999f9b1c5ebE
	lw	a0,-556(s0)
	bne	a0,s5, .Lbranch_8000a3d2
	lw	a0,-560(s0)
	c.mv	a1,s4
	c.mv	a2,s5
	auipc	ra,0x7
	jalr	ra,832(ra)	# memcmp
	c.mv	s6,a0
	addi	a0,s0,-564
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,1654(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	bne	s6,zero, .Lbranch_8000a3e2
	lw	s4,-5(s1)
	lw	s1,-9(s1)
	lw	a0,0(s10)
	sw	s4,-600(s0)
	sw	s1,-596(s0)
	sw	zero,8(s10)
	bltu	a0,s1, .Lbranch_8000aaca

.Lbranch_8000a496:
	lw	a0,20(s3)
	srli	a1,a0,0x17
	bne	a1,zero, .Lbranch_8000ab76
	addi	a3,s3,20
	slli	a4,a0,0x9
	lui	s6,0xf0004
	addi	a0,s0,-596
	lui	a5,0x8000f
	addi	a5,a5,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	a1,s0,-600
	addi	a2,s0,-592
	sw	a4,-640(s0)
	sw	a4,-592(s0)
	sw	a0,-564(s0)
	sw	a5,-560(s0)
	sw	a1,-556(s0)
	sw	a5,-552(s0)
	sw	a3,-648(s0)
	sw	a3,-548(s0)
	sw	a5,-544(s0)
	sw	a2,-540(s0)
	sw	a5,-536(s0)
	lui	a1,0x80012
	addi	a1,a1,520	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x88
	addi	a0,s0,-576
	addi	a2,s0,-564
	auipc	ra,0x4
	jalr	ra,-54(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-572(s0)
	lw	a1,-568(s0)

.Lbranch_8000a50e:
	lw	a2,-2044(s6)	# __heap_end+0x6fd03804
	c.bnez	a2, .Lbranch_8000a50e
	addi	a2,zero,91
	sw	a2,-2048(s6)

.Lbranch_8000a51c:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a51c
	addi	a2,zero,68
	sw	a2,-2048(s6)

.Lbranch_8000a52a:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a52a
	addi	a2,zero,93
	sw	a2,-2048(s6)

.Lbranch_8000a538:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a538
	addi	a2,zero,48
	sw	a2,-2048(s6)

.Lbranch_8000a546:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a546
	addi	a2,zero,50
	sw	a2,-2048(s6)

.Lbranch_8000a554:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a554
	addi	a2,zero,58
	sw	a2,-2048(s6)

.Lbranch_8000a562:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a562
	addi	a2,zero,32
	sw	a2,-2048(s6)
	c.beqz	a1, .Lbranch_8000a588
	c.add	a1,a0

.Lbranch_8000a574:
	lbu	a2,0(a0)

.Lbranch_8000a578:
	lw	a3,-2044(s6)
	c.bnez	a3, .Lbranch_8000a578
	c.addi	a0,1
	sw	a2,-2048(s6)
	bne	a0,a1, .Lbranch_8000a574

.Lbranch_8000a588:
	lw	a0,-2044(s6)
	c.bnez	a0, .Lbranch_8000a588
	c.li	a0,10
	sw	a0,-2048(s6)
	addi	a0,s0,-576
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,1352(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	s5,8(s10)
	bgeu	s5,s1, .Lbranch_8000a6a2
	lw	a0,0(s10)
	sub	s7,s1,s5
	sub	a0,a0,s5
	bltu	a0,s7, .Lbranch_8000aade

.Lbranch_8000a5bc:
	lw	s9,4(s10)
	c.li	a1,2
	add	a0,s9,s5
	bltu	s7,a1, .Lbranch_8000a5de
	c.addi	s7,-1
	c.li	a1,0
	c.mv	a2,s7
	auipc	ra,0xffffc
	jalr	ra,-1144(ra)	# memset
	c.add	s5,s7
	add	a0,s9,s5

.Lbranch_8000a5de:
	sb	zero,0(a0)
	c.addi	s5,1
	sw	s10,-664(s0)
	sw	s5,-644(s0)
	sw	s5,8(s10)
	c.j	 .Lbranch_8000a6b6

.Lbranch_8000a5f2:
	addi	a0,s0,-612
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,1258(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lui	s1,0x80000
	c.j	 .Lbranch_8000a610

.Lbranch_8000a608:
	addi	s11,s11,36
	beq	s11,s2, .Lbranch_8000a638

.Lbranch_8000a610:
	lw	a0,0(s11)
	beq	a0,s1, .Lbranch_8000a608
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s11
	auipc	ra,0xffffb
	jalr	ra,1222(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_8000a608

.Lbranch_8000a628:
	addi	a0,s0,-612
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,1204(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_8000a638:
	addi	a0,s0,-624
	c.li	a1,4
	addi	a2,zero,36
	auipc	ra,0xffffb
	jalr	ra,1186(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.li	s9,14
	lui	s11,0x8001c
	addi	s11,s11,-1880	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.112

.Lbranch_8000a654:
	addi	a0,s0,-636
	c.li	a1,4
	c.li	a2,8
	auipc	ra,0xffffb
	jalr	ra,1160(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.mv	a0,s11
	c.mv	a1,s9
	lw	ra,668(sp)
	lw	s0,664(sp)
	lw	s1,660(sp)
	lw	s2,656(sp)
	lw	s3,652(sp)
	lw	s4,648(sp)
	lw	s5,644(sp)
	lw	s6,640(sp)
	lw	s7,636(sp)
	lw	s8,632(sp)
	lw	s9,628(sp)
	lw	s10,624(sp)
	lw	s11,620(sp)
	addi	sp,sp,672
	c.jr	ra

.Lbranch_8000a6a2:
	sw	s1,8(s10)
	beq	s1,zero, .Lbranch_8000a93e
	sw	s10,-664(s0)
	lw	s9,4(s10)
	sw	s1,-644(s0)

.Lbranch_8000a6b6:
	c.li	s10,0
	c.mv	s7,s1
	sw	s1,-652(s0)
	sw	s9,-656(s0)

.Lbranch_8000a6c2:
	c.mv	s8,s7
	lw	a0,-640(s0)
	bltu	s7,a0, .Lbranch_8000a6d0
	lw	s8,-640(s0)

.Lbranch_8000a6d0:
	lw	a0,-648(s0)
	c.lw	a0,0(a0)
	c.li	a1,1
	bne	a0,a1, .Lbranch_8000a74a
	c.li	a0,2
	bltu	s4,a0, .Lbranch_8000ab06
	lw	s1,16(s3)
	addi	a0,s4,-2
	c.add	s1,a0
	bltu	s1,a0, .Lbranch_8000ab16
	addi	a0,zero,512
	bltu	s8,a0, .Lbranch_8000a6fc
	addi	s8,zero,512

.Lbranch_8000a6fc:
	addi	a0,s0,-564
	addi	a2,zero,512
	c.li	a1,0
	auipc	ra,0xffffc
	jalr	ra,-1454(ra)	# memset
	lw	a0,0(s3)
	addi	a2,s0,-564
	addi	a3,zero,512
	c.mv	a1,s1
	auipc	ra,0x1
	jalr	ra,1804(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	bne	a0,zero, .Lbranch_8000aa60
	add	s5,s8,s10
	bltu	s5,s8, .Lbranch_8000ab66
	lw	a0,-644(s0)
	bltu	a0,s5, .Lbranch_8000aa7c
	add	a0,s9,s10
	addi	a1,s0,-564
	bltu	a0,a1, .Lbranch_8000a8c8
	sub	a1,a0,a1
	c.j	 .Lbranch_8000a8ca

.Lbranch_8000a74a:
	add	s5,s8,s10
	bltu	s5,s8, .Lbranch_8000ab26
	lw	a1,-644(s0)
	bltu	a1,s5, .Lbranch_8000aa72
	sw	s4,-588(s0)
	sw	s8,-584(s0)
	c.li	a1,2
	bltu	s4,a1, .Lbranch_8000ab56
	addi	a1,s4,-2
	mulhu	a2,a1,a0
	bne	a2,zero, .Lbranch_8000ab46
	lw	a2,16(s3)
	mul	s1,a1,a0
	c.add	s1,a2
	bltu	s1,a2, .Lbranch_8000ab36
	c.add	s10,s9
	addi	a0,s8,511	# rust_main+0x43
	addi	a1,s0,-588
	sw	a1,-564(s0)
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a1,-560(s0)
	addi	a2,s0,-580
	sw	a2,-556(s0)
	sw	a1,-552(s0)
	srli	s9,a0,0x9
	sw	s9,-580(s0)
	addi	a0,s0,-584
	sw	a0,-548(s0)
	sw	a1,-544(s0)
	addi	a0,s0,-576
	addi	a2,s0,-564
	lui	a1,0x80012
	addi	a1,a1,-1328	# anon.3839376bf29ad69682d1272c1c63f1dd.7.llvm.7710812085696039936+0x200
	auipc	ra,0x4
	jalr	ra,-772(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-572(s0)
	lw	a1,-568(s0)

.Lbranch_8000a7dc:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a7dc
	addi	a2,zero,91
	sw	a2,-2048(s6)

.Lbranch_8000a7ea:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a7ea
	addi	a2,zero,68
	sw	a2,-2048(s6)

.Lbranch_8000a7f8:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a7f8
	addi	a2,zero,93
	sw	a2,-2048(s6)

.Lbranch_8000a806:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a806
	addi	a2,zero,48
	sw	a2,-2048(s6)

.Lbranch_8000a814:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a814
	addi	a2,zero,50
	sw	a2,-2048(s6)

.Lbranch_8000a822:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a822
	addi	a2,zero,58
	sw	a2,-2048(s6)

.Lbranch_8000a830:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a830
	addi	a2,zero,32
	sw	a2,-2048(s6)
	c.beqz	a1, .Lbranch_8000a856
	c.add	a1,a0

.Lbranch_8000a842:
	lbu	a2,0(a0)

.Lbranch_8000a846:
	lw	a3,-2044(s6)
	c.bnez	a3, .Lbranch_8000a846
	c.addi	a0,1
	sw	a2,-2048(s6)
	bne	a0,a1, .Lbranch_8000a842

.Lbranch_8000a856:
	lw	a0,-2044(s6)
	c.bnez	a0, .Lbranch_8000a856
	c.li	a0,10
	sw	a0,-2048(s6)
	addi	a0,s0,-576
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,634(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.li	a0,1
	bne	s9,a0, .Lbranch_8000a8b0
	sw	s10,-660(s0)
	addi	a0,s0,-564
	addi	a2,zero,512
	c.li	a1,0
	auipc	ra,0xffffc
	jalr	ra,-1838(ra)	# memset
	lw	a0,0(s3)
	addi	a2,s0,-564
	addi	a3,zero,512
	c.mv	a1,s1
	auipc	ra,0x1
	jalr	ra,1420(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	c.mv	s10,a0
	c.beqz	a0, .Lbranch_8000a8fa
	c.mv	s9,a1
	beq	s10,zero, .Lbranch_8000a8dc
	c.j	 .Lbranch_8000aa14

.Lbranch_8000a8b0:
	lw	a0,0(s3)
	c.mv	a1,s1
	c.mv	a2,s9
	c.mv	a3,s10
	c.mv	a4,s8
	auipc	ra,0x2
	jalr	ra,-1600(ra)	# _ZN11homebrew_os6sdcard6SdCard12read_sectors17hc221ebece99dc8b1E
	c.beqz	a0, .Lbranch_8000a8dc
	c.j	 .Lbranch_8000aa6c

.Lbranch_8000a8c8:
	c.sub	a1,a0

.Lbranch_8000a8ca:
	bltu	a1,s8, .Lbranch_8000aa94
	addi	a1,s0,-564
	c.mv	a2,s8
	auipc	ra,0xffffc
	jalr	ra,-2036(ra)	# memcpy

.Lbranch_8000a8dc:
	sub	s7,s7,s8
	lw	s1,-652(s0)
	lw	s9,-656(s0)
	beq	s7,zero, .Lbranch_8000a932
	c.addi	s4,1
	beq	s4,zero, .Lbranch_8000aaf6
	c.mv	s10,s5
	bltu	s5,s1, .Lbranch_8000a6c2
	c.j	 .Lbranch_8000a932

.Lbranch_8000a8fa:
	addi	a0,zero,513
	bgeu	s8,a0, .Lbranch_8000aab2
	addi	a0,s0,-564
	lw	a1,-660(s0)
	bltu	a1,a0, .Lbranch_8000a914
	sub	a0,a1,a0
	c.j	 .Lbranch_8000a916

.Lbranch_8000a914:
	c.sub	a0,a1

.Lbranch_8000a916:
	bltu	a0,s8, .Lbranch_8000aa94
	addi	a1,s0,-564
	lw	a0,-660(s0)
	c.mv	a2,s8
	auipc	ra,0xffffb
	jalr	ra,1980(ra)	# memcpy
	beq	s10,zero, .Lbranch_8000a8dc
	c.j	 .Lbranch_8000aa14

.Lbranch_8000a932:
	lw	s10,-664(s0)
	lw	a0,-644(s0)
	bltu	a0,s1, .Lbranch_8000a944

.Lbranch_8000a93e:
	sw	s1,8(s10)
	c.mv	a0,s1

.Lbranch_8000a944:
	sw	a0,-580(s0)
	addi	a0,s0,-580
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-576(s0)
	sw	a1,-572(s0)
	lui	a1,0x80012
	addi	a1,a1,-828	# anon.20b29b1f91e363e9fbd85f55f7c77062.12.llvm.14406403243838317486+0xf4
	addi	a0,s0,-564
	addi	a2,s0,-576
	auipc	ra,0x4
	jalr	ra,-1188(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-560(s0)
	lw	a1,-556(s0)

.Lbranch_8000a97c:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a97c
	addi	a2,zero,91
	sw	a2,-2048(s6)

.Lbranch_8000a98a:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a98a
	addi	a2,zero,68
	sw	a2,-2048(s6)

.Lbranch_8000a998:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a998
	addi	a2,zero,93
	sw	a2,-2048(s6)

.Lbranch_8000a9a6:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a9a6
	addi	a2,zero,48
	sw	a2,-2048(s6)

.Lbranch_8000a9b4:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a9b4
	addi	a2,zero,50
	sw	a2,-2048(s6)

.Lbranch_8000a9c2:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a9c2
	addi	a2,zero,58
	sw	a2,-2048(s6)

.Lbranch_8000a9d0:
	lw	a2,-2044(s6)
	c.bnez	a2, .Lbranch_8000a9d0
	addi	a2,zero,32
	sw	a2,-2048(s6)
	c.beqz	a1, .Lbranch_8000a9f6
	c.add	a1,a0

.Lbranch_8000a9e2:
	lbu	a2,0(a0)

.Lbranch_8000a9e6:
	lw	a3,-2044(s6)
	c.bnez	a3, .Lbranch_8000a9e6
	c.addi	a0,1
	sw	a2,-2048(s6)
	bne	a0,a1, .Lbranch_8000a9e2

.Lbranch_8000a9f6:
	lw	a0,-2044(s6)
	c.bnez	a0, .Lbranch_8000a9f6
	c.li	a0,10
	sw	a0,-2048(s6)
	addi	a0,s0,-564
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,218(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.li	s10,0

.Lbranch_8000aa14:
	addi	a0,s0,-612
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,200(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lui	s1,0x80000
	c.j	 .Lbranch_8000aa32

.Lbranch_8000aa2a:
	addi	s11,s11,36
	beq	s11,s2, .Lbranch_8000aa4a

.Lbranch_8000aa32:
	lw	a0,0(s11)
	beq	a0,s1, .Lbranch_8000aa2a
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s11
	auipc	ra,0xffffb
	jalr	ra,164(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_8000aa2a

.Lbranch_8000aa4a:
	addi	a0,s0,-624
	c.li	a1,4
	addi	a2,zero,36
	auipc	ra,0xffffb
	jalr	ra,144(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.mv	s11,s10
	c.j	 .Lbranch_8000a654

.Lbranch_8000aa60:
	c.li	s9,26
	lui	s10,0x8001b
	addi	s10,s10,948	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.41
	c.j	 .Lbranch_8000aa14

.Lbranch_8000aa6c:
	c.mv	s10,a0
	c.mv	s9,a1
	c.j	 .Lbranch_8000aa14

.Lbranch_8000aa72:
	lui	a3,0x8001b
	addi	a3,a3,916	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.38
	c.j	 .Lbranch_8000aa84

.Lbranch_8000aa7c:
	lui	a3,0x8001b
	addi	a3,a3,884	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.35

.Lbranch_8000aa84:
	c.mv	a0,s10
	c.mv	a1,s5
	lw	a2,-644(s0)
	auipc	ra,0x6
	jalr	ra,452(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_8000aa94:
	lui	a0,0x8001c
	addi	a0,a0,-1804	# anon.3973a9c3f4224926bbecf4cad58bd903.0.llvm.1830756879319262441
	lui	a3,0x8001c
	addi	a3,a3,-1520	# anon.3973a9c3f4224926bbecf4cad58bd903.2.llvm.1830756879319262441
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x7
	jalr	ra,-1602(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000aab2:
	lui	a3,0x8001b
	addi	a3,a3,1008	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.45
	addi	a2,zero,512
	c.li	a0,0
	c.mv	a1,s8
	auipc	ra,0x6
	jalr	ra,398(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_8000aaca:
	c.li	a3,1
	c.li	a4,1
	c.mv	a0,s10
	c.li	a1,0
	c.mv	a2,s1
	auipc	ra,0xffffb
	jalr	ra,604(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE
	c.j	 .Lbranch_8000a496

.Lbranch_8000aade:
	c.li	a3,1
	c.li	a4,1
	c.mv	a0,s10
	c.mv	a1,s5
	c.mv	a2,s7
	auipc	ra,0xffffb
	jalr	ra,584(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE
	lw	s5,8(s10)
	c.j	 .Lbranch_8000a5bc

.Lbranch_8000aaf6:
	lui	a0,0x8001b
	addi	a0,a0,932	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.39
	auipc	ra,0x7
	jalr	ra,-1874(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000ab06:
	lui	a0,0x8001b
	addi	a0,a0,836	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.32
	auipc	ra,0x7
	jalr	ra,-1794(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_8000ab16:
	lui	a0,0x8001b
	addi	a0,a0,852	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.33
	auipc	ra,0x7
	jalr	ra,-1906(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000ab26:
	lui	a0,0x8001b
	addi	a0,a0,900	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.37
	auipc	ra,0x7
	jalr	ra,-1922(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000ab36:
	lui	a0,0x8001b
	addi	a0,a0,992	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.43
	auipc	ra,0x7
	jalr	ra,-1938(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000ab46:
	lui	a0,0x8001b
	addi	a0,a0,976	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.42
	auipc	ra,0x7
	jalr	ra,-1922(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000ab56:
	lui	a0,0x8001b
	addi	a0,a0,976	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.42
	auipc	ra,0x7
	jalr	ra,-1874(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_8000ab66:
	lui	a0,0x8001b
	addi	a0,a0,868	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.34
	auipc	ra,0x7
	jalr	ra,-1986(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000ab76:
	lui	a0,0x8001b
	addi	a0,a0,820	# .Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.30
	auipc	ra,0x7
	jalr	ra,-1970(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os3mbr3Mbr20read_partition_table17hd15281352b8e6865E
_ZN11homebrew_os3mbr3Mbr20read_partition_table17hd15281352b8e6865E:
	addi	sp,sp,-544
	sw	ra,540(sp)
	sw	s0,536(sp)
	sw	s1,532(sp)
	sw	s2,528(sp)
	sw	s3,524(sp)
	sw	s4,520(sp)
	sw	s5,516(sp)
	sw	s6,512(sp)
	c.addi4spn	s0,sp,544
	c.mv	s2,a1
	c.mv	s1,a0
	c.lui	a0,0x2
	addi	a0,a0,1808	# .Lline_table_start0+0x2710
	lui	a1,0x80014

.Lbranch_8000abbc:
	lw	zero,84(a1)	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0xc
	c.addi	a0,-1
	c.bnez	a0, .Lbranch_8000abbc
	addi	a0,s0,-544
	addi	a2,zero,512
	c.li	a1,0
	auipc	ra,0xffffb
	jalr	ra,1418(ra)	# memset
	addi	a2,s0,-544
	addi	a3,zero,512
	c.mv	a0,s2
	c.li	a1,0
	auipc	ra,0x1
	jalr	ra,582(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	lbu	a0,-34(s0)
	addi	a1,zero,85
	bne	a0,a1, .Lbranch_8000ad24
	lbu	a0,-33(s0)
	addi	a1,zero,170
	bne	a0,a1, .Lbranch_8000ad24
	lbu	t3,-94(s0)
	beq	t3,zero, .Lbranch_8000ad38
	lbu	a0,-89(s0)
	lbu	a1,-90(s0)
	lbu	a2,-88(s0)
	lbu	a3,-87(s0)
	c.slli	a0,0x8
	or	a6,a0,a1
	lbu	a1,-86(s0)
	lbu	a4,-85(s0)
	lbu	a5,-84(s0)
	lbu	a0,-83(s0)
	c.slli	a3,0x18
	c.slli	a2,0x10
	c.or	a2,a3
	c.slli	a4,0x8
	c.or	a1,a4
	c.slli	a0,0x18
	c.slli	a5,0x10
	c.or	a0,a5
	or	a7,a6,a2
	or	a6,a1,a0
	c.li	t0,1
	lbu	s2,-78(s0)
	beq	s2,zero, .Lbranch_8000ad42

.Lbranch_8000ac52:
	lbu	a0,-73(s0)
	lbu	a1,-74(s0)
	lbu	a2,-72(s0)
	lbu	a3,-71(s0)
	c.slli	a0,0x8
	or	t1,a0,a1
	lbu	a1,-70(s0)
	lbu	a4,-69(s0)
	lbu	a5,-68(s0)
	lbu	a0,-67(s0)
	c.slli	a3,0x18
	c.slli	a2,0x10
	c.or	a2,a3
	c.slli	a4,0x8
	c.or	a1,a4
	c.slli	a0,0x18
	c.slli	a5,0x10
	c.or	a0,a5
	or	t2,t1,a2
	or	t1,a1,a0
	c.li	t4,1
	lbu	s3,-62(s0)
	beq	s3,zero, .Lbranch_8000ad4c

.Lbranch_8000ac9a:
	lbu	a0,-57(s0)
	lbu	a1,-58(s0)
	lbu	a3,-56(s0)
	lbu	a4,-55(s0)
	c.slli	a0,0x8
	or	t5,a0,a1
	lbu	a1,-54(s0)
	lbu	a5,-53(s0)
	lbu	a2,-52(s0)
	lbu	a0,-51(s0)
	c.slli	a4,0x18
	c.slli	a3,0x10
	c.or	a3,a4
	c.slli	a5,0x8
	c.or	a1,a5
	c.slli	a0,0x18
	c.slli	a2,0x10
	c.or	a0,a2
	or	t6,t5,a3
	or	t5,a1,a0
	c.li	s4,1
	lbu	a1,-46(s0)
	c.beqz	a1, .Lbranch_8000ad54

.Lbranch_8000ace0:
	lbu	a0,-41(s0)
	lbu	a2,-42(s0)
	lbu	s6,-40(s0)
	lbu	a5,-39(s0)
	c.slli	a0,0x8
	or	s5,a0,a2
	lbu	a2,-38(s0)
	lbu	a3,-37(s0)
	lbu	a0,-36(s0)
	lbu	a4,-35(s0)
	c.slli	a5,0x18
	c.slli	s6,0x10
	or	a5,s6,a5
	c.slli	a3,0x8
	c.or	a2,a3
	c.slli	a4,0x18
	c.slli	a0,0x10
	c.or	a0,a4
	or	a4,s5,a5
	or	a5,a2,a0
	c.li	a0,1
	c.j	 .Lbranch_8000ad56

.Lbranch_8000ad24:
	lui	a0,0x8001c
	addi	a0,a0,-1828	# .Lanon.4f3670b34252f595ba15bc6ea6b03f16.2
	c.li	a1,21
	c.li	a2,2
	c.sw	a2,0(s1)
	c.sw	a0,4(s1)
	c.sw	a1,8(s1)
	c.j	 .Lbranch_8000ad90

.Lbranch_8000ad38:
	c.li	t0,0
	lbu	s2,-78(s0)
	bne	s2,zero, .Lbranch_8000ac52

.Lbranch_8000ad42:
	c.li	t4,0
	lbu	s3,-62(s0)
	bne	s3,zero, .Lbranch_8000ac9a

.Lbranch_8000ad4c:
	c.li	s4,0
	lbu	a1,-46(s0)
	c.bnez	a1, .Lbranch_8000ace0

.Lbranch_8000ad54:
	c.li	a0,0

.Lbranch_8000ad56:
	sw	t0,0(s1)	# _start
	sw	a7,4(s1)
	sw	a6,8(s1)
	sb	t3,12(s1)
	sw	t4,16(s1)
	sw	t2,20(s1)
	sw	t1,24(s1)
	sb	s2,28(s1)
	sw	s4,32(s1)
	sw	t6,36(s1)
	sw	t5,40(s1)
	sb	s3,44(s1)
	c.sw	a0,48(s1)
	c.sw	a4,52(s1)
	c.sw	a5,56(s1)
	sb	a1,60(s1)

.Lbranch_8000ad90:
	lw	ra,540(sp)
	lw	s0,536(sp)
	lw	s1,532(sp)
	lw	s2,528(sp)
	lw	s3,524(sp)
	lw	s4,520(sp)
	lw	s5,516(sp)
	lw	s6,512(sp)
	addi	sp,sp,544
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN4core3ptr54drop_in_place$LT$homebrew_os..fat32..FatFilesystem$GT$17h59521002a70f1b69E
_ZN4core3ptr54drop_in_place$LT$homebrew_os..fat32..FatFilesystem$GT$17h59521002a70f1b69E:
	c.addi16sp	sp,-80
	c.swsp	ra,76(sp)
	c.swsp	s0,72(sp)
	c.swsp	s1,68(sp)
	c.swsp	s2,64(sp)
	c.swsp	s3,60(sp)
	c.swsp	s4,56(sp)
	c.swsp	s5,52(sp)
	c.addi4spn	s0,sp,80
	c.lw	a1,36(a0)
	c.beqz	a1, .Lbranch_8000adee
	c.lw	a2,40(a0)
	c.lw	a0,44(a0)
	sw	zero,-72(s0)
	sw	a1,-68(s0)
	sw	a2,-64(s0)
	sw	zero,-56(s0)
	sw	a1,-52(s0)
	sw	a2,-48(s0)
	c.li	a1,1
	c.j	 .Lbranch_8000adf0

.Lbranch_8000adee:
	c.li	a0,0

.Lbranch_8000adf0:
	sw	a1,-76(s0)
	sw	a1,-60(s0)
	sw	a0,-44(s0)
	addi	a0,s0,-40
	addi	a1,s0,-76
	auipc	ra,0x1
	jalr	ra,-460(ra)	# _ZN5alloc11collections5btree3map25IntoIter$LT$K$C$V$C$A$GT$10dying_next17hdab7307a046f4c93E
	lw	s4,-40(s0)
	beq	s4,zero, .Lbranch_8000ae9e
	c.li	s2,11
	lui	s3,0x80000
	c.j	 .Lbranch_8000ae46

.Lbranch_8000ae1c:
	addi	a0,s4,136
	c.li	a1,4
	addi	a2,zero,36
	auipc	ra,0xffffb
	jalr	ra,-834(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,s0,-40
	addi	a1,s0,-76
	auipc	ra,0x1
	jalr	ra,-510(ra)	# _ZN5alloc11collections5btree3map25IntoIter$LT$K$C$V$C$A$GT$10dying_next17hdab7307a046f4c93E
	lw	s4,-40(s0)
	beq	s4,zero, .Lbranch_8000ae9e

.Lbranch_8000ae46:
	lw	a0,-32(s0)
	bgeu	a0,s2, .Lbranch_8000aeb0
	slli	a1,a0,0x2
	c.slli	a0,0x4
	c.sub	a0,a1
	c.add	s4,a0
	addi	a0,s4,4
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffb
	jalr	ra,-892(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	a0,144(s4)
	c.beqz	a0, .Lbranch_8000ae1c
	lw	s1,140(s4)
	slli	a1,a0,0x2
	c.slli	a0,0x5
	c.add	a0,a1
	add	s5,s1,a0
	c.j	 .Lbranch_8000ae88

.Lbranch_8000ae80:
	addi	s1,s1,36
	beq	s1,s5, .Lbranch_8000ae1c

.Lbranch_8000ae88:
	c.lw	a0,0(s1)
	beq	a0,s3, .Lbranch_8000ae80
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s1
	auipc	ra,0xffffb
	jalr	ra,-944(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_8000ae80

.Lbranch_8000ae9e:
	c.lwsp	ra,76(sp)
	c.lwsp	s0,72(sp)
	c.lwsp	s1,68(sp)
	c.lwsp	s2,64(sp)
	c.lwsp	s3,60(sp)
	c.lwsp	s4,56(sp)
	c.lwsp	s5,52(sp)
	c.addi16sp	sp,80
	c.jr	ra

.Lbranch_8000aeb0:
	lui	a0,0x8001c
	addi	a0,a0,-1488	# anon.cfdb8b1a0b058270945129b2a202d033.2.llvm.9043321807689535220
	lui	a3,0x8001c
	addi	a3,a3,-1504	# anon.cfdb8b1a0b058270945129b2a202d033.1.llvm.9043321807689535220
	addi	a1,zero,437
	c.li	a2,0
	auipc	ra,0x6
	jalr	ra,1442(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _ZN4core3ptr77drop_in_place$LT$alloc..vec..Vec$LT$homebrew_os..filesystem..DirEntry$GT$$GT$17h606c86b2d1bb6f2bE
_ZN4core3ptr77drop_in_place$LT$alloc..vec..Vec$LT$homebrew_os..filesystem..DirEntry$GT$$GT$17h606c86b2d1bb6f2bE:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.addi4spn	s0,sp,32
	c.mv	s2,a0
	c.lw	a0,8(a0)
	c.beqz	a0, .Lbranch_8000af1a
	lw	s1,4(s2)	# .Lpcrel_hi0
	slli	a1,a0,0x2
	c.slli	a0,0x5
	c.add	a0,a1
	add	s3,s1,a0
	lui	s4,0x80000
	c.j	 .Lbranch_8000af04

.Lbranch_8000aefc:
	addi	s1,s1,36
	beq	s1,s3, .Lbranch_8000af1a

.Lbranch_8000af04:
	c.lw	a0,0(s1)
	beq	a0,s4, .Lbranch_8000aefc
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s1
	auipc	ra,0xffffb
	jalr	ra,-1068(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_8000aefc

.Lbranch_8000af1a:
	c.li	a1,4
	addi	a2,zero,36
	c.mv	a0,s2
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	auipc	t1,0xffffb
	jalr	zero,-1100(t1)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

	.globl _ZN5alloc3str75_$LT$impl$u20$alloc..slice..Join$LT$$RF$str$GT$$u20$for$u20$$u5b$S$u5d$$GT$4join17hd60a5951b4d2869dE
_ZN5alloc3str75_$LT$impl$u20$alloc..slice..Join$LT$$RF$str$GT$$u20$for$u20$$u5b$S$u5d$$GT$4join17hd60a5951b4d2869dE:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.addi4spn	s0,sp,64
	c.mv	s2,a0
	c.beqz	a2, .Lbranch_8000afb6
	c.mv	s5,a4
	c.mv	s3,a3
	slli	a0,a2,0x3
	addi	a3,a0,-8
	c.srli	a3,0x3
	mulhu	a4,a4,a3
	c.bnez	a4, .Lbranch_8000af88
	add	s8,a1,a0
	addi	s9,a1,8
	mul	s1,s5,a3
	c.mv	a3,a1

.Lbranch_8000af7a:
	c.beqz	a0, .Lbranch_8000afa4
	c.lw	a4,4(a3)
	c.addi	a3,8
	c.add	s1,a4
	c.addi	a0,-8
	bgeu	s1,a4, .Lbranch_8000af7a

.Lbranch_8000af88:
	lui	a0,0x8001c
	addi	a0,a0,-452	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.5
	lui	a2,0x8001c
	addi	a2,a2,-316	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.14
	addi	a1,zero,53
	auipc	ra,0x6
	jalr	ra,-452(ra)	# _ZN4core6option13expect_failed17hafcd263d76ffbe5eE

.Lbranch_8000afa4:
	bge	s1,zero, .Lbranch_8000afbe
	c.li	s4,0

.Lbranch_8000afaa:
	c.mv	a0,s4
	c.mv	a1,s1
	auipc	ra,0x4
	jalr	ra,-262(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_8000afb6:
	c.li	a0,0
	c.li	a1,0
	c.li	a2,1
	c.j	 .Lbranch_8000b2c4

.Lbranch_8000afbe:
	c.mv	s6,a2
	c.beqz	s1, .Lbranch_8000afe8
	c.mv	s7,a1
	auipc	ra,0xffff8
	jalr	ra,1356(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,1
	c.li	s4,1
	c.mv	a2,s1
	auipc	ra,0xffffb
	jalr	ra,54(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	c.beqz	a0, .Lbranch_8000afaa
	c.mv	a1,s7
	c.j	 .Lbranch_8000afea

.Lbranch_8000afe8:
	c.li	a0,1

.Lbranch_8000afea:
	c.lw	a3,0(a1)
	c.lw	a2,4(a1)
	sw	s1,-60(s0)
	sw	a0,-56(s0)
	sw	zero,-52(s0)
	c.add	a2,a3
	addi	a0,s0,-60
	c.mv	a1,a3
	auipc	ra,0xffffc
	jalr	ra,130(ra)	# _ZN132_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$alloc..vec..spec_extend..SpecExtend$LT$$RF$T$C$core..slice..iter..Iter$LT$T$GT$$GT$$GT$11spec_extend17h0a24df4b2be1c256E
	lw	a0,-60(s0)
	lw	s4,-52(s0)
	sub	a0,a0,s4
	blt	a0,zero, .Lbranch_8000b360
	sub	s10,s1,s4
	bltu	a0,s10, .Lbranch_8000b342
	lw	a0,-56(s0)
	c.li	a1,4
	c.add	s4,a0
	bltu	a1,s5, .Lbranch_8000b246
	c.slli	s5,0x2
	lui	a0,0x8001c
	addi	a0,a0,-1268	# .LJTI0_0
	c.add	a0,s5
	c.lw	a0,0(a0)
	c.jr	a0
	c.li	a0,1
	beq	s6,a0, .Lbranch_8000b2b4

.Lbranch_8000b044:
	lw	a2,4(s9)
	blt	a2,zero, .Lbranch_8000b324
	bltu	s10,a2, .Lbranch_8000b2ec
	lw	a1,0(s9)
	bltu	s4,a1, .Lbranch_8000b05e
	sub	a0,s4,a1
	c.j	 .Lbranch_8000b062

.Lbranch_8000b05e:
	sub	a0,a1,s4

.Lbranch_8000b062:
	bltu	a0,a2, .Lbranch_8000b306
	sub	s10,s10,a2
	add	s3,s4,a2
	c.mv	a0,s4
	auipc	ra,0xffffb
	jalr	ra,112(ra)	# memcpy
	c.addi	s9,8
	c.mv	s4,s3
	bne	s9,s8, .Lbranch_8000b044
	c.j	 .Lbranch_8000b2b4
	c.li	a0,1
	beq	s6,a0, .Lbranch_8000b2b4
	c.li	s5,3

.Lbranch_8000b08a:
	lw	a2,4(s9)
	blt	a2,zero, .Lbranch_8000b324
	bgeu	s5,s10, .Lbranch_8000b2ec
	bltu	s4,s3, .Lbranch_8000b0a0
	sub	a0,s4,s3
	c.j	 .Lbranch_8000b0a4

.Lbranch_8000b0a0:
	sub	a0,s3,s4

.Lbranch_8000b0a4:
	bgeu	s5,a0, .Lbranch_8000b306
	lw	a1,0(s9)
	c.addi	s10,-4
	lbu	a0,0(s3)	# _start
	lbu	a3,1(s3)
	lbu	a4,2(s3)
	lbu	a5,3(s3)
	sb	a0,0(s4)	# _start
	sb	a3,1(s4)
	sb	a4,2(s4)
	sb	a5,3(s4)
	bltu	s10,a2, .Lbranch_8000b2ec
	addi	a0,s4,4
	bltu	a0,a1, .Lbranch_8000b0e0
	sub	a3,a0,a1
	c.j	 .Lbranch_8000b0e4

.Lbranch_8000b0e0:
	sub	a3,a1,a0

.Lbranch_8000b0e4:
	bltu	a3,a2, .Lbranch_8000b306
	sub	s10,s10,a2
	add	s4,a0,a2
	auipc	ra,0xffffb
	jalr	ra,-16(ra)	# memcpy
	c.addi	s9,8
	bne	s9,s8, .Lbranch_8000b08a
	c.j	 .Lbranch_8000b2b4
	c.li	s5,1
	beq	s6,s5, .Lbranch_8000b2b4

.Lbranch_8000b106:
	lw	a2,4(s9)
	blt	a2,zero, .Lbranch_8000b324
	bgeu	s5,s10, .Lbranch_8000b2ec
	bltu	s4,s3, .Lbranch_8000b11c
	sub	a0,s4,s3
	c.j	 .Lbranch_8000b120

.Lbranch_8000b11c:
	sub	a0,s3,s4

.Lbranch_8000b120:
	bgeu	s5,a0, .Lbranch_8000b306
	lbu	a0,0(s3)
	lbu	a3,1(s3)
	lw	a1,0(s9)
	c.addi	s10,-2
	sb	a0,0(s4)
	sb	a3,1(s4)
	bltu	s10,a2, .Lbranch_8000b2ec
	addi	a0,s4,2
	bltu	a0,a1, .Lbranch_8000b14c
	sub	a3,a0,a1
	c.j	 .Lbranch_8000b150

.Lbranch_8000b14c:
	sub	a3,a1,a0

.Lbranch_8000b150:
	bltu	a3,a2, .Lbranch_8000b306
	sub	s10,s10,a2
	add	s4,a0,a2
	auipc	ra,0xffffb
	jalr	ra,-124(ra)	# memcpy
	c.addi	s9,8
	bne	s9,s8, .Lbranch_8000b106
	c.j	 .Lbranch_8000b2b4
	c.li	a0,1
	beq	s6,a0, .Lbranch_8000b2b4
	c.li	s5,2

.Lbranch_8000b174:
	lw	a2,4(s9)
	blt	a2,zero, .Lbranch_8000b324
	bgeu	s5,s10, .Lbranch_8000b2ec
	bltu	s4,s3, .Lbranch_8000b18a
	sub	a0,s4,s3
	c.j	 .Lbranch_8000b18e

.Lbranch_8000b18a:
	sub	a0,s3,s4

.Lbranch_8000b18e:
	bgeu	s5,a0, .Lbranch_8000b306
	lbu	a0,2(s3)
	sb	a0,2(s4)
	lbu	a0,1(s3)
	sb	a0,1(s4)
	lbu	a0,0(s3)
	lw	a1,0(s9)
	c.addi	s10,-3
	sb	a0,0(s4)
	bltu	s10,a2, .Lbranch_8000b2ec
	addi	a0,s4,3
	bltu	a0,a1, .Lbranch_8000b1c2
	sub	a3,a0,a1
	c.j	 .Lbranch_8000b1c6

.Lbranch_8000b1c2:
	sub	a3,a1,a0

.Lbranch_8000b1c6:
	bltu	a3,a2, .Lbranch_8000b306
	sub	s10,s10,a2
	add	s4,a0,a2
	auipc	ra,0xffffb
	jalr	ra,-242(ra)	# memcpy
	c.addi	s9,8
	bne	s9,s8, .Lbranch_8000b174
	c.j	 .Lbranch_8000b2b4
	c.li	a0,1
	beq	s6,a0, .Lbranch_8000b2b4

.Lbranch_8000b1e8:
	lw	a2,4(s9)
	blt	a2,zero, .Lbranch_8000b324
	beq	s10,zero, .Lbranch_8000b2ec
	bltu	s4,s3, .Lbranch_8000b1fe
	sub	a0,s4,s3
	c.j	 .Lbranch_8000b202

.Lbranch_8000b1fe:
	sub	a0,s3,s4

.Lbranch_8000b202:
	beq	a0,zero, .Lbranch_8000b306
	lbu	a0,0(s3)
	lw	a1,0(s9)
	c.addi	s10,-1
	sb	a0,0(s4)
	bltu	s10,a2, .Lbranch_8000b2ec
	addi	a0,s4,1
	bltu	a0,a1, .Lbranch_8000b226
	sub	a3,a0,a1
	c.j	 .Lbranch_8000b22a

.Lbranch_8000b226:
	sub	a3,a1,a0

.Lbranch_8000b22a:
	bltu	a3,a2, .Lbranch_8000b306
	sub	s10,s10,a2
	add	s4,a0,a2
	auipc	ra,0xffffb
	jalr	ra,-342(ra)	# memcpy
	c.addi	s9,8
	bne	s9,s8, .Lbranch_8000b1e8
	c.j	 .Lbranch_8000b2b4

.Lbranch_8000b246:
	c.li	a0,1
	beq	s6,a0, .Lbranch_8000b2b4

.Lbranch_8000b24c:
	lw	s6,4(s9)
	blt	s6,zero, .Lbranch_8000b324
	bltu	s10,s5, .Lbranch_8000b2ec
	bltu	s4,s3, .Lbranch_8000b262
	sub	a0,s4,s3
	c.j	 .Lbranch_8000b266

.Lbranch_8000b262:
	sub	a0,s3,s4

.Lbranch_8000b266:
	bltu	a0,s5, .Lbranch_8000b306
	lw	s7,0(s9)
	sub	s10,s10,s5
	c.mv	a0,s4
	c.mv	a1,s3
	c.mv	a2,s5
	auipc	ra,0xffffb
	jalr	ra,-408(ra)	# memcpy
	bltu	s10,s6, .Lbranch_8000b2ec
	add	a0,s4,s5
	bltu	a0,s7, .Lbranch_8000b292
	sub	a1,a0,s7
	c.j	 .Lbranch_8000b296

.Lbranch_8000b292:
	sub	a1,s7,a0

.Lbranch_8000b296:
	bltu	a1,s6, .Lbranch_8000b306
	sub	s10,s10,s6
	add	s4,a0,s6
	c.mv	a1,s7
	c.mv	a2,s6
	auipc	ra,0xffffb
	jalr	ra,-454(ra)	# memcpy
	c.addi	s9,8
	bne	s9,s8, .Lbranch_8000b24c

.Lbranch_8000b2b4:
	lw	a1,-60(s0)
	sub	a0,s1,s10
	bltu	a1,a0, .Lbranch_8000b372
	lw	a2,-56(s0)

.Lbranch_8000b2c4:
	sw	a1,0(s2)
	sw	a2,4(s2)
	sw	a0,8(s2)
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_8000b2ec:
	lui	a0,0x8001c
	addi	a0,a0,-1028	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.2
	lui	a2,0x8001c
	addi	a2,a2,-348	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.12
	c.li	a1,19
	auipc	ra,0x6
	jalr	ra,430(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE

.Lbranch_8000b306:
	lui	a0,0x8001c
	addi	a0,a0,-1804	# anon.3973a9c3f4224926bbecf4cad58bd903.0.llvm.1830756879319262441
	lui	a3,0x8001c
	addi	a3,a3,-1520	# anon.3973a9c3f4224926bbecf4cad58bd903.2.llvm.1830756879319262441

.Lbranch_8000b316:
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x6
	jalr	ra,332(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000b324:
	lui	a0,0x8001c
	addi	a0,a0,-1016	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.3
	lui	a3,0x8001c
	addi	a3,a3,-364	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.11
	addi	a1,zero,559
	c.li	a2,0
	auipc	ra,0x6
	jalr	ra,302(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000b342:
	lui	a0,0x8001c
	addi	a0,a0,-1248	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.0
	lui	a3,0x8001c
	addi	a3,a3,-380	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.9
	addi	a1,zero,437
	c.li	a2,0
	auipc	ra,0x6
	jalr	ra,272(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000b360:
	lui	a0,0x8001c
	addi	a0,a0,-736	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.4
	lui	a3,0x8001c
	addi	a3,a3,-396	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.7
	c.j	 .Lbranch_8000b316

.Lbranch_8000b372:
	lui	a0,0x8001c
	addi	a0,a0,-300	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.15
	lui	a3,0x8001c
	addi	a3,a3,-332	# .Lanon.61d1525b0debcfcfb8d1349f0b42844e.13
	addi	a1,zero,397
	c.li	a2,0
	auipc	ra,0x6
	jalr	ra,224(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h362a8b237e242609E
_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h362a8b237e242609E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a2,0(a0)
	c.lw	a0,0(a2)
	c.lw	a2,4(a2)
	c.mv	a3,a1
	c.mv	a1,a2
	c.mv	a2,a3
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	auipc	t1,0x4
	jalr	zero,118(t1)	# _ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h1caa923a37cafdf4E
	# ... (zero-filled gap)

	.globl _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h7e91003129bfa5a6E
_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h7e91003129bfa5a6E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a2,0(a0)
	c.lw	a3,4(a0)
	c.mv	a4,a1
	c.mv	a0,a2
	c.mv	a1,a3
	c.mv	a2,a4
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	auipc	t1,0x4
	jalr	zero,82(t1)	# _ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h1caa923a37cafdf4E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os11framebuffer17draw_mouse_cursor17hd217d6df565dbfcdE
_ZN11homebrew_os11framebuffer17draw_mouse_cursor17hd217d6df565dbfcdE:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.addi4spn	s0,sp,64
	c.mv	s2,a5
	c.mv	s1,a4
	c.mv	s6,a3
	c.mv	s3,a2
	c.mv	s4,a1
	c.mv	s5,a0
	addi	a6,zero,1024
	addi	a7,zero,1536
	addi	t0,zero,1792
	addi	t2,zero,1920
	addi	t1,zero,1984
	addi	a5,zero,2016
	addi	t3,zero,2032
	addi	a1,zero,2040
	addi	a2,zero,2044
	addi	a4,zero,2046
	addi	a3,zero,1632
	sh	a6,-64(s0)
	sh	a7,-62(s0)
	sh	t0,-60(s0)
	sh	t2,-58(s0)
	addi	a0,zero,1072
	sh	t1,-56(s0)
	sh	a5,-54(s0)
	sh	t3,-52(s0)
	sh	a1,-50(s0)
	addi	a1,zero,48
	sh	a2,-48(s0)
	sh	a4,-46(s0)
	sh	a5,-44(s0)
	sh	a3,-42(s0)
	c.li	a2,24
	sh	a0,-40(s0)
	sh	a1,-38(s0)
	sh	a2,-36(s0)
	sh	a2,-34(s0)
	c.mv	a0,s5
	c.mv	a1,s4
	c.mv	a2,s3
	c.mv	a3,s6
	auipc	ra,0x0
	jalr	ra,1110(ra)	# _ZN11homebrew_os11framebuffer25restore_cursor_background17h06c56458e108bdb4E
	c.li	a0,0
	c.li	t0,0
	lui	a6,0x80027
	addi	a6,a6,1072	# .L_MergedGlobals.1
	addi	t1,zero,176
	c.li	t2,11
	c.li	a7,16
	beq	s6,zero, .Lbranch_8000b534
	c.j	 .Lbranch_8000b49c

.Lbranch_8000b498:
	beq	t0,a7, .Lbranch_8000b5c4

.Lbranch_8000b49c:
	add	a1,s2,t0
	slt	a2,a1,s2
	slti	a3,t0,0
	bne	a3,a2, .Lbranch_8000b88a
	c.li	a5,0
	c.addi	t0,1
	slti	a2,a1,0
	slt	a3,a1,s3
	mul	t3,a1,s4
	mulhu	a4,a1,s4
	xori	a1,a2,-1
	and	t5,a1,a3
	slli	a2,a0,0x2
	sltu	t4,zero,a4
	c.add	a2,a6
	addi	a4,a2,4
	c.j	 .Lbranch_8000b4e4

.Lbranch_8000b4d8:
	c.sw	a2,0(a4)

.Lbranch_8000b4da:
	c.addi	a5,1
	c.addi	a0,1
	c.addi	a4,4
	beq	a5,t2, .Lbranch_8000b498

.Lbranch_8000b4e4:
	add	a2,s1,a5
	slt	a3,a2,s1
	slti	a1,a5,0
	bne	a1,a3, .Lbranch_8000b78a
	blt	a2,zero, .Lbranch_8000b526
	slt	a1,a2,s4
	and	a1,t5,a1
	c.beqz	a1, .Lbranch_8000b526
	bne	t4,zero, .Lbranch_8000b7aa
	add	a3,a2,t3
	bltu	a3,a2, .Lbranch_8000b7ba
	slli	a2,a3,0x1
	c.add	a2,s5
	andi	a1,a2,1
	bne	a1,zero, .Lbranch_8000b71a
	lhu	a2,0(a2)
	bltu	a0,t1, .Lbranch_8000b4d8
	c.j	 .Lbranch_8000b802

.Lbranch_8000b526:
	bgeu	a0,t1, .Lbranch_8000b7da
	sw	zero,0(a4)
	c.j	 .Lbranch_8000b4da

.Lbranch_8000b530:
	beq	t0,a7, .Lbranch_8000b5c4

.Lbranch_8000b534:
	add	a1,s2,t0
	slt	a2,a1,s2
	slti	a3,t0,0
	bne	a3,a2, .Lbranch_8000b89a
	c.li	a5,0
	c.addi	t0,1
	slti	a2,a1,0
	slt	a3,a1,s3
	mul	t3,a1,s4
	mulhu	a4,a1,s4
	xori	a1,a2,-1
	and	t5,a1,a3
	slli	a2,a0,0x2
	sltu	t4,zero,a4
	c.add	a2,a6
	addi	a4,a2,4
	c.j	 .Lbranch_8000b57c

.Lbranch_8000b570:
	c.addi	a5,1
	c.sw	a2,0(a4)
	c.addi	a0,1
	c.addi	a4,4
	beq	a5,t2, .Lbranch_8000b530

.Lbranch_8000b57c:
	add	a2,s1,a5
	slt	a3,a2,s1
	slti	a1,a5,0
	bne	a1,a3, .Lbranch_8000b77a
	blt	a2,zero, .Lbranch_8000b5bc
	slt	a1,a2,s4
	and	a1,t5,a1
	c.beqz	a1, .Lbranch_8000b5bc
	bne	t4,zero, .Lbranch_8000b79a
	add	a3,a2,t3
	bltu	a3,a2, .Lbranch_8000b7ca
	slli	a2,a3,0x2
	c.add	a2,s5
	andi	a1,a2,3
	bne	a1,zero, .Lbranch_8000b72c
	c.lw	a2,0(a2)
	bltu	a0,t1, .Lbranch_8000b570
	c.j	 .Lbranch_8000b816

.Lbranch_8000b5bc:
	bgeu	a0,t1, .Lbranch_8000b7ee
	c.li	a2,0
	c.j	 .Lbranch_8000b570

.Lbranch_8000b5c4:
	lui	a0,0x80021
	lui	a1,0x80027
	sw	s1,1428(a0)	# .L_MergedGlobals
	addi	a0,a0,1428
	sw	s2,4(a0)
	c.li	a0,1
	sb	a0,1072(a1)	# .L_MergedGlobals.1
	c.li	t3,0
	c.li	t2,0
	addi	a6,s0,-64
	beq	s6,zero, .Lbranch_8000b676
	c.li	t1,10
	c.li	t0,-1
	c.li	t5,11
	addi	a7,zero,32
	c.j	 .Lbranch_8000b5fe

.Lbranch_8000b5f6:
	c.addi	t2,2
	c.addi	t3,1	# .Lline_table_start0+0x2001
	beq	t2,a7, .Lbranch_8000b706

.Lbranch_8000b5fe:
	add	a1,s2,t3
	slt	a0,a1,s2
	slti	a2,t3,0
	bne	a2,a0, .Lbranch_8000b8aa
	blt	a1,zero, .Lbranch_8000b5f6
	bge	a1,s3, .Lbranch_8000b5f6
	c.li	a0,0
	add	a2,a6,t2
	lhu	a4,0(a2)
	mul	t4,a1,s4
	mulhu	a1,a1,s4
	sltu	a1,zero,a1
	c.j	 .Lbranch_8000b634

.Lbranch_8000b62e:
	c.addi	a0,1
	beq	a0,t5, .Lbranch_8000b5f6

.Lbranch_8000b634:
	add	a2,s1,a0
	slt	a3,a2,s1
	slti	a5,a0,0
	bne	a5,a3, .Lbranch_8000b83a
	blt	a2,zero, .Lbranch_8000b62e
	bge	a2,s4, .Lbranch_8000b62e
	sub	a3,t1,a0
	srl	a3,a4,a3
	c.andi	a3,1
	c.beqz	a3, .Lbranch_8000b62e
	bne	a1,zero, .Lbranch_8000b86a
	add	a3,a2,t4
	bltu	a3,a2, .Lbranch_8000b84a
	slli	a2,a3,0x1
	c.add	a2,s5
	andi	a3,a2,1
	c.bnez	a3, .Lbranch_8000b74a
	sh	t0,0(a2)
	c.j	 .Lbranch_8000b62e

.Lbranch_8000b676:
	c.li	t0,10
	lui	t1,0x1000
	c.li	t5,11
	c.addi	t1,-1	# .Lline_table_start1+0xfb3eaa
	addi	a7,zero,32
	c.j	 .Lbranch_8000b68e

.Lbranch_8000b686:
	c.addi	t2,2
	c.addi	t3,1
	beq	t2,a7, .Lbranch_8000b706

.Lbranch_8000b68e:
	add	a1,s2,t3
	slt	a0,a1,s2
	slti	a2,t3,0
	bne	a2,a0, .Lbranch_8000b8ba
	blt	a1,zero, .Lbranch_8000b686
	bge	a1,s3, .Lbranch_8000b686
	c.li	a0,0
	add	a2,a6,t2
	lhu	a3,0(a2)
	mul	t4,a1,s4
	mulhu	a1,a1,s4
	sltu	a1,zero,a1
	c.j	 .Lbranch_8000b6c4

.Lbranch_8000b6be:
	c.addi	a0,1
	beq	a0,t5, .Lbranch_8000b686

.Lbranch_8000b6c4:
	add	a2,s1,a0
	slt	a5,a2,s1
	slti	a4,a0,0
	bne	a4,a5, .Lbranch_8000b82a
	blt	a2,zero, .Lbranch_8000b6be
	bge	a2,s4, .Lbranch_8000b6be
	sub	a4,t0,a0
	srl	a4,a3,a4
	c.andi	a4,1
	c.beqz	a4, .Lbranch_8000b6be
	bne	a1,zero, .Lbranch_8000b87a
	add	a5,a2,t4
	bltu	a5,a2, .Lbranch_8000b85a
	slli	a2,a5,0x2
	c.add	a2,s5
	andi	a4,a2,3
	c.bnez	a4, .Lbranch_8000b75c
	sw	t1,0(a2)
	c.j	 .Lbranch_8000b6be

.Lbranch_8000b706:
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_8000b71a:
	lui	a0,0x8001c
	addi	a0,a0,412	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.33
	lui	a3,0x8001c
	addi	a3,a3,188	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.19
	c.j	 .Lbranch_8000b73c

.Lbranch_8000b72c:
	lui	a0,0x8001c
	addi	a0,a0,412	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.33
	lui	a3,0x8001c
	addi	a3,a3,-36	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.5

.Lbranch_8000b73c:
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0x6
	jalr	ra,-730(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000b74a:
	lui	a0,0x8001c
	addi	a0,a0,628	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.34
	lui	a3,0x8001c
	addi	a3,a3,108	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.14
	c.j	 .Lbranch_8000b76c

.Lbranch_8000b75c:
	lui	a0,0x8001c
	addi	a0,a0,628	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.34
	lui	a3,0x8001c
	addi	a3,a3,44	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.10

.Lbranch_8000b76c:
	addi	a1,zero,431
	c.li	a2,0
	auipc	ra,0x6
	jalr	ra,-778(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000b77a:
	lui	a0,0x8001c
	addi	a0,a0,-84	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.2
	auipc	ra,0x6
	jalr	ra,-982(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b78a:
	lui	a0,0x8001c
	addi	a0,a0,140	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.16
	auipc	ra,0x6
	jalr	ra,-998(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b79a:
	lui	a0,0x8001c
	addi	a0,a0,-52	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.4
	auipc	ra,0x6
	jalr	ra,-982(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000b7aa:
	lui	a0,0x8001c
	addi	a0,a0,172	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.18
	auipc	ra,0x6
	jalr	ra,-998(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000b7ba:
	lui	a0,0x8001c
	addi	a0,a0,172	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.18
	auipc	ra,0x6
	jalr	ra,-1046(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b7ca:
	lui	a0,0x8001c
	addi	a0,a0,-52	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.4
	auipc	ra,0x6
	jalr	ra,-1062(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b7da:
	lui	a2,0x8001c
	addi	a2,a2,156	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.17
	addi	a1,zero,176
	auipc	ra,0x6
	jalr	ra,-954(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000b7ee:
	lui	a2,0x8001c
	addi	a2,a2,-68	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.3
	addi	a1,zero,176
	auipc	ra,0x6
	jalr	ra,-974(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000b802:
	lui	a2,0x8001c
	addi	a2,a2,204	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.20
	addi	a1,zero,176
	auipc	ra,0x6
	jalr	ra,-994(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000b816:
	lui	a2,0x8001c
	addi	a2,a2,-20	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.6
	addi	a1,zero,176
	auipc	ra,0x6
	jalr	ra,-1014(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000b82a:
	lui	a0,0x8001c
	addi	a0,a0,12	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.8
	auipc	ra,0x6
	jalr	ra,-1158(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b83a:
	lui	a0,0x8001c
	addi	a0,a0,76	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.12
	auipc	ra,0x6
	jalr	ra,-1174(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b84a:
	lui	a0,0x8001c
	addi	a0,a0,92	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.13
	auipc	ra,0x6
	jalr	ra,-1190(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b85a:
	lui	a0,0x8001c
	addi	a0,a0,28	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.9
	auipc	ra,0x6
	jalr	ra,-1206(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b86a:
	lui	a0,0x8001c
	addi	a0,a0,92	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.13
	auipc	ra,0x6
	jalr	ra,-1190(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000b87a:
	lui	a0,0x8001c
	addi	a0,a0,28	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.9
	auipc	ra,0x6
	jalr	ra,-1206(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000b88a:
	lui	a0,0x8001c
	addi	a0,a0,124	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.15
	auipc	ra,0x6
	jalr	ra,-1254(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b89a:
	lui	a0,0x8001c
	addi	a0,a0,-100	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.1
	auipc	ra,0x6
	jalr	ra,-1270(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b8aa:
	lui	a0,0x8001c
	addi	a0,a0,60	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.11
	auipc	ra,0x6
	jalr	ra,-1286(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000b8ba:
	lui	a0,0x8001c
	addi	a0,a0,-4	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.7
	auipc	ra,0x6
	jalr	ra,-1302(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os11framebuffer25restore_cursor_background17h06c56458e108bdb4E
_ZN11homebrew_os11framebuffer25restore_cursor_background17h06c56458e108bdb4E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.addi4spn	s0,sp,32
	lui	a4,0x80027
	lbu	a4,1072(a4)	# .L_MergedGlobals.1
	beq	a4,zero, .Lbranch_8000ba18
	lui	a4,0x80021
	addi	a5,a4,1428	# .L_MergedGlobals
	lw	a6,4(a5)
	lw	s2,1428(a4)
	c.li	s3,0
	c.li	t4,0
	lui	a7,0x80027
	addi	a7,a7,1072	# .L_MergedGlobals.1
	addi	t0,zero,176
	c.li	t1,11
	c.li	t2,-1
	c.li	t3,16
	c.bnez	a3, .Lbranch_8000b918
	c.j	 .Lbranch_8000b998

.Lbranch_8000b912:
	c.addi	t4,1
	beq	t4,t3, .Lbranch_8000ba10

.Lbranch_8000b918:
	add	a5,a6,t4
	slt	a3,a5,a6
	slti	a4,t4,0
	bne	a4,a3, .Lbranch_8000baf8
	blt	a5,zero, .Lbranch_8000b912
	bge	a5,a2, .Lbranch_8000b912
	c.li	a4,0
	mul	t5,a5,a1
	mulhu	a3,a5,a1
	slli	a5,s3,0x2
	sltu	t6,zero,a3
	c.add	a5,a7
	addi	s1,a5,4
	c.j	 .Lbranch_8000b958

.Lbranch_8000b94a:
	beq	s3,t2, .Lbranch_8000bad8

.Lbranch_8000b94e:
	c.addi	a4,1
	c.addi	s3,1
	c.addi	s1,4
	beq	a4,t1, .Lbranch_8000b912

.Lbranch_8000b958:
	add	a5,s2,a4
	slt	s4,a5,s2
	slti	a3,a4,0
	bne	a3,s4, .Lbranch_8000ba58
	blt	a5,zero, .Lbranch_8000b94a
	bge	a5,a1, .Lbranch_8000b94a
	bne	t6,zero, .Lbranch_8000baa8
	add	a3,a5,t5
	bltu	a3,a5, .Lbranch_8000bab8
	bgeu	s3,t0, .Lbranch_8000ba78
	c.slli	a3,0x1
	c.add	a3,a0
	andi	a5,a3,1
	c.bnez	a5, .Lbranch_8000ba28
	c.lw	a5,0(s1)
	sh	a5,0(a3)
	c.j	 .Lbranch_8000b94e

.Lbranch_8000b992:
	c.addi	t4,1
	beq	t4,t3, .Lbranch_8000ba10

.Lbranch_8000b998:
	add	a4,a6,t4
	slt	a3,a4,a6
	slti	a5,t4,0
	bne	a5,a3, .Lbranch_8000bb08
	blt	a4,zero, .Lbranch_8000b992
	bge	a4,a2, .Lbranch_8000b992
	c.li	a5,0
	mul	t5,a4,a1
	mulhu	a3,a4,a1
	slli	a4,s3,0x2
	sltu	t6,zero,a3
	c.add	a4,a7
	addi	s1,a4,4
	c.j	 .Lbranch_8000b9d8

.Lbranch_8000b9ca:
	beq	s3,t2, .Lbranch_8000bae8

.Lbranch_8000b9ce:
	c.addi	a5,1
	c.addi	s3,1
	c.addi	s1,4
	beq	a5,t1, .Lbranch_8000b992

.Lbranch_8000b9d8:
	add	a4,s2,a5
	slt	s4,a4,s2
	slti	a3,a5,0
	bne	a3,s4, .Lbranch_8000ba68
	blt	a4,zero, .Lbranch_8000b9ca
	bge	a4,a1, .Lbranch_8000b9ca
	bne	t6,zero, .Lbranch_8000bac8
	add	a3,a4,t5
	bltu	a3,a4, .Lbranch_8000ba98
	bgeu	s3,t0, .Lbranch_8000ba82
	c.slli	a3,0x2
	c.add	a3,a0
	andi	a4,a3,3
	c.bnez	a4, .Lbranch_8000ba3a
	c.lw	a4,0(s1)
	c.sw	a4,0(a3)
	c.j	 .Lbranch_8000b9ce

.Lbranch_8000ba10:
	lui	a0,0x80027
	sb	zero,1072(a0)	# .L_MergedGlobals.1

.Lbranch_8000ba18:
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_8000ba28:
	lui	a0,0x8001c
	addi	a0,a0,628	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.34
	lui	a3,0x8001c
	addi	a3,a3,380	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.31
	c.j	 .Lbranch_8000ba4a

.Lbranch_8000ba3a:
	lui	a0,0x8001c
	addi	a0,a0,628	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.34
	lui	a3,0x8001c
	addi	a3,a3,284	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.25

.Lbranch_8000ba4a:
	addi	a1,zero,431
	c.li	a2,0
	auipc	ra,0x6
	jalr	ra,-1512(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000ba58:
	lui	a0,0x8001c
	addi	a0,a0,332	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.28
	auipc	ra,0x6
	jalr	ra,-1716(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000ba68:
	lui	a0,0x8001c
	addi	a0,a0,236	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.22
	auipc	ra,0x6
	jalr	ra,-1732(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000ba78:
	lui	a2,0x8001c
	addi	a2,a2,364	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.30
	c.j	 .Lbranch_8000ba8a

.Lbranch_8000ba82:
	lui	a2,0x8001c
	addi	a2,a2,268	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.24

.Lbranch_8000ba8a:
	addi	a1,zero,176
	c.mv	a0,s3
	auipc	ra,0x6
	jalr	ra,-1636(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000ba98:
	lui	a0,0x8001c
	addi	a0,a0,252	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.23
	auipc	ra,0x6
	jalr	ra,-1780(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000baa8:
	lui	a0,0x8001c
	addi	a0,a0,348	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.29
	auipc	ra,0x6
	jalr	ra,-1764(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000bab8:
	lui	a0,0x8001c
	addi	a0,a0,348	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.29
	auipc	ra,0x6
	jalr	ra,-1812(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000bac8:
	lui	a0,0x8001c
	addi	a0,a0,252	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.23
	auipc	ra,0x6
	jalr	ra,-1796(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000bad8:
	lui	a0,0x8001c
	addi	a0,a0,396	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.32
	auipc	ra,0x6
	jalr	ra,-1844(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000bae8:
	lui	a0,0x8001c
	addi	a0,a0,300	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.26
	auipc	ra,0x6
	jalr	ra,-1860(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000baf8:
	lui	a0,0x8001c
	addi	a0,a0,316	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.27
	auipc	ra,0x6
	jalr	ra,-1876(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000bb08:
	lui	a0,0x8001c
	addi	a0,a0,220	# .Lanon.f2adcb6a556d1730d9a0ec662683373c.21
	auipc	ra,0x6
	jalr	ra,-1892(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN5alloc11collections5btree3map25BTreeMap$LT$K$C$V$C$A$GT$6insert17h1ede48cbef5aa3d1E
_ZN5alloc11collections5btree3map25BTreeMap$LT$K$C$V$C$A$GT$6insert17h1ede48cbef5aa3d1E:
	c.addi16sp	sp,-80
	c.swsp	ra,76(sp)
	c.swsp	s0,72(sp)
	c.swsp	s1,68(sp)
	c.swsp	s2,64(sp)
	c.swsp	s3,60(sp)
	c.swsp	s4,56(sp)
	c.swsp	s5,52(sp)
	c.addi4spn	s0,sp,80
	c.mv	s3,a3
	c.mv	s1,a2
	c.mv	s4,a1
	c.lw	a1,0(a1)
	c.mv	s2,a0
	c.beqz	a1, .Lbranch_8000bb6c
	lw	a2,4(s4)
	addi	a0,s0,-44
	c.mv	a3,s1
	auipc	ra,0x2
	jalr	ra,268(ra)	# _ZN5alloc11collections5btree6search142_$LT$impl$u20$alloc..collections..btree..node..NodeRef$LT$BorrowType$C$K$C$V$C$alloc..collections..btree..node..marker..LeafOrInternal$GT$$GT$11search_tree17h359a09dc1034da99E
	lw	a0,-44(s0)
	c.beqz	a0, .Lbranch_8000bbae
	lw	a0,-40(s0)
	lw	a2,-36(s0)
	lw	a3,-32(s0)
	c.lw	a1,0(s1)
	lw	s5,4(s1)
	c.lw	a4,8(s1)
	lui	s1,0x80000
	bne	a1,s1, .Lbranch_8000bb7e
	c.j	 .Lbranch_8000bbc4

.Lbranch_8000bb6c:
	c.li	a0,0
	c.lw	a1,0(s1)
	lw	s5,4(s1)	# .Lpcrel_hi0
	c.lw	a4,8(s1)
	lui	s1,0x80000
	beq	a1,s1, .Lbranch_8000bbc4

.Lbranch_8000bb7e:
	sw	a1,-72(s0)
	sw	s5,-68(s0)
	sw	a4,-64(s0)
	sw	s4,-60(s0)
	sw	a0,-56(s0)
	sw	a2,-52(s0)
	sw	a3,-48(s0)
	addi	a0,s0,-72
	c.mv	a1,s3
	auipc	ra,0x0
	jalr	ra,356(ra)	# _ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$6insert17he93f6e3fcc0b7edcE
	sw	s1,0(s2)
	c.j	 .Lbranch_8000bc06

.Lbranch_8000bbae:
	lw	s5,-40(s0)
	lw	s4,-32(s0)
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s1
	auipc	ra,0xffffa
	jalr	ra,-216(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_8000bbc4:
	c.li	a0,11
	bgeu	s4,a0, .Lbranch_8000bc18
	slli	a0,s4,0x2
	c.slli	s4,0x4
	sub	a0,s4,a0
	c.add	a0,s5
	lw	a1,136(a0)
	lw	a2,140(a0)
	lw	a3,144(a0)
	lw	a4,0(s3)
	lw	a5,4(s3)
	lw	s1,8(s3)
	sw	a1,0(s2)
	sw	a2,4(s2)
	sw	a3,8(s2)
	sw	a4,136(a0)
	sw	a5,140(a0)
	sw	s1,144(a0)

.Lbranch_8000bc06:
	c.lwsp	ra,76(sp)
	c.lwsp	s0,72(sp)
	c.lwsp	s1,68(sp)
	c.lwsp	s2,64(sp)
	c.lwsp	s3,60(sp)
	c.lwsp	s4,56(sp)
	c.lwsp	s5,52(sp)
	c.addi16sp	sp,80
	c.jr	ra

.Lbranch_8000bc18:
	lui	a0,0x8001d
	addi	a0,a0,-960	# anon.3839376bf29ad69682d1272c1c63f1dd.34.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1376	# anon.3839376bf29ad69682d1272c1c63f1dd.21.llvm.7710812085696039936
	addi	a1,zero,437
	c.li	a2,0
	auipc	ra,0x6
	jalr	ra,-1990(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _ZN5alloc11collections5btree3map25IntoIter$LT$K$C$V$C$A$GT$10dying_next17hdab7307a046f4c93E
_ZN5alloc11collections5btree3map25IntoIter$LT$K$C$V$C$A$GT$10dying_next17hdab7307a046f4c93E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a2,32(a1)
	c.beqz	a2, .Lbranch_8000bc7c
	c.lw	a3,0(a1)
	c.addi	a2,-1
	c.sw	a2,32(a1)
	c.beqz	a3, .Lbranch_8000bcf2
	c.lw	a3,4(a1)
	addi	a2,a1,4
	c.bnez	a3, .Lbranch_8000bc70
	c.lw	a4,12(a1)
	c.lw	a3,8(a1)
	c.beqz	a4, .Lbranch_8000bc62

.Lbranch_8000bc5a:
	lw	a3,272(a3)
	c.addi	a4,-1
	c.bnez	a4, .Lbranch_8000bc5a

.Lbranch_8000bc62:
	c.li	a4,1
	c.sw	a4,0(a1)
	c.sw	a3,4(a1)
	sw	zero,8(a1)
	sw	zero,12(a1)

.Lbranch_8000bc70:
	c.mv	a1,a2
	auipc	ra,0x2
	jalr	ra,502(ra)	# _ZN5alloc11collections5btree8navigate263_$LT$impl$u20$alloc..collections..btree..node..Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Dying$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$$GT$27deallocating_next_unchecked17h75e80832d5b18af3E
	c.j	 .Lbranch_8000bcd2

.Lbranch_8000bc7c:
	c.lw	a5,0(a1)
	c.lw	a2,4(a1)
	c.lw	a4,8(a1)
	c.lw	a3,12(a1)
	c.andi	a5,1
	sw	zero,0(a1)
	c.beqz	a5, .Lbranch_8000bcce
	c.bnez	a2, .Lbranch_8000bc9a
	c.mv	a2,a4
	c.beqz	a3, .Lbranch_8000bc9a

.Lbranch_8000bc92:
	lw	a2,272(a2)
	c.addi	a3,-1
	c.bnez	a3, .Lbranch_8000bc92

.Lbranch_8000bc9a:
	c.lw	a5,0(a2)
	lui	a1,0x80022
	addi	a1,a1,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.beqz	a5, .Lbranch_8000bcda
	c.li	a6,3

.Lbranch_8000bca8:
	bgeu	a6,a2, .Lbranch_8000bce2
	c.mv	a3,a5
	c.lw	a5,8(a1)
	addi	a4,a2,-4
	c.sw	a5,0(a2)
	c.sw	a4,8(a1)
	c.lw	a5,0(a3)
	c.mv	a2,a3
	c.bnez	a5, .Lbranch_8000bca8
	c.li	a2,3
	bgeu	a2,a3, .Lbranch_8000bce2

.Lbranch_8000bcc4:
	c.lw	a2,8(a1)
	addi	a4,a3,-4
	c.sw	a2,0(a3)
	c.sw	a4,8(a1)

.Lbranch_8000bcce:
	sw	zero,0(a0)

.Lbranch_8000bcd2:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_8000bcda:
	c.mv	a3,a2
	c.li	a2,3
	bltu	a2,a3, .Lbranch_8000bcc4

.Lbranch_8000bce2:
	lui	a0,0x80015
	addi	a0,a0,-732	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147
	auipc	ra,0x5
	jalr	ra,1826(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_8000bcf2:
	lui	a0,0x8001c
	addi	a0,a0,844	# anon.471f2b5e420710f931278ee49773962a.1.llvm.880628967740171352
	auipc	ra,0x5
	jalr	ra,278(ra)	# _ZN4core6option13unwrap_failed17hca83384b1d4f0231E
	# ... (zero-filled gap)

	.globl _ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$6insert17he93f6e3fcc0b7edcE
_ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$6insert17he93f6e3fcc0b7edcE:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.addi4spn	s0,sp,64
	c.mv	s1,a0
	c.lw	a0,16(a0)
	c.mv	s2,a1
	c.beqz	a0, .Lbranch_8000bd92
	c.lw	a0,20(s1)
	c.lw	a1,24(s1)
	c.lw	a2,16(s1)
	lw	a6,8(s1)	# .Lpcrel_hi0+0x4
	c.lw	a4,4(s1)
	c.lw	a3,0(s1)
	sw	a2,-44(s0)
	sw	a0,-40(s0)
	sw	a1,-36(s0)
	addi	a5,s1,28
	sw	a3,-32(s0)
	sw	a4,-28(s0)
	sw	a6,-24(s0)
	addi	a4,s1,12
	addi	a0,s0,-56
	addi	a1,s0,-44
	addi	a2,s0,-32
	c.mv	a3,s2
	auipc	ra,0x1
	jalr	ra,1290(ra)	# _ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$16insert_recursing17hf4784a0e85286ff6E
	c.lw	a2,12(s1)
	c.lw	a3,8(a2)
	lw	a1,-48(s0)
	lw	a0,-56(s0)
	c.addi	a3,1
	c.li	a4,11
	c.sw	a3,8(a2)
	bltu	a1,a4, .Lbranch_8000bdfc
	lui	a0,0x8001d
	addi	a0,a0,-960	# anon.3839376bf29ad69682d1272c1c63f1dd.34.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1408	# anon.3839376bf29ad69682d1272c1c63f1dd.19.llvm.7710812085696039936
	addi	a1,zero,437
	c.li	a2,0
	auipc	ra,0x5
	jalr	ra,1758(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000bd92:
	lw	s3,12(s1)
	auipc	ra,0xffff7
	jalr	ra,1914(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,4
	addi	a2,zero,272
	auipc	ra,0xffffa
	jalr	ra,612(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	c.beqz	a0, .Lbranch_8000be18
	c.li	a1,0
	sw	zero,0(a0)
	sw	a0,0(s3)
	sw	zero,4(s3)
	c.li	a2,1
	lw	a6,0(s1)
	c.lw	a4,4(s1)
	c.lw	a5,8(s1)
	sh	a2,270(a0)
	lw	a2,0(s2)
	lw	s1,4(s2)
	lw	a3,8(s2)
	sw	a6,4(a0)
	c.sw	a4,8(a0)
	c.sw	a5,12(a0)
	sw	a2,136(a0)
	sw	s1,140(a0)
	sw	a3,144(a0)
	lw	a2,8(s3)
	c.addi	a2,1
	sw	a2,8(s3)

.Lbranch_8000bdfc:
	slli	a2,a1,0x2
	c.slli	a1,0x4
	c.sub	a1,a2
	c.add	a0,a1
	addi	a0,a0,136
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_8000be18:
	c.li	a0,4
	addi	a1,zero,272
	auipc	ra,0x3
	jalr	ra,114(ra)	# _ZN5alloc5alloc18handle_alloc_error17ha8c62235926f2799E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
_ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.addi4spn	s0,sp,64
	c.mv	s4,a3
	c.mv	s5,a2
	c.mv	s2,a1
	c.mv	s3,a0
	lui	s1,0xf0004
	sw	a1,-60(s0)
	addi	a0,s0,-60
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-44(s0)
	sw	a1,-40(s0)
	lui	a1,0x80012
	addi	a1,a1,1040	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x290
	addi	a0,s0,-56
	addi	a2,s0,-44
	auipc	ra,0x2
	jalr	ra,1622(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-52(s0)
	lw	a1,-48(s0)

.Lbranch_8000be82:
	lw	a2,-2044(s1)	# __heap_end+0x6fd03804
	c.bnez	a2, .Lbranch_8000be82
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_8000be90:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000be90
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_8000be9e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000be9e
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000beac:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000beac
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_8000beba:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000beba
	addi	a2,zero,49
	sw	a2,-2048(s1)

.Lbranch_8000bec8:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000bec8
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_8000bed6:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000bed6
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_8000befc
	c.add	a1,a0

.Lbranch_8000bee8:
	lbu	a2,0(a0)

.Lbranch_8000beec:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_8000beec
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_8000bee8

.Lbranch_8000befc:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000befc
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-56
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffffa
	jalr	ra,-1068(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lbu	a0,10(s3)
	c.beqz	a0, .Lbranch_8000bf32
	addi	a0,zero,512
	bgeu	s4,a0, .Lbranch_8000bf52
	lui	a0,0x80013
	addi	a0,a0,1892	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x50
	c.li	a1,16
	c.j	 .Lbranch_8000bf3c

.Lbranch_8000bf32:
	lui	a0,0x8001c
	addi	a0,a0,860	# .Lanon.6afbde2820a9363c4000257edad1edf7.23
	c.li	a1,23

.Lbranch_8000bf3c:
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_8000bf52:
	addi	a0,zero,512
	c.li	a1,16
	c.li	a2,1
	auipc	ra,0x1
	jalr	ra,-90(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE
	c.andi	a0,1
	c.beqz	a0, .Lbranch_8000bf74
	lui	a0,0x8001c
	addi	a0,a0,956	# .Lanon.6afbde2820a9363c4000257edad1edf7.27
	addi	a1,zero,41
	c.j	 .Lbranch_8000bf3c

.Lbranch_8000bf74:
	lui	s4,0xf0002
	lui	a0,0x10001
	addi	a1,zero,222
	sb	zero,76(s4)	# __heap_end+0x6fd0204c
	addi	a2,a0,512	# .Lline_table_start1+0xffb50ab

.Lbranch_8000bf88:
	sb	a1,0(a0)
	c.addi	a0,1
	bne	a0,a2, .Lbranch_8000bf88
	lui	a0,0x10001
	addi	s6,zero,512
	sw	a0,68(s4)
	c.li	s7,1
	sw	zero,64(s4)
	sb	zero,76(s4)
	sw	s6,72(s4)
	sw	zero,88(s4)
	sb	s7,76(s4)
	addi	a0,zero,512
	c.li	a1,16
	c.li	a2,1
	auipc	ra,0x1
	jalr	ra,-188(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE
	c.andi	a0,1
	c.beqz	a0, .Lbranch_8000c060

.Lbranch_8000bfc8:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000bfc8
	addi	a0,zero,91
	sw	a0,-2048(s1)

.Lbranch_8000bfd6:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000bfd6
	addi	a0,zero,68
	sw	a0,-2048(s1)

.Lbranch_8000bfe4:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000bfe4
	addi	a0,zero,93
	sw	a0,-2048(s1)

.Lbranch_8000bff2:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000bff2
	addi	a0,zero,48
	sw	a0,-2048(s1)

.Lbranch_8000c000:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c000
	addi	a0,zero,49
	sw	a0,-2048(s1)

.Lbranch_8000c00e:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c00e
	addi	a0,zero,58
	sw	a0,-2048(s1)

.Lbranch_8000c01c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c01c
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,956	# .Lanon.6afbde2820a9363c4000257edad1edf7.27
	sw	a2,-2048(s1)
	addi	a2,zero,41

.Lbranch_8000c036:
	add	a3,a1,a0
	lbu	a3,0(a3)

.Lbranch_8000c03e:
	lw	a4,-2044(s1)
	c.bnez	a4, .Lbranch_8000c03e
	c.addi	a0,1	# .Lline_table_start1+0xffb4eac
	sw	a3,-2048(s1)
	bne	a0,a2, .Lbranch_8000c036
	lui	a0,0x8001c
	addi	a0,a0,936	# .Lanon.6afbde2820a9363c4000257edad1edf7.26

.Lbranch_8000c056:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c056
	c.li	a1,19
	c.j	 .Lbranch_8000c1c6

.Lbranch_8000c060:
	sw	s6,56(s4)
	sw	s7,60(s4)
	lbu	a0,11(s3)
	c.bnez	a0, .Lbranch_8000c078
	srli	a0,s2,0x17
	bne	a0,zero, .Lbranch_8000c26c
	c.slli	s2,0x9

.Lbranch_8000c078:
	c.li	a1,17
	addi	a2,zero,33
	c.mv	a0,s2
	auipc	ra,0x1
	jalr	ra,-384(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE
	beq	a0,zero, .Lbranch_8000c1ee

.Lbranch_8000c08c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c08c
	addi	a0,zero,91
	sw	a0,-2048(s1)

.Lbranch_8000c09a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c09a
	addi	a0,zero,68
	sw	a0,-2048(s1)

.Lbranch_8000c0a8:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c0a8
	addi	a0,zero,93
	sw	a0,-2048(s1)

.Lbranch_8000c0b6:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c0b6
	addi	a0,zero,48
	sw	a0,-2048(s1)

.Lbranch_8000c0c4:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c0c4
	addi	a0,zero,49
	sw	a0,-2048(s1)

.Lbranch_8000c0d2:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c0d2
	addi	a0,zero,58
	sw	a0,-2048(s1)

.Lbranch_8000c0e0:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c0e0
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,1216	# .Lanon.6afbde2820a9363c4000257edad1edf7.67
	sw	a2,-2048(s1)
	c.li	a2,23

.Lbranch_8000c0f8:
	add	a3,a1,a0
	lbu	a3,0(a3)

.Lbranch_8000c100:
	lw	a4,-2044(s1)
	c.bnez	a4, .Lbranch_8000c100
	c.addi	a0,1
	sw	a3,-2048(s1)
	bne	a0,a2, .Lbranch_8000c0f8

.Lbranch_8000c110:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c110
	c.li	a0,10
	sw	a0,-2048(s1)

.Lbranch_8000c11c:
	c.lui	a0,0x18
	addi	a0,a0,1697	# .Lline_table_start3+0xdd

.Lbranch_8000c122:
	fence	rw,rw
	lw	a1,80(s4)
	c.andi	a1,1
	c.bnez	a1, .Lbranch_8000c1ce
	c.addi	a0,-1
	c.bnez	a0, .Lbranch_8000c122

.Lbranch_8000c132:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c132
	addi	a0,zero,91
	sw	a0,-2048(s1)

.Lbranch_8000c140:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c140
	addi	a0,zero,68
	sw	a0,-2048(s1)

.Lbranch_8000c14e:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c14e
	addi	a0,zero,93
	sw	a0,-2048(s1)

.Lbranch_8000c15c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c15c
	addi	a0,zero,48
	sw	a0,-2048(s1)

.Lbranch_8000c16a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c16a
	addi	a0,zero,49
	sw	a0,-2048(s1)

.Lbranch_8000c178:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c178
	addi	a0,zero,58
	sw	a0,-2048(s1)

.Lbranch_8000c186:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c186
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,884	# .Lanon.6afbde2820a9363c4000257edad1edf7.24
	sw	a2,-2048(s1)
	c.li	a2,30

.Lbranch_8000c19e:
	add	a3,a1,a0
	lbu	a3,0(a3)

.Lbranch_8000c1a6:
	lw	a4,-2044(s1)
	c.bnez	a4, .Lbranch_8000c1a6
	c.addi	a0,1
	sw	a3,-2048(s1)
	bne	a0,a2, .Lbranch_8000c19e
	lui	a0,0x8001c
	addi	a0,a0,916	# .Lanon.6afbde2820a9363c4000257edad1edf7.25

.Lbranch_8000c1be:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c1be
	c.li	a1,20

.Lbranch_8000c1c6:
	c.li	a2,10
	sw	a2,-2048(s1)
	c.j	 .Lbranch_8000bf3c

.Lbranch_8000c1ce:
	.word	0x0000500f
	addi	a2,s5,512
	lui	a3,0x10001
	c.li	a0,0

.Lbranch_8000c1dc:
	lbu	a1,0(a3)	# .Lline_table_start1+0xffb4eab
	sb	a1,0(s5)
	c.addi	s5,1
	c.addi	a3,1
	bne	s5,a2, .Lbranch_8000c1dc
	c.j	 .Lbranch_8000bf3c

.Lbranch_8000c1ee:
	lui	a0,0xf4
	addi	a0,a0,576	# .Lline_table_start1+0xa80eb
	lui	a1,0x10000

.Lbranch_8000c1fa:
	lw	a2,52(s4)
	c.andi	a2,1
	c.bnez	a2, .Lbranch_8000c256
	lw	zero,0(a1)	# .Lline_table_start1+0xffb3eab
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	c.addi	a0,-1
	c.bnez	a0, .Lbranch_8000c1fa

.Lbranch_8000c256:
	lw	a0,52(s4)
	c.andi	a0,12
	beq	a0,zero, .Lbranch_8000c11c
	lui	a0,0x8001c
	addi	a0,a0,936	# .Lanon.6afbde2820a9363c4000257edad1edf7.26
	c.li	a1,19
	c.j	 .Lbranch_8000bf3c

.Lbranch_8000c26c:
	lui	a0,0x8001c
	addi	a0,a0,1200	# .Lanon.6afbde2820a9363c4000257edad1edf7.66
	auipc	ra,0x5
	jalr	ra,344(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

	.globl _ZN11homebrew_os6sdcard6SdCard12read_sectors17hc221ebece99dc8b1E
_ZN11homebrew_os6sdcard6SdCard12read_sectors17hc221ebece99dc8b1E:
	addi	sp,sp,-640
	sw	ra,636(sp)
	sw	s0,632(sp)
	sw	s1,628(sp)
	sw	s2,624(sp)
	sw	s3,620(sp)
	sw	s4,616(sp)
	sw	s5,612(sp)
	sw	s6,608(sp)
	sw	s7,604(sp)
	sw	s8,600(sp)
	sw	s9,596(sp)
	sw	s10,592(sp)
	sw	s11,588(sp)
	c.addi4spn	s0,sp,640
	c.mv	s9,a0
	lbu	a0,10(a0)
	sw	a1,-608(s0)
	sw	a2,-604(s0)
	c.beqz	a0, .Lbranch_8000c3c2
	c.mv	s3,a4
	c.mv	s4,a3
	c.mv	s11,a2
	c.mv	s5,a1
	lui	s1,0xf0004
	addi	a0,s0,-604
	lui	a2,0x8000f
	addi	a2,a2,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	a1,s0,-608
	sw	a0,-600(s0)
	sw	a2,-596(s0)
	sw	a1,-592(s0)
	sw	a2,-588(s0)
	lui	a1,0x80012
	addi	a1,a1,1348	# anon.3839376bf29ad69682d1272c1c63f1dd.31.llvm.7710812085696039936+0xa4
	addi	a0,s0,-68
	addi	a2,s0,-600
	auipc	ra,0x2
	jalr	ra,454(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-64(s0)
	lw	a1,-60(s0)

.Lbranch_8000c312:
	lw	a2,-2044(s1)	# __heap_end+0x6fd03804
	c.bnez	a2, .Lbranch_8000c312
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_8000c320:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c320
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_8000c32e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c32e
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000c33c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c33c
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_8000c34a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c34a
	addi	a2,zero,49
	sw	a2,-2048(s1)

.Lbranch_8000c358:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c358
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_8000c366:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c366
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_8000c38c
	c.add	a1,a0

.Lbranch_8000c378:
	lbu	a2,0(a0)

.Lbranch_8000c37c:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_8000c37c
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_8000c378

.Lbranch_8000c38c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c38c
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-68
	c.li	a1,1
	c.li	a2,1
	c.li	s2,1
	auipc	ra,0xffff9
	jalr	ra,1858(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	bne	s11,s2, .Lbranch_8000c3d0
	c.mv	a0,s9
	c.mv	a1,s5
	c.mv	a2,s4
	c.mv	a3,s3
	auipc	ra,0x0
	jalr	ra,-1422(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	jal	zero, .Lbranch_8000cd08

.Lbranch_8000c3c2:
	lui	a0,0x8001c
	addi	a0,a0,860	# .Lanon.6afbde2820a9363c4000257edad1edf7.23
	c.li	a1,23
	jal	zero, .Lbranch_8000cd08

.Lbranch_8000c3d0:
	srli	s2,s3,0x9
	beq	s2,zero, .Lbranch_8000cbf0
	c.mv	s6,s11
	bltu	s11,s2, .Lbranch_8000c3e0
	c.mv	s6,s2

.Lbranch_8000c3e0:
	slli	s8,s6,0x9
	bltu	s3,s8, .Lbranch_8000ce7a
	sw	s5,-88(s0)
	sw	s6,-84(s0)
	addi	a0,zero,512
	c.li	a1,16
	c.li	a2,1
	auipc	ra,0x1
	jalr	ra,-1272(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE
	c.andi	a0,1
	c.beqz	a0, .Lbranch_8000c49a

.Lbranch_8000c404:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c404
	addi	a0,zero,91
	sw	a0,-2048(s1)

.Lbranch_8000c412:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c412
	addi	a0,zero,68
	sw	a0,-2048(s1)

.Lbranch_8000c420:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c420
	addi	a0,zero,93
	sw	a0,-2048(s1)

.Lbranch_8000c42e:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c42e
	addi	a0,zero,48
	sw	a0,-2048(s1)

.Lbranch_8000c43c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c43c
	addi	a0,zero,49
	sw	a0,-2048(s1)

.Lbranch_8000c44a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c44a
	addi	a0,zero,58
	sw	a0,-2048(s1)

.Lbranch_8000c458:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c458
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,1508	# .Lanon.6afbde2820a9363c4000257edad1edf7.88
	sw	a2,-2048(s1)
	addi	a2,zero,47

.Lbranch_8000c472:
	add	a3,a1,a0
	lbu	a3,0(a3)

.Lbranch_8000c47a:
	lw	a4,-2044(s1)
	c.bnez	a4, .Lbranch_8000c47a
	c.addi	a0,1
	sw	a3,-2048(s1)
	bne	a0,a2, .Lbranch_8000c472

.Lbranch_8000c48a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c48a
	c.li	a0,10
	sw	a0,-2048(s1)
	jal	zero, .Lbranch_8000ccfe

.Lbranch_8000c49a:
	addi	a0,s0,-84
	addi	a1,s0,-88
	sw	a0,-600(s0)
	lui	a0,0x8000f
	addi	a0,a0,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-596(s0)
	sw	a1,-592(s0)
	sw	a0,-588(s0)
	lui	a1,0x80012
	addi	a1,a1,772	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x184
	addi	a0,s0,-68
	addi	a2,s0,-600
	auipc	ra,0x2
	jalr	ra,-2(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-64(s0)
	lw	a1,-60(s0)

.Lbranch_8000c4da:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c4da
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_8000c4e8:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c4e8
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_8000c4f6:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c4f6
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000c504:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c504
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_8000c512:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c512
	addi	a2,zero,49
	sw	a2,-2048(s1)

.Lbranch_8000c520:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c520
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_8000c52e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c52e
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_8000c554
	c.add	a1,a0

.Lbranch_8000c540:
	lbu	a2,0(a0)

.Lbranch_8000c544:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_8000c544
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_8000c540

.Lbranch_8000c554:
	sw	s2,-616(s0)

.Lbranch_8000c558:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c558
	lui	s10,0xf0002
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-68
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffff9
	jalr	ra,1396(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,zero,65
	sw	s8,-80(s0)
	bgeu	s6,a0, .Lbranch_8000c7de
	addi	a0,s0,-80
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-68(s0)
	sw	a1,-64(s0)
	lui	a1,0x80012
	addi	a1,a1,1396	# anon.3839376bf29ad69682d1272c1c63f1dd.31.llvm.7710812085696039936+0xd4
	addi	a0,s0,-600
	addi	a2,s0,-68
	auipc	ra,0x2
	jalr	ra,-224(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-596(s0)
	lw	a1,-592(s0)

.Lbranch_8000c5b8:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c5b8
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_8000c5c6:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c5c6
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_8000c5d4:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c5d4
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000c5e2:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c5e2
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_8000c5f0:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c5f0
	addi	a2,zero,49
	sw	a2,-2048(s1)

.Lbranch_8000c5fe:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c5fe
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_8000c60c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c60c
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_8000c632
	c.add	a1,a0

.Lbranch_8000c61e:
	lbu	a2,0(a0)

.Lbranch_8000c622:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_8000c622
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_8000c61e

.Lbranch_8000c632:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c632
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-600
	c.li	a1,1
	c.li	a2,1
	c.li	s2,1
	auipc	ra,0xffff9
	jalr	ra,1180(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,zero,512
	sw	a0,56(s10)	# __heap_end+0x6fd02038
	sw	s6,60(s10)
	sb	zero,76(s10)
	sw	s4,68(s10)
	sw	zero,64(s10)
	sw	s8,72(s10)
	sw	zero,88(s10)
	sb	s2,76(s10)
	lbu	s7,11(s9)
	c.mv	a0,s5
	bne	s7,zero, .Lbranch_8000c68a
	srli	a0,s5,0x17
	bne	a0,zero, .Lbranch_8000ceee
	slli	a0,s5,0x9

.Lbranch_8000c68a:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c68a
	addi	a1,zero,91
	sw	a1,-2048(s1)

.Lbranch_8000c698:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c698
	addi	a1,zero,68
	sw	a1,-2048(s1)

.Lbranch_8000c6a6:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c6a6
	addi	a1,zero,93
	sw	a1,-2048(s1)

.Lbranch_8000c6b4:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c6b4
	addi	a1,zero,48
	sw	a1,-2048(s1)

.Lbranch_8000c6c2:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c6c2
	addi	a1,zero,49
	sw	a1,-2048(s1)

.Lbranch_8000c6d0:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c6d0
	addi	a1,zero,58
	sw	a1,-2048(s1)

.Lbranch_8000c6de:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c6de
	addi	a3,zero,32
	lui	a2,0x8001c
	addi	a2,a2,1256	# .Lanon.6afbde2820a9363c4000257edad1edf7.73
	sw	a3,-2048(s1)
	c.li	a3,23

.Lbranch_8000c6f6:
	add	a4,a2,a1
	lbu	a4,0(a4)

.Lbranch_8000c6fe:
	lw	a5,-2044(s1)
	c.bnez	a5, .Lbranch_8000c6fe
	c.addi	a1,1
	sw	a4,-2048(s1)
	bne	a1,a3, .Lbranch_8000c6f6

.Lbranch_8000c70e:
	lw	a1,-2044(s1)
	c.bnez	a1, .Lbranch_8000c70e
	sltiu	a1,s6,2
	c.li	a2,10
	xori	a1,a1,1
	sw	a2,-2048(s1)
	c.addi	a1,17
	addi	a2,zero,33
	auipc	ra,0x0
	jalr	ra,2008(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE
	beq	a0,zero, .Lbranch_8000cd42
	lui	a2,0x8001c
	addi	a2,a2,1340	# .Lanon.6afbde2820a9363c4000257edad1edf7.77
	c.li	a0,3
	c.li	a1,1
	c.li	a3,25
	auipc	ra,0x1
	jalr	ra,-1478(ra)	# _ZN11homebrew_os5debug11debug_print17h688279b3bf40568eE

.Lbranch_8000c74a:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c74a
	addi	a0,zero,91
	sw	a0,-2048(s1)

.Lbranch_8000c758:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c758
	addi	a0,zero,68
	sw	a0,-2048(s1)

.Lbranch_8000c766:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c766
	addi	a0,zero,93
	sw	a0,-2048(s1)

.Lbranch_8000c774:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c774
	addi	a0,zero,48
	sw	a0,-2048(s1)

.Lbranch_8000c782:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c782
	addi	a0,zero,49
	sw	a0,-2048(s1)

.Lbranch_8000c790:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c790
	addi	a0,zero,58
	sw	a0,-2048(s1)

.Lbranch_8000c79e:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c79e
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,1368	# .Lanon.6afbde2820a9363c4000257edad1edf7.78
	sw	a2,-2048(s1)
	addi	a2,zero,48

.Lbranch_8000c7b8:
	add	a3,a1,a0
	lbu	a3,0(a3)

.Lbranch_8000c7c0:
	lw	a4,-2044(s1)
	c.bnez	a4, .Lbranch_8000c7c0
	c.addi	a0,1
	sw	a3,-2048(s1)
	bne	a0,a2, .Lbranch_8000c7b8

.Lbranch_8000c7d0:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c7d0
	c.li	a0,10
	sw	a0,-2048(s1)
	c.j	 .Lbranch_8000c8bc

.Lbranch_8000c7de:
	addi	a0,s0,-80
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	lui	a2,0x80014
	addi	a2,a2,80	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0x8
	sw	a0,-600(s0)
	sw	a1,-596(s0)
	sw	a2,-592(s0)
	sw	a1,-588(s0)
	lui	a1,0x80012
	addi	a1,a1,-1684	# anon.3839376bf29ad69682d1272c1c63f1dd.7.llvm.7710812085696039936+0x9c
	addi	a0,s0,-68
	addi	a2,s0,-600
	auipc	ra,0x2
	jalr	ra,-842(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-64(s0)
	lw	a1,-60(s0)

.Lbranch_8000c822:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c822
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_8000c830:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c830
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_8000c83e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c83e
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000c84c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c84c
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_8000c85a:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c85a
	addi	a2,zero,49
	sw	a2,-2048(s1)

.Lbranch_8000c868:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c868
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_8000c876:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c876
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_8000c89c
	c.add	a1,a0

.Lbranch_8000c888:
	lbu	a2,0(a0)

.Lbranch_8000c88c:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_8000c88c
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_8000c888

.Lbranch_8000c89c:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c89c
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-68
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffff9
	jalr	ra,564(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lbu	s7,11(s9)

.Lbranch_8000c8bc:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c8bc
	addi	a0,zero,91
	sw	a0,-2048(s1)

.Lbranch_8000c8ca:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c8ca
	addi	a0,zero,68
	sw	a0,-2048(s1)

.Lbranch_8000c8d8:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c8d8
	addi	a0,zero,93
	sw	a0,-2048(s1)

.Lbranch_8000c8e6:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c8e6
	addi	a0,zero,48
	sw	a0,-2048(s1)

.Lbranch_8000c8f4:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c8f4
	addi	a0,zero,49
	sw	a0,-2048(s1)

.Lbranch_8000c902:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c902
	addi	a0,zero,58
	sw	a0,-2048(s1)

.Lbranch_8000c910:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c910
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,1416	# .Lanon.6afbde2820a9363c4000257edad1edf7.79
	sw	a2,-2048(s1)
	c.li	a2,26

.Lbranch_8000c928:
	add	a3,a1,a0
	lbu	a3,0(a3)

.Lbranch_8000c930:
	lw	a4,-2044(s1)
	c.bnez	a4, .Lbranch_8000c930
	c.addi	a0,1
	sw	a3,-2048(s1)
	bne	a0,a2, .Lbranch_8000c928
	sw	s11,-632(s0)
	sw	s9,-624(s0)
	sw	s4,-612(s0)
	sw	s3,-620(s0)

.Lbranch_8000c950:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000c950
	c.li	s2,0
	c.li	a1,10
	andi	s9,s7,1
	lui	a0,0xf4
	sw	a1,-2048(s1)
	sw	s5,-76(s0)
	addi	s3,a0,576	# .Lline_table_start1+0xa80eb
	lui	s4,0x10000
	sw	s5,-628(s0)

.Lbranch_8000c976:
	beq	s6,zero, .Lbranch_8000cb88
	c.li	a0,8
	c.mv	s11,s6
	bltu	s6,a0, .Lbranch_8000c984
	c.li	s11,8

.Lbranch_8000c984:
	sw	s11,-72(s0)
	addi	a0,s0,-72
	sw	a0,-600(s0)
	lui	a0,0x8000f
	addi	a0,a0,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-596(s0)
	addi	a1,s0,-76
	sw	a1,-592(s0)
	sw	a0,-588(s0)
	addi	a0,s0,-68
	addi	a2,s0,-600
	lui	a1,0x80012
	addi	a1,a1,-720	# anon.20b29b1f91e363e9fbd85f55f7c77062.12.llvm.14406403243838317486+0x160
	auipc	ra,0x2
	jalr	ra,-1264(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a0,-64(s0)
	lw	a1,-60(s0)

.Lbranch_8000c9c8:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c9c8
	addi	a2,zero,91
	sw	a2,-2048(s1)

.Lbranch_8000c9d6:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c9d6
	addi	a2,zero,68
	sw	a2,-2048(s1)

.Lbranch_8000c9e4:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c9e4
	addi	a2,zero,93
	sw	a2,-2048(s1)

.Lbranch_8000c9f2:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000c9f2
	addi	a2,zero,48
	sw	a2,-2048(s1)

.Lbranch_8000ca00:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000ca00
	addi	a2,zero,49
	sw	a2,-2048(s1)

.Lbranch_8000ca0e:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000ca0e
	addi	a2,zero,58
	sw	a2,-2048(s1)

.Lbranch_8000ca1c:
	lw	a2,-2044(s1)
	c.bnez	a2, .Lbranch_8000ca1c
	addi	a2,zero,32
	sw	a2,-2048(s1)
	c.beqz	a1, .Lbranch_8000ca42
	c.add	a1,a0

.Lbranch_8000ca2e:
	lbu	a2,0(a0)

.Lbranch_8000ca32:
	lw	a3,-2044(s1)
	c.bnez	a3, .Lbranch_8000ca32
	c.addi	a0,1
	sw	a2,-2048(s1)
	bne	a0,a1, .Lbranch_8000ca2e

.Lbranch_8000ca42:
	slli	s7,s11,0x9

.Lbranch_8000ca46:
	lw	a0,-2044(s1)
	c.bnez	a0, .Lbranch_8000ca46
	c.li	a0,10
	sw	a0,-2048(s1)
	addi	a0,s0,-68
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffff9
	jalr	ra,138(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	addi	a0,zero,512
	sw	a0,56(s10)
	sw	s11,60(s10)
	sb	zero,76(s10)
	lui	a0,0x10001
	sw	a0,68(s10)
	sw	zero,64(s10)
	sw	s7,72(s10)
	sw	zero,88(s10)
	c.li	a0,1
	sb	a0,76(s10)
	c.mv	a0,s5
	bne	s9,zero, .Lbranch_8000ca9e
	srli	a0,s5,0x17
	bne	a0,zero, .Lbranch_8000cece
	slli	a0,s5,0x9

.Lbranch_8000ca9e:
	addi	a1,s6,-1
	sltu	a1,zero,a1
	c.addi	a1,17
	sb	a1,-53(s0)
	addi	a2,zero,33
	auipc	ra,0x0
	jalr	ra,1104(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE
	bne	a0,zero, .Lbranch_8000cc48
	c.mv	a0,s3

.Lbranch_8000cabe:
	lw	a1,52(s10)
	c.andi	a1,1
	c.bnez	a1, .Lbranch_8000cb1a
	lw	zero,0(s4)	# .Lline_table_start1+0xffb3eab
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	lw	zero,0(s4)
	c.addi	a0,-1	# .Lline_table_start1+0xffb4eaa
	c.bnez	a0, .Lbranch_8000cabe

.Lbranch_8000cb1a:
	lw	a0,52(s10)
	c.andi	a0,12
	bne	a0,zero, .Lbranch_8000cc9a
	lw	a0,-612(s0)
	c.add	a0,s2
	lui	a1,0x10001
	c.mv	a2,s7
	c.mv	a3,s2
	c.j	 .Lbranch_8000cb3e

.Lbranch_8000cb34:
	c.addi	a1,1	# .Lline_table_start1+0xffb4eac
	c.addi	a0,1
	c.addi	a2,-1
	c.addi	a3,1
	c.beqz	a2, .Lbranch_8000cb50

.Lbranch_8000cb3e:
	bltu	a3,s2, .Lbranch_8000ce90
	bgeu	a3,s8, .Lbranch_8000cb34
	lbu	a4,0(a1)
	sb	a4,0(a0)
	c.j	 .Lbranch_8000cb34

.Lbranch_8000cb50:
	c.li	a0,1
	beq	s6,a0, .Lbranch_8000cb64
	c.li	a1,12
	c.li	a2,1
	c.li	a0,0
	auipc	ra,0x0
	jalr	ra,932(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE

.Lbranch_8000cb64:
	c.add	s5,s11
	bltu	s5,s11, .Lbranch_8000cebe
	sw	s5,-76(s0)
	c.add	s2,s7
	sub	s6,s6,s11
	bgeu	s2,s7, .Lbranch_8000c976
	lui	a0,0x8001c
	addi	a0,a0,1476	# .Lanon.6afbde2820a9363c4000257edad1edf7.84
	auipc	ra,0x5
	jalr	ra,-2004(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000cb88:
	addi	a0,s0,-80
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-68(s0)
	sw	a1,-64(s0)
	lui	a1,0x80013
	addi	a1,a1,-1760	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.1.llvm.2171931009800262987+0x170
	addi	a0,s0,-600
	addi	a2,s0,-68
	auipc	ra,0x2
	jalr	ra,-1764(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a2,-596(s0)
	lw	a3,-592(s0)
	c.li	a0,3
	c.li	a1,1
	auipc	ra,0x0
	jalr	ra,1468(ra)	# _ZN11homebrew_os5debug11debug_print17h688279b3bf40568eE
	addi	a0,s0,-600
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffff9
	jalr	ra,-236(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lw	s3,-620(s0)
	lw	s4,-612(s0)
	lw	s9,-624(s0)
	lw	s5,-628(s0)
	lw	s11,-632(s0)

.Lbranch_8000cbec:
	lw	s2,-616(s0)

.Lbranch_8000cbf0:
	andi	s1,s3,511
	c.li	a0,0
	beq	s1,zero, .Lbranch_8000cd08
	bgeu	s2,s11, .Lbranch_8000cd08
	c.add	s5,s2
	bltu	s5,s2, .Lbranch_8000cede
	addi	a0,s0,-600
	addi	a2,zero,512
	addi	s2,s0,-600
	c.li	a1,0
	auipc	ra,0xffff9
	jalr	ra,1350(ra)	# memset
	addi	a2,s0,-600
	addi	a3,zero,512
	c.mv	a0,s9
	c.mv	a1,s5
	auipc	ra,0xfffff
	jalr	ra,514(ra)	# _ZN11homebrew_os6sdcard6SdCard11read_sector17h18898080d2332a24E
	c.bnez	a0, .Lbranch_8000cd08
	lui	a0,0x80000
	addi	a0,a0,-512	# .Lline_table_start1+0x7ffb3cab
	and	a0,s3,a0
	c.add	a0,s4
	bltu	a0,s2, .Lbranch_8000cdde
	sub	a1,a0,s2
	c.j	 .Lbranch_8000cde2

.Lbranch_8000cc48:
	addi	a0,s0,-53
	lui	a1,0x8000f
	addi	a1,a1,1628	# _ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hfc78ba423a0d98a3E
	sw	a0,-68(s0)
	sw	a1,-64(s0)
	lui	a1,0x80013
	addi	a1,a1,-1800	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.1.llvm.2171931009800262987+0x148
	addi	a0,s0,-600
	addi	a2,s0,-68
	auipc	ra,0x2
	jalr	ra,-1956(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a2,-596(s0)
	lw	a3,-592(s0)
	c.li	a0,3
	c.li	a1,1
	auipc	ra,0x0
	jalr	ra,1276(ra)	# _ZN11homebrew_os5debug11debug_print17h688279b3bf40568eE
	addi	a0,s0,-600
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffff9
	jalr	ra,-428(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	c.j	 .Lbranch_8000ccfe

.Lbranch_8000cc9a:
	addi	a0,s0,-53
	lui	a1,0x8000f
	addi	a1,a1,1628	# _ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hfc78ba423a0d98a3E
	sw	a0,-68(s0)
	sw	a1,-64(s0)
	lui	a1,0x80013
	addi	a1,a1,-1716	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.1.llvm.2171931009800262987+0x19c
	addi	a0,s0,-600
	addi	a2,s0,-68
	auipc	ra,0x2
	jalr	ra,-2038(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a2,-596(s0)
	lw	a3,-592(s0)
	c.li	a0,3
	c.li	a1,1
	c.li	s1,1
	auipc	ra,0x0
	jalr	ra,1192(ra)	# _ZN11homebrew_os5debug11debug_print17h688279b3bf40568eE
	addi	a0,s0,-600
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffff9
	jalr	ra,-512(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	beq	s6,s1, .Lbranch_8000ccfe
	c.li	a1,12
	c.li	a2,1
	c.li	a0,0
	auipc	ra,0x0
	jalr	ra,522(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE

.Lbranch_8000ccfe:
	lui	a0,0x8001c
	addi	a0,a0,1032	# .Lanon.6afbde2820a9363c4000257edad1edf7.33
	c.li	a1,24

.Lbranch_8000cd08:
	lw	ra,636(sp)
	lw	s0,632(sp)
	lw	s1,628(sp)
	lw	s2,624(sp)
	lw	s3,620(sp)
	lw	s4,616(sp)
	lw	s5,612(sp)
	lw	s6,608(sp)
	lw	s7,604(sp)
	lw	s8,600(sp)
	lw	s9,596(sp)
	lw	s10,592(sp)
	lw	s11,588(sp)
	addi	sp,sp,640
	c.jr	ra

.Lbranch_8000cd42:
	lui	a0,0xf4
	addi	a0,a0,576	# .Lline_table_start1+0xa80eb
	lui	a1,0x10000

.Lbranch_8000cd4e:
	lw	a2,52(s10)
	c.andi	a2,1
	c.bnez	a2, .Lbranch_8000cdaa
	lw	zero,0(a1)	# .Lline_table_start1+0xffb3eab
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	c.addi	a0,-1
	c.bnez	a0, .Lbranch_8000cd4e

.Lbranch_8000cdaa:
	lw	a0,52(s10)
	c.andi	a0,12
	c.beqz	a0, .Lbranch_8000cdf8
	lui	a2,0x8001c
	addi	a2,a2,1320	# .Lanon.6afbde2820a9363c4000257edad1edf7.76
	c.li	a0,3
	c.li	a1,1
	c.li	a3,18
	c.li	s2,1
	auipc	ra,0x0
	jalr	ra,954(ra)	# _ZN11homebrew_os5debug11debug_print17h688279b3bf40568eE
	bgeu	s2,s6, .Lbranch_8000c74a
	c.li	a1,12
	c.li	a2,1
	c.li	a0,0
	auipc	ra,0x0
	jalr	ra,300(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE
	c.j	 .Lbranch_8000c74a

.Lbranch_8000cdde:
	sub	a1,s2,a0

.Lbranch_8000cde2:
	bltu	a1,s1, .Lbranch_8000cea0
	addi	a1,s0,-600
	c.mv	a2,s1
	auipc	ra,0xffff9
	jalr	ra,756(ra)	# memcpy
	c.li	a0,0
	c.j	 .Lbranch_8000cd08

.Lbranch_8000cdf8:
	c.li	a0,1
	bgeu	a0,s6, .Lbranch_8000ce0c
	c.li	a1,12
	c.li	a2,1
	c.li	a0,0
	auipc	ra,0x0
	jalr	ra,252(ra)	# _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE

.Lbranch_8000ce0c:
	.word	0x0000500f
	addi	a0,s0,-80
	sw	a0,-68(s0)
	lui	a0,0x8000f
	addi	a0,a0,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-64(s0)
	lui	a1,0x80012
	addi	a1,a1,-760	# anon.20b29b1f91e363e9fbd85f55f7c77062.12.llvm.14406403243838317486+0x138
	addi	a0,s0,-600
	addi	a2,s0,-68
	auipc	ra,0x1
	jalr	ra,1684(ra)	# _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
	lw	a2,-596(s0)
	lw	a3,-592(s0)
	c.li	a0,3
	c.li	a1,1
	auipc	ra,0x0
	jalr	ra,820(ra)	# _ZN11homebrew_os5debug11debug_print17h688279b3bf40568eE
	addi	a0,s0,-600
	c.li	a1,1
	c.li	a2,1
	auipc	ra,0xffff9
	jalr	ra,-884(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
	lui	a2,0x8001c
	addi	a2,a2,1280	# .Lanon.6afbde2820a9363c4000257edad1edf7.75
	c.li	a0,3
	c.li	a1,1
	addi	a3,zero,37
	auipc	ra,0x0
	jalr	ra,780(ra)	# _ZN11homebrew_os5debug11debug_print17h688279b3bf40568eE
	c.j	 .Lbranch_8000cbec

.Lbranch_8000ce7a:
	lui	a3,0x8001c
	addi	a3,a3,1000	# .Lanon.6afbde2820a9363c4000257edad1edf7.30
	c.li	a0,0
	c.mv	a1,s8
	c.mv	a2,s3
	auipc	ra,0x4
	jalr	ra,-568(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_8000ce90:
	lui	a0,0x8001c
	addi	a0,a0,1492	# .Lanon.6afbde2820a9363c4000257edad1edf7.85
	auipc	ra,0x4
	jalr	ra,1300(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000cea0:
	lui	a0,0x8001c
	addi	a0,a0,-1804	# anon.3973a9c3f4224926bbecf4cad58bd903.0.llvm.1830756879319262441
	lui	a3,0x8001c
	addi	a3,a3,-1520	# anon.3973a9c3f4224926bbecf4cad58bd903.2.llvm.1830756879319262441
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x4
	jalr	ra,1458(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000cebe:
	lui	a0,0x8001c
	addi	a0,a0,1460	# .Lanon.6afbde2820a9363c4000257edad1edf7.83
	auipc	ra,0x4
	jalr	ra,1254(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000cece:
	lui	a0,0x8001c
	addi	a0,a0,1444	# .Lanon.6afbde2820a9363c4000257edad1edf7.82
	auipc	ra,0x4
	jalr	ra,1270(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_8000cede:
	lui	a0,0x8001c
	addi	a0,a0,1016	# .Lanon.6afbde2820a9363c4000257edad1edf7.31
	auipc	ra,0x4
	jalr	ra,1222(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000ceee:
	lui	a0,0x8001c
	addi	a0,a0,1240	# .Lanon.6afbde2820a9363c4000257edad1edf7.72
	auipc	ra,0x4
	jalr	ra,1238(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E
	# ... (zero-filled gap)

	.globl _ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE
_ZN11homebrew_os6sdcard6SdCard19sdcard_send_command17h3143c371473dfc9aE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.swsp	s1,4(sp)
	c.swsp	s2,0(sp)
	c.addi4spn	s0,sp,16
	c.li	a4,0
	lui	a3,0xf0004
	lui	t6,0xf0002
	slli	a5,a1,0x8
	c.li	s1,1
	lui	a1,0x10000
	addi	a6,zero,91
	addi	a7,zero,68
	addi	t0,zero,93
	addi	t1,zero,48
	addi	t2,zero,49
	addi	t3,zero,58
	sw	a0,20(t6)	# __heap_end+0x6fd02014
	addi	t4,zero,32
	c.or	a5,a2
	lui	s2,0x8001c
	addi	s2,s2,1072	# .Lanon.6afbde2820a9363c4000257edad1edf7.62
	sw	a5,24(t6)
	addi	a5,zero,39
	sw	s1,28(t6)
	c.li	t5,10

.Lbranch_8000cf58:
	lw	a0,48(t6)
	lw	zero,0(a1)	# .Lline_table_start1+0xffb3eab
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	lw	zero,0(a1)
	andi	s1,a0,1
	c.bnez	s1, .Lbranch_8000d02e
	addi	a0,a4,1
	blt	a0,a4, .Lbranch_8000d16c
	slli	s1,a0,0xc
	c.mv	a4,a0
	c.bnez	s1, .Lbranch_8000cf58

.Lbranch_8000cfc2:
	lw	a4,-2044(a3)	# __heap_end+0x6fd03804
	c.bnez	a4, .Lbranch_8000cfc2
	sw	a6,-2048(a3)

.Lbranch_8000cfcc:
	lw	a4,-2044(a3)
	c.bnez	a4, .Lbranch_8000cfcc
	sw	a7,-2048(a3)

.Lbranch_8000cfd6:
	lw	a4,-2044(a3)
	c.bnez	a4, .Lbranch_8000cfd6
	sw	t0,-2048(a3)

.Lbranch_8000cfe0:
	lw	a4,-2044(a3)
	c.bnez	a4, .Lbranch_8000cfe0
	sw	t1,-2048(a3)

.Lbranch_8000cfea:
	lw	a4,-2044(a3)
	c.bnez	a4, .Lbranch_8000cfea
	sw	t2,-2048(a3)

.Lbranch_8000cff4:
	lw	a4,-2044(a3)
	c.bnez	a4, .Lbranch_8000cff4
	sw	t3,-2048(a3)

.Lbranch_8000cffe:
	lw	a4,-2044(a3)
	c.bnez	a4, .Lbranch_8000cffe
	sw	t4,-2048(a3)

.Lbranch_8000d008:
	add	s1,s2,a4
	lbu	s1,0(s1)

.Lbranch_8000d010:
	lw	a2,-2044(a3)
	c.bnez	a2, .Lbranch_8000d010
	c.addi	a4,1
	sw	s1,-2048(a3)
	bne	a4,a5, .Lbranch_8000d008

.Lbranch_8000d020:
	lw	a2,-2044(a3)
	c.bnez	a2, .Lbranch_8000d020
	sw	t5,-2048(a3)
	c.mv	a4,a0
	c.j	 .Lbranch_8000cf58

.Lbranch_8000d02e:
	andi	a1,a0,4
	c.bnez	a1, .Lbranch_8000d03a
	c.andi	a0,8
	c.bnez	a0, .Lbranch_8000d0ca
	c.j	 .Lbranch_8000d160

.Lbranch_8000d03a:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d03a
	addi	a0,zero,91
	sw	a0,-2048(a3)

.Lbranch_8000d048:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d048
	addi	a0,zero,68
	sw	a0,-2048(a3)

.Lbranch_8000d056:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d056
	addi	a0,zero,93
	sw	a0,-2048(a3)

.Lbranch_8000d064:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d064
	addi	a0,zero,48
	sw	a0,-2048(a3)

.Lbranch_8000d072:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d072
	addi	a0,zero,49
	sw	a0,-2048(a3)

.Lbranch_8000d080:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d080
	addi	a0,zero,58
	sw	a0,-2048(a3)

.Lbranch_8000d08e:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d08e
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,1156	# .Lanon.6afbde2820a9363c4000257edad1edf7.64
	sw	a2,-2048(a3)
	addi	a2,zero,41

.Lbranch_8000d0a8:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_8000d0b0:
	lw	a5,-2044(a3)
	c.bnez	a5, .Lbranch_8000d0b0
	c.addi	a0,1
	sw	a4,-2048(a3)
	bne	a0,a2, .Lbranch_8000d0a8

.Lbranch_8000d0c0:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d0c0
	c.li	a1,1
	c.j	 .Lbranch_8000d158

.Lbranch_8000d0ca:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d0ca
	addi	a0,zero,91
	sw	a0,-2048(a3)

.Lbranch_8000d0d8:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d0d8
	addi	a0,zero,68
	sw	a0,-2048(a3)

.Lbranch_8000d0e6:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d0e6
	addi	a0,zero,93
	sw	a0,-2048(a3)

.Lbranch_8000d0f4:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d0f4
	addi	a0,zero,48
	sw	a0,-2048(a3)

.Lbranch_8000d102:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d102
	addi	a0,zero,49
	sw	a0,-2048(a3)

.Lbranch_8000d110:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d110
	addi	a0,zero,58
	sw	a0,-2048(a3)

.Lbranch_8000d11e:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d11e
	addi	a2,zero,32
	lui	a1,0x8001c
	addi	a1,a1,1112	# .Lanon.6afbde2820a9363c4000257edad1edf7.63
	sw	a2,-2048(a3)
	addi	a2,zero,43

.Lbranch_8000d138:
	add	a4,a1,a0
	lbu	a4,0(a4)

.Lbranch_8000d140:
	lw	a5,-2044(a3)
	c.bnez	a5, .Lbranch_8000d140
	c.addi	a0,1
	sw	a4,-2048(a3)
	bne	a0,a2, .Lbranch_8000d138

.Lbranch_8000d150:
	lw	a0,-2044(a3)
	c.bnez	a0, .Lbranch_8000d150
	c.li	a1,2

.Lbranch_8000d158:
	c.li	a0,10
	sw	a0,-2048(a3)
	c.li	a0,1

.Lbranch_8000d160:
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.lwsp	s1,4(sp)
	c.lwsp	s2,0(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_8000d16c:
	lui	a0,0x8001c
	addi	a0,a0,1056	# .Lanon.6afbde2820a9363c4000257edad1edf7.61
	auipc	ra,0x4
	jalr	ra,568(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN11homebrew_os5debug11debug_print17h688279b3bf40568eE
_ZN11homebrew_os5debug11debug_print17h688279b3bf40568eE:
	c.li	a4,4
	bgeu	a0,a4, .Lbranch_8000d236
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.slli	a0,0x2
	lui	a4,0x80013
	addi	a4,a4,1876	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x40
	c.add	a0,a4
	c.lw	a4,0(a0)
	lui	a0,0xf0004

.Lbranch_8000d19c:
	lw	a5,-2044(a0)	# __heap_end+0x6fd03804
	c.bnez	a5, .Lbranch_8000d19c
	addi	a5,zero,91
	sw	a5,-2048(a0)

.Lbranch_8000d1aa:
	lw	a5,-2044(a0)
	c.bnez	a5, .Lbranch_8000d1aa
	sw	a4,-2048(a0)

.Lbranch_8000d1b4:
	lw	a4,-2044(a0)
	c.bnez	a4, .Lbranch_8000d1b4
	addi	a4,zero,93
	srli	a5,a1,0x4
	sw	a4,-2048(a0)
	lui	a6,0x80013
	addi	a6,a6,1812	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667
	c.add	a5,a6
	lbu	a5,0(a5)

.Lbranch_8000d1d4:
	lw	a4,-2044(a0)
	c.bnez	a4, .Lbranch_8000d1d4
	sw	a5,-2048(a0)
	c.andi	a1,15
	c.add	a1,a6
	lbu	a1,0(a1)

.Lbranch_8000d1e6:
	lw	a4,-2044(a0)
	c.bnez	a4, .Lbranch_8000d1e6
	sw	a1,-2048(a0)

.Lbranch_8000d1f0:
	lw	a1,-2044(a0)
	c.bnez	a1, .Lbranch_8000d1f0
	addi	a1,zero,58
	sw	a1,-2048(a0)

.Lbranch_8000d1fe:
	lw	a1,-2044(a0)
	c.bnez	a1, .Lbranch_8000d1fe
	addi	a1,zero,32
	sw	a1,-2048(a0)
	c.beqz	a3, .Lbranch_8000d224
	c.add	a3,a2

.Lbranch_8000d210:
	lbu	a1,0(a2)

.Lbranch_8000d214:
	lw	a4,-2044(a0)
	c.bnez	a4, .Lbranch_8000d214
	c.addi	a2,1
	sw	a1,-2048(a0)
	bne	a2,a3, .Lbranch_8000d210

.Lbranch_8000d224:
	lw	a1,-2044(a0)
	c.bnez	a1, .Lbranch_8000d224
	c.li	a1,10
	sw	a1,-2048(a0)
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16

.Lbranch_8000d236:
	c.jr	ra

	.globl _ZN4core3num7nonzero16NonZero$LT$T$GT$13new_unchecked18precondition_check17h7e2beda38202bdd8E
_ZN4core3num7nonzero16NonZero$LT$T$GT$13new_unchecked18precondition_check17h7e2beda38202bdd8E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a0,0x8001c
	addi	a0,a0,1992	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.2
	lui	a3,0x8001d
	addi	a3,a3,-1328	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.25
	addi	a1,zero,419
	c.li	a2,0
	auipc	ra,0x4
	jalr	ra,530(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$16insert_recursing17hf4784a0e85286ff6E
_ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$16insert_recursing17hf4784a0e85286ff6E:
	c.addi16sp	sp,-192
	c.swsp	ra,188(sp)
	c.swsp	s0,184(sp)
	c.swsp	s1,180(sp)
	c.swsp	s2,176(sp)
	c.swsp	s3,172(sp)
	c.swsp	s4,168(sp)
	c.swsp	s5,164(sp)
	c.swsp	s6,160(sp)
	c.swsp	s7,156(sp)
	c.swsp	s8,152(sp)
	c.swsp	s9,148(sp)
	c.swsp	s10,144(sp)
	c.swsp	s11,140(sp)
	c.addi4spn	s0,sp,192
	c.mv	s4,a3
	c.mv	s5,a2
	lw	s9,0(a1)
	lhu	s10,270(s9)
	c.li	a2,11
	c.mv	s11,a0
	bgeu	s10,a2, .Lbranch_8000d2ca
	c.lw	s1,8(a1)
	addi	a0,s9,4
	addi	a2,s1,1
	slli	a3,s1,0x2
	slli	a4,s1,0x4
	sub	s6,a4,a3
	add	s3,a0,s6
	bgeu	s10,a2, .Lbranch_8000d2f0
	lw	a0,0(s5)
	lw	a2,4(s5)
	lw	a3,8(s5)
	sw	a0,0(s3)
	sw	a2,4(s3)
	sw	a3,8(s3)
	c.j	 .Lbranch_8000d348

.Lbranch_8000d2ca:
	sw	s9,-148(s0)
	lw	s7,8(a1)
	addi	s9,s0,-128
	c.li	a0,5
	addi	s3,s0,-116
	sw	a4,-180(s0)
	bgeu	s7,a0, .Lbranch_8000d36c
	sw	s7,-168(s0)
	c.li	s7,4
	lw	s10,-148(s0)
	c.j	 .Lbranch_8000d3a0

.Lbranch_8000d2f0:
	slli	a3,a2,0x2
	c.slli	a2,0x4
	sub	a4,s10,s1
	sub	s8,a2,a3
	slli	a2,a4,0x2
	c.slli	a4,0x4
	c.add	a0,s8
	sub	s2,a4,a2
	c.mv	s7,a1
	c.mv	a1,s3
	c.mv	a2,s2
	auipc	ra,0xffff9
	jalr	ra,-520(ra)	# memmove
	lw	a0,0(s5)
	lw	a1,4(s5)
	lw	a2,8(s5)
	addi	a3,s9,136
	sw	a0,0(s3)
	sw	a1,4(s3)
	sw	a2,8(s3)
	add	a1,a3,s6
	add	a0,a3,s8
	c.mv	a2,s2
	auipc	ra,0xffff9
	jalr	ra,-566(ra)	# memmove
	c.mv	a1,s7

.Lbranch_8000d348:
	c.add	s6,s9
	c.addi	s10,1
	lw	a0,0(s4)
	lw	a2,4(s4)
	lw	a3,8(s4)
	c.lw	a1,4(a1)
	sw	a0,136(s6)
	sw	a2,140(s6)
	sw	a3,144(s6)
	sh	s10,270(s9)
	c.j	 .Lbranch_8000d5b0

.Lbranch_8000d36c:
	lw	s10,-148(s0)
	beq	s7,a0, .Lbranch_8000d38c
	c.mv	a0,s7
	c.li	s7,6
	bne	a0,s7, .Lbranch_8000d392
	sw	zero,-168(s0)
	addi	s9,s0,-84
	addi	s3,s0,-80
	c.li	s7,5
	c.j	 .Lbranch_8000d3a0

.Lbranch_8000d38c:
	sw	s7,-168(s0)
	c.j	 .Lbranch_8000d3a0

.Lbranch_8000d392:
	c.addi	a0,-7
	sw	a0,-168(s0)
	addi	s9,s0,-84
	addi	s3,s0,-80

.Lbranch_8000d3a0:
	lw	s8,4(a1)
	auipc	ra,0xffff6
	jalr	ra,364(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,4
	addi	a2,zero,272
	auipc	ra,0xffff9
	jalr	ra,-938(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	beq	a0,zero, .Lbranch_8000da5a
	c.mv	s6,a0
	sw	zero,0(a0)
	lhu	a0,270(s10)
	xori	a1,s7,-1
	c.add	a1,a0
	c.li	a2,11
	sh	a1,270(s6)
	bltu	a2,a0, .Lbranch_8000d9a2
	bgeu	s7,a0, .Lbranch_8000d9a2
	c.li	a2,12
	bgeu	a1,a2, .Lbranch_8000d9b4
	addi	a2,s7,1
	c.sub	a0,a2
	bne	a0,a1, .Lbranch_8000d9ee
	sw	s11,-172(s0)
	addi	a3,s10,4
	addi	a0,s6,4
	slli	a4,a2,0x2
	c.slli	a2,0x4
	sub	s11,a2,a4
	add	a2,a3,s11
	bltu	a0,a2, .Lbranch_8000d418
	sub	a4,a0,a2
	c.j	 .Lbranch_8000d41c

.Lbranch_8000d418:
	sub	a4,a2,a0

.Lbranch_8000d41c:
	slli	a5,a1,0x2
	c.slli	a1,0x4
	sub	s1,a1,a5
	bltu	a4,s1, .Lbranch_8000d984
	sw	s4,-156(s0)
	slli	a1,s7,0x2
	slli	a4,s7,0x4
	sub	s2,a4,a1
	c.add	a3,s2
	c.lw	a1,0(a3)
	sw	a1,-152(s0)
	c.lw	a1,4(a3)
	sw	a1,-144(s0)
	lw	s4,8(a3)
	addi	s10,s10,136
	c.mv	a1,a2
	c.mv	a2,s1
	auipc	ra,0xffff9
	jalr	ra,-884(ra)	# memcpy
	add	a1,s10,s11
	addi	a0,s6,136
	bltu	a0,a1, .Lbranch_8000d46e
	sub	a2,a0,a1
	c.j	 .Lbranch_8000d472

.Lbranch_8000d46e:
	sub	a2,a1,a0

.Lbranch_8000d472:
	lw	s11,-172(s0)
	bltu	a2,s1, .Lbranch_8000d984
	c.add	s2,s10
	c.mv	a2,s1
	auipc	ra,0xffff9
	jalr	ra,-926(ra)	# memcpy
	lw	a0,-148(s0)
	sh	s7,270(a0)
	sw	a0,-116(s0)
	sw	s6,-80(s0)
	lw	s7,0(s3)
	lw	a0,0(s2)
	lw	a1,4(s2)
	lw	a2,8(s2)
	lhu	s3,270(s7)
	sw	a0,-64(s0)
	sw	a1,-60(s0)
	sw	a2,-56(s0)
	sw	s8,-128(s0)
	c.li	a0,11
	sw	zero,-84(s0)
	bgeu	s3,a0, .Lbranch_8000da3c
	lw	a0,0(s9)
	sw	a0,-176(s0)
	addi	a0,s7,4
	lw	s1,-168(s0)
	slli	a1,s1,0x2
	slli	a2,s1,0x4
	sub	s10,a2,a1
	add	s2,a0,s10
	bgeu	s1,s3, .Lbranch_8000d548
	sw	s4,-160(s0)
	addi	s4,s10,12
	sub	a1,s3,s1
	c.add	a0,s4
	slli	a2,a1,0x2
	c.slli	a1,0x4
	c.mv	s1,s7
	sub	s7,a1,a2
	c.mv	a1,s2
	c.mv	a2,s7
	auipc	ra,0xffff9
	jalr	ra,-1022(ra)	# memmove
	lw	a0,0(s5)
	lw	a1,4(s5)
	lw	a2,8(s5)
	addi	a3,s1,136
	sw	a0,0(s2)
	sw	a1,4(s2)
	sw	a2,8(s2)
	add	a1,a3,s10
	add	a0,a3,s4
	lw	s4,-160(s0)
	c.mv	a2,s7
	c.mv	s7,s1
	lw	s1,-168(s0)
	auipc	ra,0xffff9
	jalr	ra,-1078(ra)	# memmove
	c.j	 .Lbranch_8000d560

.Lbranch_8000d548:
	lw	a0,0(s5)
	lw	a1,4(s5)
	lw	a2,8(s5)
	sw	a0,0(s2)
	sw	a1,4(s2)
	sw	a2,8(s2)

.Lbranch_8000d560:
	add	s2,s7,s10
	lw	s9,-156(s0)
	lw	a0,0(s9)
	lw	a1,4(s9)
	lw	a2,8(s9)
	c.addi	s3,1
	sw	a0,136(s2)
	sw	a1,140(s2)
	sw	a2,144(s2)
	lw	a0,-64(s0)
	lw	a1,-60(s0)
	lw	a2,-56(s0)
	sh	s3,270(s7)
	lui	a3,0x80000
	sw	a0,-76(s0)
	sw	a1,-72(s0)
	sw	a2,-68(s0)
	lw	s5,-152(s0)
	bne	s5,a3, .Lbranch_8000d5da
	c.mv	s9,s7
	lw	a1,-176(s0)

.Lbranch_8000d5b0:
	sw	s9,0(s11)
	sw	a1,4(s11)
	sw	s1,8(s11)

.Lbranch_8000d5bc:
	c.lwsp	ra,188(sp)
	c.lwsp	s0,184(sp)
	c.lwsp	s1,180(sp)
	c.lwsp	s2,176(sp)
	c.lwsp	s3,172(sp)
	c.lwsp	s4,168(sp)
	c.lwsp	s5,164(sp)
	c.lwsp	s6,160(sp)
	c.lwsp	s7,156(sp)
	c.lwsp	s8,152(sp)
	c.lwsp	s9,148(sp)
	c.lwsp	s10,144(sp)
	c.lwsp	s11,140(sp)
	c.addi16sp	sp,192
	c.jr	ra

.Lbranch_8000d5da:
	sw	s7,-184(s0)
	lw	a1,-76(s0)
	lw	a2,-72(s0)
	lw	a3,-68(s0)
	lw	s3,-148(s0)
	lw	a0,0(s3)
	sw	a1,-104(s0)
	sw	a2,-100(s0)
	sw	a3,-96(s0)
	c.li	s7,0
	beq	a0,zero, .Lbranch_8000d880
	c.li	a1,5
	c.li	s11,12
	c.mv	s2,s6

.Lbranch_8000d60a:
	lhu	s1,268(s3)
	c.mv	s10,a0
	sw	s5,-116(s0)
	lw	a0,-144(s0)
	sw	a0,-112(s0)
	sw	s4,-108(s0)
	bne	s7,s8, .Lbranch_8000da18
	lhu	a2,270(s10)
	addi	s9,s8,1
	c.li	a0,11
	bltu	a2,a0, .Lbranch_8000d92c
	addi	s3,s0,-84
	addi	s5,s0,-80
	sw	a2,-148(s0)
	bgeu	s1,a1, .Lbranch_8000d646
	c.li	s4,4
	c.j	 .Lbranch_8000d66e

.Lbranch_8000d646:
	beq	s1,a1, .Lbranch_8000d65e
	c.li	a0,6
	bne	s1,a0, .Lbranch_8000d662
	c.li	s1,0
	addi	s3,s0,-92
	addi	s5,s0,-88
	c.li	s4,5
	c.j	 .Lbranch_8000d66e

.Lbranch_8000d65e:
	c.mv	s4,s1
	c.j	 .Lbranch_8000d66e

.Lbranch_8000d662:
	c.addi	s1,-7
	addi	s3,s0,-92
	addi	s5,s0,-88
	c.li	s4,6

.Lbranch_8000d66e:
	auipc	ra,0xffff6
	jalr	ra,-350(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	c.li	a1,4
	addi	a2,zero,320
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	auipc	ra,0xffff9
	jalr	ra,-1652(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	beq	a0,zero, .Lbranch_8000da0a
	c.mv	s6,a0
	sw	s5,-160(s0)
	sw	s3,-156(s0)
	sw	s1,-152(s0)
	sw	zero,0(a0)
	sh	zero,270(a0)
	xori	a1,s4,-1
	addi	a2,s10,4
	slli	a3,s4,0x2
	slli	a4,s4,0x4
	addi	s5,s10,136
	lhu	a0,270(s10)
	c.sub	a4,a3
	add	a3,a2,a4
	c.add	a4,s5
	c.add	a1,a0
	sh	a1,270(s6)
	c.lw	a5,4(a4)
	c.lw	s1,8(a4)
	c.lw	a4,0(a4)
	lw	s7,8(a3)	# .Lpcrel_hi0+0x4
	lw	s3,0(a3)
	c.lw	a3,4(a3)
	sw	a4,-64(s0)
	sw	a5,-60(s0)
	sw	s1,-56(s0)
	c.li	a4,11
	bltu	a4,a0, .Lbranch_8000d9a2
	bgeu	s4,a0, .Lbranch_8000d9a2
	bgeu	a1,s11, .Lbranch_8000d9b4
	sw	s2,-164(s0)
	c.mv	s2,s10
	sw	a3,-144(s0)
	addi	a3,s4,1
	addi	a0,s6,4
	slli	s8,a3,0x2
	c.slli	a3,0x4
	sub	s10,a3,s8
	c.add	a2,s10
	bltu	a0,a2, .Lbranch_8000d71e
	sub	a3,a0,a2
	c.j	 .Lbranch_8000d722

.Lbranch_8000d71e:
	sub	a3,a2,a0

.Lbranch_8000d722:
	slli	a4,a1,0x2
	c.slli	a1,0x4
	sub	s1,a1,a4
	bltu	a3,s1, .Lbranch_8000d984
	c.mv	a1,a2
	c.mv	a2,s1
	auipc	ra,0xffff9
	jalr	ra,-1620(ra)	# memcpy
	add	a1,s5,s10
	addi	a0,s6,136
	bltu	a0,a1, .Lbranch_8000d74e
	sub	a2,a0,a1
	c.j	 .Lbranch_8000d752

.Lbranch_8000d74e:
	sub	a2,a1,a0

.Lbranch_8000d752:
	c.mv	s5,s3
	c.mv	s3,s2
	bltu	a2,s1, .Lbranch_8000d984
	c.mv	a2,s1
	auipc	ra,0xffff9
	jalr	ra,-1660(ra)	# memcpy
	lw	a0,-64(s0)
	lw	a1,-60(s0)
	lw	a2,-56(s0)
	sh	s4,270(s3)
	sw	a0,-76(s0)
	sw	a1,-72(s0)
	sw	a2,-68(s0)
	c.li	a0,11
	lw	a2,-148(s0)
	bne	a2,a0, .Lbranch_8000d9c8
	lhu	s1,270(s6)
	addi	a1,s1,1
	bgeu	s1,s11, .Lbranch_8000d9da
	sub	a0,a2,s4
	bne	a0,a1, .Lbranch_8000d9ee
	addi	s2,s6,272
	c.add	s8,s3
	addi	a3,s8,272
	bltu	s2,a3, .Lbranch_8000d7b2
	sub	a0,s2,a3
	c.j	 .Lbranch_8000d7b6

.Lbranch_8000d7b2:
	sub	a0,a3,s2

.Lbranch_8000d7b6:
	c.mv	s4,s7
	slli	a2,a1,0x2
	bltu	a0,a2, .Lbranch_8000d984
	c.mv	s7,s9
	c.mv	a0,s2
	c.mv	a1,a3
	auipc	ra,0xffff9
	jalr	ra,-1766(ra)	# memcpy
	beq	s9,zero, .Lbranch_8000da34
	c.li	a0,0

.Lbranch_8000d7d4:
	bgeu	a0,s11, .Lbranch_8000d966
	slli	a1,a0,0x2
	c.add	a1,s2
	c.lw	a1,0(a1)
	sw	s6,0(a1)
	sh	a0,268(a1)
	bgeu	a0,s1, .Lbranch_8000d7f6
	sltu	a1,a0,s1
	c.add	a0,a1
	bgeu	s1,a0, .Lbranch_8000d7d4

.Lbranch_8000d7f6:
	sw	s3,-80(s0)
	sw	s7,-84(s0)
	lw	a0,-76(s0)
	lw	a1,-72(s0)
	lw	a2,-68(s0)
	sw	s6,-88(s0)
	sw	s7,-92(s0)
	lw	a3,-156(s0)
	c.lw	a3,0(a3)
	lw	a4,-160(s0)
	c.lw	a4,0(a4)
	sw	a0,-128(s0)
	sw	a1,-124(s0)
	sw	a2,-120(s0)
	sw	a4,-64(s0)
	sw	a3,-60(s0)
	lw	a0,-152(s0)
	sw	a0,-56(s0)
	addi	a0,s0,-64
	addi	a1,s0,-116
	addi	a2,s0,-104
	lw	a3,-164(s0)
	auipc	ra,0x0
	jalr	ra,602(ra)	# _ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$10insert_fit17he2a7d588f3b8740aE
	lui	a0,0x80000
	beq	s5,a0, .Lbranch_8000d94e
	lw	a1,-128(s0)
	lw	a2,-124(s0)
	lw	a3,-120(s0)
	lw	a0,0(s3)
	sw	a1,-104(s0)
	sw	a2,-100(s0)
	sw	a3,-96(s0)
	c.mv	s2,s6
	c.mv	s8,s7
	c.li	a1,5
	bne	a0,zero, .Lbranch_8000d60a

.Lbranch_8000d880:
	lw	a0,-180(s0)
	lw	s2,0(a0)	# _start
	lw	s1,0(s2)
	beq	s1,zero, .Lbranch_8000da68
	lw	s3,4(s2)
	auipc	ra,0xffff6
	jalr	ra,-900(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	c.li	a1,4
	addi	a2,zero,320
	auipc	ra,0xffff8
	jalr	ra,1894(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	lw	a5,-172(s0)
	lw	a2,-144(s0)
	beq	a0,zero, .Lbranch_8000da0a
	sw	zero,0(a0)
	addi	a1,s3,1
	sh	zero,270(a0)
	sw	s1,272(a0)
	beq	a1,zero, .Lbranch_8000da78
	c.sw	a0,0(s1)
	sh	zero,268(s1)
	sw	a0,0(s2)
	sw	a1,4(s2)
	bne	s7,s3, .Lbranch_8000da88
	c.li	a1,1
	sw	s5,4(a0)
	c.sw	a2,8(a0)
	sw	s4,12(a0)
	lw	a2,-104(s0)
	lw	a3,-100(s0)
	lw	a4,-96(s0)
	sw	a0,0(s6)
	sh	a1,270(a0)
	sw	s6,276(a0)
	sh	a1,268(s6)
	sw	a2,136(a0)
	sw	a3,140(a0)
	sw	a4,144(a0)
	lw	a0,-184(s0)
	c.sw	a0,0(a5)
	lw	a0,-176(s0)
	c.sw	a0,4(a5)
	lw	a0,-168(s0)
	c.sw	a0,8(a5)
	c.j	 .Lbranch_8000d5bc

.Lbranch_8000d92c:
	sw	s10,-140(s0)
	sw	s9,-136(s0)
	sw	s1,-132(s0)
	addi	a0,s0,-140
	addi	a1,s0,-116
	addi	a2,s0,-104
	c.mv	a3,s2
	auipc	ra,0x0
	jalr	ra,350(ra)	# _ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$10insert_fit17he2a7d588f3b8740aE

.Lbranch_8000d94e:
	lw	a0,-172(s0)
	lw	a1,-184(s0)
	c.sw	a1,0(a0)
	lw	a1,-176(s0)
	c.sw	a1,4(a0)
	lw	a1,-168(s0)
	c.sw	a1,8(a0)
	c.j	 .Lbranch_8000d5bc

.Lbranch_8000d966:
	lui	a0,0x8001d
	addi	a0,a0,-1176	# anon.3839376bf29ad69682d1272c1c63f1dd.33.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1296	# anon.3839376bf29ad69682d1272c1c63f1dd.27.llvm.7710812085696039936
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0x4
	jalr	ra,-1300(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000d984:
	lui	a0,0x8001d
	addi	a0,a0,-1892	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.3
	lui	a3,0x8001d
	addi	a3,a3,-1424	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.18
	addi	a1,zero,567
	c.li	a2,0
	auipc	ra,0x4
	jalr	ra,-1330(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000d9a2:
	lui	a0,0x8001c
	addi	a0,a0,1772	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.1
	lui	a3,0x8001d
	addi	a3,a3,-1592	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.9
	c.j	 .Lbranch_8000da4c

.Lbranch_8000d9b4:
	lui	a3,0x8001d
	addi	a3,a3,-1392	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.20
	c.li	a2,11
	c.li	a0,0
	auipc	ra,0x3
	jalr	ra,656(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_8000d9c8:
	lui	a0,0x8001c
	addi	a0,a0,1772	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.1
	lui	a3,0x8001d
	addi	a3,a3,-1512	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.13
	c.j	 .Lbranch_8000da4c

.Lbranch_8000d9da:
	lui	a3,0x8001d
	addi	a3,a3,-1312	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.26
	c.li	a2,12
	c.li	a0,0
	auipc	ra,0x3
	jalr	ra,618(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_8000d9ee:
	lui	a0,0x8001d
	addi	a0,a0,-1480	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.16
	lui	a2,0x8001d
	addi	a2,a2,-1440	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.17
	addi	a1,zero,40
	auipc	ra,0x4
	jalr	ra,-1386(ra)	# _ZN4core9panicking5panic17h3d14d6668f13e962E

.Lbranch_8000da0a:
	c.li	a0,4
	addi	a1,zero,320
	auipc	ra,0x1
	jalr	ra,1152(ra)	# _ZN5alloc5alloc18handle_alloc_error17ha8c62235926f2799E

.Lbranch_8000da18:
	lui	a0,0x8001d
	addi	a0,a0,-1280	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.28
	lui	a2,0x8001d
	addi	a2,a2,-1224	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.29
	addi	a1,zero,53
	auipc	ra,0x4
	jalr	ra,-1428(ra)	# _ZN4core9panicking5panic17h3d14d6668f13e962E

.Lbranch_8000da34:
	auipc	ra,0x0
	jalr	ra,-2044(ra)	# _ZN4core3num7nonzero16NonZero$LT$T$GT$13new_unchecked18precondition_check17h7e2beda38202bdd8E

.Lbranch_8000da3c:
	lui	a0,0x8001c
	addi	a0,a0,1772	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.1
	lui	a3,0x8001d
	addi	a3,a3,-1344	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.24

.Lbranch_8000da4c:
	addi	a1,zero,437
	c.li	a2,0
	auipc	ra,0x4
	jalr	ra,-1514(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000da5a:
	c.li	a0,4
	addi	a1,zero,272
	auipc	ra,0x1
	jalr	ra,1072(ra)	# _ZN5alloc5alloc18handle_alloc_error17ha8c62235926f2799E

.Lbranch_8000da68:
	lui	a0,0x8001d
	addi	a0,a0,-1608	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.5
	auipc	ra,0x3
	jalr	ra,928(ra)	# _ZN4core6option13unwrap_failed17hca83384b1d4f0231E

.Lbranch_8000da78:
	lui	a0,0x8001d
	addi	a0,a0,-1496	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.14
	auipc	ra,0x3
	jalr	ra,912(ra)	# _ZN4core6option13unwrap_failed17hca83384b1d4f0231E

.Lbranch_8000da88:
	lui	a0,0x8001d
	addi	a0,a0,-1576	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.10
	lui	a2,0x8001d
	addi	a2,a2,-1528	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.11
	addi	a1,zero,48
	auipc	ra,0x4
	jalr	ra,-1540(ra)	# _ZN4core9panicking5panic17h3d14d6668f13e962E

	.globl _ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$10insert_fit17he2a7d588f3b8740aE
_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$10insert_fit17he2a7d588f3b8740aE:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.swsp	s11,12(sp)
	c.addi4spn	s0,sp,64
	c.mv	s3,a2
	lw	s7,0(a0)
	lhu	s11,270(s7)
	c.li	a2,11
	bgeu	s11,a2, .Lbranch_8000dc2c
	c.mv	s5,a3
	c.mv	s4,a1
	lw	s8,8(a0)
	addi	a0,s7,4
	addi	s1,s8,1
	slli	a2,s8,0x2
	slli	a1,s8,0x4
	sw	a2,-56(s0)
	sub	s2,a1,a2
	slli	s10,s1,0x2
	add	s6,a0,s2
	sub	s9,s11,s8
	bgeu	s11,s1, .Lbranch_8000db1c
	lw	a0,0(s4)
	lw	a1,4(s4)
	lw	a2,8(s4)
	sw	a0,0(s6)
	sw	a1,4(s6)
	sw	a2,8(s6)
	c.j	 .Lbranch_8000db7c

.Lbranch_8000db1c:
	slli	a1,s1,0x4
	slli	a2,s9,0x2
	slli	a3,s9,0x4
	sw	s9,-64(s0)
	sub	s9,a1,s10
	c.add	a0,s9
	sw	s5,-60(s0)
	sub	s5,a3,a2
	c.mv	a1,s6
	c.mv	a2,s5
	auipc	ra,0xffff8
	jalr	ra,1482(ra)	# memmove
	lw	a0,0(s4)
	lw	a1,4(s4)
	lw	a2,8(s4)
	addi	a3,s7,136
	sw	a0,0(s6)
	sw	a1,4(s6)
	sw	a2,8(s6)
	add	a1,a3,s2
	add	a0,a3,s9
	lw	s9,-64(s0)
	c.mv	a2,s5
	lw	s5,-60(s0)
	auipc	ra,0xffff8
	jalr	ra,1428(ra)	# memmove

.Lbranch_8000db7c:
	addi	s4,s11,1
	c.add	s2,s7
	lw	a0,0(s3)
	lw	a1,4(s3)
	lw	a2,8(s3)
	c.addi	s11,2
	c.addi	s8,2
	sw	a0,136(s2)
	sw	a1,140(s2)
	sw	a2,144(s2)
	addi	s2,s7,272
	bgeu	s8,s11, .Lbranch_8000dbbc
	add	a1,s2,s10
	slli	a0,s8,0x2
	c.add	a0,s2
	slli	a2,s9,0x2
	auipc	ra,0xffff8
	jalr	ra,1364(ra)	# memmove

.Lbranch_8000dbbc:
	c.add	s2,s10
	sw	s5,0(s2)
	sh	s4,270(s7)
	bgeu	s1,s11, .Lbranch_8000dbf0
	c.addi	s9,1
	lw	a0,-56(s0)
	c.add	a0,s7
	addi	a0,a0,276
	c.li	a1,12

.Lbranch_8000dbd8:
	beq	s1,a1, .Lbranch_8000dc0e
	c.lw	a2,0(a0)
	sh	s1,268(a2)
	c.addi	s1,1
	sw	s7,0(a2)
	c.addi	s9,-1
	c.addi	a0,4
	bne	s9,zero, .Lbranch_8000dbd8

.Lbranch_8000dbf0:
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.lwsp	s11,12(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_8000dc0e:
	lui	a0,0x8001d
	addi	a0,a0,-1176	# anon.3839376bf29ad69682d1272c1c63f1dd.33.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1296	# anon.3839376bf29ad69682d1272c1c63f1dd.27.llvm.7710812085696039936
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0x4
	jalr	ra,-1980(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000dc2c:
	lui	a0,0x8001c
	addi	a0,a0,1772	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.1
	lui	a3,0x8001d
	addi	a3,a3,-1344	# .Lanon.3839376bf29ad69682d1272c1c63f1dd.24
	addi	a1,zero,437
	c.li	a2,0
	auipc	ra,0x4
	jalr	ra,-2010(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _ZN5alloc11collections5btree6search142_$LT$impl$u20$alloc..collections..btree..node..NodeRef$LT$BorrowType$C$K$C$V$C$alloc..collections..btree..node..marker..LeafOrInternal$GT$$GT$11search_tree17h359a09dc1034da99E
_ZN5alloc11collections5btree6search142_$LT$impl$u20$alloc..collections..btree..node..NodeRef$LT$BorrowType$C$K$C$V$C$alloc..collections..btree..node..marker..LeafOrInternal$GT$$GT$11search_tree17h359a09dc1034da99E:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.swsp	s11,12(sp)
	c.addi4spn	s0,sp,64
	c.mv	s4,a1
	lhu	s10,270(a1)
	c.li	a1,11
	bltu	a1,s10, .Lbranch_8000dcfc
	c.mv	s2,a2
	c.mv	s3,a0
	lw	s6,4(a3)
	lw	s9,8(a3)
	c.li	s8,1

.Lbranch_8000dc84:
	addi	s1,s4,4
	slli	a0,s10,0x2
	slli	a1,s10,0x4
	sub	s7,a1,a0
	c.li	s11,-1
	c.j	 .Lbranch_8000dcb0

.Lbranch_8000dc98:
	c.addi	s1,12
	slt	a1,zero,a0
	slti	a0,a0,0
	c.sub	a1,a0
	c.addi	s11,1
	andi	a0,a1,255
	c.addi	s7,-12
	bne	a0,s8, .Lbranch_8000dcd4

.Lbranch_8000dcb0:
	beq	s7,zero, .Lbranch_8000dcdc
	lw	s5,8(s1)
	c.mv	a2,s9
	bltu	s9,s5, .Lbranch_8000dcc0
	c.mv	a2,s5

.Lbranch_8000dcc0:
	c.lw	a1,4(s1)
	c.mv	a0,s6
	auipc	ra,0x4
	jalr	ra,-1320(ra)	# memcmp
	c.bnez	a0, .Lbranch_8000dc98
	sub	a0,s9,s5
	c.j	 .Lbranch_8000dc98

.Lbranch_8000dcd4:
	c.beqz	a0, .Lbranch_8000dd10
	bne	s2,zero, .Lbranch_8000dce2
	c.j	 .Lbranch_8000dd0e

.Lbranch_8000dcdc:
	c.mv	s11,s10
	beq	s2,zero, .Lbranch_8000dd0e

.Lbranch_8000dce2:
	c.li	a0,12
	bgeu	s11,a0, .Lbranch_8000dd3e
	c.slli	s11,0x2
	c.add	s4,s11
	lw	s4,272(s4)
	lhu	s10,270(s4)
	c.addi	s2,-1
	c.li	a0,11
	bgeu	a0,s10, .Lbranch_8000dc84

.Lbranch_8000dcfc:
	lui	a0,0x8001c
	addi	a0,a0,1556	# anon.3839376bf29ad69682d1272c1c63f1dd.0.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1208	# anon.3839376bf29ad69682d1272c1c63f1dd.30.llvm.7710812085696039936
	c.j	 .Lbranch_8000dd4e

.Lbranch_8000dd0e:
	c.li	a0,1

.Lbranch_8000dd10:
	sw	a0,0(s3)
	sw	s4,4(s3)
	sw	s2,8(s3)
	sw	s11,12(s3)
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.lwsp	s11,12(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_8000dd3e:
	lui	a0,0x8001d
	addi	a0,a0,-1176	# anon.3839376bf29ad69682d1272c1c63f1dd.33.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1296	# anon.3839376bf29ad69682d1272c1c63f1dd.27.llvm.7710812085696039936

.Lbranch_8000dd4e:
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0x3
	jalr	ra,1812(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _ZN5alloc11collections5btree6search142_$LT$impl$u20$alloc..collections..btree..node..NodeRef$LT$BorrowType$C$K$C$V$C$alloc..collections..btree..node..marker..LeafOrInternal$GT$$GT$11search_tree17h9842314512386161E
_ZN5alloc11collections5btree6search142_$LT$impl$u20$alloc..collections..btree..node..NodeRef$LT$BorrowType$C$K$C$V$C$alloc..collections..btree..node..marker..LeafOrInternal$GT$$GT$11search_tree17h9842314512386161E:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.swsp	s11,12(sp)
	c.addi4spn	s0,sp,64
	c.mv	s4,a1
	lhu	s10,270(a1)
	c.li	a1,11
	bltu	a1,s10, .Lbranch_8000de08
	c.mv	s9,a4
	c.mv	s5,a3
	c.mv	s2,a2
	c.mv	s3,a0
	c.li	s8,1

.Lbranch_8000dd90:
	addi	s1,s4,4
	slli	a0,s10,0x2
	slli	a1,s10,0x4
	sub	s7,a1,a0
	c.li	s11,-1
	c.j	 .Lbranch_8000ddbc

.Lbranch_8000dda4:
	c.addi	s1,12
	slt	a1,zero,a0
	slti	a0,a0,0
	c.sub	a1,a0
	c.addi	s11,1
	andi	a0,a1,255
	c.addi	s7,-12
	bne	a0,s8, .Lbranch_8000dde0

.Lbranch_8000ddbc:
	beq	s7,zero, .Lbranch_8000dde8
	lw	s6,8(s1)
	c.mv	a2,s9
	bltu	s9,s6, .Lbranch_8000ddcc
	c.mv	a2,s6

.Lbranch_8000ddcc:
	c.lw	a1,4(s1)
	c.mv	a0,s5
	auipc	ra,0x4
	jalr	ra,-1588(ra)	# memcmp
	c.bnez	a0, .Lbranch_8000dda4
	sub	a0,s9,s6
	c.j	 .Lbranch_8000dda4

.Lbranch_8000dde0:
	c.beqz	a0, .Lbranch_8000de1c
	bne	s2,zero, .Lbranch_8000ddee
	c.j	 .Lbranch_8000de1a

.Lbranch_8000dde8:
	c.mv	s11,s10
	beq	s2,zero, .Lbranch_8000de1a

.Lbranch_8000ddee:
	c.li	a0,12
	bgeu	s11,a0, .Lbranch_8000de4a
	c.slli	s11,0x2
	c.add	s4,s11
	lw	s4,272(s4)
	lhu	s10,270(s4)
	c.addi	s2,-1
	c.li	a0,11
	bgeu	a0,s10, .Lbranch_8000dd90

.Lbranch_8000de08:
	lui	a0,0x8001c
	addi	a0,a0,1556	# anon.3839376bf29ad69682d1272c1c63f1dd.0.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1208	# anon.3839376bf29ad69682d1272c1c63f1dd.30.llvm.7710812085696039936
	c.j	 .Lbranch_8000de5a

.Lbranch_8000de1a:
	c.li	a0,1

.Lbranch_8000de1c:
	sw	a0,0(s3)
	sw	s4,4(s3)
	sw	s2,8(s3)
	sw	s11,12(s3)
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.lwsp	s11,12(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_8000de4a:
	lui	a0,0x8001d
	addi	a0,a0,-1176	# anon.3839376bf29ad69682d1272c1c63f1dd.33.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1296	# anon.3839376bf29ad69682d1272c1c63f1dd.27.llvm.7710812085696039936

.Lbranch_8000de5a:
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0x3
	jalr	ra,1544(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _ZN5alloc11collections5btree8navigate263_$LT$impl$u20$alloc..collections..btree..node..Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Dying$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$$GT$27deallocating_next_unchecked17h75e80832d5b18af3E
_ZN5alloc11collections5btree8navigate263_$LT$impl$u20$alloc..collections..btree..node..Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Dying$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$$GT$27deallocating_next_unchecked17h75e80832d5b18af3E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a3,0(a1)
	lw	t1,4(a1)
	lw	t0,8(a1)
	lhu	a2,270(a3)
	bgeu	t0,a2, .Lbranch_8000de86
	c.mv	a4,a3
	c.j	 .Lbranch_8000deb6

.Lbranch_8000de86:
	c.li	a6,3
	lui	a7,0x80022
	addi	a7,a7,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE

.Lbranch_8000de90:
	c.lw	a4,0(a3)
	c.beqz	a4, .Lbranch_8000df16
	bgeu	a6,a3, .Lbranch_8000df20
	lhu	t0,268(a3)
	lw	a2,8(a7)
	addi	a5,a3,-4
	c.sw	a2,0(a3)
	sw	a5,8(a7)
	lhu	a2,270(a4)
	c.addi	t1,1
	c.mv	a3,a4
	bgeu	t0,a2, .Lbranch_8000de90

.Lbranch_8000deb6:
	addi	a3,t0,1
	beq	t1,zero, .Lbranch_8000dedc
	c.li	a2,11
	bgeu	t0,a2, .Lbranch_8000def8
	c.slli	a3,0x2
	c.add	a3,a4
	addi	a3,a3,272
	c.mv	a2,t1

.Lbranch_8000dece:
	c.lw	a5,0(a3)
	c.addi	a2,-1
	addi	a3,a5,272
	c.bnez	a2, .Lbranch_8000dece
	c.li	a3,0
	c.j	 .Lbranch_8000dede

.Lbranch_8000dedc:
	c.mv	a5,a4

.Lbranch_8000dede:
	c.sw	a4,0(a0)
	sw	t1,4(a0)
	sw	t0,8(a0)
	c.sw	a5,0(a1)
	sw	zero,4(a1)
	c.sw	a3,8(a1)
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_8000def8:
	lui	a0,0x8001d
	addi	a0,a0,-1176	# anon.3839376bf29ad69682d1272c1c63f1dd.33.llvm.7710812085696039936
	lui	a3,0x8001d
	addi	a3,a3,-1296	# anon.3839376bf29ad69682d1272c1c63f1dd.27.llvm.7710812085696039936
	addi	a1,zero,429
	c.li	a2,0
	auipc	ra,0x3
	jalr	ra,1370(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000df16:
	beq	t1,zero, .Lbranch_8000df30
	addi	a1,zero,320
	c.j	 .Lbranch_8000df34

.Lbranch_8000df20:
	lui	a0,0x80015
	addi	a0,a0,-732	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147
	auipc	ra,0x3
	jalr	ra,1252(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_8000df30:
	addi	a1,zero,272

.Lbranch_8000df34:
	c.li	a2,4
	c.mv	a0,a3
	auipc	ra,0xffff8
	jalr	ra,-80(ra)	# _RNvCs5QKde7ScR4H_7___rustc14___rust_dealloc
	lui	a0,0x8001d
	addi	a0,a0,-1192	# anon.3839376bf29ad69682d1272c1c63f1dd.32.llvm.7710812085696039936
	auipc	ra,0x3
	jalr	ra,-312(ra)	# _ZN4core6option13unwrap_failed17hca83384b1d4f0231E

	.globl _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef16c130349d2d16E
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef16c130349d2d16E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a2,0(a0)
	c.lw	a0,4(a2)
	c.lw	a2,8(a2)
	c.mv	a3,a1
	c.mv	a1,a2
	c.mv	a2,a3
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	auipc	t1,0x1
	jalr	zero,238(t1)	# _ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hcce0c7f94e6b173dE
	# ... (zero-filled gap)

	.globl _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6545979525451930E
_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6545979525451930E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.lw	a2,0(a0)
	c.lw	a0,4(a2)
	c.lw	a2,8(a2)
	c.mv	a3,a1
	c.mv	a1,a2
	c.mv	a2,a3
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	auipc	t1,0x1
	jalr	zero,1170(t1)	# _ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h1caa923a37cafdf4E
	# ... (zero-filled gap)

	.globl _ZN4core3str21_$LT$impl$u20$str$GT$12trim_matches17he6e51be3559aff03E
_ZN4core3str21_$LT$impl$u20$str$GT$12trim_matches17he6e51be3559aff03E:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.swsp	s1,36(sp)
	c.swsp	s2,32(sp)
	c.swsp	s3,28(sp)
	c.swsp	s4,24(sp)
	c.swsp	s5,20(sp)
	c.swsp	s6,16(sp)
	c.swsp	s7,12(sp)
	c.swsp	s8,8(sp)
	c.swsp	s9,4(sp)
	c.swsp	s10,0(sp)
	c.addi4spn	s0,sp,48
	add	a3,a0,a1
	c.li	s7,0
	beq	a1,zero, .Lbranch_8000e0d8
	c.li	s5,27
	lui	s2,0xffef0
	c.li	a6,5
	addi	a7,zero,32
	addi	t0,zero,128
	c.li	t1,31
	lui	t2,0x8001d
	addi	t2,t2,568	# _ZN4core7unicode12unicode_data11white_space14WHITESPACE_MAP17hfceed124337e8aabE
	c.li	t3,22
	c.lui	a2,0x1
	addi	t4,zero,48
	c.lui	t5,0x3
	addi	t6,zero,223
	c.slli	s5,0xb
	addi	s8,s2,2047	# __heap_end+0x7fbf07ff
	addi	s3,a2,1664	# .Lline_table_start0+0x1680
	addi	s4,zero,239
	c.mv	a2,a0
	c.j	 .Lbranch_8000e00a

.Lbranch_8000dff8:
	andi	a4,a5,255
	c.add	a4,t2
	lbu	a4,0(a4)
	c.andi	a4,2
	c.beqz	a4, .Lbranch_8000e0dc

.Lbranch_8000e006:
	beq	a2,a3, .Lbranch_8000e0d2

.Lbranch_8000e00a:
	c.mv	a4,a2
	lb	s1,0(a2)
	c.mv	s6,s7
	c.addi	a2,1
	andi	a5,s1,255
	bge	s1,zero, .Lbranch_8000e07c
	beq	a2,a3, .Lbranch_8000e274
	lbu	s1,1(a4)
	andi	s9,a5,31
	addi	a2,a4,2
	andi	s1,s1,63
	bgeu	t6,a5, .Lbranch_8000e06e
	beq	a2,a3, .Lbranch_8000e294
	lbu	s7,2(a4)
	addi	a2,a4,3
	slli	s10,s1,0x6
	andi	s1,s7,63
	or	s7,s10,s1
	bgeu	s4,a5, .Lbranch_8000e076
	beq	a2,a3, .Lbranch_8000e2b4
	addi	a2,a4,4
	lbu	a5,3(a4)
	c.slli	s9,0x1d
	srli	s1,s9,0xb
	c.slli	s7,0x6
	andi	a5,a5,63
	or	a5,s7,a5
	c.j	 .Lbranch_8000e072

.Lbranch_8000e06e:
	slli	a5,s9,0x6

.Lbranch_8000e072:
	c.or	a5,s1
	c.j	 .Lbranch_8000e07c

.Lbranch_8000e076:
	c.slli	s9,0xc
	or	a5,s7,s9

.Lbranch_8000e07c:
	xor	s1,a5,s5
	c.add	s1,s2
	bgeu	s8,s1, .Lbranch_8000e238
	bltu	a3,a2, .Lbranch_8000e21a
	sub	s7,a2,a4
	addi	a4,a5,-9
	c.add	s7,s6
	bltu	a4,a6, .Lbranch_8000e006
	beq	a5,a7, .Lbranch_8000e006
	bltu	a5,t0, .Lbranch_8000e0dc
	srli	a4,a5,0x8
	blt	t1,a4, .Lbranch_8000e0b4
	c.beqz	a4, .Lbranch_8000e0c2
	bne	a4,t3, .Lbranch_8000e0dc
	beq	a5,s3, .Lbranch_8000e006
	c.j	 .Lbranch_8000e0dc

.Lbranch_8000e0b4:
	beq	a4,a7, .Lbranch_8000dff8
	bne	a4,t4, .Lbranch_8000e0dc
	beq	a5,t5, .Lbranch_8000e006
	c.j	 .Lbranch_8000e0dc

.Lbranch_8000e0c2:
	andi	a4,a5,255
	c.add	a4,t2
	lbu	a4,0(a4)
	c.andi	a4,1
	c.bnez	a4, .Lbranch_8000e006
	c.j	 .Lbranch_8000e0dc

.Lbranch_8000e0d2:
	c.li	s6,0
	c.li	s7,0
	c.j	 .Lbranch_8000e1f0

.Lbranch_8000e0d8:
	c.li	s6,0
	c.mv	a2,a0

.Lbranch_8000e0dc:
	bltu	a3,a2, .Lbranch_8000e21a
	beq	a2,a3, .Lbranch_8000e1f0
	c.li	s2,27
	lui	a6,0xffef0
	c.li	a7,5
	addi	t0,zero,32
	addi	t1,zero,128
	c.li	t2,31
	lui	t3,0x8001d
	addi	t3,t3,568	# _ZN4core7unicode12unicode_data11white_space14WHITESPACE_MAP17hfceed124337e8aabE
	c.li	t4,22
	c.lui	a4,0x1
	addi	t5,zero,48
	c.lui	t6,0x3
	c.slli	s2,0xb
	addi	s5,a6,2047	# __heap_end+0x7fbf07ff
	addi	s3,a4,1664	# .Lline_table_start0+0x1680
	addi	s4,zero,-64
	c.j	 .Lbranch_8000e12a

.Lbranch_8000e118:
	andi	a4,s1,255
	c.add	a4,t3
	lbu	a4,0(a4)
	c.andi	a4,2
	c.beqz	a4, .Lbranch_8000e1ea

.Lbranch_8000e126:
	beq	a2,a3, .Lbranch_8000e1f0

.Lbranch_8000e12a:
	c.mv	a5,a3
	lb	a4,-1(a3)
	c.addi	a3,-1
	andi	s1,a4,255
	bge	a4,zero, .Lbranch_8000e19c
	beq	a2,a3, .Lbranch_8000e284
	lb	s10,-2(a5)
	addi	a3,a5,-2
	bge	s10,s4, .Lbranch_8000e17c
	beq	a2,a3, .Lbranch_8000e2a4
	lb	s8,-3(a5)
	addi	a3,a5,-3
	bge	s8,s4, .Lbranch_8000e182
	beq	a2,a3, .Lbranch_8000e2c4
	lbu	s9,-4(a5)
	andi	s8,s8,255
	addi	a3,a5,-4
	andi	a4,s9,7
	slli	s9,a4,0x6
	andi	a4,s8,63
	or	s8,s9,a4
	c.j	 .Lbranch_8000e186

.Lbranch_8000e17c:
	andi	a4,s10,31
	c.j	 .Lbranch_8000e194

.Lbranch_8000e182:
	andi	s8,s8,15

.Lbranch_8000e186:
	andi	a4,s10,255
	c.slli	s8,0x6
	andi	a4,a4,63
	or	a4,s8,a4

.Lbranch_8000e194:
	c.slli	a4,0x6
	andi	s1,s1,63
	c.or	s1,a4

.Lbranch_8000e19c:
	xor	a4,s1,s2
	c.add	a4,a6
	bgeu	s5,a4, .Lbranch_8000e238
	bltu	a3,a2, .Lbranch_8000e21a
	addi	a4,s1,-9
	bltu	a4,a7, .Lbranch_8000e126
	beq	s1,t0, .Lbranch_8000e126
	bltu	s1,t1, .Lbranch_8000e1ea
	srli	a4,s1,0x8
	blt	t2,a4, .Lbranch_8000e1ce
	c.beqz	a4, .Lbranch_8000e1dc
	bne	a4,t4, .Lbranch_8000e1ea
	beq	s1,s3, .Lbranch_8000e126
	c.j	 .Lbranch_8000e1ea

.Lbranch_8000e1ce:
	beq	a4,t0, .Lbranch_8000e118
	bne	a4,t5, .Lbranch_8000e1ea
	beq	s1,t6, .Lbranch_8000e126
	c.j	 .Lbranch_8000e1ea

.Lbranch_8000e1dc:
	andi	a4,s1,255
	c.add	a4,t3
	lbu	a4,0(a4)
	c.andi	a4,1
	c.bnez	a4, .Lbranch_8000e126

.Lbranch_8000e1ea:
	sub	s7,s7,a2
	c.add	s7,a5

.Lbranch_8000e1f0:
	bltu	s7,s6, .Lbranch_8000e256
	bltu	a1,s7, .Lbranch_8000e256
	sub	a1,s7,s6
	c.add	a0,s6
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.lwsp	s4,24(sp)
	c.lwsp	s5,20(sp)
	c.lwsp	s6,16(sp)
	c.lwsp	s7,12(sp)
	c.lwsp	s8,8(sp)
	c.lwsp	s9,4(sp)
	c.lwsp	s10,0(sp)
	c.addi16sp	sp,48
	c.jr	ra

.Lbranch_8000e21a:
	lui	a0,0x8001d
	addi	a0,a0,-708	# anon.20b29b1f91e363e9fbd85f55f7c77062.4.llvm.14406403243838317486
	lui	a3,0x8001d
	addi	a3,a3,-740	# anon.20b29b1f91e363e9fbd85f55f7c77062.1.llvm.14406403243838317486
	addi	a1,zero,403
	c.li	a2,0
	auipc	ra,0x3
	jalr	ra,568(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000e238:
	lui	a0,0x8001d
	addi	a0,a0,-172	# anon.20b29b1f91e363e9fbd85f55f7c77062.15.llvm.14406403243838317486
	lui	a3,0x8001d
	addi	a3,a3,-724	# anon.20b29b1f91e363e9fbd85f55f7c77062.3.llvm.14406403243838317486
	addi	a1,zero,349
	c.li	a2,0
	auipc	ra,0x3
	jalr	ra,538(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000e256:
	lui	a0,0x8001d
	addi	a0,a0,-392	# anon.20b29b1f91e363e9fbd85f55f7c77062.14.llvm.14406403243838317486
	lui	a3,0x8001d
	addi	a3,a3,-408	# anon.20b29b1f91e363e9fbd85f55f7c77062.13.llvm.14406403243838317486
	addi	a1,zero,439
	c.li	a2,0
	auipc	ra,0x3
	jalr	ra,508(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_8000e274:
	lui	a0,0x8001d
	addi	a0,a0,-504	# .Lanon.20b29b1f91e363e9fbd85f55f7c77062.6
	auipc	ra,0x0
	jalr	ra,88(ra)	# _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE.llvm.14406403243838317486

.Lbranch_8000e284:
	lui	a0,0x8001d
	addi	a0,a0,-456	# anon.20b29b1f91e363e9fbd85f55f7c77062.9.llvm.14406403243838317486
	auipc	ra,0x0
	jalr	ra,72(ra)	# _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE.llvm.14406403243838317486

.Lbranch_8000e294:
	lui	a0,0x8001d
	addi	a0,a0,-488	# .Lanon.20b29b1f91e363e9fbd85f55f7c77062.7
	auipc	ra,0x0
	jalr	ra,56(ra)	# _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE.llvm.14406403243838317486

.Lbranch_8000e2a4:
	lui	a0,0x8001d
	addi	a0,a0,-440	# anon.20b29b1f91e363e9fbd85f55f7c77062.10.llvm.14406403243838317486
	auipc	ra,0x0
	jalr	ra,40(ra)	# _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE.llvm.14406403243838317486

.Lbranch_8000e2b4:
	lui	a0,0x8001d
	addi	a0,a0,-472	# .Lanon.20b29b1f91e363e9fbd85f55f7c77062.8
	auipc	ra,0x0
	jalr	ra,24(ra)	# _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE.llvm.14406403243838317486

.Lbranch_8000e2c4:
	lui	a0,0x8001d
	addi	a0,a0,-424	# anon.20b29b1f91e363e9fbd85f55f7c77062.11.llvm.14406403243838317486
	auipc	ra,0x0
	jalr	ra,8(ra)	# _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE.llvm.14406403243838317486

	.globl _ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE.llvm.14406403243838317486
_ZN4core4hint21unreachable_unchecked18precondition_check17h3a8d88aaac82042dE.llvm.14406403243838317486:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a3,a0
	lui	a0,0x8001d
	addi	a0,a0,4	# anon.20b29b1f91e363e9fbd85f55f7c77062.16.llvm.14406403243838317486
	addi	a1,zero,399
	c.li	a2,0
	auipc	ra,0x3
	jalr	ra,380(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _RNvCs5QKde7ScR4H_7___rustc25___rdl_alloc_error_handler
_RNvCs5QKde7ScR4H_7___rustc25___rdl_alloc_error_handler:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.addi4spn	s0,sp,32
	sw	a0,-20(s0)
	addi	a0,s0,-20
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	sw	a0,-16(s0)
	sw	a1,-12(s0)
	lui	a0,0x80012
	addi	a0,a0,812	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x1ac
	lui	a3,0x8001d
	addi	a3,a3,204	# .Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.2
	addi	a1,s0,-16
	c.li	a2,0
	auipc	ra,0x3
	jalr	ra,318(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _ZN4core3fmt5Write9write_fmt17h5837dfebac660a58E
_ZN4core3fmt5Write9write_fmt17h5837dfebac660a58E:
	c.mv	a3,a2
	c.mv	a2,a1
	lui	a1,0x8001d
	addi	a1,a1,228	# .Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.15
	auipc	t1,0x1
	jalr	zero,1232(t1)	# _ZN4core3fmt5write17h8a27c002649b254aE

	.globl _ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hc1ea1e4b1b86caefE
_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hc1ea1e4b1b86caefE:
	c.lw	a1,0(a0)
	c.beqz	a1, .Lbranch_8000e358
	c.lw	a0,4(a0)
	c.li	a2,1
	auipc	t1,0xffff8
	jalr	zero,-1128(t1)	# _RNvCs5QKde7ScR4H_7___rustc14___rust_dealloc

.Lbranch_8000e358:
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h435b302e851521a4E
_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h435b302e851521a4E:
	lui	a3,0x8001d
	addi	a3,a3,220	# .Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.7
	c.li	a2,5
	c.mv	a0,a1
	c.mv	a1,a3
	auipc	t1,0x2
	jalr	zero,-978(t1)	# _ZN4core3fmt9Formatter9write_str17h294a432de2db79d0E
	# ... (zero-filled gap)

	.globl _ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17hdfd810ffb64284f4E
_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17hdfd810ffb64284f4E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.swsp	s5,4(sp)
	c.addi4spn	s0,sp,32
	c.lw	s1,8(a0)
	addi	a2,zero,128
	srli	s4,a1,0xb
	bgeu	a1,a2, .Lbranch_8000e398
	c.li	s2,1
	c.j	 .Lbranch_8000e3aa

.Lbranch_8000e398:
	bne	s4,zero, .Lbranch_8000e3a0
	c.li	s2,2
	c.j	 .Lbranch_8000e3aa

.Lbranch_8000e3a0:
	srli	a2,a1,0x10
	sltu	s2,zero,a2
	c.addi	s2,3

.Lbranch_8000e3aa:
	c.lw	a2,0(a0)
	sub	a3,a2,s1
	c.mv	a2,s1
	bltu	a3,s2, .Lbranch_8000e3c8
	c.lw	a3,4(a0)
	addi	a4,zero,128
	c.add	a2,a3
	bgeu	a1,a4, .Lbranch_8000e3ee

.Lbranch_8000e3c2:
	sb	a1,0(a2)
	c.j	 .Lbranch_8000e44e

.Lbranch_8000e3c8:
	c.mv	s3,a0
	c.mv	s5,a1
	c.mv	a1,s1
	c.mv	a2,s2
	auipc	ra,0x1
	jalr	ra,-1144(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E
	c.mv	a1,s5
	c.mv	a0,s3
	lw	a2,8(s3)
	lw	a3,4(s3)
	addi	a4,zero,128
	c.add	a2,a3
	bltu	s5,a4, .Lbranch_8000e3c2

.Lbranch_8000e3ee:
	andi	a3,a1,63
	addi	a3,a3,-128
	srli	a4,a1,0x6
	bne	s4,zero, .Lbranch_8000e40c
	ori	a1,a4,192
	sb	a1,0(a2)
	sb	a3,1(a2)
	c.j	 .Lbranch_8000e44e

.Lbranch_8000e40c:
	andi	a4,a4,63
	srli	a5,a1,0x10
	addi	a6,a4,-128
	srli	a4,a1,0xc
	c.bnez	a5, .Lbranch_8000e430
	ori	a1,a4,224
	sb	a1,0(a2)
	sb	a6,1(a2)
	sb	a3,2(a2)
	c.j	 .Lbranch_8000e44e

.Lbranch_8000e430:
	andi	a4,a4,63
	c.srli	a1,0x12
	addi	a4,a4,-128
	ori	a1,a1,-16
	sb	a1,0(a2)
	sb	a4,1(a2)
	sb	a6,2(a2)
	sb	a3,3(a2)

.Lbranch_8000e44e:
	c.add	s1,s2
	c.sw	s1,8(a0)
	c.li	a0,0
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.lwsp	s5,4(sp)
	c.addi16sp	sp,32
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h133c13b84c03ed11E
_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h133c13b84c03ed11E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.addi4spn	s0,sp,32
	c.mv	s2,a2
	c.mv	s1,a0
	c.lw	a0,0(a0)
	lw	s3,8(s1)
	sub	a0,a0,s3
	bltu	a0,a2, .Lbranch_8000e4b0

.Lbranch_8000e48a:
	c.lw	a0,4(s1)
	c.add	a0,s3
	c.mv	a2,s2
	auipc	ra,0xffff8
	jalr	ra,-944(ra)	# memcpy
	c.add	s2,s3
	sw	s2,8(s1)
	c.li	a0,0
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_8000e4b0:
	c.mv	a0,s1
	c.mv	s4,a1
	c.mv	a1,s3
	c.mv	a2,s2
	auipc	ra,0x1
	jalr	ra,-1376(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E
	c.mv	a1,s4
	lw	s3,8(s1)
	c.j	 .Lbranch_8000e48a

	.globl _ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE
_ZN5alloc3fmt6format12format_inner17h375f6ad4b1b6c28cE:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.swsp	s1,36(sp)
	c.swsp	s2,32(sp)
	c.swsp	s3,28(sp)
	c.swsp	s4,24(sp)
	c.swsp	s5,20(sp)
	c.addi4spn	s0,sp,48
	c.mv	s4,a2
	c.mv	s3,a1
	andi	a1,a2,1
	c.mv	s2,a0
	c.bnez	a1, .Lbranch_8000e552
	lbu	a2,0(s3)
	c.beqz	a2, .Lbranch_8000e57e
	c.li	a0,0
	c.li	s1,0
	addi	a1,zero,128
	c.mv	a3,s3
	c.j	 .Lbranch_8000e502

.Lbranch_8000e4f8:
	c.add	s1,a4
	c.add	a3,a4

.Lbranch_8000e4fc:
	lbu	a2,0(a3)
	c.beqz	a2, .Lbranch_8000e558

.Lbranch_8000e502:
	c.addi	a3,1
	slli	a5,a2,0x18
	andi	a4,a2,255
	bge	a5,zero, .Lbranch_8000e4f8
	bne	a4,a1, .Lbranch_8000e52a
	lbu	a2,1(a3)
	lbu	a4,0(a3)
	c.slli	a2,0x8
	c.or	a2,a4
	c.add	s1,a2
	c.add	a2,a3
	addi	a3,a2,2
	c.j	 .Lbranch_8000e4fc

.Lbranch_8000e52a:
	sltiu	a4,s1,1
	slli	a5,a2,0x1f
	c.or	a0,a4
	andi	a4,a2,2
	c.slli	a4,0x1d
	c.or	a4,a5
	srli	a5,a2,0x1
	c.srli	a2,0x2
	c.andi	a5,2
	c.andi	a2,2
	c.add	a3,a5
	c.srli	a4,0x1d
	c.add	a2,a3
	add	a3,a2,a4
	c.j	 .Lbranch_8000e4fc

.Lbranch_8000e552:
	srli	s1,s4,0x1
	c.j	 .Lbranch_8000e562

.Lbranch_8000e558:
	sltiu	a1,s1,16
	c.and	a0,a1
	c.beqz	a0, .Lbranch_8000e5d2
	c.li	s1,0

.Lbranch_8000e562:
	c.beqz	s1, .Lbranch_8000e580
	auipc	ra,0xffff5
	jalr	ra,-84(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	c.li	a1,1
	c.li	s5,1
	c.mv	a0,s1
	auipc	ra,0xffff8
	jalr	ra,-1754(ra)	# _RNvCs5QKde7ScR4H_7___rustc12___rust_alloc
	c.bnez	a0, .Lbranch_8000e582
	c.j	 .Lbranch_8000e5da

.Lbranch_8000e57e:
	c.li	s1,0

.Lbranch_8000e580:
	c.li	a0,1

.Lbranch_8000e582:
	sw	s1,-44(s0)
	sw	a0,-40(s0)
	sw	zero,-36(s0)
	lui	a1,0x8001d
	addi	a1,a1,228	# .Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.15
	addi	a0,s0,-44
	c.mv	a2,s3
	c.mv	a3,s4
	auipc	ra,0x1
	jalr	ra,626(ra)	# _ZN4core3fmt5write17h8a27c002649b254aE
	c.bnez	a0, .Lbranch_8000e5e6
	lw	a0,-44(s0)
	lw	a1,-40(s0)
	lw	a2,-36(s0)
	sw	a0,0(s2)
	sw	a1,4(s2)
	sw	a2,8(s2)
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.lwsp	s4,24(sp)
	c.lwsp	s5,20(sp)
	c.addi16sp	sp,48
	c.jr	ra

.Lbranch_8000e5d2:
	c.slli	s1,0x1
	bge	s1,zero, .Lbranch_8000e562
	c.li	s5,0

.Lbranch_8000e5da:
	c.mv	a0,s5
	c.mv	a1,s1
	auipc	ra,0x1
	jalr	ra,-1846(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_8000e5e6:
	lui	a0,0x8001d
	addi	a0,a0,268	# .Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.17
	lui	a3,0x8001d
	addi	a3,a3,252	# .Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.16
	lui	a4,0x8001d
	addi	a4,a4,356	# .Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.19
	addi	a1,zero,86
	addi	a2,s0,-29
	auipc	ra,0x3
	jalr	ra,-2006(ra)	# _ZN4core6result13unwrap_failed17h6de2f979be0b0c8dE
	# ... (zero-filled gap)

	.globl _ZN5alloc3str21_$LT$impl$u20$str$GT$12to_uppercase17hec0b0999f9b1c5ebE
_ZN5alloc3str21_$LT$impl$u20$str$GT$12to_uppercase17hec0b0999f9b1c5ebE:
	c.addi16sp	sp,-96
	c.swsp	ra,92(sp)
	c.swsp	s0,88(sp)
	c.swsp	s1,84(sp)
	c.swsp	s2,80(sp)
	c.swsp	s3,76(sp)
	c.swsp	s4,72(sp)
	c.swsp	s5,68(sp)
	c.swsp	s6,64(sp)
	c.swsp	s7,60(sp)
	c.swsp	s8,56(sp)
	c.swsp	s9,52(sp)
	c.swsp	s10,48(sp)
	c.swsp	s11,44(sp)
	c.addi4spn	s0,sp,96
	c.mv	s7,a2
	bge	a2,zero, .Lbranch_8000e642
	c.li	s1,0

.Lbranch_8000e636:
	c.mv	a0,s1
	c.mv	a1,s7
	auipc	ra,0x1
	jalr	ra,-1938(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_8000e642:
	sw	a0,-80(s0)
	beq	s7,zero, .Lbranch_8000e8aa
	c.mv	s4,a1
	auipc	ra,0xffff5
	jalr	ra,-316(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	c.li	a1,1
	c.li	s1,1
	c.mv	a0,s7
	auipc	ra,0xffff8
	jalr	ra,-1986(ra)	# _RNvCs5QKde7ScR4H_7___rustc12___rust_alloc
	c.beqz	a0, .Lbranch_8000e636
	c.mv	s3,a0
	c.li	a0,16
	bltu	s7,a0, .Lbranch_8000e8b0
	c.li	t1,0
	lui	a0,0x80000
	c.addi	a0,-16	# .Lline_table_start1+0x7ffb3e9b
	and	a0,s7,a0
	sw	a0,-88(s0)
	sw	s7,-84(s0)
	c.mv	s6,s7

.Lbranch_8000e682:
	add	a3,s4,t1
	lbu	s5,0(a3)
	lbu	s2,1(a3)
	lbu	t0,2(a3)
	lbu	a7,3(a3)
	lbu	a6,4(a3)
	lbu	ra,5(a3)
	lbu	s11,6(a3)
	lbu	s10,7(a3)
	lbu	s9,8(a3)
	lbu	s8,9(a3)
	lbu	s7,10(a3)
	lbu	t6,11(a3)
	lbu	t5,12(a3)
	lbu	t4,13(a3)
	lbu	t3,14(a3)
	lbu	t2,15(a3)
	xori	a5,s5,-1
	xori	a1,s2,-1
	xori	a4,t0,-1
	xori	s1,a7,-1
	xori	a0,a6,-1
	xori	a2,ra,-1
	c.slli	a5,0x18
	c.slli	a1,0x18
	c.srli	a5,0x1f
	c.srli	a1,0x1f
	c.add	a1,a5
	xori	a5,s10,-1
	c.slli	a4,0x18
	c.slli	s1,0x18
	c.srli	a4,0x1f
	c.srli	s1,0x1f
	c.add	a4,s1
	xori	s1,s9,-1
	c.slli	a0,0x18
	c.slli	a2,0x18
	c.srli	a0,0x1f
	c.srli	a2,0x1f
	c.add	a0,a2
	xori	a2,t6,-1
	c.slli	a5,0x18
	c.slli	s1,0x18
	c.srli	a5,0x1f
	c.srli	s1,0x1f
	c.add	a5,s1
	xori	s1,t5,-1
	c.slli	a2,0x18
	c.slli	s1,0x18
	c.srli	a2,0x1f
	c.srli	s1,0x1f
	c.add	a2,s1
	c.add	a1,a4
	xori	a4,s11,-1
	c.slli	a4,0x18
	c.srli	a4,0x1f
	c.add	a0,a4
	xori	a4,s8,-1
	c.slli	a4,0x18
	c.srli	a4,0x1f
	c.add	a4,a5
	xori	a5,t4,-1
	c.slli	a5,0x18
	c.srli	a5,0x1f
	c.add	a2,a5
	c.add	a0,a1
	xori	a1,s7,-1
	c.slli	a1,0x18
	c.srli	a1,0x1f
	c.add	a1,a4
	xori	a4,t3,-1
	c.slli	a4,0x18
	c.srli	a4,0x1f
	c.add	a2,a4
	c.add	a0,a1
	xori	a1,t2,-1
	c.slli	a1,0x18
	c.srli	a1,0x1f
	c.add	a1,a2
	c.add	a0,a1
	andi	a0,a0,255
	add	a5,s3,t1
	c.li	a1,16
	bne	a0,a1, .Lbranch_8000e8b8
	addi	a0,s5,-97
	sltiu	a0,a0,26
	c.slli	a0,0x5
	xor	s5,a0,s5
	addi	a0,s2,-97
	sltiu	a0,a0,26
	c.slli	a0,0x5
	xor	s2,a0,s2
	addi	a1,t0,-97
	sltiu	a1,a1,26
	c.slli	a1,0x5
	xor	t0,a1,t0
	addi	a1,a7,-97
	sltiu	a1,a1,26
	c.slli	a1,0x5
	xor	a7,a1,a7
	addi	a1,a6,-97
	sltiu	a1,a1,26
	c.slli	a1,0x5
	xor	a6,a1,a6
	addi	a2,ra,-97
	sltiu	a2,a2,26
	c.slli	a2,0x5
	xor	ra,a2,ra
	addi	a2,s11,-97
	sltiu	a2,a2,26
	c.slli	a2,0x5
	xor	s11,a2,s11
	addi	a0,s10,-97
	sltiu	a0,a0,26
	c.slli	a0,0x5
	xor	s10,a0,s10
	addi	a3,s9,-97
	sltiu	a3,a3,26
	c.slli	a3,0x5
	xor	s9,a3,s9
	addi	a4,s8,-97
	sltiu	a4,a4,26
	c.slli	a4,0x5
	xor	s8,a4,s8
	addi	a1,s7,-97
	sltiu	a1,a1,26
	c.slli	a1,0x5
	xor	a1,a1,s7
	addi	s1,t6,-97	# .Lline_table_start0+0x2f9f
	sltiu	s1,s1,26
	c.slli	s1,0x5
	xor	s1,s1,t6
	addi	a2,t5,-97	# .Lline_table_start0+0x2f9f
	sltiu	a2,a2,26
	c.slli	a2,0x5
	xor	a2,a2,t5
	addi	a0,t4,-97
	sltiu	a0,a0,26
	c.slli	a0,0x5
	xor	a0,a0,t4
	addi	a3,t3,-97
	sltiu	a3,a3,26
	c.slli	a3,0x5
	xor	a3,a3,t3
	addi	a4,t2,-97
	c.addi	s6,-16
	sltiu	a4,a4,26
	c.slli	a4,0x5
	xor	a4,a4,t2
	sb	s5,0(a5)
	sb	s2,1(a5)
	sb	t0,2(a5)
	sb	a7,3(a5)
	sb	a6,4(a5)
	sb	ra,5(a5)
	sb	s11,6(a5)
	sb	s10,7(a5)
	sb	s9,8(a5)
	sb	s8,9(a5)
	sb	a1,10(a5)
	sb	s1,11(a5)
	sb	a2,12(a5)
	sb	a0,13(a5)
	sb	a3,14(a5)
	sb	a4,15(a5)
	c.addi	t1,16
	c.li	a0,15
	bltu	a0,s6, .Lbranch_8000e682
	lw	s7,-84(s0)
	bne	s7,t1, .Lbranch_8000e8c2
	lw	a2,-88(s0)
	c.j	 .Lbranch_8000e8f8

.Lbranch_8000e8aa:
	c.li	a2,0
	c.li	s3,1
	c.j	 .Lbranch_8000e8f8

.Lbranch_8000e8b0:
	c.li	s5,0
	c.mv	a5,s3
	c.mv	s6,s7
	c.j	 .Lbranch_8000e8cc

.Lbranch_8000e8b8:
	c.mv	s5,t1
	c.mv	s4,a3
	lw	s7,-84(s0)
	c.j	 .Lbranch_8000e8cc

.Lbranch_8000e8c2:
	add	a5,s3,t1
	c.add	s4,t1
	lw	s5,-88(s0)

.Lbranch_8000e8cc:
	add	a2,s6,s5

.Lbranch_8000e8d0:
	lb	a0,0(s4)
	blt	a0,zero, .Lbranch_8000e938
	andi	a0,a0,255
	c.addi	s5,1
	c.addi	s6,-1
	c.addi	s4,1
	addi	a1,a0,-97
	sltiu	a1,a1,26
	c.slli	a1,0x5
	c.xor	a0,a1
	sb	a0,0(a5)
	c.addi	a5,1
	bne	s6,zero, .Lbranch_8000e8d0

.Lbranch_8000e8f8:
	sw	s7,-76(s0)
	sw	s3,-72(s0)
	sw	a2,-68(s0)

.Lbranch_8000e904:
	lw	a0,-76(s0)
	lw	a1,-72(s0)
	lw	a2,-68(s0)
	lw	a3,-80(s0)
	c.sw	a0,0(a3)
	c.sw	a1,4(a3)
	c.sw	a2,8(a3)
	c.lwsp	ra,92(sp)
	c.lwsp	s0,88(sp)
	c.lwsp	s1,84(sp)
	c.lwsp	s2,80(sp)
	c.lwsp	s3,76(sp)
	c.lwsp	s4,72(sp)
	c.lwsp	s5,68(sp)
	c.lwsp	s6,64(sp)
	c.lwsp	s7,60(sp)
	c.lwsp	s8,56(sp)
	c.lwsp	s9,52(sp)
	c.lwsp	s10,48(sp)
	c.lwsp	s11,44(sp)
	c.addi16sp	sp,96
	c.jr	ra

.Lbranch_8000e938:
	sw	s7,-76(s0)
	sw	s3,-72(s0)
	sw	s5,-68(s0)
	c.add	s6,s4
	addi	s7,zero,128
	addi	s8,zero,224
	c.j	 .Lbranch_8000e95e

.Lbranch_8000e950:
	sb	s11,0(a0)

.Lbranch_8000e954:
	c.add	s5,s1

.Lbranch_8000e956:
	sw	s5,-68(s0)
	beq	s4,s6, .Lbranch_8000e904

.Lbranch_8000e95e:
	lb	a0,0(s4)
	andi	a1,a0,255
	blt	a0,zero, .Lbranch_8000e994
	c.addi	s4,1
	addi	a0,s0,-64
	auipc	ra,0x2
	jalr	ra,1304(ra)	# _ZN4core7unicode12unicode_data11conversions8to_upper17h7d08e96f3cc49c4fE
	lw	s10,-60(s0)
	beq	s10,zero, .Lbranch_8000ea10

.Lbranch_8000e980:
	lw	s11,-56(s0)
	lw	s9,-64(s0)
	beq	s11,zero, .Lbranch_8000e9e2
	bgeu	s9,s7, .Lbranch_8000e9ea
	c.li	s1,1
	c.j	 .Lbranch_8000ea3a

.Lbranch_8000e994:
	lbu	a2,1(s4)
	andi	a0,a1,31
	andi	a2,a2,63
	bltu	a1,s8, .Lbranch_8000e9f4
	lbu	a3,2(s4)
	c.slli	a2,0x6
	andi	a3,a3,63
	c.or	a2,a3
	addi	a3,zero,240
	bltu	a1,a3, .Lbranch_8000ea60
	lbu	a1,3(s4)
	c.addi	s4,4
	c.slli	a0,0x1d
	c.srli	a0,0xb
	c.slli	a2,0x6
	andi	a1,a1,63
	c.or	a1,a2
	c.or	a1,a0
	addi	a0,s0,-64
	auipc	ra,0x2
	jalr	ra,1208(ra)	# _ZN4core7unicode12unicode_data11conversions8to_upper17h7d08e96f3cc49c4fE
	lw	s10,-60(s0)
	bne	s10,zero, .Lbranch_8000e980
	c.j	 .Lbranch_8000ea10

.Lbranch_8000e9e2:
	bgeu	s9,s7, .Lbranch_8000ea26
	c.li	s1,1
	c.j	 .Lbranch_8000eaac

.Lbranch_8000e9ea:
	srli	a0,s9,0xb
	c.bnez	a0, .Lbranch_8000ea30
	c.li	s1,2
	c.j	 .Lbranch_8000ea3a

.Lbranch_8000e9f4:
	c.addi	s4,2
	c.slli	a0,0x6
	or	a1,a0,a2
	addi	a0,s0,-64
	auipc	ra,0x2
	jalr	ra,1160(ra)	# _ZN4core7unicode12unicode_data11conversions8to_upper17h7d08e96f3cc49c4fE
	lw	s10,-60(s0)
	bne	s10,zero, .Lbranch_8000e980

.Lbranch_8000ea10:
	lw	s1,-64(s0)
	bgeu	s1,s7, .Lbranch_8000ea1c
	c.li	s2,1
	c.j	 .Lbranch_8000ea88

.Lbranch_8000ea1c:
	srli	a0,s1,0xb
	c.bnez	a0, .Lbranch_8000ea7e
	c.li	s2,2
	c.j	 .Lbranch_8000ea88

.Lbranch_8000ea26:
	srli	a0,s9,0xb
	c.bnez	a0, .Lbranch_8000eaa2
	c.li	s1,2
	c.j	 .Lbranch_8000eaac

.Lbranch_8000ea30:
	srli	a0,s9,0x10
	sltu	s1,zero,a0
	c.addi	s1,3

.Lbranch_8000ea3a:
	lw	a0,-76(s0)
	sub	a1,a0,s5
	c.mv	a0,s5
	bltu	a1,s1, .Lbranch_8000ead2
	c.add	s3,a0
	bgeu	s9,s7, .Lbranch_8000eaf0

.Lbranch_8000ea4e:
	sb	s9,0(s3)
	c.add	s1,s5
	sw	s1,-68(s0)
	bgeu	s10,s7, .Lbranch_8000eb18

.Lbranch_8000ea5c:
	c.li	s5,1
	c.j	 .Lbranch_8000eb5a

.Lbranch_8000ea60:
	c.addi	s4,3
	c.slli	a0,0xc
	or	a1,a2,a0
	addi	a0,s0,-64
	auipc	ra,0x2
	jalr	ra,1052(ra)	# _ZN4core7unicode12unicode_data11conversions8to_upper17h7d08e96f3cc49c4fE
	lw	s10,-60(s0)
	bne	s10,zero, .Lbranch_8000e980
	c.j	 .Lbranch_8000ea10

.Lbranch_8000ea7e:
	srli	a0,s1,0x10
	sltu	s2,zero,a0
	c.addi	s2,3

.Lbranch_8000ea88:
	lw	a0,-76(s0)
	sub	a1,a0,s5
	c.mv	a0,s5
	bltu	a1,s2, .Lbranch_8000ecd4
	c.add	a0,s3
	bgeu	s1,s7, .Lbranch_8000ecf2

.Lbranch_8000ea9c:
	sb	s1,0(a0)
	c.j	 .Lbranch_8000ed10

.Lbranch_8000eaa2:
	srli	a0,s9,0x10
	sltu	s1,zero,a0
	c.addi	s1,3

.Lbranch_8000eaac:
	lw	a0,-76(s0)
	sub	a1,a0,s5
	c.mv	a0,s5
	bltu	a1,s1, .Lbranch_8000ed3c
	c.add	s3,a0
	bgeu	s9,s7, .Lbranch_8000ed5a

.Lbranch_8000eac0:
	sb	s9,0(s3)
	c.add	s1,s5
	sw	s1,-68(s0)
	bgeu	s10,s7, .Lbranch_8000ed82

.Lbranch_8000eace:
	c.li	s5,1
	c.j	 .Lbranch_8000edc4

.Lbranch_8000ead2:
	addi	a0,s0,-76
	c.mv	a1,s5
	c.mv	a2,s1
	auipc	ra,0x0
	jalr	ra,1150(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E
	lw	s3,-72(s0)
	lw	a0,-68(s0)
	c.add	s3,a0
	bltu	s9,s7, .Lbranch_8000ea4e

.Lbranch_8000eaf0:
	srli	a2,s9,0xb
	andi	a0,s9,63
	addi	a0,a0,-128
	srli	a1,s9,0x6
	c.bnez	a2, .Lbranch_8000eb22
	ori	a1,a1,192
	sb	a1,0(s3)
	sb	a0,1(s3)
	c.add	s1,s5
	sw	s1,-68(s0)
	bltu	s10,s7, .Lbranch_8000ea5c

.Lbranch_8000eb18:
	srli	a0,s10,0xb
	c.bnez	a0, .Lbranch_8000eb50
	c.li	s5,2
	c.j	 .Lbranch_8000eb5a

.Lbranch_8000eb22:
	andi	a1,a1,63
	srli	a3,s9,0x10
	addi	a1,a1,-128
	srli	a2,s9,0xc
	c.bnez	a3, .Lbranch_8000eb84
	ori	a2,a2,224
	sb	a2,0(s3)
	sb	a1,1(s3)
	sb	a0,2(s3)
	c.add	s1,s5
	sw	s1,-68(s0)
	bgeu	s10,s7, .Lbranch_8000eb18
	c.j	 .Lbranch_8000ea5c

.Lbranch_8000eb50:
	srli	a0,s10,0x10
	sltu	s5,zero,a0
	c.addi	s5,3

.Lbranch_8000eb5a:
	lw	a0,-76(s0)
	sub	a1,a0,s1
	c.mv	a0,s1
	bltu	a1,s5, .Lbranch_8000ebae
	lw	s3,-72(s0)
	c.add	a0,s3
	bgeu	s10,s7, .Lbranch_8000ebcc

.Lbranch_8000eb72:
	sb	s10,0(a0)
	c.add	s1,s5
	sw	s1,-68(s0)
	bgeu	s11,s7, .Lbranch_8000ebf4

.Lbranch_8000eb80:
	c.li	s5,1
	c.j	 .Lbranch_8000ec36

.Lbranch_8000eb84:
	andi	a2,a2,63
	srli	a3,s9,0x12
	addi	a2,a2,-128
	c.addi	a3,-16
	sb	a3,0(s3)
	sb	a2,1(s3)
	sb	a1,2(s3)
	sb	a0,3(s3)
	c.add	s1,s5
	sw	s1,-68(s0)
	bltu	s10,s7, .Lbranch_8000ea5c
	c.j	 .Lbranch_8000eb18

.Lbranch_8000ebae:
	addi	a0,s0,-76
	c.mv	a1,s1
	c.mv	a2,s5
	auipc	ra,0x0
	jalr	ra,930(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E
	lw	a0,-68(s0)
	lw	s3,-72(s0)
	c.add	a0,s3
	bltu	s10,s7, .Lbranch_8000eb72

.Lbranch_8000ebcc:
	srli	a3,s10,0xb
	andi	a1,s10,63
	addi	a1,a1,-128
	srli	a2,s10,0x6
	c.bnez	a3, .Lbranch_8000ebfe
	ori	a2,a2,192
	sb	a2,0(a0)
	sb	a1,1(a0)
	c.add	s1,s5
	sw	s1,-68(s0)
	bltu	s11,s7, .Lbranch_8000eb80

.Lbranch_8000ebf4:
	srli	a0,s11,0xb
	c.bnez	a0, .Lbranch_8000ec2c
	c.li	s5,2
	c.j	 .Lbranch_8000ec36

.Lbranch_8000ebfe:
	andi	a2,a2,63
	srli	a4,s10,0x10
	addi	a2,a2,-128
	srli	a3,s10,0xc
	c.bnez	a4, .Lbranch_8000ec8a
	ori	a3,a3,224
	sb	a3,0(a0)
	sb	a2,1(a0)
	sb	a1,2(a0)
	c.add	s1,s5
	sw	s1,-68(s0)
	bgeu	s11,s7, .Lbranch_8000ebf4
	c.j	 .Lbranch_8000eb80

.Lbranch_8000ec2c:
	srli	a0,s11,0x10
	sltu	s5,zero,a0
	c.addi	s5,3

.Lbranch_8000ec36:
	lw	a0,-76(s0)
	sub	a1,a0,s1
	c.mv	a0,s1
	bltu	a1,s5, .Lbranch_8000ecb4
	c.add	a0,s3
	bltu	s11,s7, .Lbranch_8000e950

.Lbranch_8000ec4a:
	srli	a3,s11,0xb
	andi	a1,s11,63
	addi	a1,a1,-128
	srli	a2,s11,0x6
	c.bnez	a3, .Lbranch_8000ec6a
	ori	a2,a2,192
	sb	a2,0(a0)
	sb	a1,1(a0)
	c.j	 .Lbranch_8000e954

.Lbranch_8000ec6a:
	andi	a2,a2,63
	srli	a3,s11,0xc
	srli	a4,s11,0x10
	addi	a2,a2,-128
	c.add	s5,s1
	beq	a4,zero, .Lbranch_8000ee5e
	andi	a3,a3,63
	srli	a4,s11,0x12
	c.j	 .Lbranch_8000ee78

.Lbranch_8000ec8a:
	andi	a3,a3,63
	srli	a4,s10,0x12
	addi	a3,a3,-128
	c.addi	a4,-16
	sb	a4,0(a0)
	sb	a3,1(a0)
	sb	a2,2(a0)
	sb	a1,3(a0)
	c.add	s1,s5
	sw	s1,-68(s0)
	bltu	s11,s7, .Lbranch_8000eb80
	c.j	 .Lbranch_8000ebf4

.Lbranch_8000ecb4:
	addi	a0,s0,-76
	c.mv	a1,s1
	c.mv	a2,s5
	auipc	ra,0x0
	jalr	ra,668(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E
	lw	s3,-72(s0)
	lw	a0,-68(s0)
	c.add	a0,s3
	bgeu	s11,s7, .Lbranch_8000ec4a
	c.j	 .Lbranch_8000e950

.Lbranch_8000ecd4:
	addi	a0,s0,-76
	c.mv	a1,s5
	c.mv	a2,s2
	auipc	ra,0x0
	jalr	ra,636(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E
	lw	s3,-72(s0)
	lw	a0,-68(s0)
	c.add	a0,s3
	bltu	s1,s7, .Lbranch_8000ea9c

.Lbranch_8000ecf2:
	srli	a3,s1,0xb
	andi	a1,s1,63
	addi	a1,a1,-128
	srli	a2,s1,0x6
	c.bnez	a3, .Lbranch_8000ed14
	ori	a2,a2,192
	sb	a2,0(a0)
	sb	a1,1(a0)

.Lbranch_8000ed10:
	c.add	s5,s2
	c.j	 .Lbranch_8000e956

.Lbranch_8000ed14:
	andi	a2,a2,63
	srli	a3,s1,0xc
	srli	a4,s1,0x10
	addi	a2,a2,-128
	c.add	s5,s2
	beq	a4,zero, .Lbranch_8000ee5e
	andi	a3,a3,63
	c.srli	s1,0x12
	addi	a3,a3,-128
	c.addi	s1,-16
	sb	s1,0(a0)
	c.j	 .Lbranch_8000ee82

.Lbranch_8000ed3c:
	addi	a0,s0,-76
	c.mv	a1,s5
	c.mv	a2,s1
	auipc	ra,0x0
	jalr	ra,532(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E
	lw	s3,-72(s0)
	lw	a0,-68(s0)
	c.add	s3,a0
	bltu	s9,s7, .Lbranch_8000eac0

.Lbranch_8000ed5a:
	srli	a2,s9,0xb
	andi	a0,s9,63
	addi	a0,a0,-128
	srli	a1,s9,0x6
	c.bnez	a2, .Lbranch_8000ed8c
	ori	a1,a1,192
	sb	a1,0(s3)
	sb	a0,1(s3)
	c.add	s1,s5
	sw	s1,-68(s0)
	bltu	s10,s7, .Lbranch_8000eace

.Lbranch_8000ed82:
	srli	a0,s10,0xb
	c.bnez	a0, .Lbranch_8000edba
	c.li	s5,2
	c.j	 .Lbranch_8000edc4

.Lbranch_8000ed8c:
	andi	a1,a1,63
	srli	a3,s9,0x10
	addi	a1,a1,-128
	srli	a2,s9,0xc
	c.bnez	a3, .Lbranch_8000ede2
	ori	a2,a2,224
	sb	a2,0(s3)
	sb	a1,1(s3)
	sb	a0,2(s3)
	c.add	s1,s5
	sw	s1,-68(s0)
	bltu	s10,s7, .Lbranch_8000eace
	c.j	 .Lbranch_8000ed82

.Lbranch_8000edba:
	srli	a0,s10,0x10
	sltu	s5,zero,a0
	c.addi	s5,3

.Lbranch_8000edc4:
	lw	a0,-76(s0)
	sub	a1,a0,s1
	c.mv	a0,s1
	bltu	a1,s5, .Lbranch_8000ee0c
	lw	s3,-72(s0)
	c.add	a0,s3
	bgeu	s10,s7, .Lbranch_8000ee2a

.Lbranch_8000eddc:
	sb	s10,0(a0)
	c.j	 .Lbranch_8000e954

.Lbranch_8000ede2:
	andi	a2,a2,63
	srli	a3,s9,0x12
	addi	a2,a2,-128
	c.addi	a3,-16
	sb	a3,0(s3)
	sb	a2,1(s3)
	sb	a1,2(s3)
	sb	a0,3(s3)
	c.add	s1,s5
	sw	s1,-68(s0)
	bgeu	s10,s7, .Lbranch_8000ed82
	c.j	 .Lbranch_8000eace

.Lbranch_8000ee0c:
	addi	a0,s0,-76
	c.mv	a1,s1
	c.mv	a2,s5
	auipc	ra,0x0
	jalr	ra,324(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E
	lw	a0,-68(s0)
	lw	s3,-72(s0)
	c.add	a0,s3
	bltu	s10,s7, .Lbranch_8000eddc

.Lbranch_8000ee2a:
	srli	a3,s10,0xb
	andi	a1,s10,63
	srli	a2,s10,0x6
	addi	a1,a1,-128
	c.add	s5,s1
	c.bnez	a3, .Lbranch_8000ee4c
	ori	a2,a2,192
	sb	a2,0(a0)
	sb	a1,1(a0)
	c.j	 .Lbranch_8000e956

.Lbranch_8000ee4c:
	andi	a2,a2,63
	srli	a4,s10,0x10
	addi	a2,a2,-128
	srli	a3,s10,0xc
	c.bnez	a4, .Lbranch_8000ee70

.Lbranch_8000ee5e:
	ori	a3,a3,224
	sb	a3,0(a0)
	sb	a2,1(a0)
	sb	a1,2(a0)
	c.j	 .Lbranch_8000e956

.Lbranch_8000ee70:
	andi	a3,a3,63
	srli	a4,s10,0x12

.Lbranch_8000ee78:
	addi	a3,a3,-128
	c.addi	a4,-16
	sb	a4,0(a0)

.Lbranch_8000ee82:
	sb	a3,1(a0)
	sb	a2,2(a0)
	sb	a1,3(a0)
	c.j	 .Lbranch_8000e956

	.globl _ZN5alloc5alloc18handle_alloc_error17ha8c62235926f2799E
_ZN5alloc5alloc18handle_alloc_error17ha8c62235926f2799E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a2,a0
	c.mv	a0,a1
	c.mv	a1,a2
	auipc	ra,0xffff4
	jalr	ra,1626(ra)	# _RNvCs5QKde7ScR4H_7___rustc26___rust_alloc_error_handler
	# ... (zero-filled gap)

	.globl _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE
_ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.bnez	a0, .Lbranch_8000eeba
	auipc	ra,0x0
	jalr	ra,18(ra)	# _ZN5alloc7raw_vec17capacity_overflow17h286eed05ad35f064E

.Lbranch_8000eeba:
	auipc	ra,0x0
	jalr	ra,-42(ra)	# _ZN5alloc5alloc18handle_alloc_error17ha8c62235926f2799E
	# ... (zero-filled gap)

	.globl _ZN5alloc7raw_vec17capacity_overflow17h286eed05ad35f064E
_ZN5alloc7raw_vec17capacity_overflow17h286eed05ad35f064E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	lui	a0,0x8001d
	addi	a0,a0,372	# .Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.45
	lui	a2,0x8001d
	addi	a2,a2,392	# .Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.47
	addi	a1,zero,35
	auipc	ra,0x2
	jalr	ra,1484(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE

	.globl _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h6702487c946aa624E
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h6702487c946aa624E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.swsp	s1,4(sp)
	c.swsp	s2,0(sp)
	c.addi4spn	s0,sp,16
	c.mv	s2,a0
	bge	a3,zero, .Lbranch_8000ef02
	c.li	s1,0
	c.li	a1,1
	c.li	a0,4
	c.j	 .Lbranch_8000ef42

.Lbranch_8000ef02:
	c.mv	s1,a3
	c.beqz	a1, .Lbranch_8000ef18
	c.mv	a0,a2
	c.li	a2,1
	c.mv	a3,s1
	auipc	ra,0xffff7
	jalr	ra,76(ra)	# _RNvCs5QKde7ScR4H_7___rustc14___rust_realloc
	c.bnez	a0, .Lbranch_8000ef3a
	c.j	 .Lbranch_8000ef30

.Lbranch_8000ef18:
	c.beqz	s1, .Lbranch_8000ef38
	auipc	ra,0xffff4
	jalr	ra,1526(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	c.li	a1,1
	c.mv	a0,s1
	auipc	ra,0xffff7
	jalr	ra,-142(ra)	# _RNvCs5QKde7ScR4H_7___rustc12___rust_alloc
	c.bnez	a0, .Lbranch_8000ef3a

.Lbranch_8000ef30:
	c.li	a1,1
	sw	a1,4(s2)
	c.j	 .Lbranch_8000ef40

.Lbranch_8000ef38:
	c.li	a0,1

.Lbranch_8000ef3a:
	c.li	a1,0
	sw	a0,4(s2)

.Lbranch_8000ef40:
	c.li	a0,8

.Lbranch_8000ef42:
	c.add	a0,s2
	c.sw	s1,0(a0)
	sw	a1,0(s2)
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.lwsp	s1,4(sp)
	c.lwsp	s2,0(sp)
	c.addi	sp,16
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h726d621410b07f57E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.addi4spn	s0,sp,32
	add	s1,a2,a1
	bltu	s1,a2, .Lbranch_8000efe0
	c.mv	s2,a0
	c.lw	a1,0(a0)
	slli	a0,a1,0x1
	bgeu	a0,s1, .Lbranch_8000efae
	c.li	a0,8
	bgeu	a0,s1, .Lbranch_8000efb6

.Lbranch_8000ef7e:
	lw	a2,4(s2)
	addi	a0,s0,-28
	c.mv	a3,s1
	auipc	ra,0x0
	jalr	ra,-160(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h6702487c946aa624E
	lw	a0,-28(s0)
	c.bnez	a0, .Lbranch_8000efd0

.Lbranch_8000ef96:
	lw	a0,-24(s0)
	sw	s1,0(s2)
	sw	a0,4(s2)
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_8000efae:
	c.mv	s1,a0
	c.li	a0,8
	bltu	a0,s1, .Lbranch_8000ef7e

.Lbranch_8000efb6:
	c.li	s1,8
	lw	a2,4(s2)
	addi	a0,s0,-28
	c.mv	a3,s1
	auipc	ra,0x0
	jalr	ra,-218(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h6702487c946aa624E
	lw	a0,-28(s0)
	c.beqz	a0, .Lbranch_8000ef96

.Lbranch_8000efd0:
	lw	a0,-24(s0)
	lw	a1,-20(s0)
	auipc	ra,0x0
	jalr	ra,-304(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_8000efe0:
	c.li	a0,0
	auipc	ra,0x0
	jalr	ra,-314(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE
	# ... (zero-filled gap)

	.globl _ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h023a536b8922818aE
_ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h023a536b8922818aE:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.addi4spn	s0,sp,32
	c.lw	s1,8(a1)
	lw	s3,4(a1)
	c.mv	s2,a0
	c.beqz	s1, .Lbranch_8000f020
	auipc	ra,0xffff4
	jalr	ra,1290(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	c.li	a1,1
	c.mv	a0,s1
	auipc	ra,0xffff7
	jalr	ra,-378(ra)	# _RNvCs5QKde7ScR4H_7___rustc12___rust_alloc
	c.beqz	a0, .Lbranch_8000f04c
	c.mv	s4,a0
	c.j	 .Lbranch_8000f022

.Lbranch_8000f020:
	c.li	s4,1

.Lbranch_8000f022:
	c.mv	a0,s4
	c.mv	a1,s3
	c.mv	a2,s1
	auipc	ra,0xffff7
	jalr	ra,184(ra)	# memcpy
	sw	s1,0(s2)
	sw	s4,4(s2)
	sw	s1,8(s2)
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_8000f04c:
	c.li	a0,1
	c.mv	a1,s1
	auipc	ra,0x0
	jalr	ra,-424(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

	.globl _ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hcce0c7f94e6b173dE
_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hcce0c7f94e6b173dE:
	c.addi16sp	sp,-96
	c.swsp	ra,92(sp)
	c.swsp	s0,88(sp)
	c.swsp	s1,84(sp)
	c.swsp	s2,80(sp)
	c.swsp	s3,76(sp)
	c.swsp	s4,72(sp)
	c.swsp	s5,68(sp)
	c.swsp	s6,64(sp)
	c.swsp	s7,60(sp)
	c.swsp	s8,56(sp)
	c.swsp	s9,52(sp)
	c.swsp	s10,48(sp)
	c.swsp	s11,44(sp)
	c.addi4spn	s0,sp,96
	c.mv	s9,a1
	c.lw	s1,4(a2)
	lw	s4,0(a2)
	lw	s2,16(s1)
	c.mv	s7,a0
	addi	a1,zero,34
	c.mv	a0,s4
	c.jalr	s2
	c.li	s3,1
	bne	a0,zero, .Lbranch_8000f338
	beq	s9,zero, .Lbranch_8000f2f8
	sw	s1,-84(s0)
	sw	s2,-88(s0)
	sw	s4,-76(s0)
	c.li	s6,0
	c.li	s2,0
	sub	a0,zero,s9
	sw	a0,-92(s0)
	addi	a6,zero,-95
	c.lui	a0,0x10
	addi	s3,zero,34
	c.addi	a0,1	# .Lline_table_start0+0x1fa3
	sw	a0,-80(s0)
	addi	a5,zero,92
	c.mv	a3,s9
	c.mv	s10,s7
	c.j	 .Lbranch_8000f0d8

.Lbranch_8000f0c8:
	c.li	a0,1

.Lbranch_8000f0ca:
	c.add	a0,s2
	sub	a3,a2,s10
	add	s2,a0,s11
	beq	a3,zero, .Lbranch_8000f35c

.Lbranch_8000f0d8:
	c.li	s11,0
	add	a7,s10,a3
	sub	a1,zero,a3

.Lbranch_8000f0e2:
	add	a0,s10,s11
	lbu	a2,0(a0)
	addi	a4,a2,-127
	bltu	a4,a6, .Lbranch_8000f104
	beq	a2,s3, .Lbranch_8000f104
	beq	a2,a5, .Lbranch_8000f104
	c.addi	s11,1
	add	a0,a1,s11
	c.bnez	a0, .Lbranch_8000f0e2
	c.j	 .Lbranch_8000f2ca

.Lbranch_8000f104:
	lb	a1,0(a0)
	addi	s10,a0,1
	andi	s1,a1,255
	sw	a7,-72(s0)
	bge	a1,zero, .Lbranch_8000f172
	lbu	a2,0(s10)
	andi	a1,s1,31
	addi	s10,a0,2
	andi	a3,a2,63
	addi	a2,zero,224
	bltu	s1,a2, .Lbranch_8000f162
	lbu	a4,0(s10)
	addi	a2,a0,3
	c.slli	a3,0x6
	andi	a4,a4,63
	c.or	a3,a4
	addi	a4,zero,240
	bltu	s1,a4, .Lbranch_8000f16a
	addi	s10,a0,4
	lbu	a0,0(a2)
	c.slli	a1,0x1d
	c.srli	a1,0xb
	c.slli	a3,0x6
	andi	a0,a0,63
	c.or	a0,a1
	or	s1,a3,a0
	c.j	 .Lbranch_8000f172

.Lbranch_8000f162:
	c.slli	a1,0x6
	or	s1,a1,a3
	c.j	 .Lbranch_8000f172

.Lbranch_8000f16a:
	c.slli	a1,0xc
	or	s1,a3,a1
	c.mv	s10,a2

.Lbranch_8000f172:
	addi	a0,s0,-68
	c.mv	a1,s1
	lw	a2,-80(s0)
	auipc	ra,0x1
	jalr	ra,2012(ra)	# _ZN4core4char7methods22_$LT$impl$u20$char$GT$16escape_debug_ext17h36e0039c2e3f7f9dE
	lbu	s4,-56(s0)
	lbu	s5,-55(s0)
	sub	s8,s5,s4
	andi	a0,s8,255
	c.li	a1,1
	bne	a0,a1, .Lbranch_8000f1b0
	addi	a6,zero,-95
	addi	a5,zero,92
	lw	a2,-72(s0)
	addi	a0,zero,128
	bltu	s1,a0, .Lbranch_8000f0c8
	c.j	 .Lbranch_8000f2b6

.Lbranch_8000f1b0:
	add	a3,s2,s11
	bltu	a3,s6, .Lbranch_8000f37a
	add	a1,s7,s6
	beq	s6,zero, .Lbranch_8000f1d6
	bgeu	s6,s9, .Lbranch_8000f1d2
	lb	a0,0(a1)
	addi	a2,zero,-65
	blt	a2,a0, .Lbranch_8000f1d6
	c.j	 .Lbranch_8000f37a

.Lbranch_8000f1d2:
	bne	s6,s9, .Lbranch_8000f37a

.Lbranch_8000f1d6:
	c.beqz	a3, .Lbranch_8000f1fa
	bgeu	a3,s9, .Lbranch_8000f1f0
	add	a0,s7,s2
	c.add	a0,s11
	lb	a0,0(a0)
	addi	a2,zero,-65
	blt	a2,a0, .Lbranch_8000f1fa
	c.j	 .Lbranch_8000f37a

.Lbranch_8000f1f0:
	lw	a0,-92(s0)
	c.add	a0,a3
	bne	a0,zero, .Lbranch_8000f37a

.Lbranch_8000f1fa:
	c.mv	a2,s6
	c.mv	s6,s9
	c.mv	s9,s7
	lw	a0,-84(s0)
	lw	s7,12(a0)
	sub	a2,s2,a2
	c.add	a2,s11
	lw	a0,-76(s0)
	c.jalr	s7
	bne	a0,zero, .Lbranch_8000f358
	addi	a0,zero,129
	bltu	s5,a0, .Lbranch_8000f232
	lw	a1,-68(s0)
	lw	a0,-76(s0)
	lw	a2,-88(s0)
	c.jalr	a2
	c.beqz	a0, .Lbranch_8000f244
	c.j	 .Lbranch_8000f358

.Lbranch_8000f232:
	addi	a1,s0,-68
	c.add	a1,s4
	lw	a0,-76(s0)
	c.mv	a2,s8
	c.jalr	s7
	bne	a0,zero, .Lbranch_8000f358

.Lbranch_8000f244:
	addi	a0,zero,128
	bgeu	s1,a0, .Lbranch_8000f270
	c.li	a0,1
	c.mv	s7,s9
	c.mv	s9,s6
	addi	a6,zero,-95
	addi	a5,zero,92
	lw	a2,-72(s0)
	add	a1,s2,s11
	add	s6,a0,a1
	addi	a0,zero,128
	bltu	s1,a0, .Lbranch_8000f0c8
	c.j	 .Lbranch_8000f2b6

.Lbranch_8000f270:
	srli	a0,s1,0xb
	c.mv	s7,s9
	addi	a6,zero,-95
	addi	a5,zero,92
	lw	a2,-72(s0)
	c.bnez	a0, .Lbranch_8000f29a
	c.li	a0,2
	c.mv	s9,s6
	add	a1,s2,s11
	add	s6,a0,a1
	addi	a0,zero,128
	bltu	s1,a0, .Lbranch_8000f0c8
	c.j	 .Lbranch_8000f2b6

.Lbranch_8000f29a:
	srli	a0,s1,0x10
	sltu	a0,zero,a0
	c.addi	a0,3
	c.mv	s9,s6
	add	a1,s2,s11
	add	s6,a0,a1
	addi	a0,zero,128
	bltu	s1,a0, .Lbranch_8000f0c8

.Lbranch_8000f2b6:
	srli	a0,s1,0xb
	c.bnez	a0, .Lbranch_8000f2c0
	c.li	a0,2
	c.j	 .Lbranch_8000f0ca

.Lbranch_8000f2c0:
	c.srli	s1,0x10
	sltu	a0,zero,s1
	c.addi	a0,3
	c.j	 .Lbranch_8000f0ca

.Lbranch_8000f2ca:
	c.add	a3,s2
	bltu	a3,s6, .Lbranch_8000f364

.Lbranch_8000f2d0:
	lw	s4,-76(s0)
	lw	s2,-88(s0)
	c.li	s3,1
	lw	s1,-84(s0)
	beq	s6,zero, .Lbranch_8000f302
	bgeu	s6,s9, .Lbranch_8000f2fe
	add	a0,s7,s6
	lb	a0,0(a0)
	addi	a1,zero,-65
	blt	a1,a0, .Lbranch_8000f302
	c.j	 .Lbranch_8000f364

.Lbranch_8000f2f8:
	c.li	a3,0
	c.li	s6,0
	c.j	 .Lbranch_8000f31e

.Lbranch_8000f2fe:
	bne	s6,s9, .Lbranch_8000f364

.Lbranch_8000f302:
	c.beqz	a3, .Lbranch_8000f31e
	bgeu	a3,s9, .Lbranch_8000f31a
	add	a0,s7,a3
	lb	a0,0(a0)
	addi	a1,zero,-65
	blt	a1,a0, .Lbranch_8000f31e
	c.j	 .Lbranch_8000f364

.Lbranch_8000f31a:
	bne	a3,s9, .Lbranch_8000f364

.Lbranch_8000f31e:
	c.lw	a4,12(s1)
	sub	a2,a3,s6
	add	a1,s7,s6
	c.mv	a0,s4
	c.jalr	a4
	c.bnez	a0, .Lbranch_8000f338
	addi	a1,zero,34
	c.mv	a0,s4
	c.jalr	s2
	c.mv	s3,a0

.Lbranch_8000f338:
	c.mv	a0,s3
	c.lwsp	ra,92(sp)
	c.lwsp	s0,88(sp)
	c.lwsp	s1,84(sp)
	c.lwsp	s2,80(sp)
	c.lwsp	s3,76(sp)
	c.lwsp	s4,72(sp)
	c.lwsp	s5,68(sp)
	c.lwsp	s6,64(sp)
	c.lwsp	s7,60(sp)
	c.lwsp	s8,56(sp)
	c.lwsp	s9,52(sp)
	c.lwsp	s10,48(sp)
	c.lwsp	s11,44(sp)
	c.addi16sp	sp,96
	c.jr	ra

.Lbranch_8000f358:
	c.li	s3,1
	c.j	 .Lbranch_8000f338

.Lbranch_8000f35c:
	add	a3,a0,s11
	bgeu	a3,s6, .Lbranch_8000f2d0

.Lbranch_8000f364:
	lui	a4,0x8001d
	addi	a4,a4,1608	# .Lanon.93378afd097c98d6944e7e9e652eb25e.5
	c.mv	a0,s7
	c.mv	a1,s9
	c.mv	a2,s6
	auipc	ra,0x1
	jalr	ra,-978(ra)	# _ZN4core3str16slice_error_fail17h073402faa99e0899E

.Lbranch_8000f37a:
	lui	a4,0x8001d
	addi	a4,a4,1592	# .Lanon.93378afd097c98d6944e7e9e652eb25e.4
	c.mv	a0,s7
	c.mv	a1,s9
	c.mv	a2,s6
	auipc	ra,0x1
	jalr	ra,-1000(ra)	# _ZN4core3str16slice_error_fail17h073402faa99e0899E

	.globl _ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h05a6d6406a274b12E
_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h05a6d6406a274b12E:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.swsp	s1,36(sp)
	c.swsp	s2,32(sp)
	c.swsp	s3,28(sp)
	c.swsp	s4,24(sp)
	c.addi4spn	s0,sp,48
	lw	s4,4(a1)
	lw	s2,0(a1)
	lw	s3,16(s4)
	c.mv	s1,a0
	addi	a1,zero,39
	c.mv	a0,s2
	c.jalr	s3
	c.beqz	a0, .Lbranch_8000f3bc

.Lbranch_8000f3b8:
	c.li	a0,1
	c.j	 .Lbranch_8000f406

.Lbranch_8000f3bc:
	c.lw	a1,0(s1)
	addi	a0,s0,-40
	addi	a2,zero,257
	addi	s1,s0,-40
	auipc	ra,0x1
	jalr	ra,1422(ra)	# _ZN4core4char7methods22_$LT$impl$u20$char$GT$16escape_debug_ext17h36e0039c2e3f7f9dE
	lbu	a0,-27(s0)
	addi	a1,zero,129
	bltu	a0,a1, .Lbranch_8000f3ea
	lw	a1,-40(s0)
	c.mv	a0,s2
	c.jalr	s3
	c.bnez	a0, .Lbranch_8000f3b8
	c.j	 .Lbranch_8000f3fe

.Lbranch_8000f3ea:
	lbu	a1,-28(s0)
	lw	a3,12(s4)
	sub	a2,a0,a1
	c.add	a1,s1
	c.mv	a0,s2
	c.jalr	a3
	c.bnez	a0, .Lbranch_8000f3b8

.Lbranch_8000f3fe:
	addi	a1,zero,39
	c.mv	a0,s2
	c.jalr	s3

.Lbranch_8000f406:
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.lwsp	s4,24(sp)
	c.addi16sp	sp,48
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17haa5ea4fa623a79c6E
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17haa5ea4fa623a79c6E:
	c.lw	a2,4(a0)
	c.lw	a0,0(a0)
	c.lw	a5,12(a2)
	c.jr	a5

	.globl _ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h1caa923a37cafdf4E
_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h1caa923a37cafdf4E:
	c.mv	a3,a1
	c.mv	a1,a0
	c.mv	a0,a2
	c.mv	a2,a3
	auipc	t1,0x1
	jalr	zero,-1620(t1)	# _ZN4core3fmt9Formatter3pad17hbe2da4ac9d241087E

	.globl _ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17hef7632af3fbf4ee8E
_ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17hef7632af3fbf4ee8E:
	lbu	a2,0(a0)
	c.mv	a0,a1
	c.beqz	a2, .Lbranch_8000f44a
	lui	a1,0x80014
	addi	a1,a1,96	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0x18
	c.li	a2,4
	auipc	t1,0x1
	jalr	zero,-1646(t1)	# _ZN4core3fmt9Formatter3pad17hbe2da4ac9d241087E

.Lbranch_8000f44a:
	lui	a1,0x8001d
	addi	a1,a1,1624	# .Lanon.93378afd097c98d6944e7e9e652eb25e.6
	c.li	a2,5
	auipc	t1,0x1
	jalr	zero,-1664(t1)	# _ZN4core3fmt9Formatter3pad17hbe2da4ac9d241087E

	.globl _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h1f4467a62b6da94dE
_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h1f4467a62b6da94dE:
	c.lw	a3,0(a0)
	c.lw	a2,4(a0)
	c.mv	a0,a1
	c.mv	a1,a3
	auipc	t1,0x1
	jalr	zero,-1680(t1)	# _ZN4core3fmt9Formatter3pad17hbe2da4ac9d241087E

	.globl _ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$10_fmt_inner17hce19ab5f0b0f5b84E
_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$10_fmt_inner17hce19ab5f0b0f5b84E:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.swsp	s1,36(sp)
	c.swsp	s2,32(sp)
	c.swsp	s3,28(sp)
	c.swsp	s4,24(sp)
	c.swsp	s5,20(sp)
	c.swsp	s6,16(sp)
	c.swsp	s7,12(sp)
	c.addi4spn	s0,sp,48
	addi	a3,zero,1000
	c.mv	a7,a0
	c.mv	a4,a2
	bltu	a0,a3, .Lbranch_8000f548
	c.li	t0,0
	addi	a6,a2,-1
	addi	s2,a1,-2
	c.li	s3,-2
	lui	a3,0xd1b71
	c.lui	a4,0x2
	c.lui	a5,0x1
	addi	t1,zero,100
	lui	t2,0x8001d
	addi	t2,t2,1632	# .Lanon.93378afd097c98d6944e7e9e652eb25e.10
	lui	s1,0x989
	addi	t3,a3,1881	# __heap_end+0x51871759
	addi	t4,a4,1808	# .Lline_table_start0+0x2710
	addi	t5,a5,1147	# .Lline_table_start0+0x147b
	addi	t6,s1,1663	# .Lline_table_start1+0x93d52a
	c.mv	a7,a0

.Lbranch_8000f4c4:
	add	s5,a6,t0
	addi	a3,s5,-3
	bgeu	a3,a2, .Lbranch_8000f62a
	c.mv	s4,a7
	mulhu	a3,a7,t3
	srli	a7,a3,0xd
	mul	a3,a7,t4
	sub	s1,s4,a3
	slli	a3,s1,0x10
	c.srli	a3,0x12
	mul	a5,a3,t5
	c.srli	a5,0x11
	slli	a3,a5,0x1
	c.add	a3,t2
	lbu	s6,0(a3)
	add	a4,s2,a2
	addi	s7,s5,-2
	sb	s6,-2(a4)
	bgeu	s7,a2, .Lbranch_8000f610
	lbu	s6,1(a3)
	add	a3,a2,s3
	sb	s6,-1(a4)
	bgeu	a3,a2, .Lbranch_8000f5e0
	mul	a3,a5,t1
	c.sub	s1,a3
	c.slli	s1,0x11
	srli	a3,s1,0x10
	c.add	a3,t2
	lbu	a5,0(a3)
	sb	a5,0(a4)
	bgeu	s5,a2, .Lbranch_8000f5f6
	lbu	a3,1(a3)
	c.addi	t0,-4
	c.addi	s3,-4
	sb	a3,1(a4)
	c.addi	s2,-4
	bltu	t6,s4, .Lbranch_8000f4c4
	add	a4,a2,t0

.Lbranch_8000f548:
	c.li	a3,9
	bgeu	a3,a7, .Lbranch_8000f5a4
	addi	a3,a4,-2
	bgeu	a3,a2, .Lbranch_8000f5e0
	slli	a5,a7,0x10
	c.lui	a6,0x1
	addi	t0,zero,100
	c.srli	a5,0x12
	addi	s1,a6,1147	# .Lline_table_start0+0x147b
	mul	a5,a5,s1
	c.srli	a5,0x11
	mul	s1,a5,t0
	sub	s1,a7,s1
	c.slli	s1,0x11
	srli	a6,s1,0x10
	lui	s1,0x8001d
	addi	s1,s1,1632	# .Lanon.93378afd097c98d6944e7e9e652eb25e.10
	c.add	s1,a6
	lbu	a6,0(s1)
	add	a7,a1,a3
	c.addi	a4,-1
	sb	a6,0(a7)
	bgeu	a4,a2, .Lbranch_8000f644
	lbu	s1,1(s1)
	c.add	a4,a1
	sb	s1,0(a4)
	c.bnez	a0, .Lbranch_8000f5aa
	c.j	 .Lbranch_8000f5ac

.Lbranch_8000f5a4:
	c.mv	a5,a7
	c.mv	a3,a4
	c.beqz	a0, .Lbranch_8000f5ac

.Lbranch_8000f5aa:
	c.beqz	a5, .Lbranch_8000f5c8

.Lbranch_8000f5ac:
	c.addi	a3,-1
	bgeu	a3,a2, .Lbranch_8000f5e0
	c.slli	a5,0x1
	lui	a0,0x8001d
	addi	a0,a0,1632	# .Lanon.93378afd097c98d6944e7e9e652eb25e.10
	c.add	a0,a5
	lbu	a0,1(a0)
	c.add	a1,a3
	sb	a0,0(a1)

.Lbranch_8000f5c8:
	c.mv	a0,a3
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.lwsp	s4,24(sp)
	c.lwsp	s5,20(sp)
	c.lwsp	s6,16(sp)
	c.lwsp	s7,12(sp)
	c.addi16sp	sp,48
	c.jr	ra

.Lbranch_8000f5e0:
	lui	a4,0x8001d
	addi	a4,a4,1832	# .Lanon.93378afd097c98d6944e7e9e652eb25e.22
	c.mv	a0,a3
	c.mv	a1,a2
	c.mv	a2,a4
	auipc	ra,0x2
	jalr	ra,-450(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000f5f6:
	add	a0,a2,t0
	c.addi	a0,-1
	lui	a3,0x8001d
	addi	a3,a3,1832	# .Lanon.93378afd097c98d6944e7e9e652eb25e.22
	c.mv	a1,a2
	c.mv	a2,a3
	auipc	ra,0x2
	jalr	ra,-476(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000f610:
	add	a0,a2,t0
	c.addi	a0,-3
	lui	a3,0x8001d
	addi	a3,a3,1832	# .Lanon.93378afd097c98d6944e7e9e652eb25e.22
	c.mv	a1,a2
	c.mv	a2,a3
	auipc	ra,0x2
	jalr	ra,-502(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000f62a:
	add	a0,a2,t0
	c.addi	a0,-4
	lui	a3,0x8001d
	addi	a3,a3,1832	# .Lanon.93378afd097c98d6944e7e9e652eb25e.22
	c.mv	a1,a2
	c.mv	a2,a3
	auipc	ra,0x2
	jalr	ra,-528(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8000f644:
	lui	a3,0x8001d
	addi	a3,a3,1832	# .Lanon.93378afd097c98d6944e7e9e652eb25e.22
	c.mv	a0,a4
	c.mv	a1,a2
	c.mv	a2,a3
	auipc	ra,0x2
	jalr	ra,-550(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E
	# ... (zero-filled gap)

	.globl _ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hfc78ba423a0d98a3E
_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hfc78ba423a0d98a3E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a3,a1
	lbu	a1,0(a0)
	c.li	a2,10
	lui	a0,0x8001d
	addi	a0,a0,1632	# .Lanon.93378afd097c98d6944e7e9e652eb25e.10
	bltu	a1,a2, .Lbranch_8000f6aa
	addi	a2,zero,41
	addi	a4,zero,100
	mul	a2,a1,a2
	c.srli	a2,0xc
	mul	a4,a2,a4
	sub	a4,a1,a4
	c.slli	a4,0x19
	c.srli	a4,0x18
	c.add	a4,a0
	lbu	a5,0(a4)
	lbu	a4,1(a4)
	sb	a5,-10(s0)
	sb	a4,-9(s0)
	c.li	a4,1
	c.bnez	a1, .Lbranch_8000f6b0
	c.j	 .Lbranch_8000f6b2

.Lbranch_8000f6aa:
	c.li	a4,3
	c.mv	a2,a1
	c.beqz	a1, .Lbranch_8000f6b2

.Lbranch_8000f6b0:
	c.beqz	a2, .Lbranch_8000f6c8

.Lbranch_8000f6b2:
	c.slli	a2,0x19
	c.srli	a2,0x18
	c.add	a0,a2
	lbu	a0,1(a0)
	c.addi	a4,-1
	addi	a1,s0,-11
	c.add	a1,a4
	sb	a0,0(a1)

.Lbranch_8000f6c8:
	c.li	a5,3
	addi	a0,s0,-11
	c.sub	a5,a4
	c.add	a4,a0
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,a3
	c.li	a3,0
	auipc	ra,0x0
	jalr	ra,878(ra)	# _ZN4core3fmt9Formatter12pad_integral17hc87d07f36c858c22E
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.addi4spn	s0,sp,32
	c.lw	a0,0(a0)
	c.mv	s1,a1
	addi	s2,s0,-30
	addi	a1,s0,-30
	c.li	a2,10
	c.li	s3,10
	auipc	ra,0x0
	jalr	ra,-670(ra)	# _ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$10_fmt_inner17hce19ab5f0b0f5b84E
	sub	a5,s3,a0
	add	a4,s2,a0
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s1
	c.li	a3,0
	auipc	ra,0x0
	jalr	ra,806(ra)	# _ZN4core3fmt9Formatter12pad_integral17hc87d07f36c858c22E
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.addi16sp	sp,32
	c.jr	ra

	.globl _ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hfb5c6c4697ad7849E
_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hfb5c6c4697ad7849E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.addi4spn	s0,sp,32
	c.mv	s1,a1
	c.lw	a1,8(a1)
	slli	a2,a1,0x6
	blt	a2,zero, .Lbranch_8000f780
	c.slli	a1,0x5
	blt	a1,zero, .Lbranch_8000f7a8
	c.lw	a0,0(a0)
	addi	s2,s0,-30
	addi	a1,s0,-30
	c.li	a2,10
	c.li	s3,10
	auipc	ra,0x0
	jalr	ra,-762(ra)	# _ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$10_fmt_inner17hce19ab5f0b0f5b84E
	sub	a5,s3,a0
	add	a4,s2,a0
	c.li	a1,1
	c.li	a2,1
	c.mv	a0,s1
	c.li	a3,0
	c.j	 .Lbranch_8000f7e6

.Lbranch_8000f780:
	c.li	a5,0
	c.lw	a0,0(a0)
	addi	a1,s0,-23
	lui	a2,0x80013
	addi	a2,a2,1940	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x80

.Lbranch_8000f790:
	andi	a3,a0,15
	c.add	a3,a2
	lbu	a3,0(a3)
	c.srli	a0,0x4
	c.addi	a5,1
	sb	a3,0(a1)
	c.addi	a1,-1
	c.bnez	a0, .Lbranch_8000f790
	c.j	 .Lbranch_8000f7ce

.Lbranch_8000f7a8:
	c.li	a5,0
	c.lw	a0,0(a0)
	addi	a1,s0,-23
	lui	a2,0x80013
	addi	a2,a2,1812	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667

.Lbranch_8000f7b8:
	andi	a3,a0,15
	c.add	a3,a2
	lbu	a3,0(a3)
	c.srli	a0,0x4
	c.addi	a5,1
	sb	a3,0(a1)
	c.addi	a1,-1
	c.bnez	a0, .Lbranch_8000f7b8

.Lbranch_8000f7ce:
	addi	a0,s0,-30
	c.sub	a0,a5
	addi	a4,a0,8
	lui	a2,0x8001d
	addi	a2,a2,1848	# .Lanon.93378afd097c98d6944e7e9e652eb25e.33
	c.li	a1,1
	c.li	a3,2
	c.mv	a0,s1

.Lbranch_8000f7e6:
	auipc	ra,0x0
	jalr	ra,610(ra)	# _ZN4core3fmt9Formatter12pad_integral17hc87d07f36c858c22E
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.addi16sp	sp,32
	c.jr	ra

	.globl _ZN4core3fmt5Write9write_fmt17h3a3f37674896ae5bE
_ZN4core3fmt5Write9write_fmt17h3a3f37674896ae5bE:
	c.mv	a3,a2
	c.mv	a2,a1
	lui	a1,0x8001d
	addi	a1,a1,1872	# .Lanon.93378afd097c98d6944e7e9e652eb25e.50
	auipc	t1,0x0
	jalr	zero,8(t1)	# _ZN4core3fmt5write17h8a27c002649b254aE

	.globl _ZN4core3fmt5write17h8a27c002649b254aE
_ZN4core3fmt5write17h8a27c002649b254aE:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.addi4spn	s0,sp,64
	c.mv	s3,a3
	c.mv	s2,a1
	andi	a1,a3,1
	c.mv	s4,a0
	bne	a1,zero, .Lbranch_8000f99a
	lbu	s1,0(a2)
	beq	s1,zero, .Lbranch_8000f9c4
	c.li	s9,0
	lw	s6,12(s2)
	addi	s7,zero,128
	addi	s8,zero,192
	lui	a0,0x60000
	addi	s10,a0,32	# .Lline_table_start1+0x5ffb3ecb
	c.j	 .Lbranch_8000f88c

.Lbranch_8000f85a:
	slli	a0,s9,0x3
	add	a1,s3,a0
	c.lw	a0,0(a1)
	c.lw	a2,4(a1)
	sw	s4,-64(s0)
	sw	s2,-60(s0)
	sw	s10,-56(s0)
	sw	zero,-52(s0)
	addi	a1,s0,-64
	c.jalr	a2
	bne	a0,zero, .Lbranch_8000f9c8

.Lbranch_8000f880:
	c.addi	s9,1

.Lbranch_8000f882:
	lbu	s1,0(s5)
	c.mv	a2,s5
	beq	s1,zero, .Lbranch_8000f9c4

.Lbranch_8000f88c:
	slli	a0,s1,0x18
	addi	s5,a2,1
	blt	a0,zero, .Lbranch_8000f8a8
	c.mv	a0,s4
	c.mv	a1,s5
	c.mv	a2,s1
	c.jalr	s6
	bne	a0,zero, .Lbranch_8000f9c8
	c.add	s5,s1
	c.j	 .Lbranch_8000f882

.Lbranch_8000f8a8:
	beq	s1,s7, .Lbranch_8000f8fe
	beq	s1,s8, .Lbranch_8000f85a
	andi	a0,s1,1
	c.mv	a1,s10
	c.beqz	a0, .Lbranch_8000f8da
	lbu	a0,2(a2)
	lbu	a1,1(a2)
	lbu	a3,3(a2)
	lbu	a4,4(a2)
	c.slli	a0,0x8
	c.or	a0,a1
	c.slli	a3,0x10
	c.slli	a4,0x18
	or	a1,a4,a3
	c.or	a1,a0
	addi	s5,a2,5

.Lbranch_8000f8da:
	andi	a0,s1,2
	c.bnez	a0, .Lbranch_8000f91e
	c.li	a2,0
	andi	a0,s1,4
	c.beqz	a0, .Lbranch_8000f932

.Lbranch_8000f8e8:
	lbu	a0,1(s5)
	lbu	a3,0(s5)
	c.slli	a0,0x8
	c.or	a3,a0
	c.addi	s5,2
	andi	a0,s1,8
	c.bnez	a0, .Lbranch_8000f93a
	c.j	 .Lbranch_8000f94a

.Lbranch_8000f8fe:
	lbu	a0,2(a2)
	lbu	a1,1(a2)
	c.slli	a0,0x8
	or	s5,a0,a1
	addi	s1,a2,3
	c.mv	a0,s4
	c.mv	a1,s1
	c.mv	a2,s5
	c.jalr	s6
	c.bnez	a0, .Lbranch_8000f9c8
	c.add	s5,s1
	c.j	 .Lbranch_8000f882

.Lbranch_8000f91e:
	lbu	a0,1(s5)
	lbu	a2,0(s5)
	c.slli	a0,0x8
	c.or	a2,a0
	c.addi	s5,2
	andi	a0,s1,4
	c.bnez	a0, .Lbranch_8000f8e8

.Lbranch_8000f932:
	c.li	a3,0
	andi	a0,s1,8
	c.beqz	a0, .Lbranch_8000f94a

.Lbranch_8000f93a:
	lbu	a0,1(s5)
	lbu	a4,0(s5)
	c.slli	a0,0x8
	or	s9,a0,a4
	c.addi	s5,2

.Lbranch_8000f94a:
	andi	a0,s1,16
	c.bnez	a0, .Lbranch_8000f98a
	andi	a0,s1,32
	c.beqz	a0, .Lbranch_8000f95e

.Lbranch_8000f956:
	c.slli	a3,0x3
	c.add	a3,s3
	lhu	a3,4(a3)

.Lbranch_8000f95e:
	slli	a0,s9,0x3
	add	a4,s3,a0
	c.lw	a0,0(a4)
	c.lw	a4,4(a4)
	sw	s4,-64(s0)
	sw	s2,-60(s0)
	sw	a1,-56(s0)
	sh	a2,-52(s0)
	sh	a3,-50(s0)
	addi	a1,s0,-64
	c.jalr	a4
	beq	a0,zero, .Lbranch_8000f880
	c.j	 .Lbranch_8000f9c8

.Lbranch_8000f98a:
	c.slli	a2,0x3
	c.add	a2,s3
	lhu	a2,4(a2)
	andi	a0,s1,32
	c.bnez	a0, .Lbranch_8000f956
	c.j	 .Lbranch_8000f95e

.Lbranch_8000f99a:
	lw	a5,12(s2)
	srli	a3,s3,0x1
	c.mv	a0,s4
	c.mv	a1,a2
	c.mv	a2,a3
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.addi16sp	sp,64
	c.jr	a5

.Lbranch_8000f9c4:
	c.li	a0,0
	c.j	 .Lbranch_8000f9ca

.Lbranch_8000f9c8:
	c.li	a0,1

.Lbranch_8000f9ca:
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.addi16sp	sp,64
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN4core3fmt9Formatter12pad_integral12write_prefix17hc91e4f49a171ae8cE
_ZN4core3fmt9Formatter12pad_integral12write_prefix17hc91e4f49a171ae8cE:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.addi4spn	s0,sp,32
	c.mv	s2,a4
	c.mv	s4,a3
	c.mv	s3,a1
	lui	a1,0x110
	beq	a2,a1, .Lbranch_8000fa1a
	lw	a3,16(s3)
	c.mv	s1,a0
	c.mv	a1,a2
	c.jalr	a3
	c.mv	a1,a0
	c.mv	a0,s1
	c.beqz	a1, .Lbranch_8000fa1a
	c.li	a0,1
	c.j	 .Lbranch_8000fa38

.Lbranch_8000fa1a:
	beq	s4,zero, .Lbranch_8000fa36
	lw	a5,12(s3)
	c.mv	a1,s4
	c.mv	a2,s2
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	c.jr	a5

.Lbranch_8000fa36:
	c.li	a0,0

.Lbranch_8000fa38:
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	c.jr	ra

	.globl _ZN4core3fmt9Formatter12pad_integral17hc87d07f36c858c22E
_ZN4core3fmt9Formatter12pad_integral17hc87d07f36c858c22E:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.swsp	s11,12(sp)
	c.addi4spn	s0,sp,64
	c.mv	s3,a5
	c.mv	s2,a4
	c.mv	s4,a3
	c.mv	s5,a2
	c.mv	s7,a0
	c.beqz	a1, .Lbranch_8000faea
	lw	s1,8(s7)
	lui	a0,0x200
	c.and	a0,s1
	lui	s6,0x110
	c.beqz	a0, .Lbranch_8000fa86
	addi	s6,zero,43

.Lbranch_8000fa86:
	c.srli	a0,0x15
	add	s9,a0,s3
	slli	a0,s1,0x8
	bge	a0,zero, .Lbranch_8000fafe

.Lbranch_8000fa94:
	c.li	a0,16
	bgeu	s4,a0, .Lbranch_8000fb4c
	c.li	a0,0
	beq	s4,zero, .Lbranch_8000faba
	add	a1,s5,s4
	c.mv	a2,s5

.Lbranch_8000faa6:
	lb	a3,0(a2)
	c.addi	a2,1
	slti	a3,a3,-64
	xori	a3,a3,1
	c.add	a0,a3
	bne	a2,a1, .Lbranch_8000faa6

.Lbranch_8000faba:
	c.add	s9,a0
	lhu	s11,12(s7)
	bgeu	s9,s11, .Lbranch_8000fb08

.Lbranch_8000fac4:
	slli	a0,s1,0x7
	sw	s2,-56(s0)
	blt	a0,zero, .Lbranch_8000fb64
	sub	a2,s11,s9
	slli	a0,s1,0x1
	c.srli	a0,0x1e
	c.li	a1,1
	c.slli	s1,0xb
	blt	a1,a0, .Lbranch_8000fbcc
	bne	a0,zero, .Lbranch_8000fbfe
	c.li	s11,0
	c.j	 .Lbranch_8000fc00

.Lbranch_8000faea:
	lw	s1,8(s7)
	addi	s9,s3,1
	addi	s6,zero,45
	slli	a0,s1,0x8
	blt	a0,zero, .Lbranch_8000fa94

.Lbranch_8000fafe:
	c.li	s5,0
	lhu	s11,12(s7)
	bltu	s9,s11, .Lbranch_8000fac4

.Lbranch_8000fb08:
	lw	s8,0(s7)
	lw	s1,4(s7)
	c.mv	a0,s8
	c.mv	a1,s1
	c.mv	a2,s6
	c.mv	a3,s5
	c.mv	a4,s4
	auipc	ra,0x0
	jalr	ra,-306(ra)	# _ZN4core3fmt9Formatter12pad_integral12write_prefix17hc91e4f49a171ae8cE
	bne	a0,zero, .Lbranch_8000fc30
	c.lw	a5,12(s1)
	c.mv	a0,s8
	c.mv	a1,s2
	c.mv	a2,s3
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.lwsp	s11,12(sp)
	c.addi16sp	sp,64
	c.jr	a5

.Lbranch_8000fb4c:
	c.mv	a0,s5
	c.mv	a1,s4
	auipc	ra,0x0
	jalr	ra,1760(ra)	# _ZN4core3str5count14do_count_chars17hd561aaa31ab077b5E
	c.add	s9,a0
	lhu	s11,12(s7)
	bgeu	s9,s11, .Lbranch_8000fb08
	c.j	 .Lbranch_8000fac4

.Lbranch_8000fb64:
	lw	s8,0(s7)
	lw	s2,4(s7)
	lw	s10,8(s7)
	lw	s1,12(s7)
	lui	a0,0x9fe00
	lui	a1,0x20000
	and	a0,s10,a0
	addi	a1,a1,48	# .Lline_table_start1+0x1ffb3edb
	c.or	a0,a1
	sw	a0,8(s7)
	c.mv	a0,s8
	c.mv	a1,s2
	c.mv	a2,s6
	c.mv	a3,s5
	c.mv	a4,s4
	auipc	ra,0x0
	jalr	ra,-428(ra)	# _ZN4core3fmt9Formatter12pad_integral12write_prefix17hc91e4f49a171ae8cE
	c.li	s4,1
	c.bnez	a0, .Lbranch_8000fc32
	sw	s1,-60(s0)
	c.li	s1,0
	sub	a0,s11,s9
	c.lui	s5,0x10
	c.addi	s5,-1	# .Lline_table_start0+0x1fa1
	and	s6,a0,s5

.Lbranch_8000fbb2:
	and	a0,s1,s5
	bgeu	a0,s6, .Lbranch_8000fbde
	lw	a2,16(s2)
	c.addi	s1,1
	addi	a1,zero,48
	c.mv	a0,s8
	c.jalr	a2
	c.beqz	a0, .Lbranch_8000fbb2
	c.j	 .Lbranch_8000fc32

.Lbranch_8000fbcc:
	c.li	a1,2
	c.mv	s11,a2
	bne	a0,a1, .Lbranch_8000fc00
	slli	a0,a2,0x10
	srli	s11,a0,0x11
	c.j	 .Lbranch_8000fc00

.Lbranch_8000fbde:
	lw	a3,12(s2)
	c.mv	a0,s8
	lw	a1,-56(s0)
	c.mv	a2,s3
	c.jalr	a3
	c.bnez	a0, .Lbranch_8000fc32
	c.li	s4,0
	sw	s10,8(s7)
	lw	a0,-60(s0)
	sw	a0,12(s7)
	c.j	 .Lbranch_8000fc32

.Lbranch_8000fbfe:
	c.mv	s11,a2

.Lbranch_8000fc00:
	sw	a2,-60(s0)
	c.li	s2,0
	srli	s8,s1,0xb
	lw	s9,0(s7)
	lw	s7,4(s7)
	c.lui	s1,0x10
	c.addi	s1,-1	# .Lline_table_start0+0x1fa1
	and	s10,s11,s1

.Lbranch_8000fc1a:
	and	a0,s2,s1
	bgeu	a0,s10, .Lbranch_8000fc52
	lw	a2,16(s7)
	c.addi	s2,1
	c.mv	a0,s9
	c.mv	a1,s8
	c.jalr	a2
	c.beqz	a0, .Lbranch_8000fc1a

.Lbranch_8000fc30:
	c.li	s4,1

.Lbranch_8000fc32:
	c.mv	a0,s4
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.lwsp	s11,12(sp)
	c.addi16sp	sp,64
	c.jr	ra

.Lbranch_8000fc52:
	c.mv	a0,s9
	c.mv	a1,s7
	c.mv	a2,s6
	c.mv	a3,s5
	c.mv	a4,s4
	auipc	ra,0x0
	jalr	ra,-628(ra)	# _ZN4core3fmt9Formatter12pad_integral12write_prefix17hc91e4f49a171ae8cE
	c.li	s4,1
	c.bnez	a0, .Lbranch_8000fc32
	lw	a3,12(s7)
	c.mv	a0,s9
	lw	a1,-56(s0)
	c.mv	a2,s3
	c.jalr	a3
	c.bnez	a0, .Lbranch_8000fc32
	c.li	s1,0
	lw	a0,-60(s0)
	sub	a0,a0,s11
	c.lui	s2,0x10
	c.addi	s2,-1	# .Lline_table_start0+0x1fa1
	and	s3,a0,s2

.Lbranch_8000fc8a:
	and	a0,s1,s2
	sltu	s4,a0,s3
	bgeu	a0,s3, .Lbranch_8000fc32
	lw	a2,16(s7)
	c.addi	s1,1
	c.mv	a0,s9
	c.mv	a1,s8
	c.jalr	a2
	c.beqz	a0, .Lbranch_8000fc8a
	c.j	 .Lbranch_8000fc32
	# ... (zero-filled gap)

	.globl _ZN4core3fmt9Formatter25debug_tuple_field1_finish17hdbc93a39fb14fcabE
_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hdbc93a39fb14fcabE:
	c.addi16sp	sp,-80
	c.swsp	ra,76(sp)
	c.swsp	s0,72(sp)
	c.swsp	s1,68(sp)
	c.swsp	s2,64(sp)
	c.swsp	s3,60(sp)
	c.swsp	s4,56(sp)
	c.swsp	s5,52(sp)
	c.swsp	s6,48(sp)
	c.swsp	s7,44(sp)
	c.swsp	s8,40(sp)
	c.addi4spn	s0,sp,80
	c.mv	s5,a4
	c.mv	s4,a3
	c.mv	s2,a2
	c.mv	s6,a0
	lw	s7,4(a0)	# __heap_end+0x1fb00004
	lw	s8,0(a0)
	lw	s1,12(s7)
	c.mv	a0,s8
	c.jalr	s1
	c.li	s3,1
	c.beqz	a0, .Lbranch_8000fcf6

.Lbranch_8000fcdc:
	c.mv	a0,s3
	c.lwsp	ra,76(sp)
	c.lwsp	s0,72(sp)
	c.lwsp	s1,68(sp)
	c.lwsp	s2,64(sp)
	c.lwsp	s3,60(sp)
	c.lwsp	s4,56(sp)
	c.lwsp	s5,52(sp)
	c.lwsp	s6,48(sp)
	c.lwsp	s7,44(sp)
	c.lwsp	s8,40(sp)
	c.addi16sp	sp,80
	c.jr	ra

.Lbranch_8000fcf6:
	lbu	a0,10(s6)	# .Lline_table_start1+0xc3eb5
	andi	a0,a0,128
	c.bnez	a0, .Lbranch_8000fd20
	lui	a1,0x8001d
	addi	a1,a1,1856	# .Lanon.93378afd097c98d6944e7e9e652eb25e.43
	c.li	a2,1
	c.li	s3,1
	c.mv	a0,s8
	c.jalr	s1
	c.bnez	a0, .Lbranch_8000fcdc
	lw	a2,12(s5)
	c.mv	a0,s4
	c.mv	a1,s6
	c.jalr	a2
	c.bnez	a0, .Lbranch_8000fcdc
	c.j	 .Lbranch_8000fd90

.Lbranch_8000fd20:
	lui	a1,0x8001d
	addi	a1,a1,1860	# .Lanon.93378afd097c98d6944e7e9e652eb25e.44
	c.li	a2,2
	c.mv	a0,s8
	c.jalr	s1
	c.bnez	a0, .Lbranch_8000fcdc
	c.li	s3,1
	addi	a0,s0,-57
	lw	a1,8(s6)
	lw	a2,12(s6)
	addi	a3,s0,-72
	sw	s8,-72(s0)
	sw	s7,-68(s0)
	sw	a0,-64(s0)
	lui	a0,0x8001d
	addi	a0,a0,1872	# .Lanon.93378afd097c98d6944e7e9e652eb25e.50
	lw	a4,12(s5)
	sb	s3,-57(s0)
	sw	a3,-56(s0)
	sw	a0,-52(s0)
	sw	a1,-48(s0)
	sw	a2,-44(s0)
	addi	a1,s0,-56
	c.mv	a0,s4
	c.jalr	a4
	c.bnez	a0, .Lbranch_8000fcdc
	lw	a1,-52(s0)
	lw	a0,-56(s0)
	c.lw	a3,12(a1)
	lui	a1,0x8001d
	addi	a1,a1,1852	# .Lanon.93378afd097c98d6944e7e9e652eb25e.42
	c.li	a2,2
	c.jalr	a3
	c.bnez	a0, .Lbranch_8000fcdc

.Lbranch_8000fd90:
	bne	s2,zero, .Lbranch_8000fdb8
	lbu	a0,10(s6)
	andi	a0,a0,128
	c.bnez	a0, .Lbranch_8000fdb8
	lw	a1,4(s6)
	lw	a0,0(s6)
	c.lw	a3,12(a1)
	lui	a1,0x8001d
	addi	a1,a1,1868	# .Lanon.93378afd097c98d6944e7e9e652eb25e.49
	c.li	a2,1
	c.li	s3,1
	c.jalr	a3
	c.bnez	a0, .Lbranch_8000fcdc

.Lbranch_8000fdb8:
	lw	a1,4(s6)
	lw	a0,0(s6)
	c.lw	a3,12(a1)
	lui	a1,0x8001d
	addi	a1,a1,1864	# .Lanon.93378afd097c98d6944e7e9e652eb25e.48
	c.li	a2,1
	c.jalr	a3
	c.mv	s3,a0
	c.j	 .Lbranch_8000fcdc
	# ... (zero-filled gap)

	.globl _ZN4core3fmt9Formatter3pad17hbe2da4ac9d241087E
_ZN4core3fmt9Formatter3pad17hbe2da4ac9d241087E:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.swsp	s1,36(sp)
	c.swsp	s2,32(sp)
	c.swsp	s3,28(sp)
	c.swsp	s4,24(sp)
	c.swsp	s5,20(sp)
	c.swsp	s6,16(sp)
	c.swsp	s7,12(sp)
	c.swsp	s8,8(sp)
	c.swsp	s9,4(sp)
	c.swsp	s10,0(sp)
	c.addi4spn	s0,sp,48
	c.mv	s3,a2
	c.lw	s1,8(a0)
	lui	a2,0x18000
	c.and	a2,s1
	c.mv	s2,a1
	c.beqz	a2, .Lbranch_8000feb2
	slli	a1,s1,0x3
	blt	a1,zero, .Lbranch_8000fe50
	c.li	a1,16
	bgeu	s3,a1, .Lbranch_8000fed8
	c.li	a1,0
	beq	s3,zero, .Lbranch_8000fe2c
	add	a2,s2,s3
	c.mv	a3,s2

.Lbranch_8000fe18:
	lb	a4,0(a3)
	c.addi	a3,1
	slti	a4,a4,-64
	xori	a4,a4,1
	c.add	a1,a4
	bne	a3,a2, .Lbranch_8000fe18

.Lbranch_8000fe2c:
	lhu	a2,12(a0)
	bgeu	a1,a2, .Lbranch_8000feb2

.Lbranch_8000fe34:
	c.li	s7,0
	sub	s6,a2,a1
	slli	a2,s1,0x1
	c.srli	a2,0x1e
	c.li	a3,1
	slli	a1,s1,0xb
	blt	a3,a2, .Lbranch_8000fef4
	c.beqz	a2, .Lbranch_8000ff02
	c.mv	s7,s6
	c.j	 .Lbranch_8000ff02

.Lbranch_8000fe50:
	lhu	a1,14(a0)
	beq	a1,zero, .Lbranch_8000ff5e
	add	a3,s2,s3
	addi	a7,zero,224
	addi	a6,zero,240
	c.mv	a5,s2
	c.mv	a2,a1
	c.li	s3,0
	c.j	 .Lbranch_8000fe7e

.Lbranch_8000fe6c:
	addi	a4,a5,1

.Lbranch_8000fe70:
	sub	a5,a5,s3
	c.addi	a2,-1	# .Lline_table_start1+0x17fb3eaa
	sub	s3,a4,a5
	c.mv	a5,a4
	c.beqz	a2, .Lbranch_8000fea8

.Lbranch_8000fe7e:
	beq	a5,a3, .Lbranch_8000fea8
	lb	a4,0(a5)
	bge	a4,zero, .Lbranch_8000fe6c
	andi	a4,a4,255
	bltu	a4,a7, .Lbranch_8000fe9c
	bltu	a4,a6, .Lbranch_8000fea2
	addi	a4,a5,4
	c.j	 .Lbranch_8000fe70

.Lbranch_8000fe9c:
	addi	a4,a5,2
	c.j	 .Lbranch_8000fe70

.Lbranch_8000fea2:
	addi	a4,a5,3
	c.j	 .Lbranch_8000fe70

.Lbranch_8000fea8:
	c.sub	a1,a2
	lhu	a2,12(a0)
	bltu	a1,a2, .Lbranch_8000fe34

.Lbranch_8000feb2:
	c.lw	a1,4(a0)
	c.lw	a0,0(a0)
	c.lw	a5,12(a1)
	c.mv	a1,s2
	c.mv	a2,s3
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.lwsp	s4,24(sp)
	c.lwsp	s5,20(sp)
	c.lwsp	s6,16(sp)
	c.lwsp	s7,12(sp)
	c.lwsp	s8,8(sp)
	c.lwsp	s9,4(sp)
	c.lwsp	s10,0(sp)
	c.addi16sp	sp,48
	c.jr	a5

.Lbranch_8000fed8:
	c.mv	s4,a0
	c.mv	a0,s2
	c.mv	a1,s3
	auipc	ra,0x0
	jalr	ra,850(ra)	# _ZN4core3str5count14do_count_chars17hd561aaa31ab077b5E
	c.mv	a1,a0
	c.mv	a0,s4
	lhu	a2,12(s4)
	bgeu	a1,a2, .Lbranch_8000feb2
	c.j	 .Lbranch_8000fe34

.Lbranch_8000fef4:
	c.li	a3,2
	bne	a2,a3, .Lbranch_8000ff02
	slli	a2,s6,0x10
	srli	s7,a2,0x11

.Lbranch_8000ff02:
	c.li	s1,0
	srli	s4,a1,0xb
	lw	s5,0(a0)
	lw	s8,4(a0)
	c.lui	s9,0x10
	c.addi	s9,-1	# .Lline_table_start0+0x1fa1
	and	s10,s7,s9

.Lbranch_8000ff18:
	and	a0,s1,s9
	bgeu	a0,s10, .Lbranch_8000ff30
	lw	a2,16(s8)
	c.addi	s1,1
	c.mv	a0,s5
	c.mv	a1,s4
	c.jalr	a2
	c.beqz	a0, .Lbranch_8000ff18
	c.j	 .Lbranch_8000ff3e

.Lbranch_8000ff30:
	lw	a3,12(s8)
	c.mv	a0,s5
	c.mv	a1,s2
	c.mv	a2,s3
	c.jalr	a3
	c.beqz	a0, .Lbranch_8000ff6c

.Lbranch_8000ff3e:
	c.li	s2,1

.Lbranch_8000ff40:
	c.mv	a0,s2
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.lwsp	s4,24(sp)
	c.lwsp	s5,20(sp)
	c.lwsp	s6,16(sp)
	c.lwsp	s7,12(sp)
	c.lwsp	s8,8(sp)
	c.lwsp	s9,4(sp)
	c.lwsp	s10,0(sp)
	c.addi16sp	sp,48
	c.jr	ra

.Lbranch_8000ff5e:
	c.li	s3,0
	c.mv	a1,a1
	lhu	a2,12(a0)
	bltu	a1,a2, .Lbranch_8000fe34
	c.j	 .Lbranch_8000feb2

.Lbranch_8000ff6c:
	c.li	s1,0
	sub	a0,s6,s7
	c.lui	s3,0x10
	c.addi	s3,-1	# .Lline_table_start0+0x1fa1
	and	s6,a0,s3

.Lbranch_8000ff7a:
	and	a0,s1,s3
	sltu	s2,a0,s6
	bgeu	a0,s6, .Lbranch_8000ff40
	lw	a2,16(s8)
	c.addi	s1,1
	c.mv	a0,s5
	c.mv	a1,s4
	c.jalr	a2
	c.beqz	a0, .Lbranch_8000ff7a
	c.j	 .Lbranch_8000ff40
	# ... (zero-filled gap)

	.globl _ZN4core3fmt9Formatter9write_str17h294a432de2db79d0E
_ZN4core3fmt9Formatter9write_str17h294a432de2db79d0E:
	c.lw	a3,4(a0)
	c.lw	a0,0(a0)
	c.lw	a5,12(a3)
	c.jr	a5

	.globl _ZN4core3str16slice_error_fail17h073402faa99e0899E
_ZN4core3str16slice_error_fail17h073402faa99e0899E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	auipc	ra,0x0
	jalr	ra,8(ra)	# _ZN4core3str19slice_error_fail_rt17hd2a3f92f8f5973a6E

	.globl _ZN4core3str19slice_error_fail_rt17hd2a3f92f8f5973a6E
_ZN4core3str19slice_error_fail_rt17hd2a3f92f8f5973a6E:
	c.addi16sp	sp,-96
	c.swsp	ra,92(sp)
	c.swsp	s0,88(sp)
	c.addi4spn	s0,sp,96
	sw	a2,-88(s0)
	addi	a5,zero,257
	sw	a3,-84(s0)
	bgeu	a1,a5, .Lbranch_8000ffd6
	c.li	a5,0
	sw	a0,-80(s0)
	sw	a1,-76(s0)
	c.li	a6,1
	c.j	 .Lbranch_80010012

.Lbranch_8000ffd6:
	addi	t0,zero,256
	addi	a6,zero,-65

.Lbranch_8000ffde:
	add	a5,a0,t0
	lb	a5,0(a5)
	blt	a6,a5, .Lbranch_8000fff0
	c.addi	t0,-1
	bne	t0,zero, .Lbranch_8000ffde

.Lbranch_8000fff0:
	sw	a0,-80(s0)
	sw	t0,-76(s0)
	sltu	a7,t0,a1
	bltu	t0,a1, .Lbranch_80010004
	c.li	a6,1
	c.j	 .Lbranch_8001000c

.Lbranch_80010004:
	lui	a6,0x8001e
	addi	a6,a6,-1796	# .Lanon.93378afd097c98d6944e7e9e652eb25e.204

.Lbranch_8001000c:
	sub	a5,zero,a7
	c.andi	a5,5

.Lbranch_80010012:
	sw	a6,-72(s0)
	sw	a5,-68(s0)
	bltu	a1,a2, .Lbranch_8001018a
	bltu	a1,a3, .Lbranch_80010188
	bltu	a3,a2, .Lbranch_800101d8
	c.beqz	a2, .Lbranch_80010044
	bgeu	a2,a1, .Lbranch_80010044
	c.add	a2,a0
	lb	a3,0(a2)
	addi	a5,zero,-65
	addi	a2,s0,-84
	blt	a5,a3, .Lbranch_80010042
	addi	a2,s0,-88

.Lbranch_80010042:
	c.lw	a3,0(a2)

.Lbranch_80010044:
	sw	a3,-64(s0)
	bgeu	a3,a1, .Lbranch_80010066
	c.beqz	a3, .Lbranch_80010062
	addi	a2,zero,-65

.Lbranch_80010052:
	add	a5,a0,a3
	lb	a5,0(a5)
	blt	a2,a5, .Lbranch_80010062
	c.addi	a3,-1
	c.bnez	a3, .Lbranch_80010052

.Lbranch_80010062:
	bne	a3,a1, .Lbranch_80010070

.Lbranch_80010066:
	c.mv	a0,a4
	auipc	ra,0x1
	jalr	ra,-600(ra)	# _ZN4core6option13unwrap_failed17hca83384b1d4f0231E

.Lbranch_80010070:
	c.add	a0,a3
	lb	a2,0(a0)
	andi	a1,a2,255
	blt	a2,zero, .Lbranch_80010086
	sw	a1,-60(s0)
	c.li	a0,1
	c.j	 .Lbranch_8001010c

.Lbranch_80010086:
	lbu	a5,1(a0)
	andi	a2,a1,31
	addi	a6,zero,223
	andi	a5,a5,63
	bgeu	a6,a1, .Lbranch_800100d2
	lbu	a6,2(a0)
	slli	a7,a5,0x6
	andi	a5,a6,63
	addi	a6,zero,240
	or	a5,a7,a5
	bltu	a1,a6, .Lbranch_800100e8
	lbu	a0,3(a0)
	c.slli	a2,0x1d
	c.srli	a2,0xb
	c.slli	a5,0x6
	andi	a0,a0,63
	c.or	a0,a5
	c.or	a0,a2
	addi	a1,zero,128
	sw	a0,-60(s0)
	bltu	a0,a1, .Lbranch_800100e4
	c.j	 .Lbranch_800100fa

.Lbranch_800100d2:
	slli	a0,a2,0x6
	c.or	a0,a5
	addi	a1,zero,128
	sw	a0,-60(s0)
	bgeu	a0,a1, .Lbranch_800100fa

.Lbranch_800100e4:
	c.li	a0,1
	c.j	 .Lbranch_8001010c

.Lbranch_800100e8:
	slli	a0,a2,0xc
	c.or	a0,a5
	addi	a1,zero,128
	sw	a0,-60(s0)
	bltu	a0,a1, .Lbranch_800100e4

.Lbranch_800100fa:
	srli	a1,a0,0xb
	c.bnez	a1, .Lbranch_80010104
	c.li	a0,2
	c.j	 .Lbranch_8001010c

.Lbranch_80010104:
	c.srli	a0,0x10
	sltu	a0,zero,a0
	c.addi	a0,3

.Lbranch_8001010c:
	c.add	a0,a3
	addi	a6,s0,-64
	lui	a7,0x8000f
	addi	a7,a7,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	t1,s0,-60
	lui	a1,0x8000f
	addi	a1,a1,912	# _ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h05a6d6406a274b12E
	addi	t0,s0,-56
	lui	a2,0x80011
	addi	a2,a2,1864	# _ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h715062feb1359c13E
	addi	a5,s0,-80
	sw	a3,-56(s0)
	sw	a0,-52(s0)
	lui	a0,0x8000f
	addi	a0,a0,1116	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h1f4467a62b6da94dE
	sw	a6,-48(s0)
	sw	a7,-44(s0)
	sw	t1,-40(s0)
	sw	a1,-36(s0)
	addi	a1,s0,-72
	sw	t0,-32(s0)
	sw	a2,-28(s0)
	sw	a5,-24(s0)
	sw	a0,-20(s0)
	sw	a1,-16(s0)
	sw	a0,-12(s0)
	lui	a0,0x80012
	addi	a0,a0,-1148	# anon.3839376bf29ad69682d1272c1c63f1dd.23.llvm.7710812085696039936+0x74
	addi	a1,s0,-48
	c.mv	a2,a4
	auipc	ra,0x1
	jalr	ra,812(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE

.Lbranch_80010188:
	c.mv	a2,a3

.Lbranch_8001018a:
	sw	a2,-56(s0)
	addi	a0,s0,-56
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	a2,s0,-80
	lui	a3,0x8000f
	addi	a3,a3,1116	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h1f4467a62b6da94dE
	addi	a5,s0,-72
	sw	a0,-48(s0)
	sw	a1,-44(s0)
	sw	a2,-40(s0)
	sw	a3,-36(s0)
	sw	a5,-32(s0)
	sw	a3,-28(s0)
	lui	a0,0x80013
	addi	a0,a0,-1884	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.1.llvm.2171931009800262987+0xf4
	addi	a1,s0,-48
	c.mv	a2,a4
	auipc	ra,0x1
	jalr	ra,732(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE

.Lbranch_800101d8:
	addi	a0,s0,-88
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	a2,s0,-84
	addi	a3,s0,-80
	lui	a5,0x8000f
	addi	a5,a5,1116	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h1f4467a62b6da94dE
	sw	a0,-48(s0)
	sw	a1,-44(s0)
	sw	a2,-40(s0)
	sw	a1,-36(s0)
	addi	a0,s0,-72
	sw	a3,-32(s0)
	sw	a5,-28(s0)
	sw	a0,-24(s0)
	sw	a5,-20(s0)
	lui	a0,0x80012
	addi	a0,a0,-1372	# anon.3839376bf29ad69682d1272c1c63f1dd.7.llvm.7710812085696039936+0x1d4
	addi	a1,s0,-48
	c.mv	a2,a4
	auipc	ra,0x1
	jalr	ra,646(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE
	# ... (zero-filled gap)

	.globl _ZN4core3str5count14do_count_chars17hd561aaa31ab077b5E
_ZN4core3str5count14do_count_chars17hd561aaa31ab077b5E:
	c.addi	sp,-16
	c.swsp	s0,12(sp)
	c.mv	a2,a0
	c.addi	a0,3
	c.andi	a0,-4
	sub	a4,a0,a2
	bgeu	a1,a4, .Lbranch_80010262

.Lbranch_80010242:
	c.li	a0,0
	c.beqz	a1, .Lbranch_8001025c
	c.add	a1,a2

.Lbranch_80010248:
	lb	a3,0(a2)
	c.addi	a2,1
	slti	a3,a3,-64
	xori	a3,a3,1
	c.add	a0,a3
	bne	a2,a1, .Lbranch_80010248

.Lbranch_8001025c:
	c.lwsp	s0,12(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_80010262:
	sub	a6,a1,a4
	srli	t2,a6,0x2
	beq	t2,zero, .Lbranch_80010242
	c.add	a4,a2
	andi	a1,a6,3
	c.li	a5,0
	beq	a0,a2, .Lbranch_8001028e

.Lbranch_8001027a:
	lb	a0,0(a2)
	c.addi	a2,1
	slti	a0,a0,-64
	xori	a0,a0,1
	c.add	a5,a0
	bne	a2,a4, .Lbranch_8001027a

.Lbranch_8001028e:
	c.li	a0,0
	c.beqz	a1, .Lbranch_800102b2
	lui	a2,0x80000
	c.addi	a2,-4	# .Lline_table_start1+0x7ffb3ea7
	and	a2,a6,a2
	c.add	a2,a4

.Lbranch_8001029e:
	lb	a3,0(a2)
	c.addi	a1,-1
	slti	a3,a3,-64
	xori	a3,a3,1
	c.add	a0,a3
	c.addi	a2,1
	c.bnez	a1, .Lbranch_8001029e

.Lbranch_800102b2:
	lui	a1,0x1010
	lui	a3,0xff0
	addi	t4,a1,257	# .Lline_table_start1+0xfc3fac
	addi	a6,a3,255	# .Lline_table_start1+0xfa3faa
	c.add	a0,a5
	c.j	 .Lbranch_800102ec

.Lbranch_800102c6:
	add	a4,t0,t1
	sub	t2,t2,a7
	andi	a3,a7,3
	and	a1,t5,a6
	srli	a2,t5,0x8
	and	a2,a2,a6
	c.add	a1,a2
	slli	a2,a1,0x10
	c.add	a1,a2
	c.srli	a1,0x10
	c.add	a0,a1
	c.bnez	a3, .Lbranch_80010366

.Lbranch_800102ec:
	beq	t2,zero, .Lbranch_8001025c
	c.mv	t0,a4
	addi	a1,zero,192
	c.mv	a7,t2
	bltu	t2,a1, .Lbranch_80010300
	addi	a7,zero,192

.Lbranch_80010300:
	slli	t1,a7,0x2
	c.li	t5,0
	andi	a1,t1,1008
	c.beqz	a1, .Lbranch_800102c6
	add	t3,t0,a1
	c.mv	a4,t0

.Lbranch_80010312:
	lw	t6,0(a4)
	c.lw	s0,4(a4)
	c.lw	a2,8(a4)
	c.lw	a5,12(a4)
	xori	a3,t6,-1
	srli	a1,t6,0x6
	c.srli	a3,0x7
	c.or	a1,a3
	xori	a3,s0,-1
	c.srli	s0,0x6
	c.srli	a3,0x7
	c.or	a3,s0
	xori	s0,a2,-1
	c.srli	a2,0x6
	c.srli	s0,0x7
	c.or	a2,s0
	xori	s0,a5,-1
	c.srli	a5,0x6
	c.srli	s0,0x7
	c.or	a5,s0
	and	a1,a1,t4
	c.add	a1,t5
	and	a3,a3,t4
	and	a2,a2,t4
	and	t5,a5,t4
	c.add	a2,a3
	c.add	a1,a2
	c.addi	a4,16
	c.add	t5,a1
	bne	a4,t3, .Lbranch_80010312
	c.j	 .Lbranch_800102c6

.Lbranch_80010366:
	c.li	a1,0
	andi	a2,a7,252
	c.slli	a2,0x2
	c.add	t0,a2
	c.slli	a3,0x2

.Lbranch_80010372:
	lw	a2,0(t0)
	c.addi	t0,4
	xori	a4,a2,-1
	c.srli	a2,0x6
	c.srli	a4,0x7
	c.or	a2,a4
	and	a2,a2,t4
	c.addi	a3,-4
	c.add	a1,a2
	c.bnez	a3, .Lbranch_80010372
	and	a2,a1,a6
	c.srli	a1,0x8
	and	a1,a1,a6
	c.add	a1,a2
	slli	a2,a1,0x10
	c.add	a1,a2
	c.srli	a1,0x10
	c.add	a0,a1
	c.lwsp	s0,12(sp)
	c.addi	sp,16
	c.jr	ra

	.globl _ZN4core3str7pattern11StrSearcher3new17h665d7cbb00f75ce2E
_ZN4core3str7pattern11StrSearcher3new17h665d7cbb00f75ce2E:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.swsp	s1,36(sp)
	c.swsp	s2,32(sp)
	c.swsp	s3,28(sp)
	c.swsp	s4,24(sp)
	c.swsp	s5,20(sp)
	c.swsp	s6,16(sp)
	c.swsp	s7,12(sp)
	c.swsp	s8,8(sp)
	c.swsp	s9,4(sp)
	c.addi4spn	s0,sp,48
	c.mv	s4,a3
	c.mv	s2,a2
	c.mv	s5,a1
	c.mv	s3,a0
	c.beqz	a4, .Lbranch_80010450
	c.mv	s9,a4
	c.li	s7,1
	bne	a4,s7, .Lbranch_8001047a
	c.li	s6,0
	c.li	a1,0
	c.li	a6,1

.Lbranch_800103da:
	bltu	a1,s6, .Lbranch_800103e2
	c.mv	s6,a1
	c.mv	s7,a6

.Lbranch_800103e2:
	bltu	s9,s6, .Lbranch_800106de
	add	a1,s7,s6
	bltu	a1,s7, .Lbranch_800106f4
	bltu	s9,a1, .Lbranch_800106f4
	add	s8,s4,s7
	c.mv	a0,s4
	c.mv	a1,s8
	c.mv	a2,s6
	auipc	ra,0x1
	jalr	ra,928(ra)	# memcmp
	beq	a0,zero, .Lbranch_80010540
	c.li	a0,0
	c.li	a1,0
	c.li	a6,1
	add	a7,s4,s9
	c.mv	a4,s4

.Lbranch_80010414:
	lbu	a5,0(a4)
	c.addi	a4,1
	andi	s1,a5,63
	sll	a5,a6,a5
	sll	a2,a6,s1
	c.addi	s1,-32
	slti	a3,s1,0
	c.srai	s1,0x1f
	c.addi	a3,-1
	c.and	a5,s1
	c.and	a2,a3
	c.or	a0,a5
	c.or	a1,a2
	bne	a4,a7, .Lbranch_80010414
	sub	s7,s9,s6
	bltu	s6,s7, .Lbranch_80010446
	c.mv	s7,s6

.Lbranch_80010446:
	c.addi	s7,1
	c.li	a3,-1
	c.mv	a6,s6
	c.li	a4,-1
	c.j	 .Lbranch_8001068a

.Lbranch_80010450:
	sb	zero,14(s3)
	sw	s5,48(s3)
	sw	s2,52(s3)
	sw	s4,56(s3)
	sw	zero,60(s3)
	addi	a0,zero,257
	sw	zero,0(s3)
	sw	zero,4(s3)
	sw	s2,8(s3)
	sh	a0,12(s3)
	c.j	 .Lbranch_800106c4

.Lbranch_8001047a:
	c.li	a1,0
	c.li	s6,0
	c.li	a3,1
	c.li	a2,1
	c.li	s7,1
	c.j	 .Lbranch_80010498

.Lbranch_80010486:
	c.add	a2,a1
	c.li	a1,0
	c.addi	a2,1
	sub	s7,a2,s6

.Lbranch_80010490:
	add	a3,a2,a1
	bgeu	a3,s9, .Lbranch_800104de

.Lbranch_80010498:
	add	a0,s6,a1
	bgeu	a0,s9, .Lbranch_80010708
	c.add	a3,s4
	add	a4,s4,a0
	lbu	a0,0(a3)
	lbu	a3,0(a4)
	bltu	a0,a3, .Lbranch_80010486
	bne	a0,a3, .Lbranch_800104d4
	addi	a0,a1,1
	xor	a1,a0,s7
	sltiu	a1,a1,1
	addi	a3,a1,-1
	sub	a4,zero,a1
	and	a1,a3,a0
	c.and	a0,a4
	c.add	a2,a0
	c.j	 .Lbranch_80010490

.Lbranch_800104d4:
	c.li	a1,0
	c.mv	s6,a2
	c.addi	a2,1
	c.li	s7,1
	c.j	 .Lbranch_80010490

.Lbranch_800104de:
	c.li	a3,0
	c.li	a1,0
	c.li	a5,1
	c.li	a4,1
	c.li	a6,1
	c.j	 .Lbranch_800104fc

.Lbranch_800104ea:
	c.add	a4,a3
	c.li	a3,0
	c.addi	a4,1
	sub	a6,a4,a1

.Lbranch_800104f4:
	add	a5,a4,a3
	bgeu	a5,s9, .Lbranch_800103da

.Lbranch_800104fc:
	add	a0,a1,a3
	bgeu	a0,s9, .Lbranch_80010708
	c.add	a5,s4
	add	a2,s4,a0
	lbu	a0,0(a5)
	lbu	a5,0(a2)
	bltu	a5,a0, .Lbranch_800104ea
	bne	a0,a5, .Lbranch_80010536
	addi	a0,a3,1
	xor	a2,a0,a6
	sltiu	a2,a2,1
	addi	a3,a2,-1
	sub	a2,zero,a2
	c.and	a3,a0
	c.and	a0,a2
	c.add	a4,a0
	c.j	 .Lbranch_800104f4

.Lbranch_80010536:
	c.li	a3,0
	c.mv	a1,a4
	c.addi	a4,1
	c.li	a6,1
	c.j	 .Lbranch_800104f4

.Lbranch_80010540:
	c.li	a4,0
	c.li	a7,0
	addi	a6,s9,-1
	c.li	a5,1
	c.li	a2,1
	c.j	 .Lbranch_8001055e

.Lbranch_8001054e:
	c.li	a4,0
	addi	a0,a3,1
	sub	a5,a0,a7
	c.mv	a2,a0
	beq	a5,s7, .Lbranch_800105c6

.Lbranch_8001055e:
	add	a3,a2,a4
	bgeu	a3,s9, .Lbranch_800105c6
	xori	a0,a2,-1
	sub	a1,s9,a4
	c.add	a0,a1
	bgeu	a0,s9, .Lbranch_8001071a
	add	a1,a4,a7
	sub	a1,a6,a1
	bgeu	a1,s9, .Lbranch_8001072c
	c.add	a0,s4
	c.add	a1,s4
	lbu	a0,0(a0)
	lbu	a1,0(a1)
	bltu	a0,a1, .Lbranch_8001054e
	bne	a0,a1, .Lbranch_800105b6
	addi	a0,a4,1
	xor	a1,a0,a5
	sltiu	a1,a1,1
	addi	a4,a1,-1
	sub	a1,zero,a1
	c.and	a4,a0
	c.and	a0,a1
	c.add	a0,a2
	c.mv	a2,a0
	bne	a5,s7, .Lbranch_8001055e
	c.j	 .Lbranch_800105c6

.Lbranch_800105b6:
	c.li	a4,0
	addi	a0,a2,1
	c.li	a5,1
	c.mv	a7,a2
	c.mv	a2,a0
	bne	a5,s7, .Lbranch_8001055e

.Lbranch_800105c6:
	c.li	a5,0
	c.li	a2,0
	c.li	t0,1
	c.li	a3,1
	c.j	 .Lbranch_800105e0

.Lbranch_800105d0:
	c.li	a5,0
	addi	a0,a4,1
	sub	t0,a0,a2
	c.mv	a3,a0
	beq	t0,s7, .Lbranch_80010648

.Lbranch_800105e0:
	add	a4,a3,a5
	bgeu	a4,s9, .Lbranch_80010648
	xori	a0,a3,-1
	sub	a1,s9,a5
	c.add	a0,a1
	bgeu	a0,s9, .Lbranch_8001071a
	add	a1,a5,a2
	sub	a1,a6,a1
	bgeu	a1,s9, .Lbranch_8001072c
	c.add	a0,s4
	c.add	a1,s4
	lbu	a0,0(a0)
	lbu	a1,0(a1)
	bltu	a1,a0, .Lbranch_800105d0
	bne	a0,a1, .Lbranch_80010638
	addi	a0,a5,1
	xor	a1,a0,t0
	sltiu	a1,a1,1
	addi	a5,a1,-1
	sub	a1,zero,a1
	c.and	a5,a0
	c.and	a0,a1
	c.add	a0,a3
	c.mv	a3,a0
	bne	t0,s7, .Lbranch_800105e0
	c.j	 .Lbranch_80010648

.Lbranch_80010638:
	c.li	a5,0
	addi	a0,a3,1
	c.li	t0,1
	c.mv	a2,a3
	c.mv	a3,a0
	bne	t0,s7, .Lbranch_800105e0

.Lbranch_80010648:
	bltu	a7,a2, .Lbranch_8001064e
	c.mv	a2,a7

.Lbranch_8001064e:
	sub	a6,s9,a2
	c.li	a0,0
	c.li	a1,0
	beq	s7,zero, .Lbranch_80010686
	c.li	a7,1
	c.mv	a4,s4

.Lbranch_8001065e:
	lbu	a5,0(a4)
	c.addi	a4,1
	andi	s1,a5,63
	sll	a5,a7,a5
	sll	a2,a7,s1
	c.addi	s1,-32
	slti	a3,s1,0
	c.srai	s1,0x1f
	c.addi	a3,-1
	c.and	a5,s1
	c.and	a2,a3
	c.or	a0,a5
	c.or	a1,a2
	bne	a4,s8, .Lbranch_8001065e

.Lbranch_80010686:
	c.li	a3,0
	c.mv	a4,s9

.Lbranch_8001068a:
	sw	a3,36(s3)
	sw	a4,40(s3)
	sw	s5,48(s3)
	sw	s2,52(s3)
	sw	s4,56(s3)
	sw	s9,60(s3)
	c.li	a2,1
	sw	a2,0(s3)
	sw	a0,8(s3)
	sw	a1,12(s3)
	sw	s6,16(s3)
	sw	a6,20(s3)
	sw	s7,24(s3)
	sw	zero,28(s3)
	sw	s2,32(s3)

.Lbranch_800106c4:
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.lwsp	s4,24(sp)
	c.lwsp	s5,20(sp)
	c.lwsp	s6,16(sp)
	c.lwsp	s7,12(sp)
	c.lwsp	s8,8(sp)
	c.lwsp	s9,4(sp)
	c.addi16sp	sp,48
	c.jr	ra

.Lbranch_800106de:
	lui	a3,0x8001e
	addi	a3,a3,-1724	# .Lanon.93378afd097c98d6944e7e9e652eb25e.214
	c.li	a0,0
	c.mv	a1,s6
	c.mv	a2,s9
	auipc	ra,0x0
	jalr	ra,1380(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_800106f4:
	lui	a3,0x8001e
	addi	a3,a3,-1740	# .Lanon.93378afd097c98d6944e7e9e652eb25e.213
	c.mv	a0,s7
	c.mv	a2,s9
	auipc	ra,0x0
	jalr	ra,1360(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_80010708:
	lui	a2,0x8001e
	addi	a2,a2,-1788	# .Lanon.93378afd097c98d6944e7e9e652eb25e.210
	c.mv	a1,s9
	auipc	ra,0x1
	jalr	ra,-742(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8001071a:
	lui	a2,0x8001e
	addi	a2,a2,-1772	# .Lanon.93378afd097c98d6944e7e9e652eb25e.211
	c.mv	a1,s9
	auipc	ra,0x1
	jalr	ra,-760(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_8001072c:
	lui	a2,0x8001e
	addi	a2,a2,-1756	# .Lanon.93378afd097c98d6944e7e9e652eb25e.212
	c.mv	a0,a1
	c.mv	a1,s9
	auipc	ra,0x1
	jalr	ra,-780(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

	.globl _ZN4core3str8converts9from_utf817ha3661ecfe8ef34e6E
_ZN4core3str8converts9from_utf817ha3661ecfe8ef34e6E:
	c.addi16sp	sp,-64
	c.swsp	ra,60(sp)
	c.swsp	s0,56(sp)
	c.swsp	s1,52(sp)
	c.swsp	s2,48(sp)
	c.swsp	s3,44(sp)
	c.swsp	s4,40(sp)
	c.swsp	s5,36(sp)
	c.swsp	s6,32(sp)
	c.swsp	s7,28(sp)
	c.swsp	s8,24(sp)
	c.swsp	s9,20(sp)
	c.swsp	s10,16(sp)
	c.swsp	s11,12(sp)
	beq	a2,zero, .Lbranch_80010910
	c.li	a3,0
	addi	a4,a2,-7
	addi	a5,a1,3
	sub	ra,zero,a2
	lui	a6,0x8001d
	addi	a6,a6,2044	# .Lanon.93378afd097c98d6944e7e9e652eb25e.202
	c.li	s8,4
	addi	a7,zero,240
	addi	t0,zero,48
	addi	t1,zero,-65
	addi	t2,zero,-64
	addi	t3,zero,244
	addi	t4,zero,-113
	c.li	t5,2
	c.li	t6,3
	addi	s7,zero,224
	addi	s2,zero,160
	addi	s3,zero,237
	addi	s4,zero,-97
	c.li	s5,12
	addi	s6,zero,238
	sltu	s0,a2,a4
	c.addi	s0,-1
	c.and	s0,a4
	lui	a4,0x80808
	c.andi	a5,-4
	sub	s10,a5,a1
	addi	s1,a4,128	# __heap_end+0x508080
	c.li	s9,1
	c.j	 .Lbranch_800107ca

.Lbranch_800107c4:
	c.addi	a3,1
	bgeu	a3,a2, .Lbranch_80010910

.Lbranch_800107ca:
	add	a4,a1,a3
	lb	a4,0(a4)
	blt	a4,zero, .Lbranch_80010812
	sub	a4,s10,a3
	c.andi	a4,3
	c.bnez	a4, .Lbranch_800107c4
	bgeu	a3,s0, .Lbranch_800107f6

.Lbranch_800107e2:
	add	a4,a1,a3
	c.lw	a5,0(a4)
	c.lw	a4,4(a4)
	c.or	a4,a5
	c.and	a4,s1
	c.bnez	a4, .Lbranch_800107f6
	c.addi	a3,8
	bltu	a3,s0, .Lbranch_800107e2

.Lbranch_800107f6:
	bgeu	a3,a2, .Lbranch_8001088a
	sub	a5,zero,a3
	c.add	a3,a1

.Lbranch_80010800:
	lb	a4,0(a3)
	blt	a4,zero, .Lbranch_80010886
	c.addi	a5,-1
	c.addi	a3,1
	bne	ra,a5, .Lbranch_80010800
	c.j	 .Lbranch_80010910

.Lbranch_80010812:
	andi	a5,a4,255
	add	a4,a6,a5
	lbu	a4,0(a4)
	beq	a4,s8, .Lbranch_80010864
	beq	a4,t6, .Lbranch_80010842
	bne	a4,t5, .Lbranch_8001091c
	addi	a5,a3,1
	bgeu	a5,a2, .Lbranch_80010918
	add	a4,a1,a5
	lb	a4,0(a4)
	c.li	s11,1
	bge	t1,a4, .Lbranch_80010908
	c.j	 .Lbranch_80010926

.Lbranch_80010842:
	addi	a4,a3,1
	bgeu	a4,a2, .Lbranch_80010918
	c.add	a4,a1
	lbu	s11,0(a4)
	beq	a5,s7, .Lbranch_80010890
	c.slli	s11,0x18
	bne	a5,s3, .Lbranch_800108a4
	srai	a4,s11,0x18
	bge	s4,a4, .Lbranch_800108bc
	c.j	 .Lbranch_8001091c

.Lbranch_80010864:
	addi	a4,a3,1
	bgeu	a4,a2, .Lbranch_80010918
	c.add	a4,a1
	lbu	s11,0(a4)
	beq	a5,a7, .Lbranch_8001089a
	c.slli	s11,0x18
	bne	a5,t3, .Lbranch_800108d2
	srai	a4,s11,0x18
	bge	t4,a4, .Lbranch_800108e2
	c.j	 .Lbranch_8001091c

.Lbranch_80010886:
	sub	a3,zero,a5

.Lbranch_8001088a:
	bltu	a3,a2, .Lbranch_800107ca
	c.j	 .Lbranch_80010910

.Lbranch_80010890:
	andi	a4,s11,224
	beq	a4,s2, .Lbranch_800108bc
	c.j	 .Lbranch_8001091c

.Lbranch_8001089a:
	addi	a4,s11,-144
	bltu	a4,t0, .Lbranch_800108e2
	c.j	 .Lbranch_8001091c

.Lbranch_800108a4:
	addi	a4,a5,-225
	bltu	a4,s5, .Lbranch_800108b4
	andi	a4,a5,254
	bne	a4,s6, .Lbranch_8001091c

.Lbranch_800108b4:
	srai	a4,s11,0x18
	bge	a4,t2, .Lbranch_8001091c

.Lbranch_800108bc:
	addi	a5,a3,2
	bgeu	a5,a2, .Lbranch_80010918
	add	a4,a1,a5
	lb	a4,0(a4)
	bge	t1,a4, .Lbranch_80010908
	c.j	 .Lbranch_80010920

.Lbranch_800108d2:
	addi	a4,a5,-241
	bltu	t5,a4, .Lbranch_8001091c
	srai	a4,s11,0x18
	bge	a4,t2, .Lbranch_8001091c

.Lbranch_800108e2:
	addi	a4,a3,2
	bgeu	a4,a2, .Lbranch_80010918
	c.add	a4,a1
	lb	a4,0(a4)
	blt	t1,a4, .Lbranch_80010920
	addi	a5,a3,3
	bgeu	a5,a2, .Lbranch_80010918
	add	a4,a1,a5
	lb	a4,0(a4)
	bge	a4,t2, .Lbranch_80010924

.Lbranch_80010908:
	addi	a3,a5,1
	bltu	a3,a2, .Lbranch_800107ca

.Lbranch_80010910:
	c.li	a3,0
	c.sw	a1,4(a0)
	c.sw	a2,8(a0)
	c.j	 .Lbranch_80010936

.Lbranch_80010918:
	c.li	s9,0
	c.j	 .Lbranch_80010926

.Lbranch_8001091c:
	c.li	s11,1
	c.j	 .Lbranch_80010926

.Lbranch_80010920:
	c.li	s11,2
	c.j	 .Lbranch_80010926

.Lbranch_80010924:
	c.li	s11,3

.Lbranch_80010926:
	andi	a1,s11,255
	c.slli	a1,0x8
	or	a1,s9,a1
	c.sw	a3,4(a0)
	c.sw	a1,8(a0)
	c.li	a3,1

.Lbranch_80010936:
	c.sw	a3,0(a0)
	c.lwsp	ra,60(sp)
	c.lwsp	s0,56(sp)
	c.lwsp	s1,52(sp)
	c.lwsp	s2,48(sp)
	c.lwsp	s3,44(sp)
	c.lwsp	s4,40(sp)
	c.lwsp	s5,36(sp)
	c.lwsp	s6,32(sp)
	c.lwsp	s7,28(sp)
	c.lwsp	s8,24(sp)
	c.lwsp	s9,20(sp)
	c.lwsp	s10,16(sp)
	c.lwsp	s11,12(sp)
	c.addi16sp	sp,64
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN4core4char7methods22_$LT$impl$u20$char$GT$16escape_debug_ext17h36e0039c2e3f7f9dE
_ZN4core4char7methods22_$LT$impl$u20$char$GT$16escape_debug_ext17h36e0039c2e3f7f9dE:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.swsp	s1,36(sp)
	c.swsp	s2,32(sp)
	c.swsp	s3,28(sp)
	c.addi4spn	s0,sp,48
	addi	a3,zero,39
	c.mv	s3,a0
	bltu	a3,a1, .Lbranch_8001098c
	slli	a0,a1,0x2
	lui	a3,0x8001d
	addi	a3,a3,408	# .LJTI314_0
	c.add	a0,a3
	c.lw	a0,0(a0)
	c.jr	a0
	c.li	s2,0
	c.lui	a0,0x3
	addi	a0,a0,92	# .Lline_table_start0+0x305c
	c.j	 .Lbranch_80010c28

.Lbranch_8001098c:
	addi	a0,zero,92
	bne	a1,a0, .Lbranch_8001099e
	c.li	s2,0
	c.lui	a0,0x6
	addi	a0,a0,-932	# .Lline_table_start0+0xee
	c.j	 .Lbranch_80010c28

.Lbranch_8001099e:
	c.andi	a2,1
	beq	a2,zero, .Lbranch_80010af2
	addi	a0,zero,767
	bgeu	a0,a1, .Lbranch_80010af2
	c.mv	a0,a1
	c.mv	s1,a1
	auipc	ra,0x0
	jalr	ra,1584(ra)	# _ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17hb8fca6817ec0c82eE
	c.mv	a1,s1
	beq	a0,zero, .Lbranch_80010af2
	srli	t1,a1,0x1
	lui	t0,0x55555
	lui	a7,0x33333
	lui	a6,0xf0f1
	srli	t2,a1,0x14
	lui	a5,0x80013
	addi	a5,a5,1940	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x80
	slli	a0,a1,0xc
	slli	a2,a1,0x10
	slli	a3,a1,0x14
	slli	a4,a1,0x18
	or	s1,a1,t1
	c.andi	a1,15
	c.add	t2,a5
	c.srli	a0,0x1c
	c.srli	a2,0x1c
	c.srli	a3,0x1c
	c.srli	a4,0x1c
	c.add	a1,a5
	c.add	a0,a5
	c.add	a2,a5
	c.add	a3,a5
	c.add	a4,a5
	srli	a5,s1,0x2
	c.or	s1,a5
	srli	a5,s1,0x4
	c.or	s1,a5
	srli	a5,s1,0x8
	c.or	a5,s1
	lui	t1,0x1010
	lbu	s1,0(t2)
	lbu	a0,0(a0)
	lbu	a2,0(a2)
	lbu	a3,0(a3)
	sh	zero,-40(s0)
	sb	zero,-38(s0)
	sb	s1,-37(s0)
	sb	a0,-36(s0)
	addi	t2,zero,125
	addi	s1,t0,1365	# .Lline_table_start1+0x55509400
	lbu	a4,0(a4)
	lbu	a1,0(a1)
	sb	a2,-35(s0)
	sb	a3,-34(s0)
	sb	a4,-33(s0)
	srli	a2,a5,0x10
	c.or	a2,a5
	xori	a2,a2,-1
	srli	a3,a2,0x1
	c.and	a3,s1
	addi	a4,s0,-40
	addi	a5,a7,819	# .Lline_table_start1+0x332e71de
	c.andi	a2,-2
	c.sub	a2,a3
	and	a3,a2,a5
	c.srli	a2,0x2
	c.and	a2,a5
	addi	a5,zero,92
	c.add	a2,a3
	srli	a3,a2,0x4
	c.add	a2,a3
	addi	a3,zero,117
	addi	s1,a6,-241	# .Lline_table_start1+0xf0a4dba
	c.and	a2,s1
	addi	s1,zero,123
	addi	a0,t1,257	# .Lline_table_start1+0xfc3fac
	mul	a0,a2,a0
	c.srli	a0,0x1a
	addi	s2,a0,-2
	c.add	a0,a4
	c.add	a4,s2
	sb	a5,0(a4)
	sb	a3,-1(a0)
	sb	s1,0(a0)
	sb	a1,-32(s0)
	sb	t2,-31(s0)
	addi	a1,s0,-40
	c.j	 .Lbranch_80010c10
	c.li	s2,0
	c.lui	a0,0x7
	addi	a0,a0,-420	# .Lline_table_start1+0x1e8
	c.j	 .Lbranch_80010c28
	andi	a0,a2,256
	c.beqz	a0, .Lbranch_80010af2
	c.li	s2,0
	c.lui	a0,0x2
	addi	a0,a0,1884	# .Lline_table_start0+0x275c
	c.j	 .Lbranch_80010c28
	c.li	s2,0
	c.lui	a0,0x7
	c.j	 .Lbranch_80010c24
	c.li	s2,0
	c.lui	a0,0x7
	addi	a0,a0,1116	# .Lline_table_start0+0x36e
	c.j	 .Lbranch_80010c28
	c.slli	a2,0x8
	c.srli	a2,0x18
	bne	a2,zero, .Lbranch_80010c20

.Lbranch_80010af2:
	c.mv	s1,a1
	c.mv	a0,a1
	auipc	ra,0x0
	jalr	ra,1510(ra)	# _ZN4core7unicode9printable12is_printable17h63ac66102dc14ae3E
	c.beqz	a0, .Lbranch_80010b0e
	sw	s1,0(s3)
	addi	s1,zero,129
	addi	s2,zero,128
	c.j	 .Lbranch_80010c3a

.Lbranch_80010b0e:
	c.mv	a3,s1
	srli	t1,s1,0x1
	lui	t0,0x55555
	lui	a7,0x33333
	lui	a6,0xf0f1
	srli	t2,s1,0x14
	lui	a5,0x80013
	addi	a5,a5,1940	# anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667+0x80
	slli	a0,s1,0xc
	slli	a1,s1,0x10
	slli	a2,s1,0x14
	slli	a4,s1,0x18
	or	s1,s1,t1
	c.andi	a3,15
	c.add	t2,a5
	c.srli	a0,0x1c
	c.srli	a1,0x1c
	c.srli	a2,0x1c
	c.srli	a4,0x1c
	c.add	a3,a5
	c.add	a0,a5
	c.add	a1,a5
	c.add	a2,a5
	c.add	a4,a5
	srli	a5,s1,0x2
	c.or	s1,a5
	srli	a5,s1,0x4
	c.or	s1,a5
	srli	a5,s1,0x8
	c.or	a5,s1
	lui	t1,0x1010
	lbu	s1,0(t2)
	lbu	a0,0(a0)
	lbu	a1,0(a1)
	lbu	a2,0(a2)
	sh	zero,-30(s0)
	sb	zero,-28(s0)
	sb	s1,-27(s0)
	sb	a0,-26(s0)
	addi	t2,zero,125
	addi	s1,t0,1365	# .Lline_table_start1+0x55509400
	lbu	a4,0(a4)
	lbu	a3,0(a3)
	sb	a1,-25(s0)
	sb	a2,-24(s0)
	sb	a4,-23(s0)
	srli	a1,a5,0x10
	c.or	a1,a5
	xori	a1,a1,-1
	srli	a2,a1,0x1
	c.and	a2,s1
	addi	a4,s0,-30
	addi	a5,a7,819	# .Lline_table_start1+0x332e71de
	c.andi	a1,-2
	c.sub	a1,a2
	and	a2,a1,a5
	c.srli	a1,0x2
	c.and	a1,a5
	addi	a5,zero,92
	c.add	a1,a2
	srli	a2,a1,0x4
	c.add	a1,a2
	addi	a2,zero,117
	addi	s1,a6,-241	# .Lline_table_start1+0xf0a4dba
	c.and	a1,s1
	addi	s1,zero,123
	addi	a0,t1,257	# .Lline_table_start1+0xfc3fac
	mul	a0,a1,a0
	c.srli	a0,0x1a
	addi	s2,a0,-2
	c.add	a0,a4
	c.add	a4,s2
	sb	a5,0(a4)
	sb	a2,-1(a0)
	sb	s1,0(a0)
	sb	a3,-22(s0)
	sb	t2,-21(s0)
	addi	a1,s0,-30

.Lbranch_80010c10:
	c.li	a2,10
	c.li	s1,10
	c.mv	a0,s3
	auipc	ra,0xffff5
	jalr	ra,1226(ra)	# memcpy
	c.j	 .Lbranch_80010c3a

.Lbranch_80010c20:
	c.li	s2,0
	c.lui	a0,0x2

.Lbranch_80010c24:
	addi	a0,a0,604	# .Lline_table_start0+0x225c

.Lbranch_80010c28:
	sw	a0,0(s3)
	sh	zero,4(s3)
	sh	zero,6(s3)
	sh	zero,8(s3)
	c.li	s1,2

.Lbranch_80010c3a:
	sb	s2,12(s3)
	sb	s1,13(s3)
	c.lwsp	ra,44(sp)
	c.lwsp	s0,40(sp)
	c.lwsp	s1,36(sp)
	c.lwsp	s2,32(sp)
	c.lwsp	s3,28(sp)
	c.addi16sp	sp,48
	c.jr	ra

	.globl _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE
_ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.addi4spn	s0,sp,32
	bgeu	a2,a0, .Lbranch_80010c9a
	sw	a0,-32(s0)
	sw	a2,-28(s0)
	addi	a0,s0,-32
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	a2,s0,-28
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	sw	a2,-16(s0)
	sw	a1,-12(s0)
	lui	a0,0x80012
	addi	a0,a0,1108	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x2d4
	addi	a1,s0,-24
	c.mv	a2,a3
	auipc	ra,0x1
	jalr	ra,-2022(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE

.Lbranch_80010c9a:
	bltu	a2,a1, .Lbranch_80010ce0
	bgeu	a1,a0, .Lbranch_80010ce0
	sw	a0,-32(s0)
	sw	a1,-28(s0)
	addi	a0,s0,-32
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	a2,s0,-28
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	sw	a2,-16(s0)
	sw	a1,-12(s0)
	lui	a0,0x80012
	addi	a0,a0,-288	# anon.7a8bf03ce3225e035043929a408f9c7c.0.llvm.764523667040833331+0x38
	addi	a1,s0,-24
	c.mv	a2,a3
	auipc	ra,0x0
	jalr	ra,2004(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE

.Lbranch_80010ce0:
	sw	a1,-32(s0)
	sw	a2,-28(s0)
	addi	a0,s0,-32
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	a2,s0,-28
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	sw	a2,-16(s0)
	sw	a1,-12(s0)
	lui	a0,0x80012
	addi	a0,a0,984	# anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486+0x258
	addi	a1,s0,-24
	c.mv	a2,a3
	auipc	ra,0x0
	jalr	ra,1942(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE
	# ... (zero-filled gap)

	.globl _ZN4core5slice6memchr14memchr_aligned17h88e38207834fe1c3E
_ZN4core5slice6memchr14memchr_aligned17h88e38207834fe1c3E:
	addi	a3,a1,3
	c.andi	a3,-4
	bne	a3,a1, .Lbranch_80010d32
	c.li	t0,0
	addi	a6,a2,-8
	c.j	 .Lbranch_80010d60

.Lbranch_80010d32:
	sub	a4,a3,a1
	c.mv	t0,a2
	bltu	a2,a4, .Lbranch_80010d3e
	c.mv	t0,a4

.Lbranch_80010d3e:
	c.beqz	a2, .Lbranch_80010d58
	c.li	a4,0
	sub	a6,zero,t0
	c.mv	a5,a1

.Lbranch_80010d48:
	lbu	a3,0(a5)
	beq	a3,a0, .Lbranch_80010dd0
	c.addi	a4,-1
	c.addi	a5,1
	bne	a6,a4, .Lbranch_80010d48

.Lbranch_80010d58:
	addi	a6,a2,-8
	bltu	a6,t0, .Lbranch_80010da4

.Lbranch_80010d60:
	lui	a4,0x1010
	lui	a5,0x80808
	addi	a7,a4,256	# .Lline_table_start1+0xfc3fab
	addi	a4,a7,1
	mul	t1,a0,a4
	addi	t2,a5,128	# __heap_end+0x508080

.Lbranch_80010d78:
	add	a3,a1,t0
	c.lw	a4,0(a3)
	c.lw	a3,4(a3)
	xor	a4,a4,t1
	xor	a3,a3,t1
	sub	a5,a7,a4
	c.or	a4,a5
	sub	a5,a7,a3
	c.or	a3,a5
	c.and	a3,a4
	and	a3,a3,t2
	bne	a3,t2, .Lbranch_80010da4
	c.addi	t0,8
	bgeu	a6,t0, .Lbranch_80010d78

.Lbranch_80010da4:
	beq	a2,t0, .Lbranch_80010dc4
	add	a4,a1,t0
	sub	a1,zero,t0
	sub	a2,zero,a2

.Lbranch_80010db4:
	lbu	a3,0(a4)
	beq	a3,a0, .Lbranch_80010dc8
	c.addi	a1,-1
	c.addi	a4,1
	bne	a2,a1, .Lbranch_80010db4

.Lbranch_80010dc4:
	c.li	a0,0
	c.jr	ra

.Lbranch_80010dc8:
	sub	a1,zero,a1
	c.li	a0,1
	c.jr	ra

.Lbranch_80010dd0:
	sub	a1,zero,a4
	c.li	a0,1
	c.jr	ra

	.globl _ZN4core6option13expect_failed17hafcd263d76ffbe5eE
_ZN4core6option13expect_failed17hafcd263d76ffbe5eE:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.addi4spn	s0,sp,32
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	addi	a0,s0,-24
	lui	a1,0x8000f
	addi	a1,a1,1116	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h1f4467a62b6da94dE
	sw	a0,-16(s0)
	sw	a1,-12(s0)
	lui	a0,0x80012
	addi	a0,a0,-540	# anon.aec296b685f742a7405bc8100ce2f275.2.llvm.14967730159154455495+0x84
	addi	a1,s0,-16
	auipc	ra,0x0
	jalr	ra,1700(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE

	.globl _ZN4core6option13unwrap_failed17hca83384b1d4f0231E
_ZN4core6option13unwrap_failed17hca83384b1d4f0231E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a2,a0
	lui	a0,0x8001e
	addi	a0,a0,-1708	# .Lanon.93378afd097c98d6944e7e9e652eb25e.243
	addi	a1,zero,43
	auipc	ra,0x0
	jalr	ra,1650(ra)	# _ZN4core9panicking5panic17h3d14d6668f13e962E
	# ... (zero-filled gap)

	.globl _ZN4core6result13unwrap_failed17h6de2f979be0b0c8dE
_ZN4core6result13unwrap_failed17h6de2f979be0b0c8dE:
	c.addi16sp	sp,-48
	c.swsp	ra,44(sp)
	c.swsp	s0,40(sp)
	c.addi4spn	s0,sp,48
	sw	a0,-40(s0)
	sw	a1,-36(s0)
	sw	a2,-32(s0)
	sw	a3,-28(s0)
	addi	a0,s0,-40
	lui	a1,0x8000f
	addi	a1,a1,1116	# _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h1f4467a62b6da94dE
	addi	a2,s0,-32
	lui	a3,0x8000f
	addi	a3,a3,1048	# _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17haa5ea4fa623a79c6E
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	sw	a2,-16(s0)
	sw	a3,-12(s0)
	lui	a0,0x80012
	addi	a0,a0,-1964	# .LJTI2_1+0x38
	addi	a1,s0,-24
	c.mv	a2,a4
	auipc	ra,0x0
	jalr	ra,1582(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE
	# ... (zero-filled gap)

	.globl _ZN4core7unicode12unicode_data11conversions8to_upper17h7d08e96f3cc49c4fE
_ZN4core7unicode12unicode_data11conversions8to_upper17h7d08e96f3cc49c4fE:
	addi	a2,zero,128
	bgeu	a1,a2, .Lbranch_80010e9e
	addi	a2,a1,-97
	sltiu	a2,a2,26
	c.slli	a2,0x5
	c.xor	a1,a2
	c.j	 .Lbranch_80010fc6

.Lbranch_80010e9e:
	srli	a2,a1,0x3
	sltiu	a2,a2,1013
	c.addi	a2,-1
	andi	a3,a2,777
	slli	a4,a3,0x3
	lui	a2,0x8001e
	addi	a2,a2,-1664	# .Lanon.93378afd097c98d6944e7e9e652eb25e.246
	c.add	a4,a2
	addi	a4,a4,2047
	lw	a4,1057(a4)
	sltu	a4,a1,a4
	c.addi	a4,-1
	andi	a4,a4,388
	c.add	a3,a4
	slli	a4,a3,0x3
	c.add	a4,a2
	lw	a4,1552(a4)
	sltu	a4,a1,a4
	c.addi	a4,-1
	andi	a4,a4,194
	c.add	a3,a4
	slli	a4,a3,0x3
	c.add	a4,a2
	lw	a4,776(a4)
	sltu	a4,a1,a4
	c.addi	a4,-1
	andi	a4,a4,97
	c.add	a3,a4
	slli	a4,a3,0x3
	c.add	a4,a2
	lw	a4,392(a4)
	sltu	a4,a1,a4
	c.addi	a4,-1
	andi	a4,a4,49
	c.add	a3,a4
	slli	a4,a3,0x3
	c.add	a4,a2
	lw	a4,192(a4)
	sltu	a4,a1,a4
	c.addi	a4,-1
	c.andi	a4,24
	c.add	a3,a4
	slli	a4,a3,0x3
	c.add	a4,a2
	c.lw	a4,96(a4)
	sltu	a4,a1,a4
	c.addi	a4,-1
	c.andi	a4,12
	c.add	a3,a4
	slli	a4,a3,0x3
	c.add	a4,a2
	c.lw	a4,48(a4)
	sltu	a4,a1,a4
	c.addi	a4,-1
	c.andi	a4,6
	c.add	a3,a4
	slli	a4,a3,0x3
	c.add	a4,a2
	c.lw	a4,24(a4)
	sltu	a4,a1,a4
	c.addi	a4,-1
	c.andi	a4,3
	c.add	a3,a4
	slli	a4,a3,0x3
	c.add	a4,a2
	c.lw	a4,16(a4)
	sltu	a4,a1,a4
	xori	a4,a4,1
	c.slli	a4,0x1
	c.add	a3,a4
	slli	a4,a3,0x3
	c.add	a4,a2
	c.lw	a4,8(a4)
	sltu	a4,a1,a4
	xori	a4,a4,1
	c.add	a3,a4
	c.slli	a3,0x3
	c.add	a2,a3
	c.lw	a3,0(a2)
	bne	a3,a1, .Lbranch_80010fc6
	c.lw	a1,4(a2)
	c.li	a2,27
	lui	a3,0xffef0
	c.slli	a2,0xb
	c.xor	a2,a1
	c.add	a2,a3
	addi	a3,a3,2047	# __heap_end+0x7fbf07ff
	bltu	a3,a2, .Lbranch_80010fd2
	c.slli	a1,0xa
	lui	a2,0x80021
	addi	a2,a2,-1520	# .Lanon.93378afd097c98d6944e7e9e652eb25e.247
	c.srli	a1,0xa
	slli	a3,a1,0x2
	c.slli	a1,0x4
	c.sub	a1,a3
	add	a3,a2,a1
	c.lw	a1,0(a3)
	c.lw	a2,4(a3)
	c.lw	a3,8(a3)
	c.sw	a1,0(a0)
	c.sw	a2,4(a0)
	c.sw	a3,8(a0)
	c.jr	ra

.Lbranch_80010fc6:
	c.sw	a1,0(a0)
	sw	zero,4(a0)
	sw	zero,8(a0)
	c.jr	ra

.Lbranch_80010fd2:
	c.sw	a1,0(a0)
	sw	zero,4(a0)
	sw	zero,8(a0)
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17hb8fca6817ec0c82eE
_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17hb8fca6817ec0c82eE:
	c.lui	a1,0x11
	lui	a3,0x80021
	addi	a3,a3,-296	# _ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h7bfa44fc94e03442E
	addi	a1,a1,-342	# .Lline_table_start0+0x2e4c
	sltu	a1,a1,a0
	slli	a2,a1,0x6
	c.add	a2,a3
	c.lw	a2,32(a2)
	slli	a4,a0,0xb
	c.slli	a1,0x4
	c.slli	a2,0xb
	sltu	a2,a4,a2
	xori	a2,a2,1
	c.slli	a2,0x3
	c.or	a1,a2
	slli	a2,a1,0x2
	c.add	a2,a3
	c.lw	a2,16(a2)
	c.slli	a2,0xb
	sltu	a2,a4,a2
	xori	a2,a2,1
	c.slli	a2,0x2
	c.or	a1,a2
	slli	a2,a1,0x2
	c.add	a2,a3
	c.lw	a2,8(a2)
	c.slli	a2,0xb
	sltu	a2,a4,a2
	xori	a2,a2,1
	c.slli	a2,0x1
	c.or	a1,a2
	slli	a2,a1,0x2
	c.add	a2,a3
	c.lw	a2,4(a2)
	c.slli	a2,0xb
	sltu	a2,a4,a2
	xori	a2,a2,1
	c.or	a1,a2
	slli	a2,a1,0x2
	c.add	a2,a3
	c.lw	a2,4(a2)
	c.slli	a2,0xb
	sltu	a2,a4,a2
	xori	a2,a2,1
	c.add	a1,a2
	slli	a2,a1,0x2
	c.add	a2,a3
	c.lw	a2,0(a2)
	c.slli	a2,0xb
	xor	a5,a2,a4
	sltu	a2,a2,a4
	sltiu	a4,a5,1
	c.add	a1,a2
	c.add	a4,a1
	slli	a1,a4,0x2
	c.add	a3,a1
	c.lw	a1,0(a3)
	c.li	a2,31
	c.srli	a1,0x15
	bltu	a2,a4, .Lbranch_8001109c
	c.lw	a2,4(a3)
	c.srli	a2,0x15
	c.bnez	a4, .Lbranch_800110a0
	xori	a3,a1,-1
	c.add	a3,a2
	c.bnez	a3, .Lbranch_800110b2
	c.j	 .Lbranch_800110d4

.Lbranch_8001109c:
	addi	a2,zero,767

.Lbranch_800110a0:
	lw	a3,-4(a3)
	c.slli	a3,0xb
	srli	a4,a3,0xb
	xori	a3,a1,-1
	c.add	a3,a2
	c.beqz	a3, .Lbranch_800110d4

.Lbranch_800110b2:
	c.li	a3,0
	c.sub	a0,a4
	c.addi	a2,-1
	lui	a4,0x8001d
	addi	a4,a4,824	# _ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h4a4a51ed5ecc2bebE

.Lbranch_800110c0:
	add	a5,a4,a1
	lbu	a5,0(a5)
	c.add	a3,a5
	bltu	a0,a3, .Lbranch_800110d4
	c.addi	a1,1
	bne	a2,a1, .Lbranch_800110c0

.Lbranch_800110d4:
	andi	a0,a1,1
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN4core7unicode9printable12is_printable17h63ac66102dc14ae3E
_ZN4core7unicode9printable12is_printable17h63ac66102dc14ae3E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	addi	a1,zero,32
	bgeu	a0,a1, .Lbranch_800110fa
	c.li	a1,0

.Lbranch_800110ee:
	andi	a0,a1,1
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_800110fa:
	addi	a1,zero,127
	bgeu	a0,a1, .Lbranch_80011110
	c.li	a1,1
	andi	a0,a1,1
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_80011110:
	srli	a1,a0,0x10
	c.bnez	a1, .Lbranch_80011178
	c.li	a4,0
	c.li	t3,0
	srli	t2,a0,0x8
	andi	a5,a0,255
	lui	a6,0x80021
	addi	a6,a6,644	# .Lanon.93378afd097c98d6944e7e9e652eb25e.255
	addi	a7,zero,284
	lui	t0,0x80021
	addi	t0,t0,720	# .Lanon.93378afd097c98d6944e7e9e652eb25e.256
	addi	t1,zero,76
	c.j	 .Lbranch_80011146

.Lbranch_8001113c:
	bltu	t2,a2, .Lbranch_800112a2

.Lbranch_80011140:
	c.mv	a4,a1
	beq	t3,t1, .Lbranch_800112a2

.Lbranch_80011146:
	add	a1,a6,t3
	lbu	a2,0(a1)
	lbu	a3,1(a1)
	c.addi	t3,2
	add	a1,a4,a3
	bne	a2,t2, .Lbranch_8001113c
	bltu	a1,a4, .Lbranch_8001134e
	bltu	a7,a1, .Lbranch_8001134e
	c.beqz	a3, .Lbranch_80011140
	c.add	a4,t0

.Lbranch_80011168:
	lbu	a2,0(a4)
	beq	a2,a5, .Lbranch_800111e4
	c.addi	a3,-1
	c.addi	a4,1
	c.bnez	a3, .Lbranch_80011168
	c.j	 .Lbranch_80011140

.Lbranch_80011178:
	srli	a1,a0,0x11
	c.bnez	a1, .Lbranch_800111ee
	c.li	a4,0
	c.li	a3,0
	slli	t0,a0,0x10
	andi	a0,a0,255
	lui	t2,0x80021
	addi	t2,t2,-164	# .Lanon.93378afd097c98d6944e7e9e652eb25e.252
	addi	a6,zero,212
	lui	a7,0x80021
	addi	a7,a7,-72	# .Lanon.93378afd097c98d6944e7e9e652eb25e.253
	srli	t3,t0,0x18
	addi	t1,zero,92
	c.j	 .Lbranch_800111b2

.Lbranch_800111a8:
	bltu	t3,a2, .Lbranch_800112f6

.Lbranch_800111ac:
	c.mv	a4,a1
	beq	a3,t1, .Lbranch_800112f6

.Lbranch_800111b2:
	add	a1,t2,a3
	lbu	a2,0(a1)
	lbu	a5,1(a1)
	c.addi	a3,2
	add	a1,a4,a5
	bne	a2,t3, .Lbranch_800111a8
	bltu	a1,a4, .Lbranch_80011364
	bltu	a6,a1, .Lbranch_80011364
	c.beqz	a5, .Lbranch_800111ac
	c.add	a4,a7

.Lbranch_800111d4:
	lbu	a2,0(a4)
	beq	a2,a0, .Lbranch_800111e4
	c.addi	a5,-1
	c.addi	a4,1
	c.bnez	a5, .Lbranch_800111d4
	c.j	 .Lbranch_800111ac

.Lbranch_800111e4:
	c.li	a0,0
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_800111ee:
	lui	a7,0x200
	lui	t0,0x2a
	lui	a6,0x2c
	lui	a4,0xfffd1
	lui	t1,0xfffd0
	lui	t2,0xfffcf
	lui	t3,0xfff20
	lui	t4,0xe0
	c.addi	a7,-32	# .Lline_table_start1+0x1b3e8b
	addi	a5,t0,1760	# .Lline_table_start0+0x5e61
	and	a1,a0,a7
	xor	t0,a1,a5
	addi	a5,a4,1040	# __heap_end+0x7fcd1410
	addi	a4,a4,-2048
	c.add	t1,a0
	addi	a2,t2,-848	# __heap_end+0x7fccecb0
	addi	a3,t3,-256	# __heap_end+0x7fc1ff00
	addi	a1,t4,496	# .Lline_table_start1+0x9409b
	c.addi	a7,30
	add	t3,a0,a5
	c.add	a4,a0
	c.add	a2,a0
	c.add	a3,a0
	sltu	t2,a0,a1
	and	a0,a0,a7
	c.lui	a1,0xfffff
	addi	a1,a1,1630	# __heap_end+0x7fcff65e
	sltu	a1,a4,a1
	lui	a4,0xfff53
	addi	a4,a4,890	# __heap_end+0x7fc5337a
	sltu	a3,a3,a4
	lui	a7,0x2d
	addi	a4,a6,-2018	# .Lline_table_start0+0xf71
	addi	a5,a7,-338	# .Lline_table_start0+0x2601
	c.xor	a4,a0
	c.xor	a0,a5
	sltiu	a5,t1,-1506
	c.and	a1,a5
	sltiu	a2,a2,-5
	c.and	a1,a2
	sltu	a2,zero,t0
	sltu	a4,zero,a4
	c.and	a2,a4
	sltiu	a4,t3,-15
	sltu	a0,zero,a0
	c.and	a0,a4
	c.and	a1,a3
	c.and	a0,a2
	and	a1,a1,t2
	c.and	a1,a0
	andi	a0,a1,1
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_800112a2:
	c.li	a4,0
	c.li	a1,1
	lui	a7,0x80021
	addi	a7,a7,1004	# .Lanon.93378afd097c98d6944e7e9e652eb25e.257
	addi	a6,zero,292
	c.j	 .Lbranch_800112c4

.Lbranch_800112b4:
	c.mv	a4,a2
	c.sub	a0,a5
	blt	a0,zero, .Lbranch_800110ee

.Lbranch_800112bc:
	xori	a1,a1,1
	beq	a4,a6, .Lbranch_800110ee

.Lbranch_800112c4:
	add	a2,a7,a4
	lb	a3,0(a2)
	addi	a2,a4,1
	andi	a5,a3,255
	bge	a3,zero, .Lbranch_800112b4
	beq	a2,a6, .Lbranch_8001137a
	c.add	a2,a7
	lbu	a2,0(a2)
	c.addi	a4,2
	andi	a3,a5,127
	c.slli	a3,0x8
	or	a5,a3,a2
	c.sub	a0,a5
	bge	a0,zero, .Lbranch_800112bc
	c.j	 .Lbranch_800110ee

.Lbranch_800112f6:
	c.li	a4,0
	srli	a0,t0,0x10
	c.li	a1,1
	lui	a7,0x80021
	addi	a7,a7,140	# .Lanon.93378afd097c98d6944e7e9e652eb25e.254
	addi	a6,zero,504
	c.j	 .Lbranch_8001131c

.Lbranch_8001130c:
	c.mv	a4,a2
	c.sub	a0,a5
	blt	a0,zero, .Lbranch_800110ee

.Lbranch_80011314:
	xori	a1,a1,1
	beq	a4,a6, .Lbranch_800110ee

.Lbranch_8001131c:
	add	a2,a7,a4
	lb	a3,0(a2)
	addi	a2,a4,1
	andi	a5,a3,255
	bge	a3,zero, .Lbranch_8001130c
	beq	a2,a6, .Lbranch_8001137a
	c.add	a2,a7
	lbu	a2,0(a2)
	c.addi	a4,2
	andi	a3,a5,127
	c.slli	a3,0x8
	or	a5,a3,a2
	c.sub	a0,a5
	bge	a0,zero, .Lbranch_80011314
	c.j	 .Lbranch_800110ee

.Lbranch_8001134e:
	lui	a3,0x80021
	addi	a3,a3,1296	# .Lanon.93378afd097c98d6944e7e9e652eb25e.259
	addi	a2,zero,284
	c.mv	a0,a4
	auipc	ra,0x0
	jalr	ra,-1804(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_80011364:
	lui	a3,0x80021
	addi	a3,a3,1296	# .Lanon.93378afd097c98d6944e7e9e652eb25e.259
	addi	a2,zero,212
	c.mv	a0,a4
	auipc	ra,0x0
	jalr	ra,-1826(ra)	# _ZN4core5slice5index16slice_index_fail17h3b8b86232326e65cE

.Lbranch_8001137a:
	lui	a0,0x80021
	addi	a0,a0,1312	# .Lanon.93378afd097c98d6944e7e9e652eb25e.260
	auipc	ra,0x0
	jalr	ra,-1394(ra)	# _ZN4core6option13unwrap_failed17hca83384b1d4f0231E
	# ... (zero-filled gap)

	.globl _ZN4core9panicking11panic_const23panic_const_rem_by_zero17h1e30600164aa306dE
_ZN4core9panicking11panic_const23panic_const_rem_by_zero17h1e30600164aa306dE:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a2,a0
	lui	a0,0x80021
	addi	a0,a0,1328	# .Lanon.93378afd097c98d6944e7e9e652eb25e.263
	addi	a1,zero,115
	auipc	ra,0x0
	jalr	ra,266(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE
	# ... (zero-filled gap)

	.globl _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
_ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a2,a0
	lui	a0,0x8001d
	addi	a0,a0,1896	# .Lanon.93378afd097c98d6944e7e9e652eb25e.82
	addi	a1,zero,57
	auipc	ra,0x0
	jalr	ra,234(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE
	# ... (zero-filled gap)

	.globl _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E
_ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a2,a0
	lui	a0,0x8001d
	addi	a0,a0,1924	# .Lanon.93378afd097c98d6944e7e9e652eb25e.84
	addi	a1,zero,67
	auipc	ra,0x0
	jalr	ra,202(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE
	# ... (zero-filled gap)

	.globl _ZN4core9panicking11panic_const24panic_const_rem_overflow17h43cfcaccafa02be6E
_ZN4core9panicking11panic_const24panic_const_rem_overflow17h43cfcaccafa02be6E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a2,a0
	lui	a0,0x8001d
	addi	a0,a0,1960	# .Lanon.93378afd097c98d6944e7e9e652eb25e.86
	addi	a1,zero,97
	auipc	ra,0x0
	jalr	ra,170(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE
	# ... (zero-filled gap)

	.globl _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
_ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.mv	a2,a0
	lui	a0,0x8001d
	addi	a0,a0,2008	# .Lanon.93378afd097c98d6944e7e9e652eb25e.89
	addi	a1,zero,67
	auipc	ra,0x0
	jalr	ra,138(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE
	# ... (zero-filled gap)

	.globl _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E
_ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.addi4spn	s0,sp,32
	addi	a4,s0,-128
	c.sw	a0,96(a4)
	c.sw	a1,100(a4)
	addi	a0,s0,-28
	lui	a1,0x8000f
	addi	a1,a1,1772	# _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h358f6063e138d727E
	addi	a3,s0,-32
	c.sw	a0,104(a4)
	c.sw	a1,108(a4)
	c.sw	a3,112(a4)
	c.sw	a1,116(a4)
	lui	a0,0x80012
	addi	a0,a0,0	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.0.llvm.3372952439789298147+0xc
	addi	a1,s0,-24
	auipc	ra,0x0
	jalr	ra,76(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE

	.globl _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
_ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.addi4spn	s0,sp,32
	sw	a0,-28(s0)
	sw	a1,-24(s0)
	addi	a0,s0,-28
	sw	a0,-20(s0)
	sw	a3,-16(s0)
	sb	zero,-12(s0)
	sb	a2,-11(s0)
	addi	a0,s0,-20
	auipc	ra,0xfffef
	jalr	ra,-1084(ra)	# _RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind

	.globl _ZN4core9panicking5panic17h3d14d6668f13e962E
_ZN4core9panicking5panic17h3d14d6668f13e962E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.addi4spn	s0,sp,16
	c.slli	a1,0x1
	c.addi	a1,1
	auipc	ra,0x0
	jalr	ra,8(ra)	# _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE

	.globl _ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE
_ZN4core9panicking9panic_fmt17h5e4384c1985efd7dE:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.addi4spn	s0,sp,32
	sw	a0,-28(s0)
	sw	a1,-24(s0)
	addi	a0,s0,-28
	c.li	a1,1
	sw	a0,-20(s0)
	sw	a2,-16(s0)
	sh	a1,-12(s0)
	addi	a0,s0,-20
	auipc	ra,0xfffef
	jalr	ra,-1150(ra)	# _RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind
	# ... (zero-filled gap)

	.globl _ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17habf173c1f40b1f46E
_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17habf173c1f40b1f46E:
	c.addi	sp,-32
	c.swsp	ra,28(sp)
	c.swsp	s0,24(sp)
	c.swsp	s1,20(sp)
	c.swsp	s2,16(sp)
	c.swsp	s3,12(sp)
	c.swsp	s4,8(sp)
	c.addi4spn	s0,sp,32
	c.lw	s1,8(a0)
	lbu	a2,0(s1)
	lw	s2,0(a0)
	lw	s3,4(a0)
	c.beqz	a2, .Lbranch_80011528
	lw	a4,12(s3)
	lui	a3,0x80014
	addi	a3,a3,108	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0x24
	c.li	a2,4
	c.mv	a0,s2
	c.mv	s4,a1
	c.mv	a1,a3
	c.jalr	a4
	c.mv	a1,s4
	c.beqz	a0, .Lbranch_80011528
	c.li	a0,1
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	c.jr	ra

.Lbranch_80011528:
	addi	a0,a1,-10
	sltiu	a0,a0,1
	sb	a0,0(s1)
	lw	a5,16(s3)
	c.mv	a0,s2
	c.lwsp	ra,28(sp)
	c.lwsp	s0,24(sp)
	c.lwsp	s1,20(sp)
	c.lwsp	s2,16(sp)
	c.lwsp	s3,12(sp)
	c.lwsp	s4,8(sp)
	c.addi16sp	sp,32
	c.jr	a5
	# ... (zero-filled gap)

	.globl _ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17ha3577b7a20b9943bE
_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17ha3577b7a20b9943bE:
	c.addi16sp	sp,-80
	c.swsp	ra,76(sp)
	c.swsp	s0,72(sp)
	c.swsp	s1,68(sp)
	c.swsp	s2,64(sp)
	c.swsp	s3,60(sp)
	c.swsp	s4,56(sp)
	c.swsp	s5,52(sp)
	c.swsp	s6,48(sp)
	c.swsp	s7,44(sp)
	c.swsp	s8,40(sp)
	c.swsp	s9,36(sp)
	c.swsp	s10,32(sp)
	c.swsp	s11,28(sp)
	c.addi4spn	s0,sp,80
	c.mv	s7,a2
	c.mv	s1,a1
	c.li	s9,0
	c.li	s6,0
	c.li	s11,0
	lui	a1,0xa0a1
	lui	a2,0x1010
	c.lw	a3,0(a0)
	sw	a3,-60(s0)
	c.lw	a3,4(a0)
	sw	a3,-64(s0)
	c.lw	a0,8(a0)
	sw	a0,-56(s0)
	sub	a0,zero,s7
	sw	a0,-68(s0)
	addi	s2,a1,-1526	# .Lline_table_start1+0xa0548b5
	addi	s4,a2,256	# .Lline_table_start1+0xfc3fab
	c.li	s10,10
	lui	a0,0x80808
	addi	s8,a0,128	# __heap_end+0x508080
	c.j	 .Lbranch_800115da

.Lbranch_800115aa:
	add	a0,s1,s5
	lbu	a0,-1(a0)
	c.addi	a0,-10
	sltiu	a0,a0,1

.Lbranch_800115b8:
	lw	a1,-56(s0)
	sb	a0,0(a1)
	lw	a0,-64(s0)
	c.lw	a3,12(a0)
	add	a1,s1,s11
	sub	a2,s5,s11
	lw	a0,-60(s0)
	c.jalr	a3
	c.mv	s11,s3
	bne	a0,zero, .Lbranch_80011726

.Lbranch_800115da:
	andi	a0,s6,1
	bne	a0,zero, .Lbranch_80011722
	bltu	s7,s9, .Lbranch_800116d2

.Lbranch_800115e6:
	sub	a6,s7,s9
	add	a0,s1,s9
	c.li	a1,7
	bltu	a1,a6, .Lbranch_80011614
	beq	s7,s9, .Lbranch_800116d0
	c.li	a1,0
	lw	a2,-68(s0)
	c.add	a2,s9
	c.mv	a3,a0

.Lbranch_80011602:
	lbu	a4,0(a3)
	beq	a4,s10, .Lbranch_800116a0
	c.addi	a1,-1
	c.addi	a3,1
	bne	a2,a1, .Lbranch_80011602
	c.j	 .Lbranch_800116d0

.Lbranch_80011614:
	c.mv	a7,s1
	addi	a2,a0,3
	c.andi	a2,-4
	bne	a2,a0, .Lbranch_8001165c
	c.li	a2,0
	addi	a3,a6,-8

.Lbranch_80011626:
	add	a1,a7,s9

.Lbranch_8001162a:
	add	a5,a0,a2
	add	a4,a1,a2
	c.lw	a5,0(a5)
	c.lw	a4,4(a4)
	xor	s1,a5,s2
	xor	a4,a4,s2
	sub	s1,s4,s1
	c.or	a5,s1
	sub	s1,s4,a4
	c.or	a4,s1
	c.and	a4,a5
	and	a4,a4,s8
	bne	a4,s8, .Lbranch_8001167a
	c.addi	a2,8
	bgeu	a3,a2, .Lbranch_8001162a
	c.j	 .Lbranch_8001167a

.Lbranch_8001165c:
	c.li	a3,0
	c.sub	a2,a0

.Lbranch_80011660:
	add	a1,a0,a3
	lbu	a1,0(a1)
	beq	a1,s10, .Lbranch_800116b2
	c.addi	a3,1
	bne	a2,a3, .Lbranch_80011660
	addi	a3,a6,-8
	bgeu	a3,a2, .Lbranch_80011626

.Lbranch_8001167a:
	beq	a6,a2, .Lbranch_80011706
	add	a3,a0,a2
	sub	a1,zero,a2
	lw	a2,-68(s0)
	c.add	a2,s9
	c.mv	s1,a7

.Lbranch_8001168e:
	lbu	a4,0(a3)
	beq	a4,s10, .Lbranch_800116a0
	c.addi	a1,-1
	c.addi	a3,1
	bne	a2,a1, .Lbranch_8001168e
	c.j	 .Lbranch_800116d0

.Lbranch_800116a0:
	sub	a3,zero,a1
	add	a1,s9,a3
	addi	s9,a1,1
	bltu	a1,s7, .Lbranch_800116c0
	c.j	 .Lbranch_800116ca

.Lbranch_800116b2:
	c.mv	s1,a7
	add	a1,s9,a3
	addi	s9,a1,1
	bgeu	a1,s7, .Lbranch_800116ca

.Lbranch_800116c0:
	c.add	a0,a3
	lbu	a0,0(a0)
	beq	a0,s10, .Lbranch_80011710

.Lbranch_800116ca:
	bgeu	s7,s9, .Lbranch_800115e6
	c.j	 .Lbranch_800116d2

.Lbranch_800116d0:
	c.mv	s9,s7

.Lbranch_800116d2:
	beq	s7,s11, .Lbranch_80011722

.Lbranch_800116d6:
	c.li	s6,1
	c.mv	s3,s11
	c.mv	s5,s7
	lw	a0,-56(s0)
	lbu	a0,0(a0)
	c.beqz	a0, .Lbranch_800116fe

.Lbranch_800116e6:
	lw	a0,-64(s0)
	c.lw	a3,12(a0)
	c.li	a2,4
	lw	a0,-60(s0)
	lui	a1,0x80014
	addi	a1,a1,108	# .Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139+0x24
	c.jalr	a3
	c.bnez	a0, .Lbranch_80011726

.Lbranch_800116fe:
	bne	s5,s11, .Lbranch_800115aa
	c.li	a0,0
	c.j	 .Lbranch_800115b8

.Lbranch_80011706:
	c.mv	s9,s7
	c.mv	s1,a7
	bne	s7,s11, .Lbranch_800116d6
	c.j	 .Lbranch_80011722

.Lbranch_80011710:
	c.li	s6,0
	c.mv	s3,s9
	c.mv	s5,s9
	lw	a0,-56(s0)
	lbu	a0,0(a0)
	c.beqz	a0, .Lbranch_800116fe
	c.j	 .Lbranch_800116e6

.Lbranch_80011722:
	c.li	a0,0
	c.j	 .Lbranch_80011728

.Lbranch_80011726:
	c.li	a0,1

.Lbranch_80011728:
	c.lwsp	ra,76(sp)
	c.lwsp	s0,72(sp)
	c.lwsp	s1,68(sp)
	c.lwsp	s2,64(sp)
	c.lwsp	s3,60(sp)
	c.lwsp	s4,56(sp)
	c.lwsp	s5,52(sp)
	c.lwsp	s6,48(sp)
	c.lwsp	s7,44(sp)
	c.lwsp	s8,40(sp)
	c.lwsp	s9,36(sp)
	c.lwsp	s10,32(sp)
	c.lwsp	s11,28(sp)
	c.addi16sp	sp,80
	c.jr	ra
	# ... (zero-filled gap)

	.globl _ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h715062feb1359c13E
_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h715062feb1359c13E:
	c.addi	sp,-16
	c.swsp	ra,12(sp)
	c.swsp	s0,8(sp)
	c.swsp	s1,4(sp)
	c.swsp	s2,0(sp)
	c.addi4spn	s0,sp,16
	c.mv	s1,a1
	c.mv	s2,a0
	auipc	ra,0xffffe
	jalr	ra,-32(ra)	# _ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hfb5c6c4697ad7849E
	c.bnez	a0, .Lbranch_80011776
	c.lw	a1,4(s1)
	c.lw	a0,0(s1)
	c.lw	a3,12(a1)
	lui	a1,0x80021
	addi	a1,a1,1388	# .Lanon.93378afd097c98d6944e7e9e652eb25e.340
	c.li	a2,2
	c.jalr	a3
	c.beqz	a0, .Lbranch_80011784

.Lbranch_80011776:
	c.li	a0,1
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.lwsp	s1,4(sp)
	c.lwsp	s2,0(sp)
	c.addi	sp,16
	c.jr	ra

.Lbranch_80011784:
	addi	a0,s2,4
	c.mv	a1,s1
	c.lwsp	ra,12(sp)
	c.lwsp	s0,8(sp)
	c.lwsp	s1,4(sp)
	c.lwsp	s2,0(sp)
	c.addi	sp,16
	auipc	t1,0xffffe
	jalr	zero,-92(t1)	# _ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hfb5c6c4697ad7849E

	.globl memcmp
memcmp:
	c.beqz	a2, .Lbranch_800117b2

.Lbranch_8001179e:
	lbu	a3,0(a0)
	lbu	a4,0(a1)
	bne	a3,a4, .Lbranch_800117b6
	c.addi	a1,1
	c.addi	a2,-1
	c.addi	a0,1
	c.bnez	a2, .Lbranch_8001179e

.Lbranch_800117b2:
	c.li	a0,0
	c.jr	ra

.Lbranch_800117b6:
	sub	a0,a3,a4
	c.jr	ra
	c.unimp
	# ... (zero-filled gap)

.LJTI2_0:
	.word	0x800025f2
	.word	0x800029f8
	.word	0x80002b30
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x80002c84
	.word	0x800029f8
	.word	0x80002a12
	.word	0x800029f8
	.word	0x80002666
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x800029f8
	.word	0x80002eea

.LJTI2_1:
	.word	0x800034e6
	.word	0x80002c7e
	.word	0x8000331e
	.word	0x80003324
	.word	0x8000332a
	.word	0x80003330
	.word	0x80003336
	.word	0x8000333c
	.word	0x80003342
	.word	0x6568430f
	.word	0x6e696b63
	.word	0x464c2067
	.word	0x27203a4e
	.word	0x002701c0
	.word	0x203a02c0
	.word	0x000000c0

	.globl anon.aec296b685f742a7405bc8100ce2f275.18.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.18.llvm.14967730159154455495:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6f632f79, 0x732f6572, 0x # t/library/core/s
	.word	0x732f6372, 0x6563696c, 0x6574692f, 0x73722e72, 0x # rc/slice/iter.rs
# 800118cc:	00000000                                ....

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.7.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.7.llvm.7710812085696039936:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6c612f79, 0x2f636f6c, 0x # t/library/alloc/
	.word	0x2f637273, 0x6c6c6f63, 0x69746365, 0x2f736e6f, 0x # src/collections/
	.word	0x65727462, 0x6f6e2f65, 0x722e6564, 0x00000073, 0x # btree/node.rs...
	.word	0x73202017, 0x6f746365, 0x705f7372, 0x635f7265, 0x # .  sectors_per_c
	.word	0x7473756c, 0x203a7265, 0x000000c0, 0x6c69461f, 0x # luster: .....Fil
	.word	0x6f742065, 0x616c206f, 0x20656772, 0x20726f66, 0x # e too large for
	.word	0x65726964, 0x44207463, 0x2820414d, 0x622009c0, 0x # direct DMA (.. b
	.word	0x73657479, 0xc0203e20, 0x68742020, 0x68736572, 0x # ytes > .  thresh
	.word	0x29646c6f, 0x7375202c, 0x20676e69, 0x4d415253, 0x # old), using SRAM
	.word	0x75686320, 0x6e696b6e, 0x00000067, 0x7375722f, 0x # chunking.../rus
	.word	0x342f6374, 0x66653461, 0x65333934, 0x34316133, 0x # tc/4a4ef493e3a14
	.word	0x36633838, 0x31323365, 0x32303735, 0x38303833, 0x # 88c6e32157023808
	.word	0x38336234, 0x66383439, 0x2f626436, 0x7262696c, 0x # 4b38948f6db/libr
	.word	0x2f797261, 0x6f6c6c61, 0x72732f63, 0x6c612f63, 0x # ary/alloc/src/al
	.word	0x2e636f6c, 0x00007372, 0x2f637273, 0x74726976, 0x # loc.rs..src/virt
	.word	0x695f6f69, 0x7475706e, 0x0073722e, 0x65724326, 0x # io_input.rs.&Cre
	.word	0x6e697461, 0x69442067, 0x746e4572, 0x28207972, 0x # ating DirEntry (
	.word	0x73756c63, 0x29726574, 0x53202d20, 0x74726f68, 0x # cluster) - Short
	.word	0xc027203a, 0x202c2709, 0x676e6f4c, 0x00c0203a, 0x # : '..', Long: ..
	.word	0x7469481d, 0x65727020, 0x6c6c6966, 0x74617020, 0x # .Hit prefill pat
	.word	0x6e726574, 0x20746120, 0x72746e65, 0x1ac02079, 0x # tern at entry ..
	.word	0x7473202c, 0x6970706f, 0x6420676e, 0x63657269, 0x # , stopping direc
	.word	0x79726f74, 0x72617020, 0x00006573, 0x62202014, 0x # tory parse...  b
	.word	0x73657479, 0x7265705f, 0x6365735f, 0x3a726f74, 0x # ytes_per_sector:
	.word	0x0000c020, 0x6765620e, 0x3c206e69, 0x6e65203d, 0x # ....begin <= en
	.word	0xc0282064, 0x3d3c2004, 0x2910c020, 0x65687720, 0x # d (.. <= ..) whe
	.word	0x6c73206e, 0x6e696369, 0xc0602067, 0x00c06001, 0x # n slicing `..`..
	.word	0x61655210, 0x676e6964, 0x756c6320, 0x72657473, 0x # .Reading cluster
	.word	0x3a02c020, 0x200ac020, 0x74636573, 0x2c73726f, 0x # ..: .. sectors,
	.word	0x2006c020, 0x65747962, 0x00000073, 0x2f637273, 0x # .. bytes...src/
	.word	0x6f6d6564, 0x61625f73, 0x2e636973, 0x00007372, 0x # demos_basic.rs..

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.23.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.23.llvm.7710812085696039936:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6f632f79, 0x732f6572, 0x # t/library/core/s
	.word	0x732f6372, 0x6563696c, 0x646e692f, 0x722e7865, 0x # rc/slice/index.r
	.word	0x00000073, 0x7479620b, 0x6e692065, 0x20786564, 0x # s....byte index
	.word	0x692026c0, 0x6f6e2073, 0x20612074, 0x72616863, 0x # .& is not a char
	.word	0x756f6220, 0x7261646e, 0x69203b79, 0x73692074, 0x # boundary; it is
	.word	0x736e6920, 0x20656469, 0x282008c0, 0x65747962, 0x # inside .. (byte
	.word	0x06c02073, 0x666f2029, 0x01c06020, 0x0000c060, 0x # s ..) of `..`...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.12.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.12.llvm.14406403243838317486:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6f632f79, 0x732f6572, 0x # t/library/core/s
	.word	0x732f6372, 0x6d2f7274, 0x722e646f, 0x00000073, 0x # rc/str/mod.rs...
	.word	0x7375722f, 0x342f6374, 0x66653461, 0x65333934, 0x # /rustc/4a4ef493e
	.word	0x34316133, 0x36633838, 0x31323365, 0x32303735, 0x # 3a1488c6e3215702
	.word	0x38303833, 0x38336234, 0x66383439, 0x2f626436, 0x # 38084b38948f6db/
	.word	0x7262696c, 0x2f797261, 0x65726f63, 0x6372732f, 0x # library/core/src
	.word	0x696e752f, 0x65646f63, 0x6972702f, 0x6261746e, 0x # /unicode/printab
	.word	0x722e656c, 0x00000073, 0x4c415629, 0x54414449, 0x # le.rs...)VALIDAT
	.word	0x204e4f49, 0x4c494146, 0x203a4445, 0x74636573, 0x # ION FAILED: sect
	.word	0x5f73726f, 0x5f726570, 0x73756c63, 0x20726574, 0x # ors_per_cluster
	.word	0x00c0203d, 0x6c694612, 0x72742065, 0x61636e75, 0x # = ...File trunca
	.word	0x20646574, 0xc0206f74, 0x79622006, 0x00736574, 0x # ted to .. bytes.
	.word	0x756f460e, 0x6520646e, 0x7972746e, 0xc027203a, 0x # .Found entry: '.
	.word	0x202c2708, 0x3a726964, 0x2c08c020, 0x7a697320, 0x # .', dir: .., siz
	.word	0xc0203a65, 0x00000000, 0x444d431c, 0x203a3831, 0x # e: ......CMD18:
	.word	0x65726944, 0x44207463, 0x7320414d, 0x65636375, 0x # Direct DMA succe
	.word	0x2d207373, 0x2006c020, 0x65747962, 0x00000073, 0x # ss - .. bytes...
	.word	0x444d4315, 0x203a3831, 0x64616552, 0x20676e69, 0x # .CMD18: Reading
	.word	0x6e756863, 0x14c0206b, 0x6f6c6220, 0x20736b63, 0x # chunk .. blocks
	.word	0x72617473, 0x676e6974, 0x20746120, 0x000000c0, 0x # starting at ....

	.globl anon.aec296b685f742a7405bc8100ce2f275.2.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.2.llvm.14967730159154455495:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6c612f79, 0x2f636f6c, 0x # t/library/alloc/
	.word	0x2f637273, 0x2f636576, 0x2e646f6d, 0x00007372, 0x # src/vec/mod.rs..
	.word	0x2f637273, 0x6d617266, 0x66756265, 0x2e726566, 0x # src/framebuffer.
	.word	0x00007372, 0x000000c0, 0x7375722f, 0x342f6374, 0x # rs....../rustc/4
	.word	0x66653461, 0x65333934, 0x34316133, 0x36633838, 0x # a4ef493e3a1488c6
	.word	0x31323365, 0x32303735, 0x38303833, 0x38336234, 0x # e321570238084b38
	.word	0x66383439, 0x2f626436, 0x7262696c, 0x2f797261, 0x # 948f6db/library/
	.word	0x65726f63, 0x6372732f, 0x746d662f, 0x6d756e2f, 0x # core/src/fmt/num
# 80011e30:	0073722e                                .rs.

	.globl anon.17904dba1e92d1cee57ddc06e0f4a7fd.2.llvm.2171931009800262987
anon.17904dba1e92d1cee57ddc06e0f4a7fd.2.llvm.2171931009800262987:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6f632f79, 0x732f6572, 0x # t/library/core/s
	.word	0x612f6372, 0x636f6c6c, 0x6f6c672f, 0x2e6c6162, 0x # rc/alloc/global.
# 80011ea4:	00007372                                rs..

	.globl anon.7a8bf03ce3225e035043929a408f9c7c.0.llvm.764523667040833331
anon.7a8bf03ce3225e035043929a408f9c7c.0.llvm.764523667040833331:
	.word	0x2f637273, 0x2e667267, 0x00007372, 0x4c415626, 0x # src/grf.rs..&VAL
	.word	0x54414449, 0x204e4f49, 0x4c494146, 0x203a4445, 0x # IDATION FAILED:
	.word	0x65747962, 0x65705f73, 0x65735f72, 0x726f7463, 0x # bytes_per_sector
	.word	0xc0203d20, 0x00000000, 0x696c7316, 0x69206563, 0x # = ......slice i
	.word	0x7865646e, 0x61747320, 0x20737472, 0xc0207461, 0x # ndex starts at .
	.word	0x7562200d, 0x6e652074, 0x61207364, 0x00c02074, 0x # . but ends at ..

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.5.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.5.llvm.14406403243838317486:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6f632f79, 0x732f6572, 0x # t/library/core/s
	.word	0x732f6372, 0x762f7274, 0x64696c61, 0x6f697461, 0x # rc/str/validatio
	.word	0x722e736e, 0x00000073, 0x # ns.rs...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.2.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.2.llvm.14406403243838317486:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6f632f79, 0x732f6572, 0x # t/library/core/s
	.word	0x632f6372, 0x2f726168, 0x6874656d, 0x2e73646f, 0x # rc/char/methods.
# 80011ff0:	00007372                                rs..

	.globl anon.98d8f5b3645f1dd0bd97de9ecfa06603.0.llvm.3372952439789298147
anon.98d8f5b3645f1dd0bd97de9ecfa06603.0.llvm.3372952439789298147:
	.word	0x2f637273, 0x70616568, 0x0073722e, 0x646e6920, 0x # src/heap.rs. ind
	.word	0x6f207865, 0x6f207475, 0x6f622066, 0x73646e75, 0x # ex out of bounds
	.word	0x6874203a, 0x656c2065, 0x7369206e, 0x2012c020, 0x # : the len is ..
	.word	0x20747562, 0x20656874, 0x65646e69, 0x73692078, 0x # but the index is
	.word	0x0000c020, 0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x # .../home/ben/.r
	.word	0x75747375, 0x6f742f70, 0x68636c6f, 0x736e6961, 0x # ustup/toolchains
	.word	0x6174732f, 0x2d656c62, 0x5f363878, 0x752d3436, 0x # /stable-x86_64-u
	.word	0x6f6e6b6e, 0x6c2d6e77, 0x78756e69, 0x756e672d, 0x # nknown-linux-gnu
	.word	0x62696c2f, 0x7375722f, 0x62696c74, 0x6372732f, 0x # /lib/rustlib/src
	.word	0x7375722f, 0x696c2f74, 0x72617262, 0x6f632f79, 0x # /rust/library/co
	.word	0x732f6572, 0x732f6372, 0x702f7274, 0x65747461, 0x # re/src/str/patte
	.word	0x722e6e72, 0x00000073, 0x7375722f, 0x342f6374, 0x # rn.rs.../rustc/4
	.word	0x66653461, 0x65333934, 0x34316133, 0x36633838, 0x # a4ef493e3a1488c6
	.word	0x31323365, 0x32303735, 0x38303833, 0x38336234, 0x # e321570238084b38
	.word	0x66383439, 0x2f626436, 0x7262696c, 0x2f797261, 0x # 948f6db/library/
	.word	0x65726f63, 0x6372732f, 0x746d662f, 0x646f6d2f, 0x # core/src/fmt/mod
	.word	0x0073722e, 0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x # .rs./home/ben/.r
	.word	0x75747375, 0x6f742f70, 0x68636c6f, 0x736e6961, 0x # ustup/toolchains
	.word	0x6174732f, 0x2d656c62, 0x5f363878, 0x752d3436, 0x # /stable-x86_64-u
	.word	0x6f6e6b6e, 0x6c2d6e77, 0x78756e69, 0x756e672d, 0x # nknown-linux-gnu
	.word	0x62696c2f, 0x7375722f, 0x62696c74, 0x6372732f, 0x # /lib/rustlib/src
	.word	0x7375722f, 0x696c2f74, 0x72617262, 0x6c612f79, 0x # /rust/library/al
	.word	0x2f636f6c, 0x2f637273, 0x6f6c6c61, 0x73722e63, 0x # loc/src/alloc.rs
	.word	0x00000000, 0x72202014, 0x72657365, 0x5f646576, 0x # .....  reserved_
	.word	0x74636573, 0x3a73726f, 0x0000c020, 0x # sectors: ...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.0.llvm.14406403243838317486:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6f632f79, 0x732f6572, 0x # t/library/core/s
	.word	0x702f6372, 0x6e2f7274, 0x6e5f6e6f, 0x2e6c6c75, 0x # rc/ptr/non_null.
	.word	0x00007372, 0x72202010, 0x5f746f6f, 0x73756c63, 0x # rs...  root_clus
	.word	0x3a726574, 0x0000c020, 0x61655213, 0x676e6964, 0x # ter: ....Reading
	.word	0x6c696620, 0x73203a65, 0x3d657a69, 0x622016c0, 0x # file: size=.. b
	.word	0x73657479, 0x7473202c, 0x5f747261, 0x73756c63, 0x # ytes, start_clus
	.word	0x3d726574, 0x202c0fc0, 0x73756c63, 0x5f726574, 0x # ter=.., cluster_
	.word	0x657a6973, 0x200ac03d, 0x74636573, 0x2073726f, 0x # size=.. sectors
	.word	0x200fc028, 0x65747962, 0x6c632f73, 0x65747375, 0x # (.. bytes/cluste
	.word	0x00002972, 0x7375722f, 0x342f6374, 0x66653461, 0x # r)../rustc/4a4ef
	.word	0x65333934, 0x34316133, 0x36633838, 0x31323365, 0x # 493e3a1488c6e321
	.word	0x32303735, 0x38303833, 0x38336234, 0x66383439, 0x # 570238084b38948f
	.word	0x2f626436, 0x7262696c, 0x2f797261, 0x65726f63, 0x # 6db/library/core
	.word	0x6372732f, 0x7274732f, 0x7461702f, 0x6e726574, 0x # /src/str/pattern
	.word	0x0073722e, 0x2f637273, 0x6e69616d, 0x6d65712d, 0x # .rs.src/main-qem
	.word	0x73722e75, 0x00000000, 0x73202013, 0x6f746365, 0x # u.rs.....  secto
	.word	0x705f7372, 0x665f7265, 0x203a7461, 0x000000c0, 0x # rs_per_fat: ....
	.word	0x6572431c, 0x6e697461, 0x69442067, 0x746e4572, 0x # .Creating DirEnt
	.word	0x2d207972, 0x6f685320, 0x203a7472, 0x2701c027, 0x # ry - Short: '..'
	.word	0x00000000, 0x444d430f, 0x203a3831, 0x64616552, 0x # .....CMD18: Read
	.word	0x20676e69, 0x622014c0, 0x6b636f6c, 0x74732073, 0x # ing .. blocks st
	.word	0x69747261, 0x6120676e, 0x00c02074, 0x6d656d15, 0x # arting at ...mem
	.word	0x2079726f, 0x6f6c6c61, 0x69746163, 0x6f206e6f, 0x # ory allocation o
	.word	0x0dc02066, 0x74796220, 0x66207365, 0x656c6961, 0x # f .. bytes faile
	.word	0x00000064, 0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x # d.../home/ben/.r
	.word	0x75747375, 0x6f742f70, 0x68636c6f, 0x736e6961, 0x # ustup/toolchains
	.word	0x6174732f, 0x2d656c62, 0x5f363878, 0x752d3436, 0x # /stable-x86_64-u
	.word	0x6f6e6b6e, 0x6c2d6e77, 0x78756e69, 0x756e672d, 0x # nknown-linux-gnu
	.word	0x62696c2f, 0x7375722f, 0x62696c74, 0x6372732f, 0x # /lib/rustlib/src
	.word	0x7375722f, 0x696c2f74, 0x72617262, 0x6f632f79, 0x # /rust/library/co
	.word	0x732f6572, 0x732f6372, 0x742f7274, 0x74696172, 0x # re/src/str/trait
	.word	0x73722e73, 0x00000000, 0x6e20200c, 0x665f6d75, 0x # s.rs.....  num_f
	.word	0x3a737461, 0x0000c020, 0x6e617210, 0x65206567, 0x # ats: ....range e
	.word	0x6920646e, 0x7865646e, 0x2022c020, 0x2074756f, 0x # nd index ." out
	.word	0x7220666f, 0x65676e61, 0x726f6620, 0x696c7320, 0x # of range for sli
	.word	0x6f206563, 0x656c2066, 0x6874676e, 0x0000c020, 0x # ce of length ...
	.word	0x6165520f, 0x676e6964, 0x63657320, 0x20726f74, 0x # .Reading sector
	.word	0x000000c0, 0x6f6f4c18, 0x676e696b, 0x726f6620, 0x # .....Looking for
	.word	0x6d6f6320, 0x656e6f70, 0x203a746e, 0x2701c027, 0x # component: '..'
	.word	0x00000000, 0x2f637273, 0x61636473, 0x722e6472, 0x # ....src/sdcard.r
	.word	0x00000073, 0x6e617212, 0x73206567, 0x74726174, 0x # s....range start
	.word	0x646e6920, 0xc0207865, 0x756f2022, 0x666f2074, 0x # index ." out of
	.word	0x6e617220, 0x66206567, 0x7320726f, 0x6563696c, 0x # range for slice
	.word	0x20666f20, 0x676e656c, 0xc0206874, 0x00000000, 0x # of length .....
	.word	0x2f637273, 0x33746166, 0x73722e32, 0x00000000, 0x # src/fat32.rs....

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.31.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.31.llvm.7710812085696039936:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6c612f79, 0x2f636f6c, 0x # t/library/alloc/
	.word	0x2f637273, 0x6c6c6f63, 0x69746365, 0x2f736e6f, 0x # src/collections/
	.word	0x65727462, 0x616e2f65, 0x61676976, 0x722e6574, 0x # btree/navigate.r
	.word	0x00000073, 0x6973551c, 0x4d20676e, 0x70205242, 0x # s....Using MBR p
	.word	0x69747261, 0x6e6f6974, 0x20746120, 0x3a41424c, 0x # artition at LBA:
	.word	0x0000c020, 0x6c754d13, 0x732d6974, 0x6f746365, 0x # ....Multi-secto
	.word	0x65722072, 0x203a6461, 0x732015c0, 0x6f746365, 0x # r read: .. secto
	.word	0x73207372, 0x74726174, 0x20676e69, 0xc0207461, 0x # rs starting at .
	.word	0x00000000, 0x444d431d, 0x203a3831, 0x69797254, 0x # .....CMD18: Tryi
	.word	0x6420676e, 0x63657269, 0x4d442074, 0x6f662041, 0x # ng direct DMA fo
	.word	0x06c02072, 0x74796220, 0x00007365, 0x70202013, 0x # r .. bytes...  p
	.word	0x69747261, 0x6e6f6974, 0x6174735f, 0x203a7472, 0x # artition_start:
# 800125b0:	000000c0                                ....

	.globl anon.aec296b685f742a7405bc8100ce2f275.23.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.23.llvm.14967730159154455495:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6c612f79, 0x2f636f6c, 0x # t/library/alloc/
	.word	0x2f637273, 0x5f776172, 0x2f636576, 0x2e646f6d, 0x # src/raw_vec/mod.
	.word	0x00007372, 0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x # rs../home/ben/.r
	.word	0x75747375, 0x6f742f70, 0x68636c6f, 0x736e6961, 0x # ustup/toolchains
	.word	0x6174732f, 0x2d656c62, 0x5f363878, 0x752d3436, 0x # /stable-x86_64-u
	.word	0x6f6e6b6e, 0x6c2d6e77, 0x78756e69, 0x756e672d, 0x # nknown-linux-gnu
	.word	0x62696c2f, 0x7375722f, 0x62696c74, 0x6372732f, 0x # /lib/rustlib/src
	.word	0x7375722f, 0x696c2f74, 0x72617262, 0x6c612f79, 0x # /rust/library/al
	.word	0x2f636f6c, 0x2f637273, 0x2e727473, 0x00007372, 0x # loc/src/str.rs..
	.word	0x7375722f, 0x342f6374, 0x66653461, 0x65333934, 0x # /rustc/4a4ef493e
	.word	0x34316133, 0x36633838, 0x31323365, 0x32303735, 0x # 3a1488c6e3215702
	.word	0x38303833, 0x38336234, 0x66383439, 0x2f626436, 0x # 38084b38948f6db/
	.word	0x7262696c, 0x2f797261, 0x6f6c6c61, 0x72732f63, 0x # library/alloc/sr
	.word	0x61722f63, 0x65765f77, 0x6f6d2f63, 0x73722e64, 0x # c/raw_vec/mod.rs
	.word	0x00000000, 0x2f637273, 0x776f6873, 0x65736163, 0x # ....src/showcase
	.word	0x0073722e, 0x4e464c0f, 0x61726620, 0x6e656d67, 0x # .rs..LFN fragmen
	.word	0x27203a74, 0x2c2715c0, 0x6c756620, 0x464c206c, 0x # t: '..', full LF
	.word	0x6f73204e, 0x72616620, 0xc027203a, 0x00002701, 0x # N so far: '..'..
	.word	0x65684311, 0x6e696b63, 0x68732067, 0x3a74726f, 0x # .Checking short:
	.word	0x01c02720, 0x00000027, 0x # '..'...

	.globl anon.f35598fd8d4aa665f0d160006d04b7cb.3.llvm.5536013400419366916
anon.f35598fd8d4aa665f0d160006d04b7cb.3.llvm.5536013400419366916:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6f632f79, 0x732f6572, 0x # t/library/core/s
	.word	0x612f6372, 0x636f6c6c, 0x79616c2f, 0x2e74756f, 0x # rc/alloc/layout.
# 800127ac:	00007372                                rs..

	.globl anon.17904dba1e92d1cee57ddc06e0f4a7fd.1.llvm.2171931009800262987
anon.17904dba1e92d1cee57ddc06e0f4a7fd.1.llvm.2171931009800262987:
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6f632f79, 0x732f6572, 0x # t/library/core/s
	.word	0x702f6372, 0x6d2f7274, 0x722e646f, 0x00000073, 0x # rc/ptr/mod.rs...
	.word	0x6d6f682f, 0x65622f65, 0x722e2f6e, 0x75747375, 0x # /home/ben/.rustu
	.word	0x6f742f70, 0x68636c6f, 0x736e6961, 0x6174732f, 0x # p/toolchains/sta
	.word	0x2d656c62, 0x5f363878, 0x752d3436, 0x6f6e6b6e, 0x # ble-x86_64-unkno
	.word	0x6c2d6e77, 0x78756e69, 0x756e672d, 0x62696c2f, 0x # wn-linux-gnu/lib
	.word	0x7375722f, 0x62696c74, 0x6372732f, 0x7375722f, 0x # /rustlib/src/rus
	.word	0x696c2f74, 0x72617262, 0x6c612f79, 0x2f636f6c, 0x # t/library/alloc/
	.word	0x2f637273, 0x6c6c6f63, 0x69746365, 0x2f736e6f, 0x # src/collections/
	.word	0x65727462, 0x616d2f65, 0x6e652f70, 0x2e797274, 0x # btree/map/entry.
	.word	0x00007372, 0x7479620b, 0x6e692065, 0x20786564, 0x # rs...byte index
	.word	0x692016c0, 0x756f2073, 0x666f2074, 0x756f6220, 0x # .. is out of bou
	.word	0x2073646e, 0x6020666f, 0xc06001c0, 0x00000000, 0x # nds of `..`.....
	.word	0x61655222, 0x676e6964, 0x6f6f7220, 0x69642074, 0x # "Reading root di
	.word	0x74636572, 0x2079726f, 0x73207461, 0x6f746365, 0x # rectory at secto
	.word	0xc0203a72, 0x00000000, 0x444d4303, 0x203a10c0, 0x # r: ......CMD..:
	.word	0x6d6d6f43, 0x20646e61, 0x6c696166, 0x00006465, 0x # Command failed..
	.word	0x4341430c, 0x462f4548, 0x53544e4f, 0x0000c02f, 0x # .CACHE/FONTS/...
	.word	0x444d4319, 0x203a3831, 0x63637553, 0x66737365, 0x # .CMD18: Successf
	.word	0x796c6c75, 0x61657220, 0x0cc02064, 0x74796220, 0x # ully read .. byt
	.word	0x74207365, 0x6c61746f, 0x00000000, 0x444d4303, 0x # es total.....CMD
	.word	0x203a0dc0, 0x20414d44, 0x656d6974, 0x0074756f, 0x # ..: DMA timeout.
	.word	0x7375722f, 0x342f6374, 0x66653461, 0x65333934, 0x # /rustc/4a4ef493e
	.word	0x34316133, 0x36633838, 0x31323365, 0x32303735, 0x # 3a1488c6e3215702
	.word	0x38303833, 0x38336234, 0x66383439, 0x2f626436, 0x # 38084b38948f6db/
	.word	0x7262696c, 0x2f797261, 0x6f6c6c61, 0x72732f63, 0x # library/alloc/sr
	.word	0x6d662f63, 0x73722e74, 0x00000000, 0x # c/fmt.rs....

.Lanon.50240f12f5a0150d632a0929b9f04c3b.1:
	.word	0x74696e49, 0x696c6169, 0x676e697a, 0x636f4220, 0x # Initializing Boc
	.word	0x64207368, 0x6c707369, 0x2e2e7961, 0x00000a2e, 0x # hs display......

.Lanon.50240f12f5a0150d632a0929b9f04c3b.2:
	.word	0x6e756f46, 0x6f422064, 0x20736863, 0x70736964, 0x # Found Bochs disp
	.word	0x2079616c, 0x69766564, 0x0a216563, 0x # lay device!.

.Lanon.50240f12f5a0150d632a0929b9f04c3b.3:
	.word	0x6d617246, 0x66756265, 0x20726566, 0x203a7461, 0x # Framebuffer at:
# 800129f8:	00007830                                0x..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.4:
	.word	0x20454256, 0x69676572, 0x72657473, 0x74612073, 0x # VBE registers at
# 80012a0c:	7830203a                                : 0x

.Lanon.50240f12f5a0150d632a0929b9f04c3b.5:
	.word	0x666e6f43, 0x72756769, 0x20676e69, 0x20454256, 0x # Configuring VBE
	.word	0x69676572, 0x72657473, 0x69762073, 0x41422061, 0x # registers via BA
	.word	0x2e2e3252, 0x00000a2e, 0x # R2......

.Lanon.50240f12f5a0150d632a0929b9f04c3b.6:
	.word	0x74697257, 0x20676e69, 0x20454256, 0x69676572, 0x # Writing VBE regi
	.word	0x72657473, 0x64282073, 0x63657269, 0x4d4d2074, 0x # sters (direct MM
	.word	0x61204f49, 0x73656363, 0x0a3a2973, 0x # IO access):.

.Lanon.50240f12f5a0150d632a0929b9f04c3b.7:
	.word	0x6e726157, 0x3a676e69, 0x45425620, 0x20444920, 0x # Warning: VBE ID
	.word	0x30207369, 0x7274202c, 0x676e6979, 0x206f7420, 0x # is 0, trying to
	.word	0x74696e69, 0x696c6169, 0x6120657a, 0x6177796e, 0x # initialize anywa
	.word	0x2e2e2e79, 0x0000000a, 0x # y.......

.Lanon.50240f12f5a0150d632a0929b9f04c3b.8:
	.word	0x696c6156, 0x42562064, 0x44492045, 0x74656420, 0x # Valid VBE ID det
	.word	0x65746365, 0x000a2164, 0x # ected!..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.9:
	.word	0x74746553, 0x20676e69, 0x65722058, 0x756c6f73, 0x # Setting X resolu
	.word	0x6e6f6974, 0x206f7420, 0x # tion to

.Lanon.50240f12f5a0150d632a0929b9f04c3b.10:
	.word	0x74746553, 0x20676e69, 0x65722059, 0x756c6f73, 0x # Setting Y resolu
	.word	0x6e6f6974, 0x206f7420, 0x # tion to

.Lanon.50240f12f5a0150d632a0929b9f04c3b.11:
	.word	0x62616e45, 0x676e696c, 0x73696420, 0x79616c70, 0x # Enabling display
	.word	0x74697720, 0x464c2068, 0x00000a42, 0x # with LFB...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.12:
	.word	0x20454256, 0x666e6f63, 0x72756769, 0x6f697461, 0x # VBE configuratio
	.word	0x6f63206e, 0x656c706d, 0x000a6574, 0x # n complete..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.13:
	.word	0x6d617246, 0x66756265, 0x20726566, 0x64616572, 0x # Framebuffer read
# 80012b2c:	00000a79                                y...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.14:
	.word	0x6e616353, 0x676e696e, 0x49435020, 0x73756220, 0x # Scanning PCI bus
# 80012b40:	0a2e2e2e                                ....

.Lanon.50240f12f5a0150d632a0929b9f04c3b.15:
	.word	0x68636f42, 0x69642073, 0x616c7073, 0x65642079, 0x # Bochs display de
	.word	0x65636976, 0x746f6e20, 0x756f6620, 0x000a646e, 0x # vice not found..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.16:
	.word	0x504e4920, 0x2d205455, 0x6e616820, 0x64656c64, 0x # INPUT - handled
	.word	0x20796220, 0x74726976, 0x695f6f69, 0x7475706e, 0x # by virtio_input
	.word	0x646f6d20, 0x00656c75, 0x # module.

.Lanon.50240f12f5a0150d632a0929b9f04c3b.17:
	.word	0x666e6f43, 0x72756769, 0x20676e69, 0x73524142, 0x # Configuring BARs
# 80012b9c:	0a2e2e2e                                ....

.Lanon.50240f12f5a0150d632a0929b9f04c3b.18:
	.word	0x30524142, 0x61657220, 0x63616264, 0x30203a6b, 0x # BAR0 readback: 0
# 80012bb0:	00000078                                x...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.19:
	.word	0x5241420a, 0x65722032, 0x61626461, 0x203a6b63, 0x # .BAR2 readback:
# 80012bc4:	00007830                                0x..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.20:
	.word	0x30524142, 0x6e6f6320, 0x20676966, 0x6c696166, 0x # BAR0 config fail
	.word	0x2d206465, 0x61726620, 0x7562656d, 0x72656666, 0x # ed - framebuffer
	.word	0x746f6e20, 0x70616d20, 0x0a646570, 0x20202020, 0x # not mapped.
	.word	0x454d4954, 0x455f3052, 0x45505f56, 0x4e49444e, 0x # TIMER0_EV_PENDIN
	.word	0x203d2047, 0x20203b31, 0x20202020, 0x6c696146, 0x # G = 1;      Fail
	.word	0x74206465, 0x6572206f, 0x46206461, 0x32335441, 0x # ed to read FAT32
	.word	0x6f6f6220, 0x65732074, 0x726f7463, 0x20202020, 0x # boot sector
	.word	0x53202f2f, 0x69207465, 0x7265746e, 0x74707572, 0x # // Set interrupt
	.word	0x63657620, 0x20726f74, 0x20202020, 0x636e6923, 0x # vector     #inc
	.word	0x6564756c, 0x74733c20, 0x2e6f6964, 0x20203e68, 0x # lude <stdio.h>
	.word	0x20202020, 0x20202020, 0x20202020, 0x20544446, 0x # FDT
	.word	0x72646461, 0x74756f20, 0x65646973, 0x70786520, 0x # addr outside exp
	.word	0x65746365, 0x61722064, 0x0a65676e, 0x20202020, 0x # ected range.
	.word	0x20202020, 0x63656863, 0x61755f6b, 0x29287472, 0x # check_uart()
	.word	0x2020203b, 0x20202020, 0x20202020, 0x20202020, 0x # ;
	.word	0x75746572, 0x30206e72, 0x2020203b, 0x20202020, 0x # return 0;
	.word	0x20202020, 0x20202020, 0x20202020, 0x # 20202020
	.word	0x2020207d, 0x20202020, 0x20202020, 0x20202020, 0x # }
	.word	0x20202020, 0x20202020, 0x20202020, 0x2020207d, 0x # }
	.word	0x20202020, 0x20202020, 0x20202020, 0x # 20202020
	.word	0x20202020, 0x20202020, 0x20202020, 0x6d617246, 0x # Fram
	.word	0x66756265, 0x3a726566, 0x6e6f6320, 0x75676966, 0x # ebuffer: configu
	.word	0x6c626172, 0x6f662065, 0x74616d72, 0x20746e69, 0x # rable formatint
	.word	0x6e69616d, 0x696f7628, 0x7b202964, 0x20202020, 0x # main(void) {
	.word	0x20202020, 0x20202020, 0x20202020, 0x # 20202020
	.word	0x20202020, 0x636f7270, 0x5f737365, 0x75706e69, 0x # process_inpu
	.word	0x3b292874, 0x20202020, 0x20202020, 0x73524142, 0x # t();        BARs
	.word	0x726c6120, 0x79646165, 0x6e6f6320, 0x75676966, 0x # already configu
	.word	0x20646572, 0x51207962, 0x0a554d45, 0x20202020, 0x # red by QEMU.
	.word	0x6b636974, 0x3b2b2b73, 0x20202020, 0x20202020, 0x # ticks++;
	.word	0x20202020, 0x20202020, 0x20202020, 0x # 20202020
	.word	0x75746573, 0x6e695f70, 0x72726574, 0x73747075, 0x # setup_interrupts
	.word	0x203b2928, 0x20202020, 0x20202020, 0x20202020, 0x # ();
	.word	0x62616e65, 0x745f656c, 0x72656d69, 0x203b2928, 0x # enable_timer();
	.word	0x20202020, 0x20202020, 0x20202020, 0x # 20202020
	.word	0x28206669, 0x6d696e61, 0x6f697461, 0x6e655f6e, 0x # if (animation_en
	.word	0x656c6261, 0x7b202964, 0x20202020, 0x20202020, 0x # abled) {
	.word	0x43202f2f, 0x7261656c, 0x6e657020, 0x676e6964, 0x # // Clear pending
	.word	0x746e6920, 0x75727265, 0x20207470, 0x20202020, 0x # interrupt
	.word	0x20202020, 0x20202020, 0x20202020, 0x # 20202020
	.word	0x20202020, 0x20202020, 0x20202020, 0x # 20202020
	.word	0x20202020, 0x646e6168, 0x675f656c, 0x68706172, 0x # handle_graph
	.word	0x28736369, 0x20203b29, 0x20202020, 0x20202020, 0x # ics();
	.word	0x20202020, 0x61647075, 0x665f6574, 0x656d6172, 0x # update_frame
	.word	0x6675625f, 0x28726566, 0x20203b29, 0x636e6923, 0x # _buffer();  #inc
	.word	0x6564756c, 0x74733c20, 0x746e6964, 0x203e682e, 0x # lude <stdint.h>
	.word	0x20202020, 0x20202020, 0x20202020, 0x # 20202020
	.word	0x49202f2f, 0x6974696e, 0x7a696c61, 0x79732065, 0x # // Initialize sy
	.word	0x6d657473, 0x20202020, 0x20202020, 0x20202020, 0x # stem
	.word	0x74617473, 0x75206369, 0x33746e69, 0x20745f32, 0x # static uint32_t
	.word	0x6b636974, 0x203d2073, 0x20203b30, 0x20202020, 0x # ticks = 0;
	.word	0x43202f2f, 0x69666e6f, 0x65727567, 0x494c5020, 0x # // Configure PLI
	.word	0x20202043, 0x20202020, 0x20202020, 0x20202020, 0x # C
	.word	0x6c696877, 0x31282065, 0x207b2029, 0x20202020, 0x # while (1) {
	.word	0x20202020, 0x20202020, 0x # 20202020

.Lanon.50240f12f5a0150d632a0929b9f04c3b.22:
	.word	0x62616e45, 0x2064656c, 0x6f6d656d, 0x61207972, 0x # Enabled memory a
	.word	0x73656363, 0x6e692073, 0x6d6f6320, 0x646e616d, 0x # ccess in command
	.word	0x67657220, 0x65747369, 0x00000a72, 0x # register...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.23:
	.word	0x6f6d654d, 0x61207972, 0x73656363, 0x6c612073, 0x # Memory access al
	.word	0x64616572, 0x6e652079, 0x656c6261, 0x00000a64, 0x # ready enabled...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.24:
	.word	0x6e697355, 0x41422067, 0x28203052, 0x3a294246, 0x # Using BAR0 (FB):
# 80012f90:	00783020                                 0x.

.Lanon.50240f12f5a0150d632a0929b9f04c3b.25:
	.word	0x6e697355, 0x41422067, 0x28203252, 0x29454256, 0x # Using BAR2 (VBE)
# 80012fa4:	7830203a                                : 0x

.Lanon.50240f12f5a0150d632a0929b9f04c3b.26:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x65723a3a, 0x765f6461, 0x74616c6f, 0x # ptr::read_volat
	.word	0x20656c69, 0x75716572, 0x73657269, 0x61687420, 0x # ile requires tha
	.word	0x68742074, 0x6f702065, 0x65746e69, 0x72612072, 0x # t the pointer ar
	.word	0x656d7567, 0x6920746e, 0x6c612073, 0x656e6769, 0x # gument is aligne
	.word	0x540a0a64, 0x20736968, 0x69646e69, 0x65746163, 0x # d..This indicate
	.word	0x20612073, 0x20677562, 0x74206e69, 0x70206568, 0x # s a bug in the p
	.word	0x72676f72, 0x202e6d61, 0x73696854, 0x646e5520, 0x # rogram. This Und
	.word	0x6e696665, 0x42206465, 0x76616865, 0x20726f69, 0x # efined Behavior
	.word	0x63656863, 0x7369206b, 0x74706f20, 0x616e6f69, 0x # check is optiona
	.word	0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x65622074, 0x # l, and cannot be
	.word	0x6c657220, 0x20646569, 0x66206e6f, 0x7320726f, 0x # relied on for s
	.word	0x74656661, 0x00002e79, 0x # afety...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.27:
	.word	0x20756d65, 0x656d6f48, 0x77657262, 0x20534f20, 0x # emu Homebrew OS
	.word	0x64616552, 0x000a2179, 0x # Ready!..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.28:
	.word	0x746f6f42, 0x67726120, 0x61203a73, 0x61682830, 0x # Boot args: a0(ha
	.word	0x64697472, 0x78303d29, 0x # rtid)=0x

.Lanon.50240f12f5a0150d632a0929b9f04c3b.30:
	.word	0x800122b4, 0x00000010, 0x00000202, 0x0000003b, 0x # ."..........;...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.31:
	.word	0x54524155, 0x726f7720, 0x676e696b, 0x20746120, 0x # UART working at
	.word	0x30317830, 0x30303030, 0x000a3030, 0x # 0x10000000..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.32:
	.word	0x74696e49, 0x696c6169, 0x676e697a, 0x72695620, 0x # Initializing Vir
	.word	0x204f4974, 0x75706e69, 0x6d282074, 0x6c75646f, 0x # tIO input (modul
	.word	0x2e297261, 0x000a2e2e, 0x # ar).....

.Lanon.50240f12f5a0150d632a0929b9f04c3b.33:
	.word	0x74726956, 0x69204f49, 0x7475706e, 0x746f6e20, 0x # VirtIO input not
	.word	0x61766120, 0x62616c69, 0x2d20656c, 0x69737520, 0x # available - usi
	.word	0x7320676e, 0x61697265, 0x6f63206c, 0x6c6f736e, 0x # ng serial consol
	.word	0x6e6f2065, 0x000a796c, 0x # e only..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.34:
	.word	0x74726956, 0x69204f49, 0x7475706e, 0x696e6920, 0x # VirtIO input ini
	.word	0x6c616974, 0x64657a69, 0x67202d20, 0x68706172, 0x # tialized - graph
	.word	0x20736369, 0x646e6977, 0x7320776f, 0x6c756f68, 0x # ics window shoul
	.word	0x63612064, 0x74706563, 0x706e6920, 0x000a7475, 0x # d accept input..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.35:
	.word	0x74726956, 0x62204f49, 0x20657361, 0x72646461, 0x # VirtIO base addr
	.word	0x3a737365, 0x00783020, 0x # ess: 0x.

.Lanon.50240f12f5a0150d632a0929b9f04c3b.36:
	.word	0x68636f42, 0x69642073, 0x616c7073, 0x6e692079, 0x # Bochs display in
	.word	0x61697469, 0x657a696c, 0x000a2164, 0x # itialized!..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.37:
	.word	0x68636f42, 0x69642073, 0x616c7073, 0x61662079, 0x # Bochs display fa
	.word	0x64656c69, 0x206f7420, 0x74696e69, 0x696c6169, 0x # iled to initiali
# 800131d0:	000a657a                                ze..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.38:
	.word	0x6e6e7552, 0x20676e69, 0x73206e69, 0x61697265, 0x # Running in seria
	.word	0x6e6f2d6c, 0x6d20796c, 0x0a65646f, 0x # l-only mode.

.Lanon.50240f12f5a0150d632a0929b9f04c3b.39:
	.word	0x00000000, 0x0000000c, 0x00000004, 0x80005270, 0x # ............pR..
	.word	0x80005890, 0x80005998, 0x800050f0, 0x80005104, 0x # .X...Y...P...Q..
	.word	0x80005118, 0x800052ec, 0x800058f8, 0x8000556c, 0x # .Q...R...X..lU..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.40:
	.word	0x776f6853, 0x65736163, 0x6e657220, 0x65726564, 0x # Showcase rendere
	.word	0x55202e64, 0x5b206573, 0x74205d20, 0x616e206f, 0x # d. Use [ ] to na
	.word	0x61676976, 0x70206574, 0x73656761, 0x0000000a, 0x # vigate pages....

.Lanon.50240f12f5a0150d632a0929b9f04c3b.41:
	.word	0x6d6d6f43, 0x73646e61, 0x3d68203a, 0x706c6568, 0x # Commands: h=help
	.word	0x5d205b20, 0x76616e3d, 0x74616769, 0x3d662065, 0x # [ ]=navigate f=
	.word	0x72666572, 0x20687365, 0x75713d71, 0x3e0a7469, 0x # refresh q=quit.>
# 80013280:	00000020                                 ...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.42:
	.word	0x6d6d6f43, 0x73646e61, 0x3d68203a, 0x706c6568, 0x # Commands: h=help
	.word	0x5d205b20, 0x76616e3d, 0x74616769, 0x3d662065, 0x # [ ]=navigate f=
	.word	0x72666572, 0x20687365, 0x75713d71, 0x000a7469, 0x # refresh q=quit..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.43:
	.word	0x75706e49, 0x54203a74, 0x20657079, 0x67206e69, 0x # Input: Type in g
	.word	0x68706172, 0x20736369, 0x646e6977, 0x6f20776f, 0x # raphics window o
	.word	0x65732072, 0x6c616972, 0x6e6f6320, 0x656c6f73, 0x # r serial console
# 800132e4:	00203e0a                                .> .

.Lanon.50240f12f5a0150d632a0929b9f04c3b.44:
	.word	0x205b2020, 0x7250202d, 0x6f697665, 0x70207375, 0x # [ - Previous p
# 800132f8:	0a656761                                age.

.Lanon.50240f12f5a0150d632a0929b9f04c3b.45:
	.word	0x20662020, 0x6552202d, 0x73657266, 0x69642068, 0x # f - Refresh di
	.word	0x616c7073, 0x00000a79, 0x # splay...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.46:
	.word	0x20712020, 0x7551202d, 0x28207469, 0x74756873, 0x # q - Quit (shut
	.word	0x6e776f64, 0x00000a29, 0x # down)...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.47:
	.word	0x6572500a, 0x756f6976, 0x61702073, 0x3e0a6567, 0x # .Previous page.>
# 8001333c:	00000020                                 ...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.48:
	.word	0x800122b4, 0x00000010, 0x0000026a, 0x00000028, 0x # ."......j...(...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.49:
	.word	0x7269560a, 0x204f4974, 0x4f494d4d, 0x61637320, 0x # .VirtIO MMIO sca
# 80013360:	000a3a6e                                n:..

.Lanon.50240f12f5a0150d632a0929b9f04c3b.50:
	.word	0x63412020, 0x65766974, 0x73616220, 0x30203a65, 0x # Active base: 0
# 80013374:	00000078                                x...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.51:
	.word	0x800122b4, 0x00000010, 0x00000286, 0x0000003e, 0x # ."..........>...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.52:
	.word	0x800122b4, 0x00000010, 0x00000288, 0x00000030, 0x # ."..........0...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.53:
	.word	0x800122b4, 0x00000010, 0x00000289, 0x0000002f, 0x # ."........../...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.54:
	.word	0x800122b4, 0x00000010, 0x0000028a, 0x0000002f, 0x # ."........../...

.Lanon.50240f12f5a0150d632a0929b9f04c3b.55:
	.word	0x7568530a, 0x6e697474, 0x6f642067, 0x2e2e6e77, 0x # .Shutting down..
# 800133c8:	00000a2e                                ....

.Lanon.50240f12f5a0150d632a0929b9f04c3b.56:
	.word	0x800122b4, 0x00000010, 0x000002c6, 0x0000001e, 0x # ."..............

.LJTI2_0:
	.word	0x80003950
	.word	0x80003768
	.word	0x80003896
	.word	0x80003992
	.word	0x80003854

.LJTI2_1:
	.word	0x80003f7c
	.word	0x80003fc0
	.word	0x80003fa2
	.word	0x80003fac
	.word	0x80003f8a
	.word	0x80003fca
	.word	0x80003fd8
	.word	0x80003fb6
	.word	0x80003fec
	.word	0x80003f98
	.word	0x80003fe2
	.word	0x80003f86
	.word	0x80003f94
	.word	0x80003fd4
	.word	0x80003f4e
	.word	0x80004998

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.0:
	.word	0x52786556, 0x76637369, 0x504d532d, 0x6d6f4820, 0x # VexRiscv-SMP Hom
	.word	0x65726265, 0x534f2077, 0x # ebrew OS

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.1:
	.word	0x69736142, 0x68432063, 0x63617261, 0x20726574, 0x # Basic Character
	.word	0x73746553, 0x0000003a, 0x # Sets:...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.2:
	.word	0x44434241, 0x48474645, 0x4c4b4a49, 0x504f4e4d, 0x # ABCDEFGHIJKLMNOP
	.word	0x54535251, 0x58575655, 0x00005a59, 0x # QRSTUVWXYZ..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.3:
	.word	0x64636261, 0x68676665, 0x6c6b6a69, 0x706f6e6d, 0x # abcdefghijklmnop
	.word	0x74737271, 0x78777675, 0x00007a79, 0x # qrstuvwxyz..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.4:
	.word	0x33323130, 0x37363534, 0x00003938, 0x # 0123456789..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.5:
	.word	0x636e7550, 0x74617574, 0x206e6f69, 0x79532026, 0x # Punctuation & Sy
	.word	0x6c6f626d, 0x00003a73, 0x # mbols:..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.6:
	.word	0x24234021, 0x2a265e25, 0x2b5f2928, 0x5d5b3d2d, 0x # !@#$%^&*()_+-=[]
	.word	0x5c7c7d7b, 0x27223b3a, 0x2e2c3e3c, 0x00002f3f, 0x # {}|\:;"'<>,.?/..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.7:
# 800134dc:	0000607e                                ~`..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.8:
	.word	0x74616546, 0x73657275, 0x6e41203a, 0x6c616974, 0x # Features: Antial
	.word	0x69736169, 0x202c676e, 0x6e72656b, 0x2c676e69, 0x # iasing, kerning,
	.word	0x62757320, 0x65786970, 0x6572206c, 0x7265646e, 0x # subpixel render
# 80013510:	00676e69                                ing.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.9:
	.word	0x746e6f46, 0x6f52203a, 0x6f746f62, 0x67655220, 0x # Font: Roboto Reg
	.word	0x72616c75, 0x70363120, 0x52472078, 0x6f662046, 0x # ular 16px GRF fo
# 80013534:	74616d72                                rmat

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.10:
	.word	0x6976614e, 0x65746167, 0x205b203a, 0x6150205d, 0x # Navigate: [ ] Pa
	.word	0x20736567, 0x52202a20, 0x6f6f6265, 0x66202074, 0x # ges  * Reboot  f
	.word	0x66655220, 0x68736572, 0x20622020, 0x63697551, 0x # Refresh  b Quic
	.word	0x6542206b, 0x6d68636e, 0x736b7261, 0x # k Benchmarks

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.11:
	.word	0x20786548, 0x64697267, 0x6f52203a, 0x78323d77, 0x # Hex grid: Row=2x
	.word	0x2c78462d, 0x6c6f4320, 0x462d303d, 0x6f432020, 0x # -Fx, Col=0-F  Co
	.word	0x73726f6c, 0x6857203a, 0x3d657469, 0x7474654c, 0x # lors: White=Lett
	.word	0x20737265, 0x65657247, 0x754e3d6e, 0x7265626d, 0x # ers Green=Number
# 800135b4:	00000073                                s...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.12:
	.word	0x6e617943, 0x6d79533d, 0x736c6f62, 0x6c655920, 0x # Cyan=Symbols Yel
	.word	0x3d776f6c, 0x65747845, 0x6465646e, 0x68432020, 0x # low=Extended  Ch
	.word	0x63617261, 0x20726574, 0x20746573, 0x322d3233, 0x # aracter set 32-2
	.word	0x28203535, 0x20343232, 0x72616863, 0x00002973, 0x # 55 (224 chars)..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.14:
	.word	0x80011afc, 0x00000012, 0x00000082, 0x00000014, 0x # ................

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.15:
# 80013608:	00007832                                2x..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.16:
# 8001360c:	00007833                                3x..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.17:
# 80013610:	00007834                                4x..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.18:
# 80013614:	00007835                                5x..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.19:
# 80013618:	00007836                                6x..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.20:
# 8001361c:	00007837                                7x..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.21:
# 80013620:	00007838                                8x..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.22:
# 80013624:	00007839                                9x..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.23:
# 80013628:	00007841                                Ax..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.24:
# 8001362c:	00007842                                Bx..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.25:
# 80013630:	00007843                                Cx..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.26:
# 80013634:	00007844                                Dx..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.27:
# 80013638:	00007845                                Ex..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.28:
# 8001363c:	00007846                                Fx..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.29:
# 80013640:	00003f3f                                ??..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.30:
# 80013644:	00000030                                0...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.31:
# 80013648:	00000031                                1...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.32:
# 8001364c:	00000032                                2...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.33:
# 80013650:	00000033                                3...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.34:
# 80013654:	00000034                                4...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.35:
# 80013658:	00000035                                5...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.36:
# 8001365c:	00000036                                6...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.37:
# 80013660:	00000037                                7...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.38:
# 80013664:	00000038                                8...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.39:
# 80013668:	00000039                                9...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.40:
# 8001366c:	00000041                                A...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.41:
# 80013670:	00000042                                B...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.42:
# 80013674:	00000043                                C...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.43:
# 80013678:	00000044                                D...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.44:
# 8001367c:	00000045                                E...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.45:
# 80013680:	00000046                                F...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.46:
# 80013684:	0000003f                                ?...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.47:
	.word	0x64616552, 0x6c696261, 0x20797469, 0x74736554, 0x # Readability Test
# 80013698:	00003a73                                s:..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.48:
	.word	0x20656854, 0x63697571, 0x7262206b, 0x206e776f, 0x # The quick brown
	.word	0x20786f66, 0x706d756a, 0x766f2073, 0x74207265, 0x # fox jumps over t
	.word	0x6c206568, 0x20797a61, 0x2e676f64, 0x # he lazy dog.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.49:
	.word	0x4b434150, 0x20594d20, 0x20584f42, 0x48544957, 0x # PACK MY BOX WITH
	.word	0x56494620, 0x4f442045, 0x204e455a, 0x5551494c, 0x # FIVE DOZEN LIQU
	.word	0x4a20524f, 0x2e534755, 0x # OR JUGS.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.50:
	.word	0x20776f48, 0x69786576, 0x796c676e, 0x69757120, 0x # How vexingly qui
	.word	0x64206b63, 0x20746661, 0x7262657a, 0x6a207361, 0x # ck daft zebras j
# 80013710:	21706d75                                ump!

	.globl anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667
anon.005cfa5d445b87349f1e14d011b04bf9.0.llvm.15265789809716305667:
	.word	0x33323130, 0x37363534, 0x42413938, 0x46454443, 0x # 0123456789ABCDEF
	.word	0x6e617943, 0x78655420, 0x61532074, 0x656c706d, 0x # Cyan Text Sample
	.word	0x6f626173, 0x656e2d6e, 0x30327478, 0x6672672e, 0x # sabon-next20.grf
	.word	0x6f626173, 0x656e2d6e, 0x38317478, 0x6672672e, 0x # sabon-next18.grf
	.word	0x00000045, 0x00000057, 0x00000049, 0x00000044, 0x # E...W...I...D...
	.word	0x66667542, 0x74207265, 0x73206f6f, 0x6c6c616d, 0x # Buffer too small
	.word	0x65756c42, 0x78655420, 0x61532074, 0x656c706d, 0x # Blue Text Sample
	.word	0x6f626173, 0x656e2d6e, 0x35317478, 0x6672672e, 0x # sabon-next15.grf
	.word	0x33323130, 0x37363534, 0x62613938, 0x66656463, 0x # 0123456789abcdef
	.word	0x6578694d, 0x61432064, 0x54206573, 0x3a747865, 0x # Mixed Case Text:
	.word	0x6f626173, 0x656e2d6e, 0x36317478, 0x6672672e, 0x # sabon-next16.grf

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.52:
	.word	0x65726f4c, 0x7069206d, 0x206d7573, 0x6f6c6f64, 0x # Lorem ipsum dolo
	.word	0x69732072, 0x6d612074, 0x202c7465, 0x736e6f63, 0x # r sit amet, cons
	.word	0x65746365, 0x00727574, 0x # ectetur.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.53:
	.word	0x70696461, 0x69637369, 0x6520676e, 0x2e74696c, 0x # adipiscing elit.
	.word	0x64655320, 0x206f6420, 0x73756965, 0x20646f6d, 0x # Sed do eiusmod
	.word	0x706d6574, 0x0000726f, 0x # tempor..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.54:
	.word	0x69636e69, 0x75646964, 0x7520746e, 0x616c2074, 0x # incididunt ut la
	.word	0x65726f62, 0x20746520, 0x6f6c6f64, 0x6d206572, 0x # bore et dolore m
	.word	0x616e6761, 0x696c6120, 0x2e617571, 0x # agna aliqua.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.55:
	.word	0x6f626f52, 0x46206f74, 0x20746e6f, 0x646f6d28, 0x # Roboto Font (mod
	.word	0x296e7265, 0x0000003a, 0x # ern):...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.56:
	.word	0x20746e69, 0x6e69616d, 0x7b202928, 0x69727020, 0x # int main() { pri
	.word	0x2866746e, 0x6c654822, 0x202c6f6c, 0x6c726f57, 0x # ntf("Hello, Worl
	.word	0x6e5c2164, 0x203b2922, 0x0000007d, 0x # d!\n"); }...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.57:
	.word	0x204d4249, 0x20414756, 0x746e6f46, 0x65722820, 0x # IBM VGA Font (re
	.word	0x206f7274, 0x6f6e6f6d, 0x63617073, 0x003a2965, 0x # tro monospace):.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.58:
	.word	0x30347830, 0x30303043, 0x2b203030, 0x2a792820, 0x # 0x40C00000 + (y*
	.word	0x2b303436, 0x322a2978, 0x70203d20, 0x6c657869, 0x # 640+x)*2 = pixel
	.word	0x6464615f, 0x00000072, 0x # _addr...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.59:
	.word	0x205d205b, 0x76657250, 0x73756f69, 0x78654e2f, 0x # [ ] Previous/Nex
	.word	0x61502074, 0x00006567, 0x # t Page..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.60:
	.word	0x6f6c6f43, 0x61502072, 0x7474656c, 0x65442065, 0x # Color Palette De
	.word	0x736e6f6d, 0x74617274, 0x3a6e6f69, 0x # monstration:

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.61:
	.word	0x20646552, 0x74786554, 0x6d615320, 0x00656c70, 0x # Red Text Sample.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.62:
	.word	0x65657247, 0x6554206e, 0x53207478, 0x6c706d61, 0x # Green Text Sampl
# 80013920:	00000065                                e...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.64:
	.word	0x6c6c6559, 0x5420776f, 0x20747865, 0x706d6153, 0x # Yellow Text Samp
# 80013934:	0000656c                                le..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.66:
	.word	0x6567614d, 0x2061746e, 0x74786554, 0x6d615320, 0x # Magenta Text Sam
# 80013948:	00656c70                                ple.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.67:
	.word	0x6e61724f, 0x54206567, 0x20747865, 0x706d6153, 0x # Orange Text Samp
# 8001395c:	0000656c                                le..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.68:
	.word	0x70727550, 0x5420656c, 0x20747865, 0x706d6153, 0x # Purple Text Samp
# 80013970:	0000656c                                le..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.69:
	.word	0x68676952, 0x69532074, 0x00006564, 0x # Right Side..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.70:
	.word	0x74786554, 0x696c4120, 0x656d6e67, 0x0000746e, 0x # Text Alignment..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.71:
	.word	0x74736554, 0x00676e69, 0x # Testing.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.72:
	.word	0x63617053, 0x3a676e69, 0x206e2020, 0x2072206f, 0x # Spacing:  n o r
	.word	0x2061206d, 0x2020206c, 0x20207376, 0x69207720, 0x # m a l   vs   w i
# 800139b8:	65206420                                 d e

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.73:
	.word	0x64726148, 0x65726177, 0x616c5020, 0x726f6674, 0x # Hardware Platfor
# 800139cc:	00003a6d                                m:..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.74:
	.word	0x636f7250, 0x6f737365, 0x56203a72, 0x69527865, 0x # Processor: VexRi
	.word	0x2d766373, 0x20504d53, 0x33565228, 0x414d4932, 0x # scv-SMP (RV32IMA
# 800139f0:	00000029                                )...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.75:
	.word	0x6f6d654d, 0x203a7972, 0x20424d38, 0x41524453, 0x # Memory: 8MB SDRA
	.word	0x2040204d, 0x30347830, 0x30303030, 0x00003030, 0x # M @ 0x40000000..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.77:
	.word	0x74666f53, 0x65726177, 0x61745320, 0x003a6b63, 0x # Software Stack:.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.78:
	.word	0x676e614c, 0x65676175, 0x7552203a, 0x28207473, 0x # Language: Rust (
	.word	0x735f6f6e, 0x202c6474, 0x65726162, 0x74656d20, 0x # no_std, bare met
# 80013a44:	00296c61                                al).

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.79:
	.word	0x746e6f46, 0x73795320, 0x3a6d6574, 0x46524720, 0x # Font System: GRF
	.word	0x6c472820, 0x20687079, 0x646e6552, 0x6e697265, 0x # (Glyph Renderin
	.word	0x6f462067, 0x74616d72, 0x00000029, 0x # g Format)...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.80:
	.word	0x70617247, 0x73636968, 0x6f66203a, 0x74616d72, 0x # Graphics: format
	.word	0x6e67612d, 0x6974736f, 0x69772063, 0x61206874, 0x # -agnostic with a
	.word	0x6168706c, 0x656c6220, 0x6e69646e, 0x00000067, 0x # lpha blending...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.81:
	.word	0x6f6d654d, 0x55207972, 0x65676173, 0x0000003a, 0x # Memory Usage:...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.82:
	.word	0x6d617246, 0x66756265, 0x3a726566, 0x73657220, 0x # Framebuffer: res
	.word	0x74756c6f, 0x2d6e6f69, 0x65706564, 0x6e65646e, 0x # olution-dependen
# 80013ad4:	00000074                                t...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.83:
	.word	0x746e6f46, 0x74614420, 0x7e203a61, 0x424b3232, 0x # Font Data: ~22KB
	.word	0x6f522820, 0x6f746f62, 0x67655220, 0x72616c75, 0x # (Roboto Regular
	.word	0x70363120, 0x00002978, 0x # 16px)..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.84:
	.word	0x6d696e41, 0x64657461, 0x61724720, 0x63696870, 0x # Animated Graphic
	.word	0x68532073, 0x6163776f, 0x003a6573, 0x # s Showcase:.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.85:
	.word	0x205d205b, 0x76657250, 0x73756f69, 0x78654e2f, 0x # [ ] Previous/Nex
	.word	0x61502074, 0x20206567, 0x6576694c, 0x696e4120, 0x # t Page  Live Ani
	.word	0x6974616d, 0x44206e6f, 0x216f6d65, 0x # mation Demo!

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.86:
	.word	0x80011afc, 0x00000012, 0x00000125, 0x00000015, 0x # ........%.......

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.87:
	.word	0x80011afc, 0x00000012, 0x00000125, 0x0000001f, 0x # ........%.......

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.88:
	.word	0x80011afc, 0x00000012, 0x00000125, 0x00000014, 0x # ........%.......

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.89:
	.word	0x80011afc, 0x00000012, 0x00000126, 0x00000023, 0x # ........&...#...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.90:
	.word	0x80011afc, 0x00000012, 0x00000127, 0x00000023, 0x # ........'...#...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.91:
	.word	0x80011afc, 0x00000012, 0x00000118, 0x00000023, 0x # ............#...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.92:
	.word	0x80011afc, 0x00000012, 0x00000119, 0x00000023, 0x # ............#...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.93:
	.word	0x6f726353, 0x6e696c6c, 0x65542067, 0x44207478, 0x # Scrolling Text D
	.word	0x6e6f6d65, 0x61727473, 0x6e6f6974, 0x0000003a, 0x # emonstration:...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.94:
	.word	0x205d205b, 0x76657250, 0x73756f69, 0x78654e2f, 0x # [ ] Previous/Nex
	.word	0x61502074, 0x20206567, 0x69726f48, 0x746e6f7a, 0x # t Page  Horizont
	.word	0x53206c61, 0x6c6f7263, 0x676e696c, 0x6d654420, 0x # al Scrolling Dem
# 80013c08:	0000216f                                o!..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.95:
	.word	0x65685420, 0x69757120, 0x62206b63, 0x6e776f72, 0x # The quick brown
	.word	0x786f6620, 0x6d756a20, 0x6f207370, 0x20726576, 0x # fox jumps over
	.word	0x20656874, 0x797a616c, 0x676f6420, 0x646e6120, 0x # the lazy dog and
	.word	0x6e757220, 0x6e692073, 0x74206f74, 0x66206568, 0x # runs into the f
	.word	0x7365726f, 0x68772074, 0x20657265, 0x796e616d, 0x # orest where many
	.word	0x696e6120, 0x736c616d, 0x76696c20, 0x6e692065, 0x # animals live in
	.word	0x72616820, 0x796e6f6d, 0x0000002e, 0x # harmony....

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.96:
	.word	0x43424120, 0x47464544, 0x4b4a4948, 0x4f4e4d4c, 0x # ABCDEFGHIJKLMNO
	.word	0x53525150, 0x57565554, 0x205a5958, 0x33323130, 0x # PQRSTUVWXYZ 0123
	.word	0x37363534, 0x21203938, 0x25242340, 0x282a265e, 0x # 456789 !@#$%^&*(
	.word	0x2d2b5f29, 0x7b5d5b3d, 0x3a3b7c7d, 0x3e3c2e2c, 0x # )_+-=[]{}|;:,.<>
# 80013cb8:	0000003f                                ?...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.97:
	.word	0x726f4c20, 0x69206d65, 0x6d757370, 0x6c6f6420, 0x # Lorem ipsum dol
	.word	0x7320726f, 0x61207469, 0x2074656d, 0x736e6f63, 0x # or sit amet cons
	.word	0x65746365, 0x20727574, 0x70696461, 0x69637369, 0x # ectetur adipisci
	.word	0x6520676e, 0x2074696c, 0x20646573, 0x65206f64, 0x # ng elit sed do e
	.word	0x6d737569, 0x7420646f, 0x6f706d65, 0x6e692072, 0x # iusmod tempor in
	.word	0x69646963, 0x746e7564, 0x20747520, 0x6f62616c, 0x # cididunt ut labo
# 80013d1c:	002e6572                                re..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.98:
	.word	0x78655620, 0x63736952, 0x4d532d76, 0x72702050, 0x # VexRiscv-SMP pr
	.word	0x7365636f, 0x20726f73, 0x6e6e7572, 0x20676e69, 0x # ocessor running
	.word	0x656d6f68, 0x77657262, 0x20534f20, 0x68746977, 0x # homebrew OS with
	.word	0x73756320, 0x206d6f74, 0x70617267, 0x73636968, 0x # custom graphics
	.word	0x6e657220, 0x69726564, 0x6120676e, 0x6620646e, 0x # rendering and f
	.word	0x20746e6f, 0x74737973, 0x002e6d65, 0x # ont system..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.99:
	.word	0x72635320, 0x696c6c6f, 0x6420676e, 0x206f6d65, 0x # Scrolling demo
	.word	0x776f6873, 0x6f682073, 0x6f7a6972, 0x6c61746e, 0x # shows horizontal
	.word	0x78657420, 0x6f6d2074, 0x656d6576, 0x7720746e, 0x # text movement w
	.word	0x20687469, 0x70617277, 0x756f7261, 0x6120646e, 0x # ith wraparound a
	.word	0x6f632074, 0x6769666e, 0x62617275, 0x7320656c, 0x # t configurable s
	.word	0x64656570, 0x6f662073, 0x65742072, 0x6e697473, 0x # peeds for testin
# 80013ddc:	00002e67                                g...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.100:
	.word	0x73657420, 0x61632074, 0x6f642074, 0x75722067, 0x # test cat dog ru
	.word	0x756a206e, 0x7020706d, 0x2079616c, 0x006e7566, 0x # n jump play fun.

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.101:
	.word	0x80011afc, 0x00000012, 0x00000160, 0x0000001e, 0x # ........`.......

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.102:
	.word	0x80011afc, 0x00000012, 0x00000160, 0x0000001d, 0x # ........`.......

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.103:
	.word	0x80011afc, 0x00000012, 0x00000161, 0x00000016, 0x # ........a.......

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.104:
	.word	0x80011afc, 0x00000012, 0x00000161, 0x00000015, 0x # ........a.......

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.105:
	.word	0x74726556, 0x6c616369, 0x72635320, 0x696c6c6f, 0x # Vertical Scrolli
	.word	0x4320676e, 0x2065646f, 0x6f6d6544, 0x0000003a, 0x # ng Code Demo:...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.106:
	.word	0x205d205b, 0x76657250, 0x73756f69, 0x78654e2f, 0x # [ ] Previous/Nex
	.word	0x61502074, 0x20206567, 0x74726556, 0x6c616369, 0x # t Page  Vertical
	.word	0x646f4320, 0x63532065, 0x6c6c6f72, 0x21676e69, 0x # Code Scrolling!

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.110:
	.word	0x64696f76, 0x6d697420, 0x695f7265, 0x7265746e, 0x # void timer_inter
	.word	0x74707572, 0x6e61685f, 0x72656c64, 0x696f7628, 0x # rupt_handler(voi
	.word	0x7b202964, 0x00002020, 0x # d) {  ..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.115:
	.word	0x20202020, 0x55202f2f, 0x74616470, 0x6e612065, 0x # // Update an
	.word	0x74616d69, 0x206e6f69, 0x6e206669, 0x65646565, 0x # imation if neede
# 80013ed8:	00202064                                d  .

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.129:
	.word	0x74617473, 0x69206369, 0x6e696c6e, 0x6f762065, 0x # static inline vo
	.word	0x73206469, 0x70757465, 0x746e695f, 0x75727265, 0x # id setup_interru
	.word	0x28737470, 0x64696f76, 0x207b2029, 0x00000020, 0x # pts(void) {  ...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.131:
	.word	0x20202020, 0x43494c50, 0x4952505f, 0x5449524f, 0x # PLIC_PRIORIT
	.word	0x49545b59, 0x5f52454d, 0x5d515249, 0x31203d20, 0x # Y[TIMER_IRQ] = 1
# 80013f2c:	0020203b                                ;  .

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.132:
	.word	0x20202020, 0x43494c50, 0x414e455f, 0x5b454c42, 0x # PLIC_ENABLE[
	.word	0x3d205d30, 0x20312820, 0x54203c3c, 0x52454d49, 0x # 0] = (1 << TIMER
	.word	0x5152495f, 0x20203b29, 0x # _IRQ);

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.134:
	.word	0x20202020, 0x206d7361, 0x616c6f76, 0x656c6974, 0x # asm volatile
	.word	0x73632228, 0x6d207772, 0x63657674, 0x3025202c, 0x # ("csrw mtvec, %0
# 80013f78:	20202022                                "

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.135:
	.word	0x20202020, 0x20202020, 0x20202020, 0x # 20202020
	.word	0x3a203a20, 0x22722220, 0x61727428, 0x61685f70, 0x # : : "r"(trap_ha
	.word	0x656c646e, 0x3b292972, 0x00002020, 0x # ndler));  ..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.136:
	.word	0x20202020, 0x45202f2f, 0x6c62616e, 0x6c672065, 0x # // Enable gl
	.word	0x6c61626f, 0x746e6920, 0x75727265, 0x20737470, 0x # obal interrupts
# 80013fc8:	00000020                                 ...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.137:
	.word	0x20202020, 0x206d7361, 0x616c6f76, 0x656c6974, 0x # asm volatile
	.word	0x73632228, 0x20697372, 0x6174736d, 0x2c737574, 0x # ("csrsi mstatus,
	.word	0x38783020, 0x203b2922, 0x00000020, 0x636e6923, 0x # 0x8");  ...#inc
	.word	0x6564756c, 0x65676150, 0x382f3220, 0x65676150, 0x # ludePage 2/8Page
	.word	0x382f3720, 0x65676150, 0x382f3520, 0x65676150, 0x # 7/8Page 5/8Page
	.word	0x382f3120, 0x65676150, 0x382f3620, 0x65676150, 0x # 1/8Page 6/8Page
	.word	0x382f3820, 0x65676150, 0x382f3420, 0x65676150, 0x # 8/8Page 4/8Page
	.word	0x382f3320, 0x65676150, 0x382f3f20, 0x # 3/8Page ?/8

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.139:
	.word	0x64696f76, 0x00000020, 0x00008000, 0x00000000, 0x # void ...........
	.word	0x206d7361, 0x656d6f53, 0x65757274, 0x20746e69, 0x # asm Sometrueint
	.word	0x656e6f4e, 0x20202020, 0x # None

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.141:
	.word	0x20202020, 0x00002f2f, 0x # //..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.152:
	.word	0x80011afc, 0x00000012, 0x00000051, 0x00000014, 0x # ........Q.......

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.153:
	.word	0x80011afc, 0x00000012, 0x0000001a, 0x00000018, 0x # ................

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.155:
	.word	0x80011f08, 0x00000075, 0x00000030, 0x00000024, 0x # ....u...0...$...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.156:
	.word	0x80011f08, 0x00000075, 0x00000037, 0x00000028, 0x # ....u...7...(...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.157:
	.word	0x80011f08, 0x00000075, 0x0000003f, 0x0000002c, 0x # ....u...?...,...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.158:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747320, 0x65673a3a, 0x6e755f74, 0x63656863, 0x # str::get_unchec
	.word	0x2064656b, 0x75716572, 0x73657269, 0x61687420, 0x # ked requires tha
	.word	0x68742074, 0x61722065, 0x2065676e, 0x77207369, 0x # t the range is w
	.word	0x69687469, 0x6874206e, 0x74732065, 0x676e6972, 0x # ithin the string
	.word	0x696c7320, 0x0a0a6563, 0x73696854, 0x646e6920, 0x # slice..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.160:
	.word	0x80012354, 0x00000070, 0x00000219, 0x00000024, 0x # T#..p.......$...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.162:
	.word	0x80012038, 0x00000071, 0x000005e4, 0x00000014, 0x # 8 ..q...........

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.163:
	.word	0x80012038, 0x00000071, 0x000005e4, 0x00000021, 0x # 8 ..q.......!...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.164:
	.word	0x80012038, 0x00000071, 0x000005d8, 0x00000021, 0x # 8 ..q.......!...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.165:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x766e6920, 0x64696c61, 0x6c617620, 0x66206575, 0x # invalid value f
	.word	0x6020726f, 0x72616863, 0x540a0a60, 0x20736968, 0x # or `char`..This
	.word	0x69646e69, 0x65746163, 0x20612073, 0x20677562, 0x # indicates a bug
	.word	0x74206e69, 0x70206568, 0x72676f72, 0x202e6d61, 0x # in the program.
	.word	0x73696854, 0x646e5520, 0x6e696665, 0x42206465, 0x # This Undefined B
	.word	0x76616865, 0x20726f69, 0x63656863, 0x7369206b, 0x # ehavior check is
	.word	0x74706f20, 0x616e6f69, 0x61202c6c, 0x6320646e, 0x # optional, and c
	.word	0x6f6e6e61, 0x65622074, 0x6c657220, 0x20646569, 0x # annot be relied
	.word	0x66206e6f, 0x7320726f, 0x74656661, 0x00002e79, 0x # on for safety...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.166:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x6e696820, 0x753a3a74, 0x6165726e, 0x62616863, 0x # hint::unreachab
	.word	0x755f656c, 0x6568636e, 0x64656b63, 0x73756d20, 0x # le_unchecked mus
	.word	0x656e2074, 0x20726576, 0x72206562, 0x68636165, 0x # t never be reach
	.word	0x0a0a6465, 0x73696854, 0x646e6920, 0x74616369, 0x # ed..This indicat
	.word	0x61207365, 0x67756220, 0x206e6920, 0x20656874, 0x # es a bug in the
	.word	0x676f7270, 0x2e6d6172, 0x69685420, 0x6e552073, 0x # program. This Un
	.word	0x69666564, 0x2064656e, 0x61686542, 0x726f6976, 0x # defined Behavior
	.word	0x65686320, 0x69206b63, 0x706f2073, 0x6e6f6974, 0x # check is option
	.word	0x202c6c61, 0x20646e61, 0x6e6e6163, 0x6220746f, 0x # al, and cannot b
	.word	0x65722065, 0x6465696c, 0x206e6f20, 0x20726f66, 0x # e relied on for
	.word	0x65666173, 0x002e7974, 0x # safety..

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.167:
	.word	0x80012038, 0x00000071, 0x00000468, 0x00000024, 0x # 8 ..q...h...$...

.Lanon.a70e075621bacc9d6bb03bbc0d72baf8.169:
	.word	0x80011f80, 0x00000072, 0x000000ef, 0x00000012, 0x # ....r...........

.Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.6:
	.word	0x80013620, 0x80013624, 0x80013628, 0x8001362c, 0x # 6..$6..(6..,6..
	.word	0x80013630, 0x80013634, 0x80013638, 0x8001363c, 0x # 06..46..86..<6..
	.word	0x80013640, 0x80013640, 0x80013608, 0x8001360c, 0x # @6..@6...6...6..
	.word	0x80013610, 0x80013614, 0x80013618, 0x8001361c, 0x # .6...6...6...6..

.Lswitch.table._ZN11homebrew_os11demos_basic14draw_demo_page17hb327ed1c4e9d7ce3E.9:
	.word	0x80014018, 0x80014000, 0x80014038, 0x80014030, 0x # .@...@..8@..0@..
	.word	0x80014010, 0x80014020, 0x80014008, 0x80014028, 0x # .@.. @...@..(@..

.Lanon.94876b220182c162a7a9ea2366510c9c.0:
	.word	0x6f626f72, 0x722d6f74, 0x6c756765, 0x312d7261, 0x # roboto-regular-1
# 800143ec:	00000036                                6...

.Lanon.94876b220182c162a7a9ea2366510c9c.3:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x72773a3a, 0x5f657469, 0x616c6f76, 0x # ptr::write_vola
	.word	0x656c6974, 0x71657220, 0x65726975, 0x68742073, 0x # tile requires th
	.word	0x74207461, 0x70206568, 0x746e696f, 0x61207265, 0x # at the pointer a
	.word	0x6d756772, 0x20746e65, 0x61207369, 0x6e67696c, 0x # rgument is align
	.word	0x0a0a6465, 0x73696854, 0x646e6920, 0x74616369, 0x # ed..This indicat
	.word	0x61207365, 0x67756220, 0x206e6920, 0x20656874, 0x # es a bug in the
	.word	0x676f7270, 0x2e6d6172, 0x69685420, 0x6e552073, 0x # program. This Un
	.word	0x69666564, 0x2064656e, 0x61686542, 0x726f6976, 0x # defined Behavior
	.word	0x65686320, 0x69206b63, 0x706f2073, 0x6e6f6974, 0x # check is option
	.word	0x202c6c61, 0x20646e61, 0x6e6e6163, 0x6220746f, 0x # al, and cannot b
	.word	0x65722065, 0x6465696c, 0x206e6f20, 0x20726f66, 0x # e relied on for
	.word	0x65666173, 0x002e7974, 0x # safety..

.Lanon.94876b220182c162a7a9ea2366510c9c.14:
	.word	0x800126e8, 0x0000000f, 0x000000ad, 0x0000001e, 0x # .&..............

.Lanon.94876b220182c162a7a9ea2366510c9c.15:
	.word	0x800126e8, 0x0000000f, 0x000000ae, 0x00000027, 0x # .&..........'...

.Lanon.94876b220182c162a7a9ea2366510c9c.16:
	.word	0x800126e8, 0x0000000f, 0x000000d9, 0x00000023, 0x # .&..........#...

.Lanon.94876b220182c162a7a9ea2366510c9c.17:
	.word	0x800126e8, 0x0000000f, 0x000000e0, 0x00000020, 0x # .&.......... ...

.Lanon.94876b220182c162a7a9ea2366510c9c.18:
	.word	0x800126e8, 0x0000000f, 0x000000e4, 0x0000002a, 0x # .&..........*...

.Lanon.94876b220182c162a7a9ea2366510c9c.19:
	.word	0x800126e8, 0x0000000f, 0x000000e6, 0x0000002b, 0x # .&..........+...

.Lanon.94876b220182c162a7a9ea2366510c9c.20:
	.word	0x800126e8, 0x0000000f, 0x000000e6, 0x0000003d, 0x # .&..........=...

.Lanon.94876b220182c162a7a9ea2366510c9c.21:
	.word	0x800126e8, 0x0000000f, 0x00000102, 0x0000001c, 0x # .&..............

.Lanon.94876b220182c162a7a9ea2366510c9c.22:
	.word	0x800126e8, 0x0000000f, 0x0000011a, 0x00000016, 0x # .&..............

.Lanon.94876b220182c162a7a9ea2366510c9c.23:
	.word	0x800126e8, 0x0000000f, 0x0000011a, 0x00000015, 0x # .&..............

.Lanon.94876b220182c162a7a9ea2366510c9c.24:
	.word	0x800126e8, 0x0000000f, 0x00000118, 0x00000015, 0x # .&..............

.Lanon.94876b220182c162a7a9ea2366510c9c.25:
	.word	0x800126e8, 0x0000000f, 0x0000011f, 0x00000024, 0x # .&..........$...

.Lanon.94876b220182c162a7a9ea2366510c9c.26:
	.word	0x800126e8, 0x0000000f, 0x00000128, 0x00000011, 0x # .&......(.......

.Lanon.94876b220182c162a7a9ea2366510c9c.27:
	.word	0x800126e8, 0x0000000f, 0x00000106, 0x00000023, 0x # .&..........#...

.Lanon.94876b220182c162a7a9ea2366510c9c.28:
	.word	0x800126e8, 0x0000000f, 0x00000108, 0x00000027, 0x # .&..........'...

.Lanon.94876b220182c162a7a9ea2366510c9c.29:
	.word	0x800126e8, 0x0000000f, 0x00000108, 0x00000036, 0x # .&..........6...

.Lanon.94876b220182c162a7a9ea2366510c9c.30:
	.word	0x800126e8, 0x0000000f, 0x000000b6, 0x0000001a, 0x # .&..............

.Lanon.94876b220182c162a7a9ea2366510c9c.31:
	.word	0x800126e8, 0x0000000f, 0x000000b8, 0x00000022, 0x # .&.........."...

.Lanon.94876b220182c162a7a9ea2366510c9c.32:
	.word	0x800126e8, 0x0000000f, 0x000000bf, 0x00000018, 0x # .&..............

.Lanon.94876b220182c162a7a9ea2366510c9c.33:
	.word	0x800126e8, 0x0000000f, 0x000000c0, 0x00000018, 0x # .&..............

.Lanon.94876b220182c162a7a9ea2366510c9c.34:
	.word	0x800126e8, 0x0000000f, 0x000000c3, 0x00000022, 0x # .&.........."...

.Lanon.94876b220182c162a7a9ea2366510c9c.35:
	.word	0x800126e8, 0x0000000f, 0x000000c5, 0x00000023, 0x # .&..........#...

.Lanon.94876b220182c162a7a9ea2366510c9c.36:
	.word	0x800126e8, 0x0000000f, 0x000000c5, 0x00000035, 0x # .&..........5...

	.globl anon.f35598fd8d4aa665f0d160006d04b7cb.0.llvm.5536013400419366916
anon.f35598fd8d4aa665f0d160006d04b7cb.0.llvm.5536013400419366916:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x69737520, 0x3a3a657a, 0x68636e75, 0x656b6365, 0x # usize::unchecke
	.word	0x756d5f64, 0x6163206c, 0x746f6e6e, 0x65766f20, 0x # d_mul cannot ove
	.word	0x6f6c6672, 0x540a0a77, 0x20736968, 0x69646e69, 0x # rflow..This indi
	.word	0x65746163, 0x20612073, 0x20677562, 0x74206e69, 0x # cates a bug in t
	.word	0x70206568, 0x72676f72, 0x202e6d61, 0x73696854, 0x # he program. This
	.word	0x646e5520, 0x6e696665, 0x42206465, 0x76616865, 0x # Undefined Behav
	.word	0x20726f69, 0x63656863, 0x7369206b, 0x74706f20, 0x # ior check is opt
	.word	0x616e6f69, 0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x # ional, and canno
	.word	0x65622074, 0x6c657220, 0x20646569, 0x66206e6f, 0x # t be relied on f
	.word	0x7320726f, 0x74656661, 0x00002e79, 0x # or safety...

.Lanon.f35598fd8d4aa665f0d160006d04b7cb.1:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x6e696820, 0x613a3a74, 0x72657373, 0x6e755f74, 0x # hint::assert_un
	.word	0x63656863, 0x2064656b, 0x7473756d, 0x76656e20, 0x # checked must nev
	.word	0x62207265, 0x61632065, 0x64656c6c, 0x65687720, 0x # er be called whe
	.word	0x6874206e, 0x6f632065, 0x7469646e, 0x206e6f69, 0x # n the condition
	.word	0x66207369, 0x65736c61, 0x68540a0a, 0x69207369, 0x # is false..This i
	.word	0x6369646e, 0x73657461, 0x62206120, 0x69206775, 0x # ndicates a bug i
	.word	0x6874206e, 0x72702065, 0x6172676f, 0x54202e6d, 0x # n the program. T
	.word	0x20736968, 0x65646e55, 0x656e6966, 0x65422064, 0x # his Undefined Be
	.word	0x69766168, 0x6320726f, 0x6b636568, 0x20736920, 0x # havior check is
	.word	0x6974706f, 0x6c616e6f, 0x6e61202c, 0x61632064, 0x # optional, and ca
	.word	0x746f6e6e, 0x20656220, 0x696c6572, 0x6f206465, 0x # nnot be relied o
	.word	0x6f66206e, 0x61732072, 0x79746566, 0x0000002e, 0x # n for safety....

	.globl anon.f35598fd8d4aa665f0d160006d04b7cb.2.llvm.5536013400419366916
anon.f35598fd8d4aa665f0d160006d04b7cb.2.llvm.5536013400419366916:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x79614c20, 0x3a74756f, 0x6f72663a, 0x69735f6d, 0x # Layout::from_si
	.word	0x615f657a, 0x6e67696c, 0x636e755f, 0x6b636568, 0x # ze_align_uncheck
	.word	0x72206465, 0x69757165, 0x20736572, 0x74616874, 0x # ed requires that
	.word	0x696c6120, 0x69206e67, 0x20612073, 0x65776f70, 0x # align is a powe
	.word	0x666f2072, 0x61203220, 0x7420646e, 0x72206568, 0x # r of 2 and the r
	.word	0x646e756f, 0x752d6465, 0x6c612070, 0x61636f6c, 0x # ounded-up alloca
	.word	0x6e6f6974, 0x7a697320, 0x6f642065, 0x6e207365, 0x # tion size does n
	.word	0x6520746f, 0x65656378, 0x73692064, 0x3a657a69, 0x # ot exceed isize:
	.word	0x58414d3a, 0x68540a0a, 0x69207369, 0x6369646e, 0x # :MAX..This indic
	.word	0x73657461, 0x62206120, 0x69206775, 0x6874206e, 0x # ates a bug in th
	.word	0x72702065, 0x6172676f, 0x54202e6d, 0x20736968, 0x # e program. This
	.word	0x65646e55, 0x656e6966, 0x65422064, 0x69766168, 0x # Undefined Behavi
	.word	0x6320726f, 0x6b636568, 0x20736920, 0x6974706f, 0x # or check is opti
	.word	0x6c616e6f, 0x6e61202c, 0x61632064, 0x746f6e6e, 0x # onal, and cannot
	.word	0x20656220, 0x696c6572, 0x6f206465, 0x6f66206e, 0x # be relied on fo
	.word	0x61732072, 0x79746566, 0x0000002e, 0x # r safety....

	.globl anon.f35598fd8d4aa665f0d160006d04b7cb.4.llvm.5536013400419366916
anon.f35598fd8d4aa665f0d160006d04b7cb.4.llvm.5536013400419366916:
	.word	0x8001273c, 0x00000072, 0x00000148, 0x00000012, 0x # <'..r...H.......

.Lanon.f35598fd8d4aa665f0d160006d04b7cb.6:
	.word	0x800120f8, 0x0000006c, 0x000000ed, 0x00000011, 0x # . ..l...........

.Lanon.f35598fd8d4aa665f0d160006d04b7cb.8:
	.word	0x800125b4, 0x00000072, 0x0000021b, 0x00000011, 0x # .%..r...........

	.globl anon.f35598fd8d4aa665f0d160006d04b7cb.9.llvm.5536013400419366916
anon.f35598fd8d4aa665f0d160006d04b7cb.9.llvm.5536013400419366916:
	.word	0x800125b4, 0x00000072, 0x00000271, 0x00000035, 0x # .%..r...q...5...

	.globl anon.f35598fd8d4aa665f0d160006d04b7cb.10.llvm.5536013400419366916
anon.f35598fd8d4aa665f0d160006d04b7cb.10.llvm.5536013400419366916:
	.word	0x800125b4, 0x00000072, 0x00000272, 0x0000001e, 0x # .%..r...r.......

	.globl anon.17904dba1e92d1cee57ddc06e0f4a7fd.0.llvm.2171931009800262987
anon.17904dba1e92d1cee57ddc06e0f4a7fd.0.llvm.2171931009800262987:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x6f633a3a, 0x6e5f7970, 0x766f6e6f, 0x # ptr::copy_nonov
	.word	0x616c7265, 0x6e697070, 0x65722067, 0x72697571, 0x # erlapping requir
	.word	0x74207365, 0x20746168, 0x68746f62, 0x696f7020, 0x # es that both poi
	.word	0x7265746e, 0x67726120, 0x6e656d75, 0x61207374, 0x # nter arguments a
	.word	0x61206572, 0x6e67696c, 0x61206465, 0x6e20646e, 0x # re aligned and n
	.word	0x6e2d6e6f, 0x206c6c75, 0x20646e61, 0x20656874, 0x # on-null and the
	.word	0x63657073, 0x65696669, 0x656d2064, 0x79726f6d, 0x # specified memory
	.word	0x6e617220, 0x20736567, 0x6e206f64, 0x6f20746f, 0x # ranges do not o
	.word	0x6c726576, 0x0a0a7061, 0x73696854, 0x646e6920, 0x # verlap..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

	.globl anon.17904dba1e92d1cee57ddc06e0f4a7fd.3.llvm.2171931009800262987
anon.17904dba1e92d1cee57ddc06e0f4a7fd.3.llvm.2171931009800262987:
	.word	0x80011e34, 0x00000072, 0x00000121, 0x00000023, 0x # 4...r...!...#...

	.globl anon.17904dba1e92d1cee57ddc06e0f4a7fd.4.llvm.2171931009800262987
anon.17904dba1e92d1cee57ddc06e0f4a7fd.4.llvm.2171931009800262987:
	.word	0x800127b0, 0x0000006d, 0x0000020f, 0x00000005, 0x # .'..m...........

	.globl anon.17904dba1e92d1cee57ddc06e0f4a7fd.5.llvm.2171931009800262987
anon.17904dba1e92d1cee57ddc06e0f4a7fd.5.llvm.2171931009800262987:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x79614c20, 0x3a74756f, 0x6f72663a, 0x69735f6d, 0x # Layout::from_si
	.word	0x615f657a, 0x6e67696c, 0x636e755f, 0x6b636568, 0x # ze_align_uncheck
	.word	0x72206465, 0x69757165, 0x20736572, 0x74616874, 0x # ed requires that
	.word	0x696c6120, 0x69206e67, 0x20612073, 0x65776f70, 0x # align is a powe
	.word	0x666f2072, 0x61203220, 0x7420646e, 0x72206568, 0x # r of 2 and the r
	.word	0x646e756f, 0x752d6465, 0x6c612070, 0x61636f6c, 0x # ounded-up alloca
	.word	0x6e6f6974, 0x7a697320, 0x6f642065, 0x6e207365, 0x # tion size does n
	.word	0x6520746f, 0x65656378, 0x73692064, 0x3a657a69, 0x # ot exceed isize:
	.word	0x58414d3a, 0x68540a0a, 0x69207369, 0x6369646e, 0x # :MAX..This indic
	.word	0x73657461, 0x62206120, 0x69206775, 0x6874206e, 0x # ates a bug in th
	.word	0x72702065, 0x6172676f, 0x54202e6d, 0x20736968, 0x # e program. This
	.word	0x65646e55, 0x656e6966, 0x65422064, 0x69766168, 0x # Undefined Behavi
	.word	0x6320726f, 0x6b636568, 0x20736920, 0x6974706f, 0x # or check is opti
	.word	0x6c616e6f, 0x6e61202c, 0x61632064, 0x746f6e6e, 0x # onal, and cannot
	.word	0x20656220, 0x696c6572, 0x6f206465, 0x6f66206e, 0x # be relied on fo
	.word	0x61732072, 0x79746566, 0x0000002e, 0x # r safety....

	.globl anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147
anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147:
	.word	0x80011ff4, 0x0000000b, 0x00000079, 0x00000001, 0x # ........y.......

.Lanon.98d8f5b3645f1dd0bd97de9ecfa06603.8:
	.word	0x80011ff4, 0x0000000b, 0x00000087, 0x0000001a, 0x # ................

	.globl anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147
anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x79614c20, 0x3a74756f, 0x6f72663a, 0x69735f6d, 0x # Layout::from_si
	.word	0x615f657a, 0x6e67696c, 0x636e755f, 0x6b636568, 0x # ze_align_uncheck
	.word	0x72206465, 0x69757165, 0x20736572, 0x74616874, 0x # ed requires that
	.word	0x696c6120, 0x69206e67, 0x20612073, 0x65776f70, 0x # align is a powe
	.word	0x666f2072, 0x61203220, 0x7420646e, 0x72206568, 0x # r of 2 and the r
	.word	0x646e756f, 0x752d6465, 0x6c612070, 0x61636f6c, 0x # ounded-up alloca
	.word	0x6e6f6974, 0x7a697320, 0x6f642065, 0x6e207365, 0x # tion size does n
	.word	0x6520746f, 0x65656378, 0x73692064, 0x3a657a69, 0x # ot exceed isize:
	.word	0x58414d3a, 0x68540a0a, 0x69207369, 0x6369646e, 0x # :MAX..This indic
	.word	0x73657461, 0x62206120, 0x69206775, 0x6874206e, 0x # ates a bug in th
	.word	0x72702065, 0x6172676f, 0x54202e6d, 0x20736968, 0x # e program. This
	.word	0x65646e55, 0x656e6966, 0x65422064, 0x69766168, 0x # Undefined Behavi
	.word	0x6320726f, 0x6b636568, 0x20736920, 0x6974706f, 0x # or check is opti
	.word	0x6c616e6f, 0x6e61202c, 0x61632064, 0x746f6e6e, 0x # onal, and cannot
	.word	0x20656220, 0x696c6572, 0x6f206465, 0x6f66206e, 0x # be relied on fo
	.word	0x61732072, 0x79746566, 0x0000002e, 0x # r safety....

	.globl anon.98d8f5b3645f1dd0bd97de9ecfa06603.10.llvm.3372952439789298147
anon.98d8f5b3645f1dd0bd97de9ecfa06603.10.llvm.3372952439789298147:
	.word	0x80011ff4, 0x0000000b, 0x0000003b, 0x0000001d, 0x # ........;.......

	.globl anon.98d8f5b3645f1dd0bd97de9ecfa06603.11.llvm.3372952439789298147
anon.98d8f5b3645f1dd0bd97de9ecfa06603.11.llvm.3372952439789298147:
	.word	0x80011ff4, 0x0000000b, 0x0000003b, 0x0000001c, 0x # ........;.......

	.globl anon.98d8f5b3645f1dd0bd97de9ecfa06603.12.llvm.3372952439789298147
anon.98d8f5b3645f1dd0bd97de9ecfa06603.12.llvm.3372952439789298147:
	.word	0x80011ff4, 0x0000000b, 0x0000004d, 0x00000026, 0x # ........M...&...

	.globl anon.98d8f5b3645f1dd0bd97de9ecfa06603.13.llvm.3372952439789298147
anon.98d8f5b3645f1dd0bd97de9ecfa06603.13.llvm.3372952439789298147:
	.word	0x80011ff4, 0x0000000b, 0x00000050, 0x00000025, 0x # ........P...%...

	.globl anon.98d8f5b3645f1dd0bd97de9ecfa06603.14.llvm.3372952439789298147
anon.98d8f5b3645f1dd0bd97de9ecfa06603.14.llvm.3372952439789298147:
	.word	0x80011ff4, 0x0000000b, 0x0000005a, 0x00000020, 0x # ........Z... ...

	.globl anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147
anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147:
	.word	0x80011ff4, 0x0000000b, 0x0000006b, 0x0000001a, 0x # ........k.......

.LJTI0_0:
	.word	0x80006332
	.word	0x80006308
	.word	0x800063ca
	.word	0x800063c4
	.word	0x800063ee
	.word	0x80006406
	.word	0x8000642e
	.word	0x80006434
	.word	0x800063a6
	.word	0x8000643a
	.word	0x800063b8
	.word	0x800063f4
	.word	0x8000632e
	.word	0x8000632e
	.word	0x800063e2
	.word	0x8000639a
	.word	0x80006422
	.word	0x80006428
	.word	0x8000644c
	.word	0x80006446
	.word	0x80006388
	.word	0x800063e8
	.word	0x80006458
	.word	0x80006394
	.word	0x800063dc
	.word	0x800063ac
	.word	0x8000640c
	.word	0x8000632e
	.word	0x800063a0
	.word	0x8000637c
	.word	0x8000645e
	.word	0x800063be
	.word	0x800063d0
	.word	0x8000641c
	.word	0x800063d6
	.word	0x80006364
	.word	0x8000638e
	.word	0x80006440
	.word	0x80006464
	.word	0x8000632e
	.word	0x8000632e
	.word	0x80006376
	.word	0x80006416
	.word	0x80006370
	.word	0x8000636a
	.word	0x800063b2
	.word	0x800063fa
	.word	0x80006452
	.word	0x8000635e
	.word	0x80006382
	.word	0x80006400
	.word	0x80006410
	.word	0x8000632e
	.word	0x8000632e
	.word	0x8000632e
	.word	0x8000646a

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.1:
	.word	0x80011a08, 0x00000013, 0x00000119, 0x00000011, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.2:
	.word	0x80011a08, 0x00000013, 0x00000122, 0x0000001f, 0x # ........".......

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.3:
	.word	0x80011a08, 0x00000013, 0x00000122, 0x0000005d, 0x # ........"...]...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.4:
	.word	0x80011a08, 0x00000013, 0x00000124, 0x00000012, 0x # ........$.......

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.5:
	.word	0x80011a08, 0x00000013, 0x00000128, 0x00000025, 0x # ........(...%...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.6:
	.word	0x80011a08, 0x00000013, 0x00000128, 0x00000044, 0x # ........(...D...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.7:
	.word	0x80011a08, 0x00000013, 0x0000012f, 0x00000023, 0x # ......../...#...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.8:
	.word	0x80011a08, 0x00000013, 0x00000130, 0x0000003b, 0x # ........0...;...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.9:
	.word	0x80011a08, 0x00000013, 0x0000014d, 0x00000029, 0x # ........M...)...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.10:
	.word	0x80011a08, 0x00000013, 0x0000014e, 0x00000033, 0x # ........N...3...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.11:
	.word	0x80011a08, 0x00000013, 0x00000150, 0x00000017, 0x # ........P.......

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.12:
	.word	0x80011a08, 0x00000013, 0x00000150, 0x00000016, 0x # ........P.......

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.13:
	.word	0x80011a08, 0x00000013, 0x0000006f, 0x0000002e, 0x # ........o.......

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.14:
	.word	0x80011a08, 0x00000013, 0x00000074, 0x0000001e, 0x # ........t.......

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.15:
	.word	0x80011a08, 0x00000013, 0x0000007a, 0x0000001e, 0x # ........z.......

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.16:
	.word	0x80011a08, 0x00000013, 0x000000ad, 0x00000011, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.17:
	.word	0x80011a08, 0x00000013, 0x000000af, 0x00000011, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.19:
	.word	0x80011a08, 0x00000013, 0x000000bc, 0x00000049, 0x # ............I...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.21:
	.word	0x80011a08, 0x00000013, 0x000000c0, 0x00000017, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.24:
	.word	0x80011a08, 0x00000013, 0x000000cb, 0x00000023, 0x # ............#...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.25:
	.word	0x80011a08, 0x00000013, 0x000000cf, 0x00000019, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.26:
	.word	0x80011a08, 0x00000013, 0x000000ed, 0x0000000e, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.27:
	.word	0x80011a08, 0x00000013, 0x000000ee, 0x0000000e, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.28:
	.word	0x80011a08, 0x00000013, 0x000000ef, 0x0000000e, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.29:
	.word	0x80011a08, 0x00000013, 0x000000f0, 0x0000000e, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.30:
	.word	0x80011a08, 0x00000013, 0x000000f1, 0x0000000e, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.31:
	.word	0x80011a08, 0x00000013, 0x000000f2, 0x0000000e, 0x # ................

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.35:
	.word	0x80011a08, 0x00000013, 0x00000194, 0x00000028, 0x # ............(...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.36:
	.word	0x80011a08, 0x00000013, 0x00000198, 0x00000021, 0x # ............!...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.37:
	.word	0x80011a08, 0x00000013, 0x00000198, 0x00000040, 0x # ............@...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.38:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x65723a3a, 0x765f6461, 0x74616c6f, 0x # ptr::read_volat
	.word	0x20656c69, 0x75716572, 0x73657269, 0x61687420, 0x # ile requires tha
	.word	0x68742074, 0x6f702065, 0x65746e69, 0x72612072, 0x # t the pointer ar
	.word	0x656d7567, 0x6920746e, 0x6c612073, 0x656e6769, 0x # gument is aligne
	.word	0x540a0a64, 0x20736968, 0x69646e69, 0x65746163, 0x # d..This indicate
	.word	0x20612073, 0x20677562, 0x74206e69, 0x70206568, 0x # s a bug in the p
	.word	0x72676f72, 0x202e6d61, 0x73696854, 0x646e5520, 0x # rogram. This Und
	.word	0x6e696665, 0x42206465, 0x76616865, 0x20726f69, 0x # efined Behavior
	.word	0x63656863, 0x7369206b, 0x74706f20, 0x616e6f69, 0x # check is optiona
	.word	0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x65622074, 0x # l, and cannot be
	.word	0x6c657220, 0x20646569, 0x66206e6f, 0x7320726f, 0x # relied on for s
	.word	0x74656661, 0x00002e79, 0x # afety...

.Lanon.a4265bc29c3d41f886fb6e82697ae70e.39:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x72773a3a, 0x5f657469, 0x616c6f76, 0x # ptr::write_vola
	.word	0x656c6974, 0x71657220, 0x65726975, 0x68742073, 0x # tile requires th
	.word	0x74207461, 0x70206568, 0x746e696f, 0x61207265, 0x # at the pointer a
	.word	0x6d756772, 0x20746e65, 0x61207369, 0x6e67696c, 0x # rgument is align
	.word	0x0a0a6465, 0x73696854, 0x646e6920, 0x74616369, 0x # ed..This indicat
	.word	0x61207365, 0x67756220, 0x206e6920, 0x20656874, 0x # es a bug in the
	.word	0x676f7270, 0x2e6d6172, 0x69685420, 0x6e552073, 0x # program. This Un
	.word	0x69666564, 0x2064656e, 0x61686542, 0x726f6976, 0x # defined Behavior
	.word	0x65686320, 0x69206b63, 0x706f2073, 0x6e6f6974, 0x # check is option
	.word	0x202c6c61, 0x20646e61, 0x6e6e6163, 0x6220746f, 0x # al, and cannot b
	.word	0x65722065, 0x6465696c, 0x206e6f20, 0x20726f66, 0x # e relied on for
	.word	0x65666173, 0x002e7974, 0x # safety..

	.globl _ZN11homebrew_os8hardware17riscv_clint_timer17RISCV_CLINT_TIMER17h1d86eac2e9802949E
_ZN11homebrew_os8hardware17riscv_clint_timer17RISCV_CLINT_TIMER17h1d86eac2e9802949E:
	.word	0x80011ea8, 0x0000000a, 0x000000d4, 0x00000012, 0x # ................

.Lanon.7a8bf03ce3225e035043929a408f9c7c.44:
	.word	0x80011ea8, 0x0000000a, 0x000003d2, 0x0000001b, 0x # ................

.Lanon.7a8bf03ce3225e035043929a408f9c7c.45:
	.word	0x80011ea8, 0x0000000a, 0x000003d3, 0x0000001b, 0x # ................

.Lanon.7a8bf03ce3225e035043929a408f9c7c.46:
	.word	0x80011ea8, 0x0000000a, 0x000003d6, 0x0000001c, 0x # ................

.Lanon.7a8bf03ce3225e035043929a408f9c7c.47:
	.word	0x80011ea8, 0x0000000a, 0x000003dc, 0x00000020, 0x # ............ ...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.48:
	.word	0x80011ea8, 0x0000000a, 0x000003e1, 0x00000027, 0x # ............'...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.49:
	.word	0x80011ea8, 0x0000000a, 0x000003e1, 0x00000026, 0x # ............&...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.50:
	.word	0x80011ea8, 0x0000000a, 0x000003e5, 0x0000002a, 0x # ............*...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.51:
	.word	0x6f626f72, 0x722d6f74, 0x6c756765, 0x312d7261, 0x # roboto-regular-1
# 80015234:	00000036                                6...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.52:
	.word	0x2d6d6269, 0x2d616776, 0x00003631, 0x # ibm-vga-16..

.Lanon.7a8bf03ce3225e035043929a408f9c7c.53:
	.word	0x6f626173, 0x656e2d6e, 0x312d7478, 0x00000036, 0x # sabon-next-16...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.54:
	.word	0x6f626173, 0x656e2d6e, 0x312d7478, 0x00000035, 0x # sabon-next-15...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.55:
	.word	0x6f626173, 0x656e2d6e, 0x312d7478, 0x00000038, 0x # sabon-next-18...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.56:
	.word	0x6f626173, 0x656e2d6e, 0x322d7478, 0x00000030, 0x # sabon-next-20...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.62:
	.word	0x2d6d6269, 0x31616776, 0x72672e36, 0x00000066, 0x # ibm-vga16.grf...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.63:
	.word	0x6f626f72, 0x722d6f74, 0x6c756765, 0x36317261, 0x # roboto-regular16
# 800152a4:	6672672e                                .grf

	.globl anon.7a8bf03ce3225e035043929a408f9c7c.65.llvm.764523667040833331
anon.7a8bf03ce3225e035043929a408f9c7c.65.llvm.764523667040833331:
	.word	0x80011ea8, 0x0000000a, 0x000003f9, 0x00000011, 0x # ................

	.globl anon.7a8bf03ce3225e035043929a408f9c7c.90.llvm.764523667040833331
anon.7a8bf03ce3225e035043929a408f9c7c.90.llvm.764523667040833331:
	.word	0x80011ea8, 0x0000000a, 0x000000c7, 0x00000024, 0x # ............$...

.Lanon.7a8bf03ce3225e035043929a408f9c7c.91:
	.word	0x47524630, 0xfffc000f, 0x00000013, 0xffff0000, 0x # 0FRG............
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0x000cffff, 0x # ................
	.word	0xffff0000, 0xffffffff, 0xffffffff, 0x0018ffff, 0x # ................
	.word	0xffff0000, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0x0024ffff, 0x00300000, 0x # ..........$...0.
	.word	0x00540000, 0x00740000, 0x00f80000, 0x017c0000, 0x # ..T...t.......|.
	.word	0x02180000, 0x029c0000, 0x02b40000, 0x031a0000, 0x # ................
	.word	0x037b0000, 0x03b10000, 0x040e0000, 0x04260000, 0x # ..{...........&.
	.word	0x04410000, 0x04510000, 0x04b80000, 0x05300000, 0x # ..A...Q.......0.
	.word	0x057d0000, 0x05e90000, 0x06610000, 0x06d90000, 0x # ..}.......a.....
	.word	0x07450000, 0x07b10000, 0x08290000, 0x08a10000, 0x # ..E.......).....
	.word	0x090d0000, 0x092b0000, 0x09580000, 0x099c0000, 0x # ......+...X.....
	.word	0x09cb0000, 0x0a0f0000, 0x0a6f0000, 0x0b4d0000, 0x # ..........o...M.
	.word	0x0bd10000, 0x0c490000, 0x0ccd0000, 0x0d450000, 0x # ......I.......E.
	.word	0x0db10000, 0x0e1d0000, 0x0ea10000, 0x0f190000, 0x # ................
	.word	0x0f490000, 0x0fb50000, 0x10390000, 0x10a50000, 0x # ..I.......9.....
	.word	0x11410000, 0x11b90000, 0x12490000, 0x12c10000, 0x # ..A.......I.....
	.word	0x135c0000, 0x13d40000, 0x144c0000, 0x14d00000, 0x # ..\.......L.....
	.word	0x15480000, 0x15cc0000, 0x16800000, 0x17040000, 0x # ..H.............
	.word	0x17880000, 0x18000000, 0x18500000, 0x18b70000, 0x # ..........P.....
	.word	0x19070000, 0x193d0000, 0x19610000, 0x19750000, 0x # ......=...a...u.
	.word	0x19c90000, 0x1a3d0000, 0x1a910000, 0x1b050000, 0x # ......=.........
	.word	0x1b590000, 0x1bb30000, 0x1c1f0000, 0x1c860000, 0x # ..Y.............
	.word	0x1cac0000, 0x1cf80000, 0x1d6c0000, 0x1d920000, 0x # ..........l.....
	.word	0x1e0a0000, 0x1e550000, 0x1eb20000, 0x1f1e0000, 0x # ......U.........
	.word	0x1f8a0000, 0x1fc80000, 0x201c0000, 0x205f0000, 0x # ........... .._
	.word	0x20aa0000, 0x20fe0000, 0x21760000, 0x21ca0000, 0x # ... ... ..v!...!
	.word	0x22360000, 0x228a0000, 0x22fc0000, 0x23240000, 0x # ..6"..."..."..$#
	.word	0x23850000, 0xffff0000, 0xffffffff, 0xffffffff, 0x # ...#............
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0x23b5ffff, 0x23c10000, 0x # ...........#...#
	.word	0x23e50000, 0x24590000, 0x24d10000, 0x25610000, 0x # ...#..Y$...$..a%
	.word	0x25e50000, 0x260d0000, 0x26b20000, 0x26ca0000, 0x # ...%...&...&...&
	.word	0x27660000, 0x27aa0000, 0x27e70000, 0x28160000, 0x # ..f'...'...'...(
	.word	0x28310000, 0x28cd0000, 0x28e70000, 0x29070000, 0x # ..1(...(...(...)
	.word	0x29630000, 0x299f0000, 0x29db0000, 0x29ef0000, 0x # ..c)...)...)...)
	.word	0x2a4f0000, 0x2aaf0000, 0x2ac10000, 0x2add0000, 0x # ..O*...*...*...*
	.word	0x2b050000, 0x2b420000, 0x2b7e0000, 0x2c0e0000, 0x # ...+..B+..~+...,
	.word	0x2c9e0000, 0x2d520000, 0x2dbe0000, 0x2e6a0000, 0x # ...,..R-...-..j.
	.word	0x2f160000, 0x2fc20000, 0x306e0000, 0x31100000, 0x # .../.../..n0...1
	.word	0x31b20000, 0x327e0000, 0x33200000, 0x33ac0000, 0x # ...1..~2.. 3...3
	.word	0x34380000, 0x34c40000, 0x35480000, 0x35a40000, 0x # ..84...4..H5...5
	.word	0x35f00000, 0x365c0000, 0x36c20000, 0x37460000, 0x # ...5..\6...6..F7
	.word	0x37e20000, 0x389e0000, 0x395a0000, 0x3a160000, 0x # ...7...8..Z9...:
	.word	0x3ad20000, 0x3b830000, 0x3bcf0000, 0x3c750000, 0x # ...:...;...;..u<
	.word	0x3d110000, 0x3dad0000, 0x3e490000, 0x3edc0000, 0x # ...=...=..I>...>
	.word	0x3f880000, 0x3ff40000, 0x40680000, 0x40dc0000, 0x # ...?...?..h@...@
	.word	0x41500000, 0x41c40000, 0x42380000, 0x42a40000, 0x # ..PA...A..8B...B
	.word	0x43180000, 0x43a20000, 0x440e0000, 0x44820000, 0x # ...C...C...D...D
	.word	0x44f60000, 0x456a0000, 0x45d60000, 0x46160000, 0x # ...D..jE...E...F
	.word	0x46560000, 0x46b00000, 0x47040000, 0x47850000, 0x # ..VF...F...G...G
	.word	0x47ec0000, 0x486d0000, 0x48ee0000, 0x496f0000, 0x # ...G..mH...H..oI
	.word	0x49f00000, 0x4a680000, 0x4ac50000, 0x4b340000, 0x # ...I..hJ...J..4K
	.word	0x4b9b0000, 0x4c020000, 0x4c690000, 0x4cc90000, 0x # ...K...L..iL...L
	.word	0x4d550000, 0x4de10000, 0xffff0000, 0xffffffff, 0x # ..UM...M........
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff, 0x # ................
	.word	0xffffffff, 0xffffffff, 0x0000ffff, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0x00040000, 0x00000000, 0x00000000, 0x00040000, 0x # ................
	.word	0x00000000, 0x00010000, 0x0004000c, 0x00020000, 0x # ................
	.word	0xe0a8000c, 0xe0a8e0a8, 0xe0a8e0a8, 0xe0a8e0a8, 0x # ................
	.word	0x0000e0a8, 0x392a0000, 0x0000e4a8, 0x0006000c, 0x # ......*9........
	.word	0x00050000, 0xff000004, 0x00f49888, 0xf49888ff, 0x # ................
	.word	0x985cff00, 0x07ec03c8, 0x00005d98, 0x000a000c, 0x # ..\......]......
	.word	0x000a0000, 0x0000000c, 0x14ff1b00, 0x0040ee01, 0x # ..............@.
	.word	0x52000000, 0xfd2600dd, 0x0000000c, 0x00a78900, 0x # ...R..&.........
	.word	0x0000d35d, 0xffffdc00, 0xffffffff, 0x370044ff, 0x # ]............D.7
	.word	0x4070f240, 0x114092d2, 0xff140000, 0x46ee0015, 0x # @.p@..@........F
	.word	0x00000000, 0x2708e442, 0x000019ff, 0xffd7c057, 0x # ....B..'....W...
	.word	0xc0ffffff, 0x78360084, 0xe3cce8d1, 0x005278d7, 0x # ......6x.....xR.
	.word	0x70cb0000, 0x00909400, 0x02000000, 0xc6003ef5, 0x # ...p.........>..
	.word	0x00000063, 0x0efe2500, 0x0036f402, 0x00010000, 0x # c....%....6.....
	.word	0x0009000d, 0x00080000, 0x0000000f, 0x0070c100, 0x # ..............p.
	.word	0x00000000, 0x0188d30d, 0x7d000000, 0xdcfffffa, 0x # ...........}....
	.word	0xff41002b, 0xe4341188, 0xfe8100ce, 0x74000007, 0x # +.A...4........t
	.word	0xff7419ff, 0x16000024, 0xf31e0b40, 0x000455dd, 0x # ..t.$...@....U..
	.word	0x2f000000, 0x78e5ffc7, 0x00000004, 0xffa13000, 0x # .../...x.....0..
	.word	0x0c1700ad, 0x82000000, 0x9ee628ff, 0x49000000, 0x # .........(.....I
	.word	0xf1ac3fff, 0xb40d0030, 0xd82014f6, 0xf8f8e6fe, 0x # .?..0..... .....
	.word	0x08000060, 0x1b87f74d, 0x00000000, 0x0048f000, 0x # `...M.........H.
	.word	0x00000000, 0x000c000c, 0x000c0000, 0x4d00000c, 0x # ...............M
	.word	0x018fefde, 0x00000000, 0xf20b0000, 0x51f35a8b, 0x # .............Z.Q
	.word	0x00160000, 0xf92d0000, 0x80a80002, 0x05e13700, 0x # ......-......7..
	.word	0xfa170000, 0x6aac0005, 0x005bd004, 0x90000000, 0x # .......j..[.....
	.word	0x0ece74a3, 0x0000bb75, 0x00000000, 0x1f083c2a, 0x # .t..u.......*<..
	.word	0x000023ec, 0x00000000, 0xb3000000, 0x23420f7b, 0x # .#..........{.B#
	.word	0x00000000, 0xd5540000, 0xba6cd32b, 0x00000068, 0x # ......T.+.l.h...
	.word	0x3ce30e00, 0x29008493, 0x000000ed, 0x009a9300, 0x # ...<...)........
	.word	0x23007fa9, 0x000005ff, 0x0011dc14, 0xa44fde7b, 0x # ...#........{.O.
	.word	0x000000d6, 0x00000500, 0xd3f3aa0b, 0x00000036, 0x # ............6...
	.word	0x000a000c, 0x000a0000, 0x0000000c, 0xc3f5de6d, 0x # ............m...
	.word	0x0000002f, 0xa0ff3d00, 0x02e5c34b, 0x75000000, 0x # /....=..K......u
	.word	0x560015ff, 0x000017ff, 0x4bff5200, 0x00bec115, 0x # ...V.....R.K....
	.word	0x02000000, 0xb2ebe5c6, 0x0000000f, 0xffb00a00, 0x # ................
	.word	0x000006e1, 0xbb020000, 0x92fb6bed, 0x56ff1000, 0x # .........k.....V
	.word	0x0056ff4d, 0x3855ff78, 0xff7635ff, 0xb8010018, 0x # M.V.x.U8.5v.....
	.word	0x04e9b3f2, 0x0045ff52, 0xffe71500, 0xd4070074, 0x # ....R.E.....t...
	.word	0x954f63e3, 0x0096fffb, 0xe39f1700, 0x8b65cbf3, 0x # .cO...........e.
	.word	0x00004dff, 0x0003000c, 0x00030000, 0xff000004, 0x # .M..............
	.word	0x85ff0088, 0x0347ff02, 0x000103e9, 0x0005000f, 0x # ......G.........
	.word	0x00050000, 0x00000012, 0x00000300, 0x1ccd1700, 0x # ................
	.word	0x95cb0600, 0xe07d0000, 0xf10f0008, 0x6400006d, 0x # ......}.....m..d
	.word	0x00001eff, 0x0000d9aa, 0x00b7d600, 0xa4ed0000, 0x # ................
	.word	0xf5000000, 0x00000097, 0x0000a6ec, 0x00bad000, 0x # ................
	.word	0xe1a20000, 0x5a000000, 0x000027ff, 0x007ee908, 0x # .......Z.'....~.
	.word	0xf06a0000, 0x01000011, 0x0002b2b7, 0x1ab50c00, 0x # ..j.............
	.word	0x000e0000, 0x00000005, 0x00110005, 0x00002cac, 0x # .............,..
	.word	0x18e78000, 0xc9010000, 0x000000af, 0x0039ff48, 0x # ............H.9.
	.word	0xa1eb0200, 0xa3000000, 0x000000eb, 0x0019ff76, 0x # ............v...
	.word	0x32ff6100, 0xff500000, 0x5e00003c, 0x000032ff, 0x # .a.2..P.<..^.2..
	.word	0x0019ff71, 0x00eb9500, 0xa2db0000, 0xff2b0000, 0x # q.............+.
	.word	0xa700003a, 0x570000b0, 0x000019e7, 0x00002daf, 0x # :......W.....-..
	.word	0x09000000, 0x00000700, 0x06000700, 0x24000000, 0x # ...............$
	.word	0x000012ff, 0xff347906, 0x2500691f, 0xfbfffed8, 0x # .....y4..i.%....
	.word	0x010016e2, 0x00a1fdc3, 0xec6e0000, 0x003dfc50, 0x # ..........n.P.=.
	.word	0x00421300, 0x00000b5e, 0x09000a00, 0x09000000, 0x # ..B.^...........
	.word	0x00000900, 0xff400000, 0x0000004c, 0x40000000, 0x # ......@.L......@
	.word	0x00004cff, 0x00000000, 0x004cff40, 0x68280000, 0x # .L......@.L...(h
	.word	0x95ff8e68, 0x642a6868, 0xffffffff, 0x68ffffff, 0x # h...hh*d.......h
	.word	0x551c1c0a, 0x1c1c5fff, 0x0000000b, 0x004cff40, 0x # ...U._......@.L.
	.word	0x00000000, 0x4cff4000, 0x00000000, 0xff400000, 0x # .....@.L......@.
	.word	0x0000004c, 0x00020000, 0x00000003, 0x00040003, 0x # L...............
	.word	0x1e78ff14, 0xef5065ff, 0x0086850c, 0x00070001, 0x # ..x..eP.........
	.word	0x00000007, 0x00030005, 0x08080805, 0xffffb007, 0x # ................
	.word	0x3826ecff, 0x01333838, 0x04000200, 0x02000000, 0x # ..&8883.........
	.word	0x2f000200, 0x00ccbc33, 0x07000c00, 0x07000000, 0x # .../3...........
	.word	0x00000d00, 0x4f000000, 0x00000cf4, 0xa3ad0000, 0x # .......O........
	.word	0x00000000, 0x0045f811, 0x68000000, 0x000002e5, 0x # ......E....h....
	.word	0x8ac50000, 0x00000000, 0x002dff23, 0x80000000, 0x # ........#.-.....
	.word	0x000000cf, 0x72dc0000, 0x00000000, 0x0018fc3b, 0x # .......r....;...
	.word	0x99000000, 0x000000b7, 0x59ef0700, 0x00000000, 0x # ...........Y....
	.word	0x0009f254, 0xb1000000, 0x0000009e, 0x00000000, 0x # T...............
	.word	0x0009000c, 0x00090000, 0x0000000c, 0xd9f9d960, 0x # ............`...
	.word	0x0000005f, 0x4d93ff4f, 0x004fff93, 0x00b7cf00, 0x # _...O..M..O.....
	.word	0xd1b60000, 0x79fb0400, 0x76000000, 0xff1a06fd, 0x # .......y...v....
	.word	0x0000006c, 0x1c1eff68, 0x00006cff, 0x20ff6800, 0x # l...h....l...h.
	.word	0x006cff1c, 0xff680000, 0x6cff1a20, 0x68000000, 0x # ..l...h. ..l...h
	.word	0xfb041eff, 0x0000007a, 0x0006fd77, 0x0000bacf, 0x # ....z...w.......
	.word	0x00d2b600, 0x96ff4e00, 0x52ff914d, 0x60000000, 0x # .....N..M..R...`
	.word	0x63dbfad9, 0x00010000, 0x0009000d, 0x00050000, 0x # ...c............
	.word	0x0000000d, 0x5d151200, 0x8cfff6da, 0xff80803c, 0x # .......]....<...
	.word	0x0000008c, 0x00008cff, 0x008cff00, 0x8cff0000, 0x # ................
	.word	0xff000000, 0x0000008c, 0x00008cff, 0x008cff00, 0x # ................
	.word	0x8cff0000, 0xff000000, 0x0000008c, 0x00008cff, 0x # ................
	.word	0x018cff00, 0x09000c00, 0x08000000, 0x00000c00, 0x # ................
	.word	0xdcf4cd51, 0x4e000278, 0x864c9fff, 0xc30073ff, 0x # Q...x..N..L..s..
	.word	0x000000cd, 0x7100cfc1, 0x0000004e, 0x0000deac, 0x # .......qN.......
	.word	0x0b000000, 0x00009dec, 0x8c000000, 0x000021f6, 0x # .............!..
	.word	0xfe4a0000, 0x0000006a, 0xabef2500, 0x00000000, 0x # ..J.j....%......
	.word	0x0acfd60e, 0x01000000, 0x001ee9b2, 0x82000000, 0x # ................
	.word	0x40407cff, 0xd40f4040, 0xffffffff, 0x003cffff, 0x # .|@@@@........<.
	.word	0x09000c00, 0x09000000, 0x00000c00, 0xf5d26201, 0x # .............b..
	.word	0x00047ddc, 0x8fff7b00, 0x7dff854b, 0xafe80000, 0x # .}...{..K..}....
	.word	0xbc000000, 0x2b0000d5, 0x00000017, 0x0000e8a3, 0x # .......+........
	.word	0x00000000, 0x009ee413, 0x95000000, 0x0ec3f3cf, 0x # ................
	.word	0x00000000, 0xf9a4704f, 0x0000005c, 0x00000000, 0x # ....Op..\.......
	.word	0x0203eba7, 0x00001634, 0x16ff7500, 0x009bf703, 0x # ....4....u......
	.word	0xf4a00000, 0xfd8c0001, 0xfc824a89, 0x02000089, 0x # .........J......
	.word	0xdaf5d266, 0x00000578, 0x09000c00, 0x09000000, 0x # f...x...........
	.word	0x00000c00, 0x0a000000, 0x0000fce3, 0x00000000, 0x # ................
	.word	0x00fcff82, 0x00000000, 0xfcfcf61e, 0x00000000, 0x # ................
	.word	0xa9f5a900, 0x000000fc, 0x76ff3d00, 0x0000fc8c, 0x # .........=.v....
	.word	0xd5ce0200, 0x00fc8c05, 0xff650000, 0xfc8c003e, 0x # ..........e.>...
	.word	0xe90e0000, 0x8c0000a0, 0x680408fc, 0xd4d4dfff, 0x # ...........h....
	.word	0x8cffffec, 0x3c3c3c1a, 0x3cfca73c, 0x00000020, 0x # .....<<<<..< ...
	.word	0xfc8c0000, 0x00000000, 0x8c000000, 0x010000fc, 0x # ................
	.word	0x09000c00, 0x08000000, 0x06000c00, 0xfffffffe, 0x # ................
	.word	0x1f00b8ff, 0x404077ff, 0x38002e40, 0x000031ff, 0x # .....w@@@..8.1..
	.word	0x52000000, 0x000015ff, 0x6b000000, 0xdee59afd, 0x # ...R.......k....
	.word	0x85000280, 0xd194c2ff, 0x5e0077ff, 0x06000192, 0x # .........w.^....
	.word	0x0000eccf, 0x00000000, 0x2716ff78, 0x00000022, 0x # ........x..'"...
	.word	0xab15ff71, 0x000000c9, 0x5600eab0, 0x8c4b92ff, 0x # q..........V..K.
	.word	0x000073ff, 0xe2f8d461, 0x0100027d, 0x09000c00, 0x # .s..a...}.......
	.word	0x08000000, 0x00000c00, 0xf2f0a316, 0x0b0035cb, 0x # .............5..
	.word	0x4d5fdfd6, 0x7b00207e, 0x000025fc, 0xca000000, 0x # .._M~ .{.%......
	.word	0x000000c0, 0xe7000000, 0x8d832aa0, 0xec000048, 0x # .........*..H...
	.word	0xe3bde8df, 0xec0073ff, 0x070016db, 0xe90ff4bb, 0x # .....s..........
	.word	0x0000009e, 0xd33aff4f, 0x000000b6, 0x923fff45, 0x # ....O.:.....E.?.
	.word	0x000014f4, 0x1d16fd81, 0x7253cbee, 0x00009bf6, 0x # ..........Sr....
	.word	0xebf7bc2c, 0x00000994, 0x09000c00, 0x09000000, 0x # ,...............
	.word	0x3c000c00, 0xffffffff, 0x50ffffff, 0x4040400f, 0x # ...<.......P.@@@
	.word	0xf4984040, 0x00000024, 0xf11e0000, 0x0000005f, 0x # @@..$......._...
	.word	0xbc000000, 0x000000b3, 0x49000000, 0x000023f9, 0x # ...........I.#..
	.word	0x00000000, 0x00009ecd, 0x00000000, 0x0045ff2d, 0x # ............-.E.
	.word	0x00000000, 0x0af97c00, 0x00000000, 0xd0b40000, 0x # .....|..........
	.word	0x00000000, 0xcc000000, 0x000000bb, 0x00000000, 0x # ................
	.word	0x0000a8e2, 0x00000000, 0x00a4e800, 0x00000000, 0x # ................
	.word	0x09000c00, 0x09000000, 0x00000c00, 0xf6d56a00, 0x # .............j..
	.word	0x000172da, 0x97ff6800, 0x6eff924b, 0xcbc30000, 0x # .r...h..K..n....
	.word	0xc8000000, 0xd20000c6, 0x000000b9, 0x0000d5b4, 0x # ................
	.word	0x0049fb7e, 0x0082f93d, 0xff8a0200, 0x0396fff7, 0x # ~.I.=...........
	.word	0xea3d0000, 0xecc28bca, 0xe606003f, 0x000001b5, 0x # ..=.....?.......
	.word	0x2a06e6b0, 0x000064ff, 0x2aff6000, 0x0090ff17, 0x # ...*.d...`.*....
	.word	0xff890000, 0xfba80017, 0xf97e4a87, 0x070000ad, 0x # .........J~.....
	.word	0xddf6d779, 0x00000a84, 0x09000c00, 0x08000000, 0x # y...............
	.word	0x00000c00, 0xf7e78102, 0x000040c5, 0x507efc7f, 0x # .........@....~P
	.word	0x0a36fab3, 0x000095f6, 0x30ade206, 0x000052ff, 0x # ..6........0.R..
	.word	0x32e1a900, 0x000055ff, 0x0def9c00, 0x0000a3f9, 0x # ...2.U..........
	.word	0x00f0c804, 0x7ea9ff8c, 0x00f0f9ca, 0xded37e04, 0x # .......~.....~..
	.word	0x00efa18b, 0x00000000, 0x00deb600, 0x00000000, 0x # ................
	.word	0x00a2f317, 0x5c487036, 0x0027f1d5, 0xf2f5cd40, 0x # ....6pH\..'.@...
	.word	0x01002bb3, 0x04000900, 0x02000000, 0x2f000900, 0x # .+............./
	.word	0x00ccbc33, 0x00000000, 0x00000000, 0xbc332f00, 0x # 3............/3.
	.word	0x090000cc, 0x00000400, 0x0b000300, 0x342e0000, 0x # ...............4
	.word	0x00d0b800, 0x00000000, 0x00000000, 0x00000000, 0x # ................
	.word	0xac000000, 0xcdb600e0, 0x1d63e800, 0x000007e7, 0x # ..........c.....
	.word	0x00080008, 0x00070000, 0x00000008, 0x41000000, 0x # ...............A
	.word	0x020000a8, 0xcbffca54, 0xfbdb6607, 0x6f0041ab, 0x # ....T....f...A.o
	.word	0x0019a6fe, 0xa3220000, 0x0b65cdfb, 0x1e000000, 0x # ......"...e.....
	.word	0x8ef1f491, 0x00000000, 0x00da7e12, 0x00000000, 0x # .........~......
	.word	0x00010600, 0x00090008, 0x00070000, 0xb8950005, 0x # ................
	.word	0xb8b8b8b8, 0x90907581, 0x65909090, 0x08080806, 0x # .....u.....e....
	.word	0xd0050808, 0xffffffff, 0x382db4ff, 0x38383838, 0x # ..........-88888
	.word	0x08000127, 0x00000800, 0x08000700, 0x00238600, 0x # '.............#.
	.word	0x00000000, 0x3eaffdde, 0x05000000, 0xcdfdb954, 0x # .......>....T...
	.word	0x0000055c, 0xf2881f00, 0x300000b5, 0x64e4f196, 0x # \..........0...d
	.word	0xcbffca61, 0xed00055a, 0x00003cae, 0x001c0000, 0x # a...Z....<......
	.word	0x00000000, 0x0c000000, 0x00000800, 0x0c000700, 0x # ................
	.word	0xc7430000, 0x047fdef4, 0x4cb7f829, 0x6a77fe7c, 0x # ..C.....)..L|.wj
	.word	0x00000fef, 0x0000ceba, 0xa8000000, 0x000000e0, 0x # ................
	.word	0xaced1100, 0x00000000, 0x0031faab, 0xff7c0000, 0x # ..........1...|.
	.word	0x0000006a, 0x009ffb13, 0x32000000, 0x000056ff, 0x # j..........2.V..
	.word	0x04000000, 0x00000001, 0x18400f00, 0x00000000, 0x # ..........@.....
	.word	0x0060ff3c, 0x0c000000, 0x00000e00, 0x0f000e00, 0x # <.`.............
	.word	0x00000000, 0xe5a73a00, 0x44b0e9f9, 0x00000000, 0x # .....:.....D....
	.word	0xfc820000, 0x57465ea8, 0x0086f696, 0x6d000000, 0x # .....^FW.......m
	.word	0x00003ff1, 0x25000000, 0x000057e3, 0x004ef618, 0x # .?.....%.W....N.
	.word	0x12290700, 0xde460000, 0xbf810001, 0xe93b0000, 0x # ..)...F.......;.
	.word	0x008ffcff, 0x0036d900, 0x070063cc, 0x6e1dabe4, 0x # ......6..c.....n
	.word	0x9e0000d9, 0x2dfa0268, 0x14f96000, 0x00c36d00, 0x # ....h..-.`...m..
	.word	0x16808100, 0x9a0014ff, 0x840000c8, 0x800000ad, 0x # ................
	.word	0x13ff1784, 0x00a4bd00, 0x00989b00, 0x0765a000, 0x # ..............e.
	.word	0xb7002dfc, 0xb10000a9, 0xec0b0088, 0x6bd4002b, 0x # .-..........+..k
	.word	0x54ef7b00, 0x51cbf07b, 0x0000b0bf, 0x1206d77e, 0x # .{.T{..Q....~...
	.word	0x349ff4cc, 0x12a6f2e1, 0xe6100000, 0x000005a1, 0x # ...4............
	# ... (zero-filled gap)
	.word	0xd7ec3300, 0x7a4f4a75, 0x0000008d, 0x00000000, 0x # .3..uJOz........
	.word	0xf5d68a15, 0x004cbbeb, 0x00000000, 0x0a000c00, 0x # ......L.........
	.word	0x0a000000, 0x00000c00, 0xbc000000, 0x000003ea, 0x # ................
	.word	0x00000000, 0x44fffc16, 0x00000000, 0xff6b0000, 0x # .......D......k.
	.word	0x000099fd, 0x00000000, 0xebafdac2, 0x00000004, 0x # ................
	.word	0x81fe1b00, 0x0045ff59, 0x71000000, 0xf60c29ff, 0x # ....Y.E....q.)..
	.word	0x0000009a, 0x00d1c800, 0x04ebab00, 0xff1f0000, 0x # ................
	.word	0x8138389d, 0x000046ff, 0xffffff77, 0x9bffffff, 0x # .88..F..w.......
	.word	0xc6ce0000, 0x10101010, 0x2504eca9, 0x00006cff, 0x # ...........%.l..
	.word	0xff4f0000, 0x17fc7c47, 0x00000000, 0x019df007, 0x # ..O.G|..........
	.word	0x0a000c00, 0x09000000, 0xac000c00, 0xf0ffffff, 0x # ................
	.word	0x000058c9, 0x4040e8ac, 0x61ffa34e, 0x00e0ac00, 0x # .X....@@N..a....
	.word	0xd5000000, 0xe0ac00c1, 0x00000000, 0xac00ccc9, 0x # ................
	.word	0x272020e4, 0x006eff7a, 0xffffffac, 0x06b0ffff, 0x # .  'z.n.........
	.word	0x9cf3ac00, 0xffbf9c9c, 0xe0ac06c5, 0x00000000, 0x # ................
	.word	0xac63ff61, 0x000000e0, 0x92fa0300, 0x0000e0ac, 0x # a.c.............
	.word	0xff1c0000, 0x40e8ac7f, 0xcf594040, 0xffac24f5, 0x # .......@@@Y..$..
	.word	0xe9ffffff, 0x00002fb3, 0x0a000c00, 0x0a000000, 0x # ...../..........
	.word	0x00000c00, 0xe8981400, 0x0780dbf9, 0xd70e0000, 0x # ................
	.word	0x864b65e4, 0x0000b7f8, 0x002cfd8b, 0xff680000, 0x # .eK.......,...h.
	.word	0xb4e50041, 0x00000000, 0x0b64e417, 0x000087ff, 0x # A.........d.....
	.word	0x00000000, 0x78ff1400, 0x00000000, 0x14000000, 0x # .......x........
	.word	0x000078ff, 0x00000000, 0x87ff0b00, 0x00000000, 0x # .x..............
	.word	0x00000000, 0x0000b4e6, 0xe4170000, 0xfd8d0064, 0x # ............d...
	.word	0x0000002c, 0x003cff66, 0x65e4d90f, 0xacf6844b, 0x # ,...f.<....eK...
	.word	0x15000000, 0xdafae99a, 0x0100047a, 0x0b000c00, 0x # ........z.......
	.word	0x09000000, 0xac000c00, 0xf2ffffff, 0x00004fc0, 0x # .............O..
	.word	0x4040e8ac, 0x7affa751, 0x00e0ac00, 0x90000000, 0x # ..@@Q..z........
	.word	0xe0ac35fe, 0x00000000, 0xac9af30f, 0x000000e0, 0x # .5..............
	.word	0xc9c90000, 0x0000e0ac, 0xb0000000, 0x00e0acd7, 0x # ................
	.word	0x00000000, 0xe0acd7b0, 0x00000000, 0xaccaca00, 0x # ................
	.word	0x000000e0, 0x9bf30e00, 0x0000e0ac, 0xfe8d0000, 0x # ................
	.word	0x40e8ac37, 0xffa55040, 0xffac007e, 0xc2f3ffff, 0x # 7..@@P..~.......
	.word	0x01000051, 0x09000c00, 0x08000000, 0xac000c00, 0x # Q...............
	.word	0xffffffff, 0xac40ffff, 0x404040e8, 0xac104040, 0x # ......@..@@@@@..
	.word	0x000000e0, 0xac000000, 0x000000e0, 0xac000000, 0x # ................
	.word	0x000000e0, 0xac000000, 0xd8d8d8fb, 0xac0076d8, 0x # .............v..
	.word	0x707070ee, 0xac003d70, 0x000000e0, 0xac000000, 0x # .pppp=..........
	.word	0x000000e0, 0xac000000, 0x000000e0, 0xac000000, 0x # ................
	.word	0x404040e8, 0xac164040, 0xffffffff, 0x0158ffff, 0x # .@@@@@........X.
	.word	0x09000c00, 0x08000000, 0xac000c00, 0xffffffff, 0x # ................
	.word	0xac78ffff, 0x404040e8, 0xac1e4040, 0x000000e0, 0x # ..x..@@@@@......
	.word	0xac000000, 0x000000e0, 0xac000000, 0x000000e0, 0x # ................
	.word	0xac000000, 0x9c9c9cf3, 0xac00689c, 0xacacacf5, 0x # .........h......
	.word	0xac0073ac, 0x000000e0, 0xac000000, 0x000000e0, 0x # .s..............
	.word	0xac000000, 0x000000e0, 0xac000000, 0x000000e0, 0x # ................
	.word	0xac000000, 0x000000e0, 0x00000000, 0x0b000c00, 0x # ................
	.word	0x0a000000, 0x00000c00, 0xe5941300, 0x0b8be0fa, 0x # ................
	.word	0xd8100000, 0x7d4b74ef, 0x0002c3f3, 0x0032fd8f, 0x # .....tK}......2.
	.word	0xff5b0000, 0xb5e5004b, 0x00000000, 0x064cac0f, 0x # ..[.K.........L.
	.word	0x00008aff, 0x00000000, 0x80ff0c00, 0x00000000, 0x # ................
	.word	0x0c000000, 0x000080ff, 0xe4e4e48a, 0x8cff0675, 0x # ............u...
	.word	0x50300000, 0x0084ff55, 0x0000b9e4, 0xff080000, 0x # ..0PU...........
	.word	0xfe8b0084, 0x0000003b, 0x0084ff0a, 0x7bf4d30e, 0x # ....;..........{
	.word	0xfbbe5a48, 0x0f000048, 0xe7fae18d, 0x010032ab, 0x # HZ..H........2..
	.word	0x0b000c00, 0x09000000, 0xac000c00, 0x000000e0, 0x # ................
	.word	0xf09c0000, 0x0000e0ac, 0x9c000000, 0x00e0acf0, 0x # ................
	.word	0x00000000, 0xe0acf09c, 0x00000000, 0xacf09c00, 0x # ................
	.word	0x000000e0, 0xf09c0000, 0xdcdcfbac, 0xf1dcdcdc, 0x # ................
	.word	0xf8ffacf0, 0xf8f8f8f8, 0xe0acf0fc, 0x00000000, 0x # ................
	.word	0xacf09c00, 0x000000e0, 0xf09c0000, 0x0000e0ac, 0x # ................
	.word	0x9c000000, 0x00e0acf0, 0x00000000, 0xe0acf09c, 0x # ................
	.word	0x00000000, 0x01f09c00, 0x05000c00, 0x03000000, 0x # ................
	.word	0x84000c00, 0xff8408ff, 0x08ff8408, 0x8408ff84, 0x # ................
	.word	0xff8408ff, 0x08ff8408, 0x8408ff84, 0xff8408ff, 0x # ................
	.word	0x08ff8408, 0x0008ff84, 0x09000c00, 0x08000000, 0x # ................
	.word	0x00000c00, 0x00000000, 0x0078ff10, 0x00000000, 0x # ..........x.....
	.word	0x0078ff10, 0x00000000, 0x0078ff10, 0x00000000, 0x # ..x.......x.....
	.word	0x0078ff10, 0x00000000, 0x0078ff10, 0x00000000, 0x # ..x.......x.....
	.word	0x0078ff10, 0x00000000, 0x0078ff10, 0x00000000, 0x # ..x.......x.....
	.word	0x2678ff10, 0x00000e6c, 0x4370ff16, 0x000044ff, 0x # ..x&l.....pC.D..
	.word	0x0a49ff4d, 0x5d57d7df, 0x0004d1e4, 0xeaecb126, 0x # M.I...W]....&...
	.word	0x010019a7, 0x0a000c00, 0x0a000000, 0xac000c00, 0x # ................
	.word	0x000000e0, 0x52fe7c00, 0x00e0ac00, 0xfe530000, 0x # .....|.R......S.
	.word	0xac000081, 0x320000e0, 0x0001aff5, 0x00e0ac00, 0x # .......2........
	.word	0x0cd4e41a, 0xac000000, 0xedcb09e0, 0x00000023, 0x # ............#...
	.word	0xfaffac00, 0x000051ff, 0xac000000, 0xb0ffdefb, 0x # .....Q..........
	.word	0x00000001, 0x00e0ac00, 0x007cff98, 0xac000000, 0x # ..........|.....
	.word	0xbf0500e0, 0x000049fd, 0x00e0ac00, 0xeede1300, 0x # .....I..........
	.word	0xac000023, 0x000000e0, 0x0ad2f22b, 0x00e0ac00, 0x # #.......+.......
	.word	0x4c000000, 0x0100a7fd, 0x09000c00, 0x08000000, 0x # ...L............
	.word	0xac000c00, 0x000000e0, 0xac000000, 0x000000e0, 0x # ................
	.word	0xac000000, 0x000000e0, 0xac000000, 0x000000e0, 0x # ................
	.word	0xac000000, 0x000000e0, 0xac000000, 0x000000e0, 0x # ................
	.word	0xac000000, 0x000000e0, 0xac000000, 0x000000e0, 0x # ................
	.word	0xac000000, 0x000000e0, 0xac000000, 0x000000e0, 0x # ................
	.word	0xac000000, 0x404040e8, 0xac1b4040, 0xffffffff, 0x # .....@@@@@......
	.word	0x016cffff, 0x0e000c00, 0x0c000000, 0xac000c00, 0x # ..l.............
	.word	0x00008aff, 0x00000000, 0xac90ff88, 0x0003e6ff, 0x # ................
	.word	0x02000000, 0xac90ffe4, 0x0048fffb, 0x47000000, 0x # ..........H....G
	.word	0xac90ffff, 0x00a7cde0, 0xa7000000, 0xac90f8d1, 0x # ................
	.word	0x0ff76be0, 0xf70f0000, 0xac90f86e, 0x64f710e0, 0x # .k......n......d
	.word	0xf8660000, 0xac90f813, 0xc3a600e0, 0xa8c60000, 0x # ..f.............
	.word	0xac90f800, 0xff4300e0, 0x45ff2523, 0xac90f800, 0x # ......C.#%.E....
	.word	0xdf0100e0, 0x02e08581, 0xac90f800, 0x7e0000e0, 0x # ...............~
	.word	0x007fe2df, 0xac90f800, 0x1e0000e0, 0x001efdfd, 0x # ................
	.word	0xac90f800, 0x000000e0, 0x0000b9b9, 0x0190f800, 0x # ................
	.word	0x0b000c00, 0x09000000, 0xac000c00, 0x00002ffc, 0x # ............./..
	.word	0xf09c0000, 0x00c3ffac, 0x9c000000, 0xfffeacf0, 0x # ................
	.word	0x0000005c, 0xe0acf09c, 0x000de7ba, 0xacf09c00, 0x # \...............
	.word	0x8df927e0, 0xf09c0000, 0x8700e0ac, 0x9c002afb, 0x # .'...........*..
	.word	0x00e0acf0, 0x00bde20a, 0xe0acf09c, 0xff520000, 0x # ..............R.
	.word	0xacf09c56, 0x000000e0, 0xf0a7e3b8, 0x0000e0ac, 0x # V...............
	.word	0xfbf82500, 0x00e0acf0, 0x84000000, 0xe0acf0ff, 0x # .%..............
	.word	0x00000000, 0x00f0df09, 0x0b000c00, 0x0b000000, 0x # ................
	.word	0x00000c00, 0xe5941200, 0x077ddaf9, 0x0f000000, 0x # ..........}.....
	.word	0x4668e4d7, 0x03baf27a, 0xfa900000, 0x00000025, 0x # ..hFz.......%...
	.word	0x0070ff43, 0x00a7eb01, 0x00000000, 0x1300d1c3, 0x # C.p.............
	.word	0x00007bff, 0x94000000, 0xff1c00f9, 0x0000006c, 0x # .{..........l...
	.word	0xff840000, 0x6cff1c04, 0x00000000, 0x04ff8400, 0x # .......l........
	.word	0x007bff13, 0x00000000, 0x0100f994, 0x0000a7ec, 0x # ..{.............
	.word	0xc3000000, 0x920000d2, 0x000025fa, 0x72ff4300, 0x # .........%...C.r
	.word	0xd9100000, 0x794667e3, 0x0004bdf1, 0x96140000, 0x # .....gFy........
	.word	0x7fdbfae7, 0x01000007, 0x0a000c00, 0x09000000, 0x # ................
	.word	0xac000c00, 0xfdffffff, 0x00149adf, 0x4040e8ac, 0x # ..............@@
	.word	0xdbe56742, 0x00e0ac0a, 0x41000000, 0xe0ac5eff, 0x # Bg.........A.^..
	.word	0x00000000, 0xac82ff0e, 0x000000e0, 0x6aff4a00, 0x # .............J.j
	.word	0x5858ebac, 0xf0ee7e59, 0xffffac17, 0xcdffffff, 0x # ..XXY~..........
	.word	0xe6ac0034, 0x102e3030, 0xac000000, 0x000000e0, 0x # 4...00..........
	.word	0x00000000, 0x0000e0ac, 0x00000000, 0x00e0ac00, 0x # ................
	.word	0x00000000, 0xe0ac0000, 0x00000000, 0x00000000, 0x # ................
	.word	0x0b000c00, 0x0b000000, 0x00000d00, 0xe5941200, 0x # ................
	.word	0x077ddaf9, 0x0f000000, 0x4668e4d7, 0x03baf27a, 0x # ..}.......hFz...
	.word	0xfa900000, 0x00000025, 0x0070ff43, 0x00a7eb01, 0x # ....%...C.p.....
	.word	0x00000000, 0x1300d0c3, 0x00007bff, 0x94000000, 0x # .........{......
	.word	0xff1c00f9, 0x0000006c, 0xff840000, 0x6cff1c04, 0x # ....l..........l
	.word	0x00000000, 0x04ff8400, 0x007bff13, 0x00000000, 0x # ..........{.....
	.word	0x0100fa94, 0x0000a7ec, 0xc3000000, 0x920000d1, 0x # ................
	.word	0x000025fa, 0x67ff4300, 0xd9100000, 0x794667e3, 0x # .%...C.g.....gFy
	.word	0x004cfff1, 0x96140000, 0x80d8f8e7, 0x0048f7cf, 0x # ..L...........H.
	.word	0x00000000, 0x11000000, 0x000135bb, 0x000a000c, 0x # .........5......
	.word	0x00090000, 0xffac000c, 0xd3f5ffff, 0xac000470, 0x # ............p...
	.word	0x4a4040e8, 0x0081fe8a, 0x0000e0ac, 0xe8a70000, 0x # .@@J............
	.word	0x00e0ac00, 0x88000000, 0xe0ac06ff, 0x10000000, 0x # ................
	.word	0xac00d4d7, 0xc4b8b8f7, 0x0035e7f1, 0xffffffac, 0x # ..........5.....
	.word	0x20c9ffff, 0x10e2ac00, 0xf95b1510, 0xe0ac00bd, 0x # ... ......[.....
	.word	0x00000000, 0xac01faa2, 0x000000e0, 0x08ff8400, 0x # ................
	.word	0x0000e0ac, 0xff7d0000, 0x00e0ac13, 0x47000000, 0x # ......}........G
	.word	0x00005eff, 0x000a000c, 0x00090000, 0x0000000c, 0x # .^..............
	.word	0xf4edbb39, 0x000039bc, 0x51b5fb41, 0x37f9c557, 0x # 9....9..A..QW..7
	.word	0x05e4b200, 0xe10a0000, 0xd5ba00b7, 0x00000000, 0x # ................
	.word	0x6c00775e, 0x000885ff, 0x00000000, 0xf0fd8b01, 0x # ^w.l............
	.word	0x0000409f, 0x25000000, 0xafffdb80, 0x0000000b, 0x # .@.....%........
	.word	0x5b000000, 0x880c8ffc, 0x0000003a, 0x05dcb100, 0x # ...[....:.......
	.word	0x0000b0f2, 0xd8c50000, 0xb1ff6e00, 0xffa54f54, 0x # .........n..TO..
	.word	0x43000069, 0xc5f0ecba, 0x00000050, 0x000a000c, 0x # i..C....P.......
	.word	0x000a0000, 0xffb4000c, 0xffffffff, 0x48ffffff, 0x # ...............H
	.word	0x4040402d, 0x4040a6ff, 0x00001240, 0x88ff0000, 0x # -@@@..@@@.......
	# ... (zero-filled gap)
	.word	0x000088ff, 0x00000000, 0x88ff0000, 0x00000000, 0x # ................
	.word	0x00000000, 0x000088ff, 0x00000000, 0x88ff0000, 0x # ................
	# ... (zero-filled gap)
	.word	0x000088ff, 0x00000000, 0x88ff0000, 0x00000000, 0x # ................
	.word	0x00000000, 0x000088ff, 0x00000000, 0x88ff0000, 0x # ................
	# ... (zero-filled gap)
	.word	0x000088ff, 0x00010000, 0x000b000c, 0x00090000, 0x # ................
	.word	0xb0d8000c, 0x00000000, 0xd8b8d000, 0x000000b0, 0x # ................
	.word	0xb8d00000, 0x0000b0d8, 0xd0000000, 0x00b0d8b8, 0x # ................
	.word	0x00000000, 0xb0d8b8d0, 0x00000000, 0xd8b8d000, 0x # ................
	.word	0x000000b0, 0xb8d00000, 0x0000b0d8, 0xd0000000, 0x # ................
	.word	0x00b0d7b8, 0x00000000, 0xc9cab7d0, 0x00000000, 0x # ................
	.word	0x8ea8eb00, 0x000029fa, 0x6bff4b00, 0x6ce6e619, 0x # .....)...K.k...l
	.word	0xcef5804b, 0xa11d0009, 0x8adffbea, 0x0000000c, 0x # K...............
	.word	0x000a000c, 0x000a0000, 0xf6a7000c, 0x0000000b, 0x # ................
	.word	0xc6e10000, 0x0056ff4d, 0x37000000, 0xed056cff, 0x # ....M.V....7.l..
	.word	0x000000ab, 0x16fb8c00, 0x0bf59800, 0xe0000000, 0x # ................
	.word	0x3e0000b7, 0x000055ff, 0x005dff36, 0xaae20100, 0x # ...>.U..6.].....
	.word	0xf68b0000, 0x0000000c, 0x000af589, 0x0000a8df, 0x # ................
	.word	0xff2f0000, 0x4eff3554, 0x00000000, 0x89a9d400, 0x # ../.T5.N........
	.word	0x000006ed, 0x7a000000, 0x0099d5ef, 0x00000000, 0x # .......z........
	.word	0xffff2000, 0x0000003f, 0x00000000, 0x0001e3c5, 0x # . ..?...........
	.word	0x00000000, 0x000e000c, 0x000e0000, 0xfe97000c, 0x # ................
	.word	0x08000011, 0x0000c4f6, 0x62ff4700, 0x0049ff5d, 0x # .........G.b].I.
	.word	0xfaff4500, 0x7c00000c, 0xff2327ff, 0x8a000082, 0x # .E.....|.'#.....
	.word	0x0049fff5, 0x00ebb100, 0x00bbe700, 0xeebdd000, 0x # ..I.............
	.word	0xe600008b, 0xae0000b2, 0xfe1602f2, 0x00ceaf7d, 0x # ............}...
	.word	0x0077ff1b, 0x2dff7400, 0x6936ff5b, 0xff5012fd, 0x # ..w..t.-[.6i..P.
	.word	0x3900003c, 0xeda066ff, 0x52ff2202, 0x0008f985, 0x # <..9.f...".R....
	.word	0x9cf80600, 0x0000a8e1, 0xc7b994dd, 0x00000000, 0x # ................
	.word	0x60ffd3c5, 0xc7960000, 0x00008ce3, 0xff8a0000, 0x # ...`............
	.word	0x00001aff, 0x52fef450, 0x00000000, 0x00d2ff50, 0x # ....P..R....P...
	.word	0xfb0e0000, 0x000018ff, 0xff160000, 0x0000008b, 0x # ................
	.word	0x00ddc300, 0x00000000, 0x000a000c, 0x000a0000, 0x # ................
	.word	0xf823000c, 0x000000b6, 0x4aff8c00, 0x44ff8200, 0x # ..#........J...D
	.word	0xf9210000, 0x090000b1, 0x0002d0df, 0x0021f6aa, 0x # ..!...........!.
	.word	0xff4f0000, 0x7eff3961, 0x00000000, 0xcae5b500, 0x # ..O.a9.~........
	.word	0x000007dc, 0x23000000, 0x004afff8, 0x00000000, 0x # .......#..J.....
	.word	0xfff62100, 0x00000048, 0xb6000000, 0x08ddc8eb, 0x # .!..H...........
	.word	0x00000000, 0x3267ff54, 0x000083fd, 0xcfe40d00, 0x # ....T.g2........
	.word	0xf99b0002, 0x90000027, 0x00003eff, 0x00bef016, 0x # ....'....>......
	.word	0x00aafc30, 0x72000000, 0x00005dff, 0x000a000c, 0x # 0......r.]......
	.word	0x000a0000, 0xff6f000c, 0x00000051, 0x82ff3900, 0x # ......o.Q....9..
	.word	0x00cce407, 0xb5000000, 0x690010f0, 0x000048ff, 0x # ...........i.H..
	.word	0x007eff31, 0xc3e00600, 0xedac0000, 0x0000000e, 0x # 1.~.............
	.word	0x293fff63, 0x000079fd, 0xdc040000, 0x0ceba3ba, 0x # c.?).y..........
	.word	0x00000000, 0xfdff5e00, 0x00000074, 0x03000000, 0x # .....^..t.......
	.word	0x000aeadd, 0x00000000, 0xc8c00000, 0x00000000, 0x # ................
	.word	0x00000000, 0x0000c8c0, 0x00000000, 0xc8c00000, 0x # ................
	# ... (zero-filled gap)
	.word	0x0000c8c0, 0x00000000, 0x000a000c, 0x00090000, 0x # ................
	.word	0xff28000c, 0xffffffff, 0x0a98ffff, 0x40404040, 0x # ..(.........@@@@
	.word	0x5bff8c40, 0x00000000, 0xbae50e00, 0x00000000, 0x # @..[............
	.word	0xf6960000, 0x00000022, 0xfe3a0000, 0x00000076, 0x # ....".....:.v...
	.word	0xd5060000, 0x000004d0, 0x7e000000, 0x000034fc, 0x # ...........~.4..
	.word	0x28000000, 0x00008ff8, 0x01000000, 0x000be1c2, 0x # ...(............
	.word	0x00000000, 0x004bff67, 0x00000000, 0x40cdef16, 0x # ....g.K........@
	.word	0x40404040, 0xffff3c37, 0xffffffff, 0x0001dcff, 0x # @@@@7<..........
	.word	0x0004000e, 0x00040000, 0x443b0011, 0xfae00844, 0x # ..........;DD...
	.word	0xa8e01ef0, 0xa8e00000, 0xa8e00000, 0xa8e00000, 0x # ................
	.word	0xa8e00000, 0xa8e00000, 0xa8e00000, 0xa8e00000, 0x # ................
	.word	0xa8e00000, 0xa8e00000, 0xa8e00000, 0xa8e00000, 0x # ................
	.word	0xaae00000, 0xffe00108, 0x383120ff, 0x00000738, 0x # ......... 188...
	.word	0x0007000c, 0x00070000, 0xec82000d, 0x00000005, 0x # ................
	.word	0x50ff2400, 0x00000000, 0x00adc600, 0x00000000, 0x # .$.P............
	.word	0x0012f969, 0x12000000, 0x000068f9, 0xae000000, 0x # i........h......
	.word	0x000000c6, 0xff500000, 0x00000024, 0x81ec0600, 0x # ......P.$.......
	.word	0x00000000, 0x00dd9500, 0x00000000, 0x003cff38, 0x # ............8.<.
	.word	0x00000000, 0x000099d9, 0x7d000000, 0x000007ef, 0x # ...........}....
	.word	0xfe200000, 0x0e000055, 0x00000400, 0x11000400, 0x # .. .U...........
	.word	0x44443d00, 0xfff7d907, 0xff70001c, 0xff70001c, 0x # .=DD......p...p.
	.word	0xff70001c, 0xff70001c, 0xff70001c, 0xff70001c, 0x # ..p...p...p...p.
	.word	0xff70001c, 0xff70001c, 0xff70001c, 0xff70001c, 0x # ..p...p...p...p.
	.word	0xff70001c, 0xff70001c, 0xff74071c, 0xffffe81c, 0x # ..p...p...t.....
	.word	0x3838321c, 0x0c000006, 0x00000700, 0x06000700, 0x # .288............
	.word	0x62000000, 0x000014f9, 0xffc50000, 0x00000070, 0x # ...b........p...
	.word	0xd3b3ff29, 0x8c000000, 0x37ff2ad5, 0x76e90500, 0x # )........*.7...v
	.word	0x009ac900, 0x001afd52, 0x000bf268, 0x07000100, 0x # ....R...h.......
	.word	0x08000000, 0x07000300, 0x08080808, 0xf8020808, 0x # ................
	.word	0xffffffff, 0x3640ffff, 0x38383838, 0x000e3838, 0x # ......@6888888..
	.word	0x05000d00, 0x04000000, 0x14000200, 0x0003cad3, 0x # ................
	.word	0x007cd315, 0x09000900, 0x08000000, 0x00000900, 0x # ..|.............
	.word	0xf6d76800, 0x000065d7, 0x4a7dfd69, 0x004dffa0, 0x # .h...e..i.}J..M.
	.word	0x00006d5f, 0x009bed02, 0x3c220200, 0x00b0e540, 0x # _m........"<@...
	.word	0xf7ffd93e, 0x04b0fef4, 0x0026d2ed, 0x20b0dc00, 0x # >.........&....
	.word	0x00006cff, 0x04b0ef10, 0x604cccea, 0x00b3f8d3, 0x # .l........L`....
	.word	0xd7f7d040, 0x01cec657, 0x09000d00, 0x08000000, 0x # @...W...........
	.word	0xe0000d00, 0x000000a8, 0xe0000000, 0x000000a8, 0x # ................
	.word	0xe0000000, 0x000000a8, 0xe0000000, 0x000000a8, 0x # ................
	.word	0xe0000000, 0xf0ef95ad, 0xe0000797, 0x884ca6fd, 0x # ..............L.
	.word	0xe0008cff, 0x000003cb, 0xe00cf2a3, 0x000000a8, 0x # ................
	.word	0xe035ff54, 0x000000a8, 0xe050ff3a, 0x000000a8, 0x # T.5.....:.P.....
	.word	0xe041ff47, 0x000000c5, 0xe018fc8a, 0x7b4aa0f3, 0x # G.A...........J{
	.word	0xe000a0fa, 0xf3ef956a, 0x00000da2, 0x08000900, 0x # ....j...........
	.word	0x08000000, 0x00000900, 0xf6dc6b00, 0x000049ce, 0x # .........k...I..
	.word	0x4d93ff62, 0x0135fca6, 0x0000b3e3, 0x1e91e303, 0x # b..M..5.........
	.word	0x000067ff, 0x381a1e00, 0x000053ff, 0x1e000000, 0x # .g.....8.S......
	.word	0x000066ff, 0x01000000, 0x0000aee4, 0x0086c300, 0x # .f..............
	.word	0x4c8fff64, 0x003bfb9d, 0xf7dd6e00, 0x000046cc, 0x # d..L..;..n...F..
	.word	0x09000d00, 0x08000000, 0x00000d00, 0x00000000, 0x # ................
	.word	0x00eca000, 0x00000000, 0x00eca000, 0x00000000, 0x # ................
	.word	0x00eca000, 0x00000000, 0x00eca000, 0xf3eb8602, 0x # ................
	.word	0x00ecaba0, 0x4b97ff70, 0x01ecff94, 0x0000bbe2, 0x # ....p..K........
	.word	0x1aecb800, 0x00006eff, 0x35eca000, 0x000055ff, 0x # .....n.....5.U..
	.word	0x26eca000, 0x000062ff, 0x06eca000, 0x0000a3f3, 0x # ...&.b..........
	.word	0x00ecb700, 0x4a88fe88, 0x00ecf892, 0xf3ef9506, 0x # .......J........
	.word	0x00ec69a3, 0x08000900, 0x08000000, 0x00000900, 0x # .i..............
	.word	0xf9db6000, 0x00004ed4, 0x4d8eff60, 0x0225fca8, 0x # .`...N..`..M..%.
	.word	0x0000b3e6, 0x298dea05, 0x8080baff, 0x3ab4e480, 0x # .......).......:
	.word	0xc8c8dbff, 0x2a99c8c8, 0x00006cff, 0x03000000, 0x # .......*.l......
	.word	0x0000b5eb, 0x00000100, 0x4c99ff6c, 0x0058c563, 0x # ........l..Lc.X.
	.word	0xfad86700, 0x001a9fe9, 0x05000d00, 0x06000000, 0x # .g..............
	.word	0x00000d00, 0xf8d03c00, 0xe7070073, 0x00204acc, 0x # .....<..s....J .
	.word	0x0059ff2d, 0xff3c0000, 0x9000004c, 0xd4ffffff, 0x # -.Y...<.L.......
	.word	0xff6d2400, 0x00003579, 0x004cff3c, 0xff3c0000, 0x # .$m.y5..<.L...<.
	.word	0x0000004c, 0x004cff3c, 0xff3c0000, 0x0000004c, 0x # L...<.L...<.L...
	.word	0x004cff3c, 0xff3c0000, 0x0000004c, 0x004cff3c, 0x # <.L...<.L...<.L.
	.word	0x09000000, 0x00000900, 0x0c000800, 0x78000000, 0x # ...............x
	.word	0x5ba6f4e7, 0xff5c00ff, 0xf38a4da4, 0xcecf00ff, 0x # ...[..\..M......
	.word	0xa4000001, 0x82fe07ff, 0x88000000, 0x69ff21ff, 0x # .............!.i
	.word	0x88000000, 0x76ff12ff, 0x88000000, 0xb8e600ff, 0x # .......v........
	.word	0x9c000000, 0xff7400ff, 0xfc814a94, 0x880200ff, 0x # ......t..J......
	.word	0x9daff6eb, 0x000000fc, 0xa8000000, 0x8f0d00d9, 0x # ................
	.word	0xfc7f4855, 0xaa160075, 0x70d6f6e7, 0x0d000102, 0x # UH..u......p....
	.word	0x00000900, 0x0d000700, 0x00a8e000, 0x00000000, 0x # ................
	.word	0x0000a8e0, 0xe0000000, 0x000000a8, 0xa8e00000, 0x # ................
	.word	0x00000000, 0x75a8e000, 0x0fa4eee5, 0x499af3e0, 0x # .......u.......I
	.word	0xe095fc79, 0x000000b9, 0xa8e0e1ad, 0x8a000000, 0x # y...............
	.word	0x00a8e0fc, 0xff880000, 0x0000a8e0, 0xe0ff8800, 0x # ................
	.word	0x000000a8, 0xa8e0ff88, 0x88000000, 0x00a8e0ff, 0x # ................
	.word	0xff880000, 0x000d0001, 0x00000004, 0x000d0002, 0x # ................
	.word	0x3230c8c0, 0x00000000, 0xc8c0c8c0, 0xc8c0c8c0, 0x # ..02............
	.word	0xc8c0c8c0, 0xc8c0c8c0, 0xffffc8c0, 0x0004000d, 0x # ................
	.word	0x00040000, 0x00000010, 0x0000d8b0, 0x0000362c, 0x # ............,6..
	# ... (zero-filled gap)
	.word	0x0000e4a4, 0x0000e4a4, 0x0000e4a4, 0x0000e4a4, 0x # ................
	.word	0x0000e4a4, 0x0000e4a4, 0x0000e4a4, 0x0000e4a4, 0x # ................
	.word	0x0000e4a4, 0x6426d9ad, 0xf671a2f3, 0x000119b8, 0x # ......&d..q.....
	.word	0x0008000d, 0x00080000, 0xace0000d, 0x00000000, 0x # ................
	.word	0xace00000, 0x00000000, 0xace00000, 0x00000000, 0x # ................
	.word	0xace00000, 0x00000000, 0xace00000, 0xff660000, 0x # ..............f.
	.word	0xace00074, 0xb6f73100, 0xace00001, 0x14e5dd10, 0x # t....1..........
	.word	0xe4e00000, 0x003ffcd0, 0xffe00000, 0x0014ecff, 0x # ......?.........
	.word	0xb3e00000, 0x00adfe4d, 0xace00000, 0x5dff8900, 0x # ....M..........]
	.word	0xace00000, 0xf0cb0500, 0xace0001d, 0xf3250000, 0x # ..............%.
	.word	0x000101bd, 0x0004000d, 0x00020000, 0xc8c0000d, 0x # ................
	.word	0xc8c0c8c0, 0xc8c0c8c0, 0xc8c0c8c0, 0xc8c0c8c0, 0x # ................
	.word	0xc8c0c8c0, 0xc8c0c8c0, 0x00090001, 0x0000000e, 0x # ................
	.word	0x0009000c, 0xe8828ce0, 0x790492f2, 0x038ae9e9, 0x # ...........y....
	.word	0x4a88f2e0, 0xb8bfffa1, 0x65ff8a4e, 0x0000b7e0, 0x # ...J....N..e....
	.word	0x0df2ee06, 0xbbd50000, 0x0000a8e0, 0x00c7cd00, 0x # ................
	.word	0xd8b10000, 0x0000a8e0, 0x00c4c800, 0xe0ac0000, 0x # ................
	.word	0x0000a8e0, 0x00c4c800, 0xe0ac0000, 0x0000a8e0, 0x # ................
	.word	0x00c4c800, 0xe0ac0000, 0x0000a8e0, 0x00c4c800, 0x # ................
	.word	0xe0ac0000, 0x0000a8e0, 0x00c4c800, 0xe0ac0000, 0x # ................
	.word	0x00090001, 0x00000009, 0x00090007, 0xe77488e0, 0x # ..............t.
	.word	0xe00fa3ed, 0x764899e7, 0xbde094fc, 0xb2000000, 0x # ......Hv........
	.word	0x00a8e0de, 0xf9920000, 0x0000a8e0, 0xe0fc9000, 0x # ................
	.word	0x000000a8, 0xa8e0fc90, 0x90000000, 0x00a8e0fc, 0x # ................
	.word	0xfc900000, 0x0000a8e0, 0x00fc9000, 0x09000900, 0x # ................
	.word	0x09000000, 0x00000900, 0xf9d86000, 0x000070dd, 0x # .........`...p..
	.word	0x9bff5f00, 0x77ff904f, 0xb8e40100, 0xa4000000, 0x # ._..O..w........
	.word	0xff260bf2, 0x00000066, 0x393eff50, 0x000050ff, 0x # ..&.f...P.>9.P..
	.word	0x50ff3900, 0x0066ff27, 0xff4f0000, 0xb7e6023e, 0x # .9.P'.f...O.>...
	.word	0xa2000000, 0x63000bf3, 0x8d4e9aff, 0x00007aff, 0x # .......c..N..z..
	.word	0xfad96200, 0x000072df, 0x00090001, 0x00000009, 0x # .b...r..........
	.word	0x000c0008, 0xef986de0, 0x000695f0, 0x4b95f7e0, 0x # .....m.........K
	.word	0x0088ff92, 0x0000bbe0, 0x0af0ad00, 0x0000a8e0, 0x # ................
	.word	0x31ff5900, 0x0000a8e0, 0x4cff3e00, 0x0000a8e0, 0x # .Y.1.....>.L....
	.word	0x3dff4d00, 0x0000b9e0, 0x16fc9600, 0x4992ffe0, 0x # .M.=...........I
	.word	0x009ffd85, 0xf19db1e0, 0x000da2f2, 0x0000a8e0, 0x # ................
	.word	0x00000000, 0x0000a8e0, 0x00000000, 0x0000a8e0, 0x # ................
	.word	0x00000000, 0x00090000, 0x00000009, 0x000c0008, 0x # ................
	.word	0xeb860200, 0xd47a9bf2, 0x99ff7000, 0xd4fb994c, 0x # ......z..p..L...
	.word	0x00bee201, 0xd4c30000, 0x006fff1a, 0xd4b40000, 0x # ..........o.....
	.word	0x0055ff35, 0xd4b40000, 0x0063ff26, 0xd4b40000, 0x # 5.U.....&.c.....
	.word	0x00a5f306, 0xd4c10000, 0x8afe8800, 0xd4ff9549, 0x # ............I...
	.word	0xef950600, 0xd4bd97e9, 0x00000000, 0xd4b40000, 0x # ................
	.word	0x00000000, 0xd4b40000, 0x00000000, 0xd4b40000, 0x # ................
	.word	0x000a0001, 0x00000006, 0x000a0005, 0x00000000, 0x # ................
	.word	0x9993e003, 0xfae03cf6, 0xe0094281, 0x000000b7, 0x # .....<...B......
	.word	0x0000a8e0, 0x00a8e000, 0xa8e00000, 0xe0000000, 0x # ................
	.word	0x000000a8, 0x0000a8e0, 0x00a8e000, 0x00000000, 0x # ................
	.word	0x00080009, 0x00080000, 0x08000009, 0xc2f3e38b, 0x # ................
	.word	0x93000038, 0xc64e69f5, 0xd9001ef2, 0x1e0000ac, 0x # 8....iN.........
	.word	0x990043bc, 0x002472f3, 0x07000000, 0xd6ffdb78, 0x # .C...r$.....x...
	.word	0x00000059, 0x9b280000, 0xd70f4dff, 0x07000060, 0x # Y.....(..M..`...
	.word	0xbf0084fe, 0xa34966ea, 0x13003ffe, 0xcef5e399, 0x # .....fI..?......
	.word	0x00000054, 0x0005000b, 0x00050000, 0x4800000b, 0x # T..............H
	.word	0x000044ff, 0x0044ff48, 0xffffffa0, 0xff7628dc, 0x # .D..H.D......(v.
	.word	0x48003773, 0x000044ff, 0x0044ff48, 0x44ff4800, 0x # s7.H.D..H.D..H.D
	.word	0xff480000, 0x45000044, 0x000046ff, 0x49b2ff24, 0x # ..H.D..E.F..$..I
	.word	0xf2890000, 0x090001c2, 0x00000900, 0x09000700, 0x # ................
	.word	0x00a0e800, 0xf8900000, 0x0000a0e8, 0xe8f89000, 0x # ................
	.word	0x000000a0, 0xa0e8f890, 0x90000000, 0x00a0e8f8, 0x # ................
	.word	0xf8900000, 0x0000a5e4, 0xc9f89000, 0x000000c4, 0x # ................
	.word	0xfe78f8a9, 0xed924978, 0xe88a05f8, 0xf87792f0, 0x # ..x.xI........w.
	.word	0x00090000, 0x00000008, 0x00090008, 0x0019fe78, 0x # ............x...
	.word	0x9bec0300, 0x0068fe1f, 0x43ff3e00, 0x00b9c400, 0x # ......h..>.C....
	.word	0x03e78d00, 0x0ffa6a00, 0x0092db00, 0x5afb1400, 0x # .....j.........Z
	.word	0x0039ff2a, 0xaab70000, 0x0001e079, 0xf25d0000, 0x # *.9.....y.....].
	.word	0x000088c6, 0xf60c0000, 0x000030ff, 0xa9000000, 0x # .........0......
	.word	0x000000d8, 0x00090000, 0x0000000c, 0x0009000c, 0x # ................
	.word	0x0012fe82, 0x00cdba00, 0x94f90700, 0x004cff3c, 0x # ............<.L.
	.word	0x1bfff90c, 0x4fff3900, 0x0087f104, 0x67e0e651, 0x # .....9.O....Q..g
	.word	0x0efb7200, 0x00c3b000, 0xb4a3ad9c, 0x00c3ab00, 0x # .r..............
	.word	0x07f76a00, 0xf75864e6, 0x007de40a, 0x6aff2500, 0x # .j...dX...}..%.j
	.word	0xfa0f19fe, 0x0038ff68, 0xd1de0000, 0xbc0000cb, 0x # ....h.8.........
	.word	0x0003efcf, 0xff990000, 0x6e00007e, 0x0000acff, 0x # ........~..n....
	.word	0xff530000, 0x1f000032, 0x000066ff, 0x00090000, 0x # ..S.2....f......
	.word	0x00000008, 0x00090008, 0x007bff42, 0x45ff7e00, 0x # ........B.{..~.E
	.word	0x12f0a400, 0x00a8f215, 0x8bef1700, 0x001af292, 0x # ................
	.word	0xf7690000, 0x00006ff9, 0xf1060000, 0x000009f5, 0x # ..i..o..........
	.word	0xf6750000, 0x00007bf3, 0x85f41f00, 0x0023f77e, 0x # ..u..{......~.#.
	.word	0x0eeab400, 0x00b9e50a, 0x006aff54, 0x58ff6300, 0x # ........T.j..c.X
	.word	0x00090000, 0x00000008, 0x000c0008, 0x0018fd9c, 0x # ................
	.word	0xa1fb1200, 0x006bff3c, 0x45ff6000, 0x00c0da00, 0x # ....<.k..`.E....
	.word	0x03e6b300, 0x18fd7b00, 0x008df80d, 0x6afd1d00, 0x # .....{.........j
	.word	0x0031ff59, 0xbcba0000, 0x0000d5ac, 0xf85a0000, 0x # Y.1...........Z.
	.word	0x000079f5, 0xf0090000, 0x00001efe, 0xc4000000, 0x # .y..............
	.word	0x000000c1, 0xfe2b0000, 0x00000064, 0xe5cb5e05, 0x # ......+.d....^..
	.word	0x0000000a, 0x36d5f71f, 0x00000000, 0x00090000, 0x # .......6........
	.word	0x00000008, 0x00090008, 0xffffff34, 0x30ffffff, 0x # ........4......0
	.word	0x4040400d, 0x0adaed47, 0x00000000, 0x0038fc8d, 0x # .@@@G.........8.
	.word	0x3f000000, 0x000083fe, 0xe00e0000, 0x000005cd, 0x # ...?............
	.word	0xf7a00000, 0x0000002a, 0x70ff5100, 0x00000000, 0x # ....*....Q.p....
	.word	0x41dfea15, 0x1d404040, 0xffffff44, 0x74ffffff, 0x # ...A@@@.D......t
	.word	0x000e0000, 0x00000005, 0x00110006, 0x00000000, 0x # ................
	.word	0x00000005, 0x1be76800, 0xff550000, 0x00000049, 0x # .....h....U.I...
	.word	0x0000cebb, 0xafdb0000, 0x00000000, 0x0000ace0, 0x # ................
	.word	0xa0ed0000, 0x6a090000, 0x000053ff, 0x00abff80, 0x # .......j.S......
	.word	0x99210000, 0x000039fd, 0x97f30400, 0x00000000, 0x # ..!..9..........
	.word	0x0000abe0, 0xadde0000, 0x00000000, 0x0000c3c4, 0x # ................
	.word	0xfb710000, 0x00000028, 0x1aed9b04, 0x00000000, 0x # ..q.(...........
	.word	0x00010021, 0x0004000c, 0x00020000, 0xacdc000e, 0x # !...............
	.word	0xacdcacdc, 0xacdcacdc, 0xacdcacdc, 0xacdcacdc, 0x # ................
	.word	0xacdcacdc, 0xacdcacdc, 0x0000acdc, 0x0005000e, 0x # ................
	.word	0x00050000, 0x00050011, 0xab000000, 0x000011ab, 0x # ................
	.word	0x00bdd20e, 0xff640000, 0x43000025, 0x000047ff, 0x # ......d.%..C.G..
	.word	0x004cff40, 0x58ff3500, 0xe4060000, 0x00001bc0, 0x # @.L..5.X........
	.word	0x00ecf936, 0x48dbc800, 0x62ff2d00, 0xff3f0000, 0x # 6......H.-.b..?.
	.word	0x4100004c, 0x00004aff, 0x002fff59, 0x02d8b901, 0x # L..A.J..Y./.....
	.word	0x2adb9f00, 0x021f0000, 0x01000000, 0x0b000700, 0x # ...*............
	.word	0x09000000, 0x14000400, 0x20a1d6a5, 0x5d220000, 0x # ........... .."]
	.word	0xd47cccaf, 0xa5165ff0, 0x0028b0b0, 0xfffa8906, 0x # ..|.._....(.....
	.word	0x000029e4, 0x0a000000, 0x0000082b, 0x04000000, 0x # .)......+.......
	.word	0x00000000, 0x01000000, 0x04000900, 0x02000000, 0x # ................
	.word	0xe0000c00, 0x002b38ac, 0xe0000000, 0xe0ace0ac, 0x # .....8+.........
	.word	0xe0ace0ac, 0xe0ace0ac, 0x00ace0ac, 0x09000b00, 0x # ................
	.word	0x08000000, 0x00000d00, 0x40110000, 0x00000012, 0x # ...........@....
	.word	0xff440000, 0x00000048, 0xff870f00, 0x00000b87, 0x # ..D.H...........
	.word	0xb1e5e525, 0x0010d4ec, 0x0010dcbc, 0x147ef51f, 0x # %.............~.
	.word	0x00007aff, 0x35536500, 0x000055ff, 0x2b000000, 0x # .z...eS5.U.....+
	.word	0x00005dff, 0x09000000, 0x000092f5, 0x00638200, 0x # .]............c.
	.word	0x0c4ef490, 0x005cfd5d, 0xfffba006, 0x000080f7, 0x # ..N.].\.........
	.word	0xff4c0000, 0x0000004c, 0xff440000, 0x00000048, 0x # ..L.L.....D.H...
	.word	0x09000c00, 0x09000000, 0x00000c00, 0xeca61500, 0x # ................
	.word	0x0018a6e9, 0xeabe0000, 0xc4e9605c, 0xff240000, 0x # ........\`....$.
	.word	0x6f00006e, 0x450017ff, 0x000045ff, 0x00021005, 0x # n..o...E.E......
	.word	0x0048ff43, 0x00000000, 0x7fff6c1d, 0x00284444, 0x # C.H......l..DD(.
	.word	0xffff7400, 0x98ffffff, 0x28000000, 0x000060ff, 0x # .t.........(.`..
	.word	0x00000000, 0x0060ff29, 0x00000000, 0x46ff4700, 0x # ....).`......G.F
	.word	0x00000000, 0xfea70000, 0x4040404b, 0xf4002b40, 0x # ........K@@@@+..
	.word	0xffffffff, 0x00adffff, 0x0b000b00, 0x0b000000, 0x # ................
	.word	0x00000c00, 0x00000000, 0x00000000, 0x9f020000, 0x # ................
	.word	0xbf94296c, 0xc61960aa, 0xfeb80636, 0xd3bcf0fc, 0x # l)...`..6.......
	.word	0x49f9faff, 0xb2ff3700, 0x5200000d, 0x0000b1fa, 0x # ...I.7.....R....
	.word	0x0011eaa0, 0x86000000, 0xd3001afc, 0x000000a3, 0x # ................
	.word	0xff2d0000, 0x92d9004c, 0x00000000, 0x53ff1b00, 0x # ..-.L..........S
	.word	0x00c6af00, 0x00000000, 0x0027ff50, 0x0056ff4b, 0x # ........P.'.K.V.
	.word	0xd60a0000, 0xb30500c3, 0x4789f9ff, 0xf7ffd25e, 0x # ...........G^...
	.word	0x73a30345, 0xe0f3c958, 0x39ca2f98, 0x00000000, 0x # E..sX..../.9....
	# ... (zero-filled gap)
	.word	0x0a000c00, 0x0a000000, 0x7e000c00, 0x000045ff, 0x # ...........~.E..
	.word	0xf8a60000, 0xcee50a20, 0x32000001, 0x00008bfe, 0x # .... ......2....
	.word	0x005bff62, 0x11edbc00, 0xd1020000, 0xff4707df, 0x # b.[...........G.
	.word	0x00000071, 0x74ff4500, 0x0006ded0, 0x14120000, 0x # q....E.t........
	.word	0x69fffbc2, 0x00000a14, 0xfff0f0dd, 0x83f0f0f8, 0x # ...i............
	.word	0x00000000, 0x008cfc00, 0x00000000, 0xfeb0b0a2, 0x # ................
	.word	0x60b0b0db, 0x50490000, 0x50b0fd50, 0x00002b50, 0x # ...`..IPP..PP+..
	.word	0xfc000000, 0x0000008c, 0x00000000, 0x008cfc00, 0x # ................
	.word	0x01000000, 0x04000c00, 0x02000000, 0xdc000e00, 0x # ................
	.word	0xdcacdcac, 0xdcacdcac, 0x00acdcac, 0xdc000000, 0x # ................
	.word	0xdcacdcac, 0xdcacdcac, 0x00acdcac, 0x0a000c00, 0x # ................
	.word	0x09000000, 0x00001100, 0xf0c75600, 0x003abbeb, 0x # .........V....:.
	.word	0x9dff6c00, 0xfbcc584e, 0xc0d5003b, 0x12000000, 0x # .l..NX..;.......
	.word	0xdd00a3f0, 0x000000bd, 0x00636a00, 0x2896ff96, 0x # .........jc....(
	.word	0x00000000, 0xfffa3000, 0x0e77d4ff, 0xc2e40900, 0x # .....0....w.....
	.word	0xffd7823e, 0xff3a2ae7, 0x00000053, 0x20bcf54f, 0x # >....*:.S...O..
	.word	0x00008aff, 0xec9f0000, 0xb6ffac00, 0xcd0c0c56, 0x # ............V...
	.word	0x700400cb, 0xe8f7ffdc, 0x000032e5, 0x95370000, 0x # ...p.....2....7.
	.word	0x1322eff6, 0x00001450, 0x85ff3100, 0x0068ff30, 0x # ..".P....1..0.h.
	.word	0xf6030000, 0xecda0397, 0x9e211354, 0x220050ff, 0x # ........T.!..P."
	.word	0xfffffeb0, 0x00006bea, 0x2d0d0000, 0x00000421, 0x # .....k.....-!...
	.word	0x000c0001, 0x00000008, 0x00020006, 0x000cffac, 0x # ................
	.word	0x402bb8ff, 0x2e400003, 0x000c0000, 0x0000000d, 0x # ..+@..@.........
	.word	0x000c000c, 0x3a000000, 0xd3f7edb1, 0x00000878, 0x # .......:....x...
	.word	0xf96e0000, 0x7348549d, 0x0014ccdb, 0x3aef4800, 0x # ..n..THs.....H.:
	.word	0x02211100, 0x00baac07, 0x005cd100, 0xd9e8f598, 0x # ..!.......\.....
	.word	0x47da0822, 0x5001e522, 0xaa0115e7, 0x996c0096, 0x # "..G"..P......l.
	.word	0x8a00b146, 0x200000a2, 0xbd36002e, 0x9700ac46, 0x # F...... ..6.F...
	.word	0x00000098, 0xbc300000, 0x7c00d421, 0x530000b5, 0x # ......0.!..|...S
	.word	0x9859006f, 0x2536cf00, 0xd7486bf6, 0x45bb0074, 0x # o.Y...6%.kH.t..E
	.word	0x13d44700, 0x7bbeae3d, 0x00ba7105, 0xdc6f0000, 0x # .G..=..{.q....o.
	.word	0x2d040f58, 0x0014cc9e, 0x3b000000, 0xd4f7eeb2, 0x # X..-.......;....
	.word	0x00000878, 0x000c0000, 0x00000007, 0x00080007, 0x # x...............
	.word	0xf4b71800, 0x00002fd1, 0xbe4ddd94, 0x1c0000c1, 0x # ...../....M.....
	.word	0xed670025, 0xd64a0000, 0x00f4fffb, 0x44b2ee01, 0x # %.g...J........D
	.word	0x0500f48b, 0xb2217efc, 0x990000f5, 0xfeadfcff, 0x # .....~!.........
	.word	0x26000008, 0x07380c1a, 0x00080000, 0x00000008, 0x # ...&..8.........
	.word	0x00070007, 0xe3470000, 0x008ea70a, 0x535ce30f, 0x # ......G.......\S
	.word	0xa10010eb, 0x6aea17c9, 0x5cff2100, 0x0007f581, 0x # .......j.!.\....
	.word	0x17c8a100, 0x00006aea, 0x545ce410, 0x000010eb, 0x # .....j....\T....
	.word	0xa70ae347, 0x0700018e, 0x00000900, 0x05000700, 0x # G...............
	.word	0x08080800, 0x04080808, 0xffffffff, 0x3884ffff, 0x # ...............8
	.word	0x3e383838, 0x000084ff, 0xff080000, 0x00000084, 0x # 888>............
	.word	0x23440200, 0x00070001, 0x00000007, 0x00030005, 0x # ..D#............
	.word	0x08080805, 0xffffb007, 0x3826ecff, 0x00333838, 0x # ..........&8883.
	.word	0x0d000c00, 0x0c000000, 0x00000c00, 0xb13a0000, 0x # ..............:.
	.word	0x78d3f7ed, 0x00000008, 0x9bf86e00, 0xd9714754, 0x # ...x.....n..TGq.
	.word	0x000014cc, 0x1c37ec48, 0x06000f1c, 0x0000baa9, 0x # ....H.7.........
	.word	0xff1052d1, 0x23d2f1ea, 0x2247d607, 0xff1000de, 0x # .R.....#..G"....
	.word	0x97a0011c, 0x46996800, 0xff1000ae, 0x7cc23238, 0x # .....h.F....82.|
	.word	0x46bd3700, 0xff1000af, 0x1bebebe7, 0x21bc3800, 0x # .7.F.........8.!
	.word	0xff1000e0, 0x86aa001c, 0x00986a00, 0xff1053cf, 0x # .........j...S..
	.word	0xa587001c, 0x0045d707, 0x883eed47, 0x6940000e, 0x # ......E.G.>...@i
	.word	0x0000baa9, 0x9af86f00, 0xd9714753, 0x000014cc, 0x # .....o..SGq.....
	.word	0xb23b0000, 0x78d4f8ee, 0x00000008, 0x07000c00, 0x # ..;....x........
	.word	0x07000000, 0x08000200, 0xffffffff, 0x400298ff, 0x # ...............@
	.word	0x40404040, 0x0c000126, 0x00000600, 0x05000400, 0x # @@@@&...........
	.word	0xe0e03f00, 0x7879db3d, 0x3d3eeed7, 0xfffe74ea, 0x # .?..=.yx..>=.t..
	.word	0x24230073, 0x0a000000, 0x00000900, 0x0a000800, 0x # s.#$............
	.word	0x00000000, 0x0020e83a, 0x00000000, 0x0024ff40, 0x # ....:. .....@.$.
	.word	0x00000000, 0x0024ff40, 0xb0b02600, 0xb0bbffc4, 0x # ....@.$..&......
	.word	0x84841ca5, 0x8495ffa3, 0x0000007b, 0x0024ff40, 0x # ........{...@.$.
	.word	0x00000000, 0x0024ff40, 0x00000000, 0x001abc2f, 0x # ....@.$...../...
	.word	0x403c0000, 0x40404040, 0xfff00026, 0xffffffff, 0x # ..<@@@@@&.......
	.word	0x0c000098, 0x00000700, 0x08000600, 0xd8450000, 0x # ..............E.
	.word	0x000bb1f4, 0xf9539eeb, 0x0e40036d, 0x007ce200, 0x # ......S.m.@...|.
	.word	0xeb7b0000, 0x8100001c, 0x000036f2, 0x0841f58d, 0x # ..{......6....A.
	.word	0xffff0c04, 0x0294ffff, 0x38383838, 0x0c000020, 0x # ........8888 ...
	.word	0x00000700, 0x08000600, 0xdd4f0000, 0x0019baf4, 0x # ..........O.....
	.word	0xe2509cea, 0x00000092, 0x0094d10a, 0xe6ffb800, 0x # ..P.............
	.word	0x2e000010, 0x0d96d048, 0xba1c5ad0, 0xff9900b6, 0x # ....H....Z......
	.word	0x0040ecff, 0x082d1b00, 0x0d000100, 0x00000500, 0x # ..@...-.........
	.word	0x02000400, 0xbed90b00, 0x07b19c0c, 0x09000100, 0x # ................
	.word	0x00000900, 0x0c000700, 0x00bccc00, 0xe4a40000, 0x # ................
	.word	0x0000bccc, 0xcce4a400, 0x000000bc, 0xbccce4a4, 0x # ................
	.word	0xa4000000, 0x00bccce4, 0xe4a40000, 0x0000c2cc, 0x # ................
	.word	0xcce4a400, 0x000001e4, 0xffcce4b1, 0xfd864890, 0x # .............H..
	.word	0xdbe5cce4, 0xe49cb7f5, 0x0000bccc, 0xcc000000, 0x # ................
	.word	0x000000bc, 0xbccc0000, 0x00000000, 0x0c000000, 0x # ................
	.word	0x00000800, 0x0c000700, 0x970e0000, 0x88fffee8, 0x # ................
	.word	0xffffb700, 0x3b88ffff, 0xffffffff, 0xff6c88ff, 0x # .......;......l.
	.word	0xffffffff, 0xffff6d88, 0x88ffffff, 0xffffff3c, 0x # .....m......<...
	.word	0x0088ffff, 0xffffffba, 0x0f0088ff, 0xfffee999, 0x # ................
	.word	0x00000088, 0x88ff0000, 0x00000000, 0x0088ff00, 0x # ................
	.word	0x00000000, 0x000088ff, 0xff000000, 0x08000188, 0x # ................
	.word	0x00000400, 0x03000200, 0xbc060500, 0x002d29d0, 0x # .............)-.
	.word	0x04000100, 0x04000000, 0x00000400, 0x0200237a, 0x # ............z#..
	.word	0x0026e8a9, 0x094fe509, 0x0006a0eb, 0x04000c00, 0x # ..&...O.........
	.word	0x04000000, 0x26000700, 0x2012bea8, 0x0018ffa2, 0x # .......&... ....
	.word	0x0018ff44, 0x0018ff44, 0x0018ff44, 0x0018ff44, 0x # D...D...D...D...
	.word	0x0018ff44, 0x07000c00, 0x07000000, 0x00000700, 0x # D...............
	.word	0xd6f4bc23, 0xc700004b, 0xf59c4ccb, 0x55fe0819, 0x # #...K....L.....U
	.word	0x4eff0900, 0x004fff0c, 0x0053ff04, 0x6713a7df, 0x # ...N..O...S....g
	.word	0x450028fe, 0x7dfcffed, 0x08000000, 0x0000132c, 0x # .(.E...}....,...
	.word	0x00070000, 0x00000008, 0x00060008, 0x2072c901, 0x # ..............r
	.word	0x00002fed, 0x3cf83300, 0x000fdc7c, 0xe6950000, 0x # ./...3.<|.......
	.word	0x00b1da1e, 0xe6960000, 0x00b1da1e, 0x3df83200, 0x # .............2.=
	.word	0x0010dc7c, 0x2073c801, 0x000030ed, 0x000c0001, 0x # |.....s .0......
	.word	0x0000000c, 0x000c000b, 0x00403f1a, 0x00000000, 0x # .........?@.....
	.word	0x7a000000, 0x0000ccf2, 0x00160000, 0x90000000, 0x # ...z............
	.word	0x000000cc, 0x0001d448, 0xcc900000, 0xde0a0000, 0x # ....H...........
	.word	0x00000047, 0x00cc9000, 0x00a78900, 0x00000000, 0x # G...............
	.word	0x2d00cc90, 0x2d0017ea, 0x90000035, 0x67c501cc, 0x # ...-...-5......g
	.word	0xc8f72f00, 0x00000000, 0x0f01c568, 0x00c8d5dc, 0x # ./......h.......
	.word	0xea170000, 0x90b0002c, 0x0000c88c, 0x0086a700, 0x # ....,...........
	.word	0xa339e076, 0x210027d3, 0xac0009d6, 0xf5ead0d0, 0x # v.9..'.!........
	.word	0x0500009f, 0x00000000, 0x00c88c00, 0x000c0001, 0x # ................
	.word	0x0000000d, 0x000c000b, 0x00403f1a, 0x00000000, 0x # .........?@.....
	.word	0x7a000000, 0x0000ccf2, 0x00160000, 0x90000000, 0x # ...z............
	.word	0x000000cc, 0x0008e530, 0xcc900000, 0xca020000, 0x # ....0...........
	.word	0x00000063, 0x00cc9000, 0x01c26d00, 0x00000000, 0x # c........m......
	.word	0x1a00cc90, 0x4e1e29eb, 0x90000031, 0x83ac00cc, 0x # .....).N1.......
	.word	0xf4c2f555, 0x00000085, 0x6108da4b, 0xd8890059, 0x # U.......K..aY...
	.word	0xdf0a0000, 0x00000043, 0x0092d714, 0x00a28b00, 0x # ....C...........
	.word	0xda230000, 0x0f0004a8, 0x000015dd, 0x0697eb39, 0x # ..#.........9...
	.word	0x05000003, 0xb4000000, 0xecffffff, 0x000c0000, 0x # ................
	.word	0x0000000e, 0x000c000e, 0x4f320000, 0x00000026, 0x # ..........2O&...
	.word	0x00000000, 0x92000000, 0x72f7b8ed, 0x15000000, 0x # ...........r....
	.word	0x00000000, 0x00284f00, 0x0000c29e, 0x0045d305, 0x # .....O(.......E.
	.word	0x00000000, 0x3eedb568, 0xb7790000, 0x00000000, 0x # ....h..>..y.....
	.word	0x502d0000, 0x22009fc4, 0x000021ec, 0xb0000000, 0x # ..-P...".!......
	.word	0xd694055a, 0x0077b800, 0x0012440c, 0xfcf26e00, 0x # Z.....w..D...n..
	.word	0xd2584ce5, 0xffaa0004, 0x00000044, 0x10000f02, 0x # .LX.....D.......
	.word	0x700039e5, 0x0044ffd5, 0x00000000, 0x00969700, 0x # .9.p..D.........
	.word	0xff2fe73a, 0x00000044, 0xe5380000, 0x7ce4150f, 0x # :./.D.....8....|
	.word	0x0d6aff40, 0x00000000, 0x470056ab, 0xffd3d0d0, 0x # @.j......V.G....
	.word	0x000034dc, 0x00050000, 0x00000000, 0x0044ff10, 0x # .4............D.
	.word	0x00090000, 0x00000008, 0x000c0008, 0x8c000000, 0x # ................
	.word	0x000010ff, 0x23000000, 0x00000440, 0x02000000, 0x # .......#@.......
	.word	0x00000004, 0x86000000, 0x000004ff, 0xca030000, 0x # ................
	.word	0x000000df, 0xfb940000, 0x0000004a, 0x74ff5700, 0x # ........J....W.t
	.word	0x00000000, 0x01c8da00, 0x00000000, 0x007aff10, 0x # ..............z.
	.word	0x00000000, 0x0092fa04, 0x43ff4400, 0x7df6aa00, 0x # .........D.C...}
	.word	0x0ce1dd69, 0xe79d1200, 0x0028b6f1, 0x00100000, 0x # i.........(.....
	.word	0x0000000a, 0x0010000a, 0xe2210000, 0x000000b2, 0x # ..........!.....
	.word	0x00000000, 0x60e22200, 0x00000000, 0x00000000, 0x # .....".`........
	# ... (zero-filled gap)
	.word	0x0003eabc, 0x00000000, 0xfffc1600, 0x00000044, 0x # ............D...
	.word	0x6b000000, 0x0099fdff, 0x00000000, 0xafdac200, 0x # ...k............
	.word	0x000004eb, 0xfe1b0000, 0x45ff5981, 0x00000000, 0x # .........Y.E....
	.word	0x0c29ff71, 0x00009af6, 0xd1c80000, 0xebab0000, 0x # q.).............
	.word	0x1f000004, 0x38389dff, 0x0046ff81, 0xffff7700, 0x # ......88..F..w..
	.word	0xffffffff, 0xce00009b, 0x101010c6, 0x04eca910, 0x # ................
	.word	0x006cff25, 0x4f000000, 0xfc7c47ff, 0x00000017, 0x # %.l....O.G|.....
	.word	0x9df00700, 0x00100000, 0x0000000a, 0x0010000a, 0x # ................
	.word	0x00000000, 0x36ed8d00, 0x00000000, 0xe4450000, 0x # .......6......E.
	.word	0x0000002b, 0x00000000, 0x00000000, 0x00000000, 0x # +...............
	# ... (zero-filled gap)
	.word	0x0003eabc, 0x00000000, 0xfffc1600, 0x00000044, 0x # ............D...
	.word	0x6b000000, 0x0099fdff, 0x00000000, 0xafdac200, 0x # ...k............
	.word	0x000004eb, 0xfe1b0000, 0x45ff5981, 0x00000000, 0x # .........Y.E....
	.word	0x0c29ff71, 0x00009af6, 0xd1c80000, 0xebab0000, 0x # q.).............
	.word	0x1f000004, 0x38389dff, 0x0046ff81, 0xffff7700, 0x # ......88..F..w..
	.word	0xffffffff, 0xce00009b, 0x101010c6, 0x04eca910, 0x # ................
	.word	0x006cff25, 0x4f000000, 0xfc7c47ff, 0x00000017, 0x # %.l....O.G|.....
	.word	0x9df00700, 0x00100000, 0x0000000a, 0x0010000a, 0x # ................
	.word	0x18000000, 0x002de4d3, 0x00000000, 0x5274db1a, 0x # ......-.......tR
	.word	0x000033e8, 0x00000000, 0x00000000, 0x00000000, 0x # .3..............
	# ... (zero-filled gap)
	.word	0x0003eabc, 0x00000000, 0xfffc1600, 0x00000044, 0x # ............D...
	.word	0x6b000000, 0x0099fdff, 0x00000000, 0xafdac200, 0x # ...k............
	.word	0x000004eb, 0xfe1b0000, 0x45ff5981, 0x00000000, 0x # .........Y.E....
	.word	0x0c29ff71, 0x00009af6, 0xd1c80000, 0xebab0000, 0x # q.).............
	.word	0x1f000004, 0x38389dff, 0x0046ff81, 0xffff7700, 0x # ......88..F..w..
	.word	0xffffffff, 0xce00009b, 0x101010c6, 0x04eca910, 0x # ................
	.word	0x006cff25, 0x4f000000, 0xfc7c47ff, 0x00000017, 0x # %.l....O.G|.....
	.word	0x9df00700, 0x00100000, 0x0000000a, 0x0010000a, 0x # ................
	.word	0x00000000, 0x0c090000, 0x00000000, 0xffffe846, 0x # ............F...
	.word	0x000092ff, 0x4f300000, 0x00304040, 0x00000000, 0x # ......0O@@0.....
	# ... (zero-filled gap)
	.word	0x0003eabc, 0x00000000, 0xfffc1600, 0x00000044, 0x # ............D...
	.word	0x6b000000, 0x0099fdff, 0x00000000, 0xafdac200, 0x # ...k............
	.word	0x000004eb, 0xfe1b0000, 0x45ff5981, 0x00000000, 0x # .........Y.E....
	.word	0x0c29ff71, 0x00009af6, 0xd1c80000, 0xebab0000, 0x # q.).............
	.word	0x1f000004, 0x38389dff, 0x0046ff81, 0xffff7700, 0x # ......88..F..w..
	.word	0xffffffff, 0xce00009b, 0x101010c6, 0x04eca910, 0x # ................
	.word	0x006cff25, 0x4f000000, 0xfc7c47ff, 0x00000017, 0x # %.l....O.G|.....
	.word	0x9df00700, 0x000f0000, 0x0000000a, 0x000f000a, 0x # ................
	.word	0xffa00000, 0xc4f40018, 0x00000000, 0x00064028, 0x # ............(@..
	.word	0x0000313d, 0x00000000, 0x00000000, 0x00000000, 0x # =1..............
	.word	0xeabc0000, 0x00000003, 0x16000000, 0x0044fffc, 0x # ..............D.
	.word	0x00000000, 0xfdff6b00, 0x00000099, 0xc2000000, 0x # .....k..........
	.word	0x04ebafda, 0x00000000, 0x5981fe1b, 0x000045ff, 0x # ...........Y.E..
	.word	0xff710000, 0x9af60c29, 0x00000000, 0x0000d1c8, 0x # ..q.)...........
	.word	0x0004ebab, 0x9dff1f00, 0xff813838, 0x77000046, 0x # ........88..F..w
	.word	0xffffffff, 0x009bffff, 0x10c6ce00, 0xa9101010, 0x # ................
	.word	0xff2504ec, 0x0000006c, 0x47ff4f00, 0x0017fc7c, 0x # ..%.l....O.G|...
	.word	0x07000000, 0x00009df0, 0x000a000f, 0x000a0000, 0x # ................
	.word	0x0000000f, 0xd9cb0a00, 0x00000016, 0x45000000, 0x # ...............E
	.word	0x005dabbd, 0x00000000, 0xf8f11a00, 0x0000002c, 0x # ..].........,...
	.word	0x00000000, 0x0003ffd1, 0x00000000, 0xfffc1600, 0x # ................
	.word	0x00000044, 0x6b000000, 0x0099fdff, 0x00000000, 0x # D......k........
	.word	0xafdac200, 0x000004eb, 0xfe1b0000, 0x45ff5981, 0x # .............Y.E
	.word	0x00000000, 0x0c29ff71, 0x00009af6, 0xd1c80000, 0x # ....q.).........
	.word	0xebab0000, 0x1f000004, 0x38389dff, 0x0046ff81, 0x # ..........88..F.
	.word	0xffff7700, 0xffffffff, 0xce00009b, 0x101010c6, 0x # .w..............
	.word	0x04eca910, 0x006cff25, 0x4f000000, 0xfc7c47ff, 0x # ....%.l....O.G|.
	.word	0x00000017, 0x9df00700, 0x000c0000, 0x00000010, 0x # ................
	.word	0x000c0010, 0x00000000, 0xff490000, 0xffffffff, 0x # ..........I.....
	.word	0x008cffff, 0x00000000, 0xffd70500, 0x404060ff, 0x # .............`@@
	.word	0x00234040, 0x00000000, 0xd3ff7000, 0x000034ff, 0x # @@#......p...4..
	# ... (zero-filled gap)
	.word	0x5addef13, 0x00003fff, 0x00000000, 0x00000000, 0x # ...Z.?..........
	.word	0x4751ff96, 0x000049ff, 0x00000000, 0x2c000000, 0x # ..QG.I.........,
	.word	0x3b00bdfc, 0xe4e4ecff, 0x0000d2e4, 0xbb000000, 0x # ...;............
	.word	0x30002cfc, 0x64649dff, 0x00005c64, 0xff4f0000, 0x # .,.0..ddd\....O.
	.word	0x432424ad, 0x000067ff, 0x00000000, 0xffdb0600, 0x # .$$C.g..........
	.word	0xffffffff, 0x000071ff, 0x00000000, 0x88ff7500, 0x # .....q.......u..
	.word	0x4f444444, 0x00007bff, 0x00000000, 0x05d8f116, 0x # DDDO.{..........
	.word	0x05000000, 0x4040a3ff, 0x02404040, 0x0049ff9b, 0x # ......@@@@@...I.
	.word	0x00000000, 0xfffffffa, 0x08ffffff, 0x000c0000, 0x # ................
	.word	0x0000000a, 0x000f000a, 0x98140000, 0x80dbf9e8, 0x # ................
	.word	0x0e000007, 0x4b65e4d7, 0x00b7f886, 0x2cfd8b00, 0x # ......eK.......,
	.word	0x68000000, 0xe50041ff, 0x000000b4, 0x64e41700, 0x # ...h.A.........d
	.word	0x0087ff0b, 0x00000000, 0xff140000, 0x00000078, 0x # ............x...
	.word	0x00000000, 0x0078ff14, 0x00000000, 0xff0b0000, 0x # ......x.........
	.word	0x00000087, 0x00000000, 0x00b4e600, 0x17000000, 0x # ................
	.word	0x8d0064e4, 0x00002cfd, 0x3cff6600, 0xe4d90f00, 0x # .d...,...f.<....
	.word	0xf6844b65, 0x000000ac, 0xffff9a15, 0x00047ada, 0x # eK...........z..
	.word	0x00000000, 0x00add13c, 0x00000000, 0x53000000, 0x # ....<..........S
	.word	0x000000eb, 0x00000000, 0x0057de64, 0x00010000, 0x # ........d.W.....
	.word	0x00090010, 0x00080000, 0x47000010, 0x000076f8, 0x # ...........G.v..
	.word	0x00000000, 0x002cf048, 0x00000000, 0x00000000, 0x # ....H.,.........
	# ... (zero-filled gap)
	.word	0xffac0000, 0xffffffff, 0xe8ac40ff, 0x40404040, 0x # .........@..@@@@
	.word	0xe0ac1040, 0x00000000, 0xe0ac0000, 0x00000000, 0x # @...............
	.word	0xe0ac0000, 0x00000000, 0xfbac0000, 0xd8d8d8d8, 0x # ................
	.word	0xeeac0076, 0x70707070, 0xe0ac003d, 0x00000000, 0x # v...pppp=.......
	.word	0xe0ac0000, 0x00000000, 0xe0ac0000, 0x00000000, 0x # ................
	.word	0xe8ac0000, 0x40404040, 0xffac1640, 0xffffffff, 0x # ....@@@@@.......
	.word	0x000158ff, 0x00090010, 0x00080000, 0x00000010, 0x # .X..............
	.word	0xd0c40300, 0x00000016, 0x10c58000, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0xffac0000, 0xffffffff, 0xe8ac40ff, 0x40404040, 0x # .........@..@@@@
	.word	0xe0ac1040, 0x00000000, 0xe0ac0000, 0x00000000, 0x # @...............
	.word	0xe0ac0000, 0x00000000, 0xfbac0000, 0xd8d8d8d8, 0x # ................
	.word	0xeeac0076, 0x70707070, 0xe0ac003d, 0x00000000, 0x # v...pppp=.......
	.word	0xe0ac0000, 0x00000000, 0xe0ac0000, 0x00000000, 0x # ................
	.word	0xe8ac0000, 0x40404040, 0xffac1640, 0xffffffff, 0x # ....@@@@@.......
	.word	0x000158ff, 0x00090010, 0x00080000, 0x00000010, 0x # .X..............
	.word	0x11c6eb38, 0x3e000000, 0xd18743e9, 0x00000013, 0x # 8......>.C......
	# ... (zero-filled gap)
	.word	0xffac0000, 0xffffffff, 0xe8ac40ff, 0x40404040, 0x # .........@..@@@@
	.word	0xe0ac1040, 0x00000000, 0xe0ac0000, 0x00000000, 0x # @...............
	.word	0xe0ac0000, 0x00000000, 0xfbac0000, 0xd8d8d8d8, 0x # ................
	.word	0xeeac0076, 0x70707070, 0xe0ac003d, 0x00000000, 0x # v...pppp=.......
	.word	0xe0ac0000, 0x00000000, 0xe0ac0000, 0x00000000, 0x # ................
	.word	0xe8ac0000, 0x40404040, 0xffac1640, 0xffffffff, 0x # ....@@@@@.......
	.word	0x000158ff, 0x0009000f, 0x00080000, 0xd800000f, 0x # .X..............
	.word	0xff2c00e0, 0x3600008c, 0x400b0038, 0x00000023, 0x # ..,....68..@#...
	.word	0x00000000, 0xffac0000, 0xffffffff, 0xe8ac40ff, 0x # .............@..
	.word	0x40404040, 0xe0ac1040, 0x00000000, 0xe0ac0000, 0x # @@@@@...........
	.word	0x00000000, 0xe0ac0000, 0x00000000, 0xfbac0000, 0x # ................
	.word	0xd8d8d8d8, 0xeeac0076, 0x70707070, 0xe0ac003d, 0x # ....v...pppp=...
	.word	0x00000000, 0xe0ac0000, 0x00000000, 0xe0ac0000, 0x # ................
	.word	0x00000000, 0xe8ac0000, 0x40404040, 0xffac1640, 0x # ........@@@@@...
	.word	0xffffffff, 0xffff58ff, 0x00050010, 0x00050000, 0x # .....X..........
	.word	0xc60d0010, 0x000009d8, 0x0090c60e, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0x0008ff84, 0x08ff8400, 0xff840000, 0x84000008, 0x # ................
	.word	0x000008ff, 0x0008ff84, 0x08ff8400, 0xff840000, 0x # ................
	.word	0x84000008, 0x000008ff, 0x0008ff84, 0x08ff8400, 0x # ................
	.word	0xff840000, 0x84000008, 0x000108ff, 0x00050010, 0x # ................
	.word	0x00040000, 0x5c000010, 0xe82158fa, 0x0000004a, 0x # .......\.X!.J...
	.word	0x00000000, 0xff840000, 0xff840008, 0xff840008, 0x # ................
	.word	0xff840008, 0xff840008, 0xff840008, 0xff840008, 0x # ................
	.word	0xff840008, 0xff840008, 0xff840008, 0xff840008, 0x # ................
	.word	0xff840008, 0xffff0008, 0x00050010, 0x00060000, 0x # ................
	.word	0x08000010, 0x004cf4b3, 0x33a1be07, 0x000056e6, 0x # ......L....3.V..
	# ... (zero-filled gap)
	.word	0x0008ff84, 0xff840000, 0x00000008, 0x0008ff84, 0x # ................
	.word	0xff840000, 0x00000008, 0x0008ff84, 0xff840000, 0x # ................
	.word	0x00000008, 0x0008ff84, 0xff840000, 0x00000008, 0x # ................
	.word	0x0008ff84, 0xff840000, 0x00000008, 0x0008ff84, 0x # ................
	.word	0xff840000, 0xffff0008, 0x0005000f, 0x00060000, 0x # ................
	.word	0xff6c000f, 0xf8c0004c, 0x0013401b, 0x00003e30, 0x # ..l.L....@..0>..
	.word	0x00000000, 0xff840000, 0x00000008, 0x0008ff84, 0x # ................
	.word	0xff840000, 0x00000008, 0x0008ff84, 0xff840000, 0x # ................
	.word	0x00000008, 0x0008ff84, 0xff840000, 0x00000008, 0x # ................
	.word	0x0008ff84, 0xff840000, 0x00000008, 0x0008ff84, 0x # ................
	.word	0xff840000, 0x00000008, 0x0008ff84, 0x000c0000, 0x # ................
	.word	0x0000000b, 0x000c000a, 0xffffac00, 0x4fc0f2ff, 0x # ...............O
	.word	0xac000000, 0x514040e8, 0x007affa7, 0x00e0ac00, 0x # .....@@Q..z.....
	.word	0x90000000, 0xac0035fe, 0x000000e0, 0x9af30f00, 0x # .....5..........
	.word	0x00e0ac00, 0x00000000, 0xe9b9c9c9, 0x06c0c0f8, 0x # ................
	.word	0xd7b00000, 0x88f1d885, 0x00000488, 0xac00d7b0, 0x # ................
	.word	0x000000e0, 0xcaca0000, 0x00e0ac00, 0x0e000000, 0x # ................
	.word	0xac009bf3, 0x000000e0, 0x37fe8d00, 0x40e8ac00, 0x # ...........7...@
	.word	0xffa55040, 0xac00007e, 0xf3ffffff, 0x000051c2, 0x # @P..~........Q..
	.word	0x00100001, 0x0000000b, 0x00100009, 0x00000000, 0x # ................
	.word	0x02130000, 0xa4000000, 0xf7fffffa, 0x0300002a, 0x # ............*...
	.word	0x3e404354, 0x00000016, 0x00000000, 0x00000000, 0x # TC@>............
	.word	0x002ffcac, 0x9c000000, 0xc3ffacf0, 0x00000000, 0x # ../.............
	.word	0xfeacf09c, 0x00005cff, 0xacf09c00, 0x0de7bae0, 0x # .....\..........
	.word	0xf09c0000, 0xf927e0ac, 0x9c00008d, 0x00e0acf0, 0x # ......'.........
	.word	0x002afb87, 0xe0acf09c, 0xbde20a00, 0xacf09c00, 0x # ..*.............
	.word	0x520000e0, 0xf09c56ff, 0x0000e0ac, 0xa7e3b800, 0x # ...R.V..........
	.word	0x00e0acf0, 0xf8250000, 0xe0acf0fb, 0x00000000, 0x # ......%.........
	.word	0xacf0ff84, 0x000000e0, 0xf0df0900, 0x00100000, 0x # ................
	.word	0x0000000b, 0x0010000b, 0x9e010000, 0x000022f3, 0x # ............."..
	.word	0x00000000, 0x9e020000, 0x000002c2, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0x94120000, 0x7ddaf9e5, 0x00000007, 0x68e4d70f, 0x # .......}.......h
	.word	0xbaf27a46, 0x90000003, 0x000025fa, 0x70ff4300, 0x # Fz.......%...C.p
	.word	0xa7eb0100, 0x00000000, 0x00d1c300, 0x007bff13, 0x # ..............{.
	.word	0x00000000, 0x1c00f994, 0x00006cff, 0x84000000, 0x # .........l......
	.word	0xff1c04ff, 0x0000006c, 0xff840000, 0x7bff1304, 0x # ....l..........{
	.word	0x00000000, 0x00f99400, 0x00a7ec01, 0x00000000, 0x # ................
	.word	0x0000d2c3, 0x0025fa92, 0xff430000, 0x10000072, 0x # ......%...C.r...
	.word	0x4667e3d9, 0x04bdf179, 0x14000000, 0xdbfae796, 0x # ..gFy...........
	.word	0x0000077f, 0x00100000, 0x0000000b, 0x0010000b, 0x # ................
	.word	0x00000000, 0x87f82f00, 0x00000000, 0x09000000, 0x # ...../..........
	.word	0x000076d5, 0x00000000, 0x00000000, 0x00000000, 0x # .v..............
	# ... (zero-filled gap)
	.word	0x94120000, 0x7ddaf9e5, 0x00000007, 0x68e4d70f, 0x # .......}.......h
	.word	0xbaf27a46, 0x90000003, 0x000025fa, 0x70ff4300, 0x # Fz.......%...C.p
	.word	0xa7eb0100, 0x00000000, 0x00d1c300, 0x007bff13, 0x # ..............{.
	.word	0x00000000, 0x1c00f994, 0x00006cff, 0x84000000, 0x # .........l......
	.word	0xff1c04ff, 0x0000006c, 0xff840000, 0x7bff1304, 0x # ....l..........{
	.word	0x00000000, 0x00f99400, 0x00a7ec01, 0x00000000, 0x # ................
	.word	0x0000d2c3, 0x0025fa92, 0xff430000, 0x10000072, 0x # ......%...C.r...
	.word	0x4667e3d9, 0x04bdf179, 0x14000000, 0xdbfae796, 0x # ..gFy...........
	.word	0x0000077f, 0x00100000, 0x0000000b, 0x0010000b, 0x # ................
	.word	0x00000000, 0x0079fc86, 0x00000000, 0xc7920000, 0x # ......y.........
	.word	0x0085d125, 0x00000000, 0x00000000, 0x00000000, 0x # %...............
	# ... (zero-filled gap)
	.word	0x94120000, 0x7ddaf9e5, 0x00000007, 0x68e4d70f, 0x # .......}.......h
	.word	0xbaf27a46, 0x90000003, 0x000025fa, 0x70ff4300, 0x # Fz.......%...C.p
	.word	0xa7eb0100, 0x00000000, 0x00d1c300, 0x007bff13, 0x # ..............{.
	.word	0x00000000, 0x1c00f994, 0x00006cff, 0x84000000, 0x # .........l......
	.word	0xff1c04ff, 0x0000006c, 0xff840000, 0x7bff1304, 0x # ....l..........{
	.word	0x00000000, 0x00f99400, 0x00a7ec01, 0x00000000, 0x # ................
	.word	0x0000d2c3, 0x0025fa92, 0xff430000, 0x10000072, 0x # ......%...C.r...
	.word	0x4667e3d9, 0x04bdf179, 0x14000000, 0xdbfae796, 0x # ..gFy...........
	.word	0x0000077f, 0x00100000, 0x0000000b, 0x0010000b, 0x # ................
	.word	0x00000000, 0x14010000, 0x00000000, 0xfdc10b00, 0x # ................
	.word	0x0ee7ffff, 0x00000000, 0x4041550f, 0x00000e3c, 0x # .........UA@<...
	# ... (zero-filled gap)
	.word	0x94120000, 0x7ddaf9e5, 0x00000007, 0x68e4d70f, 0x # .......}.......h
	.word	0xbaf27a46, 0x90000003, 0x000025fa, 0x70ff4300, 0x # Fz.......%...C.p
	.word	0xa7eb0100, 0x00000000, 0x00d1c300, 0x007bff13, 0x # ..............{.
	.word	0x00000000, 0x1c00f994, 0x00006cff, 0x84000000, 0x # .........l......
	.word	0xff1c04ff, 0x0000006c, 0xff840000, 0x7bff1304, 0x # ....l..........{
	.word	0x00000000, 0x00f99400, 0x00a7ec01, 0x00000000, 0x # ................
	.word	0x0000d2c3, 0x0025fa92, 0xff430000, 0x10000072, 0x # ......%...C.r...
	.word	0x4667e3d9, 0x04bdf179, 0x14000000, 0xdbfae796, 0x # ..gFy...........
	.word	0x0000077f, 0x000f0000, 0x0000000b, 0x000f000b, 0x # ................
	.word	0xff3c0000, 0xff90007c, 0x00000028, 0x1f400f00, 0x # ..<.|...(.....@.
	.word	0x0a402400, 0x00000000, 0x00000000, 0x00000000, 0x # .$@.............
	.word	0x12000000, 0xdaf9e594, 0x0000077d, 0xe4d70f00, 0x # ........}.......
	.word	0xf27a4668, 0x000003ba, 0x0025fa90, 0xff430000, 0x # hFz.......%...C.
	.word	0xeb010070, 0x000000a7, 0xd1c30000, 0x7bff1300, 0x # p..............{
	.word	0x00000000, 0x00f99400, 0x006cff1c, 0x00000000, 0x # ..........l.....
	.word	0x1c04ff84, 0x00006cff, 0x84000000, 0xff1304ff, 0x # .....l..........
	.word	0x0000007b, 0xf9940000, 0xa7ec0100, 0x00000000, 0x # {...............
	.word	0x00d2c300, 0x25fa9200, 0x43000000, 0x000072ff, 0x # .......%...C.r..
	.word	0x67e3d910, 0xbdf17946, 0x00000004, 0xfae79614, 0x # ...gFy..........
	.word	0x00077fdb, 0x09000000, 0x00000900, 0x08000800, 0x # ................
	.word	0x2fab0a00, 0x9e030000, 0xebcb0f44, 0xfba2022b, 0x # .../....D...+...
	.word	0xce110052, 0x56fcabe8, 0x14000000, 0x0077ffef, 0x # R......V......w.
	.word	0x97000000, 0x25e6e2fd, 0xfe920000, 0xe3d71761, 0x # .......%....a...
	.word	0x65e61823, 0xd9190000, 0x000d0073, 0x0e000000, 0x # #..e....s.......
	.word	0x0d000000, 0x00000b00, 0x0e000b00, 0x00000000, 0x # ................
	.word	0x00000000, 0x00918f00, 0x94120000, 0x77d3f6e5, 0x # ...............w
	.word	0x000027e7, 0x68e5d70f, 0xe3f98a4b, 0x8f000004, 0x # .'.....hK.......
	.word	0x000027fa, 0x6effed13, 0xa7ea0000, 0x99000000, 0x # .'.....n........
	.word	0x00cfdcb3, 0x0079ff13, 0x22f53200, 0x1c00f999, 0x # ......y..2."....
	.word	0x01006cff, 0x840083c6, 0xff1c04ff, 0xe161006c, 0x # .l..........l.a.
	.word	0xff84000a, 0x7bff1304, 0x0053e80f, 0x00f99100, 0x # .......{..S.....
	.word	0x91b6ec01, 0x000000bc, 0x0000d2be, 0x29f7fe95, 0x # ...............)
	.word	0xff3f0000, 0x14000072, 0x4c69eeec, 0x04bdf680, 0x # ..?.r.....iL....
	.word	0xe43b0000, 0xdbf9e497, 0x0000077f, 0x003c5800, 0x # ..;..........X<.
	.word	0x00000000, 0x01000000, 0x0b001000, 0x09000000, 0x # ................
	.word	0x00001000, 0x1ff2a202, 0x00000000, 0xa1020000, 0x # ................
	.word	0x000001be, 0x00000000, 0x00000000, 0x00000000, 0x # ................
	.word	0x00000000, 0xd8000000, 0x000000b0, 0xb8d00000, 0x # ................
	.word	0x0000b0d8, 0xd0000000, 0x00b0d8b8, 0x00000000, 0x # ................
	.word	0xb0d8b8d0, 0x00000000, 0xd8b8d000, 0x000000b0, 0x # ................
	.word	0xb8d00000, 0x0000b0d8, 0xd0000000, 0x00b0d8b8, 0x # ................
	.word	0x00000000, 0xb0d7b8d0, 0x00000000, 0xcab7d000, 0x # ................
	.word	0x000000c9, 0xa8eb0000, 0x0029fa8e, 0xff4b0000, 0x # ..........)...K.
	.word	0xe6e6196b, 0xf5804b6c, 0x1d0009ce, 0xdffbeaa1, 0x # k...lK..........
	.word	0x01000c8a, 0x0b001000, 0x09000000, 0x00001000, 0x # ................
	.word	0x32000000, 0x000083f9, 0x0b000000, 0x000072d8, 0x # ...2.........r..
	# ... (zero-filled gap)
	.word	0xd8000000, 0x000000b0, 0xb8d00000, 0x0000b0d8, 0x # ................
	.word	0xd0000000, 0x00b0d8b8, 0x00000000, 0xb0d8b8d0, 0x # ................
	.word	0x00000000, 0xd8b8d000, 0x000000b0, 0xb8d00000, 0x # ................
	.word	0x0000b0d8, 0xd0000000, 0x00b0d8b8, 0x00000000, 0x # ................
	.word	0xb0d7b8d0, 0x00000000, 0xcab7d000, 0x000000c9, 0x # ................
	.word	0xa8eb0000, 0x0029fa8e, 0xff4b0000, 0xe6e6196b, 0x # ......)...K.k...
	.word	0xf5804b6c, 0x1d0009ce, 0xdffbeaa1, 0x01000c8a, 0x # lK..............
	.word	0x0b001000, 0x09000000, 0x00001000, 0xfc8b0000, 0x # ................
	.word	0x00000075, 0xc5960000, 0x0081d426, 0x00000000, 0x # u.......&.......
	# ... (zero-filled gap)
	.word	0xd8000000, 0x000000b0, 0xb8d00000, 0x0000b0d8, 0x # ................
	.word	0xd0000000, 0x00b0d8b8, 0x00000000, 0xb0d8b8d0, 0x # ................
	.word	0x00000000, 0xd8b8d000, 0x000000b0, 0xb8d00000, 0x # ................
	.word	0x0000b0d8, 0xd0000000, 0x00b0d8b8, 0x00000000, 0x # ................
	.word	0xb0d7b8d0, 0x00000000, 0xcab7d000, 0x000000c9, 0x # ................
	.word	0xa8eb0000, 0x0029fa8e, 0xff4b0000, 0xe6e6196b, 0x # ......)...K.k...
	.word	0xf5804b6c, 0x1d0009ce, 0xdffbeaa1, 0x01000c8a, 0x # lK..............
	.word	0x0b000f00, 0x09000000, 0x00000f00, 0x007cff3c, 0x # ............<.|.
	.word	0x0028ff90, 0x1f400f00, 0x0a402400, 0x00000000, 0x # ..(...@..$@.....
	.word	0x00000000, 0xb0d80000, 0x00000000, 0xd8b8d000, 0x # ................
	.word	0x000000b0, 0xb8d00000, 0x0000b0d8, 0xd0000000, 0x # ................
	.word	0x00b0d8b8, 0x00000000, 0xb0d8b8d0, 0x00000000, 0x # ................
	.word	0xd8b8d000, 0x000000b0, 0xb8d00000, 0x0000b0d8, 0x # ................
	.word	0xd0000000, 0x00b0d7b8, 0x00000000, 0xc9cab7d0, 0x # ................
	.word	0x00000000, 0x8ea8eb00, 0x000029fa, 0x6bff4b00, 0x # .........)...K.k
	.word	0x6ce6e619, 0xcef5804b, 0xa11d0009, 0x8adffbea, 0x # ...lK...........
	.word	0x0000000c, 0x000a0010, 0x000a0000, 0x00000010, 0x # ................
	.word	0x91000000, 0x000033eb, 0x00000000, 0x0029e349, 0x # .....3......I.).
	# ... (zero-filled gap)
	.word	0xff6f0000, 0x00000051, 0x82ff3900, 0x00cce407, 0x # ..o.Q....9......
	.word	0xb5000000, 0x690010f0, 0x000048ff, 0x007eff31, 0x # .......i.H..1.~.
	.word	0xc3e00600, 0xedac0000, 0x0000000e, 0x293fff63, 0x # ............c.?)
	.word	0x000079fd, 0xdc040000, 0x0ceba3ba, 0x00000000, 0x # .y..............
	.word	0xfdff5e00, 0x00000074, 0x03000000, 0x000aeadd, 0x # .^..t...........
	.word	0x00000000, 0xc8c00000, 0x00000000, 0x00000000, 0x # ................
	.word	0x0000c8c0, 0x00000000, 0xc8c00000, 0x00000000, 0x # ................
	.word	0x00000000, 0x0000c8c0, 0x00010000, 0x0009000c, 0x # ................
	.word	0x00080000, 0xd0b8000c, 0x00000000, 0xd0b80000, 0x # ................
	.word	0x00000000, 0xebb80000, 0x4a7d9394, 0xffb80000, 0x # ..........}J....
	.word	0xffffffff, 0xd5b80abc, 0xac331c1c, 0xd0b879ff, 0x # ..........3..y..
	.word	0x07000000, 0xd0b8b9ec, 0x00000000, 0xd0b8b4d6, 0x # ................
	.word	0x40000000, 0xefb868fd, 0xf9bea8a8, 0xe4b80295, 0x # ...@.h..........
	.word	0x25566b6c, 0xd0b80000, 0x00000000, 0xd0b80000, 0x # lkV%............
	.word	0x00000000, 0x00010000, 0x000a000d, 0x00080000, 0x # ................
	.word	0x6200000d, 0x2cc1f5de, 0xff430000, 0xdcd550a0, 0x # ...b...,..C..P..
	.word	0xddb40001, 0xff560002, 0xa7dc001d, 0xff670000, 0x # ......V.......g.
	.word	0x9cec0013, 0xbcd50200, 0x9cec0000, 0x51ff4200, 0x # .............B.Q
	.word	0x9cec0000, 0x55ff4b00, 0x9cec0000, 0xebd20500, 0x # .....K.U........
	.word	0x9cec002d, 0xd71a0000, 0x9cec27ec, 0x1b000000, 0x # -........'......
	.word	0x9cecb4ed, 0x00000000, 0x9cecd1b6, 0x6e4d8d32, 0x # ............2.Mn
	.word	0x9cec92f9, 0xe9f7da44, 0x00000c9a, 0x0009000d, 0x # ....D...........
	.word	0x00080000, 0x0700000d, 0x0011e5b8, 0x00000000, 0x # ................
	.word	0x00a4b808, 0x00000000, 0x00000000, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0xd7f6d768, 0x69000065, 0xa04a7dfd, 0x5f004dff, 0x # h...e..i.}J..M._
	.word	0x0200006d, 0x00009bed, 0x403c2202, 0x3e00b0e5, 0x # m........"<@...>
	.word	0xf4f7ffd9, 0xed04b0fe, 0x000026d2, 0xff20b0dc, 0x # .........&.... .
	.word	0x1000006c, 0xea04b0ef, 0xd3604ccc, 0x4000b3f8, 0x # l........L`....@
	.word	0x57d7f7d0, 0x0000cec6, 0x0009000d, 0x00080000, 0x # ...W............
	.word	0x0000000d, 0xfc490000, 0x00000069, 0x5ae41600, 0x # ......I.i......Z
	# ... (zero-filled gap)
	.word	0xd7f6d768, 0x69000065, 0xa04a7dfd, 0x5f004dff, 0x # h...e..i.}J..M._
	.word	0x0200006d, 0x00009bed, 0x403c2202, 0x3e00b0e5, 0x # m........"<@...>
	.word	0xf4f7ffd9, 0xed04b0fe, 0x000026d2, 0xff20b0dc, 0x # .........&.... .
	.word	0x1000006c, 0xea04b0ef, 0xd3604ccc, 0x4000b3f8, 0x # l........L`....@
	.word	0x57d7f7d0, 0x0000cec6, 0x0009000d, 0x00080000, 0x # ...W............
	.word	0x0000000d, 0x5cf8a304, 0x02000000, 0xe12bb1af, 0x # .......\......+.
	.word	0x00000067, 0x00000000, 0x00000000, 0x00000000, 0x # g...............
	.word	0x00000000, 0xd7f6d768, 0x69000065, 0xa04a7dfd, 0x # ....h...e..i.}J.
	.word	0x5f004dff, 0x0200006d, 0x00009bed, 0x403c2202, 0x # .M._m........"<@
	.word	0x3e00b0e5, 0xf4f7ffd9, 0xed04b0fe, 0x000026d2, 0x # ...>.........&..
	.word	0xff20b0dc, 0x1000006c, 0xea04b0ef, 0xd3604ccc, 0x # .. .l........L`.
	.word	0x4000b3f8, 0x57d7f7d0, 0x0000cec6, 0x0009000d, 0x # ...@...W........
	.word	0x00080000, 0x0000000d, 0x02000000, 0x18000013, 0x # ................
	.word	0xfffffecf, 0x180001d8, 0x3a404054, 0x00000009, 0x # ........T@@:....
	# ... (zero-filled gap)
	.word	0xd7f6d768, 0x69000065, 0xa04a7dfd, 0x5f004dff, 0x # h...e..i.}J..M._
	.word	0x0200006d, 0x00009bed, 0x403c2202, 0x3e00b0e5, 0x # m........"<@...>
	.word	0xf4f7ffd9, 0xed04b0fe, 0x000026d2, 0xff20b0dc, 0x # .........&.... .
	.word	0x1000006c, 0xea04b0ef, 0xd3604ccc, 0x4000b3f8, 0x # l........L`....@
	.word	0x57d7f7d0, 0x0000cec6, 0x0009000c, 0x00080000, 0x # ...W............
	.word	0x5800000c, 0xac0060ff, 0x16000cff, 0x2b001840, 0x # ...X.`......@..+
	.word	0x00000340, 0x00000000, 0x00000000, 0xd7f6d768, 0x # @...........h...
	.word	0x69000065, 0xa04a7dfd, 0x5f004dff, 0x0200006d, 0x # e..i.}J..M._m...
	.word	0x00009bed, 0x403c2202, 0x3e00b0e5, 0xf4f7ffd9, 0x # ....."<@...>....
	.word	0xed04b0fe, 0x000026d2, 0xff20b0dc, 0x1000006c, 0x # .....&.... .l...
	.word	0xea04b0ef, 0xd3604ccc, 0x4000b3f8, 0x57d7f7d0, 0x # .....L`....@...W
	.word	0x0000cec6, 0x0009000d, 0x00080000, 0x0000000d, 0x # ................
	.word	0x45ee9100, 0x00000000, 0xa57ee501, 0x00000000, 0x # ...E......~.....
	.word	0x6cffc400, 0x00000000, 0x00280800, 0x00000000, 0x # ...l......(.....
	.word	0xd7f6d768, 0x69000065, 0xa04a7dfd, 0x5f004dff, 0x # h...e..i.}J..M._
	.word	0x0200006d, 0x00009bed, 0x403c2202, 0x3e00b0e5, 0x # m........"<@...>
	.word	0xf4f7ffd9, 0xed04b0fe, 0x000026d2, 0xff20b0dc, 0x # .........&.... .
	.word	0x1000006c, 0xea04b0ef, 0xd3604ccc, 0x4000b3f8, 0x # l........L`....@
	.word	0x57d7f7d0, 0x0000cec6, 0x000e0009, 0x000e0000, 0x # ...W............
	.word	0x05000009, 0xd6f8df82, 0xf7bf3257, 0x000790e9, 0x # ........W2......
	.word	0x81fe8600, 0xf4fdb24b, 0xf36e50bf, 0x7900008b, 0x # ....K....Pn....y
	.word	0x18000085, 0x000eefff, 0x05f88200, 0x27070000, 0x # ...............'
	.word	0xd5ff3c3b, 0x92585858, 0x640025ff, 0xf4f4ffed, 0x # ;<..XXX..%.d....
	.word	0xdcdcf3ff, 0x2cdcdcdc, 0x13b0fc1f, 0xbcff0000, 0x # .......,........
	.word	0x00000000, 0xff440000, 0x11000048, 0x0014f3ff, 0x # ......D.H.......
	.word	0x00010000, 0x4bc2f718, 0xf1d9dc66, 0x85485bd0, 0x # .......Kf....[H.
	.word	0x520001c6, 0x94e3f8d7, 0xf1b52d13, 0x0061cef7, 0x # ...R.....-....a.
	.word	0x00090000, 0x00000008, 0x000c0008, 0xdc6b0000, 0x # ..............k.
	.word	0x0049cef6, 0x93ff6200, 0x35fca64d, 0x00b3e301, 0x # ..I..b..M..5....
	.word	0x91e30300, 0x0067ff1e, 0x1a1e0000, 0x0053ff38, 0x # ......g.....8.S.
	.word	0x00000000, 0x0066ff1e, 0x00000000, 0x00aee401, 0x # ......f.........
	.word	0x86c30000, 0x8fff6400, 0x3bfb9d4c, 0xff6e0000, 0x # .....d..L..;..n.
	.word	0x0046ccff, 0x3e000000, 0x0000a9d2, 0x00000000, 0x # ..F....>........
	.word	0x0000e757, 0x68000000, 0x000054dd, 0x000d0000, 0x # W......h.T......
	.word	0x00000008, 0x000d0008, 0xd0ce1100, 0x00000005, 0x # ................
	.word	0xce120000, 0x00000084, 0x00000000, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0xdb600000, 0x004ed4f9, 0x8eff6000, 0x25fca84d, 0x # ..`...N..`..M..%
	.word	0x00b3e602, 0x8dea0500, 0x80baff29, 0xb4e48080, 0x # ........).......
	.word	0xc8dbff3a, 0x99c8c8c8, 0x006cff2a, 0x00000000, 0x # :.......*.l.....
	.word	0x00b5eb03, 0x00010000, 0x99ff6c00, 0x58c5634c, 0x # .........l..Lc.X
	.word	0xd8670000, 0x1a9fe9fa, 0x000d0000, 0x00000008, 0x # ..g.............
	.word	0x000d0008, 0x00000000, 0x004ff869, 0x29000000, 0x # ........i.O....)
	.word	0x000042e9, 0x00000000, 0x00000000, 0x00000000, 0x # .B..............
	.word	0x00000000, 0xdb600000, 0x004ed4f9, 0x8eff6000, 0x # ......`...N..`..
	.word	0x25fca84d, 0x00b3e602, 0x8dea0500, 0x80baff29, 0x # M..%........)...
	.word	0xb4e48080, 0xc8dbff3a, 0x99c8c8c8, 0x006cff2a, 0x # ....:.......*.l.
	.word	0x00000000, 0x00b5eb03, 0x00010000, 0x99ff6c00, 0x # .............l..
	.word	0x58c5634c, 0xd8670000, 0x1a9fe9fa, 0x000d0000, 0x # Lc.X..g.........
	.word	0x00000008, 0x000d0008, 0xbc0b0000, 0x000044f1, 0x # .............D..
	.word	0x96c60b00, 0x004ce839, 0x00000000, 0x00000000, 0x # ....9.L.........
	# ... (zero-filled gap)
	.word	0xdb600000, 0x004ed4f9, 0x8eff6000, 0x25fca84d, 0x # ..`...N..`..M..%
	.word	0x00b3e602, 0x8dea0500, 0x80baff29, 0xb4e48080, 0x # ........).......
	.word	0xc8dbff3a, 0x99c8c8c8, 0x006cff2a, 0x00000000, 0x # :.......*.l.....
	.word	0x00b5eb03, 0x00010000, 0x99ff6c00, 0x58c5634c, 0x # .........l..Lc.X
	.word	0xd8670000, 0x1a9fe9fa, 0x000c0000, 0x00000008, 0x # ..g.............
	.word	0x000c0008, 0x40ff7800, 0x00eccc00, 0x10401e00, 0x # .....x.@......@.
	.word	0x003b3300, 0x00000000, 0x00000000, 0xdb600000, 0x # .3;...........`.
	.word	0x004ed4f9, 0x8eff6000, 0x25fca84d, 0x00b3e602, 0x # ..N..`..M..%....
	.word	0x8dea0500, 0x80baff29, 0xb4e48080, 0xc8dbff3a, 0x # ....).......:...
	.word	0x99c8c8c8, 0x006cff2a, 0x00000000, 0x00b5eb03, 0x # ....*.l.........
	.word	0x00010000, 0x99ff6c00, 0x58c5634c, 0xd8670000, 0x # .....l..Lc.X..g.
	.word	0x1a9fe9fa, 0x000dffff, 0x00000004, 0x000d0004, 0x # ................
	.word	0x009aec2f, 0x49ec3000, 0x00000000, 0x00000000, 0x # /....0.I........
	.word	0xbccc0000, 0xbccc0000, 0xbccc0000, 0xbccc0000, 0x # ................
	.word	0xbccc0000, 0xbccc0000, 0xbccc0000, 0xbccc0000, 0x # ................
	.word	0xbccc0000, 0x000d0001, 0x00000004, 0x000d0004, 0x # ................
	.word	0x27e3a400, 0x001eda5b, 0x00000000, 0x00000000, 0x # ...'[...........
	.word	0x0000bccc, 0x0000bccc, 0x0000bccc, 0x0000bccc, 0x # ................
	.word	0x0000bccc, 0x0000bccc, 0x0000bccc, 0x0000bccc, 0x # ................
	.word	0x0000bccc, 0x000dffff, 0x00000004, 0x000d0006, 0x # ................
	.word	0xdade2300, 0xe4270020, 0x24e2655e, 0x00000000, 0x # .#.. .'.^e.$....
	# ... (zero-filled gap)
	.word	0xbccc0000, 0x00000000, 0x0000bccc, 0xbccc0000, 0x # ................
	.word	0x00000000, 0x0000bccc, 0xbccc0000, 0x00000000, 0x # ................
	.word	0x0000bccc, 0xbccc0000, 0x00000000, 0x0000bccc, 0x # ................
	.word	0xbccc0000, 0xffff0000, 0x0004000c, 0x00060000, 0x # ................
	.word	0xffb8000c, 0xacff0c00, 0x0300402e, 0x00002b40, 0x # .........@..@+..
	.word	0x00000000, 0xbccc0000, 0x00000000, 0x0000bccc, 0x # ................
	.word	0xbccc0000, 0x00000000, 0x0000bccc, 0xbccc0000, 0x # ................
	.word	0x00000000, 0x0000bccc, 0xbccc0000, 0x00000000, 0x # ................
	.word	0x0000bccc, 0xbccc0000, 0x00000000, 0x0009000d, 0x # ................
	.word	0x00090000, 0x0000000d, 0x00000000, 0x00000000, 0x # ................
	.word	0xc8610000, 0x1cc7434f, 0x3c000000, 0x4df8ffcf, 0x # ..a.OC.....<...M
	.word	0x0e000000, 0xffb1ea8d, 0x00000067, 0x02148811, 0x # ........g.......
	.word	0x0003e6c3, 0xc8b25400, 0x35ff6c91, 0x9eff8000, 0x # .....T...l.5....
	.word	0xffe68a65, 0x92fc1f56, 0x3f000000, 0xff5f60ff, 0x # e...V......?.`_.
	.word	0x00000034, 0x685eff2a, 0x00002bff, 0x4aff4800, 0x # 4...*.^h.+...H.J
	.word	0x007cff33, 0xf5a80000, 0xfba80010, 0xff994d84, 0x # 3.|..........M..
	.word	0x05000073, 0xd7fae282, 0x01000062, 0x09000d00, 0x # s.......b.......
	.word	0x07000000, 0x00000d00, 0x01000000, 0xb7060113, 0x # ................
	.word	0xeefffffc, 0x42550a17, 0x00113d40, 0x00000000, 0x # ......UB@=......
	.word	0xe0000000, 0xede77488, 0xe7e00fa3, 0xfc764899, 0x # .....t.......Hv.
	.word	0x00bde094, 0xdeb20000, 0x0000a8e0, 0xe0f99200, 0x # ................
	.word	0x000000a8, 0xa8e0fc90, 0x90000000, 0x00a8e0fc, 0x # ................
	.word	0xfc900000, 0x0000a8e0, 0xe0fc9000, 0x000000a8, 0x # ................
	.word	0x0000fc90, 0x0009000d, 0x00090000, 0x0000000d, 0x # ................
	.word	0x0033fb88, 0x00000000, 0xd4880000, 0x00000007, 0x # ..3.............
	# ... (zero-filled gap)
	.word	0xddf9d860, 0x00000070, 0x4f9bff5f, 0x0077ff90, 0x # `...p..._..O..w.
	.word	0x00b8e401, 0xf2a40000, 0x66ff260b, 0x50000000, 0x # .........&.f...P
	.word	0xff393eff, 0x00000050, 0x2750ff39, 0x000066ff, 0x # .>9.P...9.P'.f..
	.word	0x3eff4f00, 0x00b7e602, 0xf3a20000, 0xff63000b, 0x # .O.>..........c.
	.word	0xff8d4e9a, 0x0000007a, 0xdffad962, 0x00000072, 0x # .N..z...b...r...
	.word	0x09000d00, 0x09000000, 0x00000d00, 0x1f000000, 0x # ................
	.word	0x00029cf0, 0x03000000, 0x00008cc4, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0xf9d86000, 0x000070dd, 0x9bff5f00, 0x77ff904f, 0x # .`...p..._..O..w
	.word	0xb8e40100, 0xa4000000, 0xff260bf2, 0x00000066, 0x # ..........&.f...
	.word	0x393eff50, 0x000050ff, 0x50ff3900, 0x0066ff27, 0x # P.>9.P...9.P'.f.
	.word	0xff4f0000, 0xb7e6023e, 0xa2000000, 0x63000bf3, 0x # ..O.>..........c
	.word	0x8d4e9aff, 0x00007aff, 0xfad96200, 0x000072df, 0x # ..N..z...b...r..
	.word	0x000d0000, 0x00000009, 0x000d0009, 0x70000000, 0x # ...............p
	.word	0x00018efb, 0x7a000000, 0x9dc226d6, 0x00000000, 0x # .......z.&......
	# ... (zero-filled gap)
	.word	0xd8600000, 0x0070ddf9, 0xff5f0000, 0xff904f9b, 0x # ..`...p..._..O..
	.word	0xe4010077, 0x000000b8, 0x260bf2a4, 0x000066ff, 0x # w..........&.f..
	.word	0x3eff5000, 0x0050ff39, 0xff390000, 0x66ff2750, 0x # .P.>9.P...9.P'.f
	.word	0x4f000000, 0xe6023eff, 0x000000b7, 0x000bf3a2, 0x # ...O.>..........
	.word	0x4e9aff63, 0x007aff8d, 0xd9620000, 0x0072dffa, 0x # c..N..z...b...r.
	.word	0x0d000000, 0x00000900, 0x0d000900, 0x00000000, 0x # ................
	.word	0x13000000, 0x04000001, 0xfffffbb2, 0x00001cf1, 0x # ................
	.word	0x40425508, 0x0000123d, 0x00000000, 0x00000000, 0x # .UB@=...........
	.word	0x60000000, 0x70ddf9d8, 0x5f000000, 0x904f9bff, 0x # ...`...p..._..O.
	.word	0x010077ff, 0x0000b8e4, 0x0bf2a400, 0x0066ff26, 0x # .w..........&.f.
	.word	0xff500000, 0x50ff393e, 0x39000000, 0xff2750ff, 0x # ..P.>9.P...9.P'.
	.word	0x00000066, 0x023eff4f, 0x0000b7e6, 0x0bf3a200, 0x # f...O.>.........
	.word	0x9aff6300, 0x7aff8d4e, 0x62000000, 0x72dffad9, 0x # .c..N..z...b...r
	.word	0x00000000, 0x0009000c, 0x00090000, 0x2400000c, 0x # ...............$
	.word	0x780094ff, 0x000040ff, 0x00254009, 0x0010401e, 0x # ...x.@...@%..@..
	# ... (zero-filled gap)
	.word	0x60000000, 0x70ddf9d8, 0x5f000000, 0x904f9bff, 0x # ...`...p..._..O.
	.word	0x010077ff, 0x0000b8e4, 0x0bf2a400, 0x0066ff26, 0x # .w..........&.f.
	.word	0xff500000, 0x50ff393e, 0x39000000, 0xff2750ff, 0x # ..P.>9.P...9.P'.
	.word	0x00000066, 0x023eff4f, 0x0000b7e6, 0x0bf3a200, 0x # f...O.>.........
	.word	0x9aff6300, 0x7aff8d4e, 0x62000000, 0x72dffad9, 0x # .c..N..z...b...r
	.word	0x00000000, 0x0009000a, 0x00090000, 0x00000009, 0x # ................
	.word	0x17641f00, 0x00000000, 0xff500000, 0x0000003c, 0x # ..d.......P.<...
	.word	0x0f000000, 0x00000b30, 0x24240f00, 0x24242424, 0x # ....0.....$$$$$$
	.word	0xff700c24, 0xffffffff, 0x245cffff, 0x54545454, 0x # $.p.......\$TTTT
	.word	0x1e545454, 0x02000000, 0x00000108, 0x00000000, 0x # TTT.............
	.word	0x003cff50, 0x00000000, 0x0d381100, 0x00000000, 0x # P.<.......8.....
	.word	0x09000a00, 0x09000000, 0x00000b00, 0x00000000, 0x # ................
	.word	0x007f8000, 0xd8600000, 0x16ebdaf9, 0xff5f0000, 0x # ......`......._.
	.word	0xffb74c9b, 0xe4010072, 0xdb0400b9, 0x2607f1c0, 0x # .L..r..........&
	.word	0x600067ff, 0x3cff51a1, 0x0250ff38, 0xff3928d6, 0x # .g.`.Q.<8.P..(9.
	.word	0x67ff2650, 0x4f00aa55, 0xe6013eff, 0x002fcebb, 0x # P&.gU..O.>..../.
	.word	0x000bf3a2, 0x49dfff63, 0x007aff8d, 0xdcd80000, 0x # ....c..I..z.....
	.word	0x0072dffa, 0xc43e0000, 0x00000000, 0x00010000, 0x # ..r...>.........
	.word	0x0009000d, 0x00070000, 0x8c00000d, 0x000030fa, 0x # .............0..
	.word	0x8c000000, 0x000006d1, 0x00000000, 0x00000000, 0x # ................
	.word	0x00000000, 0xa0e80000, 0x90000000, 0x00a0e8f8, 0x # ................
	.word	0xf8900000, 0x0000a0e8, 0xe8f89000, 0x000000a0, 0x # ................
	.word	0xa0e8f890, 0x90000000, 0x00a5e4f8, 0xf8900000, 0x # ................
	.word	0x0000c4c9, 0x78f8a900, 0x924978fe, 0x8a05f8ed, 0x # .......x.xI.....
	.word	0x7792f0e8, 0x0d0001f8, 0x00000900, 0x0d000700, 0x # ...w............
	.word	0x00000000, 0x0299f122, 0xc7040000, 0x00000089, 0x # ...."...........
	# ... (zero-filled gap)
	.word	0x00a0e800, 0xf8900000, 0x0000a0e8, 0xe8f89000, 0x # ................
	.word	0x000000a0, 0xa0e8f890, 0x90000000, 0x00a0e8f8, 0x # ................
	.word	0xf8900000, 0x0000a5e4, 0xc9f89000, 0x000000c4, 0x # ................
	.word	0xfe78f8a9, 0xed924978, 0xe88a05f8, 0xf87792f0, 0x # ..x.xI........w.
	.word	0x000d0001, 0x00000009, 0x000d0007, 0xfc740000, 0x # ..............t.
	.word	0x0000008b, 0xc526d47e, 0x00000099, 0x00000000, 0x # ....~.&.........
	# ... (zero-filled gap)
	.word	0x0000a0e8, 0xe8f89000, 0x000000a0, 0xa0e8f890, 0x # ................
	.word	0x90000000, 0x00a0e8f8, 0xf8900000, 0x0000a0e8, 0x # ................
	.word	0xe4f89000, 0x000000a5, 0xc4c9f890, 0xa9000000, 0x # ................
	.word	0x78fe78f8, 0xf8ed9249, 0xf0e88a05, 0x01f87792, 0x # .x.xI........w..
	.word	0x09000c00, 0x07000000, 0x28000c00, 0x7c0090ff, 0x # ...........(...|
	.word	0x400a3cff, 0x401f0024, 0x0000000f, 0x00000000, 0x # .<.@$..@........
	.word	0x0000a0e8, 0xe8f89000, 0x000000a0, 0xa0e8f890, 0x # ................
	.word	0x90000000, 0x00a0e8f8, 0xf8900000, 0x0000a0e8, 0x # ................
	.word	0xe4f89000, 0x000000a5, 0xc4c9f890, 0xa9000000, 0x # ................
	.word	0x78fe78f8, 0xf8ed9249, 0xf0e88a05, 0x00f87792, 0x # .x.xI........w..
	.word	0x08000d00, 0x08000000, 0x00001000, 0x99000000, 0x # ................
	.word	0x00002fe8, 0xdf500000, 0x00000024, 0x00000000, 0x # ./....P.$.......
	# ... (zero-filled gap)
	.word	0x9c000000, 0x000018fd, 0x3ca1fb12, 0x00006bff, 0x # ...........<.k..
	.word	0x0045ff60, 0x0000c0da, 0x0003e6b3, 0x0d18fd7b, 0x # `.E.........{...
	.word	0x00008df8, 0x596afd1d, 0x000031ff, 0xacbcba00, 0x # ......jY.1......
	.word	0x000000d5, 0xf5f85a00, 0x00000079, 0xfef00900, 0x # .....Z..y.......
	.word	0x0000001e, 0xc1c40000, 0x00000000, 0x64fe2b00, 0x # .............+.d
	.word	0x05000000, 0x0ae5cb5e, 0x1f000000, 0x0036d5f7, 0x # ....^.........6.
	.word	0x01000000, 0x09000d00, 0x08000000, 0xcc001000, 0x # ................
	.word	0x000000bc, 0xcc000000, 0x000000bc, 0xcc000000, 0x # ................
	.word	0x000000bc, 0xcc000000, 0x000000bc, 0xcc000000, 0x # ................
	.word	0xf3ec82be, 0xcc000ca0, 0x874aa3fe, 0xcc009cfe, 0x # ..........J.....
	.word	0x000001cd, 0xcc16f999, 0x000000bc, 0xcc45ff45, 0x # ............E.E.
	.word	0x000000bc, 0xcc60ff2a, 0x000000bc, 0xcc51ff39, 0x # ....*.`.....9.Q.
	.word	0x000001cc, 0xcc26ff82, 0x7b49a0ff, 0xcc00b3fa, 0x # ......&...I{....
	.word	0xf5ee91c0, 0xcc0014ac, 0x000000bc, 0xcc000000, 0x # ................
	.word	0x000000bc, 0xcc000000, 0x000000bc, 0x00000000, 0x # ................
	.word	0x08000c00, 0x08000000, 0x00000f00, 0x000cffac, 0x # ................
	.word	0x0000b8ff, 0x0003402b, 0x00002e40, 0x00000000, 0x # ....+@..@.......
	.word	0x9c000000, 0x000018fd, 0x3ca1fb12, 0x00006bff, 0x # ...........<.k..
	.word	0x0045ff60, 0x0000c0da, 0x0003e6b3, 0x0d18fd7b, 0x # `.E.........{...
	.word	0x00008df8, 0x596afd1d, 0x000031ff, 0xacbcba00, 0x # ......jY.1......
	.word	0x000000d5, 0xf5f85a00, 0x00000079, 0xfef00900, 0x # .....Z..y.......
	.word	0x0000001e, 0xc1c40000, 0x00000000, 0x64fe2b00, 0x # .............+.d
	.word	0x05000000, 0x0ae5cb5e, 0x1f000000, 0x0036d5f7, 0x # ....^.........6.
# 8001a934:	00000000                                ....

.Lanon.7a8bf03ce3225e035043929a408f9c7c.92:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x6d6f7266, 0x7761725f, 0x # slice::from_raw
	.word	0x7261705f, 0x72207374, 0x69757165, 0x20736572, 0x # _parts requires
	.word	0x20656874, 0x6e696f70, 0x20726574, 0x62206f74, 0x # the pointer to b
	.word	0x6c612065, 0x656e6769, 0x6e612064, 0x6f6e2064, 0x # e aligned and no
	.word	0x756e2d6e, 0x202c6c6c, 0x20646e61, 0x20656874, 0x # n-null, and the
	.word	0x61746f74, 0x6973206c, 0x6f20657a, 0x68742066, 0x # total size of th
	.word	0x6c732065, 0x20656369, 0x20746f6e, 0x65206f74, 0x # e slice not to e
	.word	0x65656378, 0x69602064, 0x657a6973, 0x414d3a3a, 0x # xceed `isize::MA
	.word	0x0a0a6058, 0x73696854, 0x646e6920, 0x74616369, 0x # X`..This indicat
	.word	0x61207365, 0x67756220, 0x206e6920, 0x20656874, 0x # es a bug in the
	.word	0x676f7270, 0x2e6d6172, 0x69685420, 0x6e552073, 0x # program. This Un
	.word	0x69666564, 0x2064656e, 0x61686542, 0x726f6976, 0x # defined Behavior
	.word	0x65686320, 0x69206b63, 0x706f2073, 0x6e6f6974, 0x # check is option
	.word	0x202c6c61, 0x20646e61, 0x6e6e6163, 0x6220746f, 0x # al, and cannot b
	.word	0x65722065, 0x6465696c, 0x206e6f20, 0x20726f66, 0x # e relied on for
	.word	0x65666173, 0x002e7974, 0x # safety..

	.globl anon.aec296b685f742a7405bc8100ce2f275.1.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.1.llvm.14967730159154455495:
	.word	0x80012180, 0x00000072, 0x000003ba, 0x00000020, 0x # .!..r....... ...

	.globl anon.aec296b685f742a7405bc8100ce2f275.3.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.3.llvm.14967730159154455495:
	.word	0x80011d60, 0x0000006e, 0x00000834, 0x00000009, 0x # `...n...4.......

	.globl anon.aec296b685f742a7405bc8100ce2f275.4.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.4.llvm.14967730159154455495:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x6f633a3a, 0x6e5f7970, 0x766f6e6f, 0x # ptr::copy_nonov
	.word	0x616c7265, 0x6e697070, 0x65722067, 0x72697571, 0x # erlapping requir
	.word	0x74207365, 0x20746168, 0x68746f62, 0x696f7020, 0x # es that both poi
	.word	0x7265746e, 0x67726120, 0x6e656d75, 0x61207374, 0x # nter arguments a
	.word	0x61206572, 0x6e67696c, 0x61206465, 0x6e20646e, 0x # re aligned and n
	.word	0x6e2d6e6f, 0x206c6c75, 0x20646e61, 0x20656874, 0x # on-null and the
	.word	0x63657073, 0x65696669, 0x656d2064, 0x79726f6d, 0x # specified memory
	.word	0x6e617220, 0x20736567, 0x6e206f64, 0x6f20746f, 0x # ranges do not o
	.word	0x6c726576, 0x0a0a7061, 0x73696854, 0x646e6920, 0x # verlap..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

	.globl anon.aec296b685f742a7405bc8100ce2f275.5.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.5.llvm.14967730159154455495:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x666f3a3a, 0x74657366, 0x6f72665f, 0x # ptr::offset_fro
	.word	0x6e755f6d, 0x6e676973, 0x72206465, 0x69757165, 0x # m_unsigned requi
	.word	0x20736572, 0x6c657360, 0x3d3e2066, 0x69726f20, 0x # res `self >= ori
	.word	0x606e6967, 0x68540a0a, 0x69207369, 0x6369646e, 0x # gin`..This indic
	.word	0x73657461, 0x62206120, 0x69206775, 0x6874206e, 0x # ates a bug in th
	.word	0x72702065, 0x6172676f, 0x54202e6d, 0x20736968, 0x # e program. This
	.word	0x65646e55, 0x656e6966, 0x65422064, 0x69766168, 0x # Undefined Behavi
	.word	0x6320726f, 0x6b636568, 0x20736920, 0x6974706f, 0x # or check is opti
	.word	0x6c616e6f, 0x6e61202c, 0x61632064, 0x746f6e6e, 0x # onal, and cannot
	.word	0x20656220, 0x696c6572, 0x6f206465, 0x6f66206e, 0x # be relied on fo
	.word	0x61732072, 0x79746566, 0x0000002e, 0x # r safety....

.Lanon.aec296b685f742a7405bc8100ce2f275.11:
	.word	0x80011bd0, 0x0000006d, 0x000002a3, 0x00000016, 0x # ....m...........

.Lanon.aec296b685f742a7405bc8100ce2f275.12:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747320, 0x65673a3a, 0x6e755f74, 0x63656863, 0x # str::get_unchec
	.word	0x2064656b, 0x75716572, 0x73657269, 0x61687420, 0x # ked requires tha
	.word	0x68742074, 0x61722065, 0x2065676e, 0x77207369, 0x # t the range is w
	.word	0x69687469, 0x6874206e, 0x74732065, 0x676e6972, 0x # ithin the string
	.word	0x696c7320, 0x0a0a6563, 0x73696854, 0x646e6920, 0x # slice..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

	.globl anon.aec296b685f742a7405bc8100ce2f275.14.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.14.llvm.14967730159154455495:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x6e696820, 0x613a3a74, 0x72657373, 0x6e755f74, 0x # hint::assert_un
	.word	0x63656863, 0x2064656b, 0x7473756d, 0x76656e20, 0x # checked must nev
	.word	0x62207265, 0x61632065, 0x64656c6c, 0x65687720, 0x # er be called whe
	.word	0x6874206e, 0x6f632065, 0x7469646e, 0x206e6f69, 0x # n the condition
	.word	0x66207369, 0x65736c61, 0x68540a0a, 0x69207369, 0x # is false..This i
	.word	0x6369646e, 0x73657461, 0x62206120, 0x69206775, 0x # ndicates a bug i
	.word	0x6874206e, 0x72702065, 0x6172676f, 0x54202e6d, 0x # n the program. T
	.word	0x20736968, 0x65646e55, 0x656e6966, 0x65422064, 0x # his Undefined Be
	.word	0x69766168, 0x6320726f, 0x6b636568, 0x20736920, 0x # havior check is
	.word	0x6974706f, 0x6c616e6f, 0x6e61202c, 0x61632064, 0x # optional, and ca
	.word	0x746f6e6e, 0x20656220, 0x696c6572, 0x6f206465, 0x # nnot be relied o
	.word	0x6f66206e, 0x61732072, 0x79746566, 0x0000002e, 0x # n for safety....

	.globl anon.aec296b685f742a7405bc8100ce2f275.16.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.16.llvm.14967730159154455495:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x6d6f7266, 0x7761725f, 0x # slice::from_raw
	.word	0x7261705f, 0x72207374, 0x69757165, 0x20736572, 0x # _parts requires
	.word	0x20656874, 0x6e696f70, 0x20726574, 0x62206f74, 0x # the pointer to b
	.word	0x6c612065, 0x656e6769, 0x6e612064, 0x6f6e2064, 0x # e aligned and no
	.word	0x756e2d6e, 0x202c6c6c, 0x20646e61, 0x20656874, 0x # n-null, and the
	.word	0x61746f74, 0x6973206c, 0x6f20657a, 0x68742066, 0x # total size of th
	.word	0x6c732065, 0x20656369, 0x20746f6e, 0x65206f74, 0x # e slice not to e
	.word	0x65656378, 0x69602064, 0x657a6973, 0x414d3a3a, 0x # xceed `isize::MA
	.word	0x0a0a6058, 0x73696854, 0x646e6920, 0x74616369, 0x # X`..This indicat
	.word	0x61207365, 0x67756220, 0x206e6920, 0x20656874, 0x # es a bug in the
	.word	0x676f7270, 0x2e6d6172, 0x69685420, 0x6e552073, 0x # program. This Un
	.word	0x69666564, 0x2064656e, 0x61686542, 0x726f6976, 0x # defined Behavior
	.word	0x65686320, 0x69206b63, 0x706f2073, 0x6e6f6974, 0x # check is option
	.word	0x202c6c61, 0x20646e61, 0x6e6e6163, 0x6220746f, 0x # al, and cannot b
	.word	0x65722065, 0x6465696c, 0x206e6f20, 0x20726f66, 0x # e relied on for
	.word	0x65666173, 0x002e7974, 0x # safety..

	.globl anon.aec296b685f742a7405bc8100ce2f275.17.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.17.llvm.14967730159154455495:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x6d6f7266, 0x7761725f, 0x # slice::from_raw
	.word	0x7261705f, 0x6d5f7374, 0x72207475, 0x69757165, 0x # _parts_mut requi
	.word	0x20736572, 0x20656874, 0x6e696f70, 0x20726574, 0x # res the pointer
	.word	0x62206f74, 0x6c612065, 0x656e6769, 0x6e612064, 0x # to be aligned an
	.word	0x6f6e2064, 0x756e2d6e, 0x202c6c6c, 0x20646e61, 0x # d non-null, and
	.word	0x20656874, 0x61746f74, 0x6973206c, 0x6f20657a, 0x # the total size o
	.word	0x68742066, 0x6c732065, 0x20656369, 0x20746f6e, 0x # f the slice not
	.word	0x65206f74, 0x65656378, 0x69602064, 0x657a6973, 0x # to exceed `isize
	.word	0x414d3a3a, 0x0a0a6058, 0x73696854, 0x646e6920, 0x # ::MAX`..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

	.globl anon.aec296b685f742a7405bc8100ce2f275.19.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.19.llvm.14967730159154455495:
	.word	0x8001185c, 0x00000070, 0x0000008e, 0x00000001, 0x # \...p...........

	.globl anon.aec296b685f742a7405bc8100ce2f275.21.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.21.llvm.14967730159154455495:
	.word	0x800127b0, 0x0000006d, 0x0000020f, 0x00000005, 0x # .'..m...........

	.globl anon.aec296b685f742a7405bc8100ce2f275.22.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.22.llvm.14967730159154455495:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x63655620, 0x65733a3a, 0x656c5f74, 0x6572206e, 0x # Vec::set_len re
	.word	0x72697571, 0x74207365, 0x20746168, 0x5f77656e, 0x # quires that new_
	.word	0x206e656c, 0x63203d3c, 0x63617061, 0x28797469, 0x # len <= capacity(
	.word	0x540a0a29, 0x20736968, 0x69646e69, 0x65746163, 0x # )..This indicate
	.word	0x20612073, 0x20677562, 0x74206e69, 0x70206568, 0x # s a bug in the p
	.word	0x72676f72, 0x202e6d61, 0x73696854, 0x646e5520, 0x # rogram. This Und
	.word	0x6e696665, 0x42206465, 0x76616865, 0x20726f69, 0x # efined Behavior
	.word	0x63656863, 0x7369206b, 0x74706f20, 0x616e6f69, 0x # check is optiona
	.word	0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x65622074, 0x # l, and cannot be
	.word	0x6c657220, 0x20646569, 0x66206e6f, 0x7320726f, 0x # relied on for s
	.word	0x74656661, 0x00002e79, 0x # afety...

	.globl anon.aec296b685f742a7405bc8100ce2f275.24.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.24.llvm.14967730159154455495:
	.word	0x800125b4, 0x00000072, 0x000001a6, 0x00000015, 0x # .%..r...........

.Lanon.aec296b685f742a7405bc8100ce2f275.25:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x5f746567, 0x68636e75, 0x # slice::get_unch
	.word	0x656b6365, 0x65722064, 0x72697571, 0x74207365, 0x # ecked requires t
	.word	0x20746168, 0x20656874, 0x65646e69, 0x73692078, 0x # hat the index is
	.word	0x74697720, 0x206e6968, 0x20656874, 0x63696c73, 0x # within the slic
	.word	0x540a0a65, 0x20736968, 0x69646e69, 0x65746163, 0x # e..This indicate
	.word	0x20612073, 0x20677562, 0x74206e69, 0x70206568, 0x # s a bug in the p
	.word	0x72676f72, 0x202e6d61, 0x73696854, 0x646e5520, 0x # rogram. This Und
	.word	0x6e696665, 0x42206465, 0x76616865, 0x20726f69, 0x # efined Behavior
	.word	0x63656863, 0x7369206b, 0x74706f20, 0x616e6f69, 0x # check is optiona
	.word	0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x65622074, 0x # l, and cannot be
	.word	0x6c657220, 0x20646569, 0x66206e6f, 0x7320726f, 0x # relied on for s
	.word	0x74656661, 0x00002e79, 0x # afety...

.Lanon.aec296b685f742a7405bc8100ce2f275.27:
	.word	0x80012038, 0x00000071, 0x000001b6, 0x00000039, 0x # 8 ..q.......9...

.Lanon.aec296b685f742a7405bc8100ce2f275.28:
	.word	0x80012038, 0x00000071, 0x000001cd, 0x00000037, 0x # 8 ..q.......7...

	.globl anon.aec296b685f742a7405bc8100ce2f275.29.llvm.14967730159154455495
anon.aec296b685f742a7405bc8100ce2f275.29.llvm.14967730159154455495:
	.word	0x80011d60, 0x0000006e, 0x00000c40, 0x0000000d, 0x # `...n...@.......

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.1:
	.word	0x33544146, 0x6f422032, 0x5320746f, 0x6f746365, 0x # FAT32 Boot Secto
	.word	0x6e412072, 0x73796c61, 0x003a7369, 0x # r Analysis:.

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.10:
	.word	0x80012490, 0x0000000c, 0x000002e9, 0x0000001a, 0x # .$..............

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.11:
	.word	0x80012490, 0x0000000c, 0x000002ea, 0x00000021, 0x # .$..........!...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.12:
	.word	0x80012490, 0x0000000c, 0x000002ea, 0x00000046, 0x # .$..........F...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.13:
	.word	0x80012490, 0x0000000c, 0x000002eb, 0x00000034, 0x # .$..........4...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.14:
	.word	0x80012490, 0x0000000c, 0x000002eb, 0x00000033, 0x # .$..........3...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.15:
	.word	0x80012490, 0x0000000c, 0x000002eb, 0x0000001f, 0x # .$..............

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.17:
	.word	0x61766e49, 0x2064696c, 0x73756c63, 0x20726574, 0x # Invalid cluster
# 8001b2e4:	657a6973                                size

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.19:
	.word	0x75736e55, 0x726f7070, 0x20646574, 0x74636573, 0x # Unsupported sect
	.word	0x7320726f, 0x00657a69, 0x # or size.

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.24:
	.word	0x80012490, 0x0000000c, 0x000001e0, 0x0000002f, 0x # .$........../...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.25:
	.word	0x80012490, 0x0000000c, 0x000001e0, 0x00000016, 0x # .$..............

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.26:
	.word	0x80012490, 0x0000000c, 0x000001e4, 0x0000002b, 0x # .$..........+...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.28:
# 8001b330:	0000003f                                ?...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.30:
	.word	0x80012490, 0x0000000c, 0x00000276, 0x00000021, 0x # .$......v...!...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.32:
	.word	0x80012490, 0x0000000c, 0x00000288, 0x00000037, 0x # .$..........7...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.33:
	.word	0x80012490, 0x0000000c, 0x00000288, 0x0000001e, 0x # .$..............

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.34:
	.word	0x80012490, 0x0000000c, 0x0000028f, 0x00000027, 0x # .$..........'...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.35:
	.word	0x80012490, 0x0000000c, 0x0000028f, 0x00000017, 0x # .$..............

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.37:
	.word	0x80012490, 0x0000000c, 0x00000297, 0x00000046, 0x # .$..........F...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.38:
	.word	0x80012490, 0x0000000c, 0x00000297, 0x00000036, 0x # .$..........6...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.39:
	.word	0x80012490, 0x0000000c, 0x000002a1, 0x0000000d, 0x # .$..............

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.41:
	.word	0x6c696146, 0x74206465, 0x6572206f, 0x66206461, 0x # Failed to read f
	.word	0x20656c69, 0x74636573, 0x0000726f, 0x # ile sector..

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.42:
	.word	0x80012490, 0x0000000c, 0x000002b3, 0x00000035, 0x # .$..........5...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.43:
	.word	0x80012490, 0x0000000c, 0x000002b3, 0x0000001c, 0x # .$..............

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.45:
	.word	0x80012490, 0x0000000c, 0x000002be, 0x00000044, 0x # .$..........D...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.47:
	.word	0x6c696146, 0x74206465, 0x6572206f, 0x70206461, 0x # Failed to read p
	.word	0x6e657261, 0x69642074, 0x74636572, 0x2079726f, 0x # arent directory
	.word	0x74636573, 0x0000726f, 0x # sector..

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.48:
	.word	0x80012490, 0x0000000c, 0x00000238, 0x00000033, 0x # .$......8...3...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.49:
	.word	0x80012490, 0x0000000c, 0x00000238, 0x0000001a, 0x # .$......8.......

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.50:
	.word	0x67726154, 0x64207465, 0x63657269, 0x79726f74, 0x # Target directory
	.word	0x746e6520, 0x6e207972, 0x6620746f, 0x646e756f, 0x # entry not found
	.word	0x206e6920, 0x65726170, 0x0000746e, 0x # in parent..

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.52:
	.word	0x61766e49, 0x2064696c, 0x73756c63, 0x20726574, 0x # Invalid cluster
	.word	0x626d756e, 0x66207265, 0x6420726f, 0x63657269, 0x # number for direc
# 8001b494:	79726f74                                tory

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.53:
	.word	0x6c696146, 0x74206465, 0x6572206f, 0x70206461, 0x # Failed to read p
	.word	0x6e657261, 0x69642074, 0x74636572, 0x2079726f, 0x # arent directory
	.word	0x73756c63, 0x00726574, 0x # cluster.

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.72:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x6f633a3a, 0x6e5f7970, 0x766f6e6f, 0x # ptr::copy_nonov
	.word	0x616c7265, 0x6e697070, 0x65722067, 0x72697571, 0x # erlapping requir
	.word	0x74207365, 0x20746168, 0x68746f62, 0x696f7020, 0x # es that both poi
	.word	0x7265746e, 0x67726120, 0x6e656d75, 0x61207374, 0x # nter arguments a
	.word	0x61206572, 0x6e67696c, 0x61206465, 0x6e20646e, 0x # re aligned and n
	.word	0x6e2d6e6f, 0x206c6c75, 0x20646e61, 0x20656874, 0x # on-null and the
	.word	0x63657073, 0x65696669, 0x656d2064, 0x79726f6d, 0x # specified memory
	.word	0x6e617220, 0x20736567, 0x6e206f64, 0x6f20746f, 0x # ranges do not o
	.word	0x6c726576, 0x0a0a7061, 0x73696854, 0x646e6920, 0x # verlap..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.74:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x6d6f7266, 0x7761725f, 0x # slice::from_raw
	.word	0x7261705f, 0x72207374, 0x69757165, 0x20736572, 0x # _parts requires
	.word	0x20656874, 0x6e696f70, 0x20726574, 0x62206f74, 0x # the pointer to b
	.word	0x6c612065, 0x656e6769, 0x6e612064, 0x6f6e2064, 0x # e aligned and no
	.word	0x756e2d6e, 0x202c6c6c, 0x20646e61, 0x20656874, 0x # n-null, and the
	.word	0x61746f74, 0x6973206c, 0x6f20657a, 0x68742066, 0x # total size of th
	.word	0x6c732065, 0x20656369, 0x20746f6e, 0x65206f74, 0x # e slice not to e
	.word	0x65656378, 0x69602064, 0x657a6973, 0x414d3a3a, 0x # xceed `isize::MA
	.word	0x0a0a6058, 0x73696854, 0x646e6920, 0x74616369, 0x # X`..This indicat
	.word	0x61207365, 0x67756220, 0x206e6920, 0x20656874, 0x # es a bug in the
	.word	0x676f7270, 0x2e6d6172, 0x69685420, 0x6e552073, 0x # program. This Un
	.word	0x69666564, 0x2064656e, 0x61686542, 0x726f6976, 0x # defined Behavior
	.word	0x65686320, 0x69206b63, 0x706f2073, 0x6e6f6974, 0x # check is option
	.word	0x202c6c61, 0x20646e61, 0x6e6e6163, 0x6220746f, 0x # al, and cannot b
	.word	0x65722065, 0x6465696c, 0x206e6f20, 0x20726f66, 0x # e relied on for
	.word	0x65666173, 0x002e7974, 0x # safety..

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.76:
	.word	0x8001185c, 0x00000070, 0x0000008e, 0x00000001, 0x # \...p...........

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.78:
	.word	0x800127b0, 0x0000006d, 0x0000020f, 0x00000005, 0x # .'..m...........

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.79:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x63655620, 0x65733a3a, 0x656c5f74, 0x6572206e, 0x # Vec::set_len re
	.word	0x72697571, 0x74207365, 0x20746168, 0x5f77656e, 0x # quires that new_
	.word	0x206e656c, 0x63203d3c, 0x63617061, 0x28797469, 0x # len <= capacity(
	.word	0x540a0a29, 0x20736968, 0x69646e69, 0x65746163, 0x # )..This indicate
	.word	0x20612073, 0x20677562, 0x74206e69, 0x70206568, 0x # s a bug in the p
	.word	0x72676f72, 0x202e6d61, 0x73696854, 0x646e5520, 0x # rogram. This Und
	.word	0x6e696665, 0x42206465, 0x76616865, 0x20726f69, 0x # efined Behavior
	.word	0x63656863, 0x7369206b, 0x74706f20, 0x616e6f69, 0x # check is optiona
	.word	0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x65622074, 0x # l, and cannot be
	.word	0x6c657220, 0x20646569, 0x66206e6f, 0x7320726f, 0x # relied on for s
	.word	0x74656661, 0x00002e79, 0x # afety...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.81:
	.word	0x80011d60, 0x0000006e, 0x00000834, 0x00000009, 0x # `...n...4.......

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.85:
	.word	0x00000000, 0x00000004, 0x00000004, 0x8000df50, 0x # ............P...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.91:
# 8001b7fc:	0000002f                                /...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.92:
	.word	0x68746150, 0x61727420, 0x73726576, 0x66206c61, 0x # Path traversal f
	.word	0x656c6961, 0x00000064, 0x # ailed...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.96:
	.word	0x67726154, 0x64207465, 0x63657269, 0x79726f74, 0x # Target directory
	.word	0x746f6e20, 0x756f6620, 0x6920646e, 0x7563206e, 0x # not found in cu
	.word	0x6e657272, 0x69642074, 0x74636572, 0x0079726f, 0x # rrent directory.

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.100:
	.word	0x746f6f52, 0x72696420, 0x6f746365, 0x72207972, 0x # Root directory r
	.word	0x20646165, 0x63637573, 0x66737365, 0x00006c75, 0x # ead successful..

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.103:
	.word	0x564e493f, 0x44494c41, 0x0000003f, 0x # ?INVALID?...

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.108:
	.word	0x746f6f52, 0x72696420, 0x6f746365, 0x72207972, 0x # Root directory r
	.word	0x20646165, 0x4c494146, 0x00004445, 0x # ead FAILED..

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.109:
	.word	0x48434143, 0x20202045, 0x00202020, 0x # CACHE      .

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.110:
	.word	0x54534554, 0x20544144, 0x00545854, 0x # TESTDAT TXT.

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.112:
	.word	0x656c6946, 0x746f6e20, 0x756f6620, 0x0000646e, 0x # File not found..

.Lanon.cb47b3dc8eca2db727b8fcc250e0e81d.113:
	.word	0x74706d45, 0x61702079, 0x00006874, 0x # Empty path..

	.globl anon.4f3670b34252f595ba15bc6ea6b03f16.1.llvm.9280728237393296864
anon.4f3670b34252f595ba15bc6ea6b03f16.1.llvm.9280728237393296864:
	.word	0x46206f4e, 0x32335441, 0x72617020, 0x69746974, 0x # No FAT32 partiti
	.word	0x66206e6f, 0x646e756f, 0x # on found

.Lanon.4f3670b34252f595ba15bc6ea6b03f16.2:
	.word	0x61766e49, 0x2064696c, 0x2052424d, 0x6e676973, 0x # Invalid MBR sign
	.word	0x72757461, 0x00000065, 0x # ature...

	.globl anon.3973a9c3f4224926bbecf4cad58bd903.0.llvm.1830756879319262441
anon.3973a9c3f4224926bbecf4cad58bd903.0.llvm.1830756879319262441:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x6f633a3a, 0x6e5f7970, 0x766f6e6f, 0x # ptr::copy_nonov
	.word	0x616c7265, 0x6e697070, 0x65722067, 0x72697571, 0x # erlapping requir
	.word	0x74207365, 0x20746168, 0x68746f62, 0x696f7020, 0x # es that both poi
	.word	0x7265746e, 0x67726120, 0x6e656d75, 0x61207374, 0x # nter arguments a
	.word	0x61206572, 0x6e67696c, 0x61206465, 0x6e20646e, 0x # re aligned and n
	.word	0x6e2d6e6f, 0x206c6c75, 0x20646e61, 0x20656874, 0x # on-null and the
	.word	0x63657073, 0x65696669, 0x656d2064, 0x79726f6d, 0x # specified memory
	.word	0x6e617220, 0x20736567, 0x6e206f64, 0x6f20746f, 0x # ranges do not o
	.word	0x6c726576, 0x0a0a7061, 0x73696854, 0x646e6920, 0x # verlap..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

	.globl anon.3973a9c3f4224926bbecf4cad58bd903.2.llvm.1830756879319262441
anon.3973a9c3f4224926bbecf4cad58bd903.2.llvm.1830756879319262441:
	.word	0x800127b0, 0x0000006d, 0x0000020f, 0x00000005, 0x # .'..m...........

	.globl anon.cfdb8b1a0b058270945129b2a202d033.1.llvm.9043321807689535220
anon.cfdb8b1a0b058270945129b2a202d033.1.llvm.9043321807689535220:
	.word	0x800118d0, 0x0000007d, 0x000004b9, 0x00000021, 0x # ....}.......!...

	.globl anon.cfdb8b1a0b058270945129b2a202d033.2.llvm.9043321807689535220
anon.cfdb8b1a0b058270945129b2a202d033.2.llvm.9043321807689535220:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x5f746567, 0x68636e75, 0x # slice::get_unch
	.word	0x656b6365, 0x756d5f64, 0x65722074, 0x72697571, 0x # ecked_mut requir
	.word	0x74207365, 0x20746168, 0x20656874, 0x65646e69, 0x # es that the inde
	.word	0x73692078, 0x74697720, 0x206e6968, 0x20656874, 0x # x is within the
	.word	0x63696c73, 0x540a0a65, 0x20736968, 0x69646e69, 0x # slice..This indi
	.word	0x65746163, 0x20612073, 0x20677562, 0x74206e69, 0x # cates a bug in t
	.word	0x70206568, 0x72676f72, 0x202e6d61, 0x73696854, 0x # he program. This
	.word	0x646e5520, 0x6e696665, 0x42206465, 0x76616865, 0x # Undefined Behav
	.word	0x20726f69, 0x63656863, 0x7369206b, 0x74706f20, 0x # ior check is opt
	.word	0x616e6f69, 0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x # ional, and canno
	.word	0x65622074, 0x6c657220, 0x20646569, 0x66206e6f, 0x # t be relied on f
	.word	0x7320726f, 0x74656661, 0x00002e79, 0x # or safety...

.LJTI0_0:
	.word	0x8000b03e
	.word	0x8000b1e2
	.word	0x8000b100
	.word	0x8000b16c
	.word	0x8000b082

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.0:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x5f746567, 0x68636e75, 0x # slice::get_unch
	.word	0x656b6365, 0x756d5f64, 0x65722074, 0x72697571, 0x # ecked_mut requir
	.word	0x74207365, 0x20746168, 0x20656874, 0x676e6172, 0x # es that the rang
	.word	0x73692065, 0x74697720, 0x206e6968, 0x20656874, 0x # e is within the
	.word	0x63696c73, 0x540a0a65, 0x20736968, 0x69646e69, 0x # slice..This indi
	.word	0x65746163, 0x20612073, 0x20677562, 0x74206e69, 0x # cates a bug in t
	.word	0x70206568, 0x72676f72, 0x202e6d61, 0x73696854, 0x # he program. This
	.word	0x646e5520, 0x6e696665, 0x42206465, 0x76616865, 0x # Undefined Behav
	.word	0x20726f69, 0x63656863, 0x7369206b, 0x74706f20, 0x # ior check is opt
	.word	0x616e6f69, 0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x # ional, and canno
	.word	0x65622074, 0x6c657220, 0x20646569, 0x66206e6f, 0x # t be relied on f
	.word	0x7320726f, 0x74656661, 0x00002e79, 0x # or safety...

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.2:
	.word	0x2064696d, 0x656c203e, 0x0000006e, 0x # mid > len...

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.3:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x6d6f7266, 0x7761725f, 0x # slice::from_raw
	.word	0x7261705f, 0x72207374, 0x69757165, 0x20736572, 0x # _parts requires
	.word	0x20656874, 0x6e696f70, 0x20726574, 0x62206f74, 0x # the pointer to b
	.word	0x6c612065, 0x656e6769, 0x6e612064, 0x6f6e2064, 0x # e aligned and no
	.word	0x756e2d6e, 0x202c6c6c, 0x20646e61, 0x20656874, 0x # n-null, and the
	.word	0x61746f74, 0x6973206c, 0x6f20657a, 0x68742066, 0x # total size of th
	.word	0x6c732065, 0x20656369, 0x20746f6e, 0x65206f74, 0x # e slice not to e
	.word	0x65656378, 0x69602064, 0x657a6973, 0x414d3a3a, 0x # xceed `isize::MA
	.word	0x0a0a6058, 0x73696854, 0x646e6920, 0x74616369, 0x # X`..This indicat
	.word	0x61207365, 0x67756220, 0x206e6920, 0x20656874, 0x # es a bug in the
	.word	0x676f7270, 0x2e6d6172, 0x69685420, 0x6e552073, 0x # program. This Un
	.word	0x69666564, 0x2064656e, 0x61686542, 0x726f6976, 0x # defined Behavior
	.word	0x65686320, 0x69206b63, 0x706f2073, 0x6e6f6974, 0x # check is option
	.word	0x202c6c61, 0x20646e61, 0x6e6e6163, 0x6220746f, 0x # al, and cannot b
	.word	0x65722065, 0x6465696c, 0x206e6f20, 0x20726f66, 0x # e relied on for
	.word	0x65666173, 0x002e7974, 0x # safety..

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.4:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x6d6f7266, 0x7761725f, 0x # slice::from_raw
	.word	0x7261705f, 0x6d5f7374, 0x72207475, 0x69757165, 0x # _parts_mut requi
	.word	0x20736572, 0x20656874, 0x6e696f70, 0x20726574, 0x # res the pointer
	.word	0x62206f74, 0x6c612065, 0x656e6769, 0x6e612064, 0x # to be aligned an
	.word	0x6f6e2064, 0x756e2d6e, 0x202c6c6c, 0x20646e61, 0x # d non-null, and
	.word	0x20656874, 0x61746f74, 0x6973206c, 0x6f20657a, 0x # the total size o
	.word	0x68742066, 0x6c732065, 0x20656369, 0x20746f6e, 0x # f the slice not
	.word	0x65206f74, 0x65656378, 0x69602064, 0x657a6973, 0x # to exceed `isize
	.word	0x414d3a3a, 0x0a0a6058, 0x73696854, 0x646e6920, 0x # ::MAX`..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.5:
	.word	0x65747461, 0x2074706d, 0x6a206f74, 0x206e696f, 0x # attempt to join
	.word	0x6f746e69, 0x6c6f6320, 0x7463656c, 0x206e6f69, 0x # into collection
	.word	0x68746977, 0x6e656c20, 0x75203e20, 0x657a6973, 0x # with len > usize
	.word	0x414d3a3a, 0x00000058, 0x # ::MAX...

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.7:
	.word	0x80011d60, 0x0000006e, 0x00000c40, 0x0000000d, 0x # `...n...@.......

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.9:
	.word	0x80011b10, 0x00000071, 0x0000020c, 0x00000020, 0x # ....q....... ...

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.11:
	.word	0x80012628, 0x0000006a, 0x000000ab, 0x0000000d, 0x # (&..j...........

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.12:
	.word	0x80012628, 0x0000006a, 0x000000b1, 0x00000016, 0x # (&..j...........

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.13:
	.word	0x80011d60, 0x0000006e, 0x00000834, 0x00000009, 0x # `...n...4.......

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.14:
	.word	0x80012628, 0x0000006a, 0x0000009a, 0x0000000a, 0x # (&..j...........

.Lanon.61d1525b0debcfcfb8d1349f0b42844e.15:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x63655620, 0x65733a3a, 0x656c5f74, 0x6572206e, 0x # Vec::set_len re
	.word	0x72697571, 0x74207365, 0x20746168, 0x5f77656e, 0x # quires that new_
	.word	0x206e656c, 0x63203d3c, 0x63617061, 0x28797469, 0x # len <= capacity(
	.word	0x540a0a29, 0x20736968, 0x69646e69, 0x65746163, 0x # )..This indicate
	.word	0x20612073, 0x20677562, 0x74206e69, 0x70206568, 0x # s a bug in the p
	.word	0x72676f72, 0x202e6d61, 0x73696854, 0x646e5520, 0x # rogram. This Und
	.word	0x6e696665, 0x42206465, 0x76616865, 0x20726f69, 0x # efined Behavior
	.word	0x63656863, 0x7369206b, 0x74706f20, 0x616e6f69, 0x # check is optiona
	.word	0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x65622074, 0x # l, and cannot be
	.word	0x6c657220, 0x20646569, 0x66206e6f, 0x7320726f, 0x # relied on for s
	.word	0x74656661, 0x00002e79, 0x # afety...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.1:
	.word	0x80011dd0, 0x00000012, 0x00000072, 0x00000020, 0x # ........r... ...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.2:
	.word	0x80011dd0, 0x00000012, 0x00000074, 0x00000024, 0x # ........t...$...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.3:
	.word	0x80011dd0, 0x00000012, 0x00000079, 0x00000019, 0x # ........y.......

.Lanon.f2adcb6a556d1730d9a0ec662683373c.4:
	.word	0x80011dd0, 0x00000012, 0x00000076, 0x00000026, 0x # ........v...&...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.5:
	.word	0x80011dd0, 0x00000012, 0x00000077, 0x00000041, 0x # ........w...A...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.6:
	.word	0x80011dd0, 0x00000012, 0x00000077, 0x00000019, 0x # ........w.......

.Lanon.f2adcb6a556d1730d9a0ec662683373c.7:
	.word	0x80011dd0, 0x00000012, 0x0000009d, 0x00000020, 0x # ............ ...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.8:
	.word	0x80011dd0, 0x00000012, 0x000000a0, 0x00000028, 0x # ............(...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.9:
	.word	0x80011dd0, 0x00000012, 0x000000a4, 0x0000002b, 0x # ............+...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.10:
	.word	0x80011dd0, 0x00000012, 0x000000a5, 0x0000002d, 0x # ............-...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.11:
	.word	0x80011dd0, 0x00000012, 0x0000008a, 0x00000020, 0x # ............ ...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.12:
	.word	0x80011dd0, 0x00000012, 0x0000008d, 0x00000028, 0x # ............(...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.13:
	.word	0x80011dd0, 0x00000012, 0x00000091, 0x0000002b, 0x # ............+...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.14:
	.word	0x80011dd0, 0x00000012, 0x00000092, 0x0000002d, 0x # ............-...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.15:
	.word	0x80011dd0, 0x00000012, 0x00000061, 0x00000020, 0x # ........a... ...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.16:
	.word	0x80011dd0, 0x00000012, 0x00000063, 0x00000024, 0x # ........c...$...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.17:
	.word	0x80011dd0, 0x00000012, 0x00000068, 0x00000019, 0x # ........h.......

.Lanon.f2adcb6a556d1730d9a0ec662683373c.18:
	.word	0x80011dd0, 0x00000012, 0x00000065, 0x00000026, 0x # ........e...&...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.19:
	.word	0x80011dd0, 0x00000012, 0x00000066, 0x00000041, 0x # ........f...A...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.20:
	.word	0x80011dd0, 0x00000012, 0x00000066, 0x00000019, 0x # ........f.......

.Lanon.f2adcb6a556d1730d9a0ec662683373c.21:
	.word	0x80011dd0, 0x00000012, 0x0000002f, 0x00000020, 0x # ......../... ...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.22:
	.word	0x80011dd0, 0x00000012, 0x00000032, 0x00000028, 0x # ........2...(...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.23:
	.word	0x80011dd0, 0x00000012, 0x00000034, 0x0000002a, 0x # ........4...*...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.24:
	.word	0x80011dd0, 0x00000012, 0x00000035, 0x0000003b, 0x # ........5...;...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.25:
	.word	0x80011dd0, 0x00000012, 0x00000035, 0x0000002c, 0x # ........5...,...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.26:
	.word	0x80011dd0, 0x00000012, 0x00000037, 0x00000019, 0x # ........7.......

.Lanon.f2adcb6a556d1730d9a0ec662683373c.27:
	.word	0x80011dd0, 0x00000012, 0x0000001d, 0x00000020, 0x # ............ ...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.28:
	.word	0x80011dd0, 0x00000012, 0x00000020, 0x00000028, 0x # ........ ...(...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.29:
	.word	0x80011dd0, 0x00000012, 0x00000022, 0x0000002a, 0x # ........"...*...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.30:
	.word	0x80011dd0, 0x00000012, 0x00000023, 0x00000030, 0x # ........#...0...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.31:
	.word	0x80011dd0, 0x00000012, 0x00000024, 0x0000002c, 0x # ........$...,...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.32:
	.word	0x80011dd0, 0x00000012, 0x00000026, 0x00000019, 0x # ........&.......

.Lanon.f2adcb6a556d1730d9a0ec662683373c.33:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x65723a3a, 0x765f6461, 0x74616c6f, 0x # ptr::read_volat
	.word	0x20656c69, 0x75716572, 0x73657269, 0x61687420, 0x # ile requires tha
	.word	0x68742074, 0x6f702065, 0x65746e69, 0x72612072, 0x # t the pointer ar
	.word	0x656d7567, 0x6920746e, 0x6c612073, 0x656e6769, 0x # gument is aligne
	.word	0x540a0a64, 0x20736968, 0x69646e69, 0x65746163, 0x # d..This indicate
	.word	0x20612073, 0x20677562, 0x74206e69, 0x70206568, 0x # s a bug in the p
	.word	0x72676f72, 0x202e6d61, 0x73696854, 0x646e5520, 0x # rogram. This Und
	.word	0x6e696665, 0x42206465, 0x76616865, 0x20726f69, 0x # efined Behavior
	.word	0x63656863, 0x7369206b, 0x74706f20, 0x616e6f69, 0x # check is optiona
	.word	0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x65622074, 0x # l, and cannot be
	.word	0x6c657220, 0x20646569, 0x66206e6f, 0x7320726f, 0x # relied on for s
	.word	0x74656661, 0x00002e79, 0x # afety...

.Lanon.f2adcb6a556d1730d9a0ec662683373c.34:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x72773a3a, 0x5f657469, 0x616c6f76, 0x # ptr::write_vola
	.word	0x656c6974, 0x71657220, 0x65726975, 0x68742073, 0x # tile requires th
	.word	0x74207461, 0x70206568, 0x746e696f, 0x61207265, 0x # at the pointer a
	.word	0x6d756772, 0x20746e65, 0x61207369, 0x6e67696c, 0x # rgument is align
	.word	0x0a0a6465, 0x73696854, 0x646e6920, 0x74616369, 0x # ed..This indicat
	.word	0x61207365, 0x67756220, 0x206e6920, 0x20656874, 0x # es a bug in the
	.word	0x676f7270, 0x2e6d6172, 0x69685420, 0x6e552073, 0x # program. This Un
	.word	0x69666564, 0x2064656e, 0x61686542, 0x726f6976, 0x # defined Behavior
	.word	0x65686320, 0x69206b63, 0x706f2073, 0x6e6f6974, 0x # check is option
	.word	0x202c6c61, 0x20646e61, 0x6e6e6163, 0x6220746f, 0x # al, and cannot b
	.word	0x65722065, 0x6465696c, 0x206e6f20, 0x20726f66, 0x # e relied on for
	.word	0x65666173, 0x002e7974, 0x # safety..

	.globl anon.471f2b5e420710f931278ee49773962a.1.llvm.880628967740171352
anon.471f2b5e420710f931278ee49773962a.1.llvm.880628967740171352:
	.word	0x800124a0, 0x00000081, 0x000000c6, 0x00000027, 0x # .$..........'...

.Lanon.6afbde2820a9363c4000257edad1edf7.23:
	.word	0x63204453, 0x20647261, 0x20746f6e, 0x74696e69, 0x # SD card not init
	.word	0x696c6169, 0x0064657a, 0x # ialized.

.Lanon.6afbde2820a9363c4000257edad1edf7.24:
	.word	0x20414d44, 0x656d6974, 0x2074756f, 0x656e202d, 0x # DMA timeout - ne
	.word	0x20726576, 0x706d6f63, 0x6574656c, 0x00002164, 0x # ver completed!..

.Lanon.6afbde2820a9363c4000257edad1edf7.25:
	.word	0x20414d44, 0x6e617274, 0x72656673, 0x6d697420, 0x # DMA transfer tim
# 8001c3a4:	74756f65                                eout

.Lanon.6afbde2820a9363c4000257edad1edf7.26:
	.word	0x63204453, 0x20647261, 0x64616572, 0x69616620, 0x # SD card read fai
# 8001c3b8:	0064656c                                led.

.Lanon.6afbde2820a9363c4000257edad1edf7.27:
	.word	0x54494e49, 0x5f35315f, 0x4c494146, 0x203a4445, 0x # INIT_15_FAILED:
	.word	0x31444d43, 0x45532036, 0x4c425f54, 0x4c4b434f, 0x # CMD16 SET_BLOCKL
	.word	0x74204e45, 0x3135206f, 0x00000032, 0x # EN to 512...

.Lanon.6afbde2820a9363c4000257edad1edf7.30:
	.word	0x80012444, 0x0000000d, 0x000004b2, 0x0000002e, 0x # D$..............

.Lanon.6afbde2820a9363c4000257edad1edf7.31:
	.word	0x80012444, 0x0000000d, 0x000004bc, 0x00000022, 0x # D$.........."...

.Lanon.6afbde2820a9363c4000257edad1edf7.33:
	.word	0x746c754d, 0x65732d69, 0x726f7463, 0x61657220, 0x # Multi-sector rea
	.word	0x61662064, 0x64656c69, 0x # d failed

.Lanon.6afbde2820a9363c4000257edad1edf7.61:
	.word	0x80012444, 0x0000000d, 0x00000105, 0x00000011, 0x # D$..............

.Lanon.6afbde2820a9363c4000257edad1edf7.62:
	.word	0x6c697453, 0x6177206c, 0x6e697469, 0x6f662067, 0x # Still waiting fo
	.word	0x6f632072, 0x6e616d6d, 0x6f632064, 0x656c706d, 0x # r command comple
	.word	0x6e6f6974, 0x002e2e2e, 0x # tion....

.Lanon.6afbde2820a9363c4000257edad1edf7.63:
	.word	0x6e657645, 0x65722074, 0x74736967, 0x73207265, 0x # Event register s
	.word	0x73776f68, 0x43524320, 0x52524520, 0x6620524f, 0x # hows CRC ERROR f
	.word	0x2067616c, 0x74696228, 0x00293320, 0x # lag (bit 3).

.Lanon.6afbde2820a9363c4000257edad1edf7.64:
	.word	0x6e657645, 0x65722074, 0x74736967, 0x73207265, 0x # Event register s
	.word	0x73776f68, 0x4d495420, 0x54554f45, 0x616c6620, 0x # hows TIMEOUT fla
	.word	0x62282067, 0x32207469, 0x00000029, 0x # g (bit 2)...

.Lanon.6afbde2820a9363c4000257edad1edf7.66:
	.word	0x80012444, 0x0000000d, 0x000003b1, 0x00000048, 0x # D$..........H...

.Lanon.6afbde2820a9363c4000257edad1edf7.67:
	.word	0x31444d43, 0x49203a37, 0x5245544e, 0x204c414e, 0x # CMD17: INTERNAL
	.word	0x4c494146, 0x00455255, 0x # FAILURE.

.Lanon.6afbde2820a9363c4000257edad1edf7.72:
	.word	0x80012444, 0x0000000d, 0x000003f5, 0x00000050, 0x # D$..........P...

.Lanon.6afbde2820a9363c4000257edad1edf7.73:
	.word	0x31444d43, 0x44203a38, 0x63657269, 0x4d442074, 0x # CMD18: Direct DM
	.word	0x65732041, 0x00707574, 0x # A setup.

.Lanon.6afbde2820a9363c4000257edad1edf7.75:
	.word	0x65726944, 0x44207463, 0x7320414d, 0x65636375, 0x # Direct DMA succe
	.word	0x64656465, 0x6572202c, 0x6e727574, 0x20676e69, 0x # eded, returning
	.word	0x6c726165, 0x00000079, 0x # early...

.Lanon.6afbde2820a9363c4000257edad1edf7.76:
	.word	0x65726944, 0x44207463, 0x7420414d, 0x6f656d69, 0x # Direct DMA timeo
# 8001c538:	00007475                                ut..

.Lanon.6afbde2820a9363c4000257edad1edf7.77:
	.word	0x65726944, 0x44207463, 0x6320414d, 0x616d6d6f, 0x # Direct DMA comma
	.word	0x6620646e, 0x656c6961, 0x00000064, 0x # nd failed...

.Lanon.6afbde2820a9363c4000257edad1edf7.78:
	.word	0x65726944, 0x44207463, 0x6620414d, 0x656c6961, 0x # Direct DMA faile
	.word	0x66202c64, 0x696c6c61, 0x6220676e, 0x206b6361, 0x # d, falling back
	.word	0x53206f74, 0x204d4152, 0x6e756863, 0x676e696b, 0x # to SRAM chunking

.Lanon.6afbde2820a9363c4000257edad1edf7.79:
	.word	0x6e697355, 0x52532067, 0x63204d41, 0x6b6e7568, 0x # Using SRAM chunk
	.word	0x20676e69, 0x6874656d, 0x0000646f, 0x # ing method..

.Lanon.6afbde2820a9363c4000257edad1edf7.82:
	.word	0x80012444, 0x0000000d, 0x00000455, 0x0000004e, 0x # D$......U...N...

.Lanon.6afbde2820a9363c4000257edad1edf7.83:
	.word	0x80012444, 0x0000000d, 0x00000488, 0x0000000d, 0x # D$..............

.Lanon.6afbde2820a9363c4000257edad1edf7.84:
	.word	0x80012444, 0x0000000d, 0x0000048a, 0x0000000d, 0x # D$..............

.Lanon.6afbde2820a9363c4000257edad1edf7.85:
	.word	0x80012444, 0x0000000d, 0x0000046d, 0x00000020, 0x # D$......m... ...

.Lanon.6afbde2820a9363c4000257edad1edf7.88:
	.word	0x6c696146, 0x74206465, 0x6573206f, 0x6c622074, 0x # Failed to set bl
	.word	0x206b636f, 0x676e656c, 0x66206874, 0x6d20726f, 0x # ock length for m
	.word	0x69746c75, 0x6f6c622d, 0x72206b63, 0x00646165, 0x # ulti-block read.

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.0.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.0.llvm.7710812085696039936:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x5f746567, 0x68636e75, 0x # slice::get_unch
	.word	0x656b6365, 0x65722064, 0x72697571, 0x74207365, 0x # ecked requires t
	.word	0x20746168, 0x20656874, 0x676e6172, 0x73692065, 0x # hat the range is
	.word	0x74697720, 0x206e6968, 0x20656874, 0x63696c73, 0x # within the slic
	.word	0x540a0a65, 0x20736968, 0x69646e69, 0x65746163, 0x # e..This indicate
	.word	0x20612073, 0x20677562, 0x74206e69, 0x70206568, 0x # s a bug in the p
	.word	0x72676f72, 0x202e6d61, 0x73696854, 0x646e5520, 0x # rogram. This Und
	.word	0x6e696665, 0x42206465, 0x76616865, 0x20726f69, 0x # efined Behavior
	.word	0x63656863, 0x7369206b, 0x74706f20, 0x616e6f69, 0x # check is optiona
	.word	0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x65622074, 0x # l, and cannot be
	.word	0x6c657220, 0x20646569, 0x66206e6f, 0x7320726f, 0x # relied on for s
	.word	0x74656661, 0x00002e79, 0x # afety...

.Lanon.3839376bf29ad69682d1272c1c63f1dd.1:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x5f746567, 0x68636e75, 0x # slice::get_unch
	.word	0x656b6365, 0x756d5f64, 0x65722074, 0x72697571, 0x # ecked_mut requir
	.word	0x74207365, 0x20746168, 0x20656874, 0x676e6172, 0x # es that the rang
	.word	0x73692065, 0x74697720, 0x206e6968, 0x20656874, 0x # e is within the
	.word	0x63696c73, 0x540a0a65, 0x20736968, 0x69646e69, 0x # slice..This indi
	.word	0x65746163, 0x20612073, 0x20677562, 0x74206e69, 0x # cates a bug in t
	.word	0x70206568, 0x72676f72, 0x202e6d61, 0x73696854, 0x # he program. This
	.word	0x646e5520, 0x6e696665, 0x42206465, 0x76616865, 0x # Undefined Behav
	.word	0x20726f69, 0x63656863, 0x7369206b, 0x74706f20, 0x # ior check is opt
	.word	0x616e6f69, 0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x # ional, and canno
	.word	0x65622074, 0x6c657220, 0x20646569, 0x66206e6f, 0x # t be relied on f
	.word	0x7320726f, 0x74656661, 0x00002e79, 0x # or safety...

.Lanon.3839376bf29ad69682d1272c1c63f1dd.2:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x6e6f4e20, 0x6f72655a, 0x656e3a3a, 0x6e755f77, 0x # NonZero::new_un
	.word	0x63656863, 0x2064656b, 0x75716572, 0x73657269, 0x # checked requires
	.word	0x65687420, 0x67726120, 0x6e656d75, 0x6f742074, 0x # the argument to
	.word	0x20656220, 0x2d6e6f6e, 0x6f72657a, 0x68540a0a, 0x # be non-zero..Th
	.word	0x69207369, 0x6369646e, 0x73657461, 0x62206120, 0x # is indicates a b
	.word	0x69206775, 0x6874206e, 0x72702065, 0x6172676f, 0x # ug in the progra
	.word	0x54202e6d, 0x20736968, 0x65646e55, 0x656e6966, 0x # m. This Undefine
	.word	0x65422064, 0x69766168, 0x6320726f, 0x6b636568, 0x # d Behavior check
	.word	0x20736920, 0x6974706f, 0x6c616e6f, 0x6e61202c, 0x # is optional, an
	.word	0x61632064, 0x746f6e6e, 0x20656220, 0x696c6572, 0x # d cannot be reli
	.word	0x6f206465, 0x6f66206e, 0x61732072, 0x79746566, 0x # ed on for safety
# 8001c898:	0000002e                                ....

.Lanon.3839376bf29ad69682d1272c1c63f1dd.3:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x6f633a3a, 0x6e5f7970, 0x766f6e6f, 0x # ptr::copy_nonov
	.word	0x616c7265, 0x6e697070, 0x65722067, 0x72697571, 0x # erlapping requir
	.word	0x74207365, 0x20746168, 0x68746f62, 0x696f7020, 0x # es that both poi
	.word	0x7265746e, 0x67726120, 0x6e656d75, 0x61207374, 0x # nter arguments a
	.word	0x61206572, 0x6e67696c, 0x61206465, 0x6e20646e, 0x # re aligned and n
	.word	0x6e2d6e6f, 0x206c6c75, 0x20646e61, 0x20656874, 0x # on-null and the
	.word	0x63657073, 0x65696669, 0x656d2064, 0x79726f6d, 0x # specified memory
	.word	0x6e617220, 0x20736567, 0x6e206f64, 0x6f20746f, 0x # ranges do not o
	.word	0x6c726576, 0x0a0a7061, 0x73696854, 0x646e6920, 0x # verlap..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

.Lanon.3839376bf29ad69682d1272c1c63f1dd.5:
	.word	0x80012820, 0x00000082, 0x000001a0, 0x0000002e, 0x # (..............

.Lanon.3839376bf29ad69682d1272c1c63f1dd.9:
	.word	0x800118d0, 0x0000007d, 0x000001ee, 0x00000039, 0x # ....}.......9...

.Lanon.3839376bf29ad69682d1272c1c63f1dd.10:
	.word	0x65737361, 0x6f697472, 0x6166206e, 0x64656c69, 0x # assertion failed
	.word	0x6465203a, 0x682e6567, 0x68676965, 0x3d3d2074, 0x # : edge.height ==
	.word	0x6c657320, 0x65682e66, 0x74686769, 0x31202d20, 0x # self.height - 1

.Lanon.3839376bf29ad69682d1272c1c63f1dd.11:
	.word	0x800118d0, 0x0000007d, 0x000002b6, 0x00000009, 0x # ....}...........

.Lanon.3839376bf29ad69682d1272c1c63f1dd.13:
	.word	0x800118d0, 0x0000007d, 0x0000020c, 0x0000003e, 0x # ....}.......>...

.Lanon.3839376bf29ad69682d1272c1c63f1dd.14:
	.word	0x800118d0, 0x0000007d, 0x000000f0, 0x0000004d, 0x # ....}.......M...

.Lanon.3839376bf29ad69682d1272c1c63f1dd.16:
	.word	0x65737361, 0x6f697472, 0x6166206e, 0x64656c69, 0x # assertion failed
	.word	0x7273203a, 0x656c2e63, 0x2029286e, 0x64203d3d, 0x # : src.len() == d
	.word	0x6c2e7473, 0x29286e65, 0x # st.len()

.Lanon.3839376bf29ad69682d1272c1c63f1dd.17:
	.word	0x800118d0, 0x0000007d, 0x00000754, 0x00000005, 0x # ....}...T.......

.Lanon.3839376bf29ad69682d1272c1c63f1dd.18:
	.word	0x800127b0, 0x0000006d, 0x0000020f, 0x00000005, 0x # .'..m...........

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.19.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.19.llvm.7710812085696039936:
	.word	0x800118d0, 0x0000007d, 0x00000472, 0x0000001c, 0x # ....}...r.......

.Lanon.3839376bf29ad69682d1272c1c63f1dd.20:
	.word	0x800118d0, 0x0000007d, 0x000004d0, 0x00000023, 0x # ....}.......#...

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.21.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.21.llvm.7710812085696039936:
	.word	0x800118d0, 0x0000007d, 0x0000048b, 0x00000021, 0x # ....}.......!...

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.22.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.22.llvm.7710812085696039936:
	.word	0x800118d0, 0x0000007d, 0x00000464, 0x00000024, 0x # ....}...d...$...

.Lanon.3839376bf29ad69682d1272c1c63f1dd.24:
	.word	0x80011b10, 0x00000071, 0x0000020c, 0x00000020, 0x # ....q....... ...

.Lanon.3839376bf29ad69682d1272c1c63f1dd.25:
	.word	0x800118d0, 0x0000007d, 0x00000517, 0x0000001a, 0x # ....}...........

.Lanon.3839376bf29ad69682d1272c1c63f1dd.26:
	.word	0x800118d0, 0x0000007d, 0x00000513, 0x00000024, 0x # ....}.......$...

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.27.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.27.llvm.7710812085696039936:
	.word	0x800118d0, 0x0000007d, 0x0000045b, 0x00000031, 0x # ....}...[...1...

.Lanon.3839376bf29ad69682d1272c1c63f1dd.28:
	.word	0x65737361, 0x6f697472, 0x6166206e, 0x64656c69, 0x # assertion failed
	.word	0x6465203a, 0x682e6567, 0x68676965, 0x3d3d2074, 0x # : edge.height ==
	.word	0x6c657320, 0x6f6e2e66, 0x682e6564, 0x68676965, 0x # self.node.heigh
	.word	0x202d2074, 0x00000031, 0x # t - 1...

.Lanon.3839376bf29ad69682d1272c1c63f1dd.29:
	.word	0x800118d0, 0x0000007d, 0x00000403, 0x00000009, 0x # ....}...........

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.30.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.30.llvm.7710812085696039936:
	.word	0x80011b10, 0x00000071, 0x00000206, 0x00000020, 0x # ....q....... ...

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.32.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.32.llvm.7710812085696039936:
	.word	0x800124a0, 0x00000081, 0x00000258, 0x00000030, 0x # .$......X...0...

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.33.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.33.llvm.7710812085696039936:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x5f746567, 0x68636e75, 0x # slice::get_unch
	.word	0x656b6365, 0x65722064, 0x72697571, 0x74207365, 0x # ecked requires t
	.word	0x20746168, 0x20656874, 0x65646e69, 0x73692078, 0x # hat the index is
	.word	0x74697720, 0x206e6968, 0x20656874, 0x63696c73, 0x # within the slic
	.word	0x540a0a65, 0x20736968, 0x69646e69, 0x65746163, 0x # e..This indicate
	.word	0x20612073, 0x20677562, 0x74206e69, 0x70206568, 0x # s a bug in the p
	.word	0x72676f72, 0x202e6d61, 0x73696854, 0x646e5520, 0x # rogram. This Und
	.word	0x6e696665, 0x42206465, 0x76616865, 0x20726f69, 0x # efined Behavior
	.word	0x63656863, 0x7369206b, 0x74706f20, 0x616e6f69, 0x # check is optiona
	.word	0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x65622074, 0x # l, and cannot be
	.word	0x6c657220, 0x20646569, 0x66206e6f, 0x7320726f, 0x # relied on for s
	.word	0x74656661, 0x00002e79, 0x # afety...

	.globl anon.3839376bf29ad69682d1272c1c63f1dd.34.llvm.7710812085696039936
anon.3839376bf29ad69682d1272c1c63f1dd.34.llvm.7710812085696039936:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x696c7320, 0x3a3a6563, 0x5f746567, 0x68636e75, 0x # slice::get_unch
	.word	0x656b6365, 0x756d5f64, 0x65722074, 0x72697571, 0x # ecked_mut requir
	.word	0x74207365, 0x20746168, 0x20656874, 0x65646e69, 0x # es that the inde
	.word	0x73692078, 0x74697720, 0x206e6968, 0x20656874, 0x # x is within the
	.word	0x63696c73, 0x540a0a65, 0x20736968, 0x69646e69, 0x # slice..This indi
	.word	0x65746163, 0x20612073, 0x20677562, 0x74206e69, 0x # cates a bug in t
	.word	0x70206568, 0x72676f72, 0x202e6d61, 0x73696854, 0x # he program. This
	.word	0x646e5520, 0x6e696665, 0x42206465, 0x76616865, 0x # Undefined Behav
	.word	0x20726f69, 0x63656863, 0x7369206b, 0x74706f20, 0x # ior check is opt
	.word	0x616e6f69, 0x61202c6c, 0x6320646e, 0x6f6e6e61, 0x # ional, and canno
	.word	0x65622074, 0x6c657220, 0x20646569, 0x66206e6f, 0x # t be relied on f
	.word	0x7320726f, 0x74656661, 0x00002e79, 0x # or safety...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.1.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.1.llvm.14406403243838317486:
	.word	0x80012180, 0x00000072, 0x000003ba, 0x00000020, 0x # .!..r....... ...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.3.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.3.llvm.14406403243838317486:
	.word	0x80011f80, 0x00000072, 0x000000ef, 0x00000012, 0x # ....r...........

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.4.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.4.llvm.14406403243838317486:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747020, 0x666f3a3a, 0x74657366, 0x6f72665f, 0x # ptr::offset_fro
	.word	0x6e755f6d, 0x6e676973, 0x72206465, 0x69757165, 0x # m_unsigned requi
	.word	0x20736572, 0x6c657360, 0x3d3e2066, 0x69726f20, 0x # res `self >= ori
	.word	0x606e6967, 0x68540a0a, 0x69207369, 0x6369646e, 0x # gin`..This indic
	.word	0x73657461, 0x62206120, 0x69206775, 0x6874206e, 0x # ates a bug in th
	.word	0x72702065, 0x6172676f, 0x54202e6d, 0x20736968, 0x # e program. This
	.word	0x65646e55, 0x656e6966, 0x65422064, 0x69766168, 0x # Undefined Behavi
	.word	0x6320726f, 0x6b636568, 0x20736920, 0x6974706f, 0x # or check is opti
	.word	0x6c616e6f, 0x6e61202c, 0x61632064, 0x746f6e6e, 0x # onal, and cannot
	.word	0x20656220, 0x696c6572, 0x6f206465, 0x6f66206e, 0x # be relied on fo
	.word	0x61732072, 0x79746566, 0x0000002e, 0x # r safety....

.Lanon.20b29b1f91e363e9fbd85f55f7c77062.6:
	.word	0x80011f08, 0x00000075, 0x00000030, 0x00000024, 0x # ....u...0...$...

.Lanon.20b29b1f91e363e9fbd85f55f7c77062.7:
	.word	0x80011f08, 0x00000075, 0x00000037, 0x00000028, 0x # ....u...7...(...

.Lanon.20b29b1f91e363e9fbd85f55f7c77062.8:
	.word	0x80011f08, 0x00000075, 0x0000003f, 0x0000002c, 0x # ....u...?...,...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.9.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.9.llvm.14406403243838317486:
	.word	0x80011f08, 0x00000075, 0x0000005d, 0x00000029, 0x # ....u...]...)...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.10.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.10.llvm.14406403243838317486:
	.word	0x80011f08, 0x00000075, 0x00000062, 0x0000002d, 0x # ....u...b...-...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.11.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.11.llvm.14406403243838317486:
	.word	0x80011f08, 0x00000075, 0x00000067, 0x00000031, 0x # ....u...g...1...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.13.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.13.llvm.14406403243838317486:
	.word	0x80011bd0, 0x0000006d, 0x000002a3, 0x00000016, 0x # ....m...........

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.14.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.14.llvm.14406403243838317486:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x72747320, 0x65673a3a, 0x6e755f74, 0x63656863, 0x # str::get_unchec
	.word	0x2064656b, 0x75716572, 0x73657269, 0x61687420, 0x # ked requires tha
	.word	0x68742074, 0x61722065, 0x2065676e, 0x77207369, 0x # t the range is w
	.word	0x69687469, 0x6874206e, 0x74732065, 0x676e6972, 0x # ithin the string
	.word	0x696c7320, 0x0a0a6563, 0x73696854, 0x646e6920, 0x # slice..This ind
	.word	0x74616369, 0x61207365, 0x67756220, 0x206e6920, 0x # icates a bug in
	.word	0x20656874, 0x676f7270, 0x2e6d6172, 0x69685420, 0x # the program. Thi
	.word	0x6e552073, 0x69666564, 0x2064656e, 0x61686542, 0x # s Undefined Beha
	.word	0x726f6976, 0x65686320, 0x69206b63, 0x706f2073, 0x # vior check is op
	.word	0x6e6f6974, 0x202c6c61, 0x20646e61, 0x6e6e6163, 0x # tional, and cann
	.word	0x6220746f, 0x65722065, 0x6465696c, 0x206e6f20, 0x # ot be relied on
	.word	0x20726f66, 0x65666173, 0x002e7974, 0x # for safety..

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.15.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.15.llvm.14406403243838317486:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x766e6920, 0x64696c61, 0x6c617620, 0x66206575, 0x # invalid value f
	.word	0x6020726f, 0x72616863, 0x540a0a60, 0x20736968, 0x # or `char`..This
	.word	0x69646e69, 0x65746163, 0x20612073, 0x20677562, 0x # indicates a bug
	.word	0x74206e69, 0x70206568, 0x72676f72, 0x202e6d61, 0x # in the program.
	.word	0x73696854, 0x646e5520, 0x6e696665, 0x42206465, 0x # This Undefined B
	.word	0x76616865, 0x20726f69, 0x63656863, 0x7369206b, 0x # ehavior check is
	.word	0x74706f20, 0x616e6f69, 0x61202c6c, 0x6320646e, 0x # optional, and c
	.word	0x6f6e6e61, 0x65622074, 0x6c657220, 0x20646569, 0x # annot be relied
	.word	0x66206e6f, 0x7320726f, 0x74656661, 0x00002e79, 0x # on for safety...

	.globl anon.20b29b1f91e363e9fbd85f55f7c77062.16.llvm.14406403243838317486
anon.20b29b1f91e363e9fbd85f55f7c77062.16.llvm.14406403243838317486:
	.word	0x61736e75, 0x70206566, 0x6f636572, 0x7469646e, 0x # unsafe precondit
	.word	0x286e6f69, 0x76202973, 0x616c6f69, 0x3a646574, 0x # ion(s) violated:
	.word	0x6e696820, 0x753a3a74, 0x6165726e, 0x62616863, 0x # hint::unreachab
	.word	0x755f656c, 0x6568636e, 0x64656b63, 0x73756d20, 0x # le_unchecked mus
	.word	0x656e2074, 0x20726576, 0x72206562, 0x68636165, 0x # t never be reach
	.word	0x0a0a6465, 0x73696854, 0x646e6920, 0x74616369, 0x # ed..This indicat
	.word	0x61207365, 0x67756220, 0x206e6920, 0x20656874, 0x # es a bug in the
	.word	0x676f7270, 0x2e6d6172, 0x69685420, 0x6e552073, 0x # program. This Un
	.word	0x69666564, 0x2064656e, 0x61686542, 0x726f6976, 0x # defined Behavior
	.word	0x65686320, 0x69206b63, 0x706f2073, 0x6e6f6974, 0x # check is option
	.word	0x202c6c61, 0x20646e61, 0x6e6e6163, 0x6220746f, 0x # al, and cannot b
	.word	0x65722065, 0x6465696c, 0x206e6f20, 0x20726f66, 0x # e relied on for
	.word	0x65666173, 0x002e7974, 0x # safety..

.Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.2:
	.word	0x800119bc, 0x0000004a, 0x00000236, 0x00000009, 0x # ....J...6.......

.Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.7:
	.word	0x6f727245, 0x00000072, 0x # Error...

.Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.15:
	.word	0x8000e348, 0x0000000c, 0x00000004, 0x8000e468, 0x # H...........h...
	.word	0x8000e374, 0x8000e334, 0x # t...4...

.Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.16:
	# ... (zero-filled gap)
	.word	0x00000001, 0x8000e35c, 0x # ....\...

.Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.17:
	.word	0x6f662061, 0x74616d72, 0x676e6974, 0x61727420, 0x # a formatting tra
	.word	0x69207469, 0x656c706d, 0x746e656d, 0x6f697461, 0x # it implementatio
	.word	0x6572206e, 0x6e727574, 0x61206465, 0x7265206e, 0x # n returned an er
	.word	0x20726f72, 0x6e656877, 0x65687420, 0x646e7520, 0x # ror when the und
	.word	0x796c7265, 0x20676e69, 0x65727473, 0x64206d61, 0x # erlying stream d
	.word	0x6e206469, 0x0000746f, 0x # id not..

.Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.19:
	.word	0x80012960, 0x00000048, 0x0000028a, 0x0000000e, 0x # `)..H...........

.Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.45:
	.word	0x61706163, 0x79746963, 0x65766f20, 0x6f6c6672, 0x # capacity overflo
# 8001d184:	00000077                                w...

.Lanon.6a388620d6690bd6e0d5c2f0617c9d8f.47:
	.word	0x80012694, 0x00000050, 0x0000001c, 0x00000005, 0x # .&..P...........

.LJTI314_0:
	.word	0x80010982
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x80010ae0
	.word	0x80010ac0
	.word	0x8001099e
	.word	0x8001099e
	.word	0x80010ada
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x80010aea
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x8001099e
	.word	0x80010aca

	.globl _ZN4core7unicode12unicode_data11white_space14WHITESPACE_MAP17hfceed124337e8aabE
_ZN4core7unicode12unicode_data11white_space14WHITESPACE_MAP17hfceed124337e8aabE:
	.word	0x02020202, 0x02020202, 0x00020202, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0x00000202, 0x02000000, 0x00000000, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0x02000000, 0x00000000, 0x00000000, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0x00000100, 0x00000000, 0x00000000, 0x00000000, 0x # ................
	# ... (zero-filled gap)
	.word	0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x # ................
	# ... (zero-filled gap)

	.globl _ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h4a4a51ed5ecc2bebE
_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h4a4a51ed5ecc2bebE:
	.word	0x07007000, 0x01012d00, 0x02010201, 0x0b480101, 0x # .p...-........H.
	.word	0x01101530, 0x06020765, 0x04010202, 0x1b1e0123, 0x # 0...e.......#...
	.word	0x093a0b5b, 0x04180109, 0x03010901, 0x032b0501, 0x # [.:...........+.
	.word	0x182a093b, 0x01372001, 0x08040101, 0x07030104, 0x # ;.*.. 7.........
	.word	0x011d020a, 0x0101013a, 0x01080402, 0x020a0109, 0x # ....:...........
	.word	0x0202011a, 0x02040139, 0x03020204, 0x021e0103, 0x # ....9...........
	.word	0x020b0103, 0x05040139, 0x01040201, 0x06160214, 0x # ....9...........
	.word	0x013a0101, 0x04010201, 0x03070108, 0x011e020a, 0x # ..:.............
	.word	0x0101013b, 0x0109010c, 0x01030128, 0x03010137, 0x # ;.......(...7...
	.word	0x04010305, 0x020b0207, 0x013a011d, 0x01010202, 0x # ..........:.....
	.word	0x04010303, 0x020b0207, 0x0239021c, 0x04020101, 0x # ..........9.....
	.word	0x01090108, 0x011d020a, 0x01040148, 0x01010302, 0x # ........H.......
	.word	0x01510108, 0x080c0702, 0x09020162, 0x0249070b, 0x # ..Q.....b.....I.
	.word	0x0101011b, 0x0e370101, 0x02010501, 0x24010b05, 0x # ......7........$
	.word	0x04660109, 0x02010601, 0x02190202, 0x04100304, 0x # ..f.............
	.word	0x0202010d, 0x010f0106, 0x04000300, 0x021d031c, 0x # ................
	.word	0x0240021e, 0x01080701, 0x01090b02, 0x0101032d, 0x # ..@.........-...
	.word	0x01220275, 0x02040376, 0x03060109, 0x010202db, 0x # u.".v...........
	.word	0x0701013a, 0x01010101, 0x0a060802, 0x2e300102, 0x # :.............0.
	.word	0x04140c02, 0x03040a30, 0x020c0926, 0x06020420, 0x # ....0...&... ...
	.word	0x02010138, 0x05010103, 0x02020838, 0x0d010398, 0x # 8.......8.......
	.word	0x01040701, 0x02030106, 0x010040c6, 0x030021c3, 0x # .........@...!..
	.word	0x2060018d, 0x02690600, 0x0a010400, 0x02500220, 0x # ..` ..i..... .P.
	.word	0x01030100, 0x02190104, 0x02970105, 0x010d121a, 0x # ................
	.word	0x0b190826, 0x032c0101, 0x04020130, 0x01020202, 0x # &.....,.0.......
	.word	0x06430124, 0x02020202, 0x0108010c, 0x0133012f, 0x # $.C........./.3.
	.word	0x02020301, 0x01010205, 0x0108022a, 0x010201ee, 0x # ........*.......
	.word	0x01000104, 0x10101000, 0x01000200, 0x059501e2, 0x # ................
	.word	0x02010300, 0x03280405, 0x02a50104, 0x05410400, 0x # ......(.......A.
	.word	0x064d0200, 0x04310b46, 0x0f36017b, 0x02020129, 0x # ..M.F.1.{.6.)...
	.word	0x0431030a, 0x01070202, 0x0524033d, 0x013e0801, 0x # ..1.....=.$...>.
	.word	0x0934020c, 0x04080101, 0x035f0102, 0x01060402, 0x # ..4......._.....
	.word	0x019d0102, 0x02150803, 0x01010239, 0x010c0101, 0x # ........9.......
	.word	0x070e0109, 0x01430503, 0x01010602, 0x03010102, 0x # ......C.........
	.word	0x01010304, 0x0855020e, 0x01010302, 0x01510117, 0x # ......U.......Q.
	.word	0x01010602, 0x02010102, 0x01eb0201, 0x02060402, 0x # ................
	.word	0x021b0201, 0x01020855, 0x016a0201, 0x08020101, 0x # ....U.....j.....
	.word	0x01010165, 0x05010402, 0x02010900, 0x040a01f5, 0x # e...............
	.word	0x04900104, 0x01040202, 0x06280a20, 0x01080402, 0x # ........ .(.....
	.word	0x03020609, 0x02010d2e, 0x030101c6, 0x07c90101, 0x # ................
	.word	0x01010601, 0x07021652, 0x02010201, 0x0103067a, 0x # ....R.......z...
	.word	0x07010201, 0x02480101, 0x01010103, 0x020b0200, 0x # ......H.........
	.word	0x03050534, 0x01000117, 0x0c000f06, 0x05000303, 0x # 4...............
	.word	0x0100073b, 0x0151043f, 0x0200020b, 0x17022e00, 0x # ;...?.Q.........
	.word	0x06030500, 0x07020808, 0x0394041e, 0x32043700, 0x # .............7.2
	.word	0x010e0108, 0x0f010516, 0x11010700, 0x02010702, 0x # ................
	.word	0x01640501, 0x010007a0, 0x0400043d, 0x01f302fe, 0x # ..d.....=.......
	.word	0x02070102, 0x07000105, 0x6000076d, 0x0000f080, 0x # ........m..`....

.Lanon.93378afd097c98d6944e7e9e652eb25e.4:
	.word	0x800120ac, 0x0000004b, 0x00000b7e, 0x00000026, 0x # . ..K...~...&...

.Lanon.93378afd097c98d6944e7e9e652eb25e.5:
	.word	0x800120ac, 0x0000004b, 0x00000b87, 0x0000001a, 0x # . ..K...........

.Lanon.93378afd097c98d6944e7e9e652eb25e.6:
	.word	0x736c6166, 0x00000065, 0x # false...

.Lanon.93378afd097c98d6944e7e9e652eb25e.10:
	.word	0x31303030, 0x33303230, 0x35303430, 0x37303630, 0x # 0001020304050607
	.word	0x39303830, 0x31313031, 0x33313231, 0x35313431, 0x # 0809101112131415
	.word	0x37313631, 0x39313831, 0x31323032, 0x33323232, 0x # 1617181920212223
	.word	0x35323432, 0x37323632, 0x39323832, 0x31333033, 0x # 2425262728293031
	.word	0x33333233, 0x35333433, 0x37333633, 0x39333833, 0x # 3233343536373839
	.word	0x31343034, 0x33343234, 0x35343434, 0x37343634, 0x # 4041424344454647
	.word	0x39343834, 0x31353035, 0x33353235, 0x35353435, 0x # 4849505152535455
	.word	0x37353635, 0x39353835, 0x31363036, 0x33363236, 0x # 5657585960616263
	.word	0x35363436, 0x37363636, 0x39363836, 0x31373037, 0x # 6465666768697071
	.word	0x33373237, 0x35373437, 0x37373637, 0x39373837, 0x # 7273747576777879
	.word	0x31383038, 0x33383238, 0x35383438, 0x37383638, 0x # 8081828384858687
	.word	0x39383838, 0x31393039, 0x33393239, 0x35393439, 0x # 8889909192939495
	.word	0x37393639, 0x39393839, 0x # 96979899

.Lanon.93378afd097c98d6944e7e9e652eb25e.22:
	.word	0x80011de8, 0x0000004b, 0x0000025e, 0x00000005, 0x # ....K...^.......

.Lanon.93378afd097c98d6944e7e9e652eb25e.33:
# 8001d738:	00007830                                0x..

.Lanon.93378afd097c98d6944e7e9e652eb25e.42:
# 8001d73c:	00000a2c                                ,...

.Lanon.93378afd097c98d6944e7e9e652eb25e.43:
# 8001d740:	00000028                                (...

.Lanon.93378afd097c98d6944e7e9e652eb25e.44:
# 8001d744:	00000a28                                (...

.Lanon.93378afd097c98d6944e7e9e652eb25e.48:
# 8001d748:	00000029                                )...

.Lanon.93378afd097c98d6944e7e9e652eb25e.49:
# 8001d74c:	0000002c                                ,...

.Lanon.93378afd097c98d6944e7e9e652eb25e.50:
	.word	0x00000000, 0x0000000c, 0x00000004, 0x8001154c, 0x # ............L...
	.word	0x800114dc, 0x8000f7fc, 0x # ........

.Lanon.93378afd097c98d6944e7e9e652eb25e.82:
	.word	0x65747461, 0x2074706d, 0x61206f74, 0x77206464, 0x # attempt to add w
	.word	0x20687469, 0x7265766f, 0x776f6c66, 0x # ith overflow

.Lanon.93378afd097c98d6944e7e9e652eb25e.84:
	.word	0x65747461, 0x2074706d, 0x6d206f74, 0x69746c75, 0x # attempt to multi
	.word	0x20796c70, 0x68746977, 0x65766f20, 0x6f6c6672, 0x # ply with overflo
# 8001d7a4:	00000077                                w...

.Lanon.93378afd097c98d6944e7e9e652eb25e.86:
	.word	0x65747461, 0x2074706d, 0x63206f74, 0x75636c61, 0x # attempt to calcu
	.word	0x6574616c, 0x65687420, 0x6d657220, 0x646e6961, 0x # late the remaind
	.word	0x77207265, 0x20687469, 0x7265766f, 0x776f6c66, 0x # er with overflow

.Lanon.93378afd097c98d6944e7e9e652eb25e.89:
	.word	0x65747461, 0x2074706d, 0x73206f74, 0x72746275, 0x # attempt to subtr
	.word	0x20746361, 0x68746977, 0x65766f20, 0x6f6c6672, 0x # act with overflo
# 8001d7f8:	00000077                                w...

.Lanon.93378afd097c98d6944e7e9e652eb25e.202:
	.word	0x01010101, 0x01010101, 0x01010101, 0x01010101, 0x # ................
	.word	0x01010101, 0x01010101, 0x01010101, 0x01010101, 0x # ................
	.word	0x01010101, 0x01010101, 0x01010101, 0x01010101, 0x # ................
	.word	0x01010101, 0x01010101, 0x01010101, 0x01010101, 0x # ................
	.word	0x01010101, 0x01010101, 0x01010101, 0x01010101, 0x # ................
	.word	0x01010101, 0x01010101, 0x01010101, 0x01010101, 0x # ................
	.word	0x01010101, 0x01010101, 0x01010101, 0x01010101, 0x # ................
	.word	0x01010101, 0x01010101, 0x01010101, 0x01010101, 0x # ................
	# ... (zero-filled gap)
	.word	0x02020000, 0x02020202, 0x02020202, 0x02020202, 0x # ................
	.word	0x02020202, 0x02020202, 0x02020202, 0x02020202, 0x # ................
	.word	0x03030303, 0x03030303, 0x03030303, 0x03030303, 0x # ................
	.word	0x04040404, 0x00000004, 0x00000000, 0x00000000, 0x # ................

.Lanon.93378afd097c98d6944e7e9e652eb25e.204:
	.word	0x2e2e2e5b, 0x0000005d, 0x # [...]...

.Lanon.93378afd097c98d6944e7e9e652eb25e.210:
	.word	0x80012264, 0x0000004f, 0x00000666, 0x00000015, 0x # d"..O...f.......

.Lanon.93378afd097c98d6944e7e9e652eb25e.211:
	.word	0x80012264, 0x0000004f, 0x00000694, 0x00000015, 0x # d"..O...........

.Lanon.93378afd097c98d6944e7e9e652eb25e.212:
	.word	0x80012264, 0x0000004f, 0x00000695, 0x00000015, 0x # d"..O...........

.Lanon.93378afd097c98d6944e7e9e652eb25e.213:
	.word	0x80012264, 0x0000004f, 0x00000573, 0x00000028, 0x # d"..O...s...(...

.Lanon.93378afd097c98d6944e7e9e652eb25e.214:
	.word	0x80012264, 0x0000004f, 0x00000573, 0x00000012, 0x # d"..O...s.......

.Lanon.93378afd097c98d6944e7e9e652eb25e.243:
	.word	0x6c6c6163, 0x60206465, 0x6974704f, 0x3a3a6e6f, 0x # called `Option::
	.word	0x72776e75, 0x29287061, 0x6e6f2060, 0x60206120, 0x # unwrap()` on a `
	.word	0x656e6f4e, 0x61762060, 0x0065756c, 0x # None` value.

.Lanon.93378afd097c98d6944e7e9e652eb25e.246:
	.word	0x000000b5, 0x0000039c, 0x000000df, 0x00400000, 0x # ..............@.
	.word	0x000000e0, 0x000000c0, 0x000000e1, 0x000000c1, 0x # ................
	.word	0x000000e2, 0x000000c2, 0x000000e3, 0x000000c3, 0x # ................
	.word	0x000000e4, 0x000000c4, 0x000000e5, 0x000000c5, 0x # ................
	.word	0x000000e6, 0x000000c6, 0x000000e7, 0x000000c7, 0x # ................
	.word	0x000000e8, 0x000000c8, 0x000000e9, 0x000000c9, 0x # ................
	.word	0x000000ea, 0x000000ca, 0x000000eb, 0x000000cb, 0x # ................
	.word	0x000000ec, 0x000000cc, 0x000000ed, 0x000000cd, 0x # ................
	.word	0x000000ee, 0x000000ce, 0x000000ef, 0x000000cf, 0x # ................
	.word	0x000000f0, 0x000000d0, 0x000000f1, 0x000000d1, 0x # ................
	.word	0x000000f2, 0x000000d2, 0x000000f3, 0x000000d3, 0x # ................
	.word	0x000000f4, 0x000000d4, 0x000000f5, 0x000000d5, 0x # ................
	.word	0x000000f6, 0x000000d6, 0x000000f8, 0x000000d8, 0x # ................
	.word	0x000000f9, 0x000000d9, 0x000000fa, 0x000000da, 0x # ................
	.word	0x000000fb, 0x000000db, 0x000000fc, 0x000000dc, 0x # ................
	.word	0x000000fd, 0x000000dd, 0x000000fe, 0x000000de, 0x # ................
	.word	0x000000ff, 0x00000178, 0x00000101, 0x00000100, 0x # ....x...........
	.word	0x00000103, 0x00000102, 0x00000105, 0x00000104, 0x # ................
	.word	0x00000107, 0x00000106, 0x00000109, 0x00000108, 0x # ................
	.word	0x0000010b, 0x0000010a, 0x0000010d, 0x0000010c, 0x # ................
	.word	0x0000010f, 0x0000010e, 0x00000111, 0x00000110, 0x # ................
	.word	0x00000113, 0x00000112, 0x00000115, 0x00000114, 0x # ................
	.word	0x00000117, 0x00000116, 0x00000119, 0x00000118, 0x # ................
	.word	0x0000011b, 0x0000011a, 0x0000011d, 0x0000011c, 0x # ................
	.word	0x0000011f, 0x0000011e, 0x00000121, 0x00000120, 0x # ........!... ...
	.word	0x00000123, 0x00000122, 0x00000125, 0x00000124, 0x # #..."...%...$...
	.word	0x00000127, 0x00000126, 0x00000129, 0x00000128, 0x # '...&...)...(...
	.word	0x0000012b, 0x0000012a, 0x0000012d, 0x0000012c, 0x # +...*...-...,...
	.word	0x0000012f, 0x0000012e, 0x00000131, 0x00000049, 0x # /.......1...I...
	.word	0x00000133, 0x00000132, 0x00000135, 0x00000134, 0x # 3...2...5...4...
	.word	0x00000137, 0x00000136, 0x0000013a, 0x00000139, 0x # 7...6...:...9...
	.word	0x0000013c, 0x0000013b, 0x0000013e, 0x0000013d, 0x # <...;...>...=...
	.word	0x00000140, 0x0000013f, 0x00000142, 0x00000141, 0x # @...?...B...A...
	.word	0x00000144, 0x00000143, 0x00000146, 0x00000145, 0x # D...C...F...E...
	.word	0x00000148, 0x00000147, 0x00000149, 0x00400001, 0x # H...G...I.....@.
	.word	0x0000014b, 0x0000014a, 0x0000014d, 0x0000014c, 0x # K...J...M...L...
	.word	0x0000014f, 0x0000014e, 0x00000151, 0x00000150, 0x # O...N...Q...P...
	.word	0x00000153, 0x00000152, 0x00000155, 0x00000154, 0x # S...R...U...T...
	.word	0x00000157, 0x00000156, 0x00000159, 0x00000158, 0x # W...V...Y...X...
	.word	0x0000015b, 0x0000015a, 0x0000015d, 0x0000015c, 0x # [...Z...]...\...
	.word	0x0000015f, 0x0000015e, 0x00000161, 0x00000160, 0x # _...^...a...`...
	.word	0x00000163, 0x00000162, 0x00000165, 0x00000164, 0x # c...b...e...d...
	.word	0x00000167, 0x00000166, 0x00000169, 0x00000168, 0x # g...f...i...h...
	.word	0x0000016b, 0x0000016a, 0x0000016d, 0x0000016c, 0x # k...j...m...l...
	.word	0x0000016f, 0x0000016e, 0x00000171, 0x00000170, 0x # o...n...q...p...
	.word	0x00000173, 0x00000172, 0x00000175, 0x00000174, 0x # s...r...u...t...
	.word	0x00000177, 0x00000176, 0x0000017a, 0x00000179, 0x # w...v...z...y...
	.word	0x0000017c, 0x0000017b, 0x0000017e, 0x0000017d, 0x # |...{...~...}...
	.word	0x0000017f, 0x00000053, 0x00000180, 0x00000243, 0x # ....S.......C...
	.word	0x00000183, 0x00000182, 0x00000185, 0x00000184, 0x # ................
	.word	0x00000188, 0x00000187, 0x0000018c, 0x0000018b, 0x # ................
	.word	0x00000192, 0x00000191, 0x00000195, 0x000001f6, 0x # ................
	.word	0x00000199, 0x00000198, 0x0000019a, 0x0000023d, 0x # ............=...
	.word	0x0000019b, 0x0000a7dc, 0x0000019e, 0x00000220, 0x # ............ ...
	.word	0x000001a1, 0x000001a0, 0x000001a3, 0x000001a2, 0x # ................
	.word	0x000001a5, 0x000001a4, 0x000001a8, 0x000001a7, 0x # ................
	.word	0x000001ad, 0x000001ac, 0x000001b0, 0x000001af, 0x # ................
	.word	0x000001b4, 0x000001b3, 0x000001b6, 0x000001b5, 0x # ................
	.word	0x000001b9, 0x000001b8, 0x000001bd, 0x000001bc, 0x # ................
	.word	0x000001bf, 0x000001f7, 0x000001c5, 0x000001c4, 0x # ................
	.word	0x000001c6, 0x000001c4, 0x000001c8, 0x000001c7, 0x # ................
	.word	0x000001c9, 0x000001c7, 0x000001cb, 0x000001ca, 0x # ................
	.word	0x000001cc, 0x000001ca, 0x000001ce, 0x000001cd, 0x # ................
	.word	0x000001d0, 0x000001cf, 0x000001d2, 0x000001d1, 0x # ................
	.word	0x000001d4, 0x000001d3, 0x000001d6, 0x000001d5, 0x # ................
	.word	0x000001d8, 0x000001d7, 0x000001da, 0x000001d9, 0x # ................
	.word	0x000001dc, 0x000001db, 0x000001dd, 0x0000018e, 0x # ................
	.word	0x000001df, 0x000001de, 0x000001e1, 0x000001e0, 0x # ................
	.word	0x000001e3, 0x000001e2, 0x000001e5, 0x000001e4, 0x # ................
	.word	0x000001e7, 0x000001e6, 0x000001e9, 0x000001e8, 0x # ................
	.word	0x000001eb, 0x000001ea, 0x000001ed, 0x000001ec, 0x # ................
	.word	0x000001ef, 0x000001ee, 0x000001f0, 0x00400002, 0x # ..............@.
	.word	0x000001f2, 0x000001f1, 0x000001f3, 0x000001f1, 0x # ................
	.word	0x000001f5, 0x000001f4, 0x000001f9, 0x000001f8, 0x # ................
	.word	0x000001fb, 0x000001fa, 0x000001fd, 0x000001fc, 0x # ................
	.word	0x000001ff, 0x000001fe, 0x00000201, 0x00000200, 0x # ................
	.word	0x00000203, 0x00000202, 0x00000205, 0x00000204, 0x # ................
	.word	0x00000207, 0x00000206, 0x00000209, 0x00000208, 0x # ................
	.word	0x0000020b, 0x0000020a, 0x0000020d, 0x0000020c, 0x # ................
	.word	0x0000020f, 0x0000020e, 0x00000211, 0x00000210, 0x # ................
	.word	0x00000213, 0x00000212, 0x00000215, 0x00000214, 0x # ................
	.word	0x00000217, 0x00000216, 0x00000219, 0x00000218, 0x # ................
	.word	0x0000021b, 0x0000021a, 0x0000021d, 0x0000021c, 0x # ................
	.word	0x0000021f, 0x0000021e, 0x00000223, 0x00000222, 0x # ........#..."...
	.word	0x00000225, 0x00000224, 0x00000227, 0x00000226, 0x # %...$...'...&...
	.word	0x00000229, 0x00000228, 0x0000022b, 0x0000022a, 0x # )...(...+...*...
	.word	0x0000022d, 0x0000022c, 0x0000022f, 0x0000022e, 0x # -...,.../.......
	.word	0x00000231, 0x00000230, 0x00000233, 0x00000232, 0x # 1...0...3...2...
	.word	0x0000023c, 0x0000023b, 0x0000023f, 0x00002c7e, 0x # <...;...?...~,..
	.word	0x00000240, 0x00002c7f, 0x00000242, 0x00000241, 0x # @....,..B...A...
	.word	0x00000247, 0x00000246, 0x00000249, 0x00000248, 0x # G...F...I...H...
	.word	0x0000024b, 0x0000024a, 0x0000024d, 0x0000024c, 0x # K...J...M...L...
	.word	0x0000024f, 0x0000024e, 0x00000250, 0x00002c6f, 0x # O...N...P...o,..
	.word	0x00000251, 0x00002c6d, 0x00000252, 0x00002c70, 0x # Q...m,..R...p,..
	.word	0x00000253, 0x00000181, 0x00000254, 0x00000186, 0x # S.......T.......
	.word	0x00000256, 0x00000189, 0x00000257, 0x0000018a, 0x # V.......W.......
	.word	0x00000259, 0x0000018f, 0x0000025b, 0x00000190, 0x # Y.......[.......
	.word	0x0000025c, 0x0000a7ab, 0x00000260, 0x00000193, 0x # \.......`.......
	.word	0x00000261, 0x0000a7ac, 0x00000263, 0x00000194, 0x # a.......c.......
	.word	0x00000264, 0x0000a7cb, 0x00000265, 0x0000a78d, 0x # d.......e.......
	.word	0x00000266, 0x0000a7aa, 0x00000268, 0x00000197, 0x # f.......h.......
	.word	0x00000269, 0x00000196, 0x0000026a, 0x0000a7ae, 0x # i.......j.......
	.word	0x0000026b, 0x00002c62, 0x0000026c, 0x0000a7ad, 0x # k...b,..l.......
	.word	0x0000026f, 0x0000019c, 0x00000271, 0x00002c6e, 0x # o.......q...n,..
	.word	0x00000272, 0x0000019d, 0x00000275, 0x0000019f, 0x # r.......u.......
	.word	0x0000027d, 0x00002c64, 0x00000280, 0x000001a6, 0x # }...d,..........
	.word	0x00000282, 0x0000a7c5, 0x00000283, 0x000001a9, 0x # ................
	.word	0x00000287, 0x0000a7b1, 0x00000288, 0x000001ae, 0x # ................
	.word	0x00000289, 0x00000244, 0x0000028a, 0x000001b1, 0x # ....D...........
	.word	0x0000028b, 0x000001b2, 0x0000028c, 0x00000245, 0x # ............E...
	.word	0x00000292, 0x000001b7, 0x0000029d, 0x0000a7b2, 0x # ................
	.word	0x0000029e, 0x0000a7b0, 0x00000345, 0x00000399, 0x # ........E.......
	.word	0x00000371, 0x00000370, 0x00000373, 0x00000372, 0x # q...p...s...r...
	.word	0x00000377, 0x00000376, 0x0000037b, 0x000003fd, 0x # w...v...{.......
	.word	0x0000037c, 0x000003fe, 0x0000037d, 0x000003ff, 0x # |.......}.......
	.word	0x00000390, 0x00400003, 0x000003ac, 0x00000386, 0x # ......@.........
	.word	0x000003ad, 0x00000388, 0x000003ae, 0x00000389, 0x # ................
	.word	0x000003af, 0x0000038a, 0x000003b0, 0x00400004, 0x # ..............@.
	.word	0x000003b1, 0x00000391, 0x000003b2, 0x00000392, 0x # ................
	.word	0x000003b3, 0x00000393, 0x000003b4, 0x00000394, 0x # ................
	.word	0x000003b5, 0x00000395, 0x000003b6, 0x00000396, 0x # ................
	.word	0x000003b7, 0x00000397, 0x000003b8, 0x00000398, 0x # ................
	.word	0x000003b9, 0x00000399, 0x000003ba, 0x0000039a, 0x # ................
	.word	0x000003bb, 0x0000039b, 0x000003bc, 0x0000039c, 0x # ................
	.word	0x000003bd, 0x0000039d, 0x000003be, 0x0000039e, 0x # ................
	.word	0x000003bf, 0x0000039f, 0x000003c0, 0x000003a0, 0x # ................
	.word	0x000003c1, 0x000003a1, 0x000003c2, 0x000003a3, 0x # ................
	.word	0x000003c3, 0x000003a3, 0x000003c4, 0x000003a4, 0x # ................
	.word	0x000003c5, 0x000003a5, 0x000003c6, 0x000003a6, 0x # ................
	.word	0x000003c7, 0x000003a7, 0x000003c8, 0x000003a8, 0x # ................
	.word	0x000003c9, 0x000003a9, 0x000003ca, 0x000003aa, 0x # ................
	.word	0x000003cb, 0x000003ab, 0x000003cc, 0x0000038c, 0x # ................
	.word	0x000003cd, 0x0000038e, 0x000003ce, 0x0000038f, 0x # ................
	.word	0x000003d0, 0x00000392, 0x000003d1, 0x00000398, 0x # ................
	.word	0x000003d5, 0x000003a6, 0x000003d6, 0x000003a0, 0x # ................
	.word	0x000003d7, 0x000003cf, 0x000003d9, 0x000003d8, 0x # ................
	.word	0x000003db, 0x000003da, 0x000003dd, 0x000003dc, 0x # ................
	.word	0x000003df, 0x000003de, 0x000003e1, 0x000003e0, 0x # ................
	.word	0x000003e3, 0x000003e2, 0x000003e5, 0x000003e4, 0x # ................
	.word	0x000003e7, 0x000003e6, 0x000003e9, 0x000003e8, 0x # ................
	.word	0x000003eb, 0x000003ea, 0x000003ed, 0x000003ec, 0x # ................
	.word	0x000003ef, 0x000003ee, 0x000003f0, 0x0000039a, 0x # ................
	.word	0x000003f1, 0x000003a1, 0x000003f2, 0x000003f9, 0x # ................
	.word	0x000003f3, 0x0000037f, 0x000003f5, 0x00000395, 0x # ................
	.word	0x000003f8, 0x000003f7, 0x000003fb, 0x000003fa, 0x # ................
	.word	0x00000430, 0x00000410, 0x00000431, 0x00000411, 0x # 0.......1.......
	.word	0x00000432, 0x00000412, 0x00000433, 0x00000413, 0x # 2.......3.......
	.word	0x00000434, 0x00000414, 0x00000435, 0x00000415, 0x # 4.......5.......
	.word	0x00000436, 0x00000416, 0x00000437, 0x00000417, 0x # 6.......7.......
	.word	0x00000438, 0x00000418, 0x00000439, 0x00000419, 0x # 8.......9.......
	.word	0x0000043a, 0x0000041a, 0x0000043b, 0x0000041b, 0x # :.......;.......
	.word	0x0000043c, 0x0000041c, 0x0000043d, 0x0000041d, 0x # <.......=.......
	.word	0x0000043e, 0x0000041e, 0x0000043f, 0x0000041f, 0x # >.......?.......
	.word	0x00000440, 0x00000420, 0x00000441, 0x00000421, 0x # @... ...A...!...
	.word	0x00000442, 0x00000422, 0x00000443, 0x00000423, 0x # B..."...C...#...
	.word	0x00000444, 0x00000424, 0x00000445, 0x00000425, 0x # D...$...E...%...
	.word	0x00000446, 0x00000426, 0x00000447, 0x00000427, 0x # F...&...G...'...
	.word	0x00000448, 0x00000428, 0x00000449, 0x00000429, 0x # H...(...I...)...
	.word	0x0000044a, 0x0000042a, 0x0000044b, 0x0000042b, 0x # J...*...K...+...
	.word	0x0000044c, 0x0000042c, 0x0000044d, 0x0000042d, 0x # L...,...M...-...
	.word	0x0000044e, 0x0000042e, 0x0000044f, 0x0000042f, 0x # N.......O.../...
	.word	0x00000450, 0x00000400, 0x00000451, 0x00000401, 0x # P.......Q.......
	.word	0x00000452, 0x00000402, 0x00000453, 0x00000403, 0x # R.......S.......
	.word	0x00000454, 0x00000404, 0x00000455, 0x00000405, 0x # T.......U.......
	.word	0x00000456, 0x00000406, 0x00000457, 0x00000407, 0x # V.......W.......
	.word	0x00000458, 0x00000408, 0x00000459, 0x00000409, 0x # X.......Y.......
	.word	0x0000045a, 0x0000040a, 0x0000045b, 0x0000040b, 0x # Z.......[.......
	.word	0x0000045c, 0x0000040c, 0x0000045d, 0x0000040d, 0x # \.......].......
	.word	0x0000045e, 0x0000040e, 0x0000045f, 0x0000040f, 0x # ^......._.......
	.word	0x00000461, 0x00000460, 0x00000463, 0x00000462, 0x # a...`...c...b...
	.word	0x00000465, 0x00000464, 0x00000467, 0x00000466, 0x # e...d...g...f...
	.word	0x00000469, 0x00000468, 0x0000046b, 0x0000046a, 0x # i...h...k...j...
	.word	0x0000046d, 0x0000046c, 0x0000046f, 0x0000046e, 0x # m...l...o...n...
	.word	0x00000471, 0x00000470, 0x00000473, 0x00000472, 0x # q...p...s...r...
	.word	0x00000475, 0x00000474, 0x00000477, 0x00000476, 0x # u...t...w...v...
	.word	0x00000479, 0x00000478, 0x0000047b, 0x0000047a, 0x # y...x...{...z...
	.word	0x0000047d, 0x0000047c, 0x0000047f, 0x0000047e, 0x # }...|.......~...
	.word	0x00000481, 0x00000480, 0x0000048b, 0x0000048a, 0x # ................
	.word	0x0000048d, 0x0000048c, 0x0000048f, 0x0000048e, 0x # ................
	.word	0x00000491, 0x00000490, 0x00000493, 0x00000492, 0x # ................
	.word	0x00000495, 0x00000494, 0x00000497, 0x00000496, 0x # ................
	.word	0x00000499, 0x00000498, 0x0000049b, 0x0000049a, 0x # ................
	.word	0x0000049d, 0x0000049c, 0x0000049f, 0x0000049e, 0x # ................
	.word	0x000004a1, 0x000004a0, 0x000004a3, 0x000004a2, 0x # ................
	.word	0x000004a5, 0x000004a4, 0x000004a7, 0x000004a6, 0x # ................
	.word	0x000004a9, 0x000004a8, 0x000004ab, 0x000004aa, 0x # ................
	.word	0x000004ad, 0x000004ac, 0x000004af, 0x000004ae, 0x # ................
	.word	0x000004b1, 0x000004b0, 0x000004b3, 0x000004b2, 0x # ................
	.word	0x000004b5, 0x000004b4, 0x000004b7, 0x000004b6, 0x # ................
	.word	0x000004b9, 0x000004b8, 0x000004bb, 0x000004ba, 0x # ................
	.word	0x000004bd, 0x000004bc, 0x000004bf, 0x000004be, 0x # ................
	.word	0x000004c2, 0x000004c1, 0x000004c4, 0x000004c3, 0x # ................
	.word	0x000004c6, 0x000004c5, 0x000004c8, 0x000004c7, 0x # ................
	.word	0x000004ca, 0x000004c9, 0x000004cc, 0x000004cb, 0x # ................
	.word	0x000004ce, 0x000004cd, 0x000004cf, 0x000004c0, 0x # ................
	.word	0x000004d1, 0x000004d0, 0x000004d3, 0x000004d2, 0x # ................
	.word	0x000004d5, 0x000004d4, 0x000004d7, 0x000004d6, 0x # ................
	.word	0x000004d9, 0x000004d8, 0x000004db, 0x000004da, 0x # ................
	.word	0x000004dd, 0x000004dc, 0x000004df, 0x000004de, 0x # ................
	.word	0x000004e1, 0x000004e0, 0x000004e3, 0x000004e2, 0x # ................
	.word	0x000004e5, 0x000004e4, 0x000004e7, 0x000004e6, 0x # ................
	.word	0x000004e9, 0x000004e8, 0x000004eb, 0x000004ea, 0x # ................
	.word	0x000004ed, 0x000004ec, 0x000004ef, 0x000004ee, 0x # ................
	.word	0x000004f1, 0x000004f0, 0x000004f3, 0x000004f2, 0x # ................
	.word	0x000004f5, 0x000004f4, 0x000004f7, 0x000004f6, 0x # ................
	.word	0x000004f9, 0x000004f8, 0x000004fb, 0x000004fa, 0x # ................
	.word	0x000004fd, 0x000004fc, 0x000004ff, 0x000004fe, 0x # ................
	.word	0x00000501, 0x00000500, 0x00000503, 0x00000502, 0x # ................
	.word	0x00000505, 0x00000504, 0x00000507, 0x00000506, 0x # ................
	.word	0x00000509, 0x00000508, 0x0000050b, 0x0000050a, 0x # ................
	.word	0x0000050d, 0x0000050c, 0x0000050f, 0x0000050e, 0x # ................
	.word	0x00000511, 0x00000510, 0x00000513, 0x00000512, 0x # ................
	.word	0x00000515, 0x00000514, 0x00000517, 0x00000516, 0x # ................
	.word	0x00000519, 0x00000518, 0x0000051b, 0x0000051a, 0x # ................
	.word	0x0000051d, 0x0000051c, 0x0000051f, 0x0000051e, 0x # ................
	.word	0x00000521, 0x00000520, 0x00000523, 0x00000522, 0x # !... ...#..."...
	.word	0x00000525, 0x00000524, 0x00000527, 0x00000526, 0x # %...$...'...&...
	.word	0x00000529, 0x00000528, 0x0000052b, 0x0000052a, 0x # )...(...+...*...
	.word	0x0000052d, 0x0000052c, 0x0000052f, 0x0000052e, 0x # -...,.../.......
	.word	0x00000561, 0x00000531, 0x00000562, 0x00000532, 0x # a...1...b...2...
	.word	0x00000563, 0x00000533, 0x00000564, 0x00000534, 0x # c...3...d...4...
	.word	0x00000565, 0x00000535, 0x00000566, 0x00000536, 0x # e...5...f...6...
	.word	0x00000567, 0x00000537, 0x00000568, 0x00000538, 0x # g...7...h...8...
	.word	0x00000569, 0x00000539, 0x0000056a, 0x0000053a, 0x # i...9...j...:...
	.word	0x0000056b, 0x0000053b, 0x0000056c, 0x0000053c, 0x # k...;...l...<...
	.word	0x0000056d, 0x0000053d, 0x0000056e, 0x0000053e, 0x # m...=...n...>...
	.word	0x0000056f, 0x0000053f, 0x00000570, 0x00000540, 0x # o...?...p...@...
	.word	0x00000571, 0x00000541, 0x00000572, 0x00000542, 0x # q...A...r...B...
	.word	0x00000573, 0x00000543, 0x00000574, 0x00000544, 0x # s...C...t...D...
	.word	0x00000575, 0x00000545, 0x00000576, 0x00000546, 0x # u...E...v...F...
	.word	0x00000577, 0x00000547, 0x00000578, 0x00000548, 0x # w...G...x...H...
	.word	0x00000579, 0x00000549, 0x0000057a, 0x0000054a, 0x # y...I...z...J...
	.word	0x0000057b, 0x0000054b, 0x0000057c, 0x0000054c, 0x # {...K...|...L...
	.word	0x0000057d, 0x0000054d, 0x0000057e, 0x0000054e, 0x # }...M...~...N...
	.word	0x0000057f, 0x0000054f, 0x00000580, 0x00000550, 0x # ....O.......P...
	.word	0x00000581, 0x00000551, 0x00000582, 0x00000552, 0x # ....Q.......R...
	.word	0x00000583, 0x00000553, 0x00000584, 0x00000554, 0x # ....S.......T...
	.word	0x00000585, 0x00000555, 0x00000586, 0x00000556, 0x # ....U.......V...
	.word	0x00000587, 0x00400005, 0x000010d0, 0x00001c90, 0x # ......@.........
	.word	0x000010d1, 0x00001c91, 0x000010d2, 0x00001c92, 0x # ................
	.word	0x000010d3, 0x00001c93, 0x000010d4, 0x00001c94, 0x # ................
	.word	0x000010d5, 0x00001c95, 0x000010d6, 0x00001c96, 0x # ................
	.word	0x000010d7, 0x00001c97, 0x000010d8, 0x00001c98, 0x # ................
	.word	0x000010d9, 0x00001c99, 0x000010da, 0x00001c9a, 0x # ................
	.word	0x000010db, 0x00001c9b, 0x000010dc, 0x00001c9c, 0x # ................
	.word	0x000010dd, 0x00001c9d, 0x000010de, 0x00001c9e, 0x # ................
	.word	0x000010df, 0x00001c9f, 0x000010e0, 0x00001ca0, 0x # ................
	.word	0x000010e1, 0x00001ca1, 0x000010e2, 0x00001ca2, 0x # ................
	.word	0x000010e3, 0x00001ca3, 0x000010e4, 0x00001ca4, 0x # ................
	.word	0x000010e5, 0x00001ca5, 0x000010e6, 0x00001ca6, 0x # ................
	.word	0x000010e7, 0x00001ca7, 0x000010e8, 0x00001ca8, 0x # ................
	.word	0x000010e9, 0x00001ca9, 0x000010ea, 0x00001caa, 0x # ................
	.word	0x000010eb, 0x00001cab, 0x000010ec, 0x00001cac, 0x # ................
	.word	0x000010ed, 0x00001cad, 0x000010ee, 0x00001cae, 0x # ................
	.word	0x000010ef, 0x00001caf, 0x000010f0, 0x00001cb0, 0x # ................
	.word	0x000010f1, 0x00001cb1, 0x000010f2, 0x00001cb2, 0x # ................
	.word	0x000010f3, 0x00001cb3, 0x000010f4, 0x00001cb4, 0x # ................
	.word	0x000010f5, 0x00001cb5, 0x000010f6, 0x00001cb6, 0x # ................
	.word	0x000010f7, 0x00001cb7, 0x000010f8, 0x00001cb8, 0x # ................
	.word	0x000010f9, 0x00001cb9, 0x000010fa, 0x00001cba, 0x # ................
	.word	0x000010fd, 0x00001cbd, 0x000010fe, 0x00001cbe, 0x # ................
	.word	0x000010ff, 0x00001cbf, 0x000013f8, 0x000013f0, 0x # ................
	.word	0x000013f9, 0x000013f1, 0x000013fa, 0x000013f2, 0x # ................
	.word	0x000013fb, 0x000013f3, 0x000013fc, 0x000013f4, 0x # ................
	.word	0x000013fd, 0x000013f5, 0x00001c80, 0x00000412, 0x # ................
	.word	0x00001c81, 0x00000414, 0x00001c82, 0x0000041e, 0x # ................
	.word	0x00001c83, 0x00000421, 0x00001c84, 0x00000422, 0x # ....!......."...
	.word	0x00001c85, 0x00000422, 0x00001c86, 0x0000042a, 0x # ....".......*...
	.word	0x00001c87, 0x00000462, 0x00001c88, 0x0000a64a, 0x # ....b.......J...
	.word	0x00001c8a, 0x00001c89, 0x00001d79, 0x0000a77d, 0x # ........y...}...
	.word	0x00001d7d, 0x00002c63, 0x00001d8e, 0x0000a7c6, 0x # }...c,..........
	.word	0x00001e01, 0x00001e00, 0x00001e03, 0x00001e02, 0x # ................
	.word	0x00001e05, 0x00001e04, 0x00001e07, 0x00001e06, 0x # ................
	.word	0x00001e09, 0x00001e08, 0x00001e0b, 0x00001e0a, 0x # ................
	.word	0x00001e0d, 0x00001e0c, 0x00001e0f, 0x00001e0e, 0x # ................
	.word	0x00001e11, 0x00001e10, 0x00001e13, 0x00001e12, 0x # ................
	.word	0x00001e15, 0x00001e14, 0x00001e17, 0x00001e16, 0x # ................
	.word	0x00001e19, 0x00001e18, 0x00001e1b, 0x00001e1a, 0x # ................
	.word	0x00001e1d, 0x00001e1c, 0x00001e1f, 0x00001e1e, 0x # ................
	.word	0x00001e21, 0x00001e20, 0x00001e23, 0x00001e22, 0x # !... ...#..."...
	.word	0x00001e25, 0x00001e24, 0x00001e27, 0x00001e26, 0x # %...$...'...&...
	.word	0x00001e29, 0x00001e28, 0x00001e2b, 0x00001e2a, 0x # )...(...+...*...
	.word	0x00001e2d, 0x00001e2c, 0x00001e2f, 0x00001e2e, 0x # -...,.../.......
	.word	0x00001e31, 0x00001e30, 0x00001e33, 0x00001e32, 0x # 1...0...3...2...
	.word	0x00001e35, 0x00001e34, 0x00001e37, 0x00001e36, 0x # 5...4...7...6...
	.word	0x00001e39, 0x00001e38, 0x00001e3b, 0x00001e3a, 0x # 9...8...;...:...
	.word	0x00001e3d, 0x00001e3c, 0x00001e3f, 0x00001e3e, 0x # =...<...?...>...
	.word	0x00001e41, 0x00001e40, 0x00001e43, 0x00001e42, 0x # A...@...C...B...
	.word	0x00001e45, 0x00001e44, 0x00001e47, 0x00001e46, 0x # E...D...G...F...
	.word	0x00001e49, 0x00001e48, 0x00001e4b, 0x00001e4a, 0x # I...H...K...J...
	.word	0x00001e4d, 0x00001e4c, 0x00001e4f, 0x00001e4e, 0x # M...L...O...N...
	.word	0x00001e51, 0x00001e50, 0x00001e53, 0x00001e52, 0x # Q...P...S...R...
	.word	0x00001e55, 0x00001e54, 0x00001e57, 0x00001e56, 0x # U...T...W...V...
	.word	0x00001e59, 0x00001e58, 0x00001e5b, 0x00001e5a, 0x # Y...X...[...Z...
	.word	0x00001e5d, 0x00001e5c, 0x00001e5f, 0x00001e5e, 0x # ]...\..._...^...
	.word	0x00001e61, 0x00001e60, 0x00001e63, 0x00001e62, 0x # a...`...c...b...
	.word	0x00001e65, 0x00001e64, 0x00001e67, 0x00001e66, 0x # e...d...g...f...
	.word	0x00001e69, 0x00001e68, 0x00001e6b, 0x00001e6a, 0x # i...h...k...j...
	.word	0x00001e6d, 0x00001e6c, 0x00001e6f, 0x00001e6e, 0x # m...l...o...n...
	.word	0x00001e71, 0x00001e70, 0x00001e73, 0x00001e72, 0x # q...p...s...r...
	.word	0x00001e75, 0x00001e74, 0x00001e77, 0x00001e76, 0x # u...t...w...v...
	.word	0x00001e79, 0x00001e78, 0x00001e7b, 0x00001e7a, 0x # y...x...{...z...
	.word	0x00001e7d, 0x00001e7c, 0x00001e7f, 0x00001e7e, 0x # }...|.......~...
	.word	0x00001e81, 0x00001e80, 0x00001e83, 0x00001e82, 0x # ................
	.word	0x00001e85, 0x00001e84, 0x00001e87, 0x00001e86, 0x # ................
	.word	0x00001e89, 0x00001e88, 0x00001e8b, 0x00001e8a, 0x # ................
	.word	0x00001e8d, 0x00001e8c, 0x00001e8f, 0x00001e8e, 0x # ................
	.word	0x00001e91, 0x00001e90, 0x00001e93, 0x00001e92, 0x # ................
	.word	0x00001e95, 0x00001e94, 0x00001e96, 0x00400006, 0x # ..............@.
	.word	0x00001e97, 0x00400007, 0x00001e98, 0x00400008, 0x # ......@.......@.
	.word	0x00001e99, 0x00400009, 0x00001e9a, 0x0040000a, 0x # ......@.......@.
	.word	0x00001e9b, 0x00001e60, 0x00001ea1, 0x00001ea0, 0x # ....`...........
	.word	0x00001ea3, 0x00001ea2, 0x00001ea5, 0x00001ea4, 0x # ................
	.word	0x00001ea7, 0x00001ea6, 0x00001ea9, 0x00001ea8, 0x # ................
	.word	0x00001eab, 0x00001eaa, 0x00001ead, 0x00001eac, 0x # ................
	.word	0x00001eaf, 0x00001eae, 0x00001eb1, 0x00001eb0, 0x # ................
	.word	0x00001eb3, 0x00001eb2, 0x00001eb5, 0x00001eb4, 0x # ................
	.word	0x00001eb7, 0x00001eb6, 0x00001eb9, 0x00001eb8, 0x # ................
	.word	0x00001ebb, 0x00001eba, 0x00001ebd, 0x00001ebc, 0x # ................
	.word	0x00001ebf, 0x00001ebe, 0x00001ec1, 0x00001ec0, 0x # ................
	.word	0x00001ec3, 0x00001ec2, 0x00001ec5, 0x00001ec4, 0x # ................
	.word	0x00001ec7, 0x00001ec6, 0x00001ec9, 0x00001ec8, 0x # ................
	.word	0x00001ecb, 0x00001eca, 0x00001ecd, 0x00001ecc, 0x # ................
	.word	0x00001ecf, 0x00001ece, 0x00001ed1, 0x00001ed0, 0x # ................
	.word	0x00001ed3, 0x00001ed2, 0x00001ed5, 0x00001ed4, 0x # ................
	.word	0x00001ed7, 0x00001ed6, 0x00001ed9, 0x00001ed8, 0x # ................
	.word	0x00001edb, 0x00001eda, 0x00001edd, 0x00001edc, 0x # ................
	.word	0x00001edf, 0x00001ede, 0x00001ee1, 0x00001ee0, 0x # ................
	.word	0x00001ee3, 0x00001ee2, 0x00001ee5, 0x00001ee4, 0x # ................
	.word	0x00001ee7, 0x00001ee6, 0x00001ee9, 0x00001ee8, 0x # ................
	.word	0x00001eeb, 0x00001eea, 0x00001eed, 0x00001eec, 0x # ................
	.word	0x00001eef, 0x00001eee, 0x00001ef1, 0x00001ef0, 0x # ................
	.word	0x00001ef3, 0x00001ef2, 0x00001ef5, 0x00001ef4, 0x # ................
	.word	0x00001ef7, 0x00001ef6, 0x00001ef9, 0x00001ef8, 0x # ................
	.word	0x00001efb, 0x00001efa, 0x00001efd, 0x00001efc, 0x # ................
	.word	0x00001eff, 0x00001efe, 0x00001f00, 0x00001f08, 0x # ................
	.word	0x00001f01, 0x00001f09, 0x00001f02, 0x00001f0a, 0x # ................
	.word	0x00001f03, 0x00001f0b, 0x00001f04, 0x00001f0c, 0x # ................
	.word	0x00001f05, 0x00001f0d, 0x00001f06, 0x00001f0e, 0x # ................
	.word	0x00001f07, 0x00001f0f, 0x00001f10, 0x00001f18, 0x # ................
	.word	0x00001f11, 0x00001f19, 0x00001f12, 0x00001f1a, 0x # ................
	.word	0x00001f13, 0x00001f1b, 0x00001f14, 0x00001f1c, 0x # ................
	.word	0x00001f15, 0x00001f1d, 0x00001f20, 0x00001f28, 0x # ........ ...(...
	.word	0x00001f21, 0x00001f29, 0x00001f22, 0x00001f2a, 0x # !...)..."...*...
	.word	0x00001f23, 0x00001f2b, 0x00001f24, 0x00001f2c, 0x # #...+...$...,...
	.word	0x00001f25, 0x00001f2d, 0x00001f26, 0x00001f2e, 0x # %...-...&.......
	.word	0x00001f27, 0x00001f2f, 0x00001f30, 0x00001f38, 0x # '.../...0...8...
	.word	0x00001f31, 0x00001f39, 0x00001f32, 0x00001f3a, 0x # 1...9...2...:...
	.word	0x00001f33, 0x00001f3b, 0x00001f34, 0x00001f3c, 0x # 3...;...4...<...
	.word	0x00001f35, 0x00001f3d, 0x00001f36, 0x00001f3e, 0x # 5...=...6...>...
	.word	0x00001f37, 0x00001f3f, 0x00001f40, 0x00001f48, 0x # 7...?...@...H...
	.word	0x00001f41, 0x00001f49, 0x00001f42, 0x00001f4a, 0x # A...I...B...J...
	.word	0x00001f43, 0x00001f4b, 0x00001f44, 0x00001f4c, 0x # C...K...D...L...
	.word	0x00001f45, 0x00001f4d, 0x00001f50, 0x0040000b, 0x # E...M...P.....@.
	.word	0x00001f51, 0x00001f59, 0x00001f52, 0x0040000c, 0x # Q...Y...R.....@.
	.word	0x00001f53, 0x00001f5b, 0x00001f54, 0x0040000d, 0x # S...[...T.....@.
	.word	0x00001f55, 0x00001f5d, 0x00001f56, 0x0040000e, 0x # U...]...V.....@.
	.word	0x00001f57, 0x00001f5f, 0x00001f60, 0x00001f68, 0x # W..._...`...h...
	.word	0x00001f61, 0x00001f69, 0x00001f62, 0x00001f6a, 0x # a...i...b...j...
	.word	0x00001f63, 0x00001f6b, 0x00001f64, 0x00001f6c, 0x # c...k...d...l...
	.word	0x00001f65, 0x00001f6d, 0x00001f66, 0x00001f6e, 0x # e...m...f...n...
	.word	0x00001f67, 0x00001f6f, 0x00001f70, 0x00001fba, 0x # g...o...p.......
	.word	0x00001f71, 0x00001fbb, 0x00001f72, 0x00001fc8, 0x # q.......r.......
	.word	0x00001f73, 0x00001fc9, 0x00001f74, 0x00001fca, 0x # s.......t.......
	.word	0x00001f75, 0x00001fcb, 0x00001f76, 0x00001fda, 0x # u.......v.......
	.word	0x00001f77, 0x00001fdb, 0x00001f78, 0x00001ff8, 0x # w.......x.......
	.word	0x00001f79, 0x00001ff9, 0x00001f7a, 0x00001fea, 0x # y.......z.......
	.word	0x00001f7b, 0x00001feb, 0x00001f7c, 0x00001ffa, 0x # {.......|.......
	.word	0x00001f7d, 0x00001ffb, 0x00001f80, 0x0040000f, 0x # }.............@.
	.word	0x00001f81, 0x00400010, 0x00001f82, 0x00400011, 0x # ......@.......@.
	.word	0x00001f83, 0x00400012, 0x00001f84, 0x00400013, 0x # ......@.......@.
	.word	0x00001f85, 0x00400014, 0x00001f86, 0x00400015, 0x # ......@.......@.
	.word	0x00001f87, 0x00400016, 0x00001f88, 0x00400017, 0x # ......@.......@.
	.word	0x00001f89, 0x00400018, 0x00001f8a, 0x00400019, 0x # ......@.......@.
	.word	0x00001f8b, 0x0040001a, 0x00001f8c, 0x0040001b, 0x # ......@.......@.
	.word	0x00001f8d, 0x0040001c, 0x00001f8e, 0x0040001d, 0x # ......@.......@.
	.word	0x00001f8f, 0x0040001e, 0x00001f90, 0x0040001f, 0x # ......@.......@.
	.word	0x00001f91, 0x00400020, 0x00001f92, 0x00400021, 0x # .... .@.....!.@.
	.word	0x00001f93, 0x00400022, 0x00001f94, 0x00400023, 0x # ....".@.....#.@.
	.word	0x00001f95, 0x00400024, 0x00001f96, 0x00400025, 0x # ....$.@.....%.@.
	.word	0x00001f97, 0x00400026, 0x00001f98, 0x00400027, 0x # ....&.@.....'.@.
	.word	0x00001f99, 0x00400028, 0x00001f9a, 0x00400029, 0x # ....(.@.....).@.
	.word	0x00001f9b, 0x0040002a, 0x00001f9c, 0x0040002b, 0x # ....*.@.....+.@.
	.word	0x00001f9d, 0x0040002c, 0x00001f9e, 0x0040002d, 0x # ....,.@.....-.@.
	.word	0x00001f9f, 0x0040002e, 0x00001fa0, 0x0040002f, 0x # ......@...../.@.
	.word	0x00001fa1, 0x00400030, 0x00001fa2, 0x00400031, 0x # ....0.@.....1.@.
	.word	0x00001fa3, 0x00400032, 0x00001fa4, 0x00400033, 0x # ....2.@.....3.@.
	.word	0x00001fa5, 0x00400034, 0x00001fa6, 0x00400035, 0x # ....4.@.....5.@.
	.word	0x00001fa7, 0x00400036, 0x00001fa8, 0x00400037, 0x # ....6.@.....7.@.
	.word	0x00001fa9, 0x00400038, 0x00001faa, 0x00400039, 0x # ....8.@.....9.@.
	.word	0x00001fab, 0x0040003a, 0x00001fac, 0x0040003b, 0x # ....:.@.....;.@.
	.word	0x00001fad, 0x0040003c, 0x00001fae, 0x0040003d, 0x # ....<.@.....=.@.
	.word	0x00001faf, 0x0040003e, 0x00001fb0, 0x00001fb8, 0x # ....>.@.........
	.word	0x00001fb1, 0x00001fb9, 0x00001fb2, 0x0040003f, 0x # ............?.@.
	.word	0x00001fb3, 0x00400040, 0x00001fb4, 0x00400041, 0x # ....@.@.....A.@.
	.word	0x00001fb6, 0x00400042, 0x00001fb7, 0x00400043, 0x # ....B.@.....C.@.
	.word	0x00001fbc, 0x00400044, 0x00001fbe, 0x00000399, 0x # ....D.@.........
	.word	0x00001fc2, 0x00400045, 0x00001fc3, 0x00400046, 0x # ....E.@.....F.@.
	.word	0x00001fc4, 0x00400047, 0x00001fc6, 0x00400048, 0x # ....G.@.....H.@.
	.word	0x00001fc7, 0x00400049, 0x00001fcc, 0x0040004a, 0x # ....I.@.....J.@.
	.word	0x00001fd0, 0x00001fd8, 0x00001fd1, 0x00001fd9, 0x # ................
	.word	0x00001fd2, 0x0040004b, 0x00001fd3, 0x0040004c, 0x # ....K.@.....L.@.
	.word	0x00001fd6, 0x0040004d, 0x00001fd7, 0x0040004e, 0x # ....M.@.....N.@.
	.word	0x00001fe0, 0x00001fe8, 0x00001fe1, 0x00001fe9, 0x # ................
	.word	0x00001fe2, 0x0040004f, 0x00001fe3, 0x00400050, 0x # ....O.@.....P.@.
	.word	0x00001fe4, 0x00400051, 0x00001fe5, 0x00001fec, 0x # ....Q.@.........
	.word	0x00001fe6, 0x00400052, 0x00001fe7, 0x00400053, 0x # ....R.@.....S.@.
	.word	0x00001ff2, 0x00400054, 0x00001ff3, 0x00400055, 0x # ....T.@.....U.@.
	.word	0x00001ff4, 0x00400056, 0x00001ff6, 0x00400057, 0x # ....V.@.....W.@.
	.word	0x00001ff7, 0x00400058, 0x00001ffc, 0x00400059, 0x # ....X.@.....Y.@.
	.word	0x0000214e, 0x00002132, 0x00002170, 0x00002160, 0x # N!..2!..p!..`!..
	.word	0x00002171, 0x00002161, 0x00002172, 0x00002162, 0x # q!..a!..r!..b!..
	.word	0x00002173, 0x00002163, 0x00002174, 0x00002164, 0x # s!..c!..t!..d!..
	.word	0x00002175, 0x00002165, 0x00002176, 0x00002166, 0x # u!..e!..v!..f!..
	.word	0x00002177, 0x00002167, 0x00002178, 0x00002168, 0x # w!..g!..x!..h!..
	.word	0x00002179, 0x00002169, 0x0000217a, 0x0000216a, 0x # y!..i!..z!..j!..
	.word	0x0000217b, 0x0000216b, 0x0000217c, 0x0000216c, 0x # {!..k!..|!..l!..
	.word	0x0000217d, 0x0000216d, 0x0000217e, 0x0000216e, 0x # }!..m!..~!..n!..
	.word	0x0000217f, 0x0000216f, 0x00002184, 0x00002183, 0x # .!..o!...!...!..
	.word	0x000024d0, 0x000024b6, 0x000024d1, 0x000024b7, 0x # .$...$...$...$..
	.word	0x000024d2, 0x000024b8, 0x000024d3, 0x000024b9, 0x # .$...$...$...$..
	.word	0x000024d4, 0x000024ba, 0x000024d5, 0x000024bb, 0x # .$...$...$...$..
	.word	0x000024d6, 0x000024bc, 0x000024d7, 0x000024bd, 0x # .$...$...$...$..
	.word	0x000024d8, 0x000024be, 0x000024d9, 0x000024bf, 0x # .$...$...$...$..
	.word	0x000024da, 0x000024c0, 0x000024db, 0x000024c1, 0x # .$...$...$...$..
	.word	0x000024dc, 0x000024c2, 0x000024dd, 0x000024c3, 0x # .$...$...$...$..
	.word	0x000024de, 0x000024c4, 0x000024df, 0x000024c5, 0x # .$...$...$...$..
	.word	0x000024e0, 0x000024c6, 0x000024e1, 0x000024c7, 0x # .$...$...$...$..
	.word	0x000024e2, 0x000024c8, 0x000024e3, 0x000024c9, 0x # .$...$...$...$..
	.word	0x000024e4, 0x000024ca, 0x000024e5, 0x000024cb, 0x # .$...$...$...$..
	.word	0x000024e6, 0x000024cc, 0x000024e7, 0x000024cd, 0x # .$...$...$...$..
	.word	0x000024e8, 0x000024ce, 0x000024e9, 0x000024cf, 0x # .$...$...$...$..
	.word	0x00002c30, 0x00002c00, 0x00002c31, 0x00002c01, 0x # 0,...,..1,...,..
	.word	0x00002c32, 0x00002c02, 0x00002c33, 0x00002c03, 0x # 2,...,..3,...,..
	.word	0x00002c34, 0x00002c04, 0x00002c35, 0x00002c05, 0x # 4,...,..5,...,..
	.word	0x00002c36, 0x00002c06, 0x00002c37, 0x00002c07, 0x # 6,...,..7,...,..
	.word	0x00002c38, 0x00002c08, 0x00002c39, 0x00002c09, 0x # 8,...,..9,...,..
	.word	0x00002c3a, 0x00002c0a, 0x00002c3b, 0x00002c0b, 0x # :,...,..;,...,..
	.word	0x00002c3c, 0x00002c0c, 0x00002c3d, 0x00002c0d, 0x # <,...,..=,...,..
	.word	0x00002c3e, 0x00002c0e, 0x00002c3f, 0x00002c0f, 0x # >,...,..?,...,..
	.word	0x00002c40, 0x00002c10, 0x00002c41, 0x00002c11, 0x # @,...,..A,...,..
	.word	0x00002c42, 0x00002c12, 0x00002c43, 0x00002c13, 0x # B,...,..C,...,..
	.word	0x00002c44, 0x00002c14, 0x00002c45, 0x00002c15, 0x # D,...,..E,...,..
	.word	0x00002c46, 0x00002c16, 0x00002c47, 0x00002c17, 0x # F,...,..G,...,..
	.word	0x00002c48, 0x00002c18, 0x00002c49, 0x00002c19, 0x # H,...,..I,...,..
	.word	0x00002c4a, 0x00002c1a, 0x00002c4b, 0x00002c1b, 0x # J,...,..K,...,..
	.word	0x00002c4c, 0x00002c1c, 0x00002c4d, 0x00002c1d, 0x # L,...,..M,...,..
	.word	0x00002c4e, 0x00002c1e, 0x00002c4f, 0x00002c1f, 0x # N,...,..O,...,..
	.word	0x00002c50, 0x00002c20, 0x00002c51, 0x00002c21, 0x # P,.. ,..Q,..!,..
	.word	0x00002c52, 0x00002c22, 0x00002c53, 0x00002c23, 0x # R,..",..S,..#,..
	.word	0x00002c54, 0x00002c24, 0x00002c55, 0x00002c25, 0x # T,..$,..U,..%,..
	.word	0x00002c56, 0x00002c26, 0x00002c57, 0x00002c27, 0x # V,..&,..W,..',..
	.word	0x00002c58, 0x00002c28, 0x00002c59, 0x00002c29, 0x # X,..(,..Y,..),..
	.word	0x00002c5a, 0x00002c2a, 0x00002c5b, 0x00002c2b, 0x # Z,..*,..[,..+,..
	.word	0x00002c5c, 0x00002c2c, 0x00002c5d, 0x00002c2d, 0x # \,..,,..],..-,..
	.word	0x00002c5e, 0x00002c2e, 0x00002c5f, 0x00002c2f, 0x # ^,...,.._,../,..
	.word	0x00002c61, 0x00002c60, 0x00002c65, 0x0000023a, 0x # a,..`,..e,..:...
	.word	0x00002c66, 0x0000023e, 0x00002c68, 0x00002c67, 0x # f,..>...h,..g,..
	.word	0x00002c6a, 0x00002c69, 0x00002c6c, 0x00002c6b, 0x # j,..i,..l,..k,..
	.word	0x00002c73, 0x00002c72, 0x00002c76, 0x00002c75, 0x # s,..r,..v,..u,..
	.word	0x00002c81, 0x00002c80, 0x00002c83, 0x00002c82, 0x # .,...,...,...,..
	.word	0x00002c85, 0x00002c84, 0x00002c87, 0x00002c86, 0x # .,...,...,...,..
	.word	0x00002c89, 0x00002c88, 0x00002c8b, 0x00002c8a, 0x # .,...,...,...,..
	.word	0x00002c8d, 0x00002c8c, 0x00002c8f, 0x00002c8e, 0x # .,...,...,...,..
	.word	0x00002c91, 0x00002c90, 0x00002c93, 0x00002c92, 0x # .,...,...,...,..
	.word	0x00002c95, 0x00002c94, 0x00002c97, 0x00002c96, 0x # .,...,...,...,..
	.word	0x00002c99, 0x00002c98, 0x00002c9b, 0x00002c9a, 0x # .,...,...,...,..
	.word	0x00002c9d, 0x00002c9c, 0x00002c9f, 0x00002c9e, 0x # .,...,...,...,..
	.word	0x00002ca1, 0x00002ca0, 0x00002ca3, 0x00002ca2, 0x # .,...,...,...,..
	.word	0x00002ca5, 0x00002ca4, 0x00002ca7, 0x00002ca6, 0x # .,...,...,...,..
	.word	0x00002ca9, 0x00002ca8, 0x00002cab, 0x00002caa, 0x # .,...,...,...,..
	.word	0x00002cad, 0x00002cac, 0x00002caf, 0x00002cae, 0x # .,...,...,...,..
	.word	0x00002cb1, 0x00002cb0, 0x00002cb3, 0x00002cb2, 0x # .,...,...,...,..
	.word	0x00002cb5, 0x00002cb4, 0x00002cb7, 0x00002cb6, 0x # .,...,...,...,..
	.word	0x00002cb9, 0x00002cb8, 0x00002cbb, 0x00002cba, 0x # .,...,...,...,..
	.word	0x00002cbd, 0x00002cbc, 0x00002cbf, 0x00002cbe, 0x # .,...,...,...,..
	.word	0x00002cc1, 0x00002cc0, 0x00002cc3, 0x00002cc2, 0x # .,...,...,...,..
	.word	0x00002cc5, 0x00002cc4, 0x00002cc7, 0x00002cc6, 0x # .,...,...,...,..
	.word	0x00002cc9, 0x00002cc8, 0x00002ccb, 0x00002cca, 0x # .,...,...,...,..
	.word	0x00002ccd, 0x00002ccc, 0x00002ccf, 0x00002cce, 0x # .,...,...,...,..
	.word	0x00002cd1, 0x00002cd0, 0x00002cd3, 0x00002cd2, 0x # .,...,...,...,..
	.word	0x00002cd5, 0x00002cd4, 0x00002cd7, 0x00002cd6, 0x # .,...,...,...,..
	.word	0x00002cd9, 0x00002cd8, 0x00002cdb, 0x00002cda, 0x # .,...,...,...,..
	.word	0x00002cdd, 0x00002cdc, 0x00002cdf, 0x00002cde, 0x # .,...,...,...,..
	.word	0x00002ce1, 0x00002ce0, 0x00002ce3, 0x00002ce2, 0x # .,...,...,...,..
	.word	0x00002cec, 0x00002ceb, 0x00002cee, 0x00002ced, 0x # .,...,...,...,..
	.word	0x00002cf3, 0x00002cf2, 0x00002d00, 0x000010a0, 0x # .,...,...-......
	.word	0x00002d01, 0x000010a1, 0x00002d02, 0x000010a2, 0x # .-.......-......
	.word	0x00002d03, 0x000010a3, 0x00002d04, 0x000010a4, 0x # .-.......-......
	.word	0x00002d05, 0x000010a5, 0x00002d06, 0x000010a6, 0x # .-.......-......
	.word	0x00002d07, 0x000010a7, 0x00002d08, 0x000010a8, 0x # .-.......-......
	.word	0x00002d09, 0x000010a9, 0x00002d0a, 0x000010aa, 0x # .-.......-......
	.word	0x00002d0b, 0x000010ab, 0x00002d0c, 0x000010ac, 0x # .-.......-......
	.word	0x00002d0d, 0x000010ad, 0x00002d0e, 0x000010ae, 0x # .-.......-......
	.word	0x00002d0f, 0x000010af, 0x00002d10, 0x000010b0, 0x # .-.......-......
	.word	0x00002d11, 0x000010b1, 0x00002d12, 0x000010b2, 0x # .-.......-......
	.word	0x00002d13, 0x000010b3, 0x00002d14, 0x000010b4, 0x # .-.......-......
	.word	0x00002d15, 0x000010b5, 0x00002d16, 0x000010b6, 0x # .-.......-......
	.word	0x00002d17, 0x000010b7, 0x00002d18, 0x000010b8, 0x # .-.......-......
	.word	0x00002d19, 0x000010b9, 0x00002d1a, 0x000010ba, 0x # .-.......-......
	.word	0x00002d1b, 0x000010bb, 0x00002d1c, 0x000010bc, 0x # .-.......-......
	.word	0x00002d1d, 0x000010bd, 0x00002d1e, 0x000010be, 0x # .-.......-......
	.word	0x00002d1f, 0x000010bf, 0x00002d20, 0x000010c0, 0x # .-...... -......
	.word	0x00002d21, 0x000010c1, 0x00002d22, 0x000010c2, 0x # !-......"-......
	.word	0x00002d23, 0x000010c3, 0x00002d24, 0x000010c4, 0x # #-......$-......
	.word	0x00002d25, 0x000010c5, 0x00002d27, 0x000010c7, 0x # %-......'-......
	.word	0x00002d2d, 0x000010cd, 0x0000a641, 0x0000a640, 0x # --......A...@...
	.word	0x0000a643, 0x0000a642, 0x0000a645, 0x0000a644, 0x # C...B...E...D...
	.word	0x0000a647, 0x0000a646, 0x0000a649, 0x0000a648, 0x # G...F...I...H...
	.word	0x0000a64b, 0x0000a64a, 0x0000a64d, 0x0000a64c, 0x # K...J...M...L...
	.word	0x0000a64f, 0x0000a64e, 0x0000a651, 0x0000a650, 0x # O...N...Q...P...
	.word	0x0000a653, 0x0000a652, 0x0000a655, 0x0000a654, 0x # S...R...U...T...
	.word	0x0000a657, 0x0000a656, 0x0000a659, 0x0000a658, 0x # W...V...Y...X...
	.word	0x0000a65b, 0x0000a65a, 0x0000a65d, 0x0000a65c, 0x # [...Z...]...\...
	.word	0x0000a65f, 0x0000a65e, 0x0000a661, 0x0000a660, 0x # _...^...a...`...
	.word	0x0000a663, 0x0000a662, 0x0000a665, 0x0000a664, 0x # c...b...e...d...
	.word	0x0000a667, 0x0000a666, 0x0000a669, 0x0000a668, 0x # g...f...i...h...
	.word	0x0000a66b, 0x0000a66a, 0x0000a66d, 0x0000a66c, 0x # k...j...m...l...
	.word	0x0000a681, 0x0000a680, 0x0000a683, 0x0000a682, 0x # ................
	.word	0x0000a685, 0x0000a684, 0x0000a687, 0x0000a686, 0x # ................
	.word	0x0000a689, 0x0000a688, 0x0000a68b, 0x0000a68a, 0x # ................
	.word	0x0000a68d, 0x0000a68c, 0x0000a68f, 0x0000a68e, 0x # ................
	.word	0x0000a691, 0x0000a690, 0x0000a693, 0x0000a692, 0x # ................
	.word	0x0000a695, 0x0000a694, 0x0000a697, 0x0000a696, 0x # ................
	.word	0x0000a699, 0x0000a698, 0x0000a69b, 0x0000a69a, 0x # ................
	.word	0x0000a723, 0x0000a722, 0x0000a725, 0x0000a724, 0x # #..."...%...$...
	.word	0x0000a727, 0x0000a726, 0x0000a729, 0x0000a728, 0x # '...&...)...(...
	.word	0x0000a72b, 0x0000a72a, 0x0000a72d, 0x0000a72c, 0x # +...*...-...,...
	.word	0x0000a72f, 0x0000a72e, 0x0000a733, 0x0000a732, 0x # /.......3...2...
	.word	0x0000a735, 0x0000a734, 0x0000a737, 0x0000a736, 0x # 5...4...7...6...
	.word	0x0000a739, 0x0000a738, 0x0000a73b, 0x0000a73a, 0x # 9...8...;...:...
	.word	0x0000a73d, 0x0000a73c, 0x0000a73f, 0x0000a73e, 0x # =...<...?...>...
	.word	0x0000a741, 0x0000a740, 0x0000a743, 0x0000a742, 0x # A...@...C...B...
	.word	0x0000a745, 0x0000a744, 0x0000a747, 0x0000a746, 0x # E...D...G...F...
	.word	0x0000a749, 0x0000a748, 0x0000a74b, 0x0000a74a, 0x # I...H...K...J...
	.word	0x0000a74d, 0x0000a74c, 0x0000a74f, 0x0000a74e, 0x # M...L...O...N...
	.word	0x0000a751, 0x0000a750, 0x0000a753, 0x0000a752, 0x # Q...P...S...R...
	.word	0x0000a755, 0x0000a754, 0x0000a757, 0x0000a756, 0x # U...T...W...V...
	.word	0x0000a759, 0x0000a758, 0x0000a75b, 0x0000a75a, 0x # Y...X...[...Z...
	.word	0x0000a75d, 0x0000a75c, 0x0000a75f, 0x0000a75e, 0x # ]...\..._...^...
	.word	0x0000a761, 0x0000a760, 0x0000a763, 0x0000a762, 0x # a...`...c...b...
	.word	0x0000a765, 0x0000a764, 0x0000a767, 0x0000a766, 0x # e...d...g...f...
	.word	0x0000a769, 0x0000a768, 0x0000a76b, 0x0000a76a, 0x # i...h...k...j...
	.word	0x0000a76d, 0x0000a76c, 0x0000a76f, 0x0000a76e, 0x # m...l...o...n...
	.word	0x0000a77a, 0x0000a779, 0x0000a77c, 0x0000a77b, 0x # z...y...|...{...
	.word	0x0000a77f, 0x0000a77e, 0x0000a781, 0x0000a780, 0x # ....~...........
	.word	0x0000a783, 0x0000a782, 0x0000a785, 0x0000a784, 0x # ................
	.word	0x0000a787, 0x0000a786, 0x0000a78c, 0x0000a78b, 0x # ................
	.word	0x0000a791, 0x0000a790, 0x0000a793, 0x0000a792, 0x # ................
	.word	0x0000a794, 0x0000a7c4, 0x0000a797, 0x0000a796, 0x # ................
	.word	0x0000a799, 0x0000a798, 0x0000a79b, 0x0000a79a, 0x # ................
	.word	0x0000a79d, 0x0000a79c, 0x0000a79f, 0x0000a79e, 0x # ................
	.word	0x0000a7a1, 0x0000a7a0, 0x0000a7a3, 0x0000a7a2, 0x # ................
	.word	0x0000a7a5, 0x0000a7a4, 0x0000a7a7, 0x0000a7a6, 0x # ................
	.word	0x0000a7a9, 0x0000a7a8, 0x0000a7b5, 0x0000a7b4, 0x # ................
	.word	0x0000a7b7, 0x0000a7b6, 0x0000a7b9, 0x0000a7b8, 0x # ................
	.word	0x0000a7bb, 0x0000a7ba, 0x0000a7bd, 0x0000a7bc, 0x # ................
	.word	0x0000a7bf, 0x0000a7be, 0x0000a7c1, 0x0000a7c0, 0x # ................
	.word	0x0000a7c3, 0x0000a7c2, 0x0000a7c8, 0x0000a7c7, 0x # ................
	.word	0x0000a7ca, 0x0000a7c9, 0x0000a7cd, 0x0000a7cc, 0x # ................
	.word	0x0000a7cf, 0x0000a7ce, 0x0000a7d1, 0x0000a7d0, 0x # ................
	.word	0x0000a7d3, 0x0000a7d2, 0x0000a7d5, 0x0000a7d4, 0x # ................
	.word	0x0000a7d7, 0x0000a7d6, 0x0000a7d9, 0x0000a7d8, 0x # ................
	.word	0x0000a7db, 0x0000a7da, 0x0000a7f6, 0x0000a7f5, 0x # ................
	.word	0x0000ab53, 0x0000a7b3, 0x0000ab70, 0x000013a0, 0x # S.......p.......
	.word	0x0000ab71, 0x000013a1, 0x0000ab72, 0x000013a2, 0x # q.......r.......
	.word	0x0000ab73, 0x000013a3, 0x0000ab74, 0x000013a4, 0x # s.......t.......
	.word	0x0000ab75, 0x000013a5, 0x0000ab76, 0x000013a6, 0x # u.......v.......
	.word	0x0000ab77, 0x000013a7, 0x0000ab78, 0x000013a8, 0x # w.......x.......
	.word	0x0000ab79, 0x000013a9, 0x0000ab7a, 0x000013aa, 0x # y.......z.......
	.word	0x0000ab7b, 0x000013ab, 0x0000ab7c, 0x000013ac, 0x # {.......|.......
	.word	0x0000ab7d, 0x000013ad, 0x0000ab7e, 0x000013ae, 0x # }.......~.......
	.word	0x0000ab7f, 0x000013af, 0x0000ab80, 0x000013b0, 0x # ................
	.word	0x0000ab81, 0x000013b1, 0x0000ab82, 0x000013b2, 0x # ................
	.word	0x0000ab83, 0x000013b3, 0x0000ab84, 0x000013b4, 0x # ................
	.word	0x0000ab85, 0x000013b5, 0x0000ab86, 0x000013b6, 0x # ................
	.word	0x0000ab87, 0x000013b7, 0x0000ab88, 0x000013b8, 0x # ................
	.word	0x0000ab89, 0x000013b9, 0x0000ab8a, 0x000013ba, 0x # ................
	.word	0x0000ab8b, 0x000013bb, 0x0000ab8c, 0x000013bc, 0x # ................
	.word	0x0000ab8d, 0x000013bd, 0x0000ab8e, 0x000013be, 0x # ................
	.word	0x0000ab8f, 0x000013bf, 0x0000ab90, 0x000013c0, 0x # ................
	.word	0x0000ab91, 0x000013c1, 0x0000ab92, 0x000013c2, 0x # ................
	.word	0x0000ab93, 0x000013c3, 0x0000ab94, 0x000013c4, 0x # ................
	.word	0x0000ab95, 0x000013c5, 0x0000ab96, 0x000013c6, 0x # ................
	.word	0x0000ab97, 0x000013c7, 0x0000ab98, 0x000013c8, 0x # ................
	.word	0x0000ab99, 0x000013c9, 0x0000ab9a, 0x000013ca, 0x # ................
	.word	0x0000ab9b, 0x000013cb, 0x0000ab9c, 0x000013cc, 0x # ................
	.word	0x0000ab9d, 0x000013cd, 0x0000ab9e, 0x000013ce, 0x # ................
	.word	0x0000ab9f, 0x000013cf, 0x0000aba0, 0x000013d0, 0x # ................
	.word	0x0000aba1, 0x000013d1, 0x0000aba2, 0x000013d2, 0x # ................
	.word	0x0000aba3, 0x000013d3, 0x0000aba4, 0x000013d4, 0x # ................
	.word	0x0000aba5, 0x000013d5, 0x0000aba6, 0x000013d6, 0x # ................
	.word	0x0000aba7, 0x000013d7, 0x0000aba8, 0x000013d8, 0x # ................
	.word	0x0000aba9, 0x000013d9, 0x0000abaa, 0x000013da, 0x # ................
	.word	0x0000abab, 0x000013db, 0x0000abac, 0x000013dc, 0x # ................
	.word	0x0000abad, 0x000013dd, 0x0000abae, 0x000013de, 0x # ................
	.word	0x0000abaf, 0x000013df, 0x0000abb0, 0x000013e0, 0x # ................
	.word	0x0000abb1, 0x000013e1, 0x0000abb2, 0x000013e2, 0x # ................
	.word	0x0000abb3, 0x000013e3, 0x0000abb4, 0x000013e4, 0x # ................
	.word	0x0000abb5, 0x000013e5, 0x0000abb6, 0x000013e6, 0x # ................
	.word	0x0000abb7, 0x000013e7, 0x0000abb8, 0x000013e8, 0x # ................
	.word	0x0000abb9, 0x000013e9, 0x0000abba, 0x000013ea, 0x # ................
	.word	0x0000abbb, 0x000013eb, 0x0000abbc, 0x000013ec, 0x # ................
	.word	0x0000abbd, 0x000013ed, 0x0000abbe, 0x000013ee, 0x # ................
	.word	0x0000abbf, 0x000013ef, 0x0000fb00, 0x0040005a, 0x # ............Z.@.
	.word	0x0000fb01, 0x0040005b, 0x0000fb02, 0x0040005c, 0x # ....[.@.....\.@.
	.word	0x0000fb03, 0x0040005d, 0x0000fb04, 0x0040005e, 0x # ....].@.....^.@.
	.word	0x0000fb05, 0x0040005f, 0x0000fb06, 0x00400060, 0x # ...._.@.....`.@.
	.word	0x0000fb13, 0x00400061, 0x0000fb14, 0x00400062, 0x # ....a.@.....b.@.
	.word	0x0000fb15, 0x00400063, 0x0000fb16, 0x00400064, 0x # ....c.@.....d.@.
	.word	0x0000fb17, 0x00400065, 0x0000ff41, 0x0000ff21, 0x # ....e.@.A...!...
	.word	0x0000ff42, 0x0000ff22, 0x0000ff43, 0x0000ff23, 0x # B..."...C...#...
	.word	0x0000ff44, 0x0000ff24, 0x0000ff45, 0x0000ff25, 0x # D...$...E...%...
	.word	0x0000ff46, 0x0000ff26, 0x0000ff47, 0x0000ff27, 0x # F...&...G...'...
	.word	0x0000ff48, 0x0000ff28, 0x0000ff49, 0x0000ff29, 0x # H...(...I...)...
	.word	0x0000ff4a, 0x0000ff2a, 0x0000ff4b, 0x0000ff2b, 0x # J...*...K...+...
	.word	0x0000ff4c, 0x0000ff2c, 0x0000ff4d, 0x0000ff2d, 0x # L...,...M...-...
	.word	0x0000ff4e, 0x0000ff2e, 0x0000ff4f, 0x0000ff2f, 0x # N.......O.../...
	.word	0x0000ff50, 0x0000ff30, 0x0000ff51, 0x0000ff31, 0x # P...0...Q...1...
	.word	0x0000ff52, 0x0000ff32, 0x0000ff53, 0x0000ff33, 0x # R...2...S...3...
	.word	0x0000ff54, 0x0000ff34, 0x0000ff55, 0x0000ff35, 0x # T...4...U...5...
	.word	0x0000ff56, 0x0000ff36, 0x0000ff57, 0x0000ff37, 0x # V...6...W...7...
	.word	0x0000ff58, 0x0000ff38, 0x0000ff59, 0x0000ff39, 0x # X...8...Y...9...
	.word	0x0000ff5a, 0x0000ff3a, 0x00010428, 0x00010400, 0x # Z...:...(.......
	.word	0x00010429, 0x00010401, 0x0001042a, 0x00010402, 0x # ).......*.......
	.word	0x0001042b, 0x00010403, 0x0001042c, 0x00010404, 0x # +.......,.......
	.word	0x0001042d, 0x00010405, 0x0001042e, 0x00010406, 0x # -...............
	.word	0x0001042f, 0x00010407, 0x00010430, 0x00010408, 0x # /.......0.......
	.word	0x00010431, 0x00010409, 0x00010432, 0x0001040a, 0x # 1.......2.......
	.word	0x00010433, 0x0001040b, 0x00010434, 0x0001040c, 0x # 3.......4.......
	.word	0x00010435, 0x0001040d, 0x00010436, 0x0001040e, 0x # 5.......6.......
	.word	0x00010437, 0x0001040f, 0x00010438, 0x00010410, 0x # 7.......8.......
	.word	0x00010439, 0x00010411, 0x0001043a, 0x00010412, 0x # 9.......:.......
	.word	0x0001043b, 0x00010413, 0x0001043c, 0x00010414, 0x # ;.......<.......
	.word	0x0001043d, 0x00010415, 0x0001043e, 0x00010416, 0x # =.......>.......
	.word	0x0001043f, 0x00010417, 0x00010440, 0x00010418, 0x # ?.......@.......
	.word	0x00010441, 0x00010419, 0x00010442, 0x0001041a, 0x # A.......B.......
	.word	0x00010443, 0x0001041b, 0x00010444, 0x0001041c, 0x # C.......D.......
	.word	0x00010445, 0x0001041d, 0x00010446, 0x0001041e, 0x # E.......F.......
	.word	0x00010447, 0x0001041f, 0x00010448, 0x00010420, 0x # G.......H... ...
	.word	0x00010449, 0x00010421, 0x0001044a, 0x00010422, 0x # I...!...J..."...
	.word	0x0001044b, 0x00010423, 0x0001044c, 0x00010424, 0x # K...#...L...$...
	.word	0x0001044d, 0x00010425, 0x0001044e, 0x00010426, 0x # M...%...N...&...
	.word	0x0001044f, 0x00010427, 0x000104d8, 0x000104b0, 0x # O...'...........
	.word	0x000104d9, 0x000104b1, 0x000104da, 0x000104b2, 0x # ................
	.word	0x000104db, 0x000104b3, 0x000104dc, 0x000104b4, 0x # ................
	.word	0x000104dd, 0x000104b5, 0x000104de, 0x000104b6, 0x # ................
	.word	0x000104df, 0x000104b7, 0x000104e0, 0x000104b8, 0x # ................
	.word	0x000104e1, 0x000104b9, 0x000104e2, 0x000104ba, 0x # ................
	.word	0x000104e3, 0x000104bb, 0x000104e4, 0x000104bc, 0x # ................
	.word	0x000104e5, 0x000104bd, 0x000104e6, 0x000104be, 0x # ................
	.word	0x000104e7, 0x000104bf, 0x000104e8, 0x000104c0, 0x # ................
	.word	0x000104e9, 0x000104c1, 0x000104ea, 0x000104c2, 0x # ................
	.word	0x000104eb, 0x000104c3, 0x000104ec, 0x000104c4, 0x # ................
	.word	0x000104ed, 0x000104c5, 0x000104ee, 0x000104c6, 0x # ................
	.word	0x000104ef, 0x000104c7, 0x000104f0, 0x000104c8, 0x # ................
	.word	0x000104f1, 0x000104c9, 0x000104f2, 0x000104ca, 0x # ................
	.word	0x000104f3, 0x000104cb, 0x000104f4, 0x000104cc, 0x # ................
	.word	0x000104f5, 0x000104cd, 0x000104f6, 0x000104ce, 0x # ................
	.word	0x000104f7, 0x000104cf, 0x000104f8, 0x000104d0, 0x # ................
	.word	0x000104f9, 0x000104d1, 0x000104fa, 0x000104d2, 0x # ................
	.word	0x000104fb, 0x000104d3, 0x00010597, 0x00010570, 0x # ............p...
	.word	0x00010598, 0x00010571, 0x00010599, 0x00010572, 0x # ....q.......r...
	.word	0x0001059a, 0x00010573, 0x0001059b, 0x00010574, 0x # ....s.......t...
	.word	0x0001059c, 0x00010575, 0x0001059d, 0x00010576, 0x # ....u.......v...
	.word	0x0001059e, 0x00010577, 0x0001059f, 0x00010578, 0x # ....w.......x...
	.word	0x000105a0, 0x00010579, 0x000105a1, 0x0001057a, 0x # ....y.......z...
	.word	0x000105a3, 0x0001057c, 0x000105a4, 0x0001057d, 0x # ....|.......}...
	.word	0x000105a5, 0x0001057e, 0x000105a6, 0x0001057f, 0x # ....~...........
	.word	0x000105a7, 0x00010580, 0x000105a8, 0x00010581, 0x # ................
	.word	0x000105a9, 0x00010582, 0x000105aa, 0x00010583, 0x # ................
	.word	0x000105ab, 0x00010584, 0x000105ac, 0x00010585, 0x # ................
	.word	0x000105ad, 0x00010586, 0x000105ae, 0x00010587, 0x # ................
	.word	0x000105af, 0x00010588, 0x000105b0, 0x00010589, 0x # ................
	.word	0x000105b1, 0x0001058a, 0x000105b3, 0x0001058c, 0x # ................
	.word	0x000105b4, 0x0001058d, 0x000105b5, 0x0001058e, 0x # ................
	.word	0x000105b6, 0x0001058f, 0x000105b7, 0x00010590, 0x # ................
	.word	0x000105b8, 0x00010591, 0x000105b9, 0x00010592, 0x # ................
	.word	0x000105bb, 0x00010594, 0x000105bc, 0x00010595, 0x # ................
	.word	0x00010cc0, 0x00010c80, 0x00010cc1, 0x00010c81, 0x # ................
	.word	0x00010cc2, 0x00010c82, 0x00010cc3, 0x00010c83, 0x # ................
	.word	0x00010cc4, 0x00010c84, 0x00010cc5, 0x00010c85, 0x # ................
	.word	0x00010cc6, 0x00010c86, 0x00010cc7, 0x00010c87, 0x # ................
	.word	0x00010cc8, 0x00010c88, 0x00010cc9, 0x00010c89, 0x # ................
	.word	0x00010cca, 0x00010c8a, 0x00010ccb, 0x00010c8b, 0x # ................
	.word	0x00010ccc, 0x00010c8c, 0x00010ccd, 0x00010c8d, 0x # ................
	.word	0x00010cce, 0x00010c8e, 0x00010ccf, 0x00010c8f, 0x # ................
	.word	0x00010cd0, 0x00010c90, 0x00010cd1, 0x00010c91, 0x # ................
	.word	0x00010cd2, 0x00010c92, 0x00010cd3, 0x00010c93, 0x # ................
	.word	0x00010cd4, 0x00010c94, 0x00010cd5, 0x00010c95, 0x # ................
	.word	0x00010cd6, 0x00010c96, 0x00010cd7, 0x00010c97, 0x # ................
	.word	0x00010cd8, 0x00010c98, 0x00010cd9, 0x00010c99, 0x # ................
	.word	0x00010cda, 0x00010c9a, 0x00010cdb, 0x00010c9b, 0x # ................
	.word	0x00010cdc, 0x00010c9c, 0x00010cdd, 0x00010c9d, 0x # ................
	.word	0x00010cde, 0x00010c9e, 0x00010cdf, 0x00010c9f, 0x # ................
	.word	0x00010ce0, 0x00010ca0, 0x00010ce1, 0x00010ca1, 0x # ................
	.word	0x00010ce2, 0x00010ca2, 0x00010ce3, 0x00010ca3, 0x # ................
	.word	0x00010ce4, 0x00010ca4, 0x00010ce5, 0x00010ca5, 0x # ................
	.word	0x00010ce6, 0x00010ca6, 0x00010ce7, 0x00010ca7, 0x # ................
	.word	0x00010ce8, 0x00010ca8, 0x00010ce9, 0x00010ca9, 0x # ................
	.word	0x00010cea, 0x00010caa, 0x00010ceb, 0x00010cab, 0x # ................
	.word	0x00010cec, 0x00010cac, 0x00010ced, 0x00010cad, 0x # ................
	.word	0x00010cee, 0x00010cae, 0x00010cef, 0x00010caf, 0x # ................
	.word	0x00010cf0, 0x00010cb0, 0x00010cf1, 0x00010cb1, 0x # ................
	.word	0x00010cf2, 0x00010cb2, 0x00010d70, 0x00010d50, 0x # ........p...P...
	.word	0x00010d71, 0x00010d51, 0x00010d72, 0x00010d52, 0x # q...Q...r...R...
	.word	0x00010d73, 0x00010d53, 0x00010d74, 0x00010d54, 0x # s...S...t...T...
	.word	0x00010d75, 0x00010d55, 0x00010d76, 0x00010d56, 0x # u...U...v...V...
	.word	0x00010d77, 0x00010d57, 0x00010d78, 0x00010d58, 0x # w...W...x...X...
	.word	0x00010d79, 0x00010d59, 0x00010d7a, 0x00010d5a, 0x # y...Y...z...Z...
	.word	0x00010d7b, 0x00010d5b, 0x00010d7c, 0x00010d5c, 0x # {...[...|...\...
	.word	0x00010d7d, 0x00010d5d, 0x00010d7e, 0x00010d5e, 0x # }...]...~...^...
	.word	0x00010d7f, 0x00010d5f, 0x00010d80, 0x00010d60, 0x # ...._.......`...
	.word	0x00010d81, 0x00010d61, 0x00010d82, 0x00010d62, 0x # ....a.......b...
	.word	0x00010d83, 0x00010d63, 0x00010d84, 0x00010d64, 0x # ....c.......d...
	.word	0x00010d85, 0x00010d65, 0x000118c0, 0x000118a0, 0x # ....e...........
	.word	0x000118c1, 0x000118a1, 0x000118c2, 0x000118a2, 0x # ................
	.word	0x000118c3, 0x000118a3, 0x000118c4, 0x000118a4, 0x # ................
	.word	0x000118c5, 0x000118a5, 0x000118c6, 0x000118a6, 0x # ................
	.word	0x000118c7, 0x000118a7, 0x000118c8, 0x000118a8, 0x # ................
	.word	0x000118c9, 0x000118a9, 0x000118ca, 0x000118aa, 0x # ................
	.word	0x000118cb, 0x000118ab, 0x000118cc, 0x000118ac, 0x # ................
	.word	0x000118cd, 0x000118ad, 0x000118ce, 0x000118ae, 0x # ................
	.word	0x000118cf, 0x000118af, 0x000118d0, 0x000118b0, 0x # ................
	.word	0x000118d1, 0x000118b1, 0x000118d2, 0x000118b2, 0x # ................
	.word	0x000118d3, 0x000118b3, 0x000118d4, 0x000118b4, 0x # ................
	.word	0x000118d5, 0x000118b5, 0x000118d6, 0x000118b6, 0x # ................
	.word	0x000118d7, 0x000118b7, 0x000118d8, 0x000118b8, 0x # ................
	.word	0x000118d9, 0x000118b9, 0x000118da, 0x000118ba, 0x # ................
	.word	0x000118db, 0x000118bb, 0x000118dc, 0x000118bc, 0x # ................
	.word	0x000118dd, 0x000118bd, 0x000118de, 0x000118be, 0x # ................
	.word	0x000118df, 0x000118bf, 0x00016e60, 0x00016e40, 0x # ........`n..@n..
	.word	0x00016e61, 0x00016e41, 0x00016e62, 0x00016e42, 0x # an..An..bn..Bn..
	.word	0x00016e63, 0x00016e43, 0x00016e64, 0x00016e44, 0x # cn..Cn..dn..Dn..
	.word	0x00016e65, 0x00016e45, 0x00016e66, 0x00016e46, 0x # en..En..fn..Fn..
	.word	0x00016e67, 0x00016e47, 0x00016e68, 0x00016e48, 0x # gn..Gn..hn..Hn..
	.word	0x00016e69, 0x00016e49, 0x00016e6a, 0x00016e4a, 0x # in..In..jn..Jn..
	.word	0x00016e6b, 0x00016e4b, 0x00016e6c, 0x00016e4c, 0x # kn..Kn..ln..Ln..
	.word	0x00016e6d, 0x00016e4d, 0x00016e6e, 0x00016e4e, 0x # mn..Mn..nn..Nn..
	.word	0x00016e6f, 0x00016e4f, 0x00016e70, 0x00016e50, 0x # on..On..pn..Pn..
	.word	0x00016e71, 0x00016e51, 0x00016e72, 0x00016e52, 0x # qn..Qn..rn..Rn..
	.word	0x00016e73, 0x00016e53, 0x00016e74, 0x00016e54, 0x # sn..Sn..tn..Tn..
	.word	0x00016e75, 0x00016e55, 0x00016e76, 0x00016e56, 0x # un..Un..vn..Vn..
	.word	0x00016e77, 0x00016e57, 0x00016e78, 0x00016e58, 0x # wn..Wn..xn..Xn..
	.word	0x00016e79, 0x00016e59, 0x00016e7a, 0x00016e5a, 0x # yn..Yn..zn..Zn..
	.word	0x00016e7b, 0x00016e5b, 0x00016e7c, 0x00016e5c, 0x # {n..[n..|n..\n..
	.word	0x00016e7d, 0x00016e5d, 0x00016e7e, 0x00016e5e, 0x # }n..]n..~n..^n..
	.word	0x00016e7f, 0x00016e5f, 0x00016ebb, 0x00016ea0, 0x # .n.._n...n...n..
	.word	0x00016ebc, 0x00016ea1, 0x00016ebd, 0x00016ea2, 0x # .n...n...n...n..
	.word	0x00016ebe, 0x00016ea3, 0x00016ebf, 0x00016ea4, 0x # .n...n...n...n..
	.word	0x00016ec0, 0x00016ea5, 0x00016ec1, 0x00016ea6, 0x # .n...n...n...n..
	.word	0x00016ec2, 0x00016ea7, 0x00016ec3, 0x00016ea8, 0x # .n...n...n...n..
	.word	0x00016ec4, 0x00016ea9, 0x00016ec5, 0x00016eaa, 0x # .n...n...n...n..
	.word	0x00016ec6, 0x00016eab, 0x00016ec7, 0x00016eac, 0x # .n...n...n...n..
	.word	0x00016ec8, 0x00016ead, 0x00016ec9, 0x00016eae, 0x # .n...n...n...n..
	.word	0x00016eca, 0x00016eaf, 0x00016ecb, 0x00016eb0, 0x # .n...n...n...n..
	.word	0x00016ecc, 0x00016eb1, 0x00016ecd, 0x00016eb2, 0x # .n...n...n...n..
	.word	0x00016ece, 0x00016eb3, 0x00016ecf, 0x00016eb4, 0x # .n...n...n...n..
	.word	0x00016ed0, 0x00016eb5, 0x00016ed1, 0x00016eb6, 0x # .n...n...n...n..
	.word	0x00016ed2, 0x00016eb7, 0x00016ed3, 0x00016eb8, 0x # .n...n...n...n..
	.word	0x0001e922, 0x0001e900, 0x0001e923, 0x0001e901, 0x # ".......#.......
	.word	0x0001e924, 0x0001e902, 0x0001e925, 0x0001e903, 0x # $.......%.......
	.word	0x0001e926, 0x0001e904, 0x0001e927, 0x0001e905, 0x # &.......'.......
	.word	0x0001e928, 0x0001e906, 0x0001e929, 0x0001e907, 0x # (.......).......
	.word	0x0001e92a, 0x0001e908, 0x0001e92b, 0x0001e909, 0x # *.......+.......
	.word	0x0001e92c, 0x0001e90a, 0x0001e92d, 0x0001e90b, 0x # ,.......-.......
	.word	0x0001e92e, 0x0001e90c, 0x0001e92f, 0x0001e90d, 0x # ......../.......
	.word	0x0001e930, 0x0001e90e, 0x0001e931, 0x0001e90f, 0x # 0.......1.......
	.word	0x0001e932, 0x0001e910, 0x0001e933, 0x0001e911, 0x # 2.......3.......
	.word	0x0001e934, 0x0001e912, 0x0001e935, 0x0001e913, 0x # 4.......5.......
	.word	0x0001e936, 0x0001e914, 0x0001e937, 0x0001e915, 0x # 6.......7.......
	.word	0x0001e938, 0x0001e916, 0x0001e939, 0x0001e917, 0x # 8.......9.......
	.word	0x0001e93a, 0x0001e918, 0x0001e93b, 0x0001e919, 0x # :.......;.......
	.word	0x0001e93c, 0x0001e91a, 0x0001e93d, 0x0001e91b, 0x # <.......=.......
	.word	0x0001e93e, 0x0001e91c, 0x0001e93f, 0x0001e91d, 0x # >.......?.......
	.word	0x0001e940, 0x0001e91e, 0x0001e941, 0x0001e91f, 0x # @.......A.......
	.word	0x0001e942, 0x0001e920, 0x0001e943, 0x0001e921, 0x # B... ...C...!...

.Lanon.93378afd097c98d6944e7e9e652eb25e.247:
	.word	0x00000053, 0x00000053, 0x00000000, 0x000002bc, 0x # S...S...........
	.word	0x0000004e, 0x00000000, 0x0000004a, 0x0000030c, 0x # N.......J.......
	.word	0x00000000, 0x00000399, 0x00000308, 0x00000301, 0x # ................
	.word	0x000003a5, 0x00000308, 0x00000301, 0x00000535, 0x # ............5...
	.word	0x00000552, 0x00000000, 0x00000048, 0x00000331, 0x # R.......H...1...
	.word	0x00000000, 0x00000054, 0x00000308, 0x00000000, 0x # ....T...........
	.word	0x00000057, 0x0000030a, 0x00000000, 0x00000059, 0x # W...........Y...
	.word	0x0000030a, 0x00000000, 0x00000041, 0x000002be, 0x # ........A.......
	.word	0x00000000, 0x000003a5, 0x00000313, 0x00000000, 0x # ................
	.word	0x000003a5, 0x00000313, 0x00000300, 0x000003a5, 0x # ................
	.word	0x00000313, 0x00000301, 0x000003a5, 0x00000313, 0x # ................
	.word	0x00000342, 0x00001f08, 0x00000399, 0x00000000, 0x # B...............
	.word	0x00001f09, 0x00000399, 0x00000000, 0x00001f0a, 0x # ................
	.word	0x00000399, 0x00000000, 0x00001f0b, 0x00000399, 0x # ................
	.word	0x00000000, 0x00001f0c, 0x00000399, 0x00000000, 0x # ................
	.word	0x00001f0d, 0x00000399, 0x00000000, 0x00001f0e, 0x # ................
	.word	0x00000399, 0x00000000, 0x00001f0f, 0x00000399, 0x # ................
	.word	0x00000000, 0x00001f08, 0x00000399, 0x00000000, 0x # ................
	.word	0x00001f09, 0x00000399, 0x00000000, 0x00001f0a, 0x # ................
	.word	0x00000399, 0x00000000, 0x00001f0b, 0x00000399, 0x # ................
	.word	0x00000000, 0x00001f0c, 0x00000399, 0x00000000, 0x # ................
	.word	0x00001f0d, 0x00000399, 0x00000000, 0x00001f0e, 0x # ................
	.word	0x00000399, 0x00000000, 0x00001f0f, 0x00000399, 0x # ................
	.word	0x00000000, 0x00001f28, 0x00000399, 0x00000000, 0x # ....(...........
	.word	0x00001f29, 0x00000399, 0x00000000, 0x00001f2a, 0x # )...........*...
	.word	0x00000399, 0x00000000, 0x00001f2b, 0x00000399, 0x # ........+.......
	.word	0x00000000, 0x00001f2c, 0x00000399, 0x00000000, 0x # ....,...........
	.word	0x00001f2d, 0x00000399, 0x00000000, 0x00001f2e, 0x # -...............
	.word	0x00000399, 0x00000000, 0x00001f2f, 0x00000399, 0x # ......../.......
	.word	0x00000000, 0x00001f28, 0x00000399, 0x00000000, 0x # ....(...........
	.word	0x00001f29, 0x00000399, 0x00000000, 0x00001f2a, 0x # )...........*...
	.word	0x00000399, 0x00000000, 0x00001f2b, 0x00000399, 0x # ........+.......
	.word	0x00000000, 0x00001f2c, 0x00000399, 0x00000000, 0x # ....,...........
	.word	0x00001f2d, 0x00000399, 0x00000000, 0x00001f2e, 0x # -...............
	.word	0x00000399, 0x00000000, 0x00001f2f, 0x00000399, 0x # ......../.......
	.word	0x00000000, 0x00001f68, 0x00000399, 0x00000000, 0x # ....h...........
	.word	0x00001f69, 0x00000399, 0x00000000, 0x00001f6a, 0x # i...........j...
	.word	0x00000399, 0x00000000, 0x00001f6b, 0x00000399, 0x # ........k.......
	.word	0x00000000, 0x00001f6c, 0x00000399, 0x00000000, 0x # ....l...........
	.word	0x00001f6d, 0x00000399, 0x00000000, 0x00001f6e, 0x # m...........n...
	.word	0x00000399, 0x00000000, 0x00001f6f, 0x00000399, 0x # ........o.......
	.word	0x00000000, 0x00001f68, 0x00000399, 0x00000000, 0x # ....h...........
	.word	0x00001f69, 0x00000399, 0x00000000, 0x00001f6a, 0x # i...........j...
	.word	0x00000399, 0x00000000, 0x00001f6b, 0x00000399, 0x # ........k.......
	.word	0x00000000, 0x00001f6c, 0x00000399, 0x00000000, 0x # ....l...........
	.word	0x00001f6d, 0x00000399, 0x00000000, 0x00001f6e, 0x # m...........n...
	.word	0x00000399, 0x00000000, 0x00001f6f, 0x00000399, 0x # ........o.......
	.word	0x00000000, 0x00001fba, 0x00000399, 0x00000000, 0x # ................
	.word	0x00000391, 0x00000399, 0x00000000, 0x00000386, 0x # ................
	.word	0x00000399, 0x00000000, 0x00000391, 0x00000342, 0x # ............B...
	.word	0x00000000, 0x00000391, 0x00000342, 0x00000399, 0x # ........B.......
	.word	0x00000391, 0x00000399, 0x00000000, 0x00001fca, 0x # ................
	.word	0x00000399, 0x00000000, 0x00000397, 0x00000399, 0x # ................
	.word	0x00000000, 0x00000389, 0x00000399, 0x00000000, 0x # ................
	.word	0x00000397, 0x00000342, 0x00000000, 0x00000397, 0x # ....B...........
	.word	0x00000342, 0x00000399, 0x00000397, 0x00000399, 0x # B...............
	.word	0x00000000, 0x00000399, 0x00000308, 0x00000300, 0x # ................
	.word	0x00000399, 0x00000308, 0x00000301, 0x00000399, 0x # ................
	.word	0x00000342, 0x00000000, 0x00000399, 0x00000308, 0x # B...............
	.word	0x00000342, 0x000003a5, 0x00000308, 0x00000300, 0x # B...............
	.word	0x000003a5, 0x00000308, 0x00000301, 0x000003a1, 0x # ................
	.word	0x00000313, 0x00000000, 0x000003a5, 0x00000342, 0x # ............B...
	.word	0x00000000, 0x000003a5, 0x00000308, 0x00000342, 0x # ............B...
	.word	0x00001ffa, 0x00000399, 0x00000000, 0x000003a9, 0x # ................
	.word	0x00000399, 0x00000000, 0x0000038f, 0x00000399, 0x # ................
	.word	0x00000000, 0x000003a9, 0x00000342, 0x00000000, 0x # ........B.......
	.word	0x000003a9, 0x00000342, 0x00000399, 0x000003a9, 0x # ....B...........
	.word	0x00000399, 0x00000000, 0x00000046, 0x00000046, 0x # ........F...F...
	.word	0x00000000, 0x00000046, 0x00000049, 0x00000000, 0x # ....F...I.......
	.word	0x00000046, 0x0000004c, 0x00000000, 0x00000046, 0x # F...L.......F...
	.word	0x00000046, 0x00000049, 0x00000046, 0x00000046, 0x # F...I...F...F...
	.word	0x0000004c, 0x00000053, 0x00000054, 0x00000000, 0x # L...S...T.......
	.word	0x00000053, 0x00000054, 0x00000000, 0x00000544, 0x # S...T.......D...
	.word	0x00000546, 0x00000000, 0x00000544, 0x00000535, 0x # F.......D...5...
	.word	0x00000000, 0x00000544, 0x0000053b, 0x00000000, 0x # ....D...;.......
	.word	0x0000054e, 0x00000546, 0x00000000, 0x00000544, 0x # N...F.......D...
	.word	0x0000053d, 0x00000000, 0x # =.......

	.globl _ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h7bfa44fc94e03442E
_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h7bfa44fc94e03442E:
	.word	0x00000300, 0x00200483, 0x00600591, 0x00a0135d, 0x # ...... ...`.]...
	.word	0x1f201712, 0x1f60200c, 0x2b602cef, 0x2be0302a, 0x # .. .. `..,`+*0.+
	.word	0x2ca0a66f, 0x2d20a802, 0x2e20fb1e, 0x3660fe00, 0x # o..,.. -.. ...`6
	.word	0x36a0ff9e, 0x372101fd, 0x37610a01, 0x38210d24, 0x # ...6..!7..a7$.!8
	.word	0x39a10eab, 0x3a21182f, 0x4b211ef3, 0x53a13440, 0x # ...9/.!:..!K@4.S
	.word	0x54e1611e, 0x55616af0, 0x55e16f4f, 0x5661bc9d, 0x # .a.T.jaUOo.U..aV
	.word	0x5761cf00, 0x57a1d165, 0x5821da00, 0x59a1e000, 0x # ..aWe..W..!X...Y
	.word	0x5b21e2ae, 0x5ce1e4ec, 0x5d61e8d0, 0x5eee0020, 0x # ..![...\..a] ..^
# 80020f58:	5f7f01f0                                ..._

.Lanon.93378afd097c98d6944e7e9e652eb25e.252:
	.word	0x01010600, 0x02040103, 0x02070705, 0x02090808, 0x # ................
	.word	0x020b050a, 0x0110040e, 0x05120211, 0x01141c13, 0x # ................
	.word	0x02170215, 0x051c0d19, 0x011f081d, 0x046a0124, 0x # ............$.j.
	.word	0x026e026b, 0x02b103af, 0x02cf02bc, 0x0cd402d1, 0x # k.n.............
	.word	0x02d609d5, 0x01da02d7, 0x02e105e0, 0x04e701e6, 0x # ................
	.word	0x20ee02e8, 0x02f804f0, 0x01fb05fa, 0x # ... ........

.Lanon.93378afd097c98d6944e7e9e652eb25e.253:
	.word	0x3e3b270c, 0x9e8f4f4e, 0x8b7b9f9e, 0xb2a29693, 0x # .';>NO....{.....
	.word	0x06b186ba, 0x3d360907, 0xd0f3563e, 0x181404d1, 0x # ......6=>V......
	.word	0x57563736, 0xafaeaa7f, 0x12e035bd, 0x9e8e8987, 0x # 67VW.....5......
	.word	0x110e0d04, 0x34312912, 0x4946453a, 0x644f4e4a, 0x # .....)14:EFIJNOd
	.word	0x8d8c8a65, 0xc3c1b68f, 0xd6cbc6c4, 0x1bb7b65c, 0x # e...........\...
	.word	0x0a08071c, 0x3617140b, 0xa9a83a39, 0x3709d9d8, 0x # .......69:.....7
	.word	0x07a89190, 0x663e3b0a, 0x11928f69, 0xeebf5f6f, 0x # .....;>fi...o_..
	.word	0xb9625aef, 0xfffcf4ba, 0x9b9a5453, 0x28272f2e, 0x # .Zb.....ST.../'(
	.word	0xa1a09d55, 0xa8a7a4a3, 0xc4bcbaad, 0x150c0b06, 0x # U...............
	.word	0x453f3a1d, 0xcca7a651, 0x1907a0cd, 0x3e25221a, 0x # .:?EQ........"%>
	.word	0xece7df3f, 0xc6c5ffef, 0x25232004, 0x38332826, 0x # ?........ #%&(38
	.word	0x4c4a483a, 0x56555350, 0x5e5c5a58, 0x66656360, 0x # :HJLPSUVXZ\^`cef
	.word	0x7d78736b, 0xaaa48a7f, 0xd0c0b0af, 0x6f6eafae, 0x # ksx}..........no
# 80021088:	93deddc7                                ....

.Lanon.93378afd097c98d6944e7e9e652eb25e.254:
	.word	0x057b225e, 0x032d0403, 0x2f010366, 0x1d82802e, 0x # ^"{...-.f../....
	.word	0x1c0f3103, 0x1e092404, 0x44052b05, 0x802a0e04, 0x # .1...$...+.D..*.
	.word	0x042406aa, 0x08280424, 0x034e0b34, 0x37810c34, 0x # ..$.$.(.4.N.4..7
	.word	0x080a1609, 0x39453b18, 0x09086303, 0x21051630, 0x # .....;E9.c..0..!
	.word	0x1b051b03, 0x4b043826, 0x0a042f05, 0x40070907, 0x # ....&8.K./.....@
	.word	0x0c042720, 0x3a033609, 0x04071a05, 0x4950070c, 0x # '...6.:......PI
	.word	0x330d3337, 0x0a082e07, 0x1d032606, 0xd0800208, 0x # 73.3.....&......
	.word	0x08061052, 0x082e2109, 0x261a162a, 0x0917141c, 0x # R....!..*..&....
	.word	0x0924044e, 0x07190d44, 0x0848060a, 0x0b750927, 0x # N.$.D.....H.'.u.
	.word	0x062a3e42, 0x060a053b, 0x05010651, 0x0b050310, 0x # B>*.;...Q.......
	.word	0x1d020859, 0x08481e62, 0x5ea6800a, 0x0a0b4522, 0x # Y...b.H....^"E..
	.word	0x3a130d06, 0x14060a06, 0x17042c1c, 0x643cb980, 0x # ...:.....,....<d
	.word	0x09480c53, 0x1b45460a, 0x0d530848, 0x560a0749, 0x # S.H..FE.H.S.I..V
	.word	0x0e225808, 0x0a46060a, 0x4947031d, 0x080e0337, 0x # .X"...F...GI7...
	.word	0x0739060a, 0x042c060a, 0x19f6800a, 0x1d033b07, 0x # ..9...,......;..
	.word	0x320f0155, 0x669b830d, 0xc4800b75, 0x0d634c8a, 0x # U..2...fu....Lc.
	.word	0x16103084, 0x059b8f0a, 0xb99a4782, 0x82c6863a, 0x # .0.......G..:...
	.word	0x042a0739, 0x0a26065c, 0x05280a46, 0x3ab08113, 0x # 9.*.\.&.F.(....:
	.word	0x055bc680, 0x044b2c34, 0x40110739, 0x09070b05, 0x # ..[.4,K.9..@....
	.word	0x2029d69c, 0xfda17361, 0x010f3381, 0x040e061d, 0x # ..) as...3......
	.word	0x898c8108, 0x0d056b04, 0x10070903, 0xfd80608f, 0x # .....k.......`..
	.word	0x06b48103, 0x0f110f17, 0x3c740947, 0x730af680, 0x # ........G.t<...s
	.word	0x46157008, 0x140c147a, 0x1909570c, 0x47818780, 0x # .p.Fz....W.....G
	.word	0x0f428503, 0x1f508415, 0xd5800606, 0x213e052b, 0x # ..B...P.....+.>!
	.word	0x032d7001, 0x8102041a, 0x3a111f40, 0xd0810105, 0x # .p-.....@..:....
	.word	0x2bd6802a, 0xc0800104, 0x80020836, 0x29f780e0, 0x # *..+....6......)
	.word	0x040a044c, 0x44118302, 0xc2803d4c, 0x0401063c, 0x # L......DL=..<...
	.word	0x341b0555, 0x2c0e8102, 0x560c6404, 0x38ae800a, 0x # U..4...,.d.V...8
	.word	0x042c0d1d, 0x0e020709, 0x839a8006, 0x031103d9, 0x # ..,.............
	.word	0xda80030d, 0x01040c06, 0x38040c0f, 0x28060a08, 0x # ...........8...(
	.word	0x02042c08, 0x8127090e, 0x031d0858, 0x043b030b, 0x # .,....'.X.....;.
	.word	0x070a041e, 0x0584fb80, 0x # ........

.Lanon.93378afd097c98d6944e7e9e652eb25e.255:
	.word	0x05030100, 0x02060605, 0x07080607, 0x1c0a1109, 0x # ................
	.word	0x190c190b, 0x0c0e100d, 0x0310040f, 0x09131212, 0x # ................
	.word	0x04170116, 0x03190118, 0x011b091a, 0x161f021c, 0x # ................
	.word	0x022b0320, 0x012e0b2d, 0x02310430, 0x02a90132, 0x # .+.-...0.1.2...
	.word	0x08ab04aa, 0x05fb02fa, 0x09ff03fe, 0x # ............

.Lanon.93378afd097c98d6944e7e9e652eb25e.256:
	.word	0x8b7978ad, 0x5730a28d, 0x908c8b58, 0x0f0edd1c, 0x # .xy...0WX.......
	.word	0xfcfb4c4b, 0x5c3f2f2e, 0x84e25f5d, 0x92918e8d, 0x # KL.../?\]_......
	.word	0xbbbab1a9, 0xcac9c6c5, 0xffe5e4de, 0x12110400, 0x # ................
	.word	0x37343129, 0x493d3b3a, 0x8e845d4a, 0xb4b1a992, 0x # )147:;=IJ]......
	.word	0xcac6bbba, 0xe5e4cfce, 0x0e0d0400, 0x31291211, 0x # ..............)1
	.word	0x453b3a34, 0x5e4a4946, 0x91846564, 0xcec99d9b, 0x # 4:;EFIJ^de......
	.word	0x29110dcf, 0x49453b3a, 0x5f5e5b57, 0x918d6564, 0x # ...):;EIW[^_de..
	.word	0xbbbab4a9, 0xe4dfc9c5, 0x110df0e5, 0x65644945, 0x # ............EIde
	.word	0xbcb28480, 0xd7d5bfbe, 0x8583f1f0, 0xbea6a48b, 0x # ................
	.word	0xcfc7c5bf, 0x9848dbda, 0xcec6cdbd, 0x4f4e49cf, 0x # ......H......INO
	.word	0x5f5e5957, 0xb18f8e89, 0xc1bfb7b6, 0x11d7c7c6, 0x # WY^_............
	.word	0x5c5b1716, 0xfffef7f6, 0xde716d80, 0x6e1f0edf, 0x # ..[\.....mq....n
	.word	0x5f1d1c6f, 0xafae7e7d, 0xbb4ddfde, 0x1e1716bc, 0x # o.._}~....M.....
	.word	0x4e47461f, 0x5c5a584f, 0xb57f7e5e, 0xdcd5d4c5, 0x # .FGNOXZ\^~......
	.word	0x72f5f1f0, 0x75748f73, 0xa72f2e26, 0xc7bfb7af, 0x # ...rs.tu&./.....
	.word	0x9adfd7cf, 0x98974000, 0xce1f8f30, 0x5a4f4eff, 0x # .....@..0....NOZ
	.word	0x0f08075b, 0xee2f2710, 0x376f6eef, 0x45423f3d, 0x # [....'/..no7=?BE
	.word	0xc8756753, 0xd8d1d0c9, 0xfffee7d9, 0x # Sgu.........

.Lanon.93378afd097c98d6944e7e9e652eb25e.257:
	.word	0x225f2000, 0x8204df82, 0x041b0844, 0xac811106, 0x # . _"....D.......
	.word	0x05ab800e, 0x1c810720, 0x01081903, 0x34042f04, 0x # .... ......../.4
	.word	0x01030704, 0x11070607, 0x120f500a, 0x03075507, 0x # .........P...U..
	.word	0x090a1c04, 0x07030803, 0x03030203, 0x05040c03, 0x # ................
	.word	0x01060b03, 0x4e05150e, 0x57071b07, 0x18050207, 0x # .......N...W....
	.word	0x4304500c, 0x01032d03, 0x0f061104, 0x1d043a0c, 0x # .P.C.-.......:..
	.word	0x6d205f25, 0x80256a04, 0xb08205c8, 0x82061a03, 0x # %_ m.j%.........
	.word	0x075903fd, 0x09180916, 0x0c140c14, 0x060a066a, 0x # ..Y.........j...
	.word	0x0759061a, 0x0a46052b, 0x040c042c, 0x0b310301, 0x # ..Y.+.F.,.....1.
	.word	0x061a042c, 0xac80030b, 0x4c060a06, 0x08f48014, 0x # ,..........L....
	.word	0x030f033c, 0x0838053e, 0xff82052b, 0x2f081811, 0x # <...>.8.+....../
	.word	0x22032d11, 0x800f210e, 0x9a82048c, 0x88150b16, 0x # .-.".!..........
	.word	0x052f0594, 0x0e02073b, 0xbe800918, 0x800c7422, 0x # ../.;......."t..
	.word	0x10811ad6, 0x09e18005, 0x37039ef2, 0x145c8109, 0x # ...........7..\.
	.word	0x8008b880, 0x033c14dd, 0x0838060a, 0x060c0846, 0x # ......<...8.F...
	.word	0x031e0b74, 0x0959045a, 0x1c188380, 0x4c09160a, 0x # t...Z.Y........L
	.word	0x068a8004, 0x170ca4ab, 0x04a13104, 0x0726da81, 0x # .........1....&.
	.word	0x8205050c, 0x062a20b3, 0x8d80044c, 0x03be8004, 0x # ..... *.L.......
# 8002150c:	0d0f031b                                ....

.Lanon.93378afd097c98d6944e7e9e652eb25e.259:
	.word	0x80011c40, 0x00000055, 0x0000000a, 0x0000002b, 0x # @...U.......+...

.Lanon.93378afd097c98d6944e7e9e652eb25e.260:
	.word	0x80011c40, 0x00000055, 0x0000001a, 0x00000036, 0x # @...U.......6...

.Lanon.93378afd097c98d6944e7e9e652eb25e.263:
	.word	0x65747461, 0x2074706d, 0x63206f74, 0x75636c61, 0x # attempt to calcu
	.word	0x6574616c, 0x65687420, 0x6d657220, 0x646e6961, 0x # late the remaind
	.word	0x77207265, 0x20687469, 0x69642061, 0x6f736976, 0x # er with a diviso
	.word	0x666f2072, 0x72657a20, 0x0000006f, 0x # r of zero...

.Lanon.93378afd097c98d6944e7e9e652eb25e.340:
# 8002156c:	00002e2e                                ....
