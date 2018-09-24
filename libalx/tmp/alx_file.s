	.file	"alx_file.c"
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"\302\241 FILE is too big !"
.LC2:
	.string	"\302\241 FILE error !"
.LC3:
	.string	" errno = %i;\n"
.LC4:
	.string	"%s"
	.text
	.globl	alx_snprint_file
	.type	alx_snprint_file, @function
alx_snprint_file:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1048624, %rsp
	movq	%rdi, -1048600(%rbp)
	movl	%esi, -1048604(%rbp)
	movq	%rdx, -1048616(%rbp)
	movq	-1048616(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L2
	movq	-8(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	ftell@PLT
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	cmpq	$1048575, -16(%rbp)
	jg	.L3
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rcx
	leaq	-1048592(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	leaq	-1048592(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	jmp	.L4
.L3:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L4:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L5
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L5:
	movl	-1048604(%rbp), %eax
	movslq	%eax, %rsi
	leaq	-1048592(%rbp), %rdx
	movq	-1048600(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	alx_snprint_file, .-alx_snprint_file
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
