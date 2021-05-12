.data

.include "input_find_highest.s"

.text
.globl _start
_start:
# Test Cases:
# PASSED | numRows = 1, numCols = 3
# PASSED | numRows > 1, numCols = 3
# PASSED |numRows = 1, numCols > 3
# PASSED | numRows > 1, numCols > 3
#
# Assume all values in array > 0 (positive)
# Assume array contains at least 3 columns
# Assume values within a row are unique
# Result for each row should be largest to smallest
    mov numRows, %eax
    mov numCols, %ebx
    mov $arr, %ecx # start address of arr
    mov $output, %edx # start address of output
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
    # pos of element in row-major order = (rowIndex * numCols) + colIndex
    mov %r8d, %r13d # rowIndex
    imul %ebx, %r13d # rowIndex * numCols
    add %r9d, %r13d # (rowIndex * numCols) + colIndex
    mov (%ecx, %r13d, 4), %r14d # get temp element
cond1:
    cmp %r10d, %r14d # if temp > gMax, update gmsMax
    jle cond2
    mov %r11d, %r12d # sMax = mMax
    mov %r10d, %r11d # mMax = gMax
    mov %r14d, %r10d # gMax = temp
    jmp incColIndex
cond2:
    cmp %r11d, %r14d # elif temp > mMax, update msMax
    jle cond3
    mov %r11d, %r12d # sMax = mMax
    mov %r14d, %r11d # mMax = temp
    jmp incColIndex
cond3:
    cmp %r12d, %r14d # elif temp > sMax, update sMax
    jle incColIndex
    mov %r14d, %r12d # sMax = temp
incColIndex:
    inc %r9d # colIndex++
    jmp colLoop
setMaxesInRow:
    # position in output array = (rowIndex * 3) + colIndex{0,1,2}
    mov %r8d, %r13d # rowIndex
    imul $3, %r13d # rowIndex * 3 + 0 -> first max location
    mov %r10d, (%edx, %r13d, 4) # output[rowIndex][0] = gMax
    inc %r13d # second max position
    mov %r11d, (%edx, %r13d, 4) # output[rowIndex][1] = mMax
    inc %r13d # third max position
    mov %r12d, (%edx, %r13d, 4) # output[rowIndex][2] = sMax
    inc %r8d # rowIndex++
    mov $0, %r9d # colIndex = 0
    jmp rowLoop
done:
    nop
