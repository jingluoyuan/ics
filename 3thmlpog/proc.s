	.file	"proc.c"
	.text
	.globl	proc
<<<<<<< HEAD
	.type	proc, @function
proc:
.LFB0:
	.cfi_startproc
	endbr64
	movq	16(%rsp), %rax
	addq	%rdi, (%rsi)
	addl	%edx, (%rcx)
	addw	%r8w, (%r9)
	movl	8(%rsp), %edx
	addb	%dl, (%rax)
	ret
	.cfi_endproc
.LFE0:
	.size	proc, .-proc
	.globl	call_proc
	.type	call_proc, @function
call_proc:
.LFB1:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	$1, 16(%rsp)
	movl	$2, 12(%rsp)
	movw	$3, 10(%rsp)
	movb	$4, 9(%rsp)
	leaq	12(%rsp), %rcx
	leaq	16(%rsp), %rsi
	leaq	9(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 56
	pushq	$4
	.cfi_def_cfa_offset 64
	leaq	26(%rsp), %r9
	movl	$3, %r8d
	movl	$2, %edx
	movl	$1, %edi
	call	proc
	movslq	28(%rsp), %rdx
	addq	32(%rsp), %rdx
	movswl	26(%rsp), %eax
	movsbl	25(%rsp), %ecx
	subl	%ecx, %eax
	cltq
	imulq	%rdx, %rax
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	24(%rsp), %rdi
	subq	%fs:40, %rdi
	jne	.L5
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1:
	.size	call_proc, .-call_proc
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
=======
	.def	proc;	.scl	2;	.type	32;	.endef
	.seh_proc	proc
proc:
	.seh_endprologue
	movq	48(%rsp), %r10
	movq	64(%rsp), %rax
	addl	%ecx, (%rdx)
	addl	%r8d, (%r9)
	movl	40(%rsp), %edx
	addw	%dx, (%r10)
	movl	56(%rsp), %edx
	addb	%dl, (%rax)
	ret
	.seh_endproc
	.globl	call_proc
	.def	call_proc;	.scl	2;	.type	32;	.endef
	.seh_proc	call_proc
call_proc:
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	movl	$1, 76(%rsp)
	movl	$2, 72(%rsp)
	movw	$3, 70(%rsp)
	movb	$4, 69(%rsp)
	leaq	76(%rsp), %rdx
	leaq	69(%rsp), %rax
	movq	%rax, 56(%rsp)
	movl	$4, 48(%rsp)
	leaq	70(%rsp), %rax
	movq	%rax, 40(%rsp)
	movl	$3, 32(%rsp)
	leaq	72(%rsp), %r9
	movl	$2, %r8d
	movl	$1, %ecx
	call	proc
	movl	72(%rsp), %eax
	addl	76(%rsp), %eax
	movswl	70(%rsp), %edx
	movsbl	69(%rsp), %ecx
	subl	%ecx, %edx
	imull	%edx, %eax
	addq	$88, %rsp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-W64 project) 8.1.0"
>>>>>>> 0657d6f2ae4c0511aae5a3acdec94aa192d0bb82
