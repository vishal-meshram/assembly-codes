.section .rodata
	msg_main_print1:
	.string "Enter the 3 Numbers: "

	msg_main_scan:
	.string "%d%d%d"

	msg_main_print2:
	.string "Answer=%d\n"

.section .text
.globl main
.type  main, @function
main:
	pushl %ebp
	movl  %esp, %ebp

	subl $16, %esp

	pushl $msg_main_print1
	call  printf
	addl  $4, %esp

	leal  -4(%ebp), %eax
	leal  -8(%ebp), %edx
	leal  -12(%ebp), %ecx
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_scan
	call  scanf
	addl  $16, %esp

	#iAns= iNo1 < iNo2 != iNo3
	movl -4(%ebp), %eax
	movl -8(%ebp), %edx
	cmpl %edx, %eax              #it always second no get compared with first
	jl   lable_less_than_true	
	movl $0, %eax 		     #if condition is false pushl 0 in eax
	jmp  lable_not_equal_check  #any way program is going to follow this path

lable_less_than_true:
	movl $1, %eax		    #if condition is true pushl 1 in eax

lable_not_equal_check:		  
	movl -12(%ebp), %ecx
	cmpl %ecx, %eax		 #result of first comparation is cmp wiht 3rd no
	jne  lable_no_equal_true
	movl $0, %eax
	jmp  label_print_result
	
lable_no_equal_true:
	movl $1, %eax

label_print_result:
	pushl %eax
	pushl $msg_main_print2
	call  printf
	addl  $8, %esp

	pushl $0
	call  exit	
	
