all: bit_add

bit_add: bit_add.o
	ld bit_add.o -o bit_add

bit_add.o: bit_add.s
	as --gstabs bit_add.s -o bit_add.o

clean:
	rm -f bit_add.o bit_add
