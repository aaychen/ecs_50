.text

transpose:
    # TODO: function instructions
# turn columns into rows, rows into columns
# arrays in row major order
# does not return anything
# cannot modify original array
#
# traverse input array in column major order
# add items visited to output array which should result in transposed row major order
# input = [[],[]] # 2D array
# output = [[],[],[]] # 2D array
# rowIndex = colIndex = 0
# while colIndex < numCols:
#     while rowIndex < numRows:
#         # turn item(row,col) to item(col,row)
#         temp = input[rowIndex][colIndex]
#         output[colIndex][rowIndex] = temp
    mov 32(%rsp), %eax # 1st arg: address of input matrix
    mov 24(%rsp), %ebx # 2nd arg: numRows
    imul $4, %ebx
    mov 16(%rsp), %ecx # 3rd arg: numCols
    mov %ecx, %esi # literal numCols in input matrix
    imul $4, %ecx
    mov 8(%rsp), %edx # 4th arg: address of output matrix
    mov $0, %r8d # col index
    mov $0, %r9d # row index
    mov %edx, %r11d # track insert location in output matrix
colLoop:
    cmp %ecx, %r8d # if colIndex >= numCols, done
    jge end
rowLoop:
    cmp %ebx, %r9d # if rowIndex >= numRows, increment colIndex and reset rowIndex
    jge incColIndex
    mov %esi, %r10d # numCols
    imul %r9d, %r10d # numCols * rowIndex
    add %r8d, %r10d # numCols * rowIndex + colIndex -> tempItem location
    add %eax, %r10d
    mov (%r10d), %r12d
    mov %r12d, (%r11d)
    add $4, %r9d # increment rowIndex
    add $4, %r11d # change insert location
    jmp rowLoop
incColIndex:
    add $4, %r8d # increment colIndex
    mov $0, %r9d # reset rowIndex
    jmp colLoop
end:
    ret
