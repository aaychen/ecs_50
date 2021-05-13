.text

transpose:
# Traverse input array in column major order
# Add items visited to output array which should result in column major order
    push %rbp
    mov %rsp, %rbp
    push %rax
    push %rbx
    push %rcx
    push %rdx
    push %r8
    push %r9
    push %r10
    push %r11
    push %r12
    mov 40(%rbp), %eax # 1st arg: start address of input matrix (32+8 to account for rbp on stack)
    mov 32(%rbp), %ebx # 2nd arg: numRows
    mov 24(%rbp), %ecx # 3rd arg: numCols
    mov 16(%rbp), %edx # 4th arg: start address of output matrix
    mov $0, %r8d # col index
    mov $0, %r9d # row index
    mov $0, %r10d # track insert location in output matrix
colLoop:
    cmp %ecx, %r8d # if colIndex >= numCols, done
    jge regPreservation
rowLoop:
    cmp %ebx, %r9d # if rowIndex >= numRows, increment colIndex and reset rowIndex
    jge incColIndex
    # pos of element in row-major order = (rowIndex * numCols) + colIndex
    mov %r9d, %r11d # rowIndex
    imul %ecx, %r11d # rowIndex * numCols
    add %r8d, %r11d # (rowIndex * numCols) + colIndex
    mov (%eax, %r11d, 4), %r12d # temp item
    mov %r12d, (%edx, %r10d, 4) # move temp item to output matrix
    inc %r9d # increment rowIndex
    inc %r10d # change insert location
    jmp rowLoop
incColIndex:
    inc %r8d # add $4, %r8d # increment colIndex
    mov $0, %r9d # reset rowIndex
    jmp colLoop
regPreservation:
    pop %r12
    pop %r11
    pop %r10
    pop %r9
    pop %r8
    pop %rdx
    pop %rcx
    pop %rbx
    pop %rax
    mov %rbp, %rsp
    pop %rbp
transposeEnd:
    ret
