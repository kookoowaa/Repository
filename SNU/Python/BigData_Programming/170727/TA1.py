a = input('first number' )
b = input('second number' )

a2 = []
for i in a:
    a2.append(int(i))
b2 = []
for i in b:
    b2.append(int(i))

c = []
for i in b2:
    for m in a2:
        c.append(m*i)

d = c[-1]+c[-2]*10+c[-3]*100
e = c[-4]*10+c[-5]*100+c[-6]*1000
f = c[-7]*100+c[-8]*1000+c[-9]*10000

print(d)
print(e)
print(f)
print(d+e+f)