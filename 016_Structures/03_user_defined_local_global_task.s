.section .rodata
	msg_main_obj1_print:
	.string "Enter obj1 values:\n"

	msg_main_print_char:
	.string "Enter chChar\t: "

	msg_main_obj1_scan_char:
	.string	"%c"

	msg_main_print_int:
	.string "Enter iNo\t: "

	msg_main_obj1_scan_int:
	.string	"%d"

	msg_main_print_shint:
	.string "Enter shiNo\t: "

	msg_main_obj1_scan_shint:
	.string	"%hd"

	msg_main_obj2_print:
	.string "Enter obj2 values:\n"

	msg_main_obj2_scan_char:
	.string	"%c%c"

	msg_main_obj2_scan_int:
	.string	"%c%d"

	msg_main_obj2_scan_shint:
	.string	"%c%hd"

	msg_main_print_obj1:
	.string "chChar = %c, iNo=%d, shiNo=%hd\n\n"

.section .bss
	.comm	obj1, 12, 4

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$13, %esp

	pushl	$msg_main_obj1_print
	call	printf
	addl	$4, %esp

	pushl	$msg_main_print_char
	call	printf
	addl	$4, %esp

	#Follwoing code is to read values and store in OBJ1

	movl	$obj1, %ebx #take the address of obj1 into ebx
	pushl	%ebx
	pushl 	$msg_main_obj1_scan_char
	call	scanf
	addl	$8, %esp

	pushl	$msg_main_print_int
	call	printf
	addl	$4, %esp

	movl	$obj1, %ebx
	leal	4(%ebx),%ebx
	pushl	%ebx
	pushl	$msg_main_obj1_scan_int
	call	scanf
	addl	$8, %esp

	pushl	$msg_main_print_shint
	call	printf
	addl	$4, %esp

	movl	$obj1, %ebx	
	leal	8(%ebx),%ebx	#we want to send address to scanf so take address
	pushl	%ebx
	pushl	$msg_main_obj1_scan_shint
	call	scanf
	addl	$8, %esp

	#Follwoing code is to read and store values in OBJ2 which is local
	
	pushl	$msg_main_obj2_print
	call	printf
	addl	$4, %esp

	pushl	$msg_main_print_char
	call	printf
	addl	$4, %esp
 
	leal	-12(%ebp),%eax  #char
	leal	-13(%ebp),%edx	#temp
	pushl	%eax
	pushl	%edx
	pushl	$msg_main_obj2_scan_char
	call	scanf
	addl	$12, %esp

	leal	-8(%ebp),%eax  #int
	#leal	-13(%ebp),%edx	#temp
	pushl	%eax 
	#pushl	%edx
	pushl	$msg_main_obj1_scan_int 
	call	scanf
	addl	$8, %esp

	
	leal	-4(%ebp),%eax #shint
	#leal	-13(%ebp),%edx	
	pushl	%eax
	#pushl	%edx
	pushl	$msg_main_obj1_scan_shint
	call	scanf
	addl	$8, %esp
		

	#Following code is to print the values of OBJ1
	
	xorl	%eax, %eax
	xorl	%ecx, %ecx
		
	movl	$obj1, %ebx
	movb	(%ebx),%al
	movl	4(%ebx),%edx
	movw	8(%ebx),%cx
	
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj1
	call	printf
	addl	$16,%esp

	#Following code is to print the values of OBJ2
	
	xorl	%eax, %eax
	xorl	%ecx, %ecx
		
	leal	-12(%ebp), %ebx
	movb	(%ebx),%al
	movl	-8(%ebx),%edx
	movw	-4(%ebx),%cx
	
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj1
	call	printf
	addl	$16,%esp

	pushl	$0
	call	exit

