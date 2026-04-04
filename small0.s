	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$5clear17hd3145774bb9f1f67E
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$5clear17hd3145774bb9f1f67E:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lw	a2,4(a0)
	lw	a3,8(a0)
	mulhu	a4,a2,a3
	bnez	a4, .Lbranch_800058e6
	mul	a2,a2,a3
	beqz	a2, .Lbranch_800058c0
	lw	a0,0(a0)
	andi	a3,a0,3
	bnez	a3, .Lbranch_800058c8
	slli	a1,a1,0x8
	slli	a2,a2,0x2
	srli	a1,a1,0x8
	add	a2,a2,a0

.Lbranch_800058b8:
	sw	a1,0(a0)
	addi	a0,a0,4
	bne	a0,a2, .Lbranch_800058b8

.Lbranch_800058c0:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	ret

.Lbranch_800058c8:
	lui	a0,0x80014
	addi	a0,a0,1008	# .Lanon.94876b220182c162a7a9ea2366510c9c.3
	lui	a3,0x80014
	addi	a3,a3,1496	# .Lanon.94876b220182c162a7a9ea2366510c9c.31
	li	a1,431
	li	a2,0
	auipc	ra,0xc
	jalr	-1142(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800058e6:
	lui	a0,0x80014
	addi	a0,a0,1480	# .Lanon.94876b220182c162a7a9ea2366510c9c.30
	auipc	ra,0xc
	jalr	-1314(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E
	# ... (zero-filled gap)

	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$9draw_char17h7b5dd6bd0ca19445E
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$9draw_char17h7b5dd6bd0ca19445E:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	addi	s0,sp,64
	mv	s5,a4
	mv	s2,a3
	mv	s3,a2
	mv	s4,a1
	mv	s1,a0
	lui	a1,0x80014
	addi	a1,a1,988	# .Lanon.94876b220182c162a7a9ea2366510c9c.0
	addi	a0,s0,-60
	li	a2,17
	auipc	ra,0x1
	jalr	1050(ra)	# _ZN11homebrew_os3grf7GrfFont9load_font17h619872f3550353d4E
	lw	a0,-60(s0)
	lui	a1,0x80000
	beq	a0,a1, .Lbranch_80005984
	lw	a0,-60(s0)
	lw	a4,-56(s0)
	lw	a5,-52(s0)
	lw	a6,-48(s0)
	lw	a1,0(s1)
	lw	a2,4(s1)
	lw	a3,8(s1)
	sw	a0,-44(s0)
	sw	a4,-40(s0)
	sw	a5,-36(s0)
	sw	a6,-32(s0)
	slli	s5,s5,0x8
	srli	a7,s5,0x8
	addi	a0,s0,-44
	mv	a4,s4
	mv	a5,s3
	mv	a6,s2
	auipc	ra,0x1
	jalr	292(ra)	# _ZN11homebrew_os3grf7GrfFont20render_char_xrgb888817h3b6fb4799d14cd98E
	addi	a0,s0,-60
	li	a1,1
	li	a2,1
	auipc	ra,0x0
	jalr	360(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E

.Lbranch_80005984:
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	addi	sp,sp,64
	ret
	# ... (zero-filled gap)

	.globl _ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$9fill_rect17h94ffd70de5cbea8eE
_ZN97_$LT$homebrew_os..showcase..Xrgb8888Framebuffer$u20$as$u20$homebrew_os..showcase..Framebuffer$GT$9fill_rect17h94ffd70de5cbea8eE:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	add	a6,a3,a1
	bltu	a6,a3, .Lbranch_80005a64
	lw	t1,4(a0)
	bltu	a6,t1, .Lbranch_800059b2
	mv	a6,t1

.Lbranch_800059b2:
	add	a7,a4,a2
	bltu	a7,a4, .Lbranch_80005a74
	lw	a3,8(a0)
	bltu	a7,a3, .Lbranch_800059c2
	mv	a7,a3

.Lbranch_800059c2:
	bgeu	a2,a7, .Lbranch_80005a1e
	slli	a5,a5,0x8
	lw	t4,0(a0)
	mul	t3,t1,a2
	slli	t0,t1,0x2
	srli	t5,a5,0x8
	add	t3,t3,a1
	slli	a0,t3,0x2
	andi	t6,t4,3
	add	t4,t4,a0
	sub	t2,a6,a1
	j	 .Lbranch_800059f4

.Lbranch_800059ea:
	addi	a2,a2,1
	add	t4,t4,t0
	add	t3,t3,t1
	beq	a2,a7, .Lbranch_80005a1e

.Lbranch_800059f4:
	mulhu	a0,a2,t1
	bnez	a0, .Lbranch_80005a54
	bgeu	a1,a6, .Lbranch_800059ea
	mul	a5,a2,t1
	mv	a3,t2
	mv	a4,t3
	mv	a0,t4

.Lbranch_80005a08:
	bltu	a4,a5, .Lbranch_80005a44
	bnez	t6, .Lbranch_80005a26
	sw	t5,0(a0)
	addi	a0,a0,4
	addi	a3,a3,-1
	addi	a4,a4,1
	bnez	a3, .Lbranch_80005a08
	j	 .Lbranch_800059ea

.Lbranch_80005a1e:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	ret

.Lbranch_80005a26:
	lui	a0,0x80014
	addi	a0,a0,1008	# .Lanon.94876b220182c162a7a9ea2366510c9c.3
	lui	a3,0x80014
	addi	a3,a3,1576	# .Lanon.94876b220182c162a7a9ea2366510c9c.36
	li	a1,431
	li	a2,0
	auipc	ra,0xc
	jalr	-1492(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005a44:
	lui	a0,0x80014
	addi	a0,a0,1560	# .Lanon.94876b220182c162a7a9ea2366510c9c.35
	auipc	ra,0xc
	jalr	-1696(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80005a54:
	lui	a0,0x80014
	addi	a0,a0,1544	# .Lanon.94876b220182c162a7a9ea2366510c9c.34
	auipc	ra,0xc
	jalr	-1680(ra)	# _ZN4core9panicking11panic_const24panic_const_mul_overflow17h2f69ba1f7d26bf82E

.Lbranch_80005a64:
	lui	a0,0x80014
	addi	a0,a0,1512	# .Lanon.94876b220182c162a7a9ea2366510c9c.32
	auipc	ra,0xc
	jalr	-1728(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80005a74:
	lui	a0,0x80014
	addi	a0,a0,1528	# .Lanon.94876b220182c162a7a9ea2366510c9c.33
	auipc	ra,0xc
	jalr	-1744(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

	.globl _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0fabdc8fdffe7aacE
_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0fabdc8fdffe7aacE:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	addi	s0,sp,32
	mv	s1,a0
	lw	s2,0(a0)
	slli	s2,s2,0x1
	li	a0,4
	bltu	a0,s2, .Lbranch_80005aa0
	li	s2,4

.Lbranch_80005aa0:
	addi	a0,s0,-28
	li	a3,4
	li	a4,36
	mv	a1,s1
	mv	a2,s2
	auipc	ra,0x0
	jalr	274(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h8d94dc0825276f1cE.llvm.5536013400419366916
	lw	a0,-28(s0)
	bnez	a0, .Lbranch_80005ad2
	lw	a0,-24(s0)
	sw	s2,0(s1)
	sw	a0,4(s1)
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	ret

.Lbranch_80005ad2:
	lw	a0,-24(s0)
	lw	a1,-20(s0)
	auipc	ra,0x9
	jalr	974(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE
	# ... (zero-filled gap)

	.globl _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17hafb268c8d0430969E:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	addi	a3,s0,-12
	beqz	a2, .Lbranch_80005b20
	lw	a4,0(a0)
	beqz	a4, .Lbranch_80005b1e
	mulhu	a3,a2,a4
	bnez	a3, .Lbranch_80005b90
	addi	a3,a1,-1	# .Lline_table_start1+0x7ffb3eaa
	and	a3,a3,a1
	bnez	a3, .Lbranch_80005b60
	mul	a2,a4,a2
	lui	a3,0x80000
	sub	a3,a3,a1
	bltu	a3,a2, .Lbranch_80005b60
	lw	a0,4(a0)
	sw	a1,-12(s0)
	addi	a3,s0,-16
	j	 .Lbranch_80005b20

.Lbranch_80005b1e:
	li	a2,0

.Lbranch_80005b20:
	sw	a2,0(a3)
	lw	a1,-12(s0)
	beqz	a1, .Lbranch_80005b58
	lw	a2,-16(s0)
	beqz	a2, .Lbranch_80005b58
	addi	a3,a1,-1
	and	a3,a3,a1
	bnez	a3, .Lbranch_80005b72
	lui	a3,0x80000
	sub	a3,a3,a1
	bltu	a3,a2, .Lbranch_80005b72
	li	a1,3
	bgeu	a1,a0, .Lbranch_80005bae
	lui	a1,0x80022
	addi	a1,a1,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	lw	a2,8(a1)
	addi	a3,a0,-4
	sw	a2,0(a0)
	sw	a3,8(a1)

.Lbranch_80005b58:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	ret

.Lbranch_80005b60:
	lui	a0,0x80014
	addi	a0,a0,2004	# anon.f35598fd8d4aa665f0d160006d04b7cb.2.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1744	# anon.f35598fd8d4aa665f0d160006d04b7cb.10.llvm.5536013400419366916
	j	 .Lbranch_80005b82

.Lbranch_80005b72:
	lui	a0,0x80015
	addi	a0,a0,-1096	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147
	lui	a3,0x80015
	addi	a3,a3,-1128	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147

.Lbranch_80005b82:
	li	a1,563
	li	a2,0
	auipc	ra,0xc
	jalr	-1824(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005b90:
	lui	a0,0x80014
	addi	a0,a0,1592	# anon.f35598fd8d4aa665f0d160006d04b7cb.0.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1760	# anon.f35598fd8d4aa665f0d160006d04b7cb.9.llvm.5536013400419366916
	li	a1,373
	li	a2,0
	auipc	ra,0xc
	jalr	-1854(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005bae:
	lui	a0,0x80015
	addi	a0,a0,-732	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147
	auipc	ra,0xc
	jalr	-1962(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
	# ... (zero-filled gap)

	.globl _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h8d94dc0825276f1cE.llvm.5536013400419366916
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h8d94dc0825276f1cE.llvm.5536013400419366916:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	addi	s0,sp,48
	mv	s5,a3
	addi	a3,a3,-1
	and	a5,s5,a3
	bnez	a5, .Lbranch_80005cb2
	add	a3,a3,a4
	neg	a5,s5
	and	a5,a5,a3
	lui	a3,0x80000
	sub	a3,a3,s5
	bltu	a3,a5, .Lbranch_80005cb2
	mv	s2,a0
	mulhu	s1,a5,a2
	li	s4,1
	li	a0,4
	bnez	s1, .Lbranch_80005c22
	mul	s3,a5,a2
	bltu	a3,s3, .Lbranch_80005c22
	lw	a0,0(a1)
	beqz	a0, .Lbranch_80005c26
	mulhu	a2,a4,a0
	bnez	a2, .Lbranch_80005ce2
	mul	a0,a0,a4
	bltu	a3,a0, .Lbranch_80005cc4
	lw	a1,4(a1)
	sw	s5,-32(s0)
	addi	a2,s0,-36
	j	 .Lbranch_80005c2a

.Lbranch_80005c22:
	li	s3,0
	j	 .Lbranch_80005c96

.Lbranch_80005c26:
	addi	a2,s0,-32

.Lbranch_80005c2a:
	sw	a0,0(a2)
	lw	a0,-32(s0)
	beqz	a0, .Lbranch_80005c58
	bne	a0,s5, .Lbranch_80005d00
	lw	a3,-36(s0)
	beqz	a3, .Lbranch_80005c60
	bltu	s3,a3, .Lbranch_80005d12
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	mv	a2,s5
	mv	a4,s3
	auipc	ra,0x0
	jalr	364(ra)	# _ZN4core5alloc6global11GlobalAlloc7realloc17h8bfc1a49f0ecea61E
	bnez	a0, .Lbranch_80005c82
	j	 .Lbranch_80005c90

.Lbranch_80005c58:
	bnez	s3, .Lbranch_80005c64
	mv	a0,s5
	j	 .Lbranch_80005c82

.Lbranch_80005c60:
	beqz	s3, .Lbranch_80005c8a

.Lbranch_80005c64:
	auipc	ra,0xffffe
	jalr	-1876(ra)	# _RNvCs5QKde7ScR4H_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	mv	a1,s5
	mv	a2,s3
	auipc	ra,0x0
	jalr	920(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	beqz	a0, .Lbranch_80005c90

.Lbranch_80005c82:
	li	s4,0
	sw	a0,4(s2)
	j	 .Lbranch_80005c94

.Lbranch_80005c8a:
	mv	a0,s5
	bnez	s5, .Lbranch_80005c82

.Lbranch_80005c90:
	sw	s5,4(s2)

.Lbranch_80005c94:
	li	a0,8

.Lbranch_80005c96:
	add	a0,a0,s2
	sw	s3,0(a0)
	sw	s4,0(s2)
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	addi	sp,sp,48
	ret

.Lbranch_80005cb2:
	lui	a0,0x80014
	addi	a0,a0,2004	# anon.f35598fd8d4aa665f0d160006d04b7cb.2.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1808	# anon.f35598fd8d4aa665f0d160006d04b7cb.4.llvm.5536013400419366916
	j	 .Lbranch_80005cd4

.Lbranch_80005cc4:
	lui	a0,0x80014
	addi	a0,a0,2004	# anon.f35598fd8d4aa665f0d160006d04b7cb.2.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1744	# anon.f35598fd8d4aa665f0d160006d04b7cb.10.llvm.5536013400419366916

.Lbranch_80005cd4:
	li	a1,563
	li	a2,0
	auipc	ra,0xb
	jalr	1934(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005ce2:
	lui	a0,0x80014
	addi	a0,a0,1592	# anon.f35598fd8d4aa665f0d160006d04b7cb.0.llvm.5536013400419366916
	lui	a3,0x80015
	addi	a3,a3,-1760	# anon.f35598fd8d4aa665f0d160006d04b7cb.9.llvm.5536013400419366916
	li	a1,373
	li	a2,0
	auipc	ra,0xb
	jalr	1904(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005d00:
	lui	a0,0x80014
	addi	a0,a0,1780	# .Lanon.f35598fd8d4aa665f0d160006d04b7cb.1
	lui	a3,0x80015
	addi	a3,a3,-1776	# .Lanon.f35598fd8d4aa665f0d160006d04b7cb.8
	j	 .Lbranch_80005d22

.Lbranch_80005d12:
	lui	a0,0x80014
	addi	a0,a0,1780	# .Lanon.f35598fd8d4aa665f0d160006d04b7cb.1
	lui	a3,0x80015
	addi	a3,a3,-1792	# .Lanon.f35598fd8d4aa665f0d160006d04b7cb.6

.Lbranch_80005d22:
	li	a1,443
	li	a2,0
	auipc	ra,0xb
	jalr	1856(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h38f229e524dc576dE:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	addi	s0,sp,32
	bnez	a4, .Lbranch_80005d48

.Lbranch_80005d3e:
	li	a0,0
	auipc	ra,0x9
	jalr	360(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE

.Lbranch_80005d48:
	add	s1,a2,a1
	bltu	s1,a2, .Lbranch_80005d3e
	lw	a1,0(a0)
	slli	a1,a1,0x1
	bltu	a1,s1, .Lbranch_80005d5a
	mv	s1,a1

.Lbranch_80005d5a:
	li	a1,1025
	li	a2,1
	bltu	a4,a1, .Lbranch_80005d68
	li	a1,1
	j	 .Lbranch_80005d6a

.Lbranch_80005d68:
	li	a1,4

.Lbranch_80005d6a:
	bne	a4,a2, .Lbranch_80005d70
	li	a1,8

.Lbranch_80005d70:
	mv	s2,a0
	bltu	a1,s1, .Lbranch_80005d78
	mv	s1,a1

.Lbranch_80005d78:
	addi	a0,s0,-28
	mv	a1,s2
	mv	a2,s1
	auipc	ra,0x0
	jalr	-448(ra)	# _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h8d94dc0825276f1cE.llvm.5536013400419366916
	lw	a0,-28(s0)
	bnez	a0, .Lbranch_80005da6
	lw	a0,-24(s0)
	sw	s1,0(s2)
	sw	a0,4(s2)
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	ret

.Lbranch_80005da6:
	lw	a0,-24(s0)
	lw	a1,-20(s0)
	auipc	ra,0x9
	jalr	250(ra)	# _ZN5alloc7raw_vec12handle_error17h863d0569f7ccce7eE
	# ... (zero-filled gap)

	.globl _ZN4core5alloc6global11GlobalAlloc7realloc17h8bfc1a49f0ecea61E
_ZN4core5alloc6global11GlobalAlloc7realloc17h8bfc1a49f0ecea61E:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	addi	s0,sp,32
	mv	s3,a1
	addi	a1,a2,-1
	and	a1,a1,a2
	bnez	a1, .Lbranch_80005e4a
	mv	s1,a4
	mv	s2,a0
	lui	a0,0x80000
	sub	a0,a0,a2
	bltu	a0,a4, .Lbranch_80005e4a
	mv	s4,a3
	mv	a0,s2
	mv	a1,a2
	mv	a2,s1
	auipc	ra,0x0
	jalr	552(ra)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
	beqz	a0, .Lbranch_80005e3a
	bltu	s1,s4, .Lbranch_80005df8
	mv	s1,s4

.Lbranch_80005df8:
	bnez	s3, .Lbranch_80005dfe
	bnez	s1, .Lbranch_80005e68

.Lbranch_80005dfe:
	bltu	a0,s3, .Lbranch_80005e08
	sub	a1,a0,s3
	j	 .Lbranch_80005e0c

.Lbranch_80005e08:
	sub	a1,s3,a0

.Lbranch_80005e0c:
	bltu	a1,s1, .Lbranch_80005e68
	mv	s4,a0
	mv	a1,s3
	mv	a2,s1
	auipc	ra,0x0
	jalr	714(ra)	# memcpy
	mv	a0,s4
	beqz	s3, .Lbranch_80005e3a
	li	a1,4
	bltu	s3,a1, .Lbranch_80005e86
	lw	a1,8(s2)
	addi	a2,s3,-4
	sw	a1,0(s3)
	sw	a2,8(s2)

.Lbranch_80005e3a:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	addi	sp,sp,32
	ret

.Lbranch_80005e4a:
	lui	a0,0x80015
	addi	a0,a0,-1412	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.5.llvm.2171931009800262987
	lui	a3,0x80015
	addi	a3,a3,-1444	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.3.llvm.2171931009800262987
	li	a1,563
	li	a2,0
	auipc	ra,0xb
	jalr	1544(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005e68:
	lui	a0,0x80015
	addi	a0,a0,-1728	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.0.llvm.2171931009800262987
	lui	a3,0x80015
	addi	a3,a3,-1428	# anon.17904dba1e92d1cee57ddc06e0f4a7fd.4.llvm.2171931009800262987
	li	a1,567
	li	a2,0
	auipc	ra,0xb
	jalr	1514(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005e86:
	lui	a0,0x80015
	addi	a0,a0,-732	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	1406(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
	# ... (zero-filled gap)

	.globl _RNvCs5QKde7ScR4H_7___rustc12___rust_alloc
_RNvCs5QKde7ScR4H_7___rustc12___rust_alloc:
	addi	a3,a1,-1
	xor	a4,a1,a3
	bgeu	a3,a4, .Lbranch_80005ec0
	mv	a2,a0
	lui	a0,0x80000
	sub	a0,a0,a1
	bltu	a0,a2, .Lbranch_80005ec0
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	auipc	t1,0x0
	jr	344(t1)	# _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE

.Lbranch_80005ec0:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lui	a0,0x80015
	addi	a0,a0,-1096	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147
	lui	a3,0x80015
	addi	a3,a3,-1128	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147
	li	a1,563
	li	a2,0
	auipc	ra,0xb
	jalr	1418(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E
	# ... (zero-filled gap)

	.globl _RNvCs5QKde7ScR4H_7___rustc14___rust_dealloc
_RNvCs5QKde7ScR4H_7___rustc14___rust_dealloc:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	addi	a3,a2,-1
	xor	a4,a2,a3
	bgeu	a3,a4, .Lbranch_80005f28
	lui	a3,0x80000
	sub	a3,a3,a2
	bltu	a3,a1, .Lbranch_80005f28
	beqz	a0, .Lbranch_80005f20
	li	a1,4
	bltu	a0,a1, .Lbranch_80005f46
	lui	a1,0x80022
	addi	a1,a1,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	lw	a2,8(a1)
	addi	a3,a0,-4
	sw	a2,0(a0)
	sw	a3,8(a1)

.Lbranch_80005f20:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	ret

.Lbranch_80005f28:
	lui	a0,0x80015
	addi	a0,a0,-1096	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147
	lui	a3,0x80015
	addi	a3,a3,-1128	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147
	li	a1,563
	li	a2,0
	auipc	ra,0xb
	jalr	1322(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_80005f46:
	lui	a0,0x80015
	addi	a0,a0,-732	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.15.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	1214(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E
	# ... (zero-filled gap)

	.globl _RNvCs5QKde7ScR4H_7___rustc14___rust_realloc
_RNvCs5QKde7ScR4H_7___rustc14___rust_realloc:
	addi	a5,a2,-1
	xor	a4,a2,a5
	bgeu	a5,a4, .Lbranch_80005f86
	mv	a6,a3
	mv	a3,a1
	mv	a1,a0
	lui	a0,0x80000
	sub	a0,a0,a2
	bltu	a0,a3, .Lbranch_80005f86
	lui	a0,0x80022
	addi	a0,a0,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	mv	a4,a6
	auipc	t1,0x0
	jr	-454(t1)	# _ZN4core5alloc6global11GlobalAlloc7realloc17h8bfc1a49f0ecea61E

.Lbranch_80005f86:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lui	a0,0x80015
	addi	a0,a0,-1096	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.9.llvm.3372952439789298147
	lui	a3,0x80015
	addi	a3,a3,-1128	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.1.llvm.3372952439789298147
	li	a1,563
	li	a2,0
	auipc	ra,0xb
	jalr	1220(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

	.globl _ZN11homebrew_os4heap9init_heap17h33c877372d05e6f1E
_ZN11homebrew_os4heap9init_heap17h33c877372d05e6f1E:
	lui	a1,0x80100
	mv	a1,a1
	addi	a0,a1,3	# __heap_start+0x3
	bltu	a0,a1, .Lbranch_80005ff6
	andi	a0,a0,-4
	lui	a1,0x80300
	mv	a1,a1
	bgeu	a0,a1, .Lbranch_80005ff4
	sub	a2,a1,a0
	lui	a3,0x80022
	sw	a0,8(a3)	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	addi	a3,a3,8
	li	a4,8
	sw	a1,4(a3)
	bltu	a2,a4, .Lbranch_80005ff4
	addi	a2,a2,-8
	lui	a1,0x80022
	addi	a1,a1,8	# _ZN11homebrew_os4heap9ALLOCATOR17h1ba9fce820213eefE
	sw	a2,0(a0)
	sw	zero,4(a0)
	sw	a0,8(a1)

.Lbranch_80005ff4:
	ret

.Lbranch_80005ff6:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lui	a0,0x80015
	addi	a0,a0,-1112	# .Lanon.98d8f5b3645f1dd0bd97de9ecfa06603.8
	auipc	ra,0xb
	jalr	934(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl _ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE
_ZN89_$LT$homebrew_os..heap..FreeListAllocator$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17h4d15bd62401dedafE:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lw	a3,0(a0)
	beqz	a3, .Lbranch_80006054
	li	a3,8
	bltu	a3,a1, .Lbranch_80006024
	li	a1,8

.Lbranch_80006024:
	add	a3,a2,a1
	bltu	a3,a2, .Lbranch_8000608e
	beqz	a3, .Lbranch_8000609e
	lw	a2,8(a0)
	beqz	a2, .Lbranch_80006054
	addi	a3,a3,-1
	lw	a4,0(a2)
	neg	a1,a1
	and	a1,a1,a3
	addi	a1,a1,4
	bgeu	a4,a1, .Lbranch_80006058

.Lbranch_80006042:
	mv	a3,a2
	lw	a2,4(a2)
	beqz	a2, .Lbranch_80006054
	lw	a4,0(a2)
	bltu	a4,a1, .Lbranch_80006042
	lw	a4,4(a2)
	sw	a4,4(a3)
	j	 .Lbranch_8000605c

.Lbranch_80006054:
	li	a0,0
	j	 .Lbranch_80006086

.Lbranch_80006058:
	lw	a3,4(a2)
	sw	a3,8(a0)

.Lbranch_8000605c:
	lw	a3,0(a2)
	bltu	a3,a1, .Lbranch_800060ae
	sub	a3,a3,a1
	li	a4,15
	bgeu	a4,a3, .Lbranch_8000607a
	add	a4,a1,a2
	bltu	a4,a1, .Lbranch_800060ce
	sw	a3,0(a4)
	lw	a3,8(a0)
	sw	a3,4(a4)
	sw	a4,8(a0)

.Lbranch_8000607a:
	li	a0,-5
	sw	a1,0(a2)
	bltu	a0,a2, .Lbranch_800060be
	addi	a0,a2,4

.Lbranch_80006086:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	ret

.Lbranch_8000608e:
	lui	a0,0x80015
	addi	a0,a0,-812	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.10.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	790(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_8000609e:
	lui	a0,0x80015
	addi	a0,a0,-796	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.11.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	870(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_800060ae:
	lui	a0,0x80015
	addi	a0,a0,-780	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.12.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	854(ra)	# _ZN4core9panicking11panic_const24panic_const_sub_overflow17hf96cf75e455bb177E

.Lbranch_800060be:
	lui	a0,0x80015
	addi	a0,a0,-748	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.14.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	742(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_800060ce:
	lui	a0,0x80015
	addi	a0,a0,-764	# anon.98d8f5b3645f1dd0bd97de9ecfa06603.13.llvm.3372952439789298147
	auipc	ra,0xb
	jalr	726(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E
	# ... (zero-filled gap)

	.globl memcpy
memcpy:
	beqz	a2, .Lbranch_80006104
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	add	a2,a2,a0
	mv	a3,a0

.Lbranch_800060ee:
	lbu	a4,0(a1)
	sb	a4,0(a3)
	addi	a3,a3,1
	addi	a1,a1,1
	bne	a3,a2, .Lbranch_800060ee
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16

.Lbranch_80006104:
	ret
	# ... (zero-filled gap)

	.globl memmove
memmove:
	beq	a0,a1, .Lbranch_80006154
	beqz	a2, .Lbranch_80006154
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	bgeu	a0,a1, .Lbranch_80006130
	add	a2,a2,a0
	mv	a3,a0

.Lbranch_8000611e:
	lbu	a4,0(a1)
	sb	a4,0(a3)
	addi	a3,a3,1
	addi	a1,a1,1
	bne	a3,a2, .Lbranch_8000611e
	j	 .Lbranch_8000614e

.Lbranch_80006130:
	neg	a3,a2
	addi	a4,a2,-1
	add	a2,a0,a4
	add	a1,a1,a4

.Lbranch_8000613e:
	lbu	a4,0(a1)
	addi	a3,a3,1
	sb	a4,0(a2)
	addi	a2,a2,-1
	addi	a1,a1,-1
	bnez	a3, .Lbranch_8000613e

.Lbranch_8000614e:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16

.Lbranch_80006154:
	ret
	# ... (zero-filled gap)

	.globl memset
memset:
	beqz	a2, .Lbranch_80006176
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	add	a2,a2,a0
	mv	a3,a0

.Lbranch_80006166:
	sb	a1,0(a3)
	addi	a3,a3,1
	bne	a3,a2, .Lbranch_80006166
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16

.Lbranch_80006176:
	ret

	.globl _ZN11homebrew_os12virtio_input17poll_virtio_input17h58b863981976fb93E
_ZN11homebrew_os12virtio_input17poll_virtio_input17h58b863981976fb93E:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	sw	s11,12(sp)
	addi	s0,sp,64
	lui	s4,0x80027
	mv	s4,s4
	lw	s5,4(s4)	# _ZN11homebrew_os12virtio_input12DEVICE_COUNT17h1fe916d648e80832E.0
	beqz	s5, .Lbranch_80006486
	li	a0,0
	li	a5,0
	li	a6,-97
	li	a7,-3
	li	t1,64
	li	t2,1
	li	s2,-101

.Lbranch_800061ba:
	li	a1,2
	mv	t4,a5
	bltu	a1,a5, .Lbranch_800061c4
	li	t4,2

.Lbranch_800061c4:
	slli	a1,a5,0x9
	slli	s1,a5,0x4
	addi	s11,a1,50
	addi	ra,a1,52
	addi	t6,a1,48
	addi	a1,s1,28
	addi	a4,s1,16
	addi	s1,s1,30
	j	 .Lbranch_800061fc

.Lbranch_800061e4:
	addi	a5,a5,1
	addi	s11,s11,512
	addi	ra,ra,512
	addi	t6,t6,512
	addi	a1,a1,16
	addi	a4,a4,16
	addi	s1,s1,16
	bgeu	a5,s5, .Lbranch_80006488

.Lbranch_800061fc:
	beq	t4,a5, .Lbranch_800064fc
	add	a2,s4,s1
	lbu	a2,0(a2)
	beqz	a2, .Lbranch_800061e4
	add	a2,s4,a4
	lw	t0,0(a2)
	bltu	a6,t0, .Lbranch_80006520
	andi	a3,t0,3
	bnez	a3, .Lbranch_800064a8
	lw	s6,4(a2)
	lw	a3,8(a2)
	lw	a2,96(t0)
	beqz	a2, .Lbranch_80006232
	bltu	s2,t0, .Lbranch_80006540
	sw	a2,100(t0)

.Lbranch_80006232:
	bltu	a7,a3, .Lbranch_80006530
	andi	a2,a3,1
	bnez	a2, .Lbranch_800064ba
	lhu	t5,2(a3)
	add	s7,s4,a1
	lhu	a2,0(s7)
	beq	t5,a2, .Lbranch_800061e4
	li	s3,-5
	bltu	s3,a3, .Lbranch_80006510
	addi	a4,a3,4
	andi	s8,a3,2
	andi	s9,s6,1
	addi	s10,s6,4
	addi	a5,a5,1
	add	s11,s11,s4
	add	ra,ra,s4
	add	t6,t6,s4
	j	 .Lbranch_8000627a

.Lbranch_8000626e:
	addi	a2,a2,1
	slli	a1,a2,0x10
	srli	a1,a1,0x10
	beq	a1,t5, .Lbranch_80006470

.Lbranch_8000627a:
	slli	a1,a2,0x1a
	srli	a1,a1,0x17
	add	a1,a1,a4
	bltu	a1,a4, .Lbranch_80006510
	bnez	s8, .Lbranch_800064cc
	lw	s2,0(a1)
	bgeu	s2,t1, .Lbranch_8000626e
	slli	a1,s2,0x3
	add	a3,t6,a1
	lhu	a3,0(a3)
	beq	a3,t2, .Lbranch_800062d8
	li	s1,3
	bne	a3,s1, .Lbranch_8000632e
	add	a3,s11,a1
	lhu	a3,0(a3)
	beqz	a3, .Lbranch_8000630e
	bne	a3,t2, .Lbranch_8000632e
	add	a1,a1,ra
	lui	a3,0x80021
	lw	a3,1424(a3)	# _ZN11homebrew_os12virtio_input13SCREEN_HEIGHT17h471b6b177d2dd028E.0
	lw	a1,0(a1)
	mul	s1,a3,a1
	mulhu	a1,a3,a1
	slli	a1,a1,0x11
	srli	s1,s1,0xf
	or	a1,a1,s1
	li	s3,-5
	sw	a1,12(s4)
	j	 .Lbranch_8000632e

.Lbranch_800062d8:
	add	a3,ra,a1
	lw	a3,0(a3)
	bne	a3,t2, .Lbranch_8000632e
	add	a1,a1,s11
	lhu	a1,0(a1)
	addi	a1,a1,-2
	li	a3,55
	bltu	a3,a1, .Lbranch_8000632e
	slli	a1,a1,0x2
	lui	a3,0x80015
	addi	a3,a3,-716	# .LJTI0_0
	add	a1,a1,a3
	lw	a3,0(a1)
	li	t4,1
	li	a1,49
	jr	a3
	li	a1,50
	j	 .Lbranch_80006332

.Lbranch_8000630e:
	add	a1,a1,ra
	lui	a3,0x80021
	lw	a3,1420(a3)	# .L_MergedGlobals
	lw	a1,0(a1)
	mul	s1,a3,a1
	mulhu	a1,a3,a1
	slli	a1,a1,0x11
	srli	s1,s1,0xf
	or	a1,a1,s1
	li	s3,-5
	sw	a1,8(s4)

.Lbranch_8000632e:
	mv	a1,t3
	mv	t4,a0

.Lbranch_80006332:
	bltu	a7,s6, .Lbranch_80006550
	bnez	s9, .Lbranch_800064de
	lhu	a0,2(s6)
	bltu	s3,s6, .Lbranch_80006570
	slli	a3,a0,0x1a
	srli	a3,a3,0x19
	add	a3,a3,s10
	bltu	a3,s10, .Lbranch_80006560
	sh	s2,0(a3)
	addi	a0,a0,1
	sh	a0,2(s6)
	mv	t3,a1
	mv	a0,t4
	j	 .Lbranch_8000626e
	li	a1,109
	j	 .Lbranch_80006332
	li	a1,107
	j	 .Lbranch_80006332
	li	a1,99
	j	 .Lbranch_80006332
	li	a1,120
	j	 .Lbranch_80006332
	li	a1,92
	j	 .Lbranch_80006332
	li	a1,115
	j	 .Lbranch_80006332
	li	a1,44
	j	 .Lbranch_80006332
	li	a1,117
	j	 .Lbranch_80006332
	li	a1,108
	j	 .Lbranch_80006332
	li	a1,112
	j	 .Lbranch_80006332
	li	a1,119
	j	 .Lbranch_80006332
	li	a1,97
	j	 .Lbranch_80006332
	li	a1,57
	j	 .Lbranch_80006332
	li	a1,93
	j	 .Lbranch_80006332
	li	a1,118
	j	 .Lbranch_80006332
	li	a1,45
	j	 .Lbranch_80006332
	li	a1,102
	j	 .Lbranch_80006332
	li	a1,52
	j	 .Lbranch_80006332
	li	a1,51
	j	 .Lbranch_80006332
	li	a1,103
	j	 .Lbranch_80006332
	li	a1,106
	j	 .Lbranch_80006332
	li	a1,91
	j	 .Lbranch_80006332
	li	a1,113
	j	 .Lbranch_80006332
	li	a1,105
	j	 .Lbranch_80006332
	li	a1,53
	j	 .Lbranch_80006332
	li	a1,61
	j	 .Lbranch_80006332
	li	a1,98
	j	 .Lbranch_80006332
	li	a1,46
	j	 .Lbranch_80006332
	li	a1,54
	j	 .Lbranch_80006332
	li	a1,13
	j	 .Lbranch_80006332
	li	a1,47
	j	 .Lbranch_80006332
	li	a1,122
	j	 .Lbranch_80006332
	li	a1,104
	j	 .Lbranch_80006332
	li	a1,101
	j	 .Lbranch_80006332
	li	a1,114
	j	 .Lbranch_80006332
	li	a1,55
	j	 .Lbranch_80006332
	li	a1,56
	j	 .Lbranch_80006332
	li	a1,48
	j	 .Lbranch_80006332
	li	a1,59
	j	 .Lbranch_80006332
	li	a1,121
	j	 .Lbranch_80006332
	li	a1,116
	j	 .Lbranch_80006332
	li	a1,110
	j	 .Lbranch_80006332
	li	a1,111
	j	 .Lbranch_80006332
	li	a1,100
	j	 .Lbranch_80006332
	li	a1,39
	j	 .Lbranch_80006332
	li	a1,32
	j	 .Lbranch_80006332

.Lbranch_80006470:
	sh	t5,0(s7)
	fence	w,w
	sw	zero,80(t0)
	li	s2,-101
	bltu	a5,s5, .Lbranch_800061ba
	j	 .Lbranch_80006488

.Lbranch_80006486:
	li	a0,0

.Lbranch_80006488:
	mv	a1,t3
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	lw	s8,24(sp)
	lw	s9,20(sp)
	lw	s10,16(sp)
	lw	s11,12(sp)
	addi	sp,sp,64
	ret

.Lbranch_800064a8:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-460	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.3
	j	 .Lbranch_800064ee

.Lbranch_800064ba:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-412	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.6
	j	 .Lbranch_800064ee

.Lbranch_800064cc:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-380	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.8
	j	 .Lbranch_800064ee

.Lbranch_800064de:
	lui	a0,0x80015
	addi	a0,a0,-12	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.38
	lui	a3,0x80015
	addi	a3,a3,-348	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.10

.Lbranch_800064ee:
	li	a1,429
	li	a2,0
	auipc	ra,0xb
	jalr	-140(ra)	# _ZN4core9panicking18panic_nounwind_fmt17h8da713805ceba324E

.Lbranch_800064fc:
	lui	a2,0x80015
	addi	a2,a2,-492	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.1
	li	a1,2
	mv	a0,t4
	auipc	ra,0xb
	jalr	-220(ra)	# _ZN4core9panicking18panic_bounds_check17h095802f12123dfa9E

.Lbranch_80006510:
	lui	a0,0x80015
	addi	a0,a0,-396	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.7
	auipc	ra,0xb
	jalr	-364(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006520:
	lui	a0,0x80015
	addi	a0,a0,-476	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.2
	auipc	ra,0xb
	jalr	-380(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006530:
	lui	a0,0x80015
	addi	a0,a0,-428	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.5
	auipc	ra,0xb
	jalr	-396(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006540:
	lui	a0,0x80015
	addi	a0,a0,-444	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.4
	auipc	ra,0xb
	jalr	-412(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006550:
	lui	a0,0x80015
	addi	a0,a0,-364	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.9
	auipc	ra,0xb
	jalr	-428(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006560:
	lui	a0,0x80015
	addi	a0,a0,-316	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.12
	auipc	ra,0xb
	jalr	-444(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

.Lbranch_80006570:
	lui	a0,0x80015
	addi	a0,a0,-332	# .Lanon.a4265bc29c3d41f886fb6e82697ae70e.11
	auipc	ra,0xb
	jalr	-460(ra)	# _ZN4core9panicking11panic_const24panic_const_add_overflow17had50c54de27cc8f0E

