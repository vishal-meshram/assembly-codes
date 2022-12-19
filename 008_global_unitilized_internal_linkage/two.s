.section .rodata
	msg_fun1_default_print:
	.string  "The default value of g_iNo=%d\n"

	msg_fun1_print1:
	.string "Enter the value of g_iNo:\t"
	
	msg_fun1_scan:
	.string "%d"

	msg_fun1_print2:
	.string "In fun1(): g_iNo=%d\n"

.section .bss
	.lcomm g_iNo 4
	#lcomm => local common memeory
	# 4 represent only size. no need to give alignemnt

.section .text
.globl fun
.type  fun, @function
fun:
	pushl %ebp
	movl  %esp, %ebp

	movl  g_iNo, %eax
	pushl %eax
	pushl $msg_fun1_default_print
	call  printf
	addl  $8, %esp
	
	pushl $msg_fun1_print1
	call  printf
	addl  $4, %esp

	pushl $g_iNo
	pushl $msg_fun1_scan
	call  scanf
	addl  $8, %esp

	movl  g_iNo, %eax
	pushl %eax
	pushl $msg_fun1_print2
	call  printf
	addl  $8, %esp
 
	movl  %ebp, %esp
	popl  %ebp
	ret
