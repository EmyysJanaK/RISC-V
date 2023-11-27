.data
    A: .word 1,2,3,4,5,6,7,8,9,10,11,12
    B: .word 2,4,6,8,10,12,14,16,18,20,22,24
    C: .word 0,0,0,0,0,0,0,0,0,0,0,0
    
    newline: .string "\n"
.text
.global main

main:
    li t1, 12 # loop upper bound
    
    #initializing adresses
    la a1, A
    la a2, B
    addi a2, a2, 44 # for B start from last
    la a3, C
    
    #loop control
    li t0, 0         # loop variable
    bge t0, t1, End
    
    # values for C
    lw a4, 0(a1)
    lw a5, 0(a2)
    
    add a4, a4, a5
    sw a4, 0(a3)
    
    #printing
    mv a0, a4
    li a7, 1
    ecall
    la a0, newline
    li a7, 4
    ecall
    
    
    #incrementing adresses
    addi a1, a1, 4
    addi a2, a2, -4
    addi a3, a3, 4
    
    addi t0, t0, 1
    jal -64
    
End:
    li a0,0
    li a7, 93
    ecall
    
    
    