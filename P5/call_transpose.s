.data

input:
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5
    .word 6

output:
    .rept 6
    .word -1
    .endr

format_str1: .string "input[%d]: %d\n"
format_str2: .string "output[%d]: %d\n"

.text
.globl main
main:
    lui a0, %hi(input)
    addi a0, a0, %lo(input)
    li a1, 3
    li a2, 2
    lui a3, %hi(output)
    addi a3, a3, %lo(output)
    jal transpose

    mv s4, a0 # input address
    mv s5, a1 # numRows
    mv s6, a2 # numCols
    mv s7, a3 # output address
    li s8, 1
    li s9, 2
printInput:
    # Print input matrix items in row major order
    li s0, 0 # loop variable i
    mul s1, s5, s6 # numItems = numRows * numCols
    # Load input format string (starting address) into s3
    lui s3, %hi(format_str1)
    addi s3, s3, %lo(format_str1)
    # input address already loaded in s4
    j printLoop
printOutput:
    beq s8, s9, afterLoop
    mv s8, s9
    # Print output matrix items in row major order
    li s0, 0 # loop variable i
    mul s1, s5, s6 # numItems = numRows * numCols
    # Load format string (starting address) into s3
    li s3, 0
    lui s3, %hi(format_str2)
    addi s3, s3, %lo(format_str2)
    mv s4, s7 # output address
printLoop:
    bge s0, s1, printOutput
    # Set up arguments to printf
    mv a0, s3 # a0 = s3 (format string)
    mv a1, s0 # a1 = s0 (loop variable)
    slli t0, a1, 2 # t0 = a1 << 2
    add t0, t0, s4 # t0 = t0 + output
    lw a2, 0(t0) # a2 = Mem[0 + t0]
    call printf
    addiw s0, s0, 1
    j printLoop

afterLoop:
    # Perform exit() system call.
    li a7, 93
    li a0, 0
    ecall
