#!/usr/bin/env sh

#### Convert WordPerfect Files to DOCX on Mac OS X ####
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

# Change these variables to suit your needs
IN_DIR=$HOME/Desktop/wordperfect-documents
OUT_DIR=$HOME/Desktop/converted-documents

# This is where the LibreOffice executable lives
# ... on my Macbook, anyway
LO_BIN=/Applications/LibreOffice.app/Contents/MacOS

if [ -d $IN_DIR ]; then
    # Make sure the output directory exists, or else make it
    if [ ! -d $OUT_DIR ]; then
        mkdir $OUT_DIR
    fi

    # Check to make sure that LibreOffice isn't running
    if ! pgrep -q soffice ; then
        # Convert those dang things!
        $LO_BIN/soffice --headless --convert-to docx --outdir $OUT_DIR $IN_DIR/* 2> /dev/null
    else
        echo "LibreOffice appears to be running already"
        echo "Please quit (Cmd-Q) LibreOffice, and try again"
    fi
else
    echo "`echo $IN_DIR`: does not exist"
fi
