.data

.include "input_count_target.s"

.text
.globl _start
_start:
    mov $0, %r8d # count
    mov $0, %r9d # index
    mov $len, %r10d # string length

loop:
    mov str(%r9d), %r11b # char at str[i]
    cmp target, %r11b 
    jne incrementIndex
    inc %r8d # increment count

incrementIndex:
    inc %r9d
    cmp %r10d, %r9d # check i < len
    jl loop
    mov %r8d, count

done:
    nop
