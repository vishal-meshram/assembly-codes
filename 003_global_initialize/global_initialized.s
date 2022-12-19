.section .rodata
	msg_main_print:
	.string "The value of global variable is: %d\n"

.section .data
	.globl num
	.type  num, @object
	.size  num, 4
	.align 4
	num:
	  .int  1000

.section .text
.globl main
.type  main, @function
main:
	pushl %ebp
	movl  %esp, %ebp

	pushl num
	pushl $msg_main_print
	call printf
	addl $8, %esp
	
	pushl $0
	call  exit
