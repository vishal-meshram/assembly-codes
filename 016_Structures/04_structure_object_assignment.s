.section .rodata
	msg_main_print1:
	.string	"Enter Obj2 Values:\n"
	
	msg_main_print_chChar:
	.string "Enter chChar: "

	msg_main_print_iNo:
	.string "Enter iNo: "

	msg_main_print_shiNo:
	.string "Enter shiNo: "
	
	msg_main_scan_chChar:
	.string "%c"

	msg_main_scan_iNo:
	.string "%d"

	msg_main_scan_shiNo:
	.string "%hd"

	msg_main_obj1_print:
	.string "Obj1 is:\n"

	msg_main_obj2_print:
	.string "Obj2 is:\n"

	msg_main_obj3_print:
	.string "Obj3 is:\n"

	msg_main_print_values:
	.string	"chChar=%c\niNo=%d\nshiNo=%hd\n\n"

.section .bss
	.comm	obj1, 12, 4

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$24, %esp

	pushl	$msg_main_print1
	call	printf
	addl	$4, %esp

	pushl	$msg_main_print_chChar
	call	printf
	addl	$4, %esp

	leal	-12(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan_chChar
	call	scanf
	addl	$8, %esp

	pushl	$msg_main_print_iNo
	call	printf
	addl	$4, %esp

	leal	-8(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan_iNo
	call	scanf
	addl	$8, %esp

	pushl	$msg_main_print_shiNo
	call	printf
	addl	$4, %esp

	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan_shiNo
	call	scanf
	addl	$8, %esp


	#assignment Code obj1 = Obj2

	leal	-12(%ebp), %ebx

	xorl	%eax, %eax
	xorl	%ecx, %ecx

	movb	(%ebx), %al
	movl	4(%ebx), %edx
	movw	8(%ebx), %cx

	movl	$obj1, %ebx
	
	movb	%al, (%ebx)
	movl	%edx, 4(%ebx)
	movw	%cx, 8(%ebx)

	#assignment Code obj3 = Obj2

	leal	-12(%ebp), %ebx

	xorl	%eax, %eax
	xorl	%ecx, %ecx

	movb	(%ebx), %al
	movl	4(%ebx), %edx
	movw	8(%ebx), %cx

	leal	-24(%ebp), %ebx
	
	movb	%al, (%ebx)
	movl	%edx, 4(%ebx)
	movw	%cx, 8(%ebx)


	##Print Obj2

	pushl	$msg_main_obj2_print
	call	printf
	addl	$4, %esp

	xorl	%eax, %eax
	xorl	%ecx, %ecx

	leal	-12(%ebp), %ebx

	movb	(%ebx), %al
	movl	4(%ebx), %edx
	movw	8(%ebx), %cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_values
	call	printf
	addl	$16, %esp
	
	##Print Obj1 

	pushl	$msg_main_obj1_print
	call	printf
	addl	$4, %esp

	xorl	%eax, %eax
	xorl	%ecx, %ecx

	movl	$obj1, %ebx
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	movw	8(%ebx), %cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_values
	call	printf
	addl	$16, %esp

	##Print Obj3

	pushl	$msg_main_obj3_print
	call	printf
	addl	$4, %esp

	xorl	%eax, %eax
	xorl	%ecx, %ecx

	leal	-24(%ebp), %ebx

	movb	(%ebx), %al
	movl	4(%ebx), %edx
	movw	8(%ebx), %cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_values
	call	printf
	addl	$16, %esp

	pushl	$0
	call	exit
