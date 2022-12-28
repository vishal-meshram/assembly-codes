.section .rodata
	msg_main_print1:
	.string  "Enter 2 Numbers: "

	msg_main_scan:
	.string "%d%d"

	msg_main_print2:
	.string "Multiplication=%d\n"

.section .text
.globl main
.type  main, @function
main:
	pushl %ebp
	movl  %esp, %ebp

	subl  $12, %esp

	pushl $msg_main_print1
	call  printf
	addl  $4, %esp

	#In multiplciation never used %edx register as it is used to store
	#the result of multiplciation
	leal  -4(%ebp), %eax
	leal  -8(%ebp), %ecx
	pushl  %ecx
	pushl  %eax
	pushl  $msg_main_scan
	call   scanf
	addl   $12, %esp

	movl   -4(%ebp), %eax
	movl   -8(%ebp), %ecx
	mull   %ecx
	movl   %eax, -12(%ebp)

	pushl  %eax
	pushl  $msg_main_print2
	call   printf
	addl   $8, %esp

	pushl  $0
	call   exit
	
	
