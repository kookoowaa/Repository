import sys
beat = open(sys.argv[3],'r')
beat_list = beat.readlines()
new_beat_list = beat_list[int(sys.argv[1]):int(sys.argv[2])]
for i in new_beat_list:
    print(i,end='')
    