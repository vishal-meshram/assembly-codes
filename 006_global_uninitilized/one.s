#The program shows that the uninitlize global varaibles value is 0
.section .rodata
	msg_main_print1:
	.string  "Before calling fun1: In main(): g_iNo=%d\n"

	msg_main_print2:
	.string  "After calling fun1: In main(): g_iNo=%d\n"

.section .text
.globl main
.type  main, @function
main:
	pushl %ebp
	movl  %esp, %ebp

	movl  g_iNo, %eax
	pushl %eax
	pushl $msg_main_print1
	call  printf
	addl  $8, %esp

	call  fun1

	movl  g_iNo, %eax
	pushl %eax
	pushl $msg_main_print2
	call  printf
	addl  $8, %esp

	pushl $0
	call exit 
