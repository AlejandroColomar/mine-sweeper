	.file	"player_gui.c"
	.local	box
	.comm	box,8,8
	.local	box_help
	.comm	box_help,8,8
	.local	box_help_in
	.comm	box_help_in,8,8
	.local	button
	.comm	button,520,32
	.local	tbutton
	.comm	tbutton,184,32
	.local	entry_name
	.comm	entry_name,112,32
	.local	entry_fname
	.comm	entry_fname,112,32
	.local	box_board
	.comm	box_board,8,8
	.local	box_board_in
	.comm	box_board_in,8,8
	.local	pbar_board_tit
	.comm	pbar_board_tit,96,32
	.local	box_board_tab
	.comm	box_board_tab,8,8
	.local	table_board
	.comm	table_board,8,8
	.local	field
	.comm	field,34848,32
	.local	ebox_cheat
	.comm	ebox_cheat,24,16
	.local	label_stit
	.comm	label_stit,88,32
	.local	last_help
	.comm	last_help,4,4
	.local	timeout
	.comm	timeout,16,16
	.local	state
	.comm	state,4,4
	.section	.rodata
.LC0:
	.string	"NEW"
.LC1:
	.string	"button-press-event"
	.text
	.globl	player_gui_init
	.type	player_gui_init, @function
player_gui_init:
.LFB206:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_hbox_new@PLT
	movq	%rax, box(%rip)
	movq	box(%rip), %rbx
	call	gtk_container_get_type@PLT
	movq	%rax, %rdx
	movq	window_gui(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_container_add@PLT
	movl	$0, %esi
	movl	$1, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box_help(%rip)
	call	gtk_vseparator_new@PLT
	movq	%rax, -64(%rbp)
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box_board(%rip)
	movq	box_help(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$5, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rax, %rdi
	movq	-64(%rbp), %rax
	movl	$5, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	gtk_box_pack_start@PLT
	movq	box_board(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$5, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	help_init
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	board_init
	movl	$0, -52(%rbp)
	jmp	.L2
.L5:
	movl	$0, -56(%rbp)
	jmp	.L3
.L4:
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	12+field(%rip), %rax
	addq	%rax, %rdx
	movl	-52(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	16+field(%rip), %rax
	addq	%rax, %rdx
	movl	-56(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-72(%rbp), %rax
	leaq	8(%rax), %rcx
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rsi
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rsi, %rdx
	addq	%rax, %rdx
	leaq	24+field(%rip), %rax
	addq	%rdx, %rax
	movq	%rcx, (%rax)
	movq	-72(%rbp), %rax
	leaq	12(%rax), %rcx
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rsi
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rsi, %rdx
	addq	%rax, %rdx
	leaq	32+field(%rip), %rax
	addq	%rdx, %rax
	movq	%rcx, (%rax)
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	40+field(%rip), %rax
	addq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	%rax, (%rdx)
	leaq	.LC0(%rip), %rdi
	call	gtk_button_new_with_label@PLT
	movq	%rax, %rsi
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	field(%rip), %rax
	addq	%rdx, %rax
	movq	%rsi, (%rax)
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1584, %rdx, %rdx
	addq	%rax, %rdx
	leaq	field(%rip), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rsi
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rsi, %rdx
	addq	%rax, %rdx
	leaq	field(%rip), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	callback_field(%rip), %rdx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	12+field(%rip), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, %r15d
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	12+field(%rip), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %r14d
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	16+field(%rip), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, %r13d
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	16+field(%rip), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %r12d
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	field(%rip), %rax
	addq	%rdx, %rax
	movq	(%rax), %rbx
	call	gtk_table_get_type@PLT
	movq	%rax, %rdx
	movq	table_board(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	%r15d, %r9d
	movl	%r14d, %r8d
	movl	%r13d, %ecx
	movl	%r12d, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_table_attach_defaults@PLT
	addl	$1, -56(%rbp)
.L3:
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-56(%rbp), %eax
	jg	.L4
	addl	$1, -52(%rbp)
.L2:
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-52(%rbp), %eax
	jg	.L5
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE206:
	.size	player_gui_init, .-player_gui_init
	.globl	player_gui_start
	.type	player_gui_start, @function
player_gui_start:
.LFB207:
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
	call	show_help_start
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	show_board_start
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	call	gtk_main@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE207:
	.size	player_gui_start, .-player_gui_start
	.globl	player_gui
	.type	player_gui, @function
player_gui:
.LFB208:
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
	movq	-8(%rbp), %rax
	movl	7984028(%rax), %eax
	movl	%eax, state(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	show_help
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	show_board
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	call	gtk_main@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE208:
	.size	player_gui, .-player_gui
	.globl	player_gui_save_name
	.type	player_gui_save_name, @function
player_gui_save_name:
.LFB209:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, 96+entry_fname(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, 104+entry_fname(%rip)
	movq	button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	104+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	208+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	tbutton(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	312+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	416+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	box_board(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	call	gtk_main@PLT
	movq	box_board(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	8+entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movl	$7, last_help(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE209:
	.size	player_gui_save_name, .-player_gui_save_name
	.globl	player_gui_score_name
	.type	player_gui_score_name, @function
player_gui_score_name:
.LFB210:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, 96+entry_name(%rip)
	movl	-12(%rbp), %eax
	movl	%eax, 104+entry_name(%rip)
	movq	button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	104+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	208+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	tbutton(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	312+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	416+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	box_board(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	call	gtk_main@PLT
	movq	box_board(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	8+entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movl	$7, last_help(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE210:
	.size	player_gui_score_name, .-player_gui_score_name
	.globl	player_gui_cleanup
	.type	player_gui_cleanup, @function
player_gui_cleanup:
.LFB211:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE211:
	.size	player_gui_cleanup, .-player_gui_cleanup
	.type	board_init, @function
board_init:
.LFB212:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box_board_in(%rip)
	movq	box_board_in(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_board(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$5, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	call	gtk_progress_bar_new@PLT
	movq	%rax, pbar_board_tit(%rip)
	movq	pbar_board_tit(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_board_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	call	gtk_progress_bar_get_type@PLT
	movq	%rax, %rdx
	movq	pbar_board_tit(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	gtk_progress_bar_set_text@PLT
	call	gtk_progress_bar_get_type@PLT
	movq	%rax, %rdx
	movq	pbar_board_tit(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %esi
	movq	%rax, %rdi
	call	gtk_progress_bar_set_orientation@PLT
	call	gtk_hseparator_new@PLT
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_board_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$5, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movl	$0, %esi
	movl	$1, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box_board_tab(%rip)
	movq	box_board_tab(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_board_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %ecx
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	$1, %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	gtk_table_new@PLT
	movq	%rax, table_board(%rip)
	movq	table_board(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_board_tab(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$5, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	call	gtk_hseparator_new@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_board_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$5, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	call	gtk_event_box_new@PLT
	movq	%rax, ebox_cheat(%rip)
	movq	ebox_cheat(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_board_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	leaq	.LC0(%rip), %rdi
	call	gtk_label_new@PLT
	movq	%rax, label_stit(%rip)
	movq	label_stit(%rip), %rbx
	call	gtk_container_get_type@PLT
	movq	%rax, %rdx
	movq	ebox_cheat(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_container_add@PLT
	movl	$7, 8+ebox_cheat(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, 16+ebox_cheat(%rip)
	movq	ebox_cheat(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	ebox_cheat(%rip), %rcx
	leaq	callback_ebox(%rip), %rdx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movl	$0, 4+timeout(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, 8+timeout(%rip)
	movl	$0, timeout(%rip)
	movq	box_board(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE212:
	.size	board_init, .-board_init
	.type	show_board_start, @function
show_board_start:
.LFB213:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$80, %esi
	leaq	16+pbar_board_tit(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	call	gtk_progress_bar_get_type@PLT
	movq	%rax, %rdx
	movq	pbar_board_tit(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	leaq	16+pbar_board_tit(%rip), %rsi
	movq	%rax, %rdi
	call	gtk_progress_bar_set_text@PLT
	pxor	%xmm0, %xmm0
	movsd	%xmm0, 8+pbar_board_tit(%rip)
	movq	8+pbar_board_tit(%rip), %rbx
	call	gtk_progress_bar_get_type@PLT
	movq	%rax, %rdx
	movq	pbar_board_tit(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rbx, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	%rax, %rdi
	call	gtk_progress_bar_set_fraction@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	board_loop_start
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$80, %esi
	leaq	8+label_stit(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	call	gtk_label_get_type@PLT
	movq	%rax, %rdx
	movq	label_stit(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	leaq	8+label_stit(%rip), %rsi
	movq	%rax, %rdi
	call	gtk_label_set_text@PLT
	movq	box_board(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE213:
	.size	show_board_start, .-show_board_start
	.type	board_loop_start, @function
board_loop_start:
.LFB214:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movb	$43, -9(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L16
.L19:
	movl	$0, -8(%rbp)
	jmp	.L17
.L18:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	8+field(%rip), %rax
	addq	%rax, %rdx
	movzbl	-9(%rbp), %eax
	movb	%al, (%rdx)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1584, %rdx, %rdx
	addq	%rax, %rdx
	leaq	field(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	show_char
	addl	$1, -8(%rbp)
.L17:
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L18
	addl	$1, -4(%rbp)
.L16:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L19
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE214:
	.size	board_loop_start, .-board_loop_start
	.type	show_board, @function
show_board:
.LFB215:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$80, %esi
	leaq	16+pbar_board_tit(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	call	gtk_progress_bar_get_type@PLT
	movq	%rax, %rdx
	movq	pbar_board_tit(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	leaq	16+pbar_board_tit(%rip), %rsi
	movq	%rax, %rdi
	call	gtk_progress_bar_set_text@PLT
	movq	-24(%rbp), %rax
	movl	7984020(%rax), %eax
	movq	-24(%rbp), %rdx
	movl	8(%rdx), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	je	.L21
	movq	-24(%rbp), %rax
	movl	7984020(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 8+pbar_board_tit(%rip)
	movq	8+pbar_board_tit(%rip), %rax
	movsd	.LC3(%rip), %xmm1
	movq	%rax, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	call	fmod@PLT
	movq	%xmm0, %rax
	movq	%rax, 8+pbar_board_tit(%rip)
	jmp	.L22
.L21:
	movq	-24(%rbp), %rax
	movl	7984020(%rax), %eax
	testl	%eax, %eax
	je	.L23
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, 8+pbar_board_tit(%rip)
	jmp	.L22
.L23:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, 8+pbar_board_tit(%rip)
.L22:
	movq	8+pbar_board_tit(%rip), %rbx
	call	gtk_progress_bar_get_type@PLT
	movq	%rax, %rdx
	movq	pbar_board_tit(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rbx, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	%rax, %rdi
	call	gtk_progress_bar_set_fraction@PLT
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	board_loop
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movl	$80, %esi
	leaq	8+label_stit(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	call	gtk_label_get_type@PLT
	movq	%rax, %rdx
	movq	label_stit(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	leaq	8+label_stit(%rip), %rsi
	movq	%rax, %rdi
	call	gtk_label_set_text@PLT
	movq	-24(%rbp), %rax
	movl	7984028(%rax), %eax
	testl	%eax, %eax
	jne	.L24
	leaq	timeout(%rip), %rdx
	leaq	callback_timeout(%rip), %rsi
	movl	$1, %edi
	call	g_timeout_add_seconds@PLT
	movl	%eax, timeout(%rip)
.L24:
	movq	box_board(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE215:
	.size	show_board, .-show_board
	.type	board_loop, @function
board_loop:
.LFB216:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L26
.L29:
	movl	$0, -8(%rbp)
	jmp	.L27
.L28:
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	12(%rax,%rdx,4), %eax
	movl	%eax, %edi
	call	set_char
	movl	%eax, %esi
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	imulq	$1584, %rcx, %rdx
	addq	%rax, %rdx
	leaq	8+field(%rip), %rax
	addq	%rdx, %rax
	movb	%sil, (%rax)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1584, %rdx, %rdx
	addq	%rax, %rdx
	leaq	field(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	show_char
	addl	$1, -8(%rbp)
.L27:
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L28
	addl	$1, -4(%rbp)
.L26:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L29
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE216:
	.size	board_loop, .-board_loop
	.type	set_char, @function
set_char:
.LFB217:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	cmpl	$17, -20(%rbp)
	ja	.L31
	movl	-20(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L33(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L33(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L33:
	.long	.L32-.L33
	.long	.L34-.L33
	.long	.L35-.L33
	.long	.L36-.L33
	.long	.L37-.L33
	.long	.L38-.L33
	.long	.L39-.L33
	.long	.L40-.L33
	.long	.L41-.L33
	.long	.L42-.L33
	.long	.L43-.L33
	.long	.L44-.L33
	.long	.L45-.L33
	.long	.L46-.L33
	.long	.L47-.L33
	.long	.L48-.L33
	.long	.L49-.L33
	.long	.L50-.L33
	.text
.L32:
	movb	$35, -1(%rbp)
	jmp	.L31
.L34:
	movb	$43, -1(%rbp)
	jmp	.L31
.L35:
	movb	$42, -1(%rbp)
	jmp	.L31
.L36:
	movb	$45, -1(%rbp)
	jmp	.L31
.L37:
	movb	$118, -1(%rbp)
	jmp	.L31
.L38:
	movb	$32, -1(%rbp)
	jmp	.L31
.L39:
	movb	$49, -1(%rbp)
	jmp	.L31
.L40:
	movb	$50, -1(%rbp)
	jmp	.L31
.L41:
	movb	$51, -1(%rbp)
	jmp	.L31
.L42:
	movb	$52, -1(%rbp)
	jmp	.L31
.L43:
	movb	$53, -1(%rbp)
	jmp	.L31
.L44:
	movb	$54, -1(%rbp)
	jmp	.L31
.L45:
	movb	$55, -1(%rbp)
	jmp	.L31
.L46:
	movb	$56, -1(%rbp)
	jmp	.L31
.L47:
	movb	$33, -1(%rbp)
	jmp	.L31
.L48:
	movb	$70, -1(%rbp)
	jmp	.L31
.L49:
	movb	$63, -1(%rbp)
	jmp	.L31
.L50:
	movb	$102, -1(%rbp)
	nop
.L31:
	movzbl	-1(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE217:
	.size	set_char, .-set_char
	.section	.rodata
.LC4:
	.string	"%c"
	.text
	.type	show_char, @function
show_char:
.LFB218:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	8(%rax), %eax
	movsbl	%al, %edx
	leaq	-2(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	call	gtk_button_get_type@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rax, %rdx
	leaq	-2(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	gtk_button_set_label@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE218:
	.size	show_char, .-show_char
	.section	.rodata
.LC5:
	.string	"clicked"
.LC6:
	.string	"toggled"
.LC7:
	.string	"activate"
	.text
	.type	help_init, @function
help_init:
.LFB219:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box_help_in(%rip)
	movq	box_help_in(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$5, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movabsq	$7307164201690095451, %rax
	movq	%rax, 8+button(%rip)
	movabsq	$28823075096327265, %rax
	movq	%rax, 16+button(%rip)
	movabsq	$3557597914868312131, %rax
	movq	%rax, 112+button(%rip)
	movb	$0, 120+button(%rip)
	movabsq	$3629655508906240067, %rax
	movq	%rax, 216+button(%rip)
	movb	$0, 224+button(%rip)
	movl	$1969311839, 8+tbutton(%rip)
	movw	$25971, 12+tbutton(%rip)
	movb	$0, 14+tbutton(%rip)
	movabsq	$7957652872870518619, %rax
	movq	%rax, 88+tbutton(%rip)
	movl	$1970170228, 96+tbutton(%rip)
	movw	$101, 100+tbutton(%rip)
	movl	$1986089823, 320+button(%rip)
	movw	$101, 324+button(%rip)
	movabsq	$7881701908294691142, %rax
	movq	%rax, 16+entry_fname(%rip)
	movw	$14949, 24+entry_fname(%rip)
	movb	$0, 26+entry_fname(%rip)
	movabsq	$7881701908513386329, %rax
	movq	%rax, 16+entry_name(%rip)
	movw	$14949, 24+entry_name(%rip)
	movb	$0, 26+entry_name(%rip)
	movl	$1769296223, 424+button(%rip)
	movw	$116, 428+button(%rip)
	movl	$8, 88+button(%rip)
	movl	$9, 192+button(%rip)
	movl	$10, 296+button(%rip)
	movl	$5, 168+tbutton(%rip)
	movl	$6, 400+button(%rip)
	movl	$12, 504+button(%rip)
	movl	$5, 172+tbutton(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, 96+button(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, 200+button(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, 304+button(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, 176+tbutton(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, 408+button(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, 512+button(%rip)
	leaq	8+button(%rip), %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, button(%rip)
	leaq	112+button(%rip), %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, 104+button(%rip)
	leaq	216+button(%rip), %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, 208+button(%rip)
	leaq	8+tbutton(%rip), %rdi
	call	gtk_toggle_button_new_with_mnemonic@PLT
	movq	%rax, tbutton(%rip)
	leaq	320+button(%rip), %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, 312+button(%rip)
	leaq	16+entry_fname(%rip), %rdi
	call	gtk_label_new@PLT
	movq	%rax, 8+entry_fname(%rip)
	call	gtk_entry_new@PLT
	movq	%rax, entry_fname(%rip)
	leaq	16+entry_name(%rip), %rdi
	call	gtk_label_new@PLT
	movq	%rax, 8+entry_name(%rip)
	call	gtk_entry_new@PLT
	movq	%rax, entry_name(%rip)
	leaq	424+button(%rip), %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, 416+button(%rip)
	call	gtk_toggle_button_get_type@PLT
	movq	%rax, %rdx
	movq	tbutton(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %esi
	movq	%rax, %rdi
	call	gtk_toggle_button_set_active@PLT
	movq	button(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	button(%rip), %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	104+button(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	104+button(%rip), %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	208+button(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	208+button(%rip), %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	tbutton(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	tbutton(%rip), %rcx
	leaq	callback_tbutton(%rip), %rdx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	312+button(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	312+button(%rip), %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	entry_fname(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	entry_fname(%rip), %rcx
	leaq	callback_entry_fname(%rip), %rdx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	entry_name(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	entry_name(%rip), %rcx
	leaq	callback_entry_str(%rip), %rdx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	416+button(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	416+button(%rip), %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	button(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	104+button(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	208+button(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	tbutton(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	312+button(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	8+entry_fname(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	entry_fname(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	8+entry_name(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	entry_name(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	416+button(%rip), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box_help_in(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE219:
	.size	help_init, .-help_init
	.type	show_help, @function
show_help:
.LFB220:
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
	je	.L64
	movq	-8(%rbp), %rax
	movl	7984028(%rax), %eax
	cmpl	$5, %eax
	ja	.L56
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L58(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L58(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L58:
	.long	.L57-.L58
	.long	.L59-.L58
	.long	.L60-.L58
	.long	.L61-.L58
	.long	.L62-.L58
	.long	.L63-.L58
	.text
.L57:
	call	show_help_play
	jmp	.L56
.L61:
	call	show_help_pause
	jmp	.L56
.L63:
	call	show_help_xyzzy
	jmp	.L56
.L62:
	call	show_help_cheat
	jmp	.L56
.L59:
	call	show_help_safe
	jmp	.L56
.L60:
	call	show_help_gameover
	nop
.L56:
	movq	-8(%rbp), %rax
	movl	7984028(%rax), %eax
	movl	%eax, last_help(%rip)
	movq	box_help_in(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	box_help(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
.L64:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE220:
	.size	show_help, .-show_help
	.type	show_help_start, @function
show_help_start:
.LFB221:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	104+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	208+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	tbutton(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	312+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	416+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movl	$7, last_help(%rip)
	movq	box_help_in(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	box_help(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE221:
	.size	show_help_start, .-show_help_start
	.type	show_help_play, @function
show_help_play:
.LFB222:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	104+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	208+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	tbutton(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	312+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	8+entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	416+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE222:
	.size	show_help_play, .-show_help_play
	.type	show_help_pause, @function
show_help_pause:
.LFB223:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	104+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	208+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	tbutton(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	312+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	8+entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	416+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE223:
	.size	show_help_pause, .-show_help_pause
	.type	show_help_xyzzy, @function
show_help_xyzzy:
.LFB224:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	104+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	208+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	tbutton(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	312+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	8+entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	416+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE224:
	.size	show_help_xyzzy, .-show_help_xyzzy
	.type	show_help_cheat, @function
show_help_cheat:
.LFB225:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	104+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	208+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	tbutton(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	312+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	8+entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	416+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE225:
	.size	show_help_cheat, .-show_help_cheat
	.type	show_help_safe, @function
show_help_safe:
.LFB226:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	104+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	208+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	tbutton(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	312+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	movq	8+entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	416+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE226:
	.size	show_help_safe, .-show_help_safe
	.type	show_help_gameover, @function
show_help_gameover:
.LFB227:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	104+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	208+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	tbutton(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	312+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_fname(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	8+entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	entry_name(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_hide@PLT
	movq	416+button(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE227:
	.size	show_help_gameover, .-show_help_gameover
	.type	callback_field, @function
callback_field:
.LFB228:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	state(%rip), %eax
	testl	%eax, %eax
	jne	.L73
	movl	timeout(%rip), %eax
	testl	%eax, %eax
	je	.L73
	movl	timeout(%rip), %eax
	movl	%eax, %edi
	call	g_source_remove@PLT
.L73:
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	12(%rdx), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	16(%rdx), %edx
	movl	%edx, (%rax)
	movq	-32(%rbp), %rax
	movl	52(%rax), %eax
	cmpl	$1, %eax
	je	.L75
	cmpl	$3, %eax
	je	.L76
	jmp	.L74
.L75:
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L80
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movl	$1, (%rax)
	jmp	.L80
.L76:
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L81
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movl	$2, (%rax)
	jmp	.L81
.L80:
	nop
	jmp	.L74
.L81:
	nop
.L74:
	call	gtk_main_quit@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE228:
	.size	callback_field, .-callback_field
	.type	callback_ebox, @function
callback_ebox:
.LFB229:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	state(%rip), %eax
	testl	%eax, %eax
	jne	.L83
	movl	timeout(%rip), %eax
	testl	%eax, %eax
	je	.L83
	movl	timeout(%rip), %eax
	movl	%eax, %edi
	call	g_source_remove@PLT
.L83:
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movl	52(%rax), %eax
	cmpl	$1, %eax
	je	.L85
	cmpl	$3, %eax
	jmp	.L84
.L85:
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L89
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	8(%rdx), %edx
	movl	%edx, (%rax)
.L89:
	nop
.L84:
	call	gtk_main_quit@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE229:
	.size	callback_ebox, .-callback_ebox
	.type	callback_button, @function
callback_button:
.LFB230:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	state(%rip), %eax
	testl	%eax, %eax
	jne	.L91
	movl	timeout(%rip), %eax
	testl	%eax, %eax
	je	.L91
	movl	timeout(%rip), %eax
	movl	%eax, %edi
	call	g_source_remove@PLT
.L91:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	96(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	88(%rdx), %edx
	movl	%edx, (%rax)
	call	gtk_main_quit@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE230:
	.size	callback_button, .-callback_button
	.type	callback_tbutton, @function
callback_tbutton:
.LFB231:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	state(%rip), %eax
	testl	%eax, %eax
	jne	.L93
	movl	timeout(%rip), %eax
	testl	%eax, %eax
	je	.L93
	movl	timeout(%rip), %eax
	movl	%eax, %edi
	call	g_source_remove@PLT
.L93:
	movq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
	call	gtk_toggle_button_get_type@PLT
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rax, %rdi
	call	gtk_toggle_button_get_active@PLT
	testl	%eax, %eax
	je	.L94
	movq	-24(%rbp), %rax
	movq	176(%rax), %rax
	movq	-24(%rbp), %rdx
	movl	168(%rdx), %edx
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	leaq	88(%rax), %rbx
	call	gtk_button_get_type@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_button_set_label@PLT
	jmp	.L95
.L94:
	movq	-24(%rbp), %rax
	movq	176(%rax), %rax
	movq	-24(%rbp), %rdx
	movl	172(%rdx), %edx
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rbx
	call	gtk_button_get_type@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_button_set_label@PLT
.L95:
	call	gtk_main_quit@PLT
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE231:
	.size	callback_tbutton, .-callback_tbutton
	.section	.rodata
.LC8:
	.string	"Error %i"
	.text
	.type	callback_entry_fname, @function
callback_entry_fname:
.LFB232:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, -24(%rbp)
	call	gtk_entry_get_type@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rax, %rdi
	call	gtk_entry_get_text@PLT
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	104(%rax), %rsi
	movq	-24(%rbp), %rax
	movq	96(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	alx_sscan_fname@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.L97
	movl	-36(%rbp), %edx
	leaq	-128(%rbp), %rax
	movl	%edx, %ecx
	leaq	.LC8(%rip), %rdx
	movl	$80, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	call	gtk_entry_get_type@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rax, %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	gtk_entry_set_text@PLT
	call	gtk_entry_get_type@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movzwl	106(%rax), %eax
	movzwl	%ax, %ebx
	call	gtk_editable_get_type@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	%ebx, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	gtk_editable_select_region@PLT
.L97:
	call	gtk_main_quit@PLT
	nop
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE232:
	.size	callback_entry_fname, .-callback_entry_fname
	.section	.rodata
.LC9:
	.string	"%s"
	.text
	.type	callback_entry_str, @function
callback_entry_str:
.LFB233:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -8(%rbp)
	call	gtk_entry_get_type@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rax, %rdi
	call	gtk_entry_get_text@PLT
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	104(%rax), %eax
	movslq	%eax, %rsi
	movq	-8(%rbp), %rax
	movq	96(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	call	gtk_main_quit@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE233:
	.size	callback_entry_str, .-callback_entry_str
	.type	callback_timeout, @function
callback_timeout:
.LFB234:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	4(%rdx), %edx
	movl	%edx, (%rax)
	call	gtk_main_quit@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE234:
	.size	callback_timeout, .-callback_timeout
	.section	.rodata
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
