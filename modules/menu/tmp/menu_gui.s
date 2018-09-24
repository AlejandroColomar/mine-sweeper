	.file	"menu_gui.c"
	.comm	window_gui,8,8
	.local	box
	.comm	box,8,8
	.section	.rodata
.LC0:
	.string	"delete-event"
.LC1:
	.string	"destroy"
.LC2:
	.string	"4~b1"
.LC3:
	.string	"mine-sweeper %s"
	.text
	.globl	menu_gui_init
	.type	menu_gui_init, @function
menu_gui_init:
.LFB206:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	$0, %edi
	call	gtk_window_new@PLT
	movq	%rax, window_gui(%rip)
	movq	window_gui(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	delete_window(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	window_gui(%rip), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	destroy_window(%rip), %rdx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	leaq	-80(%rbp), %rax
	leaq	.LC2(%rip), %rcx
	leaq	.LC3(%rip), %rdx
	movl	$80, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	call	gtk_window_get_type@PLT
	movq	%rax, %rdx
	movq	window_gui(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movq	%rax, %rdx
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	gtk_window_set_title@PLT
	call	gtk_container_get_type@PLT
	movq	%rax, %rdx
	movq	window_gui(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$20, %esi
	movq	%rax, %rdi
	call	gtk_container_set_border_width@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE206:
	.size	menu_gui_init, .-menu_gui_init
	.globl	menu_gui_cleanup
	.type	menu_gui_cleanup, @function
menu_gui_cleanup:
.LFB207:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE207:
	.size	menu_gui_cleanup, .-menu_gui_cleanup
	.section	.rodata
.LC4:
	.string	"clicked"
	.text
	.globl	menu_gui
	.type	menu_gui, @function
menu_gui:
.LFB208:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$552, %rsp
	.cfi_offset 3, -24
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movabsq	$7954884302878630221, %rcx
	movq	%rcx, (%rax)
	movw	$117, 8(%rax)
	leaq	-560(%rbp), %rax
	addq	$112, %rax
	movabsq	$7957652872868487003, %rcx
	movq	%rcx, (%rax)
	movl	$1970170228, 8(%rax)
	movw	$101, 12(%rax)
	leaq	-560(%rbp), %rax
	addq	$216, %rax
	movabsq	$8316253092709556059, %rcx
	movq	%rcx, (%rax)
	movabsq	$2338042677152541795, %rcx
	movq	%rcx, 8(%rax)
	movabsq	$7021800531960030831, %rbx
	movq	%rbx, 16(%rax)
	movl	$7959662, 24(%rax)
	leaq	-560(%rbp), %rax
	addq	$320, %rax
	movabsq	$8243087190950895451, %rcx
	movq	%rcx, (%rax)
	movabsq	$7142819434248303469, %rbx
	movq	%rbx, 8(%rax)
	movabsq	$7957695015292268143, %rcx
	movq	%rcx, 16(%rax)
	movw	$115, 24(%rax)
	leaq	-560(%rbp), %rax
	addq	$8, %rax
	movabsq	$7599900376492433243, %rbx
	movq	%rbx, (%rax)
	movabsq	$7021788497383006324, %rsi
	movq	%rsi, 8(%rax)
	movw	$109, 16(%rax)
	movl	$1, -368(%rbp)
	movl	$2, -264(%rbp)
	movl	$3, -160(%rbp)
	movl	$0, -472(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -360(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -256(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -152(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -464(%rbp)
	movb	$1, -17(%rbp)
	jmp	.L4
.L10:
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box(%rip)
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -144(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -48(%rbp)
	leaq	-560(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -456(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -40(%rbp)
	leaq	-560(%rbp), %rax
	addq	$216, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -352(%rbp)
	leaq	-560(%rbp), %rax
	addq	$320, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -248(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -32(%rbp)
	leaq	-560(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -560(%rbp)
	movq	-456(%rbp), %rax
	leaq	-560(%rbp), %rdx
	addq	$104, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-352(%rbp), %rax
	leaq	-560(%rbp), %rdx
	addq	$208, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-248(%rbp), %rax
	leaq	-560(%rbp), %rdx
	addq	$312, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-560(%rbp), %rax
	leaq	-560(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
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
	movq	-144(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-48(%rbp), %rbx
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
	movq	-456(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rbx
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
	movq	-352(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-248(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-32(%rbp), %rbx
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
	movq	-560(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	movl	$-1, -24(%rbp)
	call	gtk_main@PLT
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
	movl	-24(%rbp), %eax
	cmpl	$1, %eax
	je	.L5
	cmpl	$1, %eax
	jg	.L6
	testl	%eax, %eax
	je	.L7
	jmp	.L4
.L6:
	cmpl	$2, %eax
	je	.L8
	cmpl	$3, %eax
	je	.L9
	jmp	.L4
.L7:
	movb	$0, -17(%rbp)
	jmp	.L4
.L5:
	call	menu_gui_continue
	jmp	.L4
.L8:
	call	menu_gui_disclaim
	jmp	.L4
.L9:
	call	menu_gui_license
	nop
.L4:
	cmpb	$0, -17(%rbp)
	jne	.L10
	nop
	addq	$552, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE208:
	.size	menu_gui, .-menu_gui
	.type	delete_window, @function
delete_window:
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
	movq	%rdx, -24(%rbp)
	call	gtk_main_quit@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE209:
	.size	delete_window, .-delete_window
	.type	destroy_window, @function
destroy_window:
.LFB210:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE210:
	.size	destroy_window, .-destroy_window
	.type	callback_button, @function
callback_button:
.LFB211:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
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
.LFE211:
	.size	callback_button, .-callback_button
	.section	.rodata
.LC5:
	.string	"Error %i"
	.text
	.type	callback_entry_dbl, @function
callback_entry_dbl:
.LFB212:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$152, %rsp
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
	movsd	120(%rax), %xmm1
	movq	-24(%rbp), %rax
	movsd	112(%rax), %xmm0
	movq	-24(%rbp), %rax
	movq	104(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	96(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, -152(%rbp)
	movsd	-152(%rbp), %xmm0
	movq	%rax, %rdi
	call	alx_sscan_dbl@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.L16
	movl	-36(%rbp), %edx
	leaq	-128(%rbp), %rax
	movl	%edx, %ecx
	leaq	.LC5(%rip), %rdx
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
.L16:
	call	gtk_main_quit@PLT
	nop
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE212:
	.size	callback_entry_dbl, .-callback_entry_dbl
	.type	callback_entry_int, @function
callback_entry_int:
.LFB213:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$152, %rsp
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
	movsd	120(%rax), %xmm0
	movq	-24(%rbp), %rax
	movq	112(%rax), %rsi
	movq	-24(%rbp), %rax
	movq	104(%rax), %rcx
	movq	-32(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rcx, -152(%rbp)
	movsd	-152(%rbp), %xmm0
	movq	%rax, %rdi
	call	alx_sscan_int@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.L18
	movl	-36(%rbp), %edx
	leaq	-128(%rbp), %rax
	movl	%edx, %ecx
	leaq	.LC5(%rip), %rdx
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
	jmp	.L19
.L18:
	movq	-24(%rbp), %rax
	movq	96(%rax), %rax
	movq	-48(%rbp), %rdx
	movl	%edx, (%rax)
.L19:
	call	gtk_main_quit@PLT
	nop
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE213:
	.size	callback_entry_int, .-callback_entry_int
	.type	callback_entry_fname, @function
callback_entry_fname:
.LFB214:
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
	movl	$1, %edx
	movq	%rax, %rdi
	call	alx_sscan_fname@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.L21
	movl	-36(%rbp), %edx
	leaq	-128(%rbp), %rax
	movl	%edx, %ecx
	leaq	.LC5(%rip), %rdx
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
.L21:
	call	gtk_main_quit@PLT
	nop
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE214:
	.size	callback_entry_fname, .-callback_entry_fname
	.type	menu_gui_disclaim, @function
menu_gui_disclaim:
.LFB215:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1048824, %rsp
	.cfi_offset 3, -24
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movabsq	$7883939740841634116, %rcx
	movq	%rcx, (%rax)
	movabsq	$7023117768230728293, %rcx
	movq	%rcx, 8(%rax)
	movl	$1851880050, 16(%rax)
	movw	$31092, 20(%rax)
	movb	$0, 22(%rax)
	leaq	-1048832(%rbp), %rax
	movl	$1, %edx
	movl	$1048576, %esi
	movq	%rax, %rdi
	call	snprint_share_file@PLT
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movabsq	$7161077589265637211, %rcx
	movq	%rcx, (%rax)
	movw	$107, 8(%rax)
	movl	$0, -168(%rbp)
	leaq	-28(%rbp), %rax
	movq	%rax, -160(%rbp)
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box(%rip)
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -144(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -48(%rbp)
	leaq	-1048832(%rbp), %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -24(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -40(%rbp)
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -256(%rbp)
	movq	-256(%rbp), %rax
	leaq	-256(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
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
	movq	-144(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-48(%rbp), %rbx
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
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rbx
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
	movq	-256(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	call	gtk_main@PLT
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
	nop
	addq	$1048824, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE215:
	.size	menu_gui_disclaim, .-menu_gui_disclaim
	.type	menu_gui_license, @function
menu_gui_license:
.LFB216:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1048824, %rsp
	.cfi_offset 3, -24
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movabsq	$7953674097042548052, %rcx
	movq	%rcx, (%rax)
	movabsq	$8388346206432206948, %rcx
	movq	%rcx, 8(%rax)
	movl	$1936617321, 16(%rax)
	movb	$0, 20(%rax)
	leaq	-1048832(%rbp), %rax
	movl	$3, %edx
	movl	$1048576, %esi
	movq	%rax, %rdi
	call	snprint_share_file@PLT
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movabsq	$7161077589265637211, %rcx
	movq	%rcx, (%rax)
	movw	$107, 8(%rax)
	movl	$0, -168(%rbp)
	leaq	-28(%rbp), %rax
	movq	%rax, -160(%rbp)
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box(%rip)
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -144(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -48(%rbp)
	leaq	-1048832(%rbp), %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -24(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -40(%rbp)
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -256(%rbp)
	movq	-256(%rbp), %rax
	leaq	-256(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
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
	movq	-144(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-48(%rbp), %rbx
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
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rbx
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
	movq	-256(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	call	gtk_main@PLT
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
	nop
	addq	$1048824, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE216:
	.size	menu_gui_license, .-menu_gui_license
	.type	menu_gui_hiscores, @function
menu_gui_hiscores:
.LFB217:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1048824, %rsp
	.cfi_offset 3, -24
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movabsq	$7310027618099685704, %rcx
	movq	%rcx, (%rax)
	movw	$115, 8(%rax)
	leaq	-1048832(%rbp), %rax
	movl	$1048576, %esi
	movq	%rax, %rdi
	call	snprint_scores@PLT
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movabsq	$7161077589265637211, %rcx
	movq	%rcx, (%rax)
	movw	$107, 8(%rax)
	movl	$0, -168(%rbp)
	leaq	-28(%rbp), %rax
	movq	%rax, -160(%rbp)
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box(%rip)
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -144(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -48(%rbp)
	leaq	-1048832(%rbp), %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -24(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -40(%rbp)
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -256(%rbp)
	movq	-256(%rbp), %rax
	leaq	-256(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
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
	movq	-144(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-48(%rbp), %rbx
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
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rbx
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
	movq	-256(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	call	gtk_main@PLT
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
	nop
	addq	$1048824, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE217:
	.size	menu_gui_hiscores, .-menu_gui_hiscores
	.section	.rodata
.LC6:
	.string	"Change file name (File: \"%s\")"
.LC7:
	.string	"activate"
	.text
	.type	menu_gui_continue, @function
menu_gui_continue:
.LFB218:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$888, %rsp
	.cfi_offset 3, -24
	leaq	-160(%rbp), %rax
	addq	$8, %rax
	movabsq	$7954884302727897415, %rcx
	movq	%rcx, (%rax)
	movw	$117, 8(%rax)
	leaq	-784(%rbp), %rax
	addq	$112, %rax
	movabsq	$7022329117445021531, %rcx
	movq	%rcx, (%rax)
	movw	$29810, 8(%rax)
	movb	$0, 10(%rax)
	leaq	-784(%rbp), %rax
	addq	$216, %rax
	movabsq	$7810740527211634523, %rcx
	movq	%rcx, (%rax)
	movabsq	$31632318715421541, %rcx
	movq	%rcx, 8(%rax)
	leaq	-784(%rbp), %rax
	addq	$320, %rax
	movabsq	$7018933825538580315, %rbx
	movq	%rbx, (%rax)
	movabsq	$7378700918254298990, %rcx
	movq	%rcx, 8(%rax)
	movl	$1819632489, 16(%rax)
	movw	$31092, 20(%rax)
	movb	$0, 22(%rax)
	leaq	-784(%rbp), %rax
	addq	$424, %rax
	movabsq	$2335477185608179547, %rbx
	movq	%rbx, (%rax)
	movl	$1919902579, 8(%rax)
	movw	$29541, 12(%rax)
	movb	$0, 14(%rax)
	leaq	-784(%rbp), %rax
	addq	$528, %rax
	movabsq	$6216449766448258907, %rcx
	movq	%rcx, (%rax)
	movw	$19525, 8(%rax)
	movb	$0, 10(%rax)
	leaq	-784(%rbp), %rax
	addq	$8, %rax
	movabsq	$7161077589265637211, %rbx
	movq	%rbx, (%rax)
	movw	$107, 8(%rax)
	movl	$1, -592(%rbp)
	movl	$2, -488(%rbp)
	movl	$3, -384(%rbp)
	movl	$4, -280(%rbp)
	movl	$5, -176(%rbp)
	movl	$0, -696(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -584(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -480(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -376(%rbp)
	leaq	saved_path(%rip), %rax
	movq	%rax, -800(%rbp)
	leaq	saved_name(%rip), %rax
	movq	%rax, -792(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -272(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -168(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -688(%rbp)
	movb	$1, -17(%rbp)
	jmp	.L26
.L34:
	leaq	-896(%rbp), %rax
	addq	$16, %rax
	leaq	saved_name(%rip), %rcx
	leaq	.LC6(%rip), %rdx
	movl	$80, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box(%rip)
	leaq	-160(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -160(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -64(%rbp)
	leaq	-784(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -680(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -56(%rbp)
	leaq	-784(%rbp), %rax
	addq	$216, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -576(%rbp)
	leaq	-784(%rbp), %rax
	addq	$320, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -472(%rbp)
	leaq	-896(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -888(%rbp)
	call	gtk_entry_new@PLT
	movq	%rax, -896(%rbp)
	leaq	-784(%rbp), %rax
	addq	$424, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -368(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -48(%rbp)
	leaq	-784(%rbp), %rax
	addq	$528, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -264(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -40(%rbp)
	leaq	-784(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -784(%rbp)
	movq	-680(%rbp), %rax
	leaq	-784(%rbp), %rdx
	addq	$104, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-576(%rbp), %rax
	leaq	-784(%rbp), %rdx
	addq	$208, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-472(%rbp), %rax
	leaq	-784(%rbp), %rdx
	addq	$312, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-896(%rbp), %rax
	leaq	-896(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_entry_fname(%rip), %rdx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-368(%rbp), %rax
	leaq	-784(%rbp), %rdx
	addq	$416, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-264(%rbp), %rax
	leaq	-784(%rbp), %rdx
	addq	$520, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-784(%rbp), %rax
	leaq	-784(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
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
	movq	-160(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-64(%rbp), %rbx
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
	movq	-680(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-56(%rbp), %rbx
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
	movq	-576(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-472(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-888(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-896(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-368(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-48(%rbp), %rbx
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
	movq	-264(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rbx
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
	movq	-784(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	movl	$-1, -24(%rbp)
	call	gtk_main@PLT
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
	movl	-24(%rbp), %eax
	cmpl	$5, %eax
	ja	.L26
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L28(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L28(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L28:
	.long	.L27-.L28
	.long	.L29-.L28
	.long	.L30-.L28
	.long	.L31-.L28
	.long	.L32-.L28
	.long	.L33-.L28
	.text
.L27:
	movb	$0, -17(%rbp)
	jmp	.L26
.L29:
	call	start_switch@PLT
	jmp	.L26
.L30:
	call	menu_gui_select
	jmp	.L26
.L31:
	call	menu_gui_level
	jmp	.L26
.L32:
	call	menu_gui_hiscores
	jmp	.L26
.L33:
	call	menu_gui_devel
	nop
.L26:
	cmpb	$0, -17(%rbp)
	jne	.L34
	nop
	addq	$888, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE218:
	.size	menu_gui_continue, .-menu_gui_continue
	.section	.rodata
.LC8:
	.string	"[_2] Load map (File: \"%s\")"
	.text
	.type	menu_gui_select, @function
menu_gui_select:
.LFB219:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$456, %rsp
	.cfi_offset 3, -24
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movabsq	$7863412919641072979, %rcx
	movq	%rcx, (%rax)
	movw	$28769, 8(%rax)
	movb	$0, 10(%rax)
	leaq	-464(%rbp), %rax
	addq	$112, %rax
	movabsq	$8603368564070637403, %rcx
	movq	%rcx, (%rax)
	movl	$1885433120, 8(%rax)
	movb	$0, 12(%rax)
	leaq	-464(%rbp), %rax
	addq	$216, %rax
	leaq	saved_name(%rip), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$80, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-464(%rbp), %rax
	addq	$8, %rax
	movabsq	$7161077589265637211, %rcx
	movq	%rcx, (%rax)
	movw	$107, 8(%rax)
	movl	$1, -272(%rbp)
	movl	$2, -168(%rbp)
	movl	$0, -376(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -264(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -160(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -368(%rbp)
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box(%rip)
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -144(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -48(%rbp)
	leaq	-464(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -360(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -40(%rbp)
	leaq	-464(%rbp), %rax
	addq	$216, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -256(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -32(%rbp)
	leaq	-464(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -464(%rbp)
	movq	-360(%rbp), %rax
	leaq	-464(%rbp), %rdx
	addq	$104, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-256(%rbp), %rax
	leaq	-464(%rbp), %rdx
	addq	$208, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-464(%rbp), %rax
	leaq	-464(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
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
	movq	-144(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-48(%rbp), %rbx
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
	movq	-360(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rbx
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
	movq	-256(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-32(%rbp), %rbx
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
	movq	-464(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	movl	$-1, -20(%rbp)
	call	gtk_main@PLT
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
	movl	-20(%rbp), %eax
	cmpl	$1, %eax
	je	.L37
	cmpl	$2, %eax
	je	.L38
	testl	%eax, %eax
	jmp	.L36
.L37:
	movl	$1, start_mode(%rip)
	jmp	.L36
.L38:
	movl	$2, start_mode(%rip)
	nop
.L36:
	nop
	addq	$456, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE219:
	.size	menu_gui_select, .-menu_gui_select
	.type	menu_gui_level, @function
menu_gui_level:
.LFB220:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$664, %rsp
	.cfi_offset 3, -24
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movabsq	$7791355325603145043, %rcx
	movq	%rcx, (%rax)
	movl	$1818588773, 8(%rax)
	movb	$0, 12(%rax)
	leaq	-672(%rbp), %rax
	addq	$112, %rax
	movabsq	$7450433865324257115, %rcx
	movq	%rcx, (%rax)
	movl	$1701736041, 8(%rax)
	movw	$114, 12(%rax)
	leaq	-672(%rbp), %rax
	addq	$216, %rax
	movabsq	$8389723559189176155, %rcx
	movq	%rcx, (%rax)
	movabsq	$8386099861059891813, %rcx
	movq	%rcx, 8(%rax)
	movw	$101, 16(%rax)
	leaq	-672(%rbp), %rax
	addq	$320, %rax
	movabsq	$8104303534758125403, %rbx
	movq	%rbx, (%rax)
	movl	$7631461, 8(%rax)
	leaq	-672(%rbp), %rax
	addq	$424, %rax
	movabsq	$8319629692918587227, %rcx
	movq	%rcx, (%rax)
	movl	$7171956, 8(%rax)
	leaq	-672(%rbp), %rax
	addq	$8, %rax
	movabsq	$7161077589265637211, %rbx
	movq	%rbx, (%rax)
	movw	$107, 8(%rax)
	movl	$1, -480(%rbp)
	movl	$2, -376(%rbp)
	movl	$3, -272(%rbp)
	movl	$4, -168(%rbp)
	movl	$0, -584(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -472(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -368(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -264(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -160(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -576(%rbp)
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box(%rip)
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -144(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -48(%rbp)
	leaq	-672(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -568(%rbp)
	leaq	-672(%rbp), %rax
	addq	$216, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -464(%rbp)
	leaq	-672(%rbp), %rax
	addq	$320, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -360(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -40(%rbp)
	leaq	-672(%rbp), %rax
	addq	$424, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -256(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -32(%rbp)
	leaq	-672(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -672(%rbp)
	movq	-568(%rbp), %rax
	leaq	-672(%rbp), %rdx
	addq	$104, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-464(%rbp), %rax
	leaq	-672(%rbp), %rdx
	addq	$208, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-360(%rbp), %rax
	leaq	-672(%rbp), %rdx
	addq	$312, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-256(%rbp), %rax
	leaq	-672(%rbp), %rdx
	addq	$416, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-672(%rbp), %rax
	leaq	-672(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
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
	movq	-144(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-48(%rbp), %rbx
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
	movq	-568(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-464(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-360(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rbx
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
	movq	-256(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-32(%rbp), %rbx
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
	movq	-672(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	movl	$-1, -20(%rbp)
	call	gtk_main@PLT
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
	movl	-20(%rbp), %eax
	cmpl	$2, %eax
	je	.L42
	cmpl	$2, %eax
	jg	.L43
	cmpl	$1, %eax
	je	.L44
	jmp	.L47
.L43:
	cmpl	$3, %eax
	je	.L45
	cmpl	$4, %eax
	je	.L46
	jmp	.L47
.L44:
	movl	$0, menu_iface_variables(%rip)
	jmp	.L41
.L42:
	movl	$1, menu_iface_variables(%rip)
	jmp	.L41
.L45:
	movl	$2, menu_iface_variables(%rip)
	jmp	.L41
.L46:
	movl	$4, menu_iface_variables(%rip)
	call	menu_gui_custom
	nop
.L41:
.L47:
	nop
	addq	$664, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE220:
	.size	menu_gui_level, .-menu_gui_level
	.section	.rodata
	.align 8
.LC14:
	.string	"Change rows: rows\t\t(%i)\nIntroduce an integer number [%i U %i]"
	.align 8
.LC15:
	.string	"Change columns: cols\t(%i)\nIntroduce an integer number [%i U %i]"
	.align 8
.LC16:
	.string	"Change proportion of mines: p\t(%lf)\nIntroduce a Real number [%i U %i]"
	.text
	.type	menu_gui_custom, @function
menu_gui_custom:
.LFB221:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$648, %rsp
	.cfi_offset 3, -24
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movl	$1953723715, (%rax)
	movw	$28015, 4(%rax)
	movb	$0, 6(%rax)
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movabsq	$7161077589265637211, %rcx
	movq	%rcx, (%rax)
	movw	$107, 8(%rax)
	leaq	4+menu_iface_variables(%rip), %rax
	movq	%rax, -416(%rbp)
	movsd	.LC9(%rip), %xmm0
	movsd	%xmm0, -408(%rbp)
	movl	4+menu_iface_variables(%rip), %eax
	cltq
	movq	%rax, -400(%rbp)
	movsd	.LC10(%rip), %xmm0
	movsd	%xmm0, -392(%rbp)
	leaq	8+menu_iface_variables(%rip), %rax
	movq	%rax, -288(%rbp)
	movsd	.LC9(%rip), %xmm0
	movsd	%xmm0, -280(%rbp)
	movl	8+menu_iface_variables(%rip), %eax
	cltq
	movq	%rax, -272(%rbp)
	movsd	.LC11(%rip), %xmm0
	movsd	%xmm0, -264(%rbp)
	leaq	16+menu_iface_variables(%rip), %rax
	movq	%rax, -544(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -536(%rbp)
	movsd	16+menu_iface_variables(%rip), %xmm0
	movsd	%xmm0, -528(%rbp)
	movsd	.LC13(%rip), %xmm0
	movsd	%xmm0, -520(%rbp)
	movl	$0, -168(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -160(%rbp)
	movb	$1, -17(%rbp)
	jmp	.L49
.L53:
	movl	4+menu_iface_variables(%rip), %eax
	leaq	-512(%rbp), %rdx
	leaq	16(%rdx), %rdi
	movl	$22, %r9d
	movl	$2, %r8d
	movl	%eax, %ecx
	leaq	.LC14(%rip), %rdx
	movl	$80, %esi
	movl	$0, %eax
	call	snprintf@PLT
	movl	8+menu_iface_variables(%rip), %eax
	leaq	-512(%rbp), %rdx
	leaq	144(%rdx), %rdi
	movl	$33, %r9d
	movl	$2, %r8d
	movl	%eax, %ecx
	leaq	.LC15(%rip), %rdx
	movl	$80, %esi
	movl	$0, %eax
	call	snprintf@PLT
	movq	16+menu_iface_variables(%rip), %rax
	leaq	-640(%rbp), %rdx
	leaq	16(%rdx), %rdi
	movl	$1, %r8d
	movl	$0, %ecx
	movq	%rax, -648(%rbp)
	movsd	-648(%rbp), %xmm0
	leaq	.LC16(%rip), %rdx
	movl	$80, %esi
	movl	$1, %eax
	call	snprintf@PLT
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box(%rip)
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -144(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -48(%rbp)
	leaq	-512(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -504(%rbp)
	call	gtk_entry_new@PLT
	movq	%rax, -512(%rbp)
	leaq	-512(%rbp), %rax
	addq	$144, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -376(%rbp)
	call	gtk_entry_new@PLT
	movq	%rax, -384(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -40(%rbp)
	leaq	-640(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -632(%rbp)
	call	gtk_entry_new@PLT
	movq	%rax, -640(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -32(%rbp)
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -256(%rbp)
	movq	-512(%rbp), %rax
	leaq	-512(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_entry_int(%rip), %rdx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-384(%rbp), %rax
	leaq	-512(%rbp), %rdx
	subq	$-128, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_entry_int(%rip), %rdx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-640(%rbp), %rax
	leaq	-640(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_entry_dbl(%rip), %rdx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-256(%rbp), %rax
	leaq	-256(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
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
	movq	-144(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-48(%rbp), %rbx
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
	movq	-504(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-512(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-376(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-384(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rbx
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
	movq	-632(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-640(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-32(%rbp), %rbx
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
	movq	-256(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	movl	$-1, -24(%rbp)
	call	gtk_main@PLT
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	je	.L51
	jmp	.L52
.L51:
	movb	$0, -17(%rbp)
	nop
.L52:
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
.L49:
	cmpb	$0, -17(%rbp)
	jne	.L53
	nop
	addq	$648, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE221:
	.size	menu_gui_custom, .-menu_gui_custom
	.type	menu_gui_devel, @function
menu_gui_devel:
.LFB222:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$392, %rsp
	.cfi_offset 3, -24
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movabsq	$4994579175753270596, %rcx
	movq	%rcx, (%rax)
	movabsq	$5642809484591964242, %rcx
	movq	%rcx, 8(%rax)
	movw	$83, 16(%rax)
	leaq	-384(%rbp), %rax
	addq	$16, %rax
	movabsq	$8295742008524367939, %rcx
	movq	%rcx, (%rax)
	movabsq	$7021801385203361125, %rcx
	movq	%rcx, 8(%rax)
	movl	$2712686, 16(%rax)
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movabsq	$7161077589265637211, %rbx
	movq	%rbx, (%rax)
	movw	$107, 8(%rax)
	leaq	-388(%rbp), %rax
	movq	%rax, -288(%rbp)
	movsd	.LC17(%rip), %xmm0
	movsd	%xmm0, -280(%rbp)
	movq	$1, -272(%rbp)
	movsd	.LC18(%rip), %xmm0
	movsd	%xmm0, -264(%rbp)
	movl	$0, -168(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -160(%rbp)
	movb	$1, -17(%rbp)
	jmp	.L55
.L59:
	movl	$0, %esi
	movl	$0, %edi
	call	gtk_vbox_new@PLT
	movq	%rax, box(%rip)
	leaq	-144(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -144(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -48(%rbp)
	leaq	-384(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	gtk_label_new@PLT
	movq	%rax, -376(%rbp)
	call	gtk_entry_new@PLT
	movq	%rax, -384(%rbp)
	call	gtk_hseparator_new@PLT
	movq	%rax, -40(%rbp)
	leaq	-256(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	gtk_button_new_with_mnemonic@PLT
	movq	%rax, -256(%rbp)
	movq	-384(%rbp), %rax
	leaq	-384(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_entry_int(%rip), %rdx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	movq	-256(%rbp), %rax
	leaq	-256(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	callback_button(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
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
	movq	-144(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-48(%rbp), %rbx
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
	movq	-376(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-384(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	-40(%rbp), %rbx
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
	movq	-256(%rbp), %rbx
	call	gtk_box_get_type@PLT
	movq	%rax, %rdx
	movq	box(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_cast@PLT
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	gtk_box_pack_start@PLT
	movq	window_gui(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_show_all@PLT
	movl	$-1, -24(%rbp)
	call	gtk_main@PLT
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	jne	.L60
	movb	$0, -17(%rbp)
	jmp	.L58
.L60:
	movl	-388(%rbp), %eax
	movl	%eax, %edi
	call	srand@PLT
	nop
.L58:
	movq	box(%rip), %rax
	movq	%rax, %rdi
	call	gtk_widget_destroy@PLT
.L55:
	cmpb	$0, -17(%rbp)
	jne	.L59
	nop
	addq	$392, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE222:
	.size	menu_gui_devel, .-menu_gui_devel
	.section	.rodata
	.align 8
.LC9:
	.long	0
	.long	1073741824
	.align 8
.LC10:
	.long	0
	.long	1077280768
	.align 8
.LC11:
	.long	0
	.long	1077968896
	.align 8
.LC13:
	.long	0
	.long	1072693248
	.align 8
.LC17:
	.long	0
	.long	-1048576
	.align 8
.LC18:
	.long	0
	.long	2146435072
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
