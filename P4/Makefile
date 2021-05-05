all: bit_add strrstr find_highest

find_highest: find_highest.o
	ld find_highest.o -o find_highest

find_highest.o: find_highest.s
	as --gstabs find_highest.s -o find_highest.o

strrstr: strrstr.o
	ld strrstr.o -o strrstr

strrstr.o: strrstr.s
	as --gstabs strrstr.s -o strrstr.o

bit_add: bit_add.o
	ld bit_add.o -o bit_add

bit_add.o: bit_add.s
	as --gstabs bit_add.s -o bit_add.o

clean:
	rm -f bit_add.o bit_add
	rm -f strrstr.o strrstr