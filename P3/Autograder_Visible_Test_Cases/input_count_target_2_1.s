str:
    .ascii "apple"
    len = . - str
target:
    .byte 'p'
count:
    .long 0
