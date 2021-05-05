.data

.include "input_strrstr.s"

.text
.globl _start
_start:
# find length of string (assume each string's length >= 1)
# start from end of string
# first match from end = last match
    mov $0, %r8d # haystack length
    mov $0, %r9d # needle length
haystackLen: # find length of haystack
    movb haystack(%r8d), %al # char = 1 byte
    cmp $0, %al
    je needleLen
    inc %r8d
    jmp haystackLen 
needleLen: # find length of needle
    movb needle(%r9d), %al
    cmp $0, %al
    je setIndex
    inc %r9d
    jmp needleLen 
setIndex:
    mov %r8d, %r11d # haystack length
    # dec %r11d # haystackLen-
resetNeedleIndex:
    mov %r9d, %r12d # needle length
    # dec %r12d # needleLen-1
    # dec %r11d # decrement haystack index
    # jmp findNeedle
decIndex:
    dec %r11d # decrement haystack index
    dec %r12d # decrement needle index
findNeedle:
    cmp $0, %r11d # if no more haystack chars to compare
    jl noMatch
    movb haystack(%r11d), %al
    movb needle(%r12d), %bl
    cmp %bl, %al # compare haystack and needle chars
    jne resetNeedleIndex
    cmp $0, %r12d # if chars match, check if any more needle chars to match
    je match # if no more needle chars, match found in haystack
    jmp decIndex # if more needle chars to match, decrement both indices
noMatch:
    movl $-1, lastMatch
    jmp done
match:
    movl %r11d, lastMatch
done:
    nop
