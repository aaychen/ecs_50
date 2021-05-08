all: bit_add strrstr find_highest check_bits transpose aaronize

aaronize: aaronize.o
	ld aaronize.o -o aaronize

aaronize.o: aaronize.s call_aaronize.s
	as --gstabs call_aaronize.s -o aaronize.o

transpose: transpose.o
	ld transpose.o -o transpose

transpose.o: transpose.s call_transpose.s
	as --gstabs call_transpose.s -o transpose.o

check_bits: check_bits.o
	ld check_bits.o -o check_bits

check_bits.o: call_check_bits.s check_bits.s
	as --gstabs call_check_bits.s -o check_bits.o

find_highest: find_highest.o
	ld find_highest.o -o find_highest

find_highest.o: find_highest.s input_find_highest.s
	as --gstabs find_highest.s -o find_highest.o

strrstr: strrstr.o
	ld strrstr.o -o strrstr

strrstr.o: strrstr.s input_strrstr.s
	as --gstabs strrstr.s -o strrstr.o

bit_add: bit_add.o
	ld bit_add.o -o bit_add

bit_add.o: bit_add.s input_bit_add.s
	as --gstabs bit_add.s -o bit_add.o

clean:
	rm -f bit_add.o bit_add
	rm -f strrstr.o strrstr
