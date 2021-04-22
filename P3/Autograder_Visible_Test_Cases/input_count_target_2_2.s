str:
    .ascii "banana"
    len = . - str
target:
    .byte 'A'
count:
    .long 0
