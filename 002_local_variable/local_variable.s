.section .rodata
	msg_main_print1:
	.string "Enter the Number: "

	msg_main_scan:
	.string "%d"
	
	msg_main_print2:
	.string "The number you eneterd is: %d\n"

.section .text
.globl   main
.type    main, @function
main:
	pushl %ebp
	movl  %esp, %ebp

	subl  $4, %esp
	
	pushl $msg_main_print1
	call  printf
	addl  $4, %esp

	leal  -4(%ebp), %ebx
	pushl %ebx
 	pushl $msg_main_scan
	call  scanf
	addl  $8, %esp

	movl  -4(%ebp), %eax
	pushl %eax
	pushl $msg_main_print2
	call  printf
	addl  $8, %esp

	pushl $0
	call exit
	 
