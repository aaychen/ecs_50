.data

x:  .string "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n"

.text

.global _start
_start:

movq $1, %rax
movq $1, %rdi
movq $x, %rsi  # x doesn't work; must be $x
movq $28, %rdx
syscall

movq $60, %rax
movq $0, %rdi
syscall
