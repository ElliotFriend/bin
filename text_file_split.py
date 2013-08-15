import argparse
import sys

def get_args(): #{{{
    """ Get arguments from the command line."""
    
    parser = argparse.ArgumentParser(
        description="Split a text file into different files.",
        formatter_class=argparse.RawTextHelpFormatter)
    
    parser.add_argument("-f", "--original-file",
        type=str,
        help="Path to original lfile.\n" +
             "Note : Must be a full path.")
    
    parser.add_argument("-l", "--num-lines",
        type=int, default=100,
        help="Number of lines to split original file on.\n" +
             "Default : 100\n")
    
    parser.add_argument("-o", "--out-dir",
        type=str,
        help="Directory to put new files.\n" +
             "Note : Must contain trailing slash.")
    
    args = parser.parse_args()
    return args #}}}

def main(args):
    #print('you suck')
    try:
        original_file = open(args.original-file).readlines()
    except IOError:
        print('Bad file path or permissions: {path}'.format(
            path=args.original-file)
        sys.exit(1)
    

if __name__ == '__main__':
    try:
        main(get_args())
    except KeyboardInterrupt:
        sys.exit()
