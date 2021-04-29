.data

.include "input_max_min_arr.s"

.text
.globl _start
_start:
    mov arrlen, %r8d
    imul $4, %r8d
    mov $0, %r9d # index
    mov $0, %r10d # min index
    mov $0, %r11d # max index
    mov $4, %r12d
    mov arr(%r9d), %r13d # min value
    mov %r13d, %r14d # max value

loop:
    cmp %r13d, arr(%r9d) # check min
    jl updateMin

checkMax:
    cmp %r14d, arr(%r9d)
    jg updateMax
    jmp incrementIndex

updateMin:
    mov %r9d, %eax
    idiv %r12d
    mov %eax, %r10d # update min index
    mov arr(%r9d), %r13d # update min value
    jmp checkMax

updateMax:
    mov %r9d, %eax
    idiv %r12d
    mov %eax, %r11d # update max index
    mov arr(%r9d), %r14d # update max value

incrementIndex:
    add $4, %r9d
    cmp %r8d, %r9d
    jl loop # check i < arrlen
    mov %r10d, minIndex
    mov %r11d, maxIndex

done:
    nop
