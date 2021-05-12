.text

aaronize:
    # Cannot modify input array
    push %rbp
    mov %rsp, %rbp
    push %rax
    push %rbx
    push %rcx
    push %rdx
    push %rsi
    push %r8
    push %r9
    push %r10
    push %r11
    push %r12
    push %r13
    push %r14
    mov 40(%rbp), %eax # 1st arg: address of input array (32+8 to account for rbp on stack)
    mov 32(%rbp), %ebx # 2nd arg: input array length, assume >= 3
    mov 24(%rbp), %ecx # 3rd arg: # of times to aaronize, assume >= 1
    mov 16(%rbp), %edx # 4th arg: address of output array
    mov $1, %esi # aaronize counter
    # mov %ecx, %esi # check 1 aaronization
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
    mov $0, %r10
    mov %r8d, %r10d
    inc %r10d # nextIndex
    imul $8, %r10d # 8 bytes per item on stack
    add %rsp, %r10
    addl (%r10), %r9d # add next item to temp = new value
    mov %r9d, (%edx, %r8d, 4)
    jmp incIndex
cond2: # elif index == arrLen-1 (last item)
    mov %ebx, %r12d # arrLen
    dec %r12d # arrLen-1
    cmp %r12d, %r8d
    jne cond3
    mov %r8d, %r10d
    dec %r10d
    imul $8, %r10d
    add %rsp, %r10
    addl (%r10), %r9d # add prev item to temp = new value
    mov %r9d, (%edx, %r8d, 4)
    jmp incIndex
cond3: # else (middle items)
    mov %r8d, %r10d
    dec %r10d # prevIndex
    imul $8, %r10d
    add %rsp, %r10
    addl (%r10), %r9d # add prev item
    mov %r8d, %r10d
    inc %r10d # nextIndex
    imul $8, %r10d
    add %rsp, %r10
    addl (%r10), %r9d # add next item = new value
    mov %r9d, (%edx, %r8d, 4)
incIndex:
    inc %r8d # update index
    jmp loop
checkAaronizeCounter:
    mov $0, %r8d # reset index
    mov %edx, %eax # use output array items if aaronizing more than once
    inc %esi # update aaronize counter
    cmp %ecx, %esi # check counter
    jg regPreservation # jle copy array and aaronize again
    mov $0, %r11
    mov %ebx, %r11d
    imul $8, %r11
    sub %r11, %rsp # lazy delete copied array elements by moving stack pointer
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
    pop %r14
    pop %r13
    pop %r12
    pop %r11
    pop %r10
    pop %r9
    pop %r8
    pop %rsi
    pop %rdx
    pop %rcx
    pop %rbx
    pop %rax
    mov %rbp, %rsp
    pop %rbp
end:
    ret
