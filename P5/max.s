.global max
max:
    # 2 args passed in a0 and a1 registers (also x10 and x11 registers)
    # return whichever is higher in a0 register
    bgt a1, a0, secondArgGreater # if a1 > a0
    j endMax # else a0 > a1
secondArgGreater:
    mv a0, a1
endMax:
    jalr x0, 0(x1)
