.data

.include "input_find_highest.s"

.text
.globl _start
_start:
# Assume all values in array > 0 (positive)
# Assume array contains at least 3 columns
# Assume values within a row are unique
# Result for each row should be largest to smallest
# arr = [[],[],[]] # 2D array
# rowIndex = colIndex = 0
# while rowIndex < numRows:
#     gMax = mMax = sMax = -1 # gMax as largest max, sMax as smallest max
#     while colIndex < numCols:
#         temp = arr[row][col]
#         if temp > gMax:
#             sMax = mMax
#             mMax = gMax
#             gMax = temp
#         elif temp > mMax:
#             sMax = mMax
#             mMax = temp
#         elif temp > sMax:
#             sMax = temp
#         colIndex++
#     output[rowIndex][0] = gMax
#     output[rowIndex][1] = mMax
#     output[rowIndex][2] = sMax
#     rowIndex++
#     colIndex = 0
    mov numRows, %eax
    imul $4, %eax
    mov numCols, %ebx
    imul $4, %ebx

    # work with some row alone
    # mov $8, %r8d # row index
    
    mov $0, %r8d # row index
    mov $0, %r9d # col index
rowLoop:
    cmp %eax, %r8d # if rowIndex >= numRows, done
    jge done
    mov $-1, %r10d # gMax, largest max
    mov $-1, %r11d # mMax
    mov $-1, %r12d # sMax, smallest max
colLoop:
    cmp %ebx, %r9d # if colIndex >= numCols, set maxes in row and run next row loop
    jge setMaxesInRow

    mov numCols, %r13d # find "index" of temp element -> (numCol * rowIndex) + colIndex
    imul %r8d, %r13d # numCol *= rowIndex
    add %r9d, %r13d # add colIndex
    mov arr(%r13d), %r14d # temp element

cond1:
    cmp %r10d, %r14d # if temp > gMax, update gmsMax
    jle cond2
    mov %r11d, %r12d # sMax = mMax
    mov %r10d, %r11d # mMax = gMax
    mov %r14d, %r10d # gMax = temp
    jmp incColIndex
cond2:
    cmp %r11d, %r14d # if temp > mMax, update msMax
    jle cond3
    mov %r11d, %r12d # sMax = mMax
    mov %r14d, %r11d # mMax = temp
    jmp incColIndex
cond3:
    cmp %r12d, %r14d # if temp > sMax, update sMax
    jle incColIndex
    mov %r14d, %r12d # sMax = temp
incColIndex:
    add $4, %r9d # colIndex++
    jmp colLoop
setMaxesInRow:
    mov %r8d, %r13d # find "index" in output array -> (rowIndex * 3) + colIndex{0,1,2}
    imul $3, %r13d # first max location
    mov $output, %r14d # address of variable output
    add %r13d, %r14d
    mov %r10d, (%r14d) # output[rowIndex][0] = gMax
    add $4, %r14d # second max location
    mov %r11d, (%r14d) # output[rowIndex][1] = mMax
    add $4, %r14d # third max location
    mov %r12d, (%r14d) # output[rowIndex][2] = sMax
    add $4, %r8d # rowIndex++
    mov $0, %r9d # colIndex = 0
    jmp rowLoop
done:
    nop
