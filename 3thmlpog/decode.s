	.file	"decode.c"
	.text
	.globl	decode1
	.type	decode1, @function
decode1:
.LFB0:
	.cfi_startproc
	endbr64
	movq	(%rdi), %r8
	movq	(%rsi), %rcx
	movq	(%rdx), %rax
	movq	%r8, (%rsi)
	movq	%rcx, (%rdx)
	movq	%rax, (%rdi)
	ret
	.cfi_endproc
.LFE0:
	.size	decode1, .-decode1
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
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
/**/
