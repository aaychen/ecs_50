.data

.include "input_strrstr.s"

.text
.globl _start
_start:
# Find length of string (assume each string's length >= 1)
# Start from end of string
# First match from end = last match
    mov $0, %r8d # haystack length
    mov $0, %r9d # needle length
    mov $haystack, %r13d # start address of haystack
    mov $needle, %r14d # start address of needle
haystackLen: # find length of haystack
    movb (%r13d, %r8d, 1), %al # char = 1 byte
    cmp $0, %al # if char == null byte, done
    je needleLen
    inc %r8d
    jmp haystackLen
needleLen: # find length of needle
    movb (%r14d, %r9d, 1), %al
    cmp $0, %al # if char == null byte, done
    je setIndex
    inc %r9d
    jmp needleLen 
setIndex:
    mov %r8d, %r11d # haystack index, start from haystackLen-1 (-1 in decIndex)
resetNeedleIndex:
    mov %r9d, %r12d # needle index, start from needleLen-1 (-1 in decIndex)
decIndex:
    dec %r11d # decrement haystack index
    dec %r12d # decrement needle index
findNeedle:
    cmp $0, %r11d # if no more haystack chars to compare
    jl noMatch
    movb (%r13d, %r11d, 1), %al # get haystack char
    movb (%r14d, %r12d, 1), %bl # get needle char
    cmp %bl, %al # compare haystack and needle chars
    jne resetNeedleIndex # if chars are diff, restart match with needle
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
