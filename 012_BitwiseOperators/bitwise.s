.section .rodata
	msg_main_print1:
	.string "Enter two Numbers: "

	msg_main_scan:
	.string "%d%d"
	
	msg_main_and:
	.string "And = %d\n"

	msg_main_or:
	.string "OR = %d\n"

	msg_main_xor:
	.string "X-OR = %d\n"

	msg_main_not_no1:
	.string "NOT iNo1 = %d\n"

	msg_main_not_no2:
	.string "NOT iNo2 = %d\n"

	msg_main_left_shift:
	.string "iNo1<<2 = %d\n"

	msg_main_right_shift:
	.string "iNo1>>2 = %d\n"

	msg_main_left_shift_no2:
	.string "iNo1<<2 = %d\n"

	msg_main_right_shift_no2:
	.string "iNo1>>2 = %d\n"

.section .text
.globl main
.type  main, @function
main:
	pushl %ebp
	movl  %esp, %ebp

	subl  $8, %esp

	pushl $msg_main_print1
	call  printf
	addl  $4, %esp

	leal  -4(%ebp), %eax
	leal  -8(%ebp), %edx
	pushl %edx
	pushl %eax
	pushl $msg_main_scan
	call  scanf
	addl  $12, %esp

	#AND => iNo1 & iNo2
	movl  -4(%ebp), %eax
	movl  -8(%ebp), %edx
	andl  %edx, %eax
	pushl %eax
	pushl $msg_main_and
	call  printf
	addl  $8, %esp

	#OR => iNo1 | iNo2
	movl  -4(%ebp), %eax
	movl  -8(%ebp), %edx
	orl   %edx, %eax
	pushl %eax
	pushl $msg_main_or
	call  printf
	addl  $8, %esp

	#X-OR => iNo1 ^ iNo2
	movl  -4(%ebp), %eax
	movl  -8(%ebp), %edx
	xorl  %edx, %eax
	pushl %eax
	pushl $msg_main_xor
	call  printf
	addl  $8, %esp

	#NOT => ~iNo1
	movl  -4(%ebp), %eax
	notl  %eax
	pushl %eax
	pushl $msg_main_not_no1
	call  printf
	addl  $8, %esp

	#NOT => ~iNo2
	movl  -8(%ebp), %eax
	notl  %eax
	pushl %eax
	pushl $msg_main_not_no2
	call  printf
	addl  $8, %esp
 
	#Left Shift => iNo1<<2
	movl  -4(%ebp), %eax
	sall  $2, %eax
	pushl %eax
	pushl $msg_main_left_shift
	call  printf
	addl  $8, %esp

	#Right Shift => iNo1>>2
	movl  -4(%ebp), %eax
	sarl  $2, %eax
	pushl %eax
	pushl $msg_main_right_shift
	call  printf
	addl  $8, %esp

	#Left Shift => iNo2<<2
	movl  -8(%ebp), %eax
	sall  $2, %eax
	pushl %eax
	pushl $msg_main_left_shift_no2
	call  printf
	addl  $8, %esp

	#Right Shift => iNo2>>2
	movl  -8(%ebp), %eax
	sarl  $2, %eax
	pushl %eax
	pushl $msg_main_left_shift_no2
	call  printf
	addl  $8, %esp

	pushl $0
	call  exit

