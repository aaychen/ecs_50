.data

.include "input_prod_arr.s"

.text
.globl _start
_start:
    mov $5, %eax # counter
    mov $1, %ebx # product
    mov $arr, %ecx

loop:
    imul (%ecx), %ebx # multiplication
    add $4, %ecx # increment pointer
    dec %eax # decrement counter
    jnz loop
    mov %ebx, prod

done:
    nop
