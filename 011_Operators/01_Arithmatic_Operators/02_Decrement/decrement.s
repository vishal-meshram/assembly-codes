.section .rodata
	msg_main_print:
	.string "iNo1=%d\niNo2=%d\niAns1=%d\niAns2=%d\n"

.section .text
.globl main
.type  main, @function
main:
	pushl %ebp
	movl  %esp, %ebp

	movl $10, -4(%ebp)
	movl $20, -8(%ebp)
	
	#iAns1=iNo1--;
	movl -4(%ebp), %eax
	movl %eax, -12(%ebp)
	subl $1, %eax
	movl %eax, -4(%ebp)

	#iAns2=--iNo2
	movl -8(%ebp), %eax
	subl $1, %eax
	movl %eax, -8(%ebp)
	movl %eax, -16(%ebp)

	movl -4(%ebp), %eax
	movl -8(%ebp), %edx
	movl -12(%ebp), %ecx
	movl -16(%ebp), %ebx
	pushl %ebx
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_print
	call  printf
	addl  $20, %esp

	pushl $0
	call  exit
