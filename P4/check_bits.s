.text

checkBits:
# referred to https://flint.cs.yale.edu/cs421/papers/x86-asm/asm.html for shl usage
# Arguments pushed on stack in order: num, a, b
# Assume 0 <= a,b <= 31
# Place return value in RAX
    movq 24(%rsp), %r8 # 1st arg: num
    movb 16(%rsp), %r9b # 2nd arg: first bit number, a
    movb 8(%rsp), %r10b # 3rd arg: second bit number, b
checkBitA:
    movq $1, %r11 # create mask
    movb %r9b, %cl
    shl %cl, %r11 # left shift mask a times
    and %r8, %r11 # bitwise AND to see if bit a is set to 1
    cmp $0, %r11
    je false
checkBitB:
    movq $1, %r11 # create mask
    movb %r10b, %cl
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
