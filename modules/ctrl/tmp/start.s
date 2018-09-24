	.file	"start.c"
	.comm	start_mode,4,4
	.text
	.globl	start_switch
	.type	start_switch, @function
start_switch:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	start_mode(%rip), %eax
	cmpl	$1, %eax
	je	.L3
	cmpl	$2, %eax
	je	.L4
	testl	%eax, %eax
	je	.L5
	jmp	.L6
.L5:
	call	start_foo
	jmp	.L2
.L3:
	call	start_rand
	jmp	.L2
.L4:
	call	start_load
	nop
.L2:
.L6:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	start_switch, .-start_switch
	.type	start_foo, @function
start_foo:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	start_foo, .-start_foo
	.type	start_rand, @function
start_rand:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	-20(%rbp), %rcx
	leaq	-16(%rbp), %rdx
	leaq	-12(%rbp), %rsi
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	menu_iface_board@PLT
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	player_iface_init@PLT
	leaq	-28(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	player_iface_start@PLT
	testl	%eax, %eax
	setne	%al
	movb	%al, -1(%rbp)
	movzbl	-1(%rbp), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L9
	movl	-28(%rbp), %edi
	movl	-24(%rbp), %ecx
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %esi
	movl	-12(%rbp), %eax
	movl	%edi, %r8d
	movl	%eax, %edi
	call	game_init_rand@PLT
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %ecx
	movl	-8(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	game_iface_init_rand@PLT
	call	game_iface@PLT
.L9:
	call	player_iface_cleanup@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	start_rand, .-start_rand
	.type	start_load, @function
start_load:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	__errno_location@PLT
	movl	$0, (%rax)
	leaq	-8(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	game_init_load@PLT
	call	__errno_location@PLT
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L12
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	player_iface_init@PLT
	call	game_iface_init_load@PLT
	call	game_iface@PLT
	call	player_iface_cleanup@PLT
.L12:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	start_load, .-start_load
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
