.text

aaronize:
    # TODO: function instructions
    # Cannot modify input array
    mov 32(%rsp), %eax # 1st arg: address of input array
    mov 24(%rsp), %ebx # 2nd arg: input array length, assume >= 3
    mov 16(%rsp), %ecx # 3rd arg: # of times to aaronize, assume >= 1
    mov 8(%rsp), %edx # 4th arg: address of output array
    
    mov $1, %esi # aaronize counter
    # mov %ecx, %esi # check 1 aaronization

    mov $0, %r8d # index
loop:
    cmp %ebx, %r8d # check index
    jge checkAaronizeCounter
    mov %r8d, %r9d
    imul $4, %r9d
    add %eax, %r9d # address of temp item
cond1: # if index == 0 (first item)
    cmp $0, %r8d
    jne cond2
    mov (%r9d), %r10d # old value
    mov %r10d, %r13d # keep track of old value for when adding to next value
    add $4, %r9d # address of next item
    add (%r9d), %r10d # new value
    mov %r8d, %r11d # current index
    imul $4, %r11d
    add %edx, %r11d # address of where to put new value
    mov %r10d, (%r11d)
    jmp incIndex
cond2: # elif index == arrLen-1 (last item)
    mov %ebx, %r12d # arrLen
    dec %r12d # arrLen-1
    cmp %r12d, %r8d
    jne cond3
    mov (%r9d), %r10d # old value
    mov %r10d, %r14d # keep track of old value for when adding to next value
    add %r13d, %r10d # add prev old value
    mov %r14d, %r13d # update prev
    mov %r8d, %r11d # current index
    imul $4, %r11d
    add %edx, %r11d # address of where to put new value
    mov %r10d, (%r11d)
    jmp incIndex
cond3: # else (middle items)
    mov (%r9d), %r10d # old value
    mov %r10d, %r14d # keep track of old value for when adding to next value
    add %r13d, %r10d # add prev old value
    mov %r14d, %r13d # update prev
    add $4, %r9d # address of next item
    add (%r9d), %r10d # add next item -> new value
    mov %r8d, %r11d # current index
    imul $4, %r11d
    add %edx, %r11d # address of where to put new value
    mov %r10d, (%r11d)
incIndex:
    inc %r8d # update index
    jmp loop
checkAaronizeCounter:
    mov $0, %r8d # reset index
    mov %edx, %eax # use output array items if aaronizing more than once
    inc %esi # update aaronize counter
    cmp %ecx, %esi # check counter
    jle loop
end:
    ret
