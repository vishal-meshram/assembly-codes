.section .rodata
	msg_main_obj1_print:
	.string "Obj1 Values: \n"

	msg_main_obj2_print:
	.string "Obj2 Values: \n"

	msg_main_obj3_print:
	.string "Obj3 Values: \n"

	msg_main_print_values:
	.string	"chChar=%c\niNo=%d\nshiNo=%hd\n"

	msg_main_print_comparasion1:
	.string "Obj1 and Obj2 comparasion is:  "

	msg_main_print_comparasion2:
	.string "Obj2 and Obj3 comparasion is:  "

	msg_main_print_equal:
	.string "EQUAL\n"

	msg_main_print_not_equal:
	.string "NOT EQUAL\n"

.section .data
	.globl	obj1
	.type	obj1, @object
	.size	obj1, 12
	.align	4
	obj1:
	  .ascii  "A"
	  .zero    3
	  .int     10
	  .value   20

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$24, %esp

	#Obj2 value storing
	leal	-12(%ebp), %ebx
	movb	$'B', (%ebx)
	movl	$20, 4(%ebx)
	movw	$30, 8(%ebx)

	#Obj3 value storing
	leal	-24(%ebp), %ebx
	movb	$'B', (%ebx)
	movl	$20, 4(%ebx)
	movw	$30, 8(%ebx)

	pushl	$msg_main_obj1_print
	call	printf
	addl	$4, %esp

	xorl 	%eax, %eax
	xorl 	%ecx, %ecx

	movl	$obj1, %ebx
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	movw 	8(%ebx), %cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_values
	call	printf
	addl	$16, %esp

	pushl	$msg_main_obj2_print
	call	printf
	addl	$4, %esp

	xorl 	%eax, %eax
	xorl 	%ecx, %ecx

	leal	-12(%ebp), %ebx

	movb	(%ebx), %al
	movl	4(%ebx), %edx
	movw 	8(%ebx), %cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_values
	call	printf
	addl	$16, %esp

	pushl	$msg_main_obj3_print
	call	printf
	addl	$4, %esp


	xorl 	%eax, %eax
	xorl 	%ecx, %ecx

	leal	-24(%ebp), %ebx
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	movw 	8(%ebx), %cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_values
	call	printf
	addl	$16, %esp


	#obj1 and obj2 comparision code:
	pushl	$msg_main_print_comparasion1
	call	printf
	addl	$4, %esp

	xorl	%eax, %eax
	xorl	%edx, %edx

	movl	$obj1, %ebx
	leal	-12(%ebp), %ecx

	movb	(%ebx), %al	
	movb	(%ecx), %dl

	cmpl	%edx, %eax
	jne	label_print_not_equal

	movl	4(%ebx), %eax
	movl	4(%ecx), %edx

	cmpl	%edx, %eax
	jne	label_print_not_equal

	xorl	%eax, %eax
	xorl	%edx, %edx

	movw	8(%eax), %ax	
	movw	8(%edx), %dx

	cmpl	%edx, %eax
	jne	label_print_not_equal
	
	pushl	$msg_main_print_equal
	call	printf
	addl	$4, %esp
	jmp	lable_compare_obj2_obj3
	
label_print_not_equal:
	pushl	$msg_main_print_not_equal
	call	printf
	addl	$4, %esp
	
lable_compare_obj2_obj3:
	#obj2 and obj3 comparision code:
	pushl	$msg_main_print_comparasion2
	call	printf
	addl	$4, %esp

	xorl	%eax, %eax
	xorl	%edx, %edx

	leal	-12(%ebp), %ebx
	leal	-24(%ebp), %ecx

	movb	(%ebx), %al	
	movb	(%ecx), %dl

	cmpl	%edx, %eax
	jne	label_print_not_equal1

	movl	4(%ebx), %eax
	movl	4(%ecx), %edx

	cmpl	%edx, %eax
	jne	label_print_not_equal1

	xorl	%eax, %eax
	xorl	%edx, %edx

	movw	8(%ebx), %ax	
	movw	8(%ecx), %dx

	cmpl	%edx, %eax
	jne	label_print_not_equal1
	
	pushl	$msg_main_print_equal
	call	printf
	addl	$4, %esp
	jmp	lable_exit

label_print_not_equal1:
	pushl	$msg_main_print_not_equal
	call	printf
	addl	$4, %esp
	
lable_exit:
	pushl	$0
	call	exit
