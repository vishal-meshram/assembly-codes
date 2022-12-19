.section .rodata
	msg_main_print1:
	.string "1. Addition\n2.Substraction\n3.Multiplication\n4.Division\n"

	msg_main_print2:
	.string "Enter Your Choice: "

	msg_main_scan:
	.string "%d"

	msg_main_add:
	.string "Addition\n"

	msg_main_sub:
	.string "Substraction\n"

	msg_main_mul:
	.string "Multiplication\n"

	msg_main_div:
	.string "Division\n"
	
	msg_main_invalid:
	.string "Invalid Choice\n"

.section .text
.globl main
.type  main, @function
main:
	pushl %ebp
	movl  %esp, %ebp

	subl  $4, %esp

	pushl $msg_main_print1
	call  printf
	addl  $4, %esp

	pushl $msg_main_print2
	call  printf
	addl  $4, %esp

	leal -4(%ebp), %ebx
	pushl %ebx
	pushl $msg_main_scan
	call  scanf
	addl  $8, %esp
	
	#if (iChoice == 1)
	movl  -4(%ebp), %eax
	cmpl  $1, %eax
	jne   lable_equal_two   #if cha code if jawal rahila pahije
	pushl $msg_main_add	#mhanun ithe ulti condn check keli
	call  printf
	addl  $4, %esp
	jmp   label_exit	#print result and jmp to exit

	#if (iChoice == 2)
lable_equal_two:
	cmpl  $2, %eax
	jne   lable_equal_three	  #if ichoice !=3 so jump to check ichoice==3
	pushl $msg_main_sub
	call  printf
	addl  $4, %esp
	jmp   label_exit

	#if (iChoice == 3) 
lable_equal_three:
	cmpl  $3, %eax		#if ichoice !=3 so jump to check ichoice==4
	jne   lable_equal_four
	pushl $msg_main_mul
	call  printf
	addl  $4, %esp
	jmp   label_exit
	
	#if (iChoice == 4)
lable_equal_four:
	cmpl  $4, %eax
	jne   lable_equal_invalid   #if ichoice !=4 so print "Invalid Choice"
	pushl $msg_main_div
	call  printf
	addl  $4, %esp
	jmp   label_exit
	
lable_equal_invalid:
	pushl $msg_main_invalid
	call  printf
	addl  $4, %esp
	
label_exit:
	pushl $0
	call  exit

	

	

