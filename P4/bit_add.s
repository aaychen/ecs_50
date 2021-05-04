.data

.include "input_bit_add.s"

.text
.globl _start
_start: # with if/else construct
# while index >= 0:
#     temp = bits1[index] + bits2[index] + carry
#     if temp == 0:
#         res[index] = 0
#     elif temp == 1:
#         carry = 0
#         res[index] = 1
#     elif temp == 2:
#         carry = 1
#         res[index] = 0
#     elif temp == 3:
#         carry = 1
#         res[index] = 1
#     index -= 4
# carryOut = carry
    mov $bits1, %r8d
    mov $bits2, %r9d
    mov numBits, %r10d
    imul $4, %r10d # index, start from LSB
    add $-4, %r10d
    mov $0, %r11d # carry
    mov $result, %r12d
loop:
    cmp $0, %r10d
    jl setCarryOut
    mov %r10d, %ebx
    add %r8d, %ebx
    mov (%ebx), %eax # move bits1 item
    mov %r10d, %ebx
    add %r9d, %ebx
    add (%ebx), %eax # add bits2 item
    add %r11d, %eax # add carry
cond1: # if sum == 0
    cmp $0, %eax
    jne cond2
    mov %r12d, %ebx
    add %r10d, %ebx
    movl $0, (%ebx) # set result
    jmp decIndex
cond2: # elif sum == 1
    cmp $1, %eax
    jne cond3
    mov $0, %r11d # set carry
    mov %r12d, %ebx
    add %r10d, %ebx
    movl $1, (%ebx)
    jmp decIndex
cond3: # elif sum == 2
    cmp $2, %eax
    jne cond4
    mov $1, %r11d
    mov %r12d, %ebx
    add %r10d, %ebx
    movl $0, (%ebx) 
    jmp decIndex
cond4: # elif sum == 3
    cmp $3, %eax
    jne cond4
    mov $1, %r11d
    mov %r12d, %ebx
    add %r10d, %ebx
    movl $1, (%ebx) 
decIndex:
    add $-4, %r10d
    jmp loop
setCarryOut:
    movl %r11d, carryOut
done:
    nop
