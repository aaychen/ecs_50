.data

format_str: .string "Sum: %d\n"

arr2:
    .long 42

arr3:
    .long 14
    .long 139

arr4:
    .long 5
    .long 20
    .long 113
    .long 5108
    .long 27
    .long 42
    .long 23874

arr5:
    .long 5
    .long 20
    .long 13
    .long 18
    .long 27
    .long 42
    .long 3
    .long 135
    .long 51
    .long 2

arr6:
    .long -5
    .long -20
    .long -13
    .long -18
    .long -27
    .long -42

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
    # Test 1: empty array (pass arrlen = 0)
    lui a0, %hi(arr2)
    addi a0, a0, %lo(arr2)
    li a1, 0 # arrlen
    jal sum_other
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf # 0

    # Test 2
    lui a0, %hi(arr2)
    addi a0, a0, %lo(arr2)
    li a1, 1 # arrlen
    jal sum_other
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf # 42

    # Test 3
    lui a0, %hi(arr3)
    addi a0, a0, %lo(arr3)
    li a1, 2 # arrlen
    jal sum_other
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf # 14

    # Test 4
    lui a0, %hi(arr4)
    addi a0, a0, %lo(arr4)
    li a1, 7 # arrlen
    jal sum_other
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf # 24019

    # Test 5
    lui a0, %hi(arr5)
    addi a0, a0, %lo(arr5)
    li a1, 10 # arrlen
    jal sum_other
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf # 99

    # Test 6
    lui a0, %hi(arr6)
    addi a0, a0, %lo(arr6)
    li a1, 6 # arrlen
    jal sum_other
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf # -45

    # Sample test from prompt
    lui a0, %hi(arr)
    addi a0, a0, %lo(arr)
    li a1, 6 # arrlen
    jal sum_other
    mv a1, a0
    lui a0, %hi(format_str)
    addi a0, a0, %lo(format_str)
    call printf # 45

    # Perform exit() system call.
    li a7, 93
    li a0, 0
    ecall
