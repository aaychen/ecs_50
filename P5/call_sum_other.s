.data

format_str: .string "Sum: %d\n"

arr:
    .long 5
    .long 20
    .long 13
    .long 18
    .long 27
    .long 42

.text
.globl main
main:
    lui a0, %hi(arr)
    addi a0, a0, %lo(arr)
    li a1, 6
    jal sum_other
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf
    # Perform exit() system call.
    li a7, 93
    li a0, 0
    ecall
