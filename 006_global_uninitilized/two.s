.section .rodata
	msg_default_value:
	.string "The default value of g_iNo=%d\n"

	msg_fun_print1:
	.string "Enter the Number:\t"

	msg_fun_scan:
	.string "%d"
	
	msg_fun_print:
	.string  "In fun(): g_iNo=%d\n"

.section .bss
	.comm g_iNo, 4, 4  
	# .comm => means common memory area
	# g_iNo => variable Name
	# 4 	=> size
	# 4	=> align

.section .text
.globl fun1
.type  fun1, @function
fun1:
	pushl %ebp
	movl  %esp, %ebp

	movl  g_iNo, %eax
	pushl %eax
	pushl $msg_default_value
	call  printf
	addl  $8, %esp

	pushl $msg_fun_print1
	call  printf
	addl  $4, %esp
	
	pushl $g_iNo
	pushl $msg_fun_scan
	call  scanf
	addl  $8, %esp

	movl  g_iNo, %eax
	pushl %eax
	pushl $msg_fun_print
	call  printf
	addl  $8, %esp
		
	movl %ebp, %esp
	popl  %ebp
	ret 	
