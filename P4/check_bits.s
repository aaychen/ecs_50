.text

checkBits:
# Test Cases:
# PASSED | num=1, a=0, b=31 -> 0
# PASSED | num=1, a=31, b=0 -> 0
# PASSED | num=7, a=0, b=2 -> 1
# PASSED | num=7, a=0, b=1 -> 1
# PASSED | num=-10, a=0, b=31 -> 0
# PASSED | num=-10, a=31, b=30 -> 1
#
# referred to https://flint.cs.yale.edu/cs421/papers/x86-asm/asm.html for shl usage with CL register
    push %rbp
    mov %rsp, %rbp
    push %r8
    push %rcx
    push %r11
    movq 32(%rbp), %r8 # 1st arg: num (24+8 to account for rbp on stack)
checkBitA:
    movb 24(%rbp), %cl # 2nd arg: first bit number, a
    movq $1, %r11 # create mask
    shl %cl, %r11 # left shift mask a times
    and %r8, %r11 # bitwise AND to see if bit a is set to 1
    cmp $0, %r11
    je false
checkBitB:
    movb 16(%rbp), %cl # 3rd arg: second bit number, b
    movq $1, %r11 # create mask
    shl %cl, %r11 # left shift mask b times
    and %r8, %r11 # bitwise AND to see if bit b is set to 1
    cmp $0, %r11
    je false
true:
    mov $1, %rax
    jmp regPreservation
false:
    mov $0, %rax
regPreservation:
    pop %r11
    pop %rcx
    pop %r8
    mov %rbp, %rsp
    pop %rbp
checkBitsEnd:
    ret
