	.file	"player_iface.c"
	.comm	player_iface_mode,4,4
	.local	player_iface_position
	.comm	player_iface_position,20,16
	.local	player_action
	.comm	player_action,4,4
	.text
	.globl	player_iface_init
	.type	player_iface_init, @function
player_iface_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, player_iface_position(%rip)
	movl	-8(%rbp), %eax
	movl	%eax, 4+player_iface_position(%rip)
	movl	player_iface_mode(%rip), %eax
	cmpl	$2, %eax
	je	.L3
	cmpl	$3, %eax
	je	.L4
	cmpl	$1, %eax
	jmp	.L2
.L3:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	player_tui_init@PLT
	jmp	.L2
.L4:
	leaq	player_action(%rip), %rsi
	leaq	player_iface_position(%rip), %rdi
	call	player_gui_init@PLT
	nop
.L2:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	player_iface_init, .-player_iface_init
	.globl	player_iface_start
	.type	player_iface_start, @function
player_iface_start:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	leaq	-32(%rbp), %rax
	movl	$1918989395, (%rax)
	movw	$14964, 4(%rax)
	movb	$0, 6(%rax)
	leaq	-64(%rbp), %rax
	movabsq	$2340781297665454128, %rcx
	movq	%rcx, (%rax)
	movw	$48, 8(%rax)
	movl	$0, 8+player_iface_position(%rip)
	movl	$0, 12+player_iface_position(%rip)
	movl	$0, 16+player_iface_position(%rip)
.L12:
	movl	player_iface_mode(%rip), %eax
	cmpl	$2, %eax
	je	.L8
	cmpl	$3, %eax
	je	.L9
	cmpl	$1, %eax
	jne	.L7
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rax
	leaq	player_action(%rip), %rcx
	movq	%rax, %rsi
	leaq	player_iface_position(%rip), %rdi
	call	player_clui_start@PLT
	jmp	.L7
.L8:
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rax
	leaq	player_action(%rip), %rcx
	movq	%rax, %rsi
	leaq	player_iface_position(%rip), %rdi
	call	player_tui_start@PLT
	jmp	.L7
.L9:
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	player_iface_position(%rip), %rdi
	call	player_gui_start@PLT
	nop
.L7:
	call	player_iface_act_start
	movl	player_action(%rip), %eax
	cmpl	$1, %eax
	je	.L11
	movl	player_action(%rip), %eax
	cmpl	$12, %eax
	jne	.L12
.L11:
	movl	8+player_iface_position(%rip), %edx
	movq	-72(%rbp), %rax
	movl	%edx, (%rax)
	movl	12+player_iface_position(%rip), %edx
	movq	-80(%rbp), %rax
	movl	%edx, (%rax)
	movl	player_action(%rip), %eax
	cmpl	$1, %eax
	je	.L14
	cmpl	$12, %eax
	je	.L15
	jmp	.L13
.L14:
	movl	$0, -4(%rbp)
	jmp	.L13
.L15:
	movl	$-1, -4(%rbp)
	nop
.L13:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	player_iface_start, .-player_iface_start
	.section	.rodata
.LC0:
	.string	"Mines: %i/%i"
.LC1:
	.string	"%02i:%02i:%02i | %i"
.LC2:
	.string	"%02i:%02i | %i"
	.text
	.globl	player_iface
	.type	player_iface, @function
player_iface:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	-72(%rbp), %rax
	movl	7984028(%rax), %eax
	cmpl	$5, %eax
	ja	.L18
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L20(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L20(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L20:
	.long	.L19-.L20
	.long	.L21-.L20
	.long	.L22-.L20
	.long	.L19-.L20
	.long	.L19-.L20
	.long	.L19-.L20
	.text
.L19:
	movq	-72(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-72(%rbp), %rax
	movl	7984020(%rax), %edx
	leaq	-32(%rbp), %rax
	movl	%ecx, %r8d
	movl	%edx, %ecx
	leaq	.LC0(%rip), %rdx
	movl	$20, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	jmp	.L18
.L22:
	leaq	-32(%rbp), %rax
	movabsq	$4996267836634382663, %rdi
	movq	%rdi, (%rax)
	movw	$82, 8(%rax)
	jmp	.L18
.L21:
	leaq	-32(%rbp), %rax
	movabsq	$2408978811056385881, %rdi
	movq	%rdi, (%rax)
	movb	$0, 8(%rax)
	nop
.L18:
	movq	-80(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$-1, %eax
	je	.L23
	movq	-80(%rbp), %rax
	movl	4(%rax), %ecx
	movl	$-1851608123, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$11, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -4(%rbp)
	movq	-80(%rbp), %rax
	movl	4(%rax), %esi
	movl	$-1851608123, %edx
	movl	%esi, %eax
	imull	%edx
	leal	(%rdx,%rsi), %eax
	sarl	$11, %eax
	movl	%eax, %edx
	movl	%esi, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	imull	$3600, %ecx, %eax
	subl	%eax, %esi
	movl	%esi, %ecx
	movl	$-2004318071, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -8(%rbp)
	movq	-80(%rbp), %rax
	movl	4(%rax), %ecx
	movl	$-2004318071, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	imull	$60, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -12(%rbp)
	movq	-80(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$3599, %eax
	jle	.L24
	movq	-80(%rbp), %rax
	movl	8(%rax), %ecx
	movl	-12(%rbp), %edi
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %edx
	leaq	-64(%rbp), %rax
	subq	$8, %rsp
	pushq	%rcx
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%edx, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$20, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	addq	$16, %rsp
	jmp	.L26
.L24:
	movq	-80(%rbp), %rax
	movl	8(%rax), %esi
	movl	-12(%rbp), %ecx
	movl	-8(%rbp), %edx
	leaq	-64(%rbp), %rax
	movl	%esi, %r9d
	movl	%ecx, %r8d
	movl	%edx, %ecx
	leaq	.LC2(%rip), %rdx
	movl	$20, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	jmp	.L26
.L23:
	leaq	-64(%rbp), %rax
	movl	$4271950, (%rax)
.L26:
	movl	player_iface_mode(%rip), %eax
	cmpl	$2, %eax
	je	.L28
	cmpl	$3, %eax
	je	.L29
	cmpl	$1, %eax
	jne	.L27
	leaq	-64(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	-72(%rbp), %rax
	leaq	player_action(%rip), %r8
	leaq	player_iface_position(%rip), %rsi
	movq	%rax, %rdi
	call	player_clui@PLT
	jmp	.L27
.L28:
	leaq	-64(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	-72(%rbp), %rax
	leaq	player_action(%rip), %r8
	leaq	player_iface_position(%rip), %rsi
	movq	%rax, %rdi
	call	player_tui@PLT
	jmp	.L27
.L29:
	leaq	-64(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	-72(%rbp), %rax
	leaq	player_iface_position(%rip), %rsi
	movq	%rax, %rdi
	call	player_gui@PLT
	nop
.L27:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	player_iface_act
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	player_iface, .-player_iface
	.globl	player_iface_save_name
	.type	player_iface_save_name, @function
player_iface_save_name:
.LFB3:
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
	movl	player_iface_mode(%rip), %eax
	cmpl	$2, %eax
	je	.L33
	cmpl	$3, %eax
	je	.L34
	cmpl	$1, %eax
	je	.L35
	jmp	.L36
.L35:
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	player_clui_save_name@PLT
	jmp	.L32
.L33:
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	player_tui_save_name@PLT
	jmp	.L32
.L34:
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	player_gui_save_name@PLT
	nop
.L32:
.L36:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	player_iface_save_name, .-player_iface_save_name
	.globl	player_iface_score_name
	.type	player_iface_score_name, @function
player_iface_score_name:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	player_iface_mode(%rip), %eax
	cmpl	$2, %eax
	je	.L39
	cmpl	$3, %eax
	je	.L40
	cmpl	$1, %eax
	je	.L41
	jmp	.L42
.L41:
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	player_clui_score_name@PLT
	jmp	.L38
.L39:
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	player_tui_score_name@PLT
	jmp	.L38
.L40:
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	player_gui_score_name@PLT
	nop
.L38:
.L42:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	player_iface_score_name, .-player_iface_score_name
	.globl	player_iface_cleanup
	.type	player_iface_cleanup, @function
player_iface_cleanup:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	player_iface_mode(%rip), %eax
	cmpl	$2, %eax
	je	.L45
	cmpl	$3, %eax
	je	.L46
	cmpl	$1, %eax
	jmp	.L44
.L45:
	call	player_tui_cleanup@PLT
	jmp	.L44
.L46:
	call	player_gui_cleanup@PLT
	nop
.L44:
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	player_iface_cleanup, .-player_iface_cleanup
	.type	player_iface_act, @function
player_iface_act:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	player_action(%rip), %eax
	cmpl	$17, %eax
	ja	.L58
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L51(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L51(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L51:
	.long	.L58-.L51
	.long	.L50-.L51
	.long	.L50-.L51
	.long	.L50-.L51
	.long	.L50-.L51
	.long	.L52-.L51
	.long	.L52-.L51
	.long	.L52-.L51
	.long	.L52-.L51
	.long	.L52-.L51
	.long	.L52-.L51
	.long	.L52-.L51
	.long	.L52-.L51
	.long	.L53-.L51
	.long	.L54-.L51
	.long	.L55-.L51
	.long	.L56-.L51
	.long	.L57-.L51
	.text
.L50:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	player_iface_act_play
	jmp	.L49
.L52:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	player_iface_act_game
	jmp	.L49
.L53:
	call	player_iface_move_up
	jmp	.L49
.L54:
	call	player_iface_move_down
	jmp	.L49
.L55:
	call	player_iface_move_right
	jmp	.L49
.L56:
	call	player_iface_move_left
	jmp	.L49
.L57:
	call	highlight_cursor
	nop
.L49:
.L58:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	player_iface_act, .-player_iface_act
	.type	player_iface_act_start, @function
player_iface_act_start:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	player_action(%rip), %eax
	cmpl	$17, %eax
	ja	.L68
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L62(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L62(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L62:
	.long	.L68-.L62
	.long	.L69-.L62
	.long	.L68-.L62
	.long	.L68-.L62
	.long	.L68-.L62
	.long	.L68-.L62
	.long	.L68-.L62
	.long	.L68-.L62
	.long	.L68-.L62
	.long	.L68-.L62
	.long	.L68-.L62
	.long	.L68-.L62
	.long	.L69-.L62
	.long	.L63-.L62
	.long	.L64-.L62
	.long	.L65-.L62
	.long	.L66-.L62
	.long	.L67-.L62
	.text
.L63:
	call	player_iface_move_up
	jmp	.L60
.L64:
	call	player_iface_move_down
	jmp	.L60
.L65:
	call	player_iface_move_right
	jmp	.L60
.L66:
	call	player_iface_move_left
	jmp	.L60
.L67:
	call	highlight_cursor
	jmp	.L60
.L69:
	nop
.L60:
.L68:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	player_iface_act_start, .-player_iface_act_start
	.type	player_iface_act_play, @function
player_iface_act_play:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	player_action(%rip), %eax
	cmpl	$2, %eax
	je	.L72
	cmpl	$2, %eax
	jg	.L73
	cmpl	$1, %eax
	je	.L74
	jmp	.L71
.L73:
	cmpl	$3, %eax
	je	.L75
	cmpl	$4, %eax
	je	.L76
	jmp	.L71
.L74:
	movl	8+player_iface_position(%rip), %ecx
	movl	12+player_iface_position(%rip), %edx
	movq	-8(%rbp), %rax
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	$1, 4(%rax,%rdx,4)
	jmp	.L71
.L72:
	movl	8+player_iface_position(%rip), %ecx
	movl	12+player_iface_position(%rip), %edx
	movq	-8(%rbp), %rax
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	$2, 4(%rax,%rdx,4)
	jmp	.L71
.L75:
	movl	8+player_iface_position(%rip), %ecx
	movl	12+player_iface_position(%rip), %edx
	movq	-8(%rbp), %rax
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	$3, 4(%rax,%rdx,4)
	jmp	.L71
.L76:
	movl	8+player_iface_position(%rip), %ecx
	movl	12+player_iface_position(%rip), %edx
	movq	-8(%rbp), %rax
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	imulq	$999, %rcx, %rcx
	addq	%rcx, %rdx
	movl	$4, 4(%rax,%rdx,4)
	nop
.L71:
	movq	-8(%rbp), %rax
	movl	$1, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	player_iface_act_play, .-player_iface_act_play
	.type	player_iface_act_game, @function
player_iface_act_game:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	player_action(%rip), %eax
	subl	$5, %eax
	cmpl	$7, %eax
	ja	.L88
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L80(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L80(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L80:
	.long	.L79-.L80
	.long	.L81-.L80
	.long	.L82-.L80
	.long	.L83-.L80
	.long	.L84-.L80
	.long	.L85-.L80
	.long	.L86-.L80
	.long	.L87-.L80
	.text
.L79:
	movq	-8(%rbp), %rax
	movl	$2, (%rax)
	jmp	.L78
.L81:
	movq	-8(%rbp), %rax
	movl	$3, (%rax)
	jmp	.L78
.L82:
	movq	-8(%rbp), %rax
	movl	$4, (%rax)
	jmp	.L78
.L83:
	movq	-8(%rbp), %rax
	movl	$5, (%rax)
	jmp	.L78
.L84:
	movq	-8(%rbp), %rax
	movl	$6, (%rax)
	jmp	.L78
.L85:
	movq	-8(%rbp), %rax
	movl	$7, (%rax)
	jmp	.L78
.L86:
	movq	-8(%rbp), %rax
	movl	$8, (%rax)
	jmp	.L78
.L87:
	movq	-8(%rbp), %rax
	movl	$9, (%rax)
	nop
.L78:
.L88:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	player_iface_act_game, .-player_iface_act_game
	.type	player_iface_move_up, @function
player_iface_move_up:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	8+player_iface_position(%rip), %eax
	testl	%eax, %eax
	je	.L90
	movl	8+player_iface_position(%rip), %eax
	subl	$1, %eax
	movl	%eax, 8+player_iface_position(%rip)
	jmp	.L92
.L90:
	movl	player_iface_position(%rip), %eax
	subl	$1, %eax
	movl	%eax, 8+player_iface_position(%rip)
.L92:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	player_iface_move_up, .-player_iface_move_up
	.type	player_iface_move_down, @function
player_iface_move_down:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	8+player_iface_position(%rip), %eax
	movl	player_iface_position(%rip), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	je	.L94
	movl	8+player_iface_position(%rip), %eax
	addl	$1, %eax
	movl	%eax, 8+player_iface_position(%rip)
	jmp	.L96
.L94:
	movl	$0, 8+player_iface_position(%rip)
.L96:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	player_iface_move_down, .-player_iface_move_down
	.type	player_iface_move_right, @function
player_iface_move_right:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	12+player_iface_position(%rip), %eax
	movl	4+player_iface_position(%rip), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	je	.L98
	movl	12+player_iface_position(%rip), %eax
	addl	$1, %eax
	movl	%eax, 12+player_iface_position(%rip)
	jmp	.L100
.L98:
	movl	$0, 12+player_iface_position(%rip)
.L100:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	player_iface_move_right, .-player_iface_move_right
	.type	player_iface_move_left, @function
player_iface_move_left:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	12+player_iface_position(%rip), %eax
	testl	%eax, %eax
	je	.L102
	movl	12+player_iface_position(%rip), %eax
	subl	$1, %eax
	movl	%eax, 12+player_iface_position(%rip)
	jmp	.L104
.L102:
	movl	4+player_iface_position(%rip), %eax
	subl	$1, %eax
	movl	%eax, 12+player_iface_position(%rip)
.L104:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	player_iface_move_left, .-player_iface_move_left
	.type	highlight_cursor, @function
highlight_cursor:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	16+player_iface_position(%rip), %eax
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 16+player_iface_position(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	highlight_cursor, .-highlight_cursor
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
