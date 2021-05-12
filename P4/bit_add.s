.data

.include "input_bit_add.s"

.text
.globl _start
_start: # with if/else construct
# Test Cases:
# PASSED | numBits = 0
# PASSED | numBits = 1; 0 + 0
# PASSED | numBits = 1; 1 + 0; no overflow
# PASSED | numBits = 1; 1 + 1; overflow
# PASSED | numBits > 1; both bit strings all 0s
# PASSED | numBits > 1; both bit strings all 1s
    mov $bits1, %r8d # start address of bits1 array
    mov $bits2, %r9d # start address of bits2 array
    mov numBits, %r10d
    dec %r10d # index, start from LSB
    mov $0, %r11d # carry
    mov $result, %r12d # start address of result array
loop:
    cmp $0, %r10d
    jl setCarryOut
    mov (%r8d, %r10d, 4), %eax # get bits1 item, scale-factor addressing
    add (%r9d, %r10d, 4), %eax # add bits2 item
    add %r11d, %eax # add carry
cond1: # if sum (EAX) == 0
    cmp $0, %eax
    jne cond2
    # carry is 0
    jmp setZero # set result to 0
cond2: # elif sum == 1
    cmp $1, %eax
    jne cond3
    mov $0, %r11d # set carry
    jmp setOne # set result to 1
cond3: # elif sum == 2
    cmp $2, %eax
    jne cond4
    mov $1, %r11d # set carry
    jmp setZero # set result to 0
cond4: # elif sum == 3
    cmp $3, %eax
    jne cond4
    mov $1, %r11d # set carry
    jmp setOne # set result to 1
setZero: # set result to 0
    movl $0, (%r12d, %r10d, 4)
    jmp decIndex
setOne: # set result to 1
    movl $1, (%r12d, %r10d, 4)
decIndex:
    dec %r10d # index--
    jmp loop
setCarryOut:
    movl %r11d, carryOut
done:
    nop
