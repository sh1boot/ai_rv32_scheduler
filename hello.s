	.attribute	4, 16
	.attribute	5, "rv32e2p0_f2p2_c2p0_zicsr2p0"
	.file	"hello.c"
	.text
	.globl	f                               # -- Begin function f
	.p2align	1
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# %bb.0:
	slli	a0, a0, 1
	addi	a0, a0, 1
	ret
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -4
	.cfi_def_cfa_offset 4
	sw	ra, 0(sp)                       # 4-byte Folded Spill
	.cfi_offset ra, -4
	li	a0, 123
	call	f
	mv	a1, a0
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	call	printf
	li	a0, 0
	lw	ra, 0(sp)                       # 4-byte Folded Reload
	.cfi_restore ra
	addi	sp, sp, 4
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"hello world. %d\n"
	.size	.L.str, 17

	.ident	"Ubuntu clang version 20.1.8 (0ubuntu4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
