#!/usr/bin/env python

# This is a simple script intended to append a new alias definition:
#
# alias example='cat /etc/*-release'
#
# to a file; ~/.bash_aliases, in this case. I find this script particularly
# useful when paired with an alias of it's own. The alias I'm currently
# using to run this script is:
#
# alias aa='~/bin/add_alias.py && source ~/.bash_aliases'
#
# This runs the script, and then sources the file, so that the alias is
# immediately available.

# import version_info, so that we can see which version of Python we're using
from sys import version_info

try:
    # If we're using Python 2, take input from raw_input()
    if version_info[0] == 2:
        short_name = raw_input("short_name: ")
        long_name = raw_input("long_name: ")
    # If we're using Python 3, take input from input()
    elif version_info[0] == 3:
        short_name = input("short_name: ")
        long_name = input("long_name: ")

    # Append the new alias to my ~/.bash_aliases file
    with open("/home/elliot/.bash_aliases", "a") as open_file:
        open_file.write("alias %s='%s'\n" % ( short_name, long_name ))

    # Make sure files are closed, even though we used
    # with open() as file:
    # to avoid just such mishaps
    if open_file.closed == False:
        open_file.close()

# Exit gracefully, if the user hits Ctrl-C        
except KeyboardInterrupt:
    sys.exit("\nCaught Interrupt Signal")
