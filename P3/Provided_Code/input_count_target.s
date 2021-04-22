str:
    .ascii "banana"
    # Source: https://stackoverflow.com/questions/63928862/short-form-to-get-string-length-in-assembly
    len = . - str
target:
    .byte 'a'
count:
    .long 0
