	.file	"game.c"
	.comm	game_board,7984032,32
	.text
	.globl	game_init
	.type	game_init, @function
game_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	call	getpid@PLT
	movl	%eax, %r12d
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %ebx
	call	clock@PLT
	movl	%r12d, %edx
	movl	%ebx, %esi
	movl	%eax, %edi
	call	seedf@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	srand@PLT
	nop
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	game_init, .-game_init
	.globl	game_init_rand
	.type	game_init_rand, @function
game_init_rand:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, game_board(%rip)
	movl	-8(%rbp), %eax
	movl	%eax, 4+game_board(%rip)
	movl	-12(%rbp), %eax
	movl	%eax, 8+game_board(%rip)
	call	game_init_clr
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_init_mines
	call	game_init_adjnums
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	game_init_rand, .-game_init_rand
	.globl	game_init_load
	.type	game_init_load, @function
game_init_load:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	call	load_game_file@PLT
	movl	$0, 7984028+game_board(%rip)
	movl	game_board(%rip), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movl	4+game_board(%rip), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	game_init_load, .-game_init_load
	.globl	game_action
	.type	game_action, @function
game_action:
.LFB3:
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
	movl	-4(%rbp), %eax
	cmpl	$2, %eax
	je	.L6
	cmpl	$2, %eax
	jg	.L7
	cmpl	$1, %eax
	je	.L8
	jmp	.L11
.L7:
	cmpl	$3, %eax
	je	.L9
	cmpl	$4, %eax
	je	.L10
	jmp	.L11
.L8:
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_step
	jmp	.L5
.L6:
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_flag
	jmp	.L5
.L9:
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_possible
	jmp	.L5
.L10:
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_rmflag
	nop
.L5:
.L11:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	game_action, .-game_action
	.type	game_init_clr, @function
game_init_clr:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
	jmp	.L13
.L16:
	movl	$0, -8(%rbp)
	jmp	.L14
.L15:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L14:
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jg	.L15
	addl	$1, -4(%rbp)
.L13:
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jg	.L16
	movl	$0, 7984020+game_board(%rip)
	movl	$0, 7984024+game_board(%rip)
	movl	$0, 7984028+game_board(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	game_init_clr, .-game_init_clr
	.type	game_init_mines, @function
game_init_mines:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L18
.L20:
	call	rand@PLT
	movl	game_board(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, -8(%rbp)
	call	rand@PLT
	movl	4+game_board(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jne	.L18
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jne	.L19
	movl	-12(%rbp), %eax
	cmpl	-24(%rbp), %eax
	je	.L18
.L19:
	movl	-12(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	$9, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L18:
	movl	8+game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jg	.L20
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	game_init_mines, .-game_init_mines
	.type	game_init_adjnums, @function
game_init_adjnums:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
	jmp	.L22
.L31:
	movl	$0, -8(%rbp)
	jmp	.L23
.L30:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$8, %eax
	jle	.L24
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L25
.L29:
	movl	-8(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.L26
.L28:
	cmpl	$0, -12(%rbp)
	js	.L27
	movl	game_board(%rip), %eax
	cmpl	-12(%rbp), %eax
	jle	.L27
	cmpl	$0, -16(%rbp)
	js	.L27
	movl	4+game_board(%rip), %eax
	cmpl	-16(%rbp), %eax
	jle	.L27
	movl	-16(%rbp), %eax
	cltq
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	leal	1(%rax), %ecx
	movl	-16(%rbp), %eax
	cltq
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	%ecx, (%rdx,%rax)
.L27:
	addl	$1, -16(%rbp)
.L26:
	movl	-8(%rbp), %eax
	addl	$2, %eax
	cmpl	-16(%rbp), %eax
	jg	.L28
	addl	$1, -12(%rbp)
.L25:
	movl	-4(%rbp), %eax
	addl	$2, %eax
	cmpl	-12(%rbp), %eax
	jg	.L29
.L24:
	addl	$1, -8(%rbp)
.L23:
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jg	.L30
	addl	$1, -4(%rbp)
.L22:
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jg	.L31
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	game_init_adjnums, .-game_init_adjnums
	.type	game_step, @function
game_step:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$1, %eax
	je	.L34
	cmpl	$3, %eax
	je	.L35
	testl	%eax, %eax
	je	.L35
	jmp	.L36
.L35:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_discover
	jmp	.L33
.L34:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_big_step
	nop
.L33:
.L36:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	game_step, .-game_step
	.type	game_discover, @function
game_discover:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	game_board(%rip), %edx
	movl	4+game_board(%rip), %eax
	imull	%eax, %edx
	movl	8+game_board(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -4(%rbp)
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
	jle	.L38
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	$-1, (%rdx,%rax)
	movl	$2, 7984028+game_board(%rip)
	jmp	.L41
.L38:
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
	je	.L41
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	$1, (%rdx,%rax)
	movl	7984024+game_board(%rip), %eax
	addl	$1, %eax
	movl	%eax, 7984024+game_board(%rip)
	movl	7984024+game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jne	.L40
	movl	$1, 7984028+game_board(%rip)
	jmp	.L41
.L40:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jne	.L41
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_discover_recursive
.L41:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	game_discover, .-game_discover
	.type	game_discover_recursive, @function
game_discover_recursive:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L43
.L47:
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L44
.L46:
	cmpl	$0, -4(%rbp)
	js	.L45
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jle	.L45
	cmpl	$0, -8(%rbp)
	js	.L45
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jle	.L45
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_discover
.L45:
	addl	$1, -8(%rbp)
.L44:
	movl	-24(%rbp), %eax
	addl	$2, %eax
	cmpl	-8(%rbp), %eax
	jg	.L46
	addl	$1, -4(%rbp)
.L43:
	movl	-20(%rbp), %eax
	addl	$2, %eax
	cmpl	-4(%rbp), %eax
	jg	.L47
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	game_discover_recursive, .-game_discover_recursive
	.type	game_big_step, @function
game_big_step:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_count_flags
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L50
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	-4(%rbp), %eax
	jne	.L50
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_step_recursive
.L50:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	game_big_step, .-game_big_step
	.type	game_count_flags, @function
game_count_flags:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L52
.L56:
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L53
.L55:
	cmpl	$0, -8(%rbp)
	js	.L54
	movl	game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jle	.L54
	cmpl	$0, -12(%rbp)
	js	.L54
	movl	4+game_board(%rip), %eax
	cmpl	-12(%rbp), %eax
	jle	.L54
	movl	-12(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$2, %eax
	jne	.L54
	addl	$1, -4(%rbp)
.L54:
	addl	$1, -12(%rbp)
.L53:
	movl	-24(%rbp), %eax
	addl	$2, %eax
	cmpl	-12(%rbp), %eax
	jg	.L55
	addl	$1, -8(%rbp)
.L52:
	movl	-20(%rbp), %eax
	addl	$2, %eax
	cmpl	-8(%rbp), %eax
	jg	.L56
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	game_count_flags, .-game_count_flags
	.type	game_step_recursive, @function
game_step_recursive:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L59
.L64:
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L60
.L63:
	cmpl	$0, -4(%rbp)
	js	.L61
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jle	.L61
	cmpl	$0, -8(%rbp)
	js	.L61
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jle	.L61
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L62
	cmpl	$3, %eax
	jne	.L61
.L62:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_discover
	nop
.L61:
	addl	$1, -8(%rbp)
.L60:
	movl	-24(%rbp), %eax
	addl	$2, %eax
	cmpl	-8(%rbp), %eax
	jg	.L63
	addl	$1, -4(%rbp)
.L59:
	movl	-20(%rbp), %eax
	addl	$2, %eax
	cmpl	-4(%rbp), %eax
	jg	.L64
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	game_step_recursive, .-game_step_recursive
	.type	game_flag, @function
game_flag:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$1, %eax
	je	.L67
	cmpl	$1, %eax
	jg	.L68
	testl	%eax, %eax
	je	.L69
	jmp	.L72
.L68:
	cmpl	$2, %eax
	je	.L70
	cmpl	$3, %eax
	je	.L71
	jmp	.L72
.L69:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	$2, (%rdx,%rax)
	movl	7984020+game_board(%rip), %eax
	addl	$1, %eax
	movl	%eax, 7984020+game_board(%rip)
	jmp	.L66
.L70:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	$3, (%rdx,%rax)
	movl	7984020+game_board(%rip), %eax
	subl	$1, %eax
	movl	%eax, 7984020+game_board(%rip)
	jmp	.L66
.L71:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_rmflag
	jmp	.L66
.L67:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_all_flags
	nop
.L66:
.L72:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	game_flag, .-game_flag
	.type	game_possible, @function
game_possible:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L75
	cmpl	$3, %eax
	je	.L76
	jmp	.L77
.L75:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	$3, (%rdx,%rax)
	jmp	.L74
.L76:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_rmflag
	nop
.L74:
.L77:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	game_possible, .-game_possible
	.type	game_rmflag, @function
game_rmflag:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$2, %eax
	je	.L80
	cmpl	$3, %eax
	je	.L81
	jmp	.L82
.L80:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	7984020+game_board(%rip), %eax
	subl	$1, %eax
	movl	%eax, 7984020+game_board(%rip)
	jmp	.L79
.L81:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	$0, (%rdx,%rax)
	nop
.L79:
.L82:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	game_rmflag, .-game_rmflag
	.type	game_all_flags, @function
game_all_flags:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_count_nclear
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L85
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	-4(%rbp), %eax
	jne	.L85
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	game_flag_recursive
.L85:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	game_all_flags, .-game_all_flags
	.type	game_count_nclear, @function
game_count_nclear:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L87
.L91:
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L88
.L90:
	cmpl	$0, -8(%rbp)
	js	.L89
	movl	game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jle	.L89
	cmpl	$0, -12(%rbp)
	js	.L89
	movl	4+game_board(%rip), %eax
	cmpl	-12(%rbp), %eax
	jle	.L89
	movl	-12(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$1, %eax
	je	.L89
	addl	$1, -4(%rbp)
.L89:
	addl	$1, -12(%rbp)
.L88:
	movl	-24(%rbp), %eax
	addl	$2, %eax
	cmpl	-12(%rbp), %eax
	jg	.L90
	addl	$1, -8(%rbp)
.L87:
	movl	-20(%rbp), %eax
	addl	$2, %eax
	cmpl	-8(%rbp), %eax
	jg	.L91
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	game_count_nclear, .-game_count_nclear
	.type	game_flag_recursive, @function
game_flag_recursive:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L94
.L99:
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L95
.L98:
	cmpl	$0, -4(%rbp)
	js	.L96
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jle	.L96
	cmpl	$0, -8(%rbp)
	js	.L96
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jle	.L96
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L97
	cmpl	$3, %eax
	jne	.L96
.L97:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	$2, (%rdx,%rax)
	movl	7984020+game_board(%rip), %eax
	addl	$1, %eax
	movl	%eax, 7984020+game_board(%rip)
	nop
.L96:
	addl	$1, -8(%rbp)
.L95:
	movl	-24(%rbp), %eax
	addl	$2, %eax
	cmpl	-8(%rbp), %eax
	jg	.L98
	addl	$1, -4(%rbp)
.L94:
	movl	-20(%rbp), %eax
	addl	$2, %eax
	cmpl	-4(%rbp), %eax
	jg	.L99
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	game_flag_recursive, .-game_flag_recursive
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
