.section .rodata
	msg_main_print1:
	.string "Enter values for Obj 1:\n"

	msg_main_print2:
	.string "Enter values for Obj 2:\n"

	msg_main_print_chChar:
	.string "Enter chChar: "

	msg_main_print_iNo:
	.string "Enter iNo: "

	msg_main_print_shiNo:
	.string "Enter shiNo: "

	msg_main_scan_obj1_chChar:
	.string "%c"
	
	msg_main_scan_obj1_iNo:
	.string "%d"
	
	msg_main_scan_obj1_shiNo:
	.string "%hd"

	msg_main_scan_obj2_chChar:
	.string "%c%c"
	
	msg_main_scan_obj2_iNo:
	.string "%c%d"
	
	msg_main_scan_obj2_shiNo:
	.string "%c%hd"

	msg_main_obj1_print_values:
	.string	"Obj1 values: \n"

	msg_main_obj2_print_values:
	.string	"Obj2 values: \n"

	msg_main_obj1_print_chChar:
	.string	"Obj1 chChar = %c \n"

	msg_main_obj1_print_iNo:
	.string	"Obj1 iNo = %d \n"

	msg_main_obj1_print_shiNo:
	.string	"Obj1 shiNo = %hd \n"

	msg_main_obj2_print_chChar:
	.string	"Obj2 chChar = %c \n"

	msg_main_obj2_print_iNo:
	.string	"Obj2 iNo = %d \n"

	msg_main_obj2_print_shiNo:
	.string	"Obj2 shiNo = %hd \n"

.section .bss
	.comm	obj1, 12, 4

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$13, %esp

	pushl	$msg_main_print1
	call	printf
	addl	$4, %esp

	pushl	$msg_main_print_chChar
	call	printf
	addl	$4, %esp

	movl	$obj1, %ebx
	pushl	%ebx
	pushl	$msg_main_scan_obj1_chChar
	call	scanf
	addl	$8, %esp

	pushl	$msg_main_print_iNo
	call	printf
	addl	$4, %esp

	movl	$obj1, %ebx
	leal	4(%ebx), %ebx
	pushl	%ebx
	pushl	$msg_main_scan_obj1_iNo
	call	scanf
	addl	$8, %esp

	pushl	$msg_main_print_shiNo
	call	printf
	addl	$4, %esp

	movl	$obj1, %ebx
	leal	8(%ebx), %ebx
	pushl	%ebx
	pushl	$msg_main_scan_obj1_shiNo
	call	scanf
	addl	$8, %esp
	
	pushl	$msg_main_print2
	call	printf
	addl	$4, %esp

	pushl	$msg_main_print_chChar
	call	printf
	addl	$4, %esp

	leal	-13(%ebp), %eax
	leal	-12(%ebp), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_obj2_chChar
	call	scanf
	addl	$12, %esp

	pushl	$msg_main_print_iNo
	call	printf
	addl	$4, %esp

	leal	-13(%ebp), %eax
	leal	-8(%ebp), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_obj2_iNo
	call	scanf
	addl	$12, %esp

	pushl	$msg_main_print_shiNo
	call	printf
	addl	$4, %esp

	leal	-13(%ebp), %eax
	leal	-4(%ebp), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_obj2_shiNo
	call	scanf
	addl	$12, %esp

	pushl	$msg_main_obj1_print_values
	call	printf
	addl	$4, %esp

	xorl	%eax, %eax
	movl	$obj1, %ebx
	movb	(%ebx), %al	
	pushl	%eax
	pushl	$msg_main_obj1_print_chChar
	call	printf
	addl	$8, %esp
	
	movl	$obj1, %ebx
	movl	4(%ebx), %edx	
	pushl	%edx
	pushl	$msg_main_obj1_print_iNo
	call	printf
	addl	$8, %esp

	xorl	%ecx, %ecx
	movl	$obj1, %ebx
	movw	8(%ebx), %cx	
	pushl	%ecx
	pushl	$msg_main_obj1_print_shiNo
	call	printf
	addl	$8, %esp

	pushl	$msg_main_obj2_print_values
	call	printf
	addl	$4, %esp

	xorl	%eax, %eax
	leal	-12(%ebp), %ebx
	movb	(%ebx), %al	
	pushl	%eax
	pushl	$msg_main_obj1_print_chChar
	call	printf
	addl	$8, %esp
	
	leal	-12(%ebp), %ebx
	movl	4(%ebx), %edx	
	pushl	%edx
	pushl	$msg_main_obj1_print_iNo
	call	printf
	addl	$8, %esp

	xorl	%ecx, %ecx
	leal	-12(%ebp), %ebx
	movw	8(%ebx), %cx	
	pushl	%ecx
	pushl	$msg_main_obj1_print_shiNo
	call	printf
	addl	$8, %esp

	pushl	$0
	call	exit

