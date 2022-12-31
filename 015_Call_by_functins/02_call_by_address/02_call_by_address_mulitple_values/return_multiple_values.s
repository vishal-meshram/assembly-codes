.section .rodata
	msg_main_print1:
	.string	"Enter two numbers: "

	msg_main_scan:
	.string "%d%d"

	msg_main_print2:
	.string "Sum is: %d\n"

	msg_main_print3:
	.string "diff is: %d\n"

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$16, %esp

	pushl	$msg_main_print1
	call	printf
	addl	$4, %esp

	leal	-4(%ebp), %eax
	leal	-8(%ebp), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$12, %esp

	movl	-4(%ebp), %eax
	movl	-8(%ebp), %edx
	leal	-12(%ebp),%ecx
	leal	-16(%ebp),%ebx
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	sumDiff
	addl	$16, %esp

	movl	-12(%ebp), %eax
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl	$8, %esp

	movl	-16(%ebp), %eax
	pushl	%eax
	pushl	$msg_main_print3
	call	printf
	addl	$8, %esp

	pushl	$0
	call	exit

.globl sumDiff
.type  sumDiff, @function
sumDiff:
	pushl	%ebp
	movl	%esp, %ebp
	
	#pahile addition karun ghyachi
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	
	addl 	%edx, %eax	#additon result is in %eax now

	#read pointer and then move addition result into it
	movl	16(%ebp), %ebx
	movl	%eax, (%ebx)

			
	#pahile subtraction karun ghyachi
	movl	8(%ebp), %eax
	
	subl 	%edx, %eax	#subtraction result is in %eax now

	#read pointer and then move addition result into it
	movl	20(%ebp), %ebx
	movl	%eax, (%ebx)

	movl	%ebp, %esp
	popl	%ebp
	ret
