	.file	"proc.c"
	.text
	.globl	proc
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
