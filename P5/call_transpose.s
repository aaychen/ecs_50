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

format_str: .string "output[%d]: %d\n"

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

    # Print output matrix items in row major order
    li s0, 0 # loop variable i
    mul s1, a1, a2 # numItems = numRows * numCols
    # Load format string (starting address) into s3
    lui s3, %hi(format_str)
    addi s3, s3, %lo(format_str)
    mv s4, a3
printLoop:
    bge s0, s1, afterLoop
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
