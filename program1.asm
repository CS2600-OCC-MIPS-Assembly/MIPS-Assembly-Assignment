#Programmers: Zac Strupp, Dani Ekbote
#CS 2600.04
#Program 1, Getting Familiar With Assembly
#10/29/23


.data
#Formatting 
comma: .asciiz ", "
#Part 1 strings
integerPrompt1: .asciiz "Please enter the first integer value: "
integerPrompt2:	.asciiz "Please enter the second integer value: "
returnPrompt: .asciiz "These are the integers you entered: " 
#Part 2 strings
returnAdd: .asciiz "\nThe result of adding the two integers is: "
returnSub: .asciiz "\nThe result of subtracting the two integers is: "
returnMul: .asciiz "\nThe result of multiplying the two integers is: "
returnDiv: .asciiz "\nThe result of dividing the two integers is: "
#Part 3 strings
equal: .asciiz "\nUser inputs are the same." 
notEqual: .asciiz "\nUser inputs are different." 

.text
main: 
	#Part 1: User input and output
	#output the first prompt
	li $v0, 4
	la $a0, integerPrompt1
	syscall
	
	#read an integer from the user and store input in $s0
	li $v0, 5 
	syscall
	move $s0, $v0
	
	#do the same for the second prompt 
	li $v0, 4
	la $a0, integerPrompt2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	#echo integers back to user 
	li $v0, 4
	la $a0, returnPrompt
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, comma #formatting
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	#Part 2: Arithmetic Operation Practice 
	#arithmetic operations
	add $s2, $s0, $s1 
	sub $s3, $s0, $s1 
	mul $s4, $s0, $s1 
	div $s0, $s1 
	mflo $s5 #retrieve the division results from the special register 
	
	#output results 
	li $v0, 4
	la $a0, returnAdd
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 4
	la $a0, returnSub
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	li $v0, 4
	la $a0, returnMul
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall
	
	li $v0, 4
	la $a0, returnDiv
	syscall
	
	li $v0, 1
	move $a0, $s5
	syscall
	
	#Part 3: Conditions
	#Compare the user inputs
	beq $s0, $s1, same
	bne $s0, $s1, different
	
	#if the user inputs are the same 
same: 
	li $v0, 4
	la $a0, equal
	syscall
	j exit
	
	#If the user inputs are not equal
different: 
	li $v0, 4
	la $a0, notEqual
	syscall
	j exit
	
	#exit the program
exit: 
	li $v0, 10
	syscall
	
	