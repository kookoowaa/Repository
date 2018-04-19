import sys

beat = open(sys.argv[2],'r')
beat_list = beat.readlines()
new_beat_list = beat_list[:int(sys.argv[1])]
for i in new_beat_list:
    print(i,end='')

