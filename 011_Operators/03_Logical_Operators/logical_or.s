.section .rodata
	msg_main_print1:
	.string "Enter 3 numbers: "
	
	msg_main_scan:
	.string "%d%d%d"

	msg_main_print2:
	.string "iNo1=%d\niNo2=%d\niNo3=%d\niAns=%d\n"

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

	leal  -4(%ebp), %eax
	leal  -8(%ebp), %edx
	leal  -12(%ebp), %ecx
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_scan
	call  scanf
	addl  $16, %esp

	#iAns = iNo1 && iNo2++ || iNo3++

	movl  -4(%ebp), %eax
	cmpl  $0, %eax
	je    label_zero_true_check_no3
	movl  -8(%ebp), %eax
	addl  $1, -8(%ebp)	
	cmpl  $0, %eax
	je    label_zero_true_check_no3
	movl  $1, %eax
	jmp   final_result		

label_zero_true_check_no3:
	movl -12(%ebp), %eax
	addl $1, -12(%ebp)
	cmpl $0, %eax
	je   final_result
	movl $1, %eax
	jmp print_result

final_result:
	movl %eax, -16(%ebp)

print_result:		
	movl -4(%ebp), %edx
	movl -8(%ebp), %ecx
	movl -12(%ebp),%ebx
	movl -16(%ebp),%eax
	pushl %eax
	pushl %ebx
	pushl %ecx
	pushl %edx
	pushl $msg_main_print2
	call  printf
	addl  $20, %esp

	pushl $0
	call  exit
