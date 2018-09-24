	.file	"xyzzy.c"
	.local	x
	.comm	x,4,4
	.local	step_notflag
	.comm	step_notflag,1,1
	.text
	.globl	xyzzy_init
	.type	xyzzy_init, @function
xyzzy_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, x(%rip)
	movb	$1, step_notflag(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	xyzzy_init, .-xyzzy_init
	.globl	xyzzy_lin
	.type	xyzzy_lin, @function
xyzzy_lin:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	x(%rip), %eax
	testl	%eax, %eax
	jne	.L3
	movl	$1, x(%rip)
.L3:
	movzbl	step_notflag(%rip), %eax
	testb	%al, %al
	je	.L4
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	xyzzy_step_all
	jmp	.L5
.L4:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	xyzzy_flag_all
	movl	x(%rip), %eax
	subl	$1, %eax
	movl	%eax, x(%rip)
.L5:
	movzbl	step_notflag(%rip), %eax
	movzbl	%al, %eax
	testl	%eax, %eax
	setne	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	movb	%al, step_notflag(%rip)
	movl	x(%rip), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	xyzzy_lin, .-xyzzy_lin
	.globl	xyzzy_p
	.type	xyzzy_p, @function
xyzzy_p:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	imull	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	x(%rip), %eax
	testl	%eax, %eax
	jne	.L8
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, x(%rip)
.L8:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	xyzzy_lin
	movl	x(%rip), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	xyzzy_p, .-xyzzy_p
	.globl	xyzzy_step_all
	.type	xyzzy_step_all, @function
xyzzy_step_all:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L11
.L15:
	movl	$0, -8(%rbp)
	jmp	.L12
.L14:
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	addq	$998004, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$1, %eax
	jne	.L13
	movq	-32(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	$1, 4(%rax,%rdx,4)
.L13:
	addl	$1, -8(%rbp)
.L12:
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L14
	addl	$1, -4(%rbp)
.L11:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L15
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	xyzzy_step_all, .-xyzzy_step_all
	.globl	xyzzy_flag_all
	.type	xyzzy_flag_all, @function
xyzzy_flag_all:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L17
.L21:
	movl	$0, -8(%rbp)
	jmp	.L18
.L20:
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	addq	$998004, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$1, %eax
	jne	.L19
	movq	-32(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	$2, 4(%rax,%rdx,4)
.L19:
	addl	$1, -8(%rbp)
.L18:
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L20
	addl	$1, -4(%rbp)
.L17:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L21
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	xyzzy_flag_all, .-xyzzy_flag_all
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
