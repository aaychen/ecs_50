.data

.include "input_max_min_arr.s"

.text
.globl _start
_start:
    mov arrlen, %r8d
    imul $4, %r8d
    mov $0, %r9d # index
    mov $0, %r10d # minIndex
    mov $0, %r11d # maxIndex
    mov $4, %r12d

loop:
    cmp %r10d, arr(%r9d)
    jl updateMin

checkMax:
    cmp %r10d, arr(%r9d)
    jg updateMax
    jmp incrementIndex

updateMin:
    mov %r9d, %eax
    idiv %r12d
    mov %eax, %r10d
    jmp checkMax

updateMax:
    mov %r9d, %eax
    idiv %r12d
    mov %eax, %r11d

incrementIndex:
    add $4, %r9d
    cmp %r8d, %r9d
    jl loop # check i < arrlen
    mov %r10d, minIndex
    mov %r11d, maxIndex

done:
    nop
