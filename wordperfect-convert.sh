#!/bin/bash

#### Convert WordPerfect Files to DOCX using LibreOffice ####
##
## I know this guy who has a ton of old WordPerfect files
## on his Macintosh Classic (getting them off of there is
## a whole different story...)
##
## He wants to convert them into MS Word format, so that
## he can actually do things with them. After a quick
## Google search, I discovered that LibreOffice already
## has a built-in converter and can open the documents
## just fine. Since everyone should be using LibreOffice
## already, it's just the right tool for the job.
##
## I'm scripting this so that I can give him a very simple
## command to cut and paste into his terminal (he doesn't
## computer very well)
## Here goes!
##
## New and improved to be more versatile for other *nixes

# Change these variables to suit your needs
IN_DIR=$HOME/Desktop/wordperfect-documents
OUT_DIR=$HOME/Desktop/converted-documents

# Check to see which brand of *nix w'ere working with
if [ `uname -o` == "GNU/Linux" ]; then
    # This is where the LibreOffice executable lives
    LO_EXEC=/usr/bin/libreoffice
elif [ `uname -s` == "Darwin" ]; then
    # ... on my Macbook, anyway
    LO_EXEC=/Applications/LibreOffice.app/Contents/MacOS/soffice
fi

if [ -d $IN_DIR ]; then
    # Make sure the output directory exists, or else make it
    if [ ! -d $OUT_DIR ]; then
        mkdir $OUT_DIR
    fi

    # Check to make sure that LibreOffice isn't running
    if ! pgrep soffice ; then
        # Convert those dang things!
        # We're redirecting stderr because each file appeared
        # to give a false alarm. We'll see how it goes lol
        $LO_EXEC --headless --convert-to docx --outdir $OUT_DIR $IN_DIR/*
    else
        echo "LibreOffice appears to be running already"
        echo "Please quit LibreOffice, and try again"
    fi
else
    echo "`echo $IN_DIR`: directory does not exist"
fi
