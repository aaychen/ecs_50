all: bit_add strrstr find_highest check_bits

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
