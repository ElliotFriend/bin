#!/usr/bin/python

short_name = raw_input("short_name: ")
long_name = raw_input("long_name: ")

with open("/home/elliot/.bash_aliases", "a") as open_file:
    open_file.write("alias %s='%s'\n" % ( short_name, long_name ))

# Sanity check
if open_file.closed == False:
    open_file.close()
