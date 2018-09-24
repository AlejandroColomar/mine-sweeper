	.file	"menu_tui.c"
	.section	.rodata
.LC0:
	.string	"[0]\tExit program"
.LC1:
	.string	"[1]\tContinue"
.LC2:
	.string	"[2]\tDisclaimer of warranty"
.LC3:
	.string	"[3]\tTerms and conditions"
.LC4:
	.string	"MENU:"
	.text
	.globl	menu_tui
	.type	menu_tui, @function
menu_tui:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	call	alx_resume_curses@PLT
	movl	$10, -8(%rbp)
	movl	$34, -12(%rbp)
	movl	$4, -16(%rbp)
	movl	$7, -96(%rbp)
	movl	$4, -92(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, -88(%rbp)
	movl	$2, -80(%rbp)
	movl	$4, -76(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -72(%rbp)
	movl	$4, -64(%rbp)
	movl	$4, -60(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, -56(%rbp)
	movl	$5, -48(%rbp)
	movl	$4, -44(%rbp)
	leaq	.LC3(%rip), %rax
	movq	%rax, -40(%rbp)
	movb	$1, -1(%rbp)
	jmp	.L2
.L8:
	leaq	-96(%rbp), %rcx
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %esi
	movl	-8(%rbp), %eax
	leaq	.LC4(%rip), %r8
	movl	%eax, %edi
	call	alx_menu@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	cmpl	$1, %eax
	je	.L3
	cmpl	$1, %eax
	jg	.L4
	testl	%eax, %eax
	je	.L5
	jmp	.L2
.L4:
	cmpl	$2, %eax
	je	.L6
	cmpl	$3, %eax
	je	.L7
	jmp	.L2
.L5:
	movb	$0, -1(%rbp)
	jmp	.L2
.L3:
	call	menu_tui_continue
	jmp	.L2
.L6:
	call	alx_pause_curses@PLT
	movl	$1, %edi
	call	print_share_file@PLT
	call	getchar@PLT
	call	alx_resume_curses@PLT
	jmp	.L2
.L7:
	call	alx_pause_curses@PLT
	movl	$3, %edi
	call	print_share_file@PLT
	call	getchar@PLT
	call	alx_resume_curses@PLT
	nop
.L2:
	cmpb	$0, -1(%rbp)
	jne	.L8
	call	alx_pause_curses@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	menu_tui, .-menu_tui
	.section	.rodata
.LC5:
	.string	"[0]\tBack"
.LC6:
	.string	"[1]\tStart"
.LC7:
	.string	"[2]\tSelect map"
.LC8:
	.string	"[3]\tChange difficulty"
.LC9:
	.string	"[4]\tChange file name"
.LC10:
	.string	"[5]\tHi scores"
.LC11:
	.string	"File name:"
.LC12:
	.string	"%s (File: \"%s\")"
.LC13:
	.string	"CONTINUE:"
.LC14:
	.string	"%s"
	.text
	.type	menu_tui_continue, @function
menu_tui_continue:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1048736, %rsp
	movl	$18, -8(%rbp)
	movl	$50, -12(%rbp)
	movl	$1, -16(%rbp)
	movl	$80, %eax
	subl	-12(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%rbp)
	movl	$6, -24(%rbp)
	movl	$11, -1048720(%rbp)
	movl	$4, -1048716(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, -1048712(%rbp)
	movl	$2, -1048704(%rbp)
	movl	$4, -1048700(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, -1048696(%rbp)
	movl	$4, -1048688(%rbp)
	movl	$4, -1048684(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, -1048680(%rbp)
	movl	$5, -1048672(%rbp)
	movl	$4, -1048668(%rbp)
	leaq	.LC8(%rip), %rax
	movq	%rax, -1048664(%rbp)
	movl	$6, -1048656(%rbp)
	movl	$4, -1048652(%rbp)
	leaq	.LC9(%rip), %rax
	movq	%rax, -1048648(%rbp)
	movl	$7, -1048640(%rbp)
	movl	$4, -1048636(%rbp)
	leaq	.LC10(%rip), %rax
	movq	%rax, -1048632(%rbp)
	movl	-12(%rbp), %eax
	subl	$8, %eax
	movl	%eax, -28(%rbp)
	movl	-16(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	subl	$5, %eax
	movl	%eax, -32(%rbp)
	leaq	.LC11(%rip), %rax
	movq	%rax, -1048728(%rbp)
	movb	$1, -1(%rbp)
	jmp	.L10
.L18:
	movl	-20(%rbp), %ecx
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %esi
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -40(%rbp)
	movq	-1048648(%rbp), %rcx
	movl	-1048652(%rbp), %edx
	movl	-1048656(%rbp), %esi
	movq	-40(%rbp), %rax
	leaq	saved_name(%rip), %r9
	movq	%rcx, %r8
	leaq	.LC12(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	mvwprintw@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	leaq	-1048720(%rbp), %rdx
	movl	-24(%rbp), %esi
	movq	-40(%rbp), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rax, %rdi
	call	alx_menu_2@PLT
	movl	%eax, -44(%rbp)
	cmpl	$5, -44(%rbp)
	ja	.L10
	movl	-44(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L12(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L12(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L12:
	.long	.L11-.L12
	.long	.L13-.L12
	.long	.L14-.L12
	.long	.L15-.L12
	.long	.L16-.L12
	.long	.L17-.L12
	.text
.L11:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	movb	$0, -1(%rbp)
	jmp	.L10
.L13:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	call	alx_pause_curses@PLT
	call	start_switch@PLT
	call	alx_resume_curses@PLT
	jmp	.L10
.L14:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	call	menu_tui_select
	jmp	.L10
.L15:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	call	menu_tui_level
	jmp	.L10
.L16:
	call	save_clr@PLT
	movq	-1048728(%rbp), %rcx
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %eax
	subq	$8, %rsp
	pushq	$0
	movq	%rcx, %r9
	movl	%edx, %r8d
	movl	%eax, %ecx
	movl	$1, %edx
	leaq	saved_name(%rip), %rsi
	leaq	saved_path(%rip), %rdi
	movl	$0, %eax
	call	alx_w_getfname@PLT
	addq	$16, %rsp
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	jmp	.L10
.L17:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	call	alx_pause_curses@PLT
	leaq	-1048624(%rbp), %rax
	movl	$1048576, %esi
	movq	%rax, %rdi
	call	snprint_scores@PLT
	leaq	-1048624(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	call	getchar@PLT
	call	alx_resume_curses@PLT
	nop
.L10:
	cmpb	$0, -1(%rbp)
	jne	.L18
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	menu_tui_continue, .-menu_tui_continue
	.section	.rodata
.LC15:
	.string	"[1]\tNew map"
.LC16:
	.string	"[2]\tLoad map"
.LC17:
	.string	"SELECT MAP:"
	.text
	.type	menu_tui_select, @function
menu_tui_select:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	$9, -4(%rbp)
	movl	$70, -8(%rbp)
	movl	$1, -12(%rbp)
	movl	$80, %eax
	subl	-8(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -16(%rbp)
	movl	$3, -20(%rbp)
	movl	$6, -96(%rbp)
	movl	$4, -92(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, -88(%rbp)
	movl	$2, -80(%rbp)
	movl	$4, -76(%rbp)
	leaq	.LC15(%rip), %rax
	movq	%rax, -72(%rbp)
	movl	$4, -64(%rbp)
	movl	$4, -60(%rbp)
	leaq	.LC16(%rip), %rax
	movq	%rax, -56(%rbp)
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rcx
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %esi
	movq	-32(%rbp), %rax
	leaq	saved_name(%rip), %r9
	movq	%rcx, %r8
	leaq	.LC12(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	mvwprintw@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	leaq	-96(%rbp), %rdx
	movl	-20(%rbp), %esi
	movq	-32(%rbp), %rax
	leaq	.LC17(%rip), %rcx
	movq	%rax, %rdi
	call	alx_menu_2@PLT
	movl	%eax, -36(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	movl	-36(%rbp), %eax
	cmpl	$1, %eax
	je	.L21
	cmpl	$2, %eax
	je	.L22
	jmp	.L23
.L21:
	movl	$1, start_mode(%rip)
	jmp	.L20
.L22:
	movl	$2, start_mode(%rip)
	nop
.L20:
.L23:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	menu_tui_select, .-menu_tui_select
	.section	.rodata
.LC18:
	.string	"[1]\tBeginner"
.LC19:
	.string	"[2]\tIntermediate"
.LC20:
	.string	"[3]\tExpert"
.LC21:
	.string	"[4]\tCustom"
.LC22:
	.string	"SELECT LEVEL:"
	.text
	.type	menu_tui_level, @function
menu_tui_level:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	$10, -4(%rbp)
	movl	$70, -8(%rbp)
	movl	$5, -12(%rbp)
	movl	$7, -96(%rbp)
	movl	$4, -92(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, -88(%rbp)
	movl	$2, -80(%rbp)
	movl	$4, -76(%rbp)
	leaq	.LC18(%rip), %rax
	movq	%rax, -72(%rbp)
	movl	$3, -64(%rbp)
	movl	$4, -60(%rbp)
	leaq	.LC19(%rip), %rax
	movq	%rax, -56(%rbp)
	movl	$4, -48(%rbp)
	movl	$4, -44(%rbp)
	leaq	.LC20(%rip), %rax
	movq	%rax, -40(%rbp)
	movl	$5, -32(%rbp)
	movl	$4, -28(%rbp)
	leaq	.LC21(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	-96(%rbp), %rcx
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %eax
	leaq	.LC22(%rip), %r8
	movl	%eax, %edi
	call	alx_menu@PLT
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	cmpl	$2, %eax
	je	.L26
	cmpl	$2, %eax
	jg	.L27
	cmpl	$1, %eax
	je	.L28
	jmp	.L31
.L27:
	cmpl	$3, %eax
	je	.L29
	cmpl	$4, %eax
	je	.L30
	jmp	.L31
.L28:
	movl	$0, menu_iface_variables(%rip)
	jmp	.L25
.L26:
	movl	$1, menu_iface_variables(%rip)
	jmp	.L25
.L29:
	movl	$2, menu_iface_variables(%rip)
	jmp	.L25
.L30:
	movl	$4, menu_iface_variables(%rip)
	call	menu_tui_custom
	nop
.L25:
.L31:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	menu_tui_level, .-menu_tui_level
	.section	.rodata
.LC23:
	.string	"[1]\tChange rows:"
.LC24:
	.string	"[2]\tChange columns:"
	.align 8
.LC25:
	.string	"[3]\tChange proportion of mines:"
.LC26:
	.string	"Rows:"
.LC27:
	.string	"Columns:"
.LC28:
	.string	"Proportion:"
.LC29:
	.string	"%s rows\t\t(%i)"
.LC30:
	.string	"%s cols\t\t(%i)"
.LC31:
	.string	"%s p\t(%lf)"
.LC32:
	.string	"Custom:"
	.text
	.type	menu_tui_custom, @function
menu_tui_custom:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movl	$16, -8(%rbp)
	movl	$76, -12(%rbp)
	movl	$1, -16(%rbp)
	movl	$80, %eax
	subl	-12(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%rbp)
	movl	$4, -24(%rbp)
	movl	$8, -112(%rbp)
	movl	$4, -108(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, -104(%rbp)
	movl	$2, -96(%rbp)
	movl	$4, -92(%rbp)
	leaq	.LC23(%rip), %rax
	movq	%rax, -88(%rbp)
	movl	$4, -80(%rbp)
	movl	$4, -76(%rbp)
	leaq	.LC24(%rip), %rax
	movq	%rax, -72(%rbp)
	movl	$6, -64(%rbp)
	movl	$4, -60(%rbp)
	leaq	.LC25(%rip), %rax
	movq	%rax, -56(%rbp)
	movl	-12(%rbp), %eax
	subl	$8, %eax
	movl	%eax, -28(%rbp)
	movl	-16(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	subl	$5, %eax
	movl	%eax, -32(%rbp)
	leaq	.LC26(%rip), %rax
	movq	%rax, -144(%rbp)
	leaq	.LC27(%rip), %rax
	movq	%rax, -136(%rbp)
	leaq	.LC28(%rip), %rax
	movq	%rax, -128(%rbp)
	movl	-20(%rbp), %ecx
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %esi
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -40(%rbp)
	movb	$1, -1(%rbp)
	jmp	.L33
.L39:
	movl	4+menu_iface_variables(%rip), %edi
	movq	-88(%rbp), %rcx
	movl	-92(%rbp), %edx
	movl	-96(%rbp), %esi
	movq	-40(%rbp), %rax
	movl	%edi, %r9d
	movq	%rcx, %r8
	leaq	.LC29(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	mvwprintw@PLT
	movl	8+menu_iface_variables(%rip), %edi
	movq	-72(%rbp), %rcx
	movl	-76(%rbp), %edx
	movl	-80(%rbp), %esi
	movq	-40(%rbp), %rax
	movl	%edi, %r9d
	movq	%rcx, %r8
	leaq	.LC30(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	mvwprintw@PLT
	movq	16+menu_iface_variables(%rip), %rcx
	movq	-56(%rbp), %rdi
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %esi
	movq	-40(%rbp), %rax
	movq	%rcx, -152(%rbp)
	movsd	-152(%rbp), %xmm0
	movq	%rdi, %r8
	leaq	.LC31(%rip), %rcx
	movq	%rax, %rdi
	movl	$1, %eax
	call	mvwprintw@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	leaq	-112(%rbp), %rdx
	movl	-24(%rbp), %esi
	movq	-40(%rbp), %rax
	leaq	.LC32(%rip), %rcx
	movq	%rax, %rdi
	call	alx_menu_2@PLT
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	cmpl	$1, %eax
	je	.L34
	cmpl	$1, %eax
	jg	.L35
	testl	%eax, %eax
	je	.L36
	jmp	.L33
.L35:
	cmpl	$2, %eax
	je	.L37
	cmpl	$3, %eax
	je	.L38
	jmp	.L33
.L36:
	movb	$0, -1(%rbp)
	jmp	.L33
.L34:
	movl	4+menu_iface_variables(%rip), %eax
	movslq	%eax, %rcx
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	-144(%rbp,%rax,8), %rdx
	movsd	.LC33(%rip), %xmm0
	movq	.LC34(%rip), %rdi
	movl	-32(%rbp), %esi
	movl	-28(%rbp), %eax
	movl	$0, %r8d
	movapd	%xmm0, %xmm1
	movq	%rdi, -152(%rbp)
	movsd	-152(%rbp), %xmm0
	movl	%eax, %edi
	movl	$2, %eax
	call	alx_w_getint@PLT
	movl	%eax, 4+menu_iface_variables(%rip)
	jmp	.L33
.L37:
	movl	8+menu_iface_variables(%rip), %eax
	movslq	%eax, %rcx
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	-144(%rbp,%rax,8), %rdx
	movsd	.LC35(%rip), %xmm0
	movq	.LC34(%rip), %rdi
	movl	-32(%rbp), %esi
	movl	-28(%rbp), %eax
	movl	$0, %r8d
	movapd	%xmm0, %xmm1
	movq	%rdi, -152(%rbp)
	movsd	-152(%rbp), %xmm0
	movl	%eax, %edi
	movl	$2, %eax
	call	alx_w_getint@PLT
	movl	%eax, 8+menu_iface_variables(%rip)
	jmp	.L33
.L38:
	movsd	16+menu_iface_variables(%rip), %xmm0
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	-144(%rbp,%rax,8), %rdx
	movl	-32(%rbp), %esi
	movl	-28(%rbp), %eax
	movl	$0, %ecx
	movsd	.LC36(%rip), %xmm2
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	movl	%eax, %edi
	movl	$3, %eax
	call	alx_w_getdbl@PLT
	movq	%xmm0, %rax
	movq	%rax, 16+menu_iface_variables(%rip)
	nop
.L33:
	cmpb	$0, -1(%rbp)
	jne	.L39
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	menu_tui_custom, .-menu_tui_custom
	.section	.rodata
.LC38:
	.string	"[1]\tChange seed (srand)"
.LC39:
	.string	"Seed:"
.LC40:
	.string	"DEVELOPER OPTIONS:"
	.text
	.type	menu_tui_devel, @function
menu_tui_devel:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movl	$12, -8(%rbp)
	movl	$50, -12(%rbp)
	movl	$1, -16(%rbp)
	movl	$80, %eax
	subl	-12(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%rbp)
	movl	$2, -24(%rbp)
	movl	$5, -80(%rbp)
	movl	$4, -76(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, -72(%rbp)
	movl	$2, -64(%rbp)
	movl	$4, -60(%rbp)
	leaq	.LC38(%rip), %rax
	movq	%rax, -56(%rbp)
	movl	-12(%rbp), %eax
	subl	$8, %eax
	movl	%eax, -28(%rbp)
	movl	-16(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	subl	$5, %eax
	movl	%eax, -32(%rbp)
	leaq	.LC39(%rip), %rax
	movq	%rax, -88(%rbp)
	movl	-20(%rbp), %ecx
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %esi
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -40(%rbp)
	movb	$1, -1(%rbp)
	jmp	.L41
.L44:
	leaq	-80(%rbp), %rdx
	movl	-24(%rbp), %esi
	movq	-40(%rbp), %rax
	leaq	.LC40(%rip), %rcx
	movq	%rax, %rdi
	call	alx_menu_2@PLT
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	testl	%eax, %eax
	je	.L42
	cmpl	$1, %eax
	je	.L43
	jmp	.L41
.L42:
	movb	$0, -1(%rbp)
	jmp	.L41
.L43:
	movq	-88(%rbp), %rdx
	movsd	.LC41(%rip), %xmm0
	movq	.LC42(%rip), %rdi
	movl	-32(%rbp), %esi
	movl	-28(%rbp), %eax
	movl	$0, %r8d
	movapd	%xmm0, %xmm1
	movl	$1, %ecx
	movq	%rdi, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	movl	%eax, %edi
	movl	$2, %eax
	call	alx_w_getint@PLT
	movl	%eax, -48(%rbp)
	movl	-48(%rbp), %eax
	movl	%eax, %edi
	call	srand@PLT
	nop
.L41:
	cmpb	$0, -1(%rbp)
	jne	.L44
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	menu_tui_devel, .-menu_tui_devel
	.section	.rodata
	.align 8
.LC33:
	.long	0
	.long	1077280768
	.align 8
.LC34:
	.long	0
	.long	1073741824
	.align 8
.LC35:
	.long	0
	.long	1077968896
	.align 8
.LC36:
	.long	0
	.long	1072693248
	.align 8
.LC41:
	.long	0
	.long	2146435072
	.align 8
.LC42:
	.long	0
	.long	-1048576
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
