.section .rodata
	msg_fun1_print1:
	.string "Enter Number: \t"

	msg_fun1_scan:
	.string "%d"
	
	msg_fun1_print2:
	.string "In fun1(): iNo1 = %d\t iNo2 = %d\n"

	msg_fun2_print:
	.string "In static Fun2()\n"

# in C code=> static int iNo1;
# global uninitialize varaible with internal linkage
.section .bss
	.lcomm iNo1, 4
	#lcomm => local common memory -> global unitialize internal linkage

# in C code=> static int iNo2=40;
# global initialize varaible with internal linkage
.section .data
	.type  iNo2, @object
	.size  iNo2, 4
	.align 4
	iNo2:
	  .int  40

.section .text
.globl fun1
.type  fun1, @function
fun1:
	pushl %ebp
	movl  %esp, %ebp

	pushl $msg_fun1_print1
	call  printf
	addl  $4, %esp

	#scanf("%d",&iNo1)
	pushl $iNo1
	pushl $msg_fun1_scan
	call  scanf
	addl  $8, %esp

	#printf("%d%d",iNo1,iNo2);
	movl  iNo1, %eax
	movl  iNo2, %edx
	pushl %edx
	pushl %eax
	pushl $msg_fun1_print2
	call  printf
	addl  $12, %esp	

	call  fun2     #call to fun2() written in same file
	
	movl  %ebp, %esp
	popl  %ebp
	ret

#static void fun2()
.type fun2, @function
fun2:
	pushl %ebp
	movl  %esp, %ebp

	pushl $msg_fun2_print
	call  printf
	addl  $4, %esp

	movl  %ebp, %esp
	popl  %ebp
	ret
	
