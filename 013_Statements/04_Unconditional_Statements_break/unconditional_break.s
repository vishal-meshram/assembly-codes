.section .rodata
	msg_main_print1:
	.string "Enter Number: "

	msg_main_scan:
	.string "%d"

	msg_main_print2:
	.string "iCounter = %d \n"

.section .text
.globl main
.type  main, @function
main:

	pushl	%ebp
	movl	%esp, %ebp

	subl	$8, %esp
	
	#printf("Enter Number: ");
	pushl 	$msg_main_print1
	call	printf
	addl	$4, %esp

	#scanf("%d",&iNo)
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	#iCounter = 1	Assignment
	movl	$1, -8(%ebp)
	jmp	label_for_condtion

label_for_statements:
	#if(iCounter %2 == 0)
	xorl	%edx, %edx	
	xorl	%ecx, %ecx
	movl 	$2, %ecx
	divl	%ecx
	cmpl	$0, %edx
	je     lable_exit
	
	movl 	-8(%ebp), %eax
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl 	$8, %esp

	#iCounter++
	addl	$1, -8(%ebp) 	
	
label_for_condtion:
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	cmpl	%edx, %eax
	jl	label_for_statements	
	
lable_exit:
	pushl	$0
	call	exit

