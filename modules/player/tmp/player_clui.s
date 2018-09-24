	.file	"player_clui.c"
	.local	oldaction
	.comm	oldaction,4,4
	.text
	.globl	player_clui_start
	.type	player_clui_start, @function
player_clui_start:
.LFB0:
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
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, oldaction(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	player_clui_start, .-player_clui_start
	.globl	player_clui
	.type	player_clui, @function
player_clui:
.LFB1:
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
	movl	oldaction(%rip), %eax
	testl	%eax, %eax
	je	.L3
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	show_help
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	show_board
.L3:
	call	usr_input
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, oldaction(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	player_clui, .-player_clui
	.section	.rodata
.LC0:
	.string	"File name:"
	.text
	.globl	player_clui_save_name
	.type	player_clui_save_name, @function
player_clui_save_name:
.LFB2:
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
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movq	stdin(%rip), %rdx
	movl	-20(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	player_clui_save_name, .-player_clui_save_name
	.section	.rodata
.LC1:
	.string	"Your name:"
	.text
	.globl	player_clui_score_name
	.type	player_clui_score_name, @function
player_clui_score_name:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movq	stdin(%rip), %rdx
	movl	-12(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	player_clui_score_name, .-player_clui_score_name
	.section	.rodata
	.align 8
.LC2:
	.string	"________________________________________________________________________________"
.LC3:
	.string	"%s\t-\t%s\n"
	.align 8
.LC4:
	.string	"--------------------------------------------------------------------------------"
	.text
	.type	show_board_start, @function
show_board_start:
.LFB4:
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
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	board_loop_start
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	show_board_start, .-show_board_start
	.type	board_loop_start, @function
board_loop_start:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, -4(%rbp)
	jmp	.L8
.L13:
	movl	$0, -8(%rbp)
	jmp	.L9
.L12:
	movb	$43, -9(%rbp)
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	-4(%rbp), %eax
	jne	.L10
	movq	-24(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	-8(%rbp), %eax
	jne	.L10
	movl	$60, %edi
	call	putchar@PLT
	movsbl	-9(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	movl	$62, %edi
	call	putchar@PLT
	jmp	.L11
.L10:
	movl	$32, %edi
	call	putchar@PLT
	movsbl	-9(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	movl	$32, %edi
	call	putchar@PLT
.L11:
	addl	$1, -8(%rbp)
.L9:
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L12
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -4(%rbp)
.L8:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L13
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	board_loop_start, .-board_loop_start
	.type	show_board, @function
show_board:
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
	movq	%rcx, -32(%rbp)
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	board_loop
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	show_board, .-show_board
	.type	board_loop, @function
board_loop:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, -4(%rbp)
	jmp	.L16
.L21:
	movl	$0, -8(%rbp)
	jmp	.L17
.L20:
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
	movb	%al, -9(%rbp)
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	-4(%rbp), %eax
	jne	.L18
	movq	-32(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	-8(%rbp), %eax
	jne	.L18
	movl	$60, %edi
	call	putchar@PLT
	movsbl	-9(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	movl	$62, %edi
	call	putchar@PLT
	jmp	.L19
.L18:
	movl	$32, %edi
	call	putchar@PLT
	movsbl	-9(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	movl	$32, %edi
	call	putchar@PLT
.L19:
	addl	$1, -8(%rbp)
.L17:
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jg	.L20
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -4(%rbp)
.L16:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L21
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	board_loop, .-board_loop
	.type	set_char, @function
set_char:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	cmpl	$17, -20(%rbp)
	ja	.L23
	movl	-20(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L25(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L25(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L25:
	.long	.L24-.L25
	.long	.L26-.L25
	.long	.L27-.L25
	.long	.L28-.L25
	.long	.L29-.L25
	.long	.L30-.L25
	.long	.L31-.L25
	.long	.L32-.L25
	.long	.L33-.L25
	.long	.L34-.L25
	.long	.L35-.L25
	.long	.L36-.L25
	.long	.L37-.L25
	.long	.L38-.L25
	.long	.L39-.L25
	.long	.L40-.L25
	.long	.L41-.L25
	.long	.L42-.L25
	.text
.L24:
	movb	$35, -1(%rbp)
	jmp	.L23
.L26:
	movb	$43, -1(%rbp)
	jmp	.L23
.L27:
	movb	$42, -1(%rbp)
	jmp	.L23
.L28:
	movb	$45, -1(%rbp)
	jmp	.L23
.L29:
	movb	$118, -1(%rbp)
	jmp	.L23
.L30:
	movb	$32, -1(%rbp)
	jmp	.L23
.L31:
	movb	$49, -1(%rbp)
	jmp	.L23
.L32:
	movb	$50, -1(%rbp)
	jmp	.L23
.L33:
	movb	$51, -1(%rbp)
	jmp	.L23
.L34:
	movb	$52, -1(%rbp)
	jmp	.L23
.L35:
	movb	$53, -1(%rbp)
	jmp	.L23
.L36:
	movb	$54, -1(%rbp)
	jmp	.L23
.L37:
	movb	$55, -1(%rbp)
	jmp	.L23
.L38:
	movb	$56, -1(%rbp)
	jmp	.L23
.L39:
	movb	$33, -1(%rbp)
	jmp	.L23
.L40:
	movb	$70, -1(%rbp)
	jmp	.L23
.L41:
	movb	$63, -1(%rbp)
	jmp	.L23
.L42:
	movb	$102, -1(%rbp)
	nop
.L23:
	movzbl	-1(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	set_char, .-set_char
	.section	.rodata
.LC5:
	.string	"%c"
.LC6:
	.string	"%*c%c"
.LC7:
	.string	"%*2c%c"
.LC8:
	.string	"%*3c%c"
.LC9:
	.string	"%*4c%c"
	.text
	.type	usr_input, @function
usr_input:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1056, %rsp
	movb	$0, -1040(%rbp)
	movb	$0, -1041(%rbp)
	movq	stdin(%rip), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1041(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1041(%rbp), %eax
	movsbl	%al, %eax
	subl	$8, %eax
	cmpl	$119, %eax
	ja	.L45
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L47(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L47(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L47:
	.long	.L46-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L48-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L49-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L50-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L51-.L47
	.long	.L52-.L47
	.long	.L53-.L47
	.long	.L54-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L55-.L47
	.long	.L45-.L47
	.long	.L56-.L47
	.long	.L45-.L47
	.long	.L57-.L47
	.long	.L58-.L47
	.long	.L59-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L60-.L47
	.long	.L61-.L47
	.long	.L45-.L47
	.long	.L62-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L63-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L45-.L47
	.long	.L46-.L47
	.text
.L48:
	leaq	-1041(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1041(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$91, %eax
	je	.L65
	jmp	.L72
.L65:
	leaq	-1041(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1041(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$66, %eax
	je	.L67
	cmpl	$66, %eax
	jg	.L68
	cmpl	$65, %eax
	je	.L69
	jmp	.L75
.L68:
	cmpl	$67, %eax
	je	.L70
	cmpl	$68, %eax
	je	.L71
	jmp	.L75
.L69:
	movl	$13, -4(%rbp)
	jmp	.L66
.L67:
	movl	$14, -4(%rbp)
	jmp	.L66
.L70:
	movl	$15, -4(%rbp)
	jmp	.L66
.L71:
	movl	$16, -4(%rbp)
	nop
.L66:
.L75:
	nop
	jmp	.L72
.L56:
	movl	$16, -4(%rbp)
	jmp	.L72
.L57:
	movl	$14, -4(%rbp)
	jmp	.L72
.L58:
	movl	$13, -4(%rbp)
	jmp	.L72
.L59:
	movl	$15, -4(%rbp)
	jmp	.L72
.L50:
	movl	$1, -4(%rbp)
	jmp	.L72
.L49:
	movl	$2, -4(%rbp)
	jmp	.L72
.L55:
	movl	$3, -4(%rbp)
	jmp	.L72
.L46:
	movl	$4, -4(%rbp)
	jmp	.L72
.L60:
	movl	$5, -4(%rbp)
	jmp	.L72
.L62:
	movl	$6, -4(%rbp)
	jmp	.L72
.L63:
	leaq	-1041(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1041(%rbp), %eax
	cmpb	$121, %al
	jne	.L76
	leaq	-1041(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1041(%rbp), %eax
	cmpb	$122, %al
	jne	.L76
	leaq	-1041(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1041(%rbp), %eax
	cmpb	$122, %al
	jne	.L76
	leaq	-1041(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1041(%rbp), %eax
	cmpb	$121, %al
	jne	.L76
	movl	$7, -4(%rbp)
	jmp	.L76
.L51:
	movl	$8, -4(%rbp)
	jmp	.L72
.L52:
	movl	$9, -4(%rbp)
	jmp	.L72
.L53:
	movl	$10, -4(%rbp)
	jmp	.L72
.L54:
	movl	$11, -4(%rbp)
	jmp	.L72
.L61:
	movl	$12, -4(%rbp)
	jmp	.L72
.L45:
	movl	$0, -4(%rbp)
	jmp	.L72
.L76:
	nop
.L72:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	usr_input, .-usr_input
	.type	show_help, @function
show_help:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	7984028(%rax), %eax
	cmpl	$5, %eax
	ja	.L86
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
	.text
.L79:
	call	show_help_play
	jmp	.L78
.L83:
	call	show_help_pause
	jmp	.L78
.L85:
	call	show_help_xyzzy
	jmp	.L78
.L84:
	call	show_help_cheat
	jmp	.L78
.L81:
	call	show_help_safe
	jmp	.L78
.L82:
	call	show_help_gameover
	nop
.L78:
.L86:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	show_help, .-show_help
	.section	.rodata
	.align 8
.LC10:
	.string	"Move      |Step |Quit |Confirm"
	.align 8
.LC11:
	.string	" %c%c%c%c %c%c%c%c| %c   | %c   | Enter\n"
	.text
	.type	show_help_start, @function
show_help_start:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	subq	$8, %rsp
	pushq	$113
	pushq	$43
	pushq	$62
	pushq	$94
	pushq	$118
	movl	$60, %r9d
	movl	$108, %r8d
	movl	$107, %ecx
	movl	$106, %edx
	movl	$104, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$48, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	show_help_start, .-show_help_start
	.section	.rodata
	.align 8
.LC12:
	.string	"Move      |Step |Flag  |? |Remove |Pause |Save |Quit |Confirm"
	.align 8
.LC13:
	.string	" %c%c%c%c %c%c%c%c| %c   | Space| %c| BS    | %c    | %c   | %c   | Enter\n"
	.text
	.type	show_help_play, @function
show_help_play:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	pushq	$113
	pushq	$115
	pushq	$112
	pushq	$102
	pushq	$43
	pushq	$62
	pushq	$94
	pushq	$118
	movl	$60, %r9d
	movl	$108, %r8d
	movl	$107, %ecx
	movl	$106, %edx
	movl	$104, %esi
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$64, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	show_help_play, .-show_help_play
	.section	.rodata
.LC14:
	.string	"Continue |Save |Quit |Confirm"
	.align 8
.LC15:
	.string	" %c       | %c   | %c   | Enter"
	.text
	.type	show_help_pause, @function
show_help_pause:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	movl	$113, %ecx
	movl	$115, %edx
	movl	$112, %esi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	show_help_pause, .-show_help_pause
	.section	.rodata
	.align 8
.LC16:
	.string	"XYZZY |Move      |Step |Flag  |? |Remove |Save |Quit |Confirm"
	.align 8
.LC17:
	.string	" 0 1 2| %c%c%c%c %c%c%c%c| %c   | Space| %c| BS    | %c   | %c   | Enter\n"
	.text
	.type	show_help_xyzzy, @function
show_help_xyzzy:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	subq	$8, %rsp
	pushq	$113
	pushq	$115
	pushq	$102
	pushq	$43
	pushq	$62
	pushq	$94
	pushq	$118
	movl	$60, %r9d
	movl	$108, %r8d
	movl	$107, %ecx
	movl	$106, %edx
	movl	$104, %esi
	leaq	.LC17(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$64, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	show_help_xyzzy, .-show_help_xyzzy
	.section	.rodata
	.align 8
.LC18:
	.string	"Move      |Step |Flag  |? |Remove |Save |Quit |Confirm"
	.align 8
.LC19:
	.string	" %c%c%c%c %c%c%c%c| %c   | Space| %c| BS    | %c   | %c   | Enter\n"
	.text
	.type	show_help_cheat, @function
show_help_cheat:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	subq	$8, %rsp
	pushq	$113
	pushq	$115
	pushq	$102
	pushq	$43
	pushq	$62
	pushq	$94
	pushq	$118
	movl	$60, %r9d
	movl	$108, %r8d
	movl	$107, %ecx
	movl	$106, %edx
	movl	$104, %esi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$64, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	show_help_cheat, .-show_help_cheat
	.section	.rodata
.LC20:
	.string	"Save |Quit |Confirm"
.LC21:
	.string	" %c   | %c   | Enter\n"
	.text
	.type	show_help_safe, @function
show_help_safe:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	movl	$113, %edx
	movl	$115, %esi
	leaq	.LC21(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	show_help_safe, .-show_help_safe
	.section	.rodata
.LC22:
	.string	"Quit |Confirm"
.LC23:
	.string	" %c   | Enter\n"
	.text
	.type	show_help_gameover, @function
show_help_gameover:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC22(%rip), %rdi
	call	puts@PLT
	movl	$113, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	show_help_gameover, .-show_help_gameover
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
