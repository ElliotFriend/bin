#!/usr/bin/env python

import sys

try:
    if sys.version_info[0] == 2:
        short_name = raw_input("short_name: ")
        long_name = raw_input("long_name: ")
    elif sys.version_info[0] == 3:
        short_name = input("short_name: ")
        long_name = input("long_name: ")

    with open("/home/elliot/.bash_aliases", "a") as open_file:
        open_file.write("alias %s='%s'\n" % ( short_name, long_name ))

    # Sanity check
    if open_file.closed == False:
        open_file.close()
        
except KeyboardInterrupt:
    sys.exit("\nCaught Interrupt Signal")
