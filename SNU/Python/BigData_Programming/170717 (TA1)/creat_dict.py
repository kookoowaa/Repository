import csv

table = open('enrollments.csv')

tb = table.readlines()
tb2 = []
for i in tb:
    tb2.append(i.rstrip('\n').split(','))   # 줄단위로 리스트화 + ','기준으로 분할 = tb2


keys = tb2[0]                               # 키만 따로 분리 = keys
tb3 = tb2[1:]                               # 값만 따로 분리 = tb3

fullList = []
for m in range(0,len(tb3)):                #2 한줄 단위 작업을 tb3 길이만큼 반복
    dict = {}
    for i in range(0,len(keys)):           #1 한줄에서 키에 따라 값 기입
        dict[keys[i]] = tb3[m][i]
    fullList.append(dict)

print(len(fullList))
print(fullList[0])
print(fullList[1])

print(len(keys))
print(len(tb3[0]))
