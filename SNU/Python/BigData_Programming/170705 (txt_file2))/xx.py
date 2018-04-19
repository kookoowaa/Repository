import sys

text = sys.argv[3]
begin = int(sys.argv[1])
end = int(sys.argv[2])

text2 = open(text, 'r').readlines()
text3 = text2[begin:end]

for i in text3:
    print(i, end = '')
