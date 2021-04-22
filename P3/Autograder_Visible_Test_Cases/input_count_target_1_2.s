str:
    .ascii "banana"
    len = . - str
target:
    .byte 'n'
count:
    .long 0
