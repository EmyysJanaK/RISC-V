.data
    A: .word      0,1,2,7,-8,4,5,12,11,-2    # Declare an array of five elements
    B: .word 0,0,0,0,0,0,0,0,0,0    
    
    newline: .string "\n"
.bss
 

.text
.globl main
main:
    li a1, 44 #upper bound for loop
    li a2, 0  # loop variable
    li a3, 0  # store 0
    la t3, A
    
    lw a4, 0(t3) # a4 stores current array value
    addi a2, a2, 4
    bge a2, a1, End # end if array is finished
    addi t3, t3, 4
    bge a3, a4, -16 # repeat if negative
    
    li a5, 2
    rem a6, a4, a5
    li a5, 1
    bge a6, a5, -32
    
    la t0, B
    sw a4, 0(t0)
    addi t0, t0, 4
    
    #print B
    mv a0,a4
    li a7,1
    ecall
    
    la a0, newline
    li a7,4
    ecall
    
    
    jal -80
    
    
    # End the program
End:
    li a0, 0
    li a7, 93
    ecall
    