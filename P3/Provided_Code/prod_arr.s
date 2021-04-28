.data

.include "input_prod_arr.s"

# TODO: Any additional variables that you need go here.


.text
.globl _start
_start:
    # TODO: Your code goes here.
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
