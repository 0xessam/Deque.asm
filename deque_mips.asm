.data
deque: .space 40
frontIdx: .word -1          
rearIdx: .word 10
MAX_SIZE: .word 10
used: .word 0          
error_full_message: .asciiz "Deque is Full :(\n"
error_empty_message: .asciiz "Deque is Empty :(\n"
space: .asciiz ","

newline: .asciiz "\n"
.text
.globl main

main: 
   
     
    li $v0, 10
    syscall

    
Empty_error :
    li $v0, 4            
    la $a0, error_empty_message    
    syscall
    
    jr $ra    
    
Full_error :
    li $v0, 4            
    la $a0, error_full_message
    syscall
    
    jr $ra

push_front:
    lw $t1, frontIdx
    addi $t1 , $t1 , 1 
    lw $t2, MAX_SIZE
    lw $t3, used
    beq $t3, $t2, Full_error
    la $t4, deque
    sll $t5, $t1, 2
    add $t4, $t4, $t5
    sw $a0, 0($t4)
    sw $t1, frontIdx
    addi $t3, $t3, 1
    sw $t3, used

    jr $ra

push_back:
    lw $t1, rearIdx
    lw $t2, MAX_SIZE
    lw $t3, used
    addi $t1, $t1, -1
    beq $t3, $t2, Full_error
    la $t4, deque
    sll $t5, $t1, 2
    add $t4, $t4, $t5
    sw $a0, 0($t4)
    sw $t1, rearIdx
    addi $t3, $t3, 1
    sw $t3, used

    jr $ra

pop_front:
    lw $t1, frontIdx
    lw $t2, used
    beq $t2, $zero, Empty_error
    addi $t1, $t1, -1
    sw $t1, frontIdx
    addi $t2, $t2, -1
    sw $t2, used

    jr $ra

pop_back:

    lw $t1, rearIdx
    lw $t2, used
    beq $t2, $zero, Empty_error
    addi $t1, $t1, 1
    sw $t1, rearIdx
    addi $t2, $t2, -1
    sw $t2, used

    jr $ra


display:
    lw $t1, frontIdx      
    lw $t2, rearIdx       
    la $t4 ,  deque    
    displayfrontloop:
    	bltz $t1 , exitedisplayfront
    	sll $t5 , $t1 , 2 
    	add $t5 , $t4 , $t5
    	lw $a0 , 0($t5)
   	 li $v0, 1
        syscall

        li $v0, 4
        la $a0, space
        syscall
    	addi $t1  , $t1, -1
    	j displayfrontloop
    
    
    exitedisplayfront:
    # print the back 
    lw $t1 , MAX_SIZE
    	addi $t1  , $t1, -1
    displayback:
    	blt $t1 , $t2 , exitedisplayback
 	sll $t5 , $t1 , 2 
    	add $t5 , $t4 , $t5
    	lw $a0 , 0($t5)
   	 li $v0, 1
        syscall

        li $v0, 11
        li $a0, ','
        syscall
    	addi $t1  , $t1, -1
    	j displayback
    
    exitedisplayback:
    
      li $v0 , 4 
      la $a0 , newline
      syscall 
      jr $ra 
	
            
