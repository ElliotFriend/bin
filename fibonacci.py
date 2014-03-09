#!/usr/bin/env python

import sys

f_seq = [ 0, 1 ]

for num in range(f_seq[0], int(sys.argv[1]) - 1):
    f_seq.append(f_seq[-1] + f_seq[-2])

print f_seq
