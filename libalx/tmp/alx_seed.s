	.file	"alx_seed.c"
	.text
	.globl	seedf
	.type	seedf, @function
seedf:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	-8(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	subl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	shrl	$13, %eax
	xorl	%eax, -4(%rbp)
	movl	-12(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	subl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	sall	$8, %eax
	xorl	%eax, -8(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	subl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	shrl	$13, %eax
	xorl	%eax, -12(%rbp)
	movl	-8(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	subl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	shrl	$12, %eax
	xorl	%eax, -4(%rbp)
	movl	-4(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	subl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	sall	$16, %eax
	xorl	%eax, -8(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	subl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	shrl	$5, %eax
	xorl	%eax, -12(%rbp)
	movl	-8(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	subl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	shrl	$3, %eax
	xorl	%eax, -4(%rbp)
	movl	-4(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	subl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	sall	$10, %eax
	xorl	%eax, -8(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	subl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	shrl	$15, %eax
	xorl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	seedf, .-seedf
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
