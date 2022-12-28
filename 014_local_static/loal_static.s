.section .rodata
	msg_main_print1:
	.string	"Calling fun1:\n"

	msg_main_print2:
	.string	"Calling fun2:\n"

	msg_fun1_print1:
	.string	"In fun1(): iNo=%d\n"

	msg_fun2_print2:
	.string	"In fun2(): iNo=%d\n"

.section .data
	.type	iNo, @object
	.size	iNo, 4
	.align	4
	iNo:
	 .int 	10


.section .text 	
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$4, %esp
	
	pushl	$msg_main_print1
	call	printf
	addl	$4, %esp

	#first for loop
	movl	$0, -4(%ebp)		#assignment iCounter = 0
	jmp	label_for1_condition

label_for1_statements:
	call	fun1
	
	addl 	$1, -4(%ebp)		#increment iCounter

label_for1_condition:
	#for condition
	movl	-4(%ebp), %eax
	cmpl	$3, %eax
	jl	label_for1_statements

	pushl	$msg_main_print2
	call	printf
	addl	$4, %esp

	#Second for loop
	movl	$0, -4(%ebp)		#asignment iCounter =0
	jmp	label_for2_conditon

label_for2_statements:
	call	fun2

	addl	$1, -4(%ebp)		#increment iCounter	

label_for2_conditon:
	#condition
	movl	-4(%ebp), %eax
	cmpl	$3, %eax
	jl	label_for2_statements

	pushl	$0
	call	exit

.globl	fun1
.type	fun1, @function
fun1:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$4, %esp
	
	movl	$10, -4(%ebp)
	addl 	$1, -4(%ebp)

	movl	-4(%ebp), %eax
	pushl 	%eax
	pushl	$msg_fun1_print1
	call	printf
	addl	$8, %esp
	
	movl	%ebp, %esp
	popl	%ebp
	ret

.globl 	fun2
.type	fun2, @function
fun2:
	pushl	%ebp
	movl	%esp, %ebp

	addl	$1, iNo
	
	movl	iNo, %eax
	pushl 	%eax
	pushl 	$msg_fun2_print2
	call	printf
	addl	$8, %esp

	movl	%ebp, %esp
	popl	%ebp
	ret	
