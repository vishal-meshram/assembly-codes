.section .rodata
	msg_main_print1:
	.string "Enter the Numerator: "

	msg_main_scan:
	.string "%d"

	msg_main_print2:
	.string "Enter the Denominator: "
	
	msg_main_print3:
	.string "Quotient = %d\n"

	msg_main_print4:
	.string "Reminder = %d\n"

.section .text
.globl main
.type  main,@function
main:
	pushl %ebp
	movl  %esp, %ebp

	subl $16, %esp

	pushl $msg_main_print1
	call  printf
	addl  $4, %esp

	leal -4(%ebp),%eax
	pushl %eax
	pushl $msg_main_scan
	call  scanf
	addl  $8, %esp

	pushl $msg_main_print2
	call  printf
	addl  $4, %esp

	leal -8(%ebp), %eax
	pushl %eax
	pushl $msg_main_scan
	call  scanf
	addl  $8, %esp

	xorl  %eax, %eax
	xorl  %edx, %edx
	xorl  %ecx, %ecx

	movl -4(%ebp), %eax
	movl -8(%ebp), %ecx
	divl %ecx
	movl %eax, -12(%ebp)
	movl %edx, -16(%ebp)

	pushl %eax
	pushl $msg_main_print3
	call  printf
	addl  $8, %esp

	movl -16(%ebp), %eax
	pushl %eax
	pushl $msg_main_print4
	call  printf
	addl  $8, %esp

	pushl $0
	call  exit
