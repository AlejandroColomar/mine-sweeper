	.file	"parser.c"
	.section	.rodata
.LC13:
	.string	"xhLuva:b:f:i:p:r:s:"
.LC0:
	.string	"exit"
.LC1:
	.string	"help"
.LC2:
	.string	"license"
.LC3:
	.string	"usage"
.LC4:
	.string	"version"
.LC5:
	.string	"rows"
.LC6:
	.string	"columns"
.LC7:
	.string	"file"
.LC8:
	.string	"iface"
.LC9:
	.string	"proportion"
.LC10:
	.string	"start"
	.data
	.align 32
.LC12:
	.quad	.LC0
	.long	0
	.zero	4
	.quad	0
	.long	120
	.zero	4
	.quad	.LC1
	.long	0
	.zero	4
	.quad	0
	.long	104
	.zero	4
	.quad	.LC2
	.long	0
	.zero	4
	.quad	0
	.long	76
	.zero	4
	.quad	.LC3
	.long	0
	.zero	4
	.quad	0
	.long	117
	.zero	4
	.quad	.LC4
	.long	0
	.zero	4
	.quad	0
	.long	118
	.zero	4
	.quad	.LC5
	.long	1
	.zero	4
	.quad	0
	.long	97
	.zero	4
	.quad	.LC6
	.long	1
	.zero	4
	.quad	0
	.long	98
	.zero	4
	.quad	.LC7
	.long	1
	.zero	4
	.quad	0
	.long	102
	.zero	4
	.quad	.LC8
	.long	1
	.zero	4
	.quad	0
	.long	105
	.zero	4
	.quad	.LC9
	.long	1
	.zero	4
	.quad	0
	.long	112
	.zero	4
	.quad	.LC10
	.long	1
	.zero	4
	.quad	0
	.long	115
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.text
	.globl	parser
	.type	parser, @function
parser:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$416, %rsp
	movl	%edi, -404(%rbp)
	movq	%rsi, -416(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	leaq	-400(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movl	$48, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	jmp	.L2
.L16:
	movl	-4(%rbp), %eax
	subl	$76, %eax
	cmpl	$44, %eax
	ja	.L3
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L5(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L5(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L4-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L6-.L5
	.long	.L7-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L8-.L5
	.long	.L3-.L5
	.long	.L9-.L5
	.long	.L10-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L11-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L12-.L5
	.long	.L3-.L5
	.long	.L13-.L5
	.long	.L14-.L5
	.long	.L3-.L5
	.long	.L15-.L5
	.text
.L15:
	movb	$1, flag_exit(%rip)
	jmp	.L2
.L9:
	movl	$2, %edi
	call	print_share_file@PLT
	movl	$0, %edi
	call	exit@PLT
.L4:
	movl	$3, %edi
	call	print_share_file@PLT
	movl	$0, %edi
	call	exit@PLT
.L13:
	movl	$4, %edi
	call	print_share_file@PLT
	movl	$0, %edi
	call	exit@PLT
.L14:
	call	print_version@PLT
	movl	$0, %edi
	call	exit@PLT
.L6:
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	call	parse_rows
	jmp	.L2
.L7:
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	call	parse_columns
	jmp	.L2
.L8:
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	call	parse_file
	jmp	.L2
.L10:
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	call	parse_iface
	jmp	.L2
.L11:
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	call	parse_proportion
	jmp	.L2
.L12:
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	call	parse_start
	jmp	.L2
.L3:
	movl	$4, %edi
	call	print_share_file@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	leaq	-8(%rbp), %rcx
	leaq	-400(%rbp), %rdx
	movq	-416(%rbp), %rsi
	movl	-404(%rbp), %eax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC13(%rip), %rdx
	movl	%eax, %edi
	call	getopt_long@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L16
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	parser, .-parser
	.section	.rodata
.LC14:
	.string	"--rows argument not valid"
	.align 8
.LC15:
	.string	"It must be an integer [%i U %i]\n"
	.text
	.type	parse_rows, @function
parse_rows:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, 4+menu_iface_variables(%rip)
	movl	4+menu_iface_variables(%rip), %eax
	cmpl	$1, %eax
	jle	.L18
	movl	4+menu_iface_variables(%rip), %eax
	cmpl	$999, %eax
	jle	.L20
.L18:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	movl	$999, %edx
	movl	$2, %esi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L20:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	parse_rows, .-parse_rows
	.section	.rodata
.LC16:
	.string	"--columns argument not valid"
	.text
	.type	parse_columns, @function
parse_columns:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, 8+menu_iface_variables(%rip)
	movl	8+menu_iface_variables(%rip), %eax
	cmpl	$1, %eax
	jle	.L22
	movl	8+menu_iface_variables(%rip), %eax
	cmpl	$999, %eax
	jle	.L24
.L22:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movl	$999, %edx
	movl	$2, %esi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L24:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	parse_columns, .-parse_columns
	.section	.rodata
.LC17:
	.string	"r"
.LC18:
	.string	"--file argument not valid"
	.align 8
.LC19:
	.string	"It must be a valid file name (relative to saved dir)"
.LC20:
	.string	""
	.text
	.type	parse_file, @function
parse_file:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L26
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L26:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movzbl	.LC20(%rip), %eax
	movb	%al, saved_path(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$4096, %esi
	leaq	saved_name(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	parse_file, .-parse_file
	.section	.rodata
.LC21:
	.string	"--iface argument not valid"
	.text
	.type	parse_iface, @function
parse_iface:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, menu_iface_mode(%rip)
	movl	menu_iface_mode(%rip), %eax
	movl	%eax, player_iface_mode(%rip)
	movl	menu_iface_mode(%rip), %eax
	testl	%eax, %eax
	jle	.L28
	movl	menu_iface_mode(%rip), %eax
	cmpl	$3, %eax
	jle	.L30
.L28:
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L30:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	parse_iface, .-parse_iface
	.section	.rodata
	.align 8
.LC24:
	.string	"--proportion argument not valid"
.LC25:
	.string	"It must be a real [0 U 1]"
	.text
	.type	parse_proportion, @function
parse_proportion:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	atof@PLT
	movq	%xmm0, %rax
	movq	%rax, 16+menu_iface_variables(%rip)
	movsd	16+menu_iface_variables(%rip), %xmm1
	pxor	%xmm0, %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L32
	movsd	16+menu_iface_variables(%rip), %xmm0
	movsd	.LC23(%rip), %xmm1
	ucomisd	%xmm1, %xmm0
	ja	.L32
	jmp	.L35
.L32:
	leaq	.LC24(%rip), %rdi
	call	puts@PLT
	leaq	.LC25(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	parse_proportion, .-parse_proportion
	.type	parse_rand_seed, @function
parse_rand_seed:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atof@PLT
	cvttsd2si	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	srand@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	parse_rand_seed, .-parse_rand_seed
	.section	.rodata
.LC26:
	.string	"--start argument not valid"
	.text
	.type	parse_start, @function
parse_start:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, start_mode(%rip)
	movl	start_mode(%rip), %eax
	testl	%eax, %eax
	js	.L38
	movl	start_mode(%rip), %eax
	cmpl	$2, %eax
	jle	.L40
.L38:
	leaq	.LC26(%rip), %rdi
	call	puts@PLT
	movl	$2, %edx
	movl	$0, %esi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L40:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	parse_start, .-parse_start
	.section	.rodata
	.align 8
.LC23:
	.long	0
	.long	1072693248
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
