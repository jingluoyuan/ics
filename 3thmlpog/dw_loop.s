	.file	"dw_loop.c"
	.text
	.globl	dw_doop
	.type	dw_doop, @function
dw_doop:
.LFB0:
	.cfi_startproc
	endbr64
	movq	%rdi, %rdx
	imulq	%rdi, %rdx
	leaq	(%rdi,%rdi), %rax
.L2:
	leaq	1(%rdx,%rdi), %rdi
	subq	$1, %rax
	testq	%rax, %rax
	jg	.L2
	movq	%rdi, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	dw_doop, .-dw_doop
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
