	.file	"locate.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s\t%p\t%lu\n"
	.text
	.type	show_pointer, @function
show_pointer:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	show_pointer, .-show_pointer
	.globl	big_array
	.bss
	.align 32
	.type	big_array, @object
	.size	big_array, 16777216
big_array:
	.zero	16777216
	.globl	huge_array
	.align 32
	.type	huge_array, @object
	.size	huge_array, 2147483648
huge_array:
	.zero	2147483648
	.text
	.globl	useless
	.type	useless, @function
useless:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	useless, .-useless
	.section	.rodata
.LC1:
	.string	"local array"
.LC2:
	.string	"big array"
.LC3:
	.string	"huge array"
.LC4:
	.string	"local"
.LC5:
	.string	"p1"
.LC6:
	.string	"p2"
.LC7:
	.string	"p3"
.LC8:
	.string	"p4"
.LC9:
	.string	"useless"
.LC10:
	.string	"exit"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-4194304(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -4194356(%rbp)
	movl	$268435456, %edi
	call	malloc@PLT
	movq	%rax, -4194352(%rbp)
	movl	$256, %edi
	call	malloc@PLT
	movq	%rax, -4194344(%rbp)
	movabsq	$4294967296, %rdi
	call	malloc@PLT
	movq	%rax, -4194336(%rbp)
	movl	$256, %edi
	call	malloc@PLT
	movq	%rax, -4194328(%rbp)
	leaq	-4194320(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	show_pointer
	leaq	.LC2(%rip), %rsi
	leaq	big_array(%rip), %rdi
	call	show_pointer
	leaq	.LC3(%rip), %rsi
	leaq	huge_array(%rip), %rdi
	call	show_pointer
	leaq	-4194356(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	show_pointer
	movq	-4194352(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	show_pointer
	movq	-4194344(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	show_pointer
	movq	-4194336(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	show_pointer
	movq	-4194328(%rbp), %rax
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	show_pointer
	leaq	.LC9(%rip), %rsi
	leaq	useless(%rip), %rdi
	call	show_pointer
	leaq	.LC10(%rip), %rsi
	movq	exit@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	show_pointer
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
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
