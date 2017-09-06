file_name = input('Enter a file name: ')

read_file = open(file_name, 'r')

filelist = read_file.readlines()

for i in range(0,len(filelist)):
    print('    ',i,': ', filelist[i].rstrip())