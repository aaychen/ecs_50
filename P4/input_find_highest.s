####
# Inputs
####

arr:
	# Row 1.
	.long 5
	.long 8
	.long 2
	.long 4
	.long 3
	# Row 2.
	.long 6
	.long 1
	.long 9
	.long 5
	.long 7
	# Row 3.
	.long 8
	.long 2
	.long 5
	.long 1
	.long 10
	# Row 4.
	.long 6
	.long 8
	.long 5
	.long 3
	.long 4

numRows:
	.long 4

numCols:
	.long 5

####
# Output
####

output:
	.rept 4 * 3
	.long -1
	.endr
