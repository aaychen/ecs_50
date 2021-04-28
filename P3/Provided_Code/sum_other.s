.data

.include "input_sum_other.s"

.text
.globl _start
_start:
    mov $0, %r8d # index
    mov $0, %r9d # sum
    mov $8, %r10d # /4 to get i, /2 to determine if even
    mov arrlen, %r11d
    imul $4, %r11d
    
loop:
    mov %r8d, %eax
    mov $0, %edx
    idiv %r10d # quotient in EAX, remainder in EDX
    cmp $0, %edx # check remainder
    jne incrementCounter
    add arr(%r8d), %r9d # update sum
    
incrementCounter:
    add $4, %r8d
    cmp %r11d, %r8d
    jl loop # check i < arrlen
    mov %r9d, sum

done:
    nop
