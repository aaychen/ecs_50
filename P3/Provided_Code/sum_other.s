.data

.include "input_sum_other.s"

# TODO: Any additional variables that you need go here.


.text
.globl _start
_start:
    # TODO: Your code goes here.
    mov $0, %r8d # counter
    mov $0, %r9d # sum
    mov $2, %r10d
    mov $0, %r11d # index
    
loop:
    mov %r8d, %eax
    mov $0, %edx
    idiv %r10d # quotient in EAX, remainder in EDX
    cmp $0, %edx # check remainder
    jne incrementCounter
    add arr(%r11d), %r9d
    
incrementCounter:
    inc %r8d
    add $4, %r11d
    cmp arrlen, %r8d
    jl loop
    mov %r9d, sum

done:
    nop
