	.file	"dw_loop.c"
	.text
	.globl	dw_doop
	.def	dw_doop;	.scl	2;	.type	32;	.endef
	.seh_proc	dw_doop
dw_doop:
	.seh_endprologue
	movl	%ecx, %eax
	imull	%ecx, %ecx
	leal	(%rax,%rax), %edx
.L2:
	leal	1(%rcx,%rax), %eax
	subl	$1, %edx
	testl	%edx, %edx
	jg	.L2
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-W64 project) 8.1.0"
