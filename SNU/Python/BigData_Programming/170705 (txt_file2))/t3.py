text = 'beatles.txt'
begin = 0
end = 5

text2 = open(text, 'r').readlines()

for i in range(begin,end):
    print(text2[i], end='')
