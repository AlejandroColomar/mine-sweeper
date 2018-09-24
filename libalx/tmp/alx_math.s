	.file	"alx_math.c"
	.text
	.globl	alx_fact
	.type	alx_fact, @function
alx_fact:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jg	.L2
	movsd	.LC0(%rip), %xmm0
	jmp	.L3
.L2:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	-8(%rbp), %xmm1
	movsd	%xmm1, -16(%rbp)
	movq	-8(%rbp), %rax
	subq	$1, %rax
	movq	%rax, %rdi
	call	alx_fact
	mulsd	-16(%rbp), %xmm0
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	alx_fact, .-alx_fact
	.globl	alx_bin_coef
	.type	alx_bin_coef, @function
alx_bin_coef:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$1, -8(%rbp)
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	jmp	.L5
.L6:
	movq	-24(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	mulsd	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
.L5:
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jg	.L6
	movsd	-16(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	alx_bin_coef, .-alx_bin_coef
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
