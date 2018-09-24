	.file	"menu_iface.c"
	.comm	flag_exit,1,1
	.comm	menu_iface_mode,4,4
	.comm	menu_iface_variables,24,16
	.text
	.globl	menu_iface_init
	.type	menu_iface_init, @function
menu_iface_init:
.LFB206:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, menu_iface_variables(%rip)
	movl	$8, 4+menu_iface_variables(%rip)
	movl	$8, 8+menu_iface_variables(%rip)
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, 16+menu_iface_variables(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE206:
	.size	menu_iface_init, .-menu_iface_init
	.globl	menu_iface_init_iface
	.type	menu_iface_init_iface, @function
menu_iface_init_iface:
.LFB207:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	menu_iface_mode(%rip), %eax
	cmpl	$2, %eax
	je	.L7
	cmpl	$3, %eax
	je	.L5
	cmpl	$1, %eax
	jmp	.L3
.L5:
	call	menu_gui_init@PLT
	jmp	.L3
.L7:
	nop
.L3:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE207:
	.size	menu_iface_init_iface, .-menu_iface_init_iface
	.globl	menu_iface_cleanup
	.type	menu_iface_cleanup, @function
menu_iface_cleanup:
.LFB208:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	menu_iface_mode(%rip), %eax
	cmpl	$2, %eax
	je	.L13
	cmpl	$3, %eax
	je	.L11
	cmpl	$1, %eax
	jmp	.L9
.L11:
	call	menu_gui_cleanup@PLT
	jmp	.L9
.L13:
	nop
.L9:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE208:
	.size	menu_iface_cleanup, .-menu_iface_cleanup
	.globl	menu_iface_board
	.type	menu_iface_board, @function
menu_iface_board:
.LFB209:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movl	menu_iface_variables(%rip), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	ja	.L23
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L17(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L17(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L17:
	.long	.L16-.L17
	.long	.L18-.L17
	.long	.L19-.L17
	.long	.L20-.L17
	.long	.L21-.L17
	.text
.L16:
	movq	-16(%rbp), %rax
	movl	$8, (%rax)
	movq	-24(%rbp), %rax
	movl	$8, (%rax)
	movq	-32(%rbp), %rax
	movl	$10, (%rax)
	jmp	.L15
.L18:
	movq	-16(%rbp), %rax
	movl	$16, (%rax)
	movq	-24(%rbp), %rax
	movl	$16, (%rax)
	movq	-32(%rbp), %rax
	movl	$40, (%rax)
	jmp	.L15
.L19:
	movq	-16(%rbp), %rax
	movl	$16, (%rax)
	movq	-24(%rbp), %rax
	movl	$30, (%rax)
	movq	-32(%rbp), %rax
	movl	$99, (%rax)
	jmp	.L15
.L20:
	movq	-16(%rbp), %rax
	movl	$30, (%rax)
	movq	-24(%rbp), %rax
	movl	$16, (%rax)
	movq	-32(%rbp), %rax
	movl	$99, (%rax)
	jmp	.L15
.L21:
	movl	4+menu_iface_variables(%rip), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movl	8+menu_iface_variables(%rip), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movsd	16+menu_iface_variables(%rip), %xmm1
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm0, %xmm1
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	imull	%ecx, %eax
	cmpl	%eax, %edx
	jne	.L24
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
.L24:
	nop
.L15:
.L23:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE209:
	.size	menu_iface_board, .-menu_iface_board
	.globl	menu_iface
	.type	menu_iface, @function
menu_iface:
.LFB210:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$1, start_mode(%rip)
	movzbl	flag_exit(%rip), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L32
	movl	menu_iface_mode(%rip), %eax
	cmpl	$1, %eax
	je	.L27
	cmpl	$1, %eax
	jg	.L28
	testl	%eax, %eax
	jmp	.L26
.L28:
	cmpl	$2, %eax
	je	.L30
	cmpl	$3, %eax
	je	.L31
	jmp	.L32
.L27:
	call	menu_clui@PLT
	jmp	.L26
.L30:
	call	menu_tui@PLT
	jmp	.L26
.L31:
	call	menu_gui@PLT
	nop
.L26:
.L32:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE210:
	.size	menu_iface, .-menu_iface
	.section	.rodata
	.align 8
.LC0:
	.long	1202590843
	.long	1069841121
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
