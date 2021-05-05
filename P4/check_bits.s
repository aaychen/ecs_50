.text

checkBits:
# referred to https://flint.cs.yale.edu/cs421/papers/x86-asm/asm.html for shl usage
# Assume working with 32 bit integers
# Arguments passed on stack in order (push num, a, b)
# Place return value in RAX

# num = integer_to_check
# a = bit number (0 -> LSB), 0 <= a <= 31
# b = bit number, 0 <= b <= 31
# To check if 1 is set in bit number a, b:
#     find 2^a and 2^b (can use left shift to multiply by 2)
#     bool1 = bitwise AND operation on 2^a and num
#     bool2 = bitwise AND operation on 2^b and num
#     #if bool1 and bool2:
#         return 1
#     #elif:
#         return 0
    movq 24(%rsp), %r8 # first argument -> value
    movb 16(%rsp), %r9b # second argument -> first bit number, a
    movb 8(%rsp), %r10b # third argument -> second bit number, b
checkBitA:
    movq $1, %r11 # create mask; upper 32 bits should be 0)
    movb %r9b, %cl
    shl %cl, %r11d # left shift mask a times
    mov %r8d, %r12d
    and %r12d, %r11d # bitwise AND to see if bit a is set to 1
    cmp $0, %r11d
    je false
checkBitB:
    movq $1, %r11 # create mask
    movb %r10b, %cl
    shl %cl, %r11d # left shift mask b times
    mov %r8d, %r12d
    and %r12d, %r11d # bitwise AND to see if bit b is set to 1
    cmp $0, %r11d
    je false
true:
    mov $1, %rax
    jmp end
false:
    mov $0, %rax
end:
    ret
