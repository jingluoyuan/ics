	.file	"signal.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"\346\215\225\350\216\267\344\277\241\345\217\267 %d\357\274\214\350\267\263\345\207\272...\n"
	.text
	.globl	sighandler
	.type	sighandler, @function
sighandler:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	%edi, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE51:
	.size	sighandler, .-sighandler
	.section	.rodata.str1.1
.LC1:
	.string	"wait 1s..."
	.text
	.globl	main
	.type	main, @function
main:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	sighandler(%rip), %rsi
	movl	$2, %edi
	call	signal@PLT
.L4:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	sleep@PLT
	jmp	.L4
	.cfi_endproc
.LFE50:
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
