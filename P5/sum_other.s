.global sum_other
sum_other:
    # 2 args passed in a0 and a1 registers
    # 1st arg: start address of array
    # 2nd arg: arrlen
    # return sum of every other value in array in a0 register
    
    # registers to use: 5 registers * 8 bytes
    addi sp, sp, -40 # subtract to make space
    sd t0, 32(sp)
    sd t1, 24(sp)
    sd t2, 16(sp)
    sd t3, 8(sp)
    sd t4, 0(sp)

    li t0, 0 # loop variable i
    li t1, 0 # sum
loop:
     bge t0, a1, storeSum # if i >= arrlen
     mv t2, t0 # t2 = i
     slli t2, t2, 2 # mult by 4
     mv t3, a0 # start address of array
     add t2, t2, t3 # address of array item
     lw t4, 0(t2) # load array item
     addw t1, t1, t4 # add array item (a2) to sum (t1)
     addiw t0, t0, 2 # increment i by 2
     j loop
storeSum:
    mv a0, t1
registerPreservation:
    ld t4, 0(sp)
    ld t3, 8(sp)
    ld t2, 16(sp)
    ld t1, 24(sp)
    ld t0, 32(sp)
    addi sp, sp, 40 # add to stack pointer to delete
    jalr x0, 0(x1)
