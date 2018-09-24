	.file	"alx_input.c"
	.section	.rodata
.LC0:
	.string	" %lf"
	.text
	.globl	alx_sscan_dbl
	.type	alx_sscan_dbl, @function
alx_sscan_dbl:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movsd	%xmm0, -32(%rbp)
	movsd	%xmm1, -40(%rbp)
	movsd	%xmm2, -48(%rbp)
	movq	%rsi, -56(%rbp)
	movq	-24(%rbp), %rdx
	movq	-56(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	cmpl	$1, %eax
	je	.L2
	movl	$2, -4(%rbp)
	jmp	.L3
.L2:
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	-32(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L4
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm0
	ucomisd	-48(%rbp), %xmm0
	jbe	.L9
.L4:
	movl	$1, -4(%rbp)
	jmp	.L3
.L9:
	movl	$0, -4(%rbp)
.L3:
	cmpl	$0, -4(%rbp)
	je	.L7
	movq	-24(%rbp), %rax
	movsd	-40(%rbp), %xmm0
	movsd	%xmm0, (%rax)
.L7:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	alx_sscan_dbl, .-alx_sscan_dbl
	.section	.rodata
.LC1:
	.string	" %li"
	.text
	.globl	alx_sscan_int
	.type	alx_sscan_int, @function
alx_sscan_int:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movsd	%xmm0, -32(%rbp)
	movq	%rsi, -40(%rbp)
	movsd	%xmm1, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-24(%rbp), %rdx
	movq	-56(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	cmpl	$1, %eax
	je	.L11
	movl	$2, -4(%rbp)
	jmp	.L12
.L11:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	-32(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L13
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	ucomisd	-48(%rbp), %xmm0
	jbe	.L18
.L13:
	movl	$1, -4(%rbp)
	jmp	.L12
.L18:
	movl	$0, -4(%rbp)
.L12:
	cmpl	$0, -4(%rbp)
	je	.L16
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, (%rax)
.L16:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	alx_sscan_int, .-alx_sscan_int
	.section	.rodata
.LC2:
	.string	" %s "
.LC3:
	.string	"%s%s"
.LC4:
	.string	"r"
	.text
	.globl	alx_sscan_fname
	.type	alx_sscan_fname, @function
alx_sscan_fname:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8240, %rsp
	movq	%rdi, -8216(%rbp)
	movq	%rsi, -8224(%rbp)
	movl	%edx, %eax
	movq	%rcx, -8240(%rbp)
	movb	%al, -8228(%rbp)
	leaq	-4112(%rbp), %rdx
	movq	-8240(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	cmpl	$1, %eax
	je	.L20
	movl	$2, -4(%rbp)
	jmp	.L21
.L20:
	leaq	-4112(%rbp), %rcx
	movq	-8216(%rbp), %rdx
	leaq	-8208(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC3(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-8208(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpb	$0, -8228(%rbp)
	je	.L22
	cmpq	$0, -16(%rbp)
	jne	.L23
	movl	$3, -4(%rbp)
	jmp	.L21
.L23:
	movl	$0, -4(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L21
.L22:
	cmpq	$0, -16(%rbp)
	jne	.L25
	movl	$0, -4(%rbp)
	jmp	.L21
.L25:
	movl	$3, -4(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L21:
	cmpl	$0, -4(%rbp)
	jne	.L26
	leaq	-4112(%rbp), %rdx
	movq	-8224(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
.L26:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	alx_sscan_fname, .-alx_sscan_fname
	.section	.rodata
	.align 8
.LC5:
	.string	"Introduce a real number [%lf U %lf] (default %lf):...\t"
	.text
	.globl	alx_getdbl
	.type	alx_getdbl, @function
alx_getdbl:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movsd	%xmm0, -216(%rbp)
	movsd	%xmm1, -224(%rbp)
	movsd	%xmm2, -232(%rbp)
	movq	%rdi, -240(%rbp)
	movq	%rsi, -248(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L34
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L34:
	movl	$16, -208(%rbp)
	movl	$96, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	cmpq	$0, -240(%rbp)
	je	.L30
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L30:
	cmpq	$0, -248(%rbp)
	jne	.L31
	movsd	-224(%rbp), %xmm1
	movsd	-232(%rbp), %xmm0
	movq	-216(%rbp), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, -256(%rbp)
	movsd	-256(%rbp), %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$3, %eax
	call	printf@PLT
	jmp	.L32
.L31:
	leaq	-208(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vprintf@PLT
.L32:
	movsd	-232(%rbp), %xmm1
	movsd	-224(%rbp), %xmm0
	movq	-216(%rbp), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, -256(%rbp)
	movsd	-256(%rbp), %xmm0
	call	loop_getdbl
	movq	%xmm0, %rax
	movq	%rax, -184(%rbp)
	movsd	-184(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	alx_getdbl, .-alx_getdbl
	.section	.rodata
	.align 8
.LC6:
	.string	"Introduce an integer number [%lf U %lf] (default %li):...\t"
	.text
	.globl	alx_getint
	.type	alx_getint, @function
alx_getint:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movsd	%xmm0, -216(%rbp)
	movq	%rdi, -224(%rbp)
	movsd	%xmm1, -232(%rbp)
	movq	%rsi, -240(%rbp)
	movq	%rdx, -248(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L41
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L41:
	movl	$24, -208(%rbp)
	movl	$80, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	cmpq	$0, -240(%rbp)
	je	.L37
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L37:
	cmpq	$0, -248(%rbp)
	jne	.L38
	movq	-224(%rbp), %rdx
	movsd	-232(%rbp), %xmm0
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movapd	%xmm0, %xmm1
	movq	%rax, -256(%rbp)
	movsd	-256(%rbp), %xmm0
	leaq	.LC6(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	jmp	.L39
.L38:
	leaq	-208(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vprintf@PLT
.L39:
	movsd	-232(%rbp), %xmm0
	movq	-224(%rbp), %rdx
	movq	-216(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rdx, %rdi
	movq	%rax, -256(%rbp)
	movsd	-256(%rbp), %xmm0
	call	loop_getint
	movq	%rax, -184(%rbp)
	movq	-184(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	alx_getint, .-alx_getint
	.type	loop_getdbl, @function
loop_getdbl:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1088, %rsp
	movsd	%xmm0, -1064(%rbp)
	movsd	%xmm1, -1072(%rbp)
	movsd	%xmm2, -1080(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L43
.L49:
	movq	stdin(%rip), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L44
	movl	$4, -8(%rbp)
	jmp	.L45
.L44:
	leaq	-1040(%rbp), %rcx
	movsd	-1080(%rbp), %xmm1
	movsd	-1072(%rbp), %xmm0
	movq	-1064(%rbp), %rdx
	leaq	-1048(%rbp), %rax
	movq	%rcx, %rsi
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, -1088(%rbp)
	movsd	-1088(%rbp), %xmm0
	movq	%rax, %rdi
	call	alx_sscan_dbl
	movl	%eax, -8(%rbp)
.L45:
	cmpl	$0, -8(%rbp)
	je	.L51
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	manage_error
	addl	$1, -4(%rbp)
.L43:
	cmpl	$1, -4(%rbp)
	jle	.L49
	jmp	.L48
.L51:
	nop
.L48:
	movsd	-1048(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	loop_getdbl, .-loop_getdbl
	.type	loop_getint, @function
loop_getint:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1088, %rsp
	movsd	%xmm0, -1064(%rbp)
	movq	%rdi, -1072(%rbp)
	movsd	%xmm1, -1080(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L53
.L59:
	movq	stdin(%rip), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L54
	movl	$4, -8(%rbp)
	jmp	.L55
.L54:
	leaq	-1040(%rbp), %rdx
	movsd	-1080(%rbp), %xmm0
	movq	-1072(%rbp), %rsi
	movq	-1064(%rbp), %rcx
	leaq	-1048(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rcx, -1088(%rbp)
	movsd	-1088(%rbp), %xmm0
	movq	%rax, %rdi
	call	alx_sscan_int
	movl	%eax, -8(%rbp)
.L55:
	cmpl	$0, -8(%rbp)
	je	.L61
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	manage_error
	addl	$1, -4(%rbp)
.L53:
	cmpl	$1, -4(%rbp)
	jle	.L59
	jmp	.L58
.L61:
	nop
.L58:
	movq	-1048(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	loop_getint, .-loop_getint
	.section	.rodata
.LC7:
	.string	"\302\241 Number is out of range !"
.LC8:
	.string	"\302\241 sscanf() error !"
.LC9:
	.string	"\302\241 fgets() error !"
	.text
	.type	manage_error, @function
manage_error:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	$2, %eax
	je	.L64
	cmpl	$4, %eax
	je	.L65
	cmpl	$1, %eax
	je	.L66
	jmp	.L67
.L66:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	jmp	.L63
.L64:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	jmp	.L63
.L65:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	nop
.L63:
.L67:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	manage_error, .-manage_error
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
