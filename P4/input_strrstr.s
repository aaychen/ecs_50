####
# Inputs
####

haystack:
	.string "xyabcxabcycbx"

needle:
	.string "abc"

####
# Output
####

lastMatch:
	.long -10  # don't assume the initial value
