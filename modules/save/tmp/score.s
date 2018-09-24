	.file	"score.c"
	.comm	var_path,4096,32
	.comm	var_hiscores_path,4096,32
	.comm	var_boards_beginner_path,4096,32
	.comm	var_boards_intermediate_path,4096,32
	.comm	var_boards_expert_path,4096,32
	.comm	var_boards_custom_path,4096,32
	.comm	var_hiscores_beginner_name,4096,32
	.comm	var_hiscores_intermediate_name,4096,32
	.comm	var_hiscores_expert_name,4096,32
	.section	.rodata
.LC0:
	.string	"mine-sweeper/"
.LC1:
	.string	"/var/local/"
.LC2:
	.string	"%s/%s/"
.LC3:
	.string	"hiscores/"
.LC4:
	.string	"hiscores/boards_beginner/"
.LC5:
	.string	"hiscores/boards_intermediate/"
.LC6:
	.string	"hiscores/boards_expert/"
.LC7:
	.string	"hiscores/boards_custom/"
	.text
	.globl	score_init
	.type	score_init, @function
score_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %r8
	leaq	.LC1(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$4096, %esi
	leaq	var_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	.LC3(%rip), %r8
	leaq	var_path(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$4096, %esi
	leaq	var_hiscores_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	.LC4(%rip), %r8
	leaq	var_path(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$4096, %esi
	leaq	var_boards_beginner_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	.LC5(%rip), %r8
	leaq	var_path(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$4096, %esi
	leaq	var_boards_intermediate_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	.LC6(%rip), %r8
	leaq	var_path(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$4096, %esi
	leaq	var_boards_expert_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	.LC7(%rip), %r8
	leaq	var_path(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$4096, %esi
	leaq	var_boards_custom_path(%rip), %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movabsq	$8315178109744933224, %rax
	movq	%rax, var_hiscores_beginner_name(%rip)
	movabsq	$7308900644254212703, %rax
	movq	%rax, 8+var_hiscores_beginner_name(%rip)
	movl	$1768762994, 16+var_hiscores_beginner_name(%rip)
	movw	$25966, 20+var_hiscores_beginner_name(%rip)
	movb	$0, 22+var_hiscores_beginner_name(%rip)
	movabsq	$8315178109744933224, %rax
	movq	%rax, var_hiscores_intermediate_name(%rip)
	movabsq	$7308623550362839391, %rax
	movq	%rax, 8+var_hiscores_intermediate_name(%rip)
	movabsq	$7596779159723010404, %rax
	movq	%rax, 16+var_hiscores_intermediate_name(%rip)
	movw	$25966, 24+var_hiscores_intermediate_name(%rip)
	movb	$0, 26+var_hiscores_intermediate_name(%rip)
	movabsq	$8315178109744933224, %rax
	movq	%rax, var_hiscores_expert_name(%rip)
	movabsq	$3347426203047322975, %rax
	movq	%rax, 8+var_hiscores_expert_name(%rip)
	movl	$1701734765, 16+var_hiscores_expert_name(%rip)
	movb	$0, 20+var_hiscores_expert_name(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	score_init, .-score_init
	.section	.rodata
.LC8:
	.string	"%s/%s"
.LC9:
	.string	"a"
.LC10:
	.string	"name\t%s\n"
.LC11:
	.string	"date\t%i\n"
.LC12:
	.string	"{\n"
.LC13:
	.string	"\tisdst\t%i\n"
.LC14:
	.string	"\tyday\t%i\n"
.LC15:
	.string	"\twday\t%i\n"
.LC16:
	.string	"\tyear\t%i\n"
.LC17:
	.string	"\tmon\t%i\n"
.LC18:
	.string	"\tmday\t%i\n"
.LC19:
	.string	"\thour\t%i\n"
.LC20:
	.string	"\tmin\t%i\n"
.LC21:
	.string	"\tsec\t%i\n"
.LC22:
	.string	"}\n"
.LC23:
	.string	"time\t%i\n"
.LC24:
	.string	"clicks\t%i\n"
.LC25:
	.string	"file\t%s\n"
	.text
	.globl	save_score
	.type	save_score, @function
save_score:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$5168, %rsp
	movq	%rdi, -5160(%rbp)
	movq	-5160(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L4
	cmpl	$2, %eax
	je	.L5
	testl	%eax, %eax
	jne	.L3
	leaq	-4112(%rbp), %rax
	leaq	var_hiscores_beginner_name(%rip), %r8
	leaq	var_hiscores_path(%rip), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	jmp	.L3
.L4:
	leaq	-4112(%rbp), %rax
	leaq	var_hiscores_intermediate_name(%rip), %r8
	leaq	var_hiscores_path(%rip), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	jmp	.L3
.L5:
	leaq	-4112(%rbp), %rax
	leaq	var_hiscores_expert_name(%rip), %r8
	leaq	var_hiscores_path(%rip), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	nop
.L3:
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -4120(%rbp)
	leaq	-4120(%rbp), %rax
	movq	%rax, %rdi
	call	localtime@PLT
	movq	%rax, -8(%rbp)
	leaq	-5152(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	player_iface_score_name@PLT
	leaq	-4112(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L7
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	leaq	-5152(%rbp), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-4120(%rbp), %rax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	fwrite@PLT
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movl	28(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movl	24(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movl	20(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movl	12(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	fwrite@PLT
	movq	-5160(%rbp), %rax
	movl	4(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-5160(%rbp), %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-16(%rbp), %rax
	leaq	saved_name(%rip), %rdx
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L8
.L7:
	movl	$1, %edi
	call	exit@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	save_score, .-save_score
	.section	.rodata
.LC26:
	.string	"%s%s"
.LC27:
	.string	"%s"
	.text
	.globl	snprint_scores
	.type	snprint_scores, @function
snprint_scores:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2101264, %rsp
	movq	%rdi, -2101256(%rbp)
	movl	%esi, -2101260(%rbp)
	leaq	-4096(%rbp), %rax
	leaq	var_hiscores_beginner_name(%rip), %r8
	leaq	var_hiscores_path(%rip), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-4096(%rbp), %rdx
	movl	-2101260(%rbp), %ecx
	movq	-2101256(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	snprint_scores_file
	leaq	-4096(%rbp), %rax
	leaq	var_hiscores_intermediate_name(%rip), %r8
	leaq	var_hiscores_path(%rip), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-4096(%rbp), %rdx
	movl	-2101260(%rbp), %ecx
	leaq	-1052672(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	snprint_scores_file
	movl	-2101260(%rbp), %eax
	movslq	%eax, %rsi
	leaq	-1052672(%rbp), %rcx
	movq	-2101256(%rbp), %rdx
	leaq	-2101248(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movl	-2101260(%rbp), %eax
	movslq	%eax, %rsi
	leaq	-2101248(%rbp), %rdx
	movq	-2101256(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-4096(%rbp), %rax
	leaq	var_hiscores_expert_name(%rip), %r8
	leaq	var_hiscores_path(%rip), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-4096(%rbp), %rdx
	movl	-2101260(%rbp), %ecx
	leaq	-1052672(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	snprint_scores_file
	movl	-2101260(%rbp), %eax
	movslq	%eax, %rsi
	leaq	-1052672(%rbp), %rcx
	movq	-2101256(%rbp), %rdx
	leaq	-2101248(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movl	-2101260(%rbp), %eax
	movslq	%eax, %rsi
	leaq	-2101248(%rbp), %rdx
	movq	-2101256(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	snprint_scores, .-snprint_scores
	.section	.rodata
.LC28:
	.string	"r"
.LC29:
	.string	"%[^\n]s"
.LC30:
	.string	" "
	.align 8
.LC31:
	.string	"_______________________________________________________\n%s\n\nname\tdate\t\tclicks\ttime\t\tfile\n\n"
.LC32:
	.string	"name\t%s "
.LC33:
	.string	"date\t%*i "
.LC34:
	.string	"{ "
.LC35:
	.string	"\tisdst\t%*i "
.LC36:
	.string	"\tyday\t%*i "
.LC37:
	.string	"\twday\t%*i "
.LC38:
	.string	"\tyear\t%i "
.LC39:
	.string	"\tmon\t%i "
.LC40:
	.string	"\tmday\t%i "
.LC41:
	.string	"\thour\t%*i "
.LC42:
	.string	"\tmin\t%*i "
.LC43:
	.string	"\tsec\t%*i "
.LC44:
	.string	"} "
.LC45:
	.string	"time\t%i "
.LC46:
	.string	"clicks\t%i "
.LC47:
	.string	"file\t%s "
	.align 8
.LC48:
	.string	"%s%s\n\t%4i/%2i/%2i\t%i\t%i:%02i:%02i\t\t%s\n\n"
	.text
	.type	snprint_scores_file, @function
snprint_scores_file:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1054816, %rsp
	movq	%rdi, -1054792(%rbp)
	movl	%esi, -1054796(%rbp)
	movq	%rdx, -1054808(%rbp)
	movq	-1054808(%rbp), %rax
	leaq	.LC28(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L14
	leaq	-1049632(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC29(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	-1054796(%rbp), %eax
	movslq	%eax, %rsi
	leaq	-1049632(%rbp), %rdx
	movq	-1054792(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC31(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	jmp	.L12
.L13:
	movq	-8(%rbp), %rdx
	movl	-12(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	ungetc@PLT
	leaq	-1050656(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC33(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC34(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC35(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC36(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC37(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	leaq	-1050660(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC38(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	leaq	-1050664(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC39(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	leaq	-1050668(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC40(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC41(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC42(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC43(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC44(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	leaq	-1050672(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC45(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	leaq	-1050676(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC46(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	leaq	-1054784(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC47(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	-1050660(%rbp), %eax
	addl	$1900, %eax
	movl	%eax, -1050660(%rbp)
	movl	-1050672(%rbp), %ecx
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
	movl	%eax, -16(%rbp)
	movl	-1050672(%rbp), %esi
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
	movl	%esi, %ecx
	subl	%eax, %ecx
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
	movl	%eax, -20(%rbp)
	movl	-1050672(%rbp), %ecx
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
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	imull	$60, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -24(%rbp)
	movl	-1050676(%rbp), %esi
	movl	-1050668(%rbp), %ecx
	movl	-1050664(%rbp), %eax
	leal	1(%rax), %r10d
	movl	-1050660(%rbp), %r9d
	leaq	-1050656(%rbp), %r8
	movq	-1054792(%rbp), %rdx
	leaq	-1048608(%rbp), %rax
	subq	$8, %rsp
	leaq	-1054784(%rbp), %rdi
	pushq	%rdi
	movl	-24(%rbp), %edi
	pushq	%rdi
	movl	-20(%rbp), %edi
	pushq	%rdi
	movl	-16(%rbp), %edi
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r10
	movq	%rdx, %rcx
	leaq	.LC48(%rip), %rdx
	movl	$1048576, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	addq	$64, %rsp
	leaq	-1048608(%rbp), %rdx
	movq	-1054792(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC27(%rip), %rdx
	movl	$1048576, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
.L12:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_IO_getc@PLT
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L13
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L14:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	snprint_scores_file, .-snprint_scores_file
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
