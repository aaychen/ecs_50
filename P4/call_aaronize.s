.data

input:
    .long 7
    .long 3
    .long 1
    .long 10

output:
    .rept 4
    .long -1
    .endr

.text
.globl _start
_start:
    push $input
    push $4
    push $3
    push $output
    call aaronize
    add $32, %rsp
done:
    nop
.include "aaronize.s"
