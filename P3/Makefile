all: prod_arr sum_other max_min_arr count_target

prod_arr: prod_arr.o
	ld prod_arr.o -o prod_arr

prod_arr.o: prod_arr.s
	as --gstabs prod_arr.s -o prod_arr.o

sum_other: sum_other.o
	ld sum_other.o -o sum_other

sum_other.o: sum_other.s
	as --gstabs sum_other.s -o sum_other.o

max_min_arr: max_min_arr.o
	ld max_min_arr.o -o max_min_arr

max_min_arr.o: max_min_arr.s
	as --gstabs max_min_arr.s -o max_min_arr.o

count_target: count_target.o
	ld count_target.o -o count_target

count_target.o: count_target.s
	as --gstabs count_target.s -o count_target.o

clean:
	rm -f prod_arr sum_other max_min_arr count_target
	rm -f prod_arr.o sum_other.o max_min_arr.o count_target.o
