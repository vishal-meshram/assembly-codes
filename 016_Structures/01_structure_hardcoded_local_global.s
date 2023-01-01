.section .rodata
	msg_main_print1:
	.string "Obj 1:\n"

	msg_main_print2:
	.string "chChar=%c\tiNo=%d\tshiNo=%hd\t\n\n"

	msg_main_print3:
	.string	"Obj 2:\n"

	msg_main_print4:
	.string "chChar=%c\tiNo=%d\tshiNo=%hd\t\n\n"

.section .data
	.globl	obj1
	.type	obj1, @object
	.size	obj1, 4
	.align	4
	obj1:
	  .ascii  "A"
	  .zero    3
	  .int 	  10
	  .value  20

.section .text
.globl  main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$12, %esp

	#Obj2 Storing
	#assiging values to Obj2 which is local varialble
	movl	$'B', -12(%ebp)
	movl	$30, -8(%ebp)
	movl	$40, -4(%ebp)

	#Obj1 
	pushl	$msg_main_print1
	call	printf
	addl	$4, %esp

	movl	$obj1, %ebx	#address of Obj1

	#Obj1 values printing
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movb	(%ebx), %al	#chChar
	movl	4(%ebx), %edx	#iNo
	movw	8(%ebx), %ecx	#shiNo

	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl	$16, %esp

	pushl 	$msg_main_print3
	call	printf
	addl	$4, %esp

	leal	-12(%ebp), %ebx  #address of Obj2 object khalun var suru hoto

	#Obj2 values printing
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movb	(%ebx), %al	#chChar
	movl	4(%ebx), %edx	#iNo
	movw	8(%ebx), %ecx	#shiNo

	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl	$16, %esp


	pushl	$0
	call	exit 
