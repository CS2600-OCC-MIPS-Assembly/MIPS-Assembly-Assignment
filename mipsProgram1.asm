# Programmers: Dani Ekbote and Zac Strupp
# CS 2640.04
# Program 1, Getting Familiar With Assembly
# 10/29/23


.data
integerPrompt1: .asciiz "Please enter the first integer value: "
integerPrompt2: .asciiz "Please enter the second integer value: "
returnPrompt:   .asciiz "These are the integers you entered: " 

comma:   .asciiz ", "

returnAdd: .asciiz "\nThe result of adding the two integers is: "
returnSub: .asciiz "\nThe result of subtracting the two integers is: "
returnMul: .asciiz "\nThe result of multiplying the two integers is: "
returnDiv: .asciiz "\nThe result of dividing the two integers is: "

equal:     .asciiz "\nUser inputs are the same."
notEqual:  .asciiz "\nUser inputs are different."


.text
main: 
    #Part 1: User input and output
    #output the first prompt & store user input
    li $v0, 4
    la $a0, integerPrompt1
    syscall

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

    # Part 2: Arithmetic Operation Practice 
    add $s2, $s0, $s1 # sum in $s2
    sub $s3, $s0, $s1 # difference in $s3
    mul $s4, $s0, $s1 # product in $s4 
    div $s0, $s1      # quotient in $low
    mflo $s5	      # quotient in $s5
    
    # Output Arithmetic results
    
    # Addition 
    li $v0, 4
    la $a0, returnAdd
    syscall
    
    li $v0, 1
    move $a0, $s2
    syscall
    
    # Subtraction
    li $v0, 4
    la $a0, returnSub
    syscall
    
    li $v0, 1
    move $a0, $s3
    syscall
    
    # Multiplication 
    li $v0, 4
    la $a0, returnMul
    syscall
    
    li $v0, 1
    move $a0, $s4
    syscall
    
    # Division
    li $v0, 4
    la $a0, returnDiv
    syscall
    
    li $v0, 1
    move $a0, $s5
    syscall
    
    # Part 3
    
    bne $s0, $s1 Else
    li $v0, 4
    la $a0, equal
    syscall
    j Exit
    Else: li $v0, 4
    	  la $a0, notEqual
    	  syscall
    Exit:
    
    #exit the program
    li $v0, 10
    syscall