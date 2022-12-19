.section .rodata
	msg_main_print:
	.string  "In main():giNo=%d\n"

#.section .data
#	.type  g_iNo, @object
#	.size  g_iNo, 4
#	.align 4
#	g_iNo:
#	 .int  2000

.section .text
.globl main
.type  main, @function
main:
	pushl %ebp
	movl  %esp, %ebp
	
	movl  g_iNo, %eax
	pushl %eax
	pushl $msg_main_print
	call  printf
	addl  $8, %esp

	call fun

	pushl $0
	call  exit
