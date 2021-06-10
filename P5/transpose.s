.global transpose
transpose:
    # 4 args passed in registers a0 - a3
    # 1st arg: start address of input matrix
    # 2nd arg: numRows
    # 3rd arg: numCols
    # 4th arg: start address of output matrix

    # registers to use: 6 registers * 8 bytes
    addi sp, sp, -48 # subtract to make space
    sd t0, 40(sp)
    sd t1, 32(sp)
    sd t2, 24(sp)
    sd t3, 16(sp)
    sd t4, 8(sp)
    sd t5, 0(sp)

    li t0, 0 # col index
    li t1, 0 # row index
    mv t4, a3 # track insert location in output matrix
colLoop:
    bge t0, a2, registerPreservation # if colIndex >= numCols
rowLoop:
    bge t1, a1, incColIndex # if rowIndex >= numRows
    mv t2, t1 # t2 = t1 = rowIndex
    slli t2, t2, 2 # t2 *= 4
    mul t2, t2, a2 # t2 *= numCols
    slli t5, t0, 2 # t5 = colIndex * 4
    add t2, t2, t5 # t2 += t6
    add t2, t2, a0 # t2 += input
    lw t3, 0(t2) # input item
    sw t3, 0(t4) # set output matrix
    addi t1, t1, 1 # increment rowIndex
    addi t4, t4, 4 # increment output insert location
    j rowLoop
incColIndex:
    addi t0, t0, 1 # increment colIndex
    li t1, 0 # reset rowIndex
    j colLoop
registerPreservation:
    ld t5, 0(sp)
    ld t4, 8(sp)
    ld t3, 16(sp)
    ld t2, 24(sp)
    ld t1, 32(sp)
    ld t0, 40(sp)
    addi sp, sp, 48 # add to stack pointer to delete
    jalr x0, 0(x1)
