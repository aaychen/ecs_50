.text

aaronize:
# firstItem = firstItem + nextItem
# middleItem = prevItem + middleItem + nextItem
# lastItem = prevItem + lastItem
    push %rbp
    mov %rsp, %rbp
    push %rax
    push %rbx
    push %rcx
    push %rdx
    push %r8
    push %r9
    push %r10
    push %r11
    push %r12
    push %r13
    push %r14
    push %r15
    mov 40(%rbp), %eax # 1st arg: address of input array (32+8 to account for rbp on stack)
    mov 32(%rbp), %ebx # 2nd arg: input array length, assume >= 3
    mov 24(%rbp), %ecx # 3rd arg: # of times to aaronize, assume >= 1
    mov 16(%rbp), %edx # 4th arg: address of output array
    mov $1, %r15d # aaronize counter
    mov $0, %r8d # index
    jmp copyArray
loop:
    mov %rsp, %r13
    cmp %ebx, %r8d # check index
    jge checkAaronizeCounter
    mov (%eax, %r8d, 4), %r9d # temp item
cond1: # if index == 0 (first item)
    cmp $0, %r8d
    jne cond2
    push $1
    call addItem
    add $8, %rsp
    jmp incIndex
cond2: # elif index == arrLen-1 (last item)
    mov %ebx, %r12d # arrLen
    dec %r12d # arrLen-1
    cmp %r12d, %r8d
    jne cond3
    push $-1
    call addItem
    add $8, %rsp
    jmp incIndex
cond3: # else (middle items)
    push $-1
    call addItem    
    add $8, %rsp
    push $1
    call addItem
    add $8, %rsp
incIndex:
    mov %r9d, (%edx, %r8d, 4) # store new value
    inc %r8d # update index
    jmp loop
checkAaronizeCounter:
    mov $0, %r8d # reset index
    mov %edx, %eax # use output array items if aaronizing more than once
    inc %r15d # update aaronize counter
    mov $0, %r11
    mov %ebx, %r11d
    imul $8, %r11
    add %r11, %rsp # lazy delete copied array elements by incrementing stack pointer
    cmp %ecx, %r15d # check counter
    jg regPreservation # jle copy array and aaronize again
copyArray: # copy array
    mov %ebx, %r14d # start at end and push onto stack for easy offset calculations
    dec %r14d # arrLen-1
copyArrayLoop:
    cmp $0, %r14d
    jl loop
    push (%eax, %r14d, 4)
    dec %r14d
    jmp copyArrayLoop
regPreservation:
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    pop %r11
    pop %r10
    pop %r9
    pop %r8
    pop %rdx
    pop %rcx
    pop %rbx
    pop %rax
    mov %rbp, %rsp
    pop %rbp
aaronizeEnd:
    ret

addItem:
    mov $0, %r10
    mov %r8d, %r10d # current index
    add 8(%rsp), %r10d # get prev or next index; account for return address on stack
    imul $8, %r10d # 8 bytes per item on stack
    add %rsp, %r10
    add $16, %r10 # account for argument and return address on stack
    addl (%r10), %r9d # add item
    ret
