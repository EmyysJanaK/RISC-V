.data
    A: .word 0,1,0,0,0,0,0,0,0,0,0,0,0 #fibonacci array
    newline: .string "\n"
.text
.global main
main:
    li t0, 0     #loop variable
    li t1, 11   #loop control
    
    #initializing adresses
    la a1,A
    la a2,A
    addi a2, a2, 4
    la a3,A
    addi a3, a3, 8
    
    #branching
    bge t0, t1, End
    
    li a4,0
    lw a5, 0(a1)
    lw a6, 0(a2)
    add a4, a4, a5
    add a4, a4, a6
    sw a4, 0(a3)
    
    #printing
    mv a0,a4
    li a7, 1
    ecall
    la a0, newline
    li a7, 4
    ecall
    
    
    #incrementing addresses
    addi a1, a1, 4
    addi a2, a2, 4
    addi a3, a3, 4
    
    #incrementing loop variable
    addi t0, t0, 1
    
    jal -72
    
End:
    li a0, 0
    li a7, 93
    ecall
    
    
    
    
    