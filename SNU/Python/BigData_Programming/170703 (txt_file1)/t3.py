file_name = input('Enter a file name: ')

with open(file_name) as fin:
    for line in fin:
        print('    ', line, end='')
