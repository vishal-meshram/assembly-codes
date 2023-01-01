.section .rodata
	msg_main_print1:
	.string "Before calling fun(): iNo = %d\n"

	msg_main_print2:
	.string "After calling fun(): iNo = %d\n"
	
	msg_fun_print1:
	.string "in fun():before increment: %d\n"

	msg_fun_print2:
	.string "in fun(): after increment: %d\n"

.section .text
.globl main
.type  main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$4, %esp

	movl	$10,-4(%ebp)

	movl	-4(%ebp), %eax
	pushl	%eax
	pushl	$msg_main_print1
	call	printf
	addl	$8, %esp

	movl	-4(%ebp), %eax
	pushl	%eax
	call	fun
	addl	$4, %esp

	movl	-4(%ebp), %eax
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl	$8, %esp
	
	pushl	$0
	call	exit

.globl	fun
.type	fun, @function
fun:
	pushl	%ebp
	movl	%esp, %ebp

	movl	8(%ebp), %ebx	#first formal parameter is always at 8(%ebp)
	pushl	%ebx
	pushl	$msg_fun_print1
	call	printf
	addl	$8, %eax

	addl 	$1, 8(%ebp)	#iNo = iNo + 1
	
	movl	8(%ebp), %eax
	pushl	%eax
	pushl	$msg_fun_print2
	call	printf
	addl	$8, %eax
	
	movl	%ebp, %esp
	popl 	%ebp
	ret	
