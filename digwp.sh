#!/bin/bash
# Store all argument I provide as a string, SEARCH
SEARCH="$*"
# Replace any spaces with underscores, search wikipedia
dig +short txt ${SEARCH// /_}.wp.dg.cx
