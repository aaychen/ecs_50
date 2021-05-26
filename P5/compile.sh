#!/bin/bash
/opt/riscv/bin/riscv64-unknown-elf-gcc  max.s call_max.s -o max
/opt/riscv/bin/spike /opt/riscv/riscv64-unknown-elf/bin/pk max

/opt/riscv/bin/riscv64-unknown-elf-gcc sum_other.s call_sum_other.s -o sum_other
/opt/riscv/bin/spike /opt/riscv/riscv64-unknown-elf/bin/pk sum_other

/opt/riscv/bin/riscv64-unknown-elf-gcc transpose.s call_transpose.s -o transpose
/opt/riscv/bin/spike /opt/riscv/riscv64-unknown-elf/bin/pk transpose