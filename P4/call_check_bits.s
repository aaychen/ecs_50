.text
.globl _start
_start:
    # First call: Check if 6 has bits #1 and #3 set.
    push $6
    push $1
    push $3
    call checkBits
    add $24, %rsp
    mov %eax, %ebx
    # Second call: Check if 11 has bits #3 and #0 set.
    push $11
    push $3
    push $0
    call checkBits
    add $24, %esp
done:
    nop
.include "check_bits.s"
