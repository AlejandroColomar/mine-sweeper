	.file	"save.c"
	.comm	home_path,4096,32
	.comm	user_game_path,4096,32
	.comm	saved_path,4096,32
	.comm	saved_name,4096,32
	.section	.rodata
.LC0:
	.string	"HOME"
.LC1:
	.string	"%s/"
.LC2:
	.string	".mine-sweeper/"
.LC3:
	.string	"%s/%s/"
.LC4:
	.string	".mine-sweeper/saved/"
.LC5:
	.string	""
.LC6:
	.string	"err = EACCES"
.LC7:
	.string	"WTF?!"
	.text
	.globl	save_init
	.type	save_init, @function
save_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC0(%rip), %rdi
	call	getenv@PLT
	movq	%rax, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$4096, %esi
	leaq	home_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	.LC2(%rip), %r8
	leaq	home_path(%rip), %rcx
	leaq	.LC3(%rip), %rdx
	movl	$4096, %esi
	leaq	user_game_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	.LC4(%rip), %r8
	leaq	home_path(%rip), %rcx
	leaq	.LC3(%rip), %rdx
	movl	$4096, %esi
	leaq	saved_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movzbl	.LC5(%rip), %eax
	movb	%al, saved_name(%rip)
	movl	$448, %esi
	leaq	user_game_path(%rip), %rdi
	call	mkdir@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L2
	movl	$448, %esi
	leaq	saved_path(%rip), %rdi
	call	mkdir@PLT
	jmp	.L9
.L2:
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$13, %eax
	je	.L5
	cmpl	$17, %eax
	je	.L8
	jmp	.L7
.L5:
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L7:
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L8:
	nop
.L9:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	save_init, .-save_init
	.globl	save_clr
	.type	save_clr, @function
save_clr:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC4(%rip), %r8
	leaq	home_path(%rip), %rcx
	leaq	.LC3(%rip), %rdx
	movl	$4096, %esi
	leaq	saved_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	save_clr, .-save_clr
	.section	.rodata
.LC8:
	.string	"%s/%s"
.LC9:
	.string	"r"
.LC10:
	.string	"mine-sweeper saved game"
.LC11:
	.string	" rows %i"
.LC12:
	.string	" cols %i"
.LC13:
	.string	" mines %i"
.LC14:
	.string	" gnd"
.LC15:
	.string	" %i"
.LC16:
	.string	",%i"
.LC17:
	.string	" usr"
.LC18:
	.string	" flags %i"
.LC19:
	.string	" cleared %i"
	.text
	.globl	load_game_file
	.type	load_game_file, @function
load_game_file:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4112, %rsp
	leaq	-4112(%rbp), %rax
	leaq	saved_name(%rip), %r8
	leaq	saved_path(%rip), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-4112(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L21
	movq	-16(%rbp), %rax
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-16(%rbp), %rax
	leaq	game_board(%rip), %rdx
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-16(%rbp), %rax
	leaq	4+game_board(%rip), %rdx
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-16(%rbp), %rax
	leaq	8+game_board(%rip), %rdx
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-16(%rbp), %rax
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	$0, -4(%rbp)
	jmp	.L13
.L16:
	movl	-4(%rbp), %eax
	cltq
	imulq	$3996, %rax, %rdx
	leaq	game_board(%rip), %rax
	addq	%rdx, %rax
	leaq	12(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	$1, -8(%rbp)
	jmp	.L14
.L15:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movl	-4(%rbp), %eax
	cltq
	imulq	$999, %rax, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	addq	%rdx, %rax
	leaq	12(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
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
	movq	-16(%rbp), %rax
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	$0, -4(%rbp)
	jmp	.L17
.L20:
	movl	-4(%rbp), %eax
	cltq
	imulq	$3996, %rax, %rax
	leaq	3992016(%rax), %rdx
	leaq	game_board(%rip), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	$1, -8(%rbp)
	jmp	.L18
.L19:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movl	-4(%rbp), %eax
	cltq
	imulq	$999, %rax, %rax
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, -8(%rbp)
.L18:
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jg	.L19
	addl	$1, -4(%rbp)
.L17:
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jg	.L20
	movq	-16(%rbp), %rax
	leaq	7984020+game_board(%rip), %rdx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-16(%rbp), %rax
	leaq	7984024+game_board(%rip), %rdx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L21:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	load_game_file, .-load_game_file
	.section	.rodata
.LC20:
	.string	"%s"
.LC21:
	.string	"%s/%s%s%s"
.LC22:
	.string	".mine"
.LC23:
	.string	"%s%s%s"
.LC24:
	.string	"w"
.LC25:
	.string	"mine-sweeper saved game\n"
.LC26:
	.string	"rows %i\n"
.LC27:
	.string	"cols %i\n"
.LC28:
	.string	"mines %i\n"
.LC29:
	.string	"gnd\n"
.LC30:
	.string	"%i"
.LC31:
	.string	"usr\n"
.LC32:
	.string	"flags %i\n"
.LC33:
	.string	"cleared %i\n"
	.text
	.globl	save_game_file
	.type	save_game_file, @function
save_game_file:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$12352, %rsp
	movq	%rdi, -12344(%rbp)
	cmpq	$0, -12344(%rbp)
	je	.L23
	leaq	-12320(%rbp), %rax
	leaq	saved_name(%rip), %rcx
	leaq	.LC20(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
.L23:
	call	save_clr
	movl	$1702257011, saved_name(%rip)
	movw	$100, 4+saved_name(%rip)
	movzbl	.LC5(%rip), %eax
	movb	%al, -12326(%rbp)
	movq	-12344(%rbp), %rax
	movl	$4096, %edx
	leaq	saved_name(%rip), %rsi
	movq	%rax, %rdi
	call	player_iface_save_name@PLT
	movb	$1, -9(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L24
.L29:
	cmpq	$0, -12344(%rbp)
	jne	.L25
	leaq	-12326(%rbp), %rcx
	leaq	-4128(%rbp), %rax
	subq	$8, %rsp
	leaq	.LC22(%rip), %rdx
	pushq	%rdx
	movq	%rcx, %r9
	leaq	saved_name(%rip), %r8
	leaq	saved_path(%rip), %rcx
	leaq	.LC21(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	addq	$16, %rsp
	jmp	.L26
.L25:
	leaq	-12326(%rbp), %rsi
	movq	-12344(%rbp), %rdx
	leaq	-4128(%rbp), %rax
	subq	$8, %rsp
	leaq	.LC22(%rip), %rcx
	pushq	%rcx
	movq	%rsi, %r9
	leaq	saved_name(%rip), %r8
	movq	%rdx, %rcx
	leaq	.LC21(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	addq	$16, %rsp
.L26:
	leaq	-4128(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L27
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movb	$95, -12326(%rbp)
	movl	-4(%rbp), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movb	%al, -12325(%rbp)
	movl	-4(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movb	%al, -12324(%rbp)
	movl	-4(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movb	%al, -12323(%rbp)
	movb	$0, -12322(%rbp)
	jmp	.L28
.L27:
	movb	$0, -9(%rbp)
	leaq	-12326(%rbp), %rdx
	leaq	-8224(%rbp), %rax
	leaq	.LC22(%rip), %r9
	movq	%rdx, %r8
	leaq	saved_name(%rip), %rcx
	leaq	.LC23(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-8224(%rbp), %rax
	movq	%rax, %rcx
	leaq	.LC20(%rip), %rdx
	movl	$4096, %esi
	leaq	saved_name(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
.L28:
	addl	$1, -4(%rbp)
.L24:
	cmpb	$0, -9(%rbp)
	jne	.L29
	leaq	-4128(%rbp), %rax
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L30
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rdi
	call	fwrite@PLT
	movl	game_board(%rip), %edx
	movq	-24(%rbp), %rax
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	4+game_board(%rip), %edx
	movq	-24(%rbp), %rax
	leaq	.LC27(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	8+game_board(%rip), %edx
	movq	-24(%rbp), %rax
	leaq	.LC28(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rdi
	call	fwrite@PLT
	movl	$0, -4(%rbp)
	jmp	.L31
.L34:
	movl	-4(%rbp), %eax
	cltq
	imulq	$3996, %rax, %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %edx
	movq	-24(%rbp), %rax
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, -8(%rbp)
	jmp	.L32
.L33:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	12+game_board(%rip), %rax
	movl	(%rdx,%rax), %edx
	movq	-24(%rbp), %rax
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addl	$1, -8(%rbp)
.L32:
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jg	.L33
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	addl	$1, -4(%rbp)
.L31:
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jg	.L34
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rdi
	call	fwrite@PLT
	movl	$0, -4(%rbp)
	jmp	.L35
.L38:
	movl	-4(%rbp), %eax
	cltq
	imulq	$3996, %rax, %rdx
	leaq	3992016+game_board(%rip), %rax
	movl	(%rdx,%rax), %edx
	movq	-24(%rbp), %rax
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, -8(%rbp)
	jmp	.L36
.L37:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$999, %rdx, %rdx
	addq	%rdx, %rax
	addq	$998004, %rax
	leaq	0(,%rax,4), %rdx
	leaq	game_board(%rip), %rax
	movl	(%rdx,%rax), %edx
	movq	-24(%rbp), %rax
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addl	$1, -8(%rbp)
.L36:
	movl	4+game_board(%rip), %eax
	cmpl	-8(%rbp), %eax
	jg	.L37
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	addl	$1, -4(%rbp)
.L35:
	movl	game_board(%rip), %eax
	cmpl	-4(%rbp), %eax
	jg	.L38
	movl	7984020+game_board(%rip), %edx
	movq	-24(%rbp), %rax
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	7984024+game_board(%rip), %edx
	movq	-24(%rbp), %rax
	leaq	.LC33(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L30:
	cmpq	$0, -12344(%rbp)
	je	.L40
	leaq	-12320(%rbp), %rax
	movq	%rax, %rcx
	leaq	.LC20(%rip), %rdx
	movl	$4096, %esi
	leaq	saved_name(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
.L40:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	save_game_file, .-save_game_file
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
