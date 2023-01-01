.section .rodata
	msg_main_menu:
	.string	"1.Addition\n2.Subtraction\n3.Mulitplication\n4.Division\n5.Exit\n"

	msg_main_print1:
	.string "Enter your choice: "
	
	msg_main_scan_choice:
	.string "%d"

	msg_main_print2:
	.string "Enter two numbers: "

	msg_main_scan_two_numbers:
	.string "%d%d"

	msg_main_print_default:
	.string "Enter valid choice\n"

	msg_main_print_result:
	.string "Answer = %d\n\n"

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$16, %esp

lable_while_true:
	#do while loop
	pushl	$msg_main_menu		#print menu message
	call	printf
	addl	$4, %esp

	pushl	$msg_main_print1	#print "Enter your choice msg"
	call	printf
	addl	$4, %esp

	leal	-16(%ebp), %ebx		#scan the choice and store in iCh
	pushl	%ebx
	pushl	$msg_main_scan_choice
	call	scanf
	addl	$8, %esp

	movl	-16(%ebp), %eax
	cmpl	$0, %eax
	jle	lable_switch
	cmpl	$4, %eax
	jg	lable_switch

	pushl	$msg_main_print2
	call	printf
	addl	$4, %esp

	leal	-4(%ebp),%edx 	#iNo1
	leal	-8(%ebp),%ecx	#iNo2
	pushl	%ecx
	pushl	%edx
	pushl	$msg_main_scan_two_numbers
	call	scanf
	addl	$12, %esp
	
	movl	-16(%ebp), %eax
lable_switch:
	cmpl	$1, %eax
	je	lable_addition
	cmpl	$2, %eax
	je	lable_subtraction
	cmpl	$3, %eax
	je	lable_mulitplication
	cmpl	$4, %eax
	je	lable_division
	cmpl	$5, %eax
	je	lable_exit
	jmp	lable_default
	
lable_addition:
	movl	-4(%ebp), %edx
	movl	-8(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	call	addition
	subl	$8, %esp

	movl	%eax, -12(%ebp)
	jmp	lable_break

lable_subtraction:
	movl	-4(%ebp), %edx
	movl	-8(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	call	subtraction
	subl	$8, %esp

	movl	%eax, -12(%ebp)
	jmp	lable_break

lable_mulitplication:
	movl	-4(%ebp), %edx
	movl	-8(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	call	multiplication
	subl	$8, %esp

	movl	%eax, -12(%ebp)
	jmp	lable_break

lable_division:
	movl	-4(%ebp), %edx
	movl	-8(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	call	division
	subl	$8, %esp

	movl	%eax, -12(%ebp)
	jmp	lable_break

lable_default:
	pushl	$msg_main_print_default
	call	printf
	addl	$4, %esp
	jmp 	lable_while_true

lable_break:
	movl	-12(%ebp), %eax
	pushl	%eax
	pushl	$msg_main_print_result
	call	printf
	jmp 	lable_while_true

lable_exit:
	pushl	$0
	call	exit

.globl	addition
.type	addition, @function
addition:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	addl	%edx, %eax
	
	movl	%ebp, %esp
	popl 	%ebp
	ret

.globl	subtraction
.type	subtraction, @function
subtraction:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	subl	%edx, %eax
	
	movl	%ebp, %esp
	popl 	%ebp
	ret

.globl	multiplication
.type	multiplication, @function
multiplication:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	mull	%ecx
	
	movl	%ebp, %esp
	popl 	%ebp
	ret

.globl	division
.type	division, @function
division:
	pushl	%ebp
	movl	%esp, %ebp
	
	xorl	%eax,%eax
	xorl	%edx,%edx
	xorl	%ecx,%ecx

	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	divl	%ecx
	
	movl	%ebp, %esp
	popl 	%ebp
	ret

