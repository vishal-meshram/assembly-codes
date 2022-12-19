.section .rodata
	msg_main_print1:
	.string "Enter two numbers: \t"

	msg_main_scan:
	.string "%d%d"

	msg_main_print2:
	.string "In main(): iNo1 = %d\t iNo2 = %d\t iNo3 = %d\n"

# in C code=> int iNo1 = 10
# global initialize varaible
.section .data
	.globl iNo1
	.type  iNo1, @object
	.size  iNo1, 4
	.align 4
	iNo1:
	  .int  10

# in C code=> int iNo2;
# global uninitialize varaible
.section .bss
	.comm iNo2, 4, 4

.section .text
.globl main
.type  main, @function
main:
	pushl %ebp
	movl  %esp, %ebp

	subl  $4, %esp     #iNo3 is a local variable so make space on stack

	pushl $msg_main_print1   
	call  printf
	addl  $4, %esp

	#scanf("%d%d",&iNo2,&iNo3);
	leal  -4(%ebp), %ebx      #load effecitive address of local var iNo3
	pushl %ebx		  
	pushl $iNo2		  #iNo2 is global unitialize varaible
	pushl $msg_main_scan
	call  scanf
	addl  $12, %esp

	#printf("%d%d%d",iNo1, iNo2, iNo3);
	movl  -4(%ebp), %eax	  # mov the value of iNo3 which is local var
	movl  iNo2, %edx	  # mov the value of iNo2 which is global uninit
	movl  iNo1, %ecx	  # mov the value of iNO3 which is global init
	pushl %eax
	pushl %edx		  #followed the seq of reg: eax,edx,ecx,ebx
	pushl %ecx	
	pushl $msg_main_print2
	call  printf
	addl  $16, %esp
 
	call fun1		 #call to fun1() which is written in "two.s" 

	pushl $0
	call exit

	
