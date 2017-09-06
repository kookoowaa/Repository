import sys

#There are at least two command-line arguments
if len(sys.argv) < 3:
    print('usage: grepword.py word infile1 [infile2 [... infileN]]')
    sys.exit()

#Assume 1st arg is the word the user is looking for
word = sys.argv[1]
#From 2nd args, name of files to look in
for filename in sys.argv[2:]:
    with open(filename) as file:
        for lino, line in enumerate(file, start=1):
            if word in line:
                #Print the file name, line number, and the first 40 characters of the line
                # with trailing whitespace
                print('{}:{}:{:.40}'.format(filename, lino, line.rstrip()))