.section .rodata
	msg_main_print1:
	.string	"Enter Number: "

	msg_main_scan:
	.string	"%d"

	msg_main_print2:
	.string "%d\n"

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$8, %esp

	pushl	$msg_main_print1
	call	printf
	addl	$4, %esp

	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp

	movl	$0, -8(%ebp)   #iCounter= 0
	jmp	label_for_condition

label_for_statement:
	movl	-8(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_print2
	call	printf
	addl	$8, %esp

	addl 	$1, -8(%ebp)	#iCounter++

label_for_condition:
	movl	-4(%ebp), %edx	#iNo
	movl	-8(%ebp), %eax	#iCounter
	cmpl	%edx, %eax	#iCounter < iNo
	jl	label_for_statement
	
	pushl	$0
	call	exit
