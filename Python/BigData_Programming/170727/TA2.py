import numpy as np

a = int(input('Matrix size : '))
table = np.zeros((a, a))

table[0][a // 2] = 1
cr = 0
cc = a // 2

for i in range(2, a * a + 1):
    cr -= 1
    cc -= 1
    if cr == -1 and cc == -1:
        cr = 1
        cc = 0
    if cr == -1:
        cr = a - 1
        if cc == -1:
            cc = a - 1
    elif cc == -1:
        cc = a - 1

    if table[cr][cc] != 0:
        cr += 2
        cc += 1
        if cr > a:
            cr = a - cr
        elif cc > a:
            cc = a - cc

    table[cr][cc] = i

for i in table:
    print(i)
    print(sum(i))