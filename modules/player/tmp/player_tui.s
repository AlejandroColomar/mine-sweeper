	.file	"player_tui.c"
	.comm	flag_color,1,1
	.local	win_board
	.comm	win_board,8,8
	.local	win_help
	.comm	win_help,8,8
	.local	last_help
	.comm	last_help,4,4
	.text
	.globl	player_tui_init
	.type	player_tui_init, @function
player_tui_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	call	alx_resume_curses@PLT
	movb	$0, flag_color(%rip)
	call	has_colors@PLT
	testb	%al, %al
	je	.L2
	movb	$1, flag_color(%rip)
	movl	$7, %edx
	movl	$4, %esi
	movl	$1, %edi
	call	init_pair@PLT
	movl	$7, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	init_pair@PLT
	movl	$7, %edx
	movl	$1, %esi
	movl	$3, %edi
	call	init_pair@PLT
	movl	$7, %edx
	movl	$4, %esi
	movl	$4, %edi
	call	init_pair@PLT
	movl	$7, %edx
	movl	$1, %esi
	movl	$5, %edi
	call	init_pair@PLT
	movl	$7, %edx
	movl	$6, %esi
	movl	$6, %edi
	call	init_pair@PLT
	movl	$7, %edx
	movl	$0, %esi
	movl	$7, %edi
	call	init_pair@PLT
	movl	$7, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	init_pair@PLT
	movl	$7, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	init_pair@PLT
	movl	$0, %edx
	movl	$7, %esi
	movl	$10, %edi
	call	init_pair@PLT
	movl	$0, %edx
	movl	$7, %esi
	movl	$11, %edi
	call	init_pair@PLT
	movl	$0, %edx
	movl	$1, %esi
	movl	$12, %edi
	call	init_pair@PLT
	movl	$0, %edx
	movl	$4, %esi
	movl	$13, %edi
	call	init_pair@PLT
	movl	$0, %edx
	movl	$1, %esi
	movl	$14, %edi
	call	init_pair@PLT
	movl	$0, %edx
	movl	$1, %esi
	movl	$15, %edi
	call	init_pair@PLT
	movl	$1, %edx
	movl	$0, %esi
	movl	$16, %edi
	call	init_pair@PLT
	movl	$1, %edx
	movl	$3, %esi
	movl	$17, %edi
	call	init_pair@PLT
	movl	$-1, %edx
	movl	$-1, %esi
	movl	$18, %edi
	call	init_pair@PLT
.L2:
	movl	-36(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -4(%rbp)
	movl	-40(%rbp), %eax
	addl	%eax, %eax
	addl	$3, %eax
	movl	%eax, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$11, -16(%rbp)
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, win_board(%rip)
	movl	$24, -20(%rbp)
	movl	$10, -24(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -32(%rbp)
	movl	-32(%rbp), %ecx
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %esi
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, win_help(%rip)
	movq	win_board(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	keypad@PLT
	call	noecho@PLT
	movq	win_board(%rip), %rax
	movl	$100, %esi
	movq	%rax, %rdi
	call	wtimeout@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	player_tui_init, .-player_tui_init
	.globl	player_tui_start
	.type	player_tui_start, @function
player_tui_start:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	call	show_help_start
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	show_board_start
	call	usr_input
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	player_tui_start, .-player_tui_start
	.globl	player_tui
	.type	player_tui, @function
player_tui:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	show_help
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	show_board
	call	usr_input
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	player_tui, .-player_tui
	.section	.rodata
.LC0:
	.string	"File name:"
	.text
	.globl	player_tui_save_name
	.type	player_tui_save_name, @function
player_tui_save_name:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$60, -4(%rbp)
	movl	$10, -8(%rbp)
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	leaq	.LC0(%rip), %r9
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	movl	$0, %eax
	call	alx_w_getfname@PLT
	addq	$16, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	player_tui_save_name, .-player_tui_save_name
	.section	.rodata
.LC1:
	.string	"Your name:"
	.text
	.globl	player_tui_score_name
	.type	player_tui_score_name, @function
player_tui_score_name:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$60, -4(%rbp)
	movl	$10, -8(%rbp)
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	-28(%rbp), %esi
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	leaq	.LC1(%rip), %r8
	movq	%rax, %rdi
	movl	$0, %eax
	call	alx_w_getstr@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	player_tui_score_name, .-player_tui_score_name
	.globl	player_tui_cleanup
	.type	player_tui_cleanup, @function
player_tui_cleanup:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	movq	win_help(%rip), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	call	alx_pause_curses@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	player_tui_cleanup, .-player_tui_cleanup
	.type	show_board_start, @function
show_board_start:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	werase@PLT
	movq	win_board(%rip), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wborder@PLT
	addq	$32, %rsp
	movq	win_board(%rip), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	alx_ncur_prn_title@PLT
	movq	win_board(%rip), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	alx_ncur_prn_subtitle@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	board_loop_start
	movq	-8(%rbp), %rax
	movl	12(%rax), %eax
	addl	$1, %eax
	leal	(%rax,%rax), %edx
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %ecx
	movq	win_board(%rip), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	show_board_start, .-show_board_start
	.type	board_loop_start, @function
board_loop_start:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	$43, -12(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L10
.L13:
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L11
.L12:
	movl	-8(%rbp), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -20(%rbp)
	movl	-12(%rbp), %edx
	movl	-20(%rbp), %ecx
	movl	-16(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	show_char
	addl	$1, -8(%rbp)
.L11:
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L12
	addl	$1, -4(%rbp)
.L10:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L13
	movq	-40(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L15
	movq	-40(%rbp), %rdx
	movl	-12(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	highlight_cursor
.L15:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	board_loop_start, .-board_loop_start
	.type	highlight_cursor_start, @function
highlight_cursor_start:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	12(%rax), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -8(%rbp)
	movl	$43, -12(%rbp)
	movl	$17, -16(%rbp)
	movzbl	flag_color(%rip), %eax
	testb	%al, %al
	je	.L17
	movl	-16(%rbp), %eax
	cltq
	salq	$8, %rax
	orq	$2097152, %rax
	movq	%rax, %rcx
	movq	win_board(%rip), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wattr_on@PLT
.L17:
	movl	-8(%rbp), %eax
	leal	-1(%rax), %edx
	movq	win_board(%rip), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L19
	movq	win_board(%rip), %rax
	movl	$60, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L19:
	movq	win_board(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L21
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	win_board(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L21:
	movl	-8(%rbp), %eax
	leal	1(%rax), %edx
	movq	win_board(%rip), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L23
	movq	win_board(%rip), %rax
	movl	$62, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L23:
	movzbl	flag_color(%rip), %eax
	testb	%al, %al
	je	.L25
	movl	-16(%rbp), %eax
	cltq
	salq	$8, %rax
	orq	$2097152, %rax
	movq	%rax, %rcx
	movq	win_board(%rip), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wattr_off@PLT
.L25:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	highlight_cursor_start, .-highlight_cursor_start
	.type	show_board, @function
show_board:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	werase@PLT
	movq	win_board(%rip), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wborder@PLT
	addq	$32, %rsp
	movq	win_board(%rip), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	alx_ncur_prn_title@PLT
	movq	win_board(%rip), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	alx_ncur_prn_subtitle@PLT
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	board_loop
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	addl	$1, %eax
	leal	(%rax,%rax), %edx
	movq	-16(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %ecx
	movq	win_board(%rip), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	show_board, .-show_board
	.type	board_loop, @function
board_loop:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L28
.L38:
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L29
.L31:
	movl	-8(%rbp), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -16(%rbp)
	movq	-40(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	addq	$998004, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$1, %eax
	jne	.L30
	movq	-40(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	12(%rax,%rdx,4), %eax
	movl	%eax, %edi
	call	set_char
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	show_char
.L30:
	addl	$1, -8(%rbp)
.L29:
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L31
	movl	$0, -8(%rbp)
	jmp	.L32
.L34:
	movl	-8(%rbp), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -16(%rbp)
	movq	-40(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	addq	$998004, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$1, %eax
	je	.L33
	movq	-40(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	12(%rax,%rdx,4), %eax
	movl	%eax, %edi
	call	set_char
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	show_char
.L33:
	addl	$1, -8(%rbp)
.L32:
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L34
	movl	$0, -8(%rbp)
	jmp	.L35
.L37:
	movl	-8(%rbp), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -16(%rbp)
	movq	-40(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	addq	$998004, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$-1, %eax
	jne	.L36
	movq	-40(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	12(%rax,%rdx,4), %eax
	movl	%eax, %edi
	call	set_char
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	show_char
.L36:
	addl	$1, -8(%rbp)
.L35:
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L37
	addl	$1, -4(%rbp)
.L28:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L38
	movq	-48(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L40
	movq	-48(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-48(%rbp), %rax
	movl	12(%rax), %edx
	movq	-40(%rbp), %rax
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	12(%rax,%rdx,4), %eax
	movl	%eax, %edi
	call	set_char
	movl	%eax, -20(%rbp)
	movq	-48(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	highlight_cursor
.L40:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	board_loop, .-board_loop
	.type	highlight_cursor, @function
highlight_cursor:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movq	-32(%rbp), %rax
	movl	12(%rax), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -8(%rbp)
	movl	$17, -12(%rbp)
	movzbl	flag_color(%rip), %eax
	testb	%al, %al
	je	.L42
	movl	-12(%rbp), %eax
	cltq
	salq	$8, %rax
	orq	$2097152, %rax
	movq	%rax, %rcx
	movq	win_board(%rip), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wattr_on@PLT
.L42:
	movl	-8(%rbp), %eax
	leal	-1(%rax), %edx
	movq	win_board(%rip), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L44
	movq	win_board(%rip), %rax
	movl	$60, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L44:
	movq	win_board(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L46
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	win_board(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L46:
	movl	-8(%rbp), %eax
	leal	1(%rax), %edx
	movq	win_board(%rip), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L48
	movq	win_board(%rip), %rax
	movl	$62, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L48:
	movzbl	flag_color(%rip), %eax
	testb	%al, %al
	je	.L50
	movl	-12(%rbp), %eax
	cltq
	salq	$8, %rax
	orq	$2097152, %rax
	movq	%rax, %rcx
	movq	win_board(%rip), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wattr_off@PLT
.L50:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	highlight_cursor, .-highlight_cursor
	.type	set_char, @function
set_char:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	cmpl	$17, -20(%rbp)
	ja	.L52
	movl	-20(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L54(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L54(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L54:
	.long	.L53-.L54
	.long	.L55-.L54
	.long	.L56-.L54
	.long	.L57-.L54
	.long	.L58-.L54
	.long	.L59-.L54
	.long	.L60-.L54
	.long	.L61-.L54
	.long	.L62-.L54
	.long	.L63-.L54
	.long	.L64-.L54
	.long	.L65-.L54
	.long	.L66-.L54
	.long	.L67-.L54
	.long	.L68-.L54
	.long	.L69-.L54
	.long	.L70-.L54
	.long	.L71-.L54
	.text
.L53:
	movl	$35, -4(%rbp)
	jmp	.L52
.L55:
	movl	$43, -4(%rbp)
	jmp	.L52
.L56:
	movl	$42, -4(%rbp)
	jmp	.L52
.L57:
	movl	$45, -4(%rbp)
	jmp	.L52
.L58:
	movl	$118, -4(%rbp)
	jmp	.L52
.L59:
	movl	$32, -4(%rbp)
	jmp	.L52
.L60:
	movl	$49, -4(%rbp)
	jmp	.L52
.L61:
	movl	$50, -4(%rbp)
	jmp	.L52
.L62:
	movl	$51, -4(%rbp)
	jmp	.L52
.L63:
	movl	$52, -4(%rbp)
	jmp	.L52
.L64:
	movl	$53, -4(%rbp)
	jmp	.L52
.L65:
	movl	$54, -4(%rbp)
	jmp	.L52
.L66:
	movl	$55, -4(%rbp)
	jmp	.L52
.L67:
	movl	$56, -4(%rbp)
	jmp	.L52
.L68:
	movl	$33, -4(%rbp)
	jmp	.L52
.L69:
	movl	$70, -4(%rbp)
	jmp	.L52
.L70:
	movl	$63, -4(%rbp)
	jmp	.L52
.L71:
	movl	$102, -4(%rbp)
	nop
.L52:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	set_char, .-set_char
	.type	show_char, @function
show_char:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	-28(%rbp), %eax
	subl	$32, %eax
	cmpl	$86, %eax
	ja	.L74
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L76(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L76(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L76:
	.long	.L75-.L76
	.long	.L77-.L76
	.long	.L74-.L76
	.long	.L78-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L79-.L76
	.long	.L80-.L76
	.long	.L74-.L76
	.long	.L80-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L81-.L76
	.long	.L82-.L76
	.long	.L83-.L76
	.long	.L84-.L76
	.long	.L85-.L76
	.long	.L86-.L76
	.long	.L87-.L76
	.long	.L88-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L89-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L90-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L91-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L74-.L76
	.long	.L79-.L76
	.text
.L81:
	movl	$1, -4(%rbp)
	jmp	.L92
.L82:
	movl	$2, -4(%rbp)
	jmp	.L92
.L83:
	movl	$3, -4(%rbp)
	jmp	.L92
.L84:
	movl	$4, -4(%rbp)
	jmp	.L92
.L85:
	movl	$5, -4(%rbp)
	jmp	.L92
.L86:
	movl	$6, -4(%rbp)
	jmp	.L92
.L87:
	movl	$7, -4(%rbp)
	jmp	.L92
.L88:
	movl	$8, -4(%rbp)
	jmp	.L92
.L75:
	movl	$9, -4(%rbp)
	jmp	.L92
.L79:
	movl	$10, -4(%rbp)
	jmp	.L92
.L80:
	movl	$11, -4(%rbp)
	jmp	.L92
.L91:
	movl	$12, -4(%rbp)
	jmp	.L92
.L89:
	movl	$13, -4(%rbp)
	jmp	.L92
.L90:
	movl	$14, -4(%rbp)
	jmp	.L92
.L77:
	movl	$15, -4(%rbp)
	jmp	.L92
.L78:
	movl	$16, -4(%rbp)
	jmp	.L92
.L74:
	movl	$16, -4(%rbp)
	nop
.L92:
	movzbl	flag_color(%rip), %eax
	testb	%al, %al
	je	.L93
	movl	-4(%rbp), %eax
	cltq
	salq	$8, %rax
	orq	$2097152, %rax
	movq	%rax, %rcx
	movq	win_board(%rip), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wattr_on@PLT
.L93:
	movl	-24(%rbp), %eax
	leal	-1(%rax), %edx
	movq	win_board(%rip), %rax
	movl	-20(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L95
	movq	win_board(%rip), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L95:
	movq	win_board(%rip), %rax
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L97
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	win_board(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L97:
	movl	-24(%rbp), %eax
	leal	1(%rax), %edx
	movq	win_board(%rip), %rax
	movl	-20(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L99
	movq	win_board(%rip), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L99:
	movzbl	flag_color(%rip), %eax
	testb	%al, %al
	je	.L101
	movl	-4(%rbp), %eax
	cltq
	salq	$8, %rax
	orq	$2097152, %rax
	movq	%rax, %rcx
	movq	win_board(%rip), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wattr_off@PLT
.L101:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	show_char, .-show_char
	.type	usr_input, @function
usr_input:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	cmpl	$106, %eax
	je	.L104
	cmpl	$106, %eax
	jg	.L105
	cmpl	$48, %eax
	je	.L106
	cmpl	$48, %eax
	jg	.L107
	cmpl	$13, %eax
	je	.L108
	cmpl	$13, %eax
	jg	.L109
	cmpl	$8, %eax
	je	.L110
	cmpl	$10, %eax
	je	.L108
	jmp	.L103
.L109:
	cmpl	$32, %eax
	je	.L111
	cmpl	$43, %eax
	je	.L108
	jmp	.L103
.L107:
	cmpl	$51, %eax
	je	.L112
	cmpl	$51, %eax
	jg	.L113
	cmpl	$49, %eax
	je	.L114
	cmpl	$50, %eax
	je	.L115
	jmp	.L103
.L113:
	cmpl	$102, %eax
	je	.L116
	cmpl	$104, %eax
	je	.L117
	cmpl	$99, %eax
	je	.L118
	jmp	.L103
.L105:
	cmpl	$120, %eax
	je	.L119
	cmpl	$120, %eax
	jg	.L120
	cmpl	$112, %eax
	je	.L121
	cmpl	$112, %eax
	jg	.L122
	cmpl	$107, %eax
	je	.L123
	cmpl	$108, %eax
	je	.L124
	jmp	.L103
.L122:
	cmpl	$113, %eax
	je	.L125
	cmpl	$115, %eax
	je	.L126
	jmp	.L103
.L120:
	cmpl	$259, %eax
	je	.L123
	cmpl	$259, %eax
	jg	.L127
	cmpl	$257, %eax
	je	.L121
	cmpl	$258, %eax
	je	.L104
	jmp	.L103
.L127:
	cmpl	$261, %eax
	je	.L124
	cmpl	$261, %eax
	jl	.L117
	cmpl	$263, %eax
	je	.L110
	jmp	.L103
.L108:
	movl	$1, -4(%rbp)
	jmp	.L128
.L111:
	movl	$2, -4(%rbp)
	jmp	.L128
.L116:
	movl	$3, -4(%rbp)
	jmp	.L128
.L110:
	movl	$4, -4(%rbp)
	jmp	.L128
.L121:
	movl	$5, -4(%rbp)
	jmp	.L128
.L126:
	movl	$6, -4(%rbp)
	jmp	.L128
.L119:
	movq	win_board(%rip), %rax
	movl	$1000, %esi
	movq	%rax, %rdi
	call	wtimeout@PLT
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movl	%eax, -8(%rbp)
	cmpl	$121, -8(%rbp)
	jne	.L129
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movl	%eax, -8(%rbp)
	cmpl	$122, -8(%rbp)
	jne	.L129
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movl	%eax, -8(%rbp)
	cmpl	$122, -8(%rbp)
	jne	.L129
	movq	win_board(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movl	%eax, -8(%rbp)
	cmpl	$121, -8(%rbp)
	jne	.L129
	movl	$7, -4(%rbp)
.L129:
	movq	win_board(%rip), %rax
	movl	$100, %esi
	movq	%rax, %rdi
	call	wtimeout@PLT
	jmp	.L128
.L106:
	movl	$8, -4(%rbp)
	jmp	.L128
.L114:
	movl	$9, -4(%rbp)
	jmp	.L128
.L115:
	movl	$10, -4(%rbp)
	jmp	.L128
.L112:
	movl	$11, -4(%rbp)
	jmp	.L128
.L125:
	movl	$12, -4(%rbp)
	jmp	.L128
.L117:
	movl	$16, -4(%rbp)
	jmp	.L128
.L104:
	movl	$14, -4(%rbp)
	jmp	.L128
.L123:
	movl	$13, -4(%rbp)
	jmp	.L128
.L124:
	movl	$15, -4(%rbp)
	jmp	.L128
.L118:
	movl	$17, -4(%rbp)
	jmp	.L128
.L103:
	movl	$0, -4(%rbp)
	nop
.L128:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	usr_input, .-usr_input
	.type	show_help, @function
show_help:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	7984028(%rax), %edx
	movl	last_help(%rip), %eax
	cmpl	%eax, %edx
	je	.L141
	movq	win_help(%rip), %rax
	movq	%rax, %rdi
	call	werase@PLT
	movq	-8(%rbp), %rax
	movl	7984028(%rax), %eax
	cmpl	$5, %eax
	ja	.L133
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L135(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L135(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L135:
	.long	.L134-.L135
	.long	.L136-.L135
	.long	.L137-.L135
	.long	.L138-.L135
	.long	.L139-.L135
	.long	.L140-.L135
	.text
.L134:
	call	show_help_play
	jmp	.L133
.L138:
	call	show_help_pause
	jmp	.L133
.L140:
	call	show_help_xyzzy
	jmp	.L133
.L139:
	call	show_help_cheat
	jmp	.L133
.L136:
	call	show_help_safe
	jmp	.L133
.L137:
	call	show_help_gameover
	nop
.L133:
	movq	win_help(%rip), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movq	-8(%rbp), %rax
	movl	7984028(%rax), %eax
	movl	%eax, last_help(%rip)
.L141:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	show_help, .-show_help
	.section	.rodata
.LC2:
	.string	"Move:"
.LC3:
	.string	"Cursor:"
.LC4:
	.string	" %c"
.LC5:
	.string	"Step:"
.LC6:
	.string	" Enter / %c"
.LC7:
	.string	"Quit:"
	.text
	.type	show_help_start, @function
show_help_start:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	win_help(%rip), %rax
	movq	%rax, %rdi
	call	werase@PLT
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-8(%rbp), %edx
	leal	1(%rdx), %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L144
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L144:
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L146
	movq	win_help(%rip), %rax
	movl	$104, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L146:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L148
	movq	win_help(%rip), %rax
	movl	$106, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L148:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L150
	movq	win_help(%rip), %rax
	movl	$107, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L150:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L152
	movq	win_help(%rip), %rax
	movl	$108, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L152:
	addl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L154
	movq	352+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L154:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L156
	movq	368+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L156:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L158
	movq	360+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L158:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L160
	movq	344+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L160:
	addl	$1, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L162
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L162:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$99, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L164
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L164:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$43, %r8d
	leaq	.LC6(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L166
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L166:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$113, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movq	win_help(%rip), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	$7, last_help(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	show_help_start, .-show_help_start
	.section	.rodata
.LC8:
	.string	"Flag:"
.LC9:
	.string	" Space"
.LC10:
	.string	"Possible:"
.LC11:
	.string	"rm flag:"
.LC12:
	.string	" Backspace"
.LC13:
	.string	"Pause:"
.LC14:
	.string	" Break / %c"
.LC15:
	.string	"Save:"
	.text
	.type	show_help_play, @function
show_help_play:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-8(%rbp), %edx
	leal	1(%rdx), %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L169
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L169:
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L171
	movq	win_help(%rip), %rax
	movl	$104, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L171:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L173
	movq	win_help(%rip), %rax
	movl	$106, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L173:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L175
	movq	win_help(%rip), %rax
	movl	$107, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L175:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L177
	movq	win_help(%rip), %rax
	movl	$108, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L177:
	addl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L179
	movq	352+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L179:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L181
	movq	368+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L181:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L183
	movq	360+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L183:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L185
	movq	344+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L185:
	addl	$1, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L187
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L187:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$99, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L189
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L189:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$43, %r8d
	leaq	.LC6(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L191
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L191:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	leaq	.LC9(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L193
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L193:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$102, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L195
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L195:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	leaq	.LC12(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L197
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L197:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$112, %r8d
	leaq	.LC14(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L199
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L199:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$115, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L201
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L201:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$113, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	show_help_play, .-show_help_play
	.section	.rodata
.LC16:
	.string	"Continue:"
	.text
	.type	show_help_pause, @function
show_help_pause:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L204
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L204:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$99, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L206
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L206:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$112, %r8d
	leaq	.LC14(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L208
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L208:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$115, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L210
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L210:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$113, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	show_help_pause, .-show_help_pause
	.section	.rodata
.LC17:
	.string	"XYZZY:"
.LC18:
	.string	"%c"
.LC19:
	.string	"XYZZY off:"
	.text
	.type	show_help_xyzzy, @function
show_help_xyzzy:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-8(%rbp), %edx
	leal	1(%rdx), %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L213
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L213:
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %esi
	movl	$49, %r8d
	leaq	.LC18(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	mvwprintw@PLT
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %esi
	movl	$50, %r8d
	leaq	.LC18(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	mvwprintw@PLT
	addl	$1, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L215
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L215:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$48, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-8(%rbp), %edx
	leal	1(%rdx), %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L217
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L217:
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L219
	movq	win_help(%rip), %rax
	movl	$104, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L219:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L221
	movq	win_help(%rip), %rax
	movl	$106, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L221:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L223
	movq	win_help(%rip), %rax
	movl	$107, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L223:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L225
	movq	win_help(%rip), %rax
	movl	$108, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L225:
	addl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L227
	movq	352+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L227:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L229
	movq	368+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L229:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L231
	movq	360+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L231:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L233
	movq	344+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L233:
	addl	$1, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L235
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L235:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$99, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L237
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L237:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$43, %r8d
	leaq	.LC6(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L239
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L239:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	leaq	.LC9(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L241
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L241:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$102, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L243
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L243:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	leaq	.LC12(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L245
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L245:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$115, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L247
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L247:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$113, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	show_help_xyzzy, .-show_help_xyzzy
	.type	show_help_cheat, @function
show_help_cheat:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-8(%rbp), %edx
	leal	1(%rdx), %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L250
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L250:
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L252
	movq	win_help(%rip), %rax
	movl	$104, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L252:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L254
	movq	win_help(%rip), %rax
	movl	$106, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L254:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L256
	movq	win_help(%rip), %rax
	movl	$107, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L256:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L258
	movq	win_help(%rip), %rax
	movl	$108, %esi
	movq	%rax, %rdi
	call	waddch@PLT
.L258:
	addl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L260
	movq	352+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L260:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L262
	movq	368+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L262:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L264
	movq	360+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L264:
	addl	$2, -8(%rbp)
	movq	win_help(%rip), %rax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L266
	movq	344+acs_map(%rip), %rdx
	movq	win_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L266:
	addl	$1, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L268
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L268:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$99, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L270
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L270:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$43, %r8d
	leaq	.LC6(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L272
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L272:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	leaq	.LC9(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L274
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L274:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$102, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L276
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L276:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	leaq	.LC12(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L278
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L278:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$115, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L280
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L280:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$113, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	show_help_cheat, .-show_help_cheat
	.type	show_help_safe, @function
show_help_safe:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L283
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L283:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$115, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L285
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L285:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$113, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	show_help_safe, .-show_help_safe
	.type	show_help_gameover, @function
show_help_gameover:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rcx
	movl	-8(%rbp), %edx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L288
	movq	win_help(%rip), %rax
	movl	$-1, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L288:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movq	win_help(%rip), %rdi
	movl	-8(%rbp), %edx
	movl	$113, %r8d
	leaq	.LC4(%rip), %rcx
	movl	%eax, %esi
	movl	$0, %eax
	call	mvwprintw@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	show_help_gameover, .-show_help_gameover
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
