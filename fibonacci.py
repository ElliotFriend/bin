#!/usr/bin/env python

import sys

# Start the sequence. It always starts with [0, 1]
f_seq = [ 0, 1 ]

# Until the length of our list reaches the limit that
# the user has specified, continue to add to the sequence
while len(f_seq) <= int(sys.argv[1]):
    # Add the last two numbers in the list, and stick
    # that onto the end of the list
    f_seq.append(f_seq[-1] + f_seq[-2])

# Print the list out for all to see.
print f_seq
