	.file	"main.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB206:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	-16(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	init_all
	movl	$0, %edi
	call	print_share_file@PLT
	call	getchar@PLT
	call	start_switch@PLT
	call	menu_iface@PLT
	call	cleanup
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE206:
	.size	main, .-main
	.globl	init_all
	.type	init_all, @function
init_all:
.LFB207:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gtk_init_check@PLT
	call	alx_start_curses@PLT
	call	alx_pause_curses@PLT
	call	menu_iface_init@PLT
	call	game_init@PLT
	call	about_init@PLT
	call	save_init@PLT
	call	score_init@PLT
	movl	$0, start_mode(%rip)
	movb	$0, flag_exit(%rip)
	movl	$2, menu_iface_mode(%rip)
	movl	$2, player_iface_mode(%rip)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	parser@PLT
	call	menu_iface_init_iface@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE207:
	.size	init_all, .-init_all
	.globl	cleanup
	.type	cleanup, @function
cleanup:
.LFB208:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	menu_iface_cleanup@PLT
	call	alx_resume_curses@PLT
	call	alx_end_curses@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE208:
	.size	cleanup, .-cleanup
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
