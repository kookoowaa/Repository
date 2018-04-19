a = input()
listA = a.split()
b = ''

while b != 'END':
    listB = b.split()
    for i in listB:
        if i not in listA:
            listA.append(i)
    b = input()

for i in listA:
    print(i, end=' ')