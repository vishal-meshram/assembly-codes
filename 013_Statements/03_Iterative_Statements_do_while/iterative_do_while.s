.section .rodata
	msg_main_print1:
	.string "Enter Number: "

	msg_main_scan:
	.string "%d"

	msg_main_print2:
	.string "%d\n"

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl 	$8, %esp

	pushl	$msg_main_print1
	call	printf
	addl	$4, %esp

	leal	-4(%ebp),%ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp

	movl	$0, -8(%ebp)

label_do_while_statements:
	movl	-8(%ebp), %ecx
	pushl	%ecx
	pushl	$msg_main_print2
	call	printf
	addl	$8, %esp

	addl	$1, -8(%ebp)	

lable_do_while_condition:
	movl	-4(%ebp), %edx
	movl	-8(%ebp), %eax
	cmpl	%edx, %eax
	jl	label_do_while_statements
	
	
	pushl	$0
	call	exit
