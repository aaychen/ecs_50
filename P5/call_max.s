.data

format_str: .string "Max: %d\n"

.text
.globl main
main:
    li a0, 5
    li a1, 13
    jal max
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf
    # Perform exit() system call.
    # Source: https://www.robalni.org/riscv/linux-syscalls-64.html
    li a7, 93
    li a0, 0
    ecall
