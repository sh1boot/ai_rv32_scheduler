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
	addi	sp, sp, -12
	.cfi_def_cfa_offset 12
	sw	ra, 8(sp)                       # 4-byte Folded Spill
	sw	s0, 4(sp)                       # 4-byte Folded Spill
	sw	s1, 0(sp)                       # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	mv	s1, a2
	lw	s0, 0(a0)
	lw	a2, 4(a0)
	lw	a3, 8(a0)
	lw	a5, 12(a0)
	mv	a4, a1
	mv	a0, s0
	mv	a1, a5
	call	matrix_test
	mv	a1, s1
	lw	ra, 8(sp)                       # 4-byte Folded Reload
	lw	s0, 4(sp)                       # 4-byte Folded Reload
	lw	s1, 0(sp)                       # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 12
	.cfi_def_cfa_offset 0
	tail	crc16
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
	addi	sp, sp, -76
	.cfi_def_cfa_offset 76
	sw	ra, 72(sp)                      # 4-byte Folded Spill
	sw	s0, 68(sp)                      # 4-byte Folded Spill
	sw	s1, 64(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	sw	a3, 20(sp)                      # 4-byte Folded Spill
	beqz	a0, .LBB1_57
# %bb.1:
	mv	a5, a4
	mv	t1, a0
	li	a0, 0
	lui	a3, 1048575
	or	t2, a4, a3
	slli	t0, t1, 1
	mv	s0, a2
.LBB1_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	mv	s1, s0
	mv	a3, t1
.LBB1_3:                                #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	a4, 0(s1)
	addi	a3, a3, -1
	add	a4, a4, a5
	sh	a4, 0(s1)
	addi	s1, s1, 2
	bnez	a3, .LBB1_3
# %bb.4:                                #   in Loop: Header=BB1_2 Depth=1
	addi	a0, a0, 1
	add	s0, s0, t0
	bne	a0, t1, .LBB1_2
# %bb.5:
	sw	t2, 4(sp)                       # 4-byte Folded Spill
	sw	t0, 60(sp)                      # 4-byte Folded Spill
	li	a3, 0
	slli	ra, t1, 2
	sw	a2, 8(sp)                       # 4-byte Folded Spill
	sw	a1, 24(sp)                      # 4-byte Folded Spill
	mv	s1, a1
	sw	a5, 28(sp)                      # 4-byte Folded Spill
	sw	t1, 48(sp)                      # 4-byte Folded Spill
	sw	ra, 12(sp)                      # 4-byte Folded Spill
.LBB1_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_7 Depth 2
	sw	a3, 52(sp)                      # 4-byte Folded Spill
	sw	a2, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	mv	s0, t1
.LBB1_7:                                #   Parent Loop BB1_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	a2, 56(sp)                      # 4-byte Folded Spill
	lw	a0, 56(sp)                      # 4-byte Folded Reload
	lh	a0, 0(a0)
	mv	a1, a5
	call	__mulsi3
	lw	a5, 28(sp)                      # 4-byte Folded Reload
	sw	a0, 0(s1)
	lw	a2, 56(sp)                      # 4-byte Folded Reload
	addi	s0, s0, -1
	addi	s1, s1, 4
	addi	a2, a2, 2
	bnez	s0, .LBB1_7
# %bb.8:                                #   in Loop: Header=BB1_6 Depth=1
	lw	a3, 52(sp)                      # 4-byte Folded Reload
	addi	a3, a3, 1
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	add	s1, s1, ra
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	lw	a2, 44(sp)                      # 4-byte Folded Reload
	add	a2, a2, a0
	lw	t1, 48(sp)                      # 4-byte Folded Reload
	bne	a3, t1, .LBB1_6
# %bb.9:
	li	t0, 0
	li	a0, 0
	li	s1, 0
	li	a4, 0
	lw	t2, 24(sp)                      # 4-byte Folded Reload
	lw	a2, 4(sp)                       # 4-byte Folded Reload
	j	.LBB1_11
.LBB1_10:                               #   in Loop: Header=BB1_11 Depth=1
	addi	t0, t0, 1
	add	t2, t2, ra
	beq	t0, t1, .LBB1_16
.LBB1_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_14 Depth 2
	mv	a5, t2
	mv	s0, t1
	mv	a3, s1
	j	.LBB1_14
.LBB1_12:                               #   in Loop: Header=BB1_14 Depth=2
	li	a3, 10
.LBB1_13:                               #   in Loop: Header=BB1_14 Depth=2
	slt	a1, a2, a4
	add	a0, a0, a3
	addi	s0, s0, -1
	addi	a1, a1, -1
	slli	a0, a0, 16
	and	a4, a4, a1
	srai	a0, a0, 16
	addi	a5, a5, 4
	mv	a3, s1
	beqz	s0, .LBB1_10
.LBB1_14:                               #   Parent Loop BB1_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s1, 0(a5)
	add	a4, a4, s1
	blt	a2, a4, .LBB1_12
# %bb.15:                               #   in Loop: Header=BB1_14 Depth=2
	slt	a3, a3, s1
	j	.LBB1_13
.LBB1_16:
	li	a1, 0
	call	crc16
	sw	a0, 36(sp)                      # 4-byte Folded Spill
	li	a2, 0
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	lw	a1, 20(sp)                      # 4-byte Folded Reload
	add	a3, a1, a0
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	sw	a3, 52(sp)                      # 4-byte Folded Spill
.LBB1_17:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_18 Depth 2
	sw	a2, 44(sp)                      # 4-byte Folded Spill
	li	a4, 0
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	lw	s1, 20(sp)                      # 4-byte Folded Reload
.LBB1_18:                               #   Parent Loop BB1_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	a4, 56(sp)                      # 4-byte Folded Spill
	lh	a1, 0(s0)
	lh	a0, 0(s1)
	call	__mulsi3
	lw	a4, 56(sp)                      # 4-byte Folded Reload
	lw	a3, 52(sp)                      # 4-byte Folded Reload
	add	a4, a4, a0
	addi	s1, s1, 2
	addi	s0, s0, 2
	bne	s1, a3, .LBB1_18
# %bb.19:                               #   in Loop: Header=BB1_17 Depth=1
	lw	a2, 44(sp)                      # 4-byte Folded Reload
	slli	a0, a2, 2
	addi	a2, a2, 1
	lw	a1, 24(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a4, 0(a0)
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	add	s0, s0, a0
	lw	a0, 48(sp)                      # 4-byte Folded Reload
	bne	a2, a0, .LBB1_17
# %bb.20:
	li	t0, 0
	li	a0, 0
	li	s1, 0
	li	a4, 0
	lw	t2, 24(sp)                      # 4-byte Folded Reload
	lw	t1, 48(sp)                      # 4-byte Folded Reload
	lw	a2, 4(sp)                       # 4-byte Folded Reload
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	j	.LBB1_22
.LBB1_21:                               #   in Loop: Header=BB1_22 Depth=1
	addi	t0, t0, 1
	add	t2, t2, ra
	beq	t0, t1, .LBB1_27
.LBB1_22:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_25 Depth 2
	mv	a5, t2
	mv	s0, t1
	mv	a3, s1
	j	.LBB1_25
.LBB1_23:                               #   in Loop: Header=BB1_25 Depth=2
	li	a3, 10
.LBB1_24:                               #   in Loop: Header=BB1_25 Depth=2
	slt	a1, a2, a4
	add	a0, a0, a3
	addi	s0, s0, -1
	addi	a1, a1, -1
	slli	a0, a0, 16
	and	a4, a4, a1
	srai	a0, a0, 16
	addi	a5, a5, 4
	mv	a3, s1
	beqz	s0, .LBB1_21
.LBB1_25:                               #   Parent Loop BB1_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s1, 0(a5)
	add	a4, a4, s1
	blt	a2, a4, .LBB1_23
# %bb.26:                               #   in Loop: Header=BB1_25 Depth=2
	slt	a3, a3, s1
	j	.LBB1_24
.LBB1_27:
	lw	a1, 36(sp)                      # 4-byte Folded Reload
	call	crc16
	lw	a1, 48(sp)                      # 4-byte Folded Reload
	sw	a0, 0(sp)                       # 4-byte Folded Spill
	li	a2, 0
	lw	a0, 8(sp)                       # 4-byte Folded Reload
	sw	a0, 36(sp)                      # 4-byte Folded Spill
.LBB1_28:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_29 Depth 2
                                        #       Child Loop BB1_30 Depth 3
	sw	a2, 16(sp)                      # 4-byte Folded Spill
	mv	a0, a2
	call	__mulsi3
	lw	a1, 48(sp)                      # 4-byte Folded Reload
	li	a3, 0
	slli	a0, a0, 2
	lw	a2, 24(sp)                      # 4-byte Folded Reload
	add	a0, a0, a2
	sw	a0, 32(sp)                      # 4-byte Folded Spill
	lw	s1, 20(sp)                      # 4-byte Folded Reload
.LBB1_29:                               #   Parent Loop BB1_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_30 Depth 3
	sw	a3, 44(sp)                      # 4-byte Folded Spill
	li	a2, 0
	lw	a0, 36(sp)                      # 4-byte Folded Reload
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	mv	s0, a1
.LBB1_30:                               #   Parent Loop BB1_28 Depth=1
                                        #     Parent Loop BB1_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	sw	a0, 52(sp)                      # 4-byte Folded Spill
	sw	a2, 56(sp)                      # 4-byte Folded Spill
	lh	a1, 0(a0)
	lh	a0, 0(s1)
	call	__mulsi3
	lw	a2, 56(sp)                      # 4-byte Folded Reload
	add	a2, a2, a0
	lw	a0, 52(sp)                      # 4-byte Folded Reload
	addi	s0, s0, -1
	lw	a1, 60(sp)                      # 4-byte Folded Reload
	add	s1, s1, a1
	addi	a0, a0, 2
	bnez	s0, .LBB1_30
# %bb.31:                               #   in Loop: Header=BB1_29 Depth=2
	lw	a3, 44(sp)                      # 4-byte Folded Reload
	slli	a0, a3, 2
	addi	a3, a3, 1
	lw	a1, 32(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a2, 0(a0)
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	addi	s1, s1, 2
	lw	a1, 48(sp)                      # 4-byte Folded Reload
	bne	a3, a1, .LBB1_29
# %bb.32:                               #   in Loop: Header=BB1_28 Depth=1
	lw	a2, 16(sp)                      # 4-byte Folded Reload
	addi	a2, a2, 1
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	lw	a3, 36(sp)                      # 4-byte Folded Reload
	add	a3, a3, a0
	sw	a3, 36(sp)                      # 4-byte Folded Spill
	bne	a2, a1, .LBB1_28
# %bb.33:
	li	t0, 0
	li	a0, 0
	li	s1, 0
	li	a4, 0
	lw	t1, 24(sp)                      # 4-byte Folded Reload
	lw	t2, 4(sp)                       # 4-byte Folded Reload
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	j	.LBB1_35
.LBB1_34:                               #   in Loop: Header=BB1_35 Depth=1
	addi	t0, t0, 1
	add	t1, t1, ra
	beq	t0, a1, .LBB1_40
.LBB1_35:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_38 Depth 2
	mv	a5, t1
	mv	s0, a1
	mv	a3, s1
	j	.LBB1_38
.LBB1_36:                               #   in Loop: Header=BB1_38 Depth=2
	li	a3, 10
.LBB1_37:                               #   in Loop: Header=BB1_38 Depth=2
	slt	a2, t2, a4
	add	a0, a0, a3
	addi	s0, s0, -1
	addi	a2, a2, -1
	slli	a0, a0, 16
	and	a4, a4, a2
	srai	a0, a0, 16
	addi	a5, a5, 4
	mv	a3, s1
	beqz	s0, .LBB1_34
.LBB1_38:                               #   Parent Loop BB1_35 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s1, 0(a5)
	add	a4, a4, s1
	blt	t2, a4, .LBB1_36
# %bb.39:                               #   in Loop: Header=BB1_38 Depth=2
	slt	a3, a3, s1
	j	.LBB1_37
.LBB1_40:
	lw	a1, 0(sp)                       # 4-byte Folded Reload
	call	crc16
	lw	a1, 48(sp)                      # 4-byte Folded Reload
	sw	a0, 0(sp)                       # 4-byte Folded Spill
	li	a2, 0
	lw	a0, 8(sp)                       # 4-byte Folded Reload
	sw	a0, 36(sp)                      # 4-byte Folded Spill
.LBB1_41:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_42 Depth 2
                                        #       Child Loop BB1_43 Depth 3
	sw	a2, 16(sp)                      # 4-byte Folded Spill
	mv	a0, a2
	call	__mulsi3
	lw	a1, 48(sp)                      # 4-byte Folded Reload
	li	a3, 0
	slli	a0, a0, 2
	lw	a2, 24(sp)                      # 4-byte Folded Reload
	add	a0, a0, a2
	sw	a0, 32(sp)                      # 4-byte Folded Spill
	lw	s0, 20(sp)                      # 4-byte Folded Reload
.LBB1_42:                               #   Parent Loop BB1_41 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_43 Depth 3
	sw	a3, 44(sp)                      # 4-byte Folded Spill
	li	a2, 0
	lw	a0, 36(sp)                      # 4-byte Folded Reload
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	mv	s1, a1
.LBB1_43:                               #   Parent Loop BB1_41 Depth=1
                                        #     Parent Loop BB1_42 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	sw	a0, 52(sp)                      # 4-byte Folded Spill
	sw	a2, 56(sp)                      # 4-byte Folded Spill
	lhu	a1, 0(a0)
	lhu	a0, 0(s0)
	call	__mulsi3
	slli	a1, a0, 26
	slli	a2, a0, 20
	srli	a0, a1, 28
	srli	a1, a2, 25
	call	__mulsi3
	lw	a2, 56(sp)                      # 4-byte Folded Reload
	add	a2, a2, a0
	lw	a0, 52(sp)                      # 4-byte Folded Reload
	addi	s1, s1, -1
	lw	a1, 60(sp)                      # 4-byte Folded Reload
	add	s0, s0, a1
	addi	a0, a0, 2
	bnez	s1, .LBB1_43
# %bb.44:                               #   in Loop: Header=BB1_42 Depth=2
	lw	a3, 44(sp)                      # 4-byte Folded Reload
	slli	a0, a3, 2
	addi	a3, a3, 1
	lw	a1, 32(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a2, 0(a0)
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	addi	s0, s0, 2
	lw	a1, 48(sp)                      # 4-byte Folded Reload
	bne	a3, a1, .LBB1_42
# %bb.45:                               #   in Loop: Header=BB1_41 Depth=1
	lw	a2, 16(sp)                      # 4-byte Folded Reload
	addi	a2, a2, 1
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	lw	a3, 36(sp)                      # 4-byte Folded Reload
	add	a3, a3, a0
	sw	a3, 36(sp)                      # 4-byte Folded Spill
	bne	a2, a1, .LBB1_41
# %bb.46:
	li	t0, 0
	li	a0, 0
	li	s1, 0
	li	a5, 0
	lw	t1, 24(sp)                      # 4-byte Folded Reload
	lw	t2, 4(sp)                       # 4-byte Folded Reload
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	j	.LBB1_48
.LBB1_47:                               #   in Loop: Header=BB1_48 Depth=1
	addi	t0, t0, 1
	add	t1, t1, ra
	beq	t0, a1, .LBB1_53
.LBB1_48:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_51 Depth 2
	mv	a3, t1
	mv	a4, a1
	mv	a2, s1
	j	.LBB1_51
.LBB1_49:                               #   in Loop: Header=BB1_51 Depth=2
	li	a2, 10
.LBB1_50:                               #   in Loop: Header=BB1_51 Depth=2
	slt	s0, t2, a5
	add	a0, a0, a2
	addi	a4, a4, -1
	addi	s0, s0, -1
	slli	a0, a0, 16
	and	a5, a5, s0
	srai	a0, a0, 16
	addi	a3, a3, 4
	mv	a2, s1
	beqz	a4, .LBB1_47
.LBB1_51:                               #   Parent Loop BB1_48 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s1, 0(a3)
	add	a5, a5, s1
	blt	t2, a5, .LBB1_49
# %bb.52:                               #   in Loop: Header=BB1_51 Depth=2
	slt	a2, a2, s1
	j	.LBB1_50
.LBB1_53:
	lw	a1, 0(sp)                       # 4-byte Folded Reload
	call	crc16
	lw	s0, 48(sp)                      # 4-byte Folded Reload
	li	a1, 0
	lw	a5, 28(sp)                      # 4-byte Folded Reload
	lw	s1, 8(sp)                       # 4-byte Folded Reload
	lw	t0, 60(sp)                      # 4-byte Folded Reload
.LBB1_54:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_55 Depth 2
	mv	a2, s1
	mv	a3, s0
.LBB1_55:                               #   Parent Loop BB1_54 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	a4, 0(a2)
	addi	a3, a3, -1
	sub	a4, a4, a5
	sh	a4, 0(a2)
	addi	a2, a2, 2
	bnez	a3, .LBB1_55
# %bb.56:                               #   in Loop: Header=BB1_54 Depth=1
	addi	a1, a1, 1
	add	s1, s1, t0
	bne	a1, s0, .LBB1_54
	j	.LBB1_58
.LBB1_57:
	li	a1, 0
	call	crc16
	mv	a1, a0
	li	a0, 0
	call	crc16
	mv	a1, a0
	li	a0, 0
	call	crc16
	mv	a1, a0
	li	a0, 0
	call	crc16
.LBB1_58:
	slli	a0, a0, 16
	srai	a0, a0, 16
	lw	ra, 72(sp)                      # 4-byte Folded Reload
	lw	s0, 68(sp)                      # 4-byte Folded Reload
	lw	s1, 64(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 76
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
	beqz	a0, .LBB2_5
# %bb.1:
	li	t1, 0
	slli	t0, a0, 1
.LBB2_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	mv	a5, a1
	mv	a4, a0
.LBB2_3:                                #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	a3, 0(a5)
	addi	a4, a4, -1
	add	a3, a3, a2
	sh	a3, 0(a5)
	addi	a5, a5, 2
	bnez	a4, .LBB2_3
# %bb.4:                                #   in Loop: Header=BB2_2 Depth=1
	addi	t1, t1, 1
	add	a1, a1, t0
	bne	t1, a0, .LBB2_2
.LBB2_5:
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
	beqz	a0, .LBB3_6
# %bb.1:
	addi	sp, sp, -44
	.cfi_def_cfa_offset 44
	sw	ra, 40(sp)                      # 4-byte Folded Spill
	sw	s0, 36(sp)                      # 4-byte Folded Spill
	sw	s1, 32(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	mv	s0, a1
	mv	s1, a0
	li	a4, 0
	slli	a5, a0, 2
	sw	a5, 4(sp)                       # 4-byte Folded Spill
	slli	a5, a0, 1
	sw	a5, 0(sp)                       # 4-byte Folded Spill
	sw	a3, 24(sp)                      # 4-byte Folded Spill
	sw	a0, 8(sp)                       # 4-byte Folded Spill
.LBB3_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	sw	a4, 12(sp)                      # 4-byte Folded Spill
	sw	a2, 20(sp)                      # 4-byte Folded Spill
	sw	s0, 16(sp)                      # 4-byte Folded Spill
.LBB3_3:                                #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	a2, 28(sp)                      # 4-byte Folded Spill
	lh	a0, 0(a2)
	mv	a1, a3
	call	__mulsi3
	lw	a2, 28(sp)                      # 4-byte Folded Reload
	lw	a3, 24(sp)                      # 4-byte Folded Reload
	sw	a0, 0(s0)
	addi	s1, s1, -1
	addi	s0, s0, 4
	addi	a2, a2, 2
	bnez	s1, .LBB3_3
# %bb.4:                                #   in Loop: Header=BB3_2 Depth=1
	lw	a4, 12(sp)                      # 4-byte Folded Reload
	addi	a4, a4, 1
	lw	s0, 16(sp)                      # 4-byte Folded Reload
	lw	a0, 4(sp)                       # 4-byte Folded Reload
	add	s0, s0, a0
	lw	a2, 20(sp)                      # 4-byte Folded Reload
	lw	a0, 0(sp)                       # 4-byte Folded Reload
	add	a2, a2, a0
	lw	s1, 8(sp)                       # 4-byte Folded Reload
	bne	a4, s1, .LBB3_2
# %bb.5:
	lw	ra, 40(sp)                      # 4-byte Folded Reload
	lw	s0, 36(sp)                      # 4-byte Folded Reload
	lw	s1, 32(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 44
	.cfi_def_cfa_offset 0
.LBB3_6:
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
	beqz	a0, .LBB4_9
# %bb.1:
	addi	sp, sp, -12
	.cfi_def_cfa_offset 12
	sw	ra, 8(sp)                       # 4-byte Folded Spill
	sw	s0, 4(sp)                       # 4-byte Folded Spill
	sw	s1, 0(sp)                       # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	li	t1, 0
	li	a3, 0
	li	t2, 0
	li	a4, 0
	slli	t0, a0, 2
	j	.LBB4_3
.LBB4_2:                                #   in Loop: Header=BB4_3 Depth=1
	addi	t1, t1, 1
	add	a1, a1, t0
	beq	t1, a0, .LBB4_8
.LBB4_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
	mv	a5, a1
	mv	s0, a0
	mv	s1, t2
	j	.LBB4_6
.LBB4_4:                                #   in Loop: Header=BB4_6 Depth=2
	li	ra, 10
.LBB4_5:                                #   in Loop: Header=BB4_6 Depth=2
	slt	s1, a2, a4
	add	a3, a3, ra
	addi	s0, s0, -1
	addi	s1, s1, -1
	and	a4, a4, s1
	addi	a5, a5, 4
	mv	s1, t2
	beqz	s0, .LBB4_2
.LBB4_6:                                #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	t2, 0(a5)
	add	a4, a4, t2
	blt	a2, a4, .LBB4_4
# %bb.7:                                #   in Loop: Header=BB4_6 Depth=2
	slt	ra, s1, t2
	j	.LBB4_5
.LBB4_8:
	lw	ra, 8(sp)                       # 4-byte Folded Reload
	lw	s0, 4(sp)                       # 4-byte Folded Reload
	lw	s1, 0(sp)                       # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 12
	.cfi_def_cfa_offset 0
	j	.LBB4_10
.LBB4_9:
	li	a3, 0
.LBB4_10:
	slli	a0, a3, 16
	srai	a0, a0, 16
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
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	sw	s1, 36(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	sw	a3, 12(sp)                      # 4-byte Folded Spill
	sw	a1, 4(sp)                       # 4-byte Folded Spill
	sw	a0, 8(sp)                       # 4-byte Folded Spill
	beqz	a0, .LBB5_5
# %bb.1:
	mv	s1, a2
	li	a1, 0
	lw	a0, 8(sp)                       # 4-byte Folded Reload
	slli	a3, a0, 1
	lw	a0, 12(sp)                      # 4-byte Folded Reload
	sw	a3, 0(sp)                       # 4-byte Folded Spill
	add	a3, a3, a0
	sw	a3, 28(sp)                      # 4-byte Folded Spill
.LBB5_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_3 Depth 2
	li	a4, 0
	sw	a1, 20(sp)                      # 4-byte Folded Spill
	slli	a0, a1, 2
	lw	a1, 4(sp)                       # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	sw	s1, 24(sp)                      # 4-byte Folded Spill
	lw	s0, 12(sp)                      # 4-byte Folded Reload
.LBB5_3:                                #   Parent Loop BB5_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	a4, 32(sp)                      # 4-byte Folded Spill
	lh	a1, 0(s1)
	lh	a0, 0(s0)
	call	__mulsi3
	lw	a4, 32(sp)                      # 4-byte Folded Reload
	lw	a3, 28(sp)                      # 4-byte Folded Reload
	add	a4, a4, a0
	addi	s0, s0, 2
	addi	s1, s1, 2
	bne	s0, a3, .LBB5_3
# %bb.4:                                #   in Loop: Header=BB5_2 Depth=1
	lw	a0, 16(sp)                      # 4-byte Folded Reload
	sw	a4, 0(a0)
	lw	a1, 20(sp)                      # 4-byte Folded Reload
	addi	a1, a1, 1
	lw	s1, 24(sp)                      # 4-byte Folded Reload
	lw	a0, 0(sp)                       # 4-byte Folded Reload
	add	s1, s1, a0
	lw	a0, 8(sp)                       # 4-byte Folded Reload
	bne	a1, a0, .LBB5_2
.LBB5_5:
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	lw	s1, 36(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 48
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
	addi	sp, sp, -60
	.cfi_def_cfa_offset 60
	sw	ra, 56(sp)                      # 4-byte Folded Spill
	sw	s0, 52(sp)                      # 4-byte Folded Spill
	sw	s1, 48(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	sw	a3, 4(sp)                       # 4-byte Folded Spill
	sw	a2, 20(sp)                      # 4-byte Folded Spill
	sw	a1, 0(sp)                       # 4-byte Folded Spill
	beqz	a0, .LBB6_7
# %bb.1:
	mv	s0, a0
	li	a1, 0
	slli	a2, a0, 1
	sw	a0, 12(sp)                      # 4-byte Folded Spill
	sw	a2, 36(sp)                      # 4-byte Folded Spill
.LBB6_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_3 Depth 2
                                        #       Child Loop BB6_4 Depth 3
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	mv	a0, a1
	mv	a1, s0
	call	__mulsi3
	li	a2, 0
	slli	a0, a0, 2
	lw	a1, 0(sp)                       # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	lw	s1, 4(sp)                       # 4-byte Folded Reload
.LBB6_3:                                #   Parent Loop BB6_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_4 Depth 3
	li	a3, 0
	sw	a2, 32(sp)                      # 4-byte Folded Spill
	slli	a0, a2, 2
	lw	a1, 16(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 24(sp)                      # 4-byte Folded Spill
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	sw	s1, 28(sp)                      # 4-byte Folded Spill
.LBB6_4:                                #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	sw	a0, 40(sp)                      # 4-byte Folded Spill
	sw	a3, 44(sp)                      # 4-byte Folded Spill
	lh	a1, 0(a0)
	lh	a0, 0(s1)
	call	__mulsi3
	lw	a3, 44(sp)                      # 4-byte Folded Reload
	add	a3, a3, a0
	lw	a0, 40(sp)                      # 4-byte Folded Reload
	addi	s0, s0, -1
	lw	a1, 36(sp)                      # 4-byte Folded Reload
	add	s1, s1, a1
	addi	a0, a0, 2
	bnez	s0, .LBB6_4
# %bb.5:                                #   in Loop: Header=BB6_3 Depth=2
	lw	a0, 24(sp)                      # 4-byte Folded Reload
	sw	a3, 0(a0)
	lw	a2, 32(sp)                      # 4-byte Folded Reload
	addi	a2, a2, 1
	lw	s1, 28(sp)                      # 4-byte Folded Reload
	addi	s1, s1, 2
	lw	s0, 12(sp)                      # 4-byte Folded Reload
	bne	a2, s0, .LBB6_3
# %bb.6:                                #   in Loop: Header=BB6_2 Depth=1
	lw	a1, 8(sp)                       # 4-byte Folded Reload
	addi	a1, a1, 1
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	lw	a2, 36(sp)                      # 4-byte Folded Reload
	add	a0, a0, a2
	sw	a0, 20(sp)                      # 4-byte Folded Spill
	bne	a1, s0, .LBB6_2
.LBB6_7:
	lw	ra, 56(sp)                      # 4-byte Folded Reload
	lw	s0, 52(sp)                      # 4-byte Folded Reload
	lw	s1, 48(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 60
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
	addi	sp, sp, -60
	.cfi_def_cfa_offset 60
	sw	ra, 56(sp)                      # 4-byte Folded Spill
	sw	s0, 52(sp)                      # 4-byte Folded Spill
	sw	s1, 48(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	sw	a3, 4(sp)                       # 4-byte Folded Spill
	sw	a2, 20(sp)                      # 4-byte Folded Spill
	sw	a1, 0(sp)                       # 4-byte Folded Spill
	beqz	a0, .LBB7_7
# %bb.1:
	mv	s0, a0
	li	a1, 0
	slli	a2, a0, 1
	sw	a0, 12(sp)                      # 4-byte Folded Spill
	sw	a2, 36(sp)                      # 4-byte Folded Spill
.LBB7_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_3 Depth 2
                                        #       Child Loop BB7_4 Depth 3
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	mv	a0, a1
	mv	a1, s0
	call	__mulsi3
	li	a2, 0
	slli	a0, a0, 2
	lw	a1, 0(sp)                       # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	lw	s1, 4(sp)                       # 4-byte Folded Reload
.LBB7_3:                                #   Parent Loop BB7_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_4 Depth 3
	li	a3, 0
	sw	a2, 32(sp)                      # 4-byte Folded Spill
	slli	a0, a2, 2
	lw	a1, 16(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 24(sp)                      # 4-byte Folded Spill
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	sw	s1, 28(sp)                      # 4-byte Folded Spill
.LBB7_4:                                #   Parent Loop BB7_2 Depth=1
                                        #     Parent Loop BB7_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	sw	a0, 40(sp)                      # 4-byte Folded Spill
	sw	a3, 44(sp)                      # 4-byte Folded Spill
	lhu	a1, 0(a0)
	lhu	a0, 0(s1)
	call	__mulsi3
	slli	a1, a0, 26
	slli	a2, a0, 20
	srli	a0, a1, 28
	srli	a1, a2, 25
	call	__mulsi3
	lw	a3, 44(sp)                      # 4-byte Folded Reload
	add	a3, a3, a0
	lw	a0, 40(sp)                      # 4-byte Folded Reload
	addi	s0, s0, -1
	lw	a1, 36(sp)                      # 4-byte Folded Reload
	add	s1, s1, a1
	addi	a0, a0, 2
	bnez	s0, .LBB7_4
# %bb.5:                                #   in Loop: Header=BB7_3 Depth=2
	lw	a0, 24(sp)                      # 4-byte Folded Reload
	sw	a3, 0(a0)
	lw	a2, 32(sp)                      # 4-byte Folded Reload
	addi	a2, a2, 1
	lw	s1, 28(sp)                      # 4-byte Folded Reload
	addi	s1, s1, 2
	lw	s0, 12(sp)                      # 4-byte Folded Reload
	bne	a2, s0, .LBB7_3
# %bb.6:                                #   in Loop: Header=BB7_2 Depth=1
	lw	a1, 8(sp)                       # 4-byte Folded Reload
	addi	a1, a1, 1
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	lw	a2, 36(sp)                      # 4-byte Folded Reload
	add	a0, a0, a2
	sw	a0, 20(sp)                      # 4-byte Folded Spill
	bne	a1, s0, .LBB7_2
.LBB7_7:
	lw	ra, 56(sp)                      # 4-byte Folded Reload
	lw	s0, 52(sp)                      # 4-byte Folded Reload
	lw	s1, 48(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 60
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
	addi	sp, sp, -60
	.cfi_def_cfa_offset 60
	sw	ra, 56(sp)                      # 4-byte Folded Spill
	sw	s0, 52(sp)                      # 4-byte Folded Spill
	sw	s1, 48(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	sw	a3, 12(sp)                      # 4-byte Folded Spill
	beqz	a0, .LBB8_5
# %bb.1:
	sw	a1, 40(sp)                      # 4-byte Folded Spill
	sw	a2, 36(sp)                      # 4-byte Folded Spill
	li	a1, -1
	li	s0, 8
	sw	a0, 44(sp)                      # 4-byte Folded Spill
.LBB8_2:                                # =>This Inner Loop Header: Depth=1
	mv	s1, a1
	addi	a1, a1, 2
	mv	a0, s0
	call	__mulsi3
	lw	a4, 44(sp)                      # 4-byte Folded Reload
	addi	a1, s1, 1
	addi	s0, s0, 8
	bltu	a0, a4, .LBB8_2
# %bb.3:
	lw	a0, 40(sp)                      # 4-byte Folded Reload
	addi	a0, a0, -1
	andi	a0, a0, -4
	addi	s1, a0, 4
	mv	a0, a1
	mv	s0, a1
	call	__mulsi3
	mv	t0, s1
	slli	a2, a0, 1
	add	s1, s1, a2
	beqz	s0, .LBB8_11
# %bb.4:
	mv	a5, s0
	sw	a0, 0(sp)                       # 4-byte Folded Spill
	lw	a2, 36(sp)                      # 4-byte Folded Reload
	j	.LBB8_6
.LBB8_5:
	addi	a0, a1, -1
	li	a5, -1
	andi	a0, a0, -4
	addi	t0, a0, 4
	addi	s1, a0, 6
	li	a0, 1
	sw	a0, 0(sp)                       # 4-byte Folded Spill
.LBB8_6:
	li	a3, 0
	seqz	a0, a2
	slli	a4, a5, 1
	sw	a4, 16(sp)                      # 4-byte Folded Spill
	li	a1, 1
	add	a0, a0, a2
	sw	s1, 4(sp)                       # 4-byte Folded Spill
	mv	a2, s1
	sw	t0, 8(sp)                       # 4-byte Folded Spill
	mv	s0, t0
	sw	a5, 20(sp)                      # 4-byte Folded Spill
.LBB8_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_8 Depth 2
	sw	a3, 32(sp)                      # 4-byte Folded Spill
	slli	a3, a1, 1
	sw	a2, 28(sp)                      # 4-byte Folded Spill
	mv	a4, a2
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	mv	s1, a5
.LBB8_8:                                #   Parent Loop BB8_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	a4, 36(sp)                      # 4-byte Folded Spill
	sw	a3, 40(sp)                      # 4-byte Folded Spill
	sw	a1, 44(sp)                      # 4-byte Folded Spill
	call	__mulsi3
	lw	a4, 36(sp)                      # 4-byte Folded Reload
	lui	a3, 1048560
	lw	a1, 44(sp)                      # 4-byte Folded Reload
	srai	a2, a0, 31
	addi	s1, s1, -1
	srli	a2, a2, 16
	add	a2, a2, a0
	and	a2, a2, a3
	lw	a3, 40(sp)                      # 4-byte Folded Reload
	sub	a0, a0, a2
	add	a2, a1, a0
	sh	a2, 0(a4)
	add	a2, a3, a0
	addi	a1, a1, 1
	andi	a2, a2, 255
	addi	a4, a4, 2
	sh	a2, 0(s0)
	addi	s0, s0, 2
	addi	a3, a3, 2
	bnez	s1, .LBB8_8
# %bb.9:                                #   in Loop: Header=BB8_7 Depth=1
	lw	a3, 32(sp)                      # 4-byte Folded Reload
	addi	a3, a3, 1
	lw	a2, 16(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	add	s0, s0, a2
	lw	a4, 28(sp)                      # 4-byte Folded Reload
	add	a2, a2, a4
	lw	a5, 20(sp)                      # 4-byte Folded Reload
	bne	a3, a5, .LBB8_7
# %bb.10:
	lw	a1, 12(sp)                      # 4-byte Folded Reload
	lw	t0, 8(sp)                       # 4-byte Folded Reload
	lw	s1, 4(sp)                       # 4-byte Folded Reload
	lw	a0, 0(sp)                       # 4-byte Folded Reload
	j	.LBB8_12
.LBB8_11:
	li	a0, 0
	li	a5, 0
	lw	a1, 12(sp)                      # 4-byte Folded Reload
.LBB8_12:
	slli	a0, a0, 1
	add	a0, a0, s1
	addi	a0, a0, -1
	andi	a0, a0, -4
	addi	a0, a0, 4
	sw	a5, 0(a1)
	sw	t0, 4(a1)
	sw	s1, 8(a1)
	sw	a0, 12(a1)
	mv	a0, a5
	lw	ra, 56(sp)                      # 4-byte Folded Reload
	lw	s0, 52(sp)                      # 4-byte Folded Reload
	lw	s1, 48(sp)                      # 4-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 60
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end8:
	.size	core_init_matrix, .Lfunc_end8-core_init_matrix
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 20.1.8 (0ubuntu4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
