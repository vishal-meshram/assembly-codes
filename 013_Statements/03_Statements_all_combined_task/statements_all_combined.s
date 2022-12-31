.section .rodata
	msg_main_menu:
	.string	"1. Addition\n2. Subtraction\n 3. Mulitplication\n 4. Division\n5. Exit\n"

	msg_main_print1:
	.string "Enter your choice: "

	msg_main_print2:
	.string "Enter two numbers: "

	msg_main_scan:
	.string "%d%d"

	msg_main_print_default:
	.string "Enter valid choice\n"

	msg_main_print_result:
	.string "Answer = %d\n\n"

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$16, %esp

	#do while loop
	pushl	$msg_main_menu		#print menu message
	call	printf
	addl	$4, %esp

	pushl	$msg_main_print1	#print "Enter your choice msg"
	call	printf
	addl	$4, %esp

	leal	-16(%ebp), %eax		#scan the choice and store in iCh
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp

	

	
		

	pushl	$0
	call	exit
