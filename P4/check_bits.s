.text

checkBits:
# referred to https://flint.cs.yale.edu/cs421/papers/x86-asm/asm.html for shl usage
# Arguments pushed on stack in order: num, a, b
# Assume 0 <= a,b <= 31
# Place return value in RAX
    movq 24(%rsp), %r8 # 1st arg: num
checkBitA:
    movb 16(%rsp), %cl # 2nd arg: first bit number, a
    movq $1, %r11 # create mask
    shl %cl, %r11 # left shift mask a times
    and %r8, %r11 # bitwise AND to see if bit a is set to 1
    cmp $0, %r11
    je false
checkBitB:
    movb 8(%rsp), %cl # 3rd arg: second bit number, b
    movq $1, %r11 # create mask
    shl %cl, %r11 # left shift mask b times
    and %r8, %r11 # bitwise AND to see if bit b is set to 1
    cmp $0, %r11
    je false
true:
    mov $1, %rax
    jmp end
false:
    mov $0, %rax
end:
    ret
