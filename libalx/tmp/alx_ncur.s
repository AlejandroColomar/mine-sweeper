	.file	"alx_ncur.c"
	.text
	.globl	alx_start_curses
	.type	alx_start_curses, @function
alx_start_curses:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	initscr@PLT
	call	nonl@PLT
	call	cbreak@PLT
	call	noecho@PLT
	movq	stdscr(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	keypad@PLT
	call	has_colors@PLT
	testb	%al, %al
	je	.L3
	call	start_color@PLT
	call	use_default_colors@PLT
.L3:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	alx_start_curses, .-alx_start_curses
	.globl	alx_pause_curses
	.type	alx_pause_curses, @function
alx_pause_curses:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	def_prog_mode@PLT
	call	endwin@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	alx_pause_curses, .-alx_pause_curses
	.globl	alx_resume_curses
	.type	alx_resume_curses, @function
alx_resume_curses:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	call	reset_prog_mode@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	alx_resume_curses, .-alx_resume_curses
	.globl	alx_end_curses
	.type	alx_end_curses, @function
alx_end_curses:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wclear@PLT
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	call	endwin@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	alx_end_curses, .-alx_end_curses
	.globl	alx_win_del
	.type	alx_win_del, @function
alx_win_del:
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
	movl	$0, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	wclear@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	delwin@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	alx_win_del, .-alx_win_del
	.globl	alx_menu
	.type	alx_menu, @function
alx_menu:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	%edx, -44(%rbp)
	movq	%rcx, -56(%rbp)
	movq	%r8, -64(%rbp)
	movl	$1, -4(%rbp)
	movl	$80, %eax
	subl	-40(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	-40(%rbp), %esi
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -16(%rbp)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movl	-44(%rbp), %esi
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	alx_menu_2
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movl	-20(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	alx_menu, .-alx_menu
	.globl	alx_menu_2
	.type	alx_menu_2, @function
alx_menu_2:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	keypad@PLT
	call	noecho@PLT
	movq	-24(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wborder@PLT
	addq	$32, %rsp
	movq	-48(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	alx_ncur_prn_title
	movq	-40(%rbp), %rdx
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	alx_ncur_prn_menu
	movq	-40(%rbp), %rdx
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	alx_ncur_usr_sel
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	alx_menu_2, .-alx_menu_2
	.section	.rodata
	.align 8
.LC0:
	.string	"Introduce a real number [%lf U %lf] (default %lf)"
	.text
	.globl	alx_w_getdbl
	.type	alx_w_getdbl, @function
alx_w_getdbl:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$352, %rsp
	movl	%edi, -292(%rbp)
	movl	%esi, -296(%rbp)
	movq	%rdx, -304(%rbp)
	movsd	%xmm0, -312(%rbp)
	movsd	%xmm1, -320(%rbp)
	movsd	%xmm2, -328(%rbp)
	movq	%rcx, -336(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L17
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L17:
	movl	$32, -280(%rbp)
	movl	$96, -276(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -272(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -264(%rbp)
	movl	$3, -180(%rbp)
	movl	-292(%rbp), %eax
	movl	%eax, -184(%rbp)
	movl	-296(%rbp), %eax
	movl	%eax, -188(%rbp)
	movl	$80, %eax
	subl	-292(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -192(%rbp)
	movl	$1, -196(%rbp)
	movl	-184(%rbp), %eax
	subl	$4, %eax
	movl	%eax, -200(%rbp)
	movl	-188(%rbp), %eax
	addl	$3, %eax
	movl	%eax, -204(%rbp)
	movl	-192(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -208(%rbp)
	movl	$1, -212(%rbp)
	movl	-184(%rbp), %eax
	subl	$2, %eax
	movl	%eax, -216(%rbp)
	movl	-188(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -220(%rbp)
	movl	-192(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -224(%rbp)
	movl	-192(%rbp), %ecx
	movl	-188(%rbp), %edx
	movl	-184(%rbp), %esi
	movl	-180(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rax
	movl	$262144, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-232(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wborder@PLT
	addq	$32, %rsp
	movq	-304(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	alx_ncur_prn_title
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	-208(%rbp), %ecx
	movl	-204(%rbp), %edx
	movl	-200(%rbp), %esi
	movl	-196(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -240(%rbp)
	cmpq	$0, -336(%rbp)
	jne	.L14
	movsd	-320(%rbp), %xmm1
	movsd	-328(%rbp), %xmm0
	movq	-312(%rbp), %rdx
	movq	-240(%rbp), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, -344(%rbp)
	movsd	-344(%rbp), %xmm0
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$3, %eax
	call	wprintw@PLT
	jmp	.L15
.L14:
	leaq	-280(%rbp), %rdx
	movq	-336(%rbp), %rcx
	movq	-240(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vwprintw@PLT
.L15:
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	-224(%rbp), %ecx
	movl	-220(%rbp), %edx
	movl	-216(%rbp), %esi
	movl	-212(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movl	$262144, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movsd	-328(%rbp), %xmm1
	movsd	-320(%rbp), %xmm0
	movq	-312(%rbp), %rdx
	movq	-248(%rbp), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, -344(%rbp)
	movsd	-344(%rbp), %xmm0
	movq	%rax, %rdi
	call	loop_w_getdbl
	movq	%xmm0, %rax
	movq	%rax, -256(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movsd	-256(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	alx_w_getdbl, .-alx_w_getdbl
	.section	.rodata
	.align 8
.LC1:
	.string	"Introduce an integer number [%lf U %lf] (default %li)"
	.text
	.globl	alx_w_getint
	.type	alx_w_getint, @function
alx_w_getint:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$352, %rsp
	movl	%edi, -292(%rbp)
	movl	%esi, -296(%rbp)
	movq	%rdx, -304(%rbp)
	movsd	%xmm0, -312(%rbp)
	movq	%rcx, -320(%rbp)
	movsd	%xmm1, -328(%rbp)
	movq	%r8, -336(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L23
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L23:
	movl	$40, -280(%rbp)
	movl	$80, -276(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -272(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -264(%rbp)
	movl	$3, -180(%rbp)
	movl	-292(%rbp), %eax
	movl	%eax, -184(%rbp)
	movl	-296(%rbp), %eax
	movl	%eax, -188(%rbp)
	movl	$80, %eax
	subl	-292(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -192(%rbp)
	movl	$1, -196(%rbp)
	movl	-184(%rbp), %eax
	subl	$4, %eax
	movl	%eax, -200(%rbp)
	movl	-188(%rbp), %eax
	addl	$3, %eax
	movl	%eax, -204(%rbp)
	movl	-192(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -208(%rbp)
	movl	$1, -212(%rbp)
	movl	-184(%rbp), %eax
	subl	$2, %eax
	movl	%eax, -216(%rbp)
	movl	-188(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -220(%rbp)
	movl	-192(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -224(%rbp)
	movl	-192(%rbp), %ecx
	movl	-188(%rbp), %edx
	movl	-184(%rbp), %esi
	movl	-180(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rax
	movl	$262144, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-232(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wborder@PLT
	addq	$32, %rsp
	movq	-304(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	alx_ncur_prn_title
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	-208(%rbp), %ecx
	movl	-204(%rbp), %edx
	movl	-200(%rbp), %esi
	movl	-196(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -240(%rbp)
	cmpq	$0, -336(%rbp)
	jne	.L20
	movq	-320(%rbp), %rdx
	movsd	-328(%rbp), %xmm0
	movq	-312(%rbp), %rcx
	movq	-240(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rcx, -344(%rbp)
	movsd	-344(%rbp), %xmm0
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$2, %eax
	call	wprintw@PLT
	jmp	.L21
.L20:
	leaq	-280(%rbp), %rdx
	movq	-336(%rbp), %rcx
	movq	-240(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vwprintw@PLT
.L21:
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	-224(%rbp), %ecx
	movl	-220(%rbp), %edx
	movl	-216(%rbp), %esi
	movl	-212(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movl	$262144, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movsd	-328(%rbp), %xmm0
	movq	-320(%rbp), %rcx
	movq	-312(%rbp), %rdx
	movq	-248(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rcx, %rsi
	movq	%rdx, -344(%rbp)
	movsd	-344(%rbp), %xmm0
	movq	%rax, %rdi
	call	loop_w_getint
	movl	%eax, -252(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movl	-252(%rbp), %eax
	cltq
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	alx_w_getint, .-alx_w_getint
	.section	.rodata
.LC2:
	.string	"Introduce a string"
	.text
	.globl	alx_w_getstr
	.type	alx_w_getstr, @function
alx_w_getstr:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$320, %rsp
	movq	%rdi, -280(%rbp)
	movl	%esi, -284(%rbp)
	movl	%edx, -288(%rbp)
	movl	%ecx, -292(%rbp)
	movq	%r8, -304(%rbp)
	movq	%r9, -312(%rbp)
	testb	%al, %al
	je	.L28
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L28:
	movl	$48, -272(%rbp)
	movl	$48, -268(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -264(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -256(%rbp)
	movl	$3, -180(%rbp)
	movl	-288(%rbp), %eax
	movl	%eax, -184(%rbp)
	movl	-292(%rbp), %eax
	movl	%eax, -188(%rbp)
	movl	$80, %eax
	subl	-288(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -192(%rbp)
	movl	$1, -196(%rbp)
	movl	-184(%rbp), %eax
	subl	$4, %eax
	movl	%eax, -200(%rbp)
	movl	-188(%rbp), %eax
	addl	$3, %eax
	movl	%eax, -204(%rbp)
	movl	-192(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -208(%rbp)
	movl	$1, -212(%rbp)
	movl	-184(%rbp), %eax
	subl	$2, %eax
	movl	%eax, -216(%rbp)
	movl	-188(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -220(%rbp)
	movl	-192(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -224(%rbp)
	movl	-192(%rbp), %ecx
	movl	-188(%rbp), %edx
	movl	-184(%rbp), %esi
	movl	-180(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rax
	movl	$262144, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-232(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wborder@PLT
	addq	$32, %rsp
	movq	-304(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	alx_ncur_prn_title
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	-208(%rbp), %ecx
	movl	-204(%rbp), %edx
	movl	-200(%rbp), %esi
	movl	-196(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -240(%rbp)
	cmpq	$0, -312(%rbp)
	jne	.L26
	movq	-240(%rbp), %rax
	movl	$-1, %edx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
	jmp	.L27
.L26:
	leaq	-272(%rbp), %rdx
	movq	-312(%rbp), %rcx
	movq	-240(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vwprintw@PLT
.L27:
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	-224(%rbp), %ecx
	movl	-220(%rbp), %edx
	movl	-216(%rbp), %esi
	movl	-212(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movl	$262144, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movq	-248(%rbp), %rdx
	movl	-284(%rbp), %ecx
	movq	-280(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	loop_w_getstr
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	alx_w_getstr, .-alx_w_getstr
	.section	.rodata
.LC3:
	.string	"Introduce a file name"
	.text
	.globl	alx_w_getfname
	.type	alx_w_getfname, @function
alx_w_getfname:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$320, %rsp
	movq	%rdi, -280(%rbp)
	movq	%rsi, -288(%rbp)
	movl	%ecx, -296(%rbp)
	movl	%r8d, -300(%rbp)
	movq	%r9, -312(%rbp)
	testb	%al, %al
	je	.L30
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L30:
	movb	%dl, -292(%rbp)
	movl	$48, -272(%rbp)
	movl	$48, -268(%rbp)
	leaq	24(%rbp), %rax
	movq	%rax, -264(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -256(%rbp)
	movl	$3, -180(%rbp)
	movl	-296(%rbp), %eax
	movl	%eax, -184(%rbp)
	movl	-300(%rbp), %eax
	movl	%eax, -188(%rbp)
	movl	$80, %eax
	subl	-296(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -192(%rbp)
	movl	$1, -196(%rbp)
	movl	-184(%rbp), %eax
	subl	$4, %eax
	movl	%eax, -200(%rbp)
	movl	-188(%rbp), %eax
	addl	$3, %eax
	movl	%eax, -204(%rbp)
	movl	-192(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -208(%rbp)
	movl	$1, -212(%rbp)
	movl	-184(%rbp), %eax
	subl	$2, %eax
	movl	%eax, -216(%rbp)
	movl	-188(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -220(%rbp)
	movl	-192(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -224(%rbp)
	movl	-192(%rbp), %ecx
	movl	-188(%rbp), %edx
	movl	-184(%rbp), %esi
	movl	-180(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rax
	movl	$262144, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-232(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wborder@PLT
	addq	$32, %rsp
	movq	-312(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	alx_ncur_prn_title
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	-208(%rbp), %ecx
	movl	-204(%rbp), %edx
	movl	-200(%rbp), %esi
	movl	-196(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -240(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L31
	movq	-240(%rbp), %rax
	movl	$-1, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
	jmp	.L32
.L31:
	leaq	-272(%rbp), %rdx
	movq	-240(%rbp), %rax
	movq	16(%rbp), %rsi
	movq	%rax, %rdi
	call	vwprintw@PLT
.L32:
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	-224(%rbp), %ecx
	movl	-220(%rbp), %edx
	movl	-216(%rbp), %esi
	movl	-212(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movl	$262144, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movzbl	-292(%rbp), %edx
	movq	-248(%rbp), %rcx
	movq	-288(%rbp), %rsi
	movq	-280(%rbp), %rax
	movq	%rax, %rdi
	call	loop_w_getfname
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	alx_win_del
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	alx_w_getfname, .-alx_w_getfname
	.section	.rodata
.LC4:
	.string	" %s "
	.text
	.globl	alx_ncur_prn_title
	.type	alx_ncur_prn_title, @function
alx_ncur_prn_title:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L34
	movq	-24(%rbp), %rax
	movzwl	4(%rax), %eax
	cwtl
	addl	$1, %eax
	jmp	.L35
.L34:
	movl	$-1, %eax
.L35:
	movl	%eax, -4(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L36
	movq	-24(%rbp), %rax
	movzwl	6(%rax), %eax
	cwtl
	addl	$1, %eax
	jmp	.L37
.L36:
	movl	$-1, %eax
.L37:
	movl	%eax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	leal	2(%rax), %edx
	movl	-8(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	-1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L39
	movq	936+acs_map(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L39:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	movq	928+acs_map(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	alx_ncur_prn_title, .-alx_ncur_prn_title
	.globl	alx_ncur_prn_subtitle
	.type	alx_ncur_prn_subtitle, @function
alx_ncur_prn_subtitle:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L41
	movq	-24(%rbp), %rax
	movzwl	4(%rax), %eax
	cwtl
	addl	$1, %eax
	jmp	.L42
.L41:
	movl	$-1, %eax
.L42:
	movl	%eax, -4(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L43
	movq	-24(%rbp), %rax
	movzwl	6(%rax), %eax
	cwtl
	addl	$1, %eax
	jmp	.L44
.L43:
	movl	$-1, %eax
.L44:
	movl	%eax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	leal	2(%rax), %edx
	movl	-8(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	-1(%rax), %edx
	movl	-4(%rbp), %eax
	leal	-1(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L46
	movq	936+acs_map(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
.L46:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	movq	928+acs_map(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	waddch@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	alx_ncur_prn_subtitle, .-alx_ncur_prn_subtitle
	.type	alx_ncur_prn_menu, @function
alx_ncur_prn_menu:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L48
	movq	-24(%rbp), %rax
	movzwl	4(%rax), %eax
	cwtl
	addl	$1, %eax
	jmp	.L49
.L48:
	movl	$-1, %eax
.L49:
	movl	%eax, -8(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L50
	movq	-24(%rbp), %rax
	movzwl	6(%rax), %eax
	cwtl
	addl	$1, %eax
	jmp	.L51
.L50:
	movl	$-1, %eax
.L51:
	movl	%eax, -12(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L52
.L55:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L54
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	8(%rax), %rcx
	movq	-24(%rbp), %rax
	movl	$-1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
.L54:
	addl	$1, -4(%rbp)
.L52:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L55
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	alx_ncur_prn_menu, .-alx_ncur_prn_menu
	.type	alx_ncur_usr_sel, @function
alx_ncur_usr_sel:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	movb	$1, -5(%rbp)
	jmp	.L57
.L70:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	cmpl	$107, %eax
	je	.L59
	cmpl	$107, %eax
	jg	.L60
	cmpl	$13, %eax
	je	.L61
	cmpl	$13, %eax
	jg	.L62
	cmpl	$10, %eax
	je	.L61
	jmp	.L58
.L62:
	cmpl	$32, %eax
	je	.L61
	cmpl	$106, %eax
	je	.L63
	jmp	.L58
.L60:
	cmpl	$119, %eax
	je	.L59
	cmpl	$119, %eax
	jg	.L64
	cmpl	$115, %eax
	je	.L63
	jmp	.L58
.L64:
	cmpl	$258, %eax
	je	.L63
	cmpl	$259, %eax
	jne	.L58
.L59:
	cmpl	$0, -4(%rbp)
	je	.L65
	subl	$1, -4(%rbp)
	jmp	.L66
.L65:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
.L66:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	jmp	.L57
.L63:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	cmpl	-4(%rbp), %eax
	je	.L67
	addl	$1, -4(%rbp)
	jmp	.L68
.L67:
	movl	$0, -4(%rbp)
.L68:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	jmp	.L57
.L61:
	movb	$0, -5(%rbp)
	jmp	.L57
.L58:
	cmpl	$47, -12(%rbp)
	jle	.L72
	movl	-28(%rbp), %eax
	addl	$48, %eax
	cmpl	-12(%rbp), %eax
	jle	.L72
	movl	-12(%rbp), %eax
	subl	$48, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	movb	$0, -5(%rbp)
.L72:
	nop
.L57:
	cmpb	$0, -5(%rbp)
	jne	.L70
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	alx_ncur_usr_sel, .-alx_ncur_usr_sel
	.type	loop_w_getdbl, @function
loop_w_getdbl:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1104, %rsp
	movq	%rdi, -1064(%rbp)
	movsd	%xmm0, -1072(%rbp)
	movsd	%xmm1, -1080(%rbp)
	movsd	%xmm2, -1088(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L74
.L82:
	call	echo@PLT
	movq	-1064(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L75
	leaq	-1040(%rbp), %rcx
	movq	-1064(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wgetnstr@PLT
	jmp	.L76
.L75:
	movl	$-1, %eax
.L76:
	movl	%eax, -12(%rbp)
	call	noecho@PLT
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	wclear@PLT
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	cmpl	$-1, -12(%rbp)
	jne	.L77
	movl	$5, -8(%rbp)
	jmp	.L78
.L77:
	leaq	-1040(%rbp), %rcx
	movsd	-1088(%rbp), %xmm1
	movsd	-1080(%rbp), %xmm0
	movq	-1072(%rbp), %rdx
	leaq	-1048(%rbp), %rax
	movq	%rcx, %rsi
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, -1096(%rbp)
	movsd	-1096(%rbp), %xmm0
	movq	%rax, %rdi
	call	alx_sscan_dbl@PLT
	movl	%eax, -8(%rbp)
.L78:
	cmpl	$0, -8(%rbp)
	je	.L84
	movl	-8(%rbp), %edx
	movq	-1064(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	manage_w_error
	addl	$1, -4(%rbp)
.L74:
	cmpl	$1, -4(%rbp)
	jle	.L82
	jmp	.L81
.L84:
	nop
.L81:
	movsd	-1048(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	loop_w_getdbl, .-loop_w_getdbl
	.type	loop_w_getint, @function
loop_w_getint:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1104, %rsp
	movq	%rdi, -1064(%rbp)
	movsd	%xmm0, -1072(%rbp)
	movq	%rsi, -1080(%rbp)
	movsd	%xmm1, -1088(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L86
.L94:
	call	echo@PLT
	movq	-1064(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L87
	leaq	-1040(%rbp), %rcx
	movq	-1064(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wgetnstr@PLT
	jmp	.L88
.L87:
	movl	$-1, %eax
.L88:
	movl	%eax, -12(%rbp)
	call	noecho@PLT
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	wclear@PLT
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	cmpl	$-1, -12(%rbp)
	jne	.L89
	movl	$5, -8(%rbp)
	jmp	.L90
.L89:
	leaq	-1040(%rbp), %rdx
	movsd	-1088(%rbp), %xmm0
	movq	-1080(%rbp), %rsi
	movq	-1072(%rbp), %rcx
	leaq	-1048(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rcx, -1096(%rbp)
	movsd	-1096(%rbp), %xmm0
	movq	%rax, %rdi
	call	alx_sscan_int@PLT
	movl	%eax, -8(%rbp)
.L90:
	cmpl	$0, -8(%rbp)
	je	.L96
	movl	-8(%rbp), %edx
	movq	-1064(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	manage_w_error
	addl	$1, -4(%rbp)
.L86:
	cmpl	$1, -4(%rbp)
	jle	.L94
	jmp	.L93
.L96:
	nop
.L93:
	movq	-1048(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	loop_w_getint, .-loop_w_getint
	.type	loop_w_getstr, @function
loop_w_getstr:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1072, %rsp
	movq	%rdi, -1048(%rbp)
	movl	%esi, -1052(%rbp)
	movq	%rdx, -1064(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L98
.L106:
	call	echo@PLT
	movq	-1064(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L99
	leaq	-1040(%rbp), %rcx
	movq	-1064(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wgetnstr@PLT
	jmp	.L100
.L99:
	movl	$-1, %eax
.L100:
	movl	%eax, -12(%rbp)
	call	noecho@PLT
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	wclear@PLT
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	$0, -8(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L108
	movl	$5, -8(%rbp)
	cmpl	$0, -8(%rbp)
	je	.L109
	movl	-8(%rbp), %edx
	movq	-1064(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	manage_w_error
	addl	$1, -4(%rbp)
.L98:
	cmpl	$1, -4(%rbp)
	jle	.L106
	jmp	.L103
.L108:
	nop
	jmp	.L103
.L109:
	nop
.L103:
	cmpl	$0, -8(%rbp)
	jne	.L110
	movl	-1052(%rbp), %eax
	movslq	%eax, %rcx
	leaq	-1040(%rbp), %rdx
	movq	-1048(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
.L110:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	loop_w_getstr, .-loop_w_getstr
	.type	loop_w_getfname, @function
loop_w_getfname:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4144, %rsp
	movq	%rdi, -4120(%rbp)
	movq	%rsi, -4128(%rbp)
	movl	%edx, %eax
	movq	%rcx, -4144(%rbp)
	movb	%al, -4132(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L112
.L120:
	call	echo@PLT
	movq	-4144(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L113
	leaq	-4112(%rbp), %rcx
	movq	-4144(%rbp), %rax
	movl	$4096, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	wgetnstr@PLT
	jmp	.L114
.L113:
	movl	$-1, %eax
.L114:
	movl	%eax, -12(%rbp)
	call	noecho@PLT
	movq	-4144(%rbp), %rax
	movq	%rax, %rdi
	call	wclear@PLT
	movq	-4144(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	cmpl	$-1, -12(%rbp)
	jne	.L115
	movl	$5, -8(%rbp)
	jmp	.L116
.L115:
	movzbl	-4132(%rbp), %edx
	leaq	-4112(%rbp), %rcx
	movq	-4128(%rbp), %rsi
	movq	-4120(%rbp), %rax
	movq	%rax, %rdi
	call	alx_sscan_fname@PLT
	movl	%eax, -8(%rbp)
.L116:
	cmpl	$0, -8(%rbp)
	je	.L121
	movl	-8(%rbp), %edx
	movq	-4144(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	manage_w_error
	addl	$1, -4(%rbp)
.L112:
	cmpl	$1, -4(%rbp)
	jle	.L120
	jmp	.L119
.L121:
	nop
.L119:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	loop_w_getfname, .-loop_w_getfname
	.section	.rodata
.LC5:
	.string	"\302\241 Number is out of range !"
.LC6:
	.string	"\302\241 sscanf() error !"
.LC7:
	.string	"\302\241 wgetstr() error !"
.LC8:
	.string	"\302\241 FILE error !"
	.text
	.type	manage_w_error, @function
manage_w_error:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %eax
	cmpl	$2, %eax
	je	.L124
	cmpl	$2, %eax
	jg	.L125
	cmpl	$1, %eax
	je	.L126
	jmp	.L123
.L125:
	cmpl	$3, %eax
	je	.L127
	cmpl	$5, %eax
	je	.L128
	jmp	.L123
.L126:
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L137
	movq	-8(%rbp), %rax
	movl	$-1, %edx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
	jmp	.L137
.L124:
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L138
	movq	-8(%rbp), %rax
	movl	$-1, %edx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
	jmp	.L138
.L128:
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L139
	movq	-8(%rbp), %rax
	movl	$-1, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
	jmp	.L139
.L127:
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	cmpl	$-1, %eax
	je	.L140
	movq	-8(%rbp), %rax
	movl	$-1, %edx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	waddnstr@PLT
	jmp	.L140
.L137:
	nop
	jmp	.L123
.L138:
	nop
	jmp	.L123
.L139:
	nop
	jmp	.L123
.L140:
	nop
.L123:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	wclear@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	manage_w_error, .-manage_w_error
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
