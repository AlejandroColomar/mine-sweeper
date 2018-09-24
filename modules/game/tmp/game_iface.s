	.file	"game_iface.c"
	.local	game_iface_out
	.comm	game_iface_out,7984032,32
	.local	game_iface_in
	.comm	game_iface_in,3992008,32
	.local	game_iface_score
	.comm	game_iface_score,12,8
	.local	tim_ini
	.comm	tim_ini,8,8
	.text
	.globl	game_iface_init_rand
	.type	game_iface_init_rand, @function
game_iface_init_rand:
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
	movl	%edx, -12(%rbp)
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	game_action@PLT
	movl	$0, 7984028+game_iface_out(%rip)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	game_iface_init_score
	movl	game_board(%rip), %eax
	movl	%eax, game_iface_out(%rip)
	movl	4+game_board(%rip), %eax
	movl	%eax, 4+game_iface_out(%rip)
	movl	8+game_board(%rip), %eax
	movl	%eax, 8+game_iface_out(%rip)
	call	game_iface_update_out
	call	game_iface_update_score
	call	game_iface_clean_in
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	game_iface_init_rand, .-game_iface_init_rand
	.globl	game_iface_init_load
	.type	game_iface_init_load, @function
game_iface_init_load:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	game_iface_init_cheated
	movl	game_board(%rip), %eax
	movl	%eax, game_iface_out(%rip)
	movl	4+game_board(%rip), %eax
	movl	%eax, 4+game_iface_out(%rip)
	movl	8+game_board(%rip), %eax
	movl	%eax, 8+game_iface_out(%rip)
	call	game_iface_update_out
	call	game_iface_clean_in
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	game_iface_init_load, .-game_iface_init_load
	.globl	game_iface
	.type	game_iface, @function
game_iface:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	jmp	.L4
.L5:
	call	game_iface_update_out
	call	game_iface_update_score
	call	game_iface_clean_in
	leaq	game_iface_in(%rip), %rdx
	leaq	game_iface_score(%rip), %rsi
	leaq	game_iface_out(%rip), %rdi
	call	player_iface@PLT
	call	game_iface_act
.L4:
	movl	7984028+game_iface_out(%rip), %eax
	cmpl	$6, %eax
	jne	.L5
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	game_iface, .-game_iface
	.type	game_iface_init_score, @function
game_iface_init_score:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, game_iface_score(%rip)
	movl	$0, %edi
	call	time@PLT
	movq	%rax, tim_ini(%rip)
	movl	$1, 8+game_iface_score(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	game_iface_init_score, .-game_iface_init_score
	.type	game_iface_init_cheated, @function
game_iface_init_cheated:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$4, 7984028+game_iface_out(%rip)
	movl	$4, game_iface_score(%rip)
	movl	$-1, 4+game_iface_score(%rip)
	movl	$-1, 8+game_iface_score(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	game_iface_init_cheated, .-game_iface_init_cheated
	.type	game_iface_act, @function
game_iface_act:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	7984028+game_iface_out(%rip), %eax
	cmpl	$5, %eax
	ja	.L17
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L11(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L11(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L11:
	.long	.L10-.L11
	.long	.L12-.L11
	.long	.L13-.L11
	.long	.L14-.L11
	.long	.L15-.L11
	.long	.L16-.L11
	.text
.L10:
	call	game_iface_playing_act
	jmp	.L9
.L15:
	call	game_iface_cheated_act
	jmp	.L9
.L16:
	call	game_iface_xyzzy_act
	jmp	.L9
.L14:
	call	game_iface_pause_act
	jmp	.L9
.L12:
	call	game_iface_safe_act
	jmp	.L9
.L13:
	call	game_iface_gameover_act
	nop
.L9:
.L17:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	game_iface_act, .-game_iface_act
	.type	game_iface_playing_act, @function
game_iface_playing_act:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	game_iface_in(%rip), %eax
	cmpl	$9, %eax
	ja	.L26
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L21(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L21(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L21:
	.long	.L26-.L21
	.long	.L20-.L21
	.long	.L22-.L21
	.long	.L23-.L21
	.long	.L24-.L21
	.long	.L26-.L21
	.long	.L26-.L21
	.long	.L26-.L21
	.long	.L26-.L21
	.long	.L25-.L21
	.text
.L20:
	call	game_iface_act_game
	jmp	.L19
.L22:
	call	game_iface_pause
	jmp	.L19
.L24:
	call	game_iface_xyzzy_on
	jmp	.L19
.L23:
	leaq	saved_path(%rip), %rdi
	call	save_game_file@PLT
	jmp	.L19
.L25:
	call	game_iface_quit
	nop
.L19:
.L26:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	game_iface_playing_act, .-game_iface_playing_act
	.type	game_iface_xyzzy_act, @function
game_iface_xyzzy_act:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	xyzzy_init@PLT
	movb	$1, -1(%rbp)
	jmp	.L28
.L37:
	movl	game_iface_in(%rip), %eax
	cmpl	$9, %eax
	ja	.L29
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L31(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L31(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L31:
	.long	.L29-.L31
	.long	.L30-.L31
	.long	.L29-.L31
	.long	.L32-.L31
	.long	.L29-.L31
	.long	.L33-.L31
	.long	.L34-.L31
	.long	.L35-.L31
	.long	.L29-.L31
	.long	.L36-.L31
	.text
.L30:
	call	game_iface_act_game
	movb	$0, -1(%rbp)
	jmp	.L28
.L33:
	call	game_iface_xyzzy_off
	movb	$0, -1(%rbp)
	jmp	.L28
.L34:
	leaq	game_iface_in(%rip), %rsi
	leaq	game_iface_out(%rip), %rdi
	call	xyzzy_lin@PLT
	testl	%eax, %eax
	setne	%al
	movb	%al, -1(%rbp)
	call	game_iface_act_game
	jmp	.L28
.L35:
	leaq	game_iface_in(%rip), %rsi
	leaq	game_iface_out(%rip), %rdi
	call	xyzzy_p@PLT
	testl	%eax, %eax
	setne	%al
	movb	%al, -1(%rbp)
	call	game_iface_act_game
	call	game_iface_update_out
	jmp	.L28
.L32:
	leaq	saved_path(%rip), %rdi
	call	save_game_file@PLT
	movb	$0, -1(%rbp)
	jmp	.L28
.L36:
	call	game_iface_quit
	movb	$0, -1(%rbp)
	jmp	.L28
.L29:
	movb	$0, -1(%rbp)
	nop
.L28:
	cmpb	$0, -1(%rbp)
	jne	.L37
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	game_iface_xyzzy_act, .-game_iface_xyzzy_act
	.type	game_iface_cheated_act, @function
game_iface_cheated_act:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	game_iface_in(%rip), %eax
	cmpl	$3, %eax
	je	.L40
	cmpl	$3, %eax
	jg	.L41
	cmpl	$1, %eax
	je	.L42
	jmp	.L45
.L41:
	cmpl	$4, %eax
	je	.L43
	cmpl	$9, %eax
	je	.L44
	jmp	.L45
.L42:
	call	game_iface_act_game
	jmp	.L39
.L43:
	call	game_iface_xyzzy_on
	jmp	.L39
.L40:
	leaq	saved_path(%rip), %rdi
	call	save_game_file@PLT
	jmp	.L39
.L44:
	call	game_iface_quit
	nop
.L39:
.L45:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	game_iface_cheated_act, .-game_iface_cheated_act
	.type	game_iface_pause_act, @function
game_iface_pause_act:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	game_iface_in(%rip), %eax
	cmpl	$3, %eax
	je	.L48
	cmpl	$3, %eax
	jg	.L49
	cmpl	$2, %eax
	je	.L50
	jmp	.L53
.L49:
	cmpl	$4, %eax
	je	.L51
	cmpl	$9, %eax
	je	.L52
	jmp	.L53
.L50:
	call	game_iface_unpause
	jmp	.L47
.L51:
	call	game_iface_xyzzy_on
	jmp	.L47
.L48:
	leaq	saved_path(%rip), %rdi
	call	save_game_file@PLT
	jmp	.L47
.L52:
	call	game_iface_quit
	nop
.L47:
.L53:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	game_iface_pause_act, .-game_iface_pause_act
	.type	game_iface_safe_act, @function
game_iface_safe_act:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	game_iface_in(%rip), %eax
	cmpl	$3, %eax
	je	.L56
	cmpl	$9, %eax
	je	.L57
	jmp	.L58
.L56:
	call	game_iface_save_score
	call	game_iface_quit
	jmp	.L55
.L57:
	call	game_iface_quit
	nop
.L55:
.L58:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	game_iface_safe_act, .-game_iface_safe_act
	.type	game_iface_gameover_act, @function
game_iface_gameover_act:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	game_iface_in(%rip), %eax
	cmpl	$9, %eax
	je	.L61
	jmp	.L62
.L61:
	call	game_iface_quit
	nop
.L62:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	game_iface_gameover_act, .-game_iface_gameover_act
	.type	game_iface_act_game, @function
game_iface_act_game:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L64
.L68:
	movl	$0, -8(%rbp)
	jmp	.L65
.L67:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	4+game_iface_in(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L66
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	4+game_iface_in(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	game_action@PLT
	movl	8+game_iface_score(%rip), %eax
	addl	$1, %eax
	movl	%eax, 8+game_iface_score(%rip)
.L66:
	addl	$1, -8(%rbp)
.L65:
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jg	.L67
	addl	$1, -4(%rbp)
.L64:
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jg	.L68
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	game_iface_act_game, .-game_iface_act_game
	.type	game_iface_pause, @function
game_iface_pause:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	%eax, %edx
	movq	tim_ini(%rip), %rax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 4+game_iface_score(%rip)
	movl	$3, 7984028+game_iface_out(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	game_iface_pause, .-game_iface_pause
	.type	game_iface_unpause, @function
game_iface_unpause:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -8(%rbp)
	movl	4+game_iface_score(%rip), %eax
	cltq
	movq	-8(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, tim_ini(%rip)
	movl	$0, 7984028+game_iface_out(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	game_iface_unpause, .-game_iface_unpause
	.type	game_iface_xyzzy_on, @function
game_iface_xyzzy_on:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$5, 7984028+game_iface_out(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	game_iface_xyzzy_on, .-game_iface_xyzzy_on
	.type	game_iface_xyzzy_off, @function
game_iface_xyzzy_off:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$4, 7984028+game_iface_out(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	game_iface_xyzzy_off, .-game_iface_xyzzy_off
	.type	game_iface_save_score, @function
game_iface_save_score:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	game_iface_score(%rip), %eax
	cmpl	$1, %eax
	je	.L75
	cmpl	$1, %eax
	jg	.L76
	testl	%eax, %eax
	je	.L77
	jmp	.L80
.L76:
	cmpl	$2, %eax
	je	.L78
	cmpl	$4, %eax
	je	.L79
	jmp	.L80
.L77:
	leaq	var_boards_beginner_path(%rip), %rdi
	call	save_game_file@PLT
	leaq	game_iface_score(%rip), %rdi
	call	save_score@PLT
	jmp	.L74
.L75:
	leaq	var_boards_intermediate_path(%rip), %rdi
	call	save_game_file@PLT
	leaq	game_iface_score(%rip), %rdi
	call	save_score@PLT
	jmp	.L74
.L78:
	leaq	var_boards_expert_path(%rip), %rdi
	call	save_game_file@PLT
	leaq	game_iface_score(%rip), %rdi
	call	save_score@PLT
	jmp	.L74
.L79:
	leaq	var_boards_custom_path(%rip), %rdi
	call	save_game_file@PLT
	nop
.L74:
.L80:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	game_iface_save_score, .-game_iface_save_score
	.type	game_iface_quit, @function
game_iface_quit:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$6, 7984028+game_iface_out(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	game_iface_quit, .-game_iface_quit
	.type	game_iface_update_out, @function
game_iface_update_out:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	7984020+game_board(%rip), %eax
	movl	%eax, 7984020+game_iface_out(%rip)
	movl	7984024+game_board(%rip), %eax
	movl	%eax, 7984024+game_iface_out(%rip)
	movl	7984028+game_board(%rip), %eax
	cmpl	$1, %eax
	je	.L84
	cmpl	$2, %eax
	je	.L85
	jmp	.L83
.L84:
	movl	$1, 7984028+game_iface_out(%rip)
	jmp	.L83
.L85:
	movl	$2, 7984028+game_iface_out(%rip)
	nop
.L83:
	call	game_iface_update_board
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	game_iface_update_out, .-game_iface_update_out
	.type	game_iface_update_board, @function
game_iface_update_board:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L87
.L90:
	movl	$0, -8(%rbp)
	jmp	.L88
.L89:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_iface_update_vis
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_iface_update_usr
	addl	$1, -8(%rbp)
.L88:
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jg	.L89
	addl	$1, -4(%rbp)
.L87:
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jg	.L90
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	game_iface_update_board, .-game_iface_update_board
	.type	game_iface_update_vis, @function
game_iface_update_vis:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	7984028+game_iface_out(%rip), %eax
	cmpl	$5, %eax
	ja	.L92
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L94(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L94(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L94:
	.long	.L93-.L94
	.long	.L95-.L94
	.long	.L96-.L94
	.long	.L92-.L94
	.long	.L93-.L94
	.long	.L93-.L94
	.text
.L93:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$1, %eax
	je	.L98
	cmpl	$1, %eax
	jg	.L99
	testl	%eax, %eax
	je	.L100
	jmp	.L103
.L99:
	cmpl	$2, %eax
	je	.L101
	cmpl	$3, %eax
	je	.L102
	jmp	.L103
.L100:
	movl	$1, -4(%rbp)
	jmp	.L97
.L98:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	addl	$5, %eax
	movl	%eax, -4(%rbp)
	jmp	.L97
.L101:
	movl	$14, -4(%rbp)
	jmp	.L97
.L102:
	movl	$16, -4(%rbp)
	nop
.L97:
	jmp	.L103
.L95:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$1, %eax
	je	.L105
	cmpl	$1, %eax
	jg	.L106
	testl	%eax, %eax
	je	.L107
	jmp	.L103
.L106:
	cmpl	$2, %eax
	je	.L108
	cmpl	$3, %eax
	je	.L109
	jmp	.L103
.L107:
	movl	$4, -4(%rbp)
	jmp	.L104
.L105:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	addl	$5, %eax
	movl	%eax, -4(%rbp)
	jmp	.L104
.L108:
	movl	$14, -4(%rbp)
	jmp	.L104
.L109:
	movl	$16, -4(%rbp)
	nop
.L104:
	jmp	.L103
.L96:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	addl	$1, %eax
	cmpl	$4, %eax
	ja	.L123
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L112(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L112(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L112:
	.long	.L111-.L112
	.long	.L113-.L112
	.long	.L114-.L112
	.long	.L115-.L112
	.long	.L116-.L112
	.text
.L111:
	movl	$0, -4(%rbp)
	jmp	.L110
.L113:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$8, %eax
	jle	.L117
	movl	$2, -4(%rbp)
	jmp	.L110
.L117:
	movl	$3, -4(%rbp)
	jmp	.L110
.L114:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	addl	$5, %eax
	movl	%eax, -4(%rbp)
	jmp	.L110
.L115:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$8, %eax
	jle	.L119
	movl	$14, -4(%rbp)
	jmp	.L110
.L119:
	movl	$15, -4(%rbp)
	jmp	.L110
.L116:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$8, %eax
	jle	.L121
	movl	$16, -4(%rbp)
	jmp	.L124
.L121:
	movl	$17, -4(%rbp)
.L124:
	nop
.L110:
	jmp	.L123
.L92:
	movl	$1, -4(%rbp)
	jmp	.L103
.L123:
	nop
.L103:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	12+game_iface_out(%rip), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rcx,%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	game_iface_update_vis, .-game_iface_update_vis
	.type	game_iface_update_usr, @function
game_iface_update_usr:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	addl	$1, %eax
	cmpl	$4, %eax
	ja	.L126
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L128(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L128(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L128:
	.long	.L127-.L128
	.long	.L129-.L128
	.long	.L130-.L128
	.long	.L131-.L128
	.long	.L132-.L128
	.text
.L127:
	movl	$-1, -4(%rbp)
	jmp	.L126
.L129:
	movl	$0, -4(%rbp)
	jmp	.L126
.L130:
	movl	$1, -4(%rbp)
	jmp	.L126
.L131:
	movl	$14, -4(%rbp)
	jmp	.L126
.L132:
	movl	$16, -4(%rbp)
	nop
.L126:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rcx
	leaq	game_iface_out(%rip), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rcx,%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	game_iface_update_usr, .-game_iface_update_usr
	.type	game_iface_update_score, @function
game_iface_update_score:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	7984028+game_iface_out(%rip), %eax
	testl	%eax, %eax
	je	.L135
	testl	%eax, %eax
	js	.L138
	subl	$4, %eax
	cmpl	$1, %eax
	ja	.L138
	jmp	.L137
.L135:
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	%eax, %edx
	movq	tim_ini(%rip), %rax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 4+game_iface_score(%rip)
	jmp	.L134
.L137:
	movl	$4, game_iface_score(%rip)
	movl	$-1, 4+game_iface_score(%rip)
	movl	$-1, 8+game_iface_score(%rip)
	nop
.L134:
.L138:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	game_iface_update_score, .-game_iface_update_score
	.type	game_iface_clean_in, @function
game_iface_clean_in:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
	jmp	.L140
.L143:
	movl	$0, -8(%rbp)
	jmp	.L141
.L142:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	4+game_iface_in(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L141:
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jg	.L142
	addl	$1, -4(%rbp)
.L140:
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jg	.L143
	movl	$0, game_iface_in(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	game_iface_clean_in, .-game_iface_clean_in
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
