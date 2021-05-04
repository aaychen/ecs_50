.data

input:
    .long 1
    .long 2
    .long 3
    .long 4
    .long 5
    .long 6

output:
    .rept 6
    .long -1
    .endr

.text
.globl _start
_start:
    push $input
    push $3
    push $2
    push $output
    call transpose
    add $32, %rsp
done:
    nop
.include "transpose.s"
