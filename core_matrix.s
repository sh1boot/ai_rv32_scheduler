	.attribute	4, 16
	.attribute	5, "rv32e2p0_f2p2_c2p0_zicsr2p0"
	.file	"core_matrix.c"
	.text
	.globl	core_bench_matrix               # -- Begin function core_bench_matrix
	.p2align	1
	.type	core_bench_matrix,@function
core_bench_matrix:                      # @core_bench_matrix
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -36
	.cfi_def_cfa_offset 36
	sw	ra, 32(sp)                      # 4-byte Folded Spill
	sw	s0, 28(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 36
	.cfi_def_cfa s0, 0
                                        # kill: def $x13 killed $x12
                                        # kill: def $x13 killed $x11
	sw	a0, -12(s0)
	sh	a1, -14(s0)
	sh	a2, -16(s0)
	lw	a0, -12(s0)
	lw	a0, 0(a0)
	sw	a0, -20(s0)
	lw	a0, -12(s0)
	lw	a0, 12(a0)
	sw	a0, -24(s0)
	lw	a0, -12(s0)
	lw	a0, 4(a0)
	sw	a0, -28(s0)
	lw	a0, -12(s0)
	lw	a0, 8(a0)
	sw	a0, -32(s0)
	lh	a0, -14(s0)
	sh	a0, -34(s0)
	lw	a0, -20(s0)
	lw	a1, -24(s0)
	lw	a2, -28(s0)
	lw	a3, -32(s0)
	lh	a4, -34(s0)
	call	matrix_test
	lhu	a1, -16(s0)
	call	crc16
	sh	a0, -16(s0)
	lhu	a0, -16(s0)
	.cfi_def_cfa sp, 36
	lw	ra, 32(sp)                      # 4-byte Folded Reload
	lw	s0, 28(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 36
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	core_bench_matrix, .Lfunc_end0-core_bench_matrix
	.cfi_endproc
                                        # -- End function
	.globl	matrix_test                     # -- Begin function matrix_test
	.p2align	1
	.type	matrix_test,@function
matrix_test:                            # @matrix_test
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -36
	.cfi_def_cfa_offset 36
	sw	ra, 32(sp)                      # 4-byte Folded Spill
	sw	s0, 28(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 36
	.cfi_def_cfa s0, 0
                                        # kill: def $x15 killed $x14
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sw	a3, -24(s0)
	sh	a4, -26(s0)
	li	a0, 0
	sw	a0, -36(s0)                     # 4-byte Folded Spill
	sh	a0, -28(s0)
	lh	a0, -26(s0)
	lui	a1, 15
	or	a0, a0, a1
	sh	a0, -30(s0)
	lw	a0, -12(s0)
	lw	a1, -20(s0)
	lh	a2, -26(s0)
	call	matrix_add_const
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, -20(s0)
	lh	a3, -26(s0)
	call	matrix_mul_const
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lh	a2, -30(s0)
	call	matrix_sum
	lhu	a1, -28(s0)
	call	crc16
	sh	a0, -28(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, -20(s0)
	lw	a3, -24(s0)
	call	matrix_mul_vect
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lh	a2, -30(s0)
	call	matrix_sum
	lhu	a1, -28(s0)
	call	crc16
	sh	a0, -28(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, -20(s0)
	lw	a3, -24(s0)
	call	matrix_mul_matrix
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lh	a2, -30(s0)
	call	matrix_sum
	lhu	a1, -28(s0)
	call	crc16
	sh	a0, -28(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, -20(s0)
	lw	a3, -24(s0)
	call	matrix_mul_matrix_bitextract
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lh	a2, -30(s0)
	call	matrix_sum
	lhu	a1, -28(s0)
	call	crc16
	lw	a2, -36(s0)                     # 4-byte Folded Reload
	sh	a0, -28(s0)
	lw	a0, -12(s0)
	lw	a1, -20(s0)
	lh	a3, -26(s0)
	sub	a2, a2, a3
	slli	a2, a2, 16
	srai	a2, a2, 16
	call	matrix_add_const
	lh	a0, -28(s0)
	.cfi_def_cfa sp, 36
	lw	ra, 32(sp)                      # 4-byte Folded Reload
	lw	s0, 28(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 36
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end1:
	.size	matrix_test, .Lfunc_end1-matrix_test
	.cfi_endproc
                                        # -- End function
	.globl	matrix_add_const                # -- Begin function matrix_add_const
	.p2align	1
	.type	matrix_add_const,@function
matrix_add_const:                       # @matrix_add_const
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -36
	.cfi_def_cfa_offset 36
	sw	ra, 32(sp)                      # 4-byte Folded Spill
	sw	s0, 28(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 36
	.cfi_def_cfa s0, 0
                                        # kill: def $x13 killed $x12
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sh	a2, -18(s0)
	li	a0, 0
	sw	a0, -24(s0)
	j	.LBB2_1
.LBB2_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	lw	a0, -24(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB2_8
	j	.LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB2_3
.LBB2_3:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB2_6
	j	.LBB2_4
.LBB2_4:                                #   in Loop: Header=BB2_3 Depth=2
	lh	a0, -18(s0)
	sw	a0, -36(s0)                     # 4-byte Folded Spill
	lw	a0, -16(s0)
	sw	a0, -32(s0)                     # 4-byte Folded Spill
	lw	a0, -24(s0)
	lw	a1, -12(s0)
	call	__mulsi3
	lw	a2, -36(s0)                     # 4-byte Folded Reload
	mv	a1, a0
	lw	a0, -32(s0)                     # 4-byte Folded Reload
	lw	a3, -28(s0)
	add	a1, a1, a3
	slli	a1, a1, 1
	add	a1, a1, a0
	lh	a0, 0(a1)
	add	a0, a0, a2
	sh	a0, 0(a1)
	j	.LBB2_5
.LBB2_5:                                #   in Loop: Header=BB2_3 Depth=2
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB2_3
.LBB2_6:                                #   in Loop: Header=BB2_1 Depth=1
	j	.LBB2_7
.LBB2_7:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB2_1
.LBB2_8:
	.cfi_def_cfa sp, 36
	lw	ra, 32(sp)                      # 4-byte Folded Reload
	lw	s0, 28(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 36
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end2:
	.size	matrix_add_const, .Lfunc_end2-matrix_add_const
	.cfi_endproc
                                        # -- End function
	.globl	matrix_mul_const                # -- Begin function matrix_mul_const
	.p2align	1
	.type	matrix_mul_const,@function
matrix_mul_const:                       # @matrix_mul_const
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -40
	.cfi_def_cfa_offset 40
	sw	ra, 36(sp)                      # 4-byte Folded Spill
	sw	s0, 32(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 40
	.cfi_def_cfa s0, 0
                                        # kill: def $x14 killed $x13
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sh	a3, -22(s0)
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB3_1
.LBB3_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB3_8
	j	.LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
	li	a0, 0
	sw	a0, -32(s0)
	j	.LBB3_3
.LBB3_3:                                #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -32(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB3_6
	j	.LBB3_4
.LBB3_4:                                #   in Loop: Header=BB3_3 Depth=2
	lw	a0, -20(s0)
	sw	a0, -40(s0)                     # 4-byte Folded Spill
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	call	__mulsi3
	mv	a1, a0
	lw	a0, -40(s0)                     # 4-byte Folded Reload
	lw	a2, -32(s0)
	add	a1, a1, a2
	sw	a1, -36(s0)                     # 4-byte Folded Spill
	slli	a1, a1, 1
	add	a0, a0, a1
	lh	a0, 0(a0)
	lh	a1, -22(s0)
	call	__mulsi3
	lw	a2, -36(s0)                     # 4-byte Folded Reload
	lw	a1, -16(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB3_5
.LBB3_5:                                #   in Loop: Header=BB3_3 Depth=2
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB3_3
.LBB3_6:                                #   in Loop: Header=BB3_1 Depth=1
	j	.LBB3_7
.LBB3_7:                                #   in Loop: Header=BB3_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB3_1
.LBB3_8:
	.cfi_def_cfa sp, 40
	lw	ra, 36(sp)                      # 4-byte Folded Reload
	lw	s0, 32(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 40
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end3:
	.size	matrix_mul_const, .Lfunc_end3-matrix_mul_const
	.cfi_endproc
                                        # -- End function
	.globl	matrix_sum                      # -- Begin function matrix_sum
	.p2align	1
	.type	matrix_sum,@function
matrix_sum:                             # @matrix_sum
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
                                        # kill: def $x13 killed $x12
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sh	a2, -18(s0)
	li	a0, 0
	sw	a0, -24(s0)
	sw	a0, -28(s0)
	sw	a0, -32(s0)
	sh	a0, -34(s0)
	sw	a0, -40(s0)
	j	.LBB4_1
.LBB4_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_3 Depth 2
	lw	a0, -40(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB4_11
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	li	a0, 0
	sw	a0, -44(s0)
	j	.LBB4_3
.LBB4_3:                                #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -44(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB4_9
	j	.LBB4_4
.LBB4_4:                                #   in Loop: Header=BB4_3 Depth=2
	lw	a0, -16(s0)
	sw	a0, -48(s0)                     # 4-byte Folded Spill
	lw	a0, -40(s0)
	lw	a1, -12(s0)
	call	__mulsi3
	mv	a1, a0
	lw	a0, -48(s0)                     # 4-byte Folded Reload
	lw	a2, -44(s0)
	add	a1, a1, a2
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	sw	a0, -32(s0)
	lw	a1, -32(s0)
	lw	a0, -24(s0)
	add	a0, a0, a1
	sw	a0, -24(s0)
	lw	a1, -24(s0)
	lh	a0, -18(s0)
	bge	a0, a1, .LBB4_6
	j	.LBB4_5
.LBB4_5:                                #   in Loop: Header=BB4_3 Depth=2
	lh	a0, -34(s0)
	addi	a0, a0, 10
	sh	a0, -34(s0)
	li	a0, 0
	sw	a0, -24(s0)
	j	.LBB4_7
.LBB4_6:                                #   in Loop: Header=BB4_3 Depth=2
	lw	a1, -32(s0)
	lw	a0, -28(s0)
	slt	a1, a0, a1
	lh	a0, -34(s0)
	add	a0, a0, a1
	sh	a0, -34(s0)
	j	.LBB4_7
.LBB4_7:                                #   in Loop: Header=BB4_3 Depth=2
	lw	a0, -32(s0)
	sw	a0, -28(s0)
	j	.LBB4_8
.LBB4_8:                                #   in Loop: Header=BB4_3 Depth=2
	lw	a0, -44(s0)
	addi	a0, a0, 1
	sw	a0, -44(s0)
	j	.LBB4_3
.LBB4_9:                                #   in Loop: Header=BB4_1 Depth=1
	j	.LBB4_10
.LBB4_10:                               #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -40(s0)
	addi	a0, a0, 1
	sw	a0, -40(s0)
	j	.LBB4_1
.LBB4_11:
	lh	a0, -34(s0)
	.cfi_def_cfa sp, 48
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end4:
	.size	matrix_sum, .Lfunc_end4-matrix_sum
	.cfi_endproc
                                        # -- End function
	.globl	matrix_mul_vect                 # -- Begin function matrix_mul_vect
	.p2align	1
	.type	matrix_mul_vect,@function
matrix_mul_vect:                        # @matrix_mul_vect
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -40
	.cfi_def_cfa_offset 40
	sw	ra, 36(sp)                      # 4-byte Folded Spill
	sw	s0, 32(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 40
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sw	a3, -24(s0)
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB5_1
.LBB5_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_3 Depth 2
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB5_8
	j	.LBB5_2
.LBB5_2:                                #   in Loop: Header=BB5_1 Depth=1
	lw	a0, -16(s0)
	lw	a1, -28(s0)
	slli	a1, a1, 2
	add	a1, a1, a0
	li	a0, 0
	sw	a0, 0(a1)
	sw	a0, -32(s0)
	j	.LBB5_3
.LBB5_3:                                #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -32(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB5_6
	j	.LBB5_4
.LBB5_4:                                #   in Loop: Header=BB5_3 Depth=2
	lw	a0, -20(s0)
	sw	a0, -40(s0)                     # 4-byte Folded Spill
	lw	a0, -28(s0)
	sw	a0, -36(s0)                     # 4-byte Folded Spill
	lw	a1, -12(s0)
	call	__mulsi3
	mv	a1, a0
	lw	a0, -40(s0)                     # 4-byte Folded Reload
	lw	a2, -32(s0)
	add	a1, a1, a2
	slli	a1, a1, 1
	add	a0, a0, a1
	lh	a0, 0(a0)
	lw	a1, -24(s0)
	slli	a2, a2, 1
	add	a1, a1, a2
	lh	a1, 0(a1)
	call	__mulsi3
	lw	a1, -36(s0)                     # 4-byte Folded Reload
	mv	a2, a0
	lw	a0, -16(s0)
	slli	a1, a1, 2
	add	a1, a1, a0
	lw	a0, 0(a1)
	add	a0, a0, a2
	sw	a0, 0(a1)
	j	.LBB5_5
.LBB5_5:                                #   in Loop: Header=BB5_3 Depth=2
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB5_3
.LBB5_6:                                #   in Loop: Header=BB5_1 Depth=1
	j	.LBB5_7
.LBB5_7:                                #   in Loop: Header=BB5_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB5_1
.LBB5_8:
	.cfi_def_cfa sp, 40
	lw	ra, 36(sp)                      # 4-byte Folded Reload
	lw	s0, 32(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 40
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end5:
	.size	matrix_mul_vect, .Lfunc_end5-matrix_mul_vect
	.cfi_endproc
                                        # -- End function
	.globl	matrix_mul_matrix               # -- Begin function matrix_mul_matrix
	.p2align	1
	.type	matrix_mul_matrix,@function
matrix_mul_matrix:                      # @matrix_mul_matrix
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sw	ra, 60(sp)                      # 4-byte Folded Spill
	sw	s0, 56(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sw	a3, -24(s0)
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB6_1
.LBB6_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_3 Depth 2
                                        #       Child Loop BB6_5 Depth 3
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB6_12
	j	.LBB6_2
.LBB6_2:                                #   in Loop: Header=BB6_1 Depth=1
	li	a0, 0
	sw	a0, -32(s0)
	j	.LBB6_3
.LBB6_3:                                #   Parent Loop BB6_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_5 Depth 3
	lw	a0, -32(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB6_10
	j	.LBB6_4
.LBB6_4:                                #   in Loop: Header=BB6_3 Depth=2
	lw	a0, -16(s0)
	sw	a0, -40(s0)                     # 4-byte Folded Spill
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	call	__mulsi3
	mv	a1, a0
	lw	a0, -40(s0)                     # 4-byte Folded Reload
	lw	a2, -32(s0)
	add	a1, a1, a2
	slli	a1, a1, 2
	add	a1, a1, a0
	li	a0, 0
	sw	a0, 0(a1)
	sw	a0, -36(s0)
	j	.LBB6_5
.LBB6_5:                                #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a0, -36(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB6_8
	j	.LBB6_6
.LBB6_6:                                #   in Loop: Header=BB6_5 Depth=3
	lw	a0, -20(s0)
	sw	a0, -64(s0)                     # 4-byte Folded Spill
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	sw	a1, -60(s0)                     # 4-byte Folded Spill
	call	__mulsi3
	lw	a2, -64(s0)                     # 4-byte Folded Reload
	lw	a1, -60(s0)                     # 4-byte Folded Reload
	mv	a3, a0
	sw	a3, -44(s0)                     # 4-byte Folded Spill
	lw	a0, -36(s0)
	add	a3, a3, a0
	slli	a3, a3, 1
	add	a2, a2, a3
	lh	a2, 0(a2)
	sw	a2, -52(s0)                     # 4-byte Folded Spill
	lw	a2, -24(s0)
	sw	a2, -56(s0)                     # 4-byte Folded Spill
	call	__mulsi3
	lw	a1, -56(s0)                     # 4-byte Folded Reload
	mv	a2, a0
	lw	a0, -52(s0)                     # 4-byte Folded Reload
	lw	a3, -32(s0)
	sw	a3, -48(s0)                     # 4-byte Folded Spill
	add	a2, a2, a3
	slli	a2, a2, 1
	add	a1, a1, a2
	lh	a1, 0(a1)
	call	__mulsi3
	lw	a3, -48(s0)                     # 4-byte Folded Reload
	lw	a1, -44(s0)                     # 4-byte Folded Reload
	mv	a2, a0
	lw	a0, -16(s0)
	add	a1, a1, a3
	slli	a1, a1, 2
	add	a1, a1, a0
	lw	a0, 0(a1)
	add	a0, a0, a2
	sw	a0, 0(a1)
	j	.LBB6_7
.LBB6_7:                                #   in Loop: Header=BB6_5 Depth=3
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	j	.LBB6_5
.LBB6_8:                                #   in Loop: Header=BB6_3 Depth=2
	j	.LBB6_9
.LBB6_9:                                #   in Loop: Header=BB6_3 Depth=2
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB6_3
.LBB6_10:                               #   in Loop: Header=BB6_1 Depth=1
	j	.LBB6_11
.LBB6_11:                               #   in Loop: Header=BB6_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB6_1
.LBB6_12:
	.cfi_def_cfa sp, 64
	lw	ra, 60(sp)                      # 4-byte Folded Reload
	lw	s0, 56(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 64
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end6:
	.size	matrix_mul_matrix, .Lfunc_end6-matrix_mul_matrix
	.cfi_endproc
                                        # -- End function
	.globl	matrix_mul_matrix_bitextract    # -- Begin function matrix_mul_matrix_bitextract
	.p2align	1
	.type	matrix_mul_matrix_bitextract,@function
matrix_mul_matrix_bitextract:           # @matrix_mul_matrix_bitextract
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -68
	.cfi_def_cfa_offset 68
	sw	ra, 64(sp)                      # 4-byte Folded Spill
	sw	s0, 60(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 68
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sw	a3, -24(s0)
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB7_1
.LBB7_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_3 Depth 2
                                        #       Child Loop BB7_5 Depth 3
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB7_12
	j	.LBB7_2
.LBB7_2:                                #   in Loop: Header=BB7_1 Depth=1
	li	a0, 0
	sw	a0, -32(s0)
	j	.LBB7_3
.LBB7_3:                                #   Parent Loop BB7_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_5 Depth 3
	lw	a0, -32(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB7_10
	j	.LBB7_4
.LBB7_4:                                #   in Loop: Header=BB7_3 Depth=2
	lw	a0, -16(s0)
	sw	a0, -44(s0)                     # 4-byte Folded Spill
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	call	__mulsi3
	mv	a1, a0
	lw	a0, -44(s0)                     # 4-byte Folded Reload
	lw	a2, -32(s0)
	add	a1, a1, a2
	slli	a1, a1, 2
	add	a1, a1, a0
	li	a0, 0
	sw	a0, 0(a1)
	sw	a0, -36(s0)
	j	.LBB7_5
.LBB7_5:                                #   Parent Loop BB7_1 Depth=1
                                        #     Parent Loop BB7_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a0, -36(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB7_8
	j	.LBB7_6
.LBB7_6:                                #   in Loop: Header=BB7_5 Depth=3
	lw	a0, -20(s0)
	sw	a0, -68(s0)                     # 4-byte Folded Spill
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	sw	a1, -64(s0)                     # 4-byte Folded Spill
	call	__mulsi3
	lw	a2, -68(s0)                     # 4-byte Folded Reload
	lw	a1, -64(s0)                     # 4-byte Folded Reload
	mv	a3, a0
	lw	a0, -36(s0)
	add	a3, a3, a0
	slli	a3, a3, 1
	add	a2, a2, a3
	lh	a2, 0(a2)
	sw	a2, -56(s0)                     # 4-byte Folded Spill
	lw	a2, -24(s0)
	sw	a2, -60(s0)                     # 4-byte Folded Spill
	call	__mulsi3
	lw	a1, -60(s0)                     # 4-byte Folded Reload
	mv	a2, a0
	lw	a0, -56(s0)                     # 4-byte Folded Reload
	lw	a3, -32(s0)
	add	a2, a2, a3
	slli	a2, a2, 1
	add	a1, a1, a2
	lh	a1, 0(a1)
	call	__mulsi3
	sw	a0, -40(s0)
	lw	a1, -40(s0)
	slli	a0, a1, 26
	srli	a0, a0, 28
	slli	a1, a1, 20
	srli	a1, a1, 25
	call	__mulsi3
	sw	a0, -52(s0)                     # 4-byte Folded Spill
	lw	a0, -16(s0)
	sw	a0, -48(s0)                     # 4-byte Folded Spill
	lw	a0, -28(s0)
	lw	a1, -12(s0)
	call	__mulsi3
	lw	a2, -52(s0)                     # 4-byte Folded Reload
	mv	a1, a0
	lw	a0, -48(s0)                     # 4-byte Folded Reload
	lw	a3, -32(s0)
	add	a1, a1, a3
	slli	a1, a1, 2
	add	a1, a1, a0
	lw	a0, 0(a1)
	add	a0, a0, a2
	sw	a0, 0(a1)
	j	.LBB7_7
.LBB7_7:                                #   in Loop: Header=BB7_5 Depth=3
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	j	.LBB7_5
.LBB7_8:                                #   in Loop: Header=BB7_3 Depth=2
	j	.LBB7_9
.LBB7_9:                                #   in Loop: Header=BB7_3 Depth=2
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB7_3
.LBB7_10:                               #   in Loop: Header=BB7_1 Depth=1
	j	.LBB7_11
.LBB7_11:                               #   in Loop: Header=BB7_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB7_1
.LBB7_12:
	.cfi_def_cfa sp, 68
	lw	ra, 64(sp)                      # 4-byte Folded Reload
	lw	s0, 60(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 68
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end7:
	.size	matrix_mul_matrix_bitextract, .Lfunc_end7-matrix_mul_matrix_bitextract
	.cfi_endproc
                                        # -- End function
	.globl	core_init_matrix                # -- Begin function core_init_matrix
	.p2align	1
	.type	core_init_matrix,@function
core_init_matrix:                       # @core_init_matrix
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -76
	.cfi_def_cfa_offset 76
	sw	ra, 72(sp)                      # 4-byte Folded Spill
	sw	s0, 68(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 76
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sw	a3, -24(s0)
	li	a0, 0
	sw	a0, -28(s0)
	li	a1, 1
	sw	a1, -40(s0)
	sw	a0, -48(s0)
	sw	a0, -52(s0)
	lw	a0, -20(s0)
	bnez	a0, .LBB8_2
	j	.LBB8_1
.LBB8_1:
	li	a0, 1
	sw	a0, -20(s0)
	j	.LBB8_2
.LBB8_2:
	j	.LBB8_3
.LBB8_3:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -52(s0)
	lw	a1, -12(s0)
	bgeu	a0, a1, .LBB8_5
	j	.LBB8_4
.LBB8_4:                                #   in Loop: Header=BB8_3 Depth=1
	lw	a0, -48(s0)
	addi	a0, a0, 1
	sw	a0, -48(s0)
	lw	a1, -48(s0)
	mv	a0, a1
	call	__mulsi3
	slli	a0, a0, 3
	sw	a0, -52(s0)
	j	.LBB8_3
.LBB8_5:
	lw	a0, -48(s0)
	addi	a0, a0, -1
	sw	a0, -28(s0)
	lw	a0, -16(s0)
	addi	a0, a0, -1
	andi	a0, a0, -4
	addi	a0, a0, 4
	sw	a0, -32(s0)
	lw	a0, -32(s0)
	sw	a0, -56(s0)                     # 4-byte Folded Spill
	lw	a1, -28(s0)
	mv	a0, a1
	call	__mulsi3
	mv	a1, a0
	lw	a0, -56(s0)                     # 4-byte Folded Reload
	slli	a1, a1, 1
	add	a0, a0, a1
	sw	a0, -36(s0)
	li	a0, 0
	sw	a0, -48(s0)
	j	.LBB8_6
.LBB8_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_8 Depth 2
	lw	a0, -48(s0)
	lw	a1, -28(s0)
	bgeu	a0, a1, .LBB8_13
	j	.LBB8_7
.LBB8_7:                                #   in Loop: Header=BB8_6 Depth=1
	li	a0, 0
	sw	a0, -52(s0)
	j	.LBB8_8
.LBB8_8:                                #   Parent Loop BB8_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -52(s0)
	lw	a1, -28(s0)
	bgeu	a0, a1, .LBB8_11
	j	.LBB8_9
.LBB8_9:                                #   in Loop: Header=BB8_8 Depth=2
	lw	a0, -40(s0)
	lw	a1, -20(s0)
	call	__mulsi3
	srai	a1, a0, 31
	srli	a1, a1, 16
	add	a1, a1, a0
	lui	a2, 1048560
	and	a1, a1, a2
	sub	a0, a0, a1
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	lw	a1, -40(s0)
	add	a0, a0, a1
	sh	a0, -42(s0)
	lh	a0, -42(s0)
	sw	a0, -68(s0)                     # 4-byte Folded Spill
	lw	a0, -36(s0)
	sw	a0, -72(s0)                     # 4-byte Folded Spill
	lw	a0, -48(s0)
	lw	a1, -28(s0)
	call	__mulsi3
	lw	a1, -72(s0)                     # 4-byte Folded Reload
	mv	a2, a0
	lw	a0, -68(s0)                     # 4-byte Folded Reload
	lw	a3, -52(s0)
	add	a2, a2, a3
	slli	a2, a2, 1
	add	a1, a1, a2
	sh	a0, 0(a1)
	lh	a0, -42(s0)
	lw	a1, -40(s0)
	add	a0, a0, a1
	sh	a0, -42(s0)
	lbu	a0, -42(s0)
	sh	a0, -42(s0)
	lh	a0, -42(s0)
	sw	a0, -60(s0)                     # 4-byte Folded Spill
	lw	a0, -32(s0)
	sw	a0, -64(s0)                     # 4-byte Folded Spill
	lw	a0, -48(s0)
	lw	a1, -28(s0)
	call	__mulsi3
	lw	a1, -64(s0)                     # 4-byte Folded Reload
	mv	a2, a0
	lw	a0, -60(s0)                     # 4-byte Folded Reload
	lw	a3, -52(s0)
	add	a2, a2, a3
	slli	a2, a2, 1
	add	a1, a1, a2
	sh	a0, 0(a1)
	lw	a0, -40(s0)
	addi	a0, a0, 1
	sw	a0, -40(s0)
	j	.LBB8_10
.LBB8_10:                               #   in Loop: Header=BB8_8 Depth=2
	lw	a0, -52(s0)
	addi	a0, a0, 1
	sw	a0, -52(s0)
	j	.LBB8_8
.LBB8_11:                               #   in Loop: Header=BB8_6 Depth=1
	j	.LBB8_12
.LBB8_12:                               #   in Loop: Header=BB8_6 Depth=1
	lw	a0, -48(s0)
	addi	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB8_6
.LBB8_13:
	lw	a0, -32(s0)
	lw	a1, -24(s0)
	sw	a0, 4(a1)
	lw	a0, -36(s0)
	lw	a1, -24(s0)
	sw	a0, 8(a1)
	lw	a0, -36(s0)
	sw	a0, -76(s0)                     # 4-byte Folded Spill
	lw	a1, -28(s0)
	mv	a0, a1
	call	__mulsi3
	mv	a1, a0
	lw	a0, -76(s0)                     # 4-byte Folded Reload
	slli	a1, a1, 1
	add	a0, a0, a1
	addi	a0, a0, -1
	andi	a0, a0, -4
	addi	a0, a0, 4
	lw	a1, -24(s0)
	sw	a0, 12(a1)
	lw	a0, -28(s0)
	lw	a1, -24(s0)
	sw	a0, 0(a1)
	lw	a0, -28(s0)
	.cfi_def_cfa sp, 76
	lw	ra, 72(sp)                      # 4-byte Folded Reload
	lw	s0, 68(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 76
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end8:
	.size	core_init_matrix, .Lfunc_end8-core_init_matrix
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 20.1.8 (0ubuntu4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym crc16
	.addrsig_sym matrix_test
	.addrsig_sym matrix_add_const
	.addrsig_sym matrix_mul_const
	.addrsig_sym matrix_sum
	.addrsig_sym matrix_mul_vect
	.addrsig_sym matrix_mul_matrix
	.addrsig_sym matrix_mul_matrix_bitextract
