.section .rodata
	msg_fun_print:
	.string  "In Fun(): g_iNo=%d\n"

.section .data
	#.globl  g_iNo  (This line depcits that it is extern linkage)
	.type   g_iNo, @object
	.size   g_iNo, 4
	.align  4
	g_iNo:
	  .int  100

.section .text
.globl   fun1
.type    fun1, @function
fun1:
	pushl %ebp
	movl  %esp, %ebp

	movl  g_iNo, %eax
	pushl %eax
	pushl $msg_fun_print
	call  printf
	addl  $8, %esp
	
	movl  %ebp, %esp
	popl  %ebp
	ret
