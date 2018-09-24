	.file	"menu_clui.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"Read 'Disclaimer of warranty'? (yes/NO): "
.LC1:
	.string	" %c"
.LC2:
	.string	" >yes"
.LC3:
	.string	" >NO"
.LC4:
	.string	"Read 'License'? (yes/NO): "
	.align 8
.LC5:
	.string	"New game or load game? (NEW/load): "
.LC6:
	.string	" >load"
.LC7:
	.string	" >NEW"
	.text
	.globl	menu_clui
	.type	menu_clui, @function
menu_clui:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1040, %rsp
	movb	$110, -1025(%rbp)
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-1024(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1025(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1025(%rbp), %eax
	cmpb	$121, %al
	je	.L2
	movzbl	-1025(%rbp), %eax
	cmpb	$89, %al
	jne	.L3
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	print_share_file@PLT
	jmp	.L4
.L3:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
.L4:
	movb	$110, -1025(%rbp)
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-1024(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1025(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1025(%rbp), %eax
	cmpb	$121, %al
	je	.L5
	movzbl	-1025(%rbp), %eax
	cmpb	$89, %al
	jne	.L6
.L5:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$3, %edi
	call	print_share_file@PLT
	jmp	.L7
.L6:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
.L7:
	movb	$110, -1025(%rbp)
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-1024(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1025(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1025(%rbp), %eax
	cmpb	$108, %al
	je	.L8
	movzbl	-1025(%rbp), %eax
	cmpb	$76, %al
	jne	.L9
.L8:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	call	menu_clui_load
	jmp	.L10
.L9:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	call	menu_clui_rand
.L10:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	menu_clui, .-menu_clui
	.section	.rodata
	.align 8
.LC8:
	.string	"Set seed for random generator? (yes/NO): "
.LC9:
	.string	"Seed:"
	.align 8
.LC12:
	.string	"Level? (BEGINNER/intermediate/(expert)/custom): "
.LC13:
	.string	" >intermediate"
.LC14:
	.string	" >expert"
.LC15:
	.string	" >custom"
.LC16:
	.string	" >BEGINNER"
	.text
	.type	menu_clui_rand, @function
menu_clui_rand:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1072, %rsp
	movl	$1, start_mode(%rip)
	movb	$110, -1041(%rbp)
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1041(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1041(%rbp), %eax
	cmpb	$121, %al
	je	.L12
	movzbl	-1041(%rbp), %eax
	cmpb	$89, %al
	jne	.L13
.L12:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movsd	.LC10(%rip), %xmm0
	movq	.LC11(%rip), %rax
	movl	$0, %edx
	leaq	.LC9(%rip), %rsi
	movapd	%xmm0, %xmm1
	movl	$1, %edi
	movq	%rax, -1064(%rbp)
	movsd	-1064(%rbp), %xmm0
	movl	$2, %eax
	call	alx_getint@PLT
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	srand@PLT
	jmp	.L14
.L13:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
.L14:
	movb	$98, -1041(%rbp)
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1041(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1041(%rbp), %eax
	cmpb	$105, %al
	je	.L15
	movzbl	-1041(%rbp), %eax
	cmpb	$73, %al
	jne	.L16
.L15:
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	movl	$1, menu_iface_variables(%rip)
	call	menu_clui_start
	jmp	.L17
.L16:
	movzbl	-1041(%rbp), %eax
	cmpb	$101, %al
	je	.L18
	movzbl	-1041(%rbp), %eax
	cmpb	$69, %al
	jne	.L19
.L18:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	movl	$3, menu_iface_variables(%rip)
	call	menu_clui_start
	jmp	.L17
.L19:
	movzbl	-1041(%rbp), %eax
	cmpb	$99, %al
	je	.L20
	movzbl	-1041(%rbp), %eax
	cmpb	$67, %al
	jne	.L21
.L20:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movl	$4, menu_iface_variables(%rip)
	call	menu_clui_custom
	jmp	.L17
.L21:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movl	$0, menu_iface_variables(%rip)
	call	menu_clui_start
.L17:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	menu_clui_rand, .-menu_clui_rand
	.section	.rodata
.LC17:
	.string	"Rows:"
.LC20:
	.string	"Columns:"
.LC22:
	.string	"Proportion:"
	.text
	.type	menu_clui_custom, @function
menu_clui_custom:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$1, start_mode(%rip)
	movl	4+menu_iface_variables(%rip), %eax
	movslq	%eax, %rcx
	movsd	.LC18(%rip), %xmm0
	movq	.LC19(%rip), %rax
	movl	$0, %edx
	leaq	.LC17(%rip), %rsi
	movapd	%xmm0, %xmm1
	movq	%rcx, %rdi
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movl	$2, %eax
	call	alx_getint@PLT
	movl	%eax, 4+menu_iface_variables(%rip)
	movl	8+menu_iface_variables(%rip), %eax
	movslq	%eax, %rcx
	movsd	.LC21(%rip), %xmm0
	movq	.LC19(%rip), %rax
	movl	$0, %edx
	leaq	.LC20(%rip), %rsi
	movapd	%xmm0, %xmm1
	movq	%rcx, %rdi
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movl	$2, %eax
	call	alx_getint@PLT
	movl	%eax, 8+menu_iface_variables(%rip)
	movsd	16+menu_iface_variables(%rip), %xmm0
	movl	$0, %esi
	leaq	.LC22(%rip), %rdi
	movsd	.LC23(%rip), %xmm2
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	movl	$3, %eax
	call	alx_getdbl@PLT
	movq	%xmm0, %rax
	movq	%rax, 16+menu_iface_variables(%rip)
	call	menu_clui_start
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	menu_clui_custom, .-menu_clui_custom
	.type	menu_clui_load, @function
menu_clui_load:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$2, start_mode(%rip)
	call	menu_clui_start
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	menu_clui_load, .-menu_clui_load
	.section	.rodata
.LC25:
	.string	" >>START:"
	.align 8
.LC26:
	.string	"Play again? (MENU/play/exit): "
.LC27:
	.string	" >play"
.LC28:
	.string	" >exit!"
.LC29:
	.string	" >MENU"
	.text
	.type	menu_clui_start, @function
menu_clui_start:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1040, %rsp
	leaq	.LC25(%rip), %rdi
	call	puts@PLT
	call	start_switch@PLT
	movb	$109, -1025(%rbp)
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-1024(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1025(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movzbl	-1025(%rbp), %eax
	cmpb	$112, %al
	je	.L25
	movzbl	-1025(%rbp), %eax
	cmpb	$80, %al
	jne	.L26
.L25:
	leaq	.LC27(%rip), %rdi
	call	puts@PLT
	call	menu_clui_start
	jmp	.L27
.L26:
	movzbl	-1025(%rbp), %eax
	cmpb	$101, %al
	je	.L28
	movzbl	-1025(%rbp), %eax
	cmpb	$69, %al
	jne	.L29
.L28:
	leaq	.LC28(%rip), %rdi
	call	puts@PLT
	jmp	.L27
.L29:
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	call	menu_clui
.L27:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	menu_clui_start, .-menu_clui_start
	.section	.rodata
	.align 8
.LC10:
	.long	0
	.long	2146435072
	.align 8
.LC11:
	.long	0
	.long	-1048576
	.align 8
.LC18:
	.long	0
	.long	1079558144
	.align 8
.LC19:
	.long	0
	.long	1073741824
	.align 8
.LC21:
	.long	0
	.long	1077542912
	.align 8
.LC23:
	.long	0
	.long	1072693248
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
