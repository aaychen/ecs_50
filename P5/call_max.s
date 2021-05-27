.data

format_str: .string "Max: %d\n"

.text
.globl main
main:
    # Test 1
    li a0, 5
    li a1, 13
    jal max
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf

    # Test 2
    li a0, 20
    li a1, 13
    jal max
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf

    # Test 3
    li a0, 100
    li a1, 100
    jal max
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf

    # Test 4
    li a0, -23
    li a1, -10
    jal max
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf

    # Test 5
    li a0, -15
    li a1, -40
    jal max
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf

    # Test 6
    li a0, -294
    li a1, -294
    jal max
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf

    # Test 7
    li a0, -23
    li a1, 49
    jal max
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf

    # Test 8
    li a0, 239
    li a1, -40
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
