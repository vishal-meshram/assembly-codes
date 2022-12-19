.section .rodata
	msg_main_print:
	.string  "In main():g_iNo=%d\n"

#.section .data
#	.type g_iNo, @object
#	.size g_iNo, 4
#	.align 4
# 	g_iNo:
#	  .int  1000
# If this portaion is removed. you will get an error. Because 
# In two.s g_iNo is static/local variable. so, you can not access it here.
#if thsi portion is added means one.s gets its local variable

.section .text
.globl  main
.type   main, @function
main:
	pushl  %ebp
	movl   %esp, %ebp

	movl   g_iNo, %eax
	pushl  %eax
	pushl  $msg_main_print
	call   printf
	addl   $8, %esp

	call   fun1

	pushl  $0
	call   exit
