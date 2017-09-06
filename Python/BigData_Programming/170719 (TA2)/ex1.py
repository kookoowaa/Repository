a = int(input())
b = input().split()
for i in range(len(b)):
    b[i] = int(b[i])
b.sort()

c = []
for i in b:
    c.append(i/b[-1]*100)

print(round(sum(c)/len(c),2))