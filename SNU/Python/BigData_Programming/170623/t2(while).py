l = "seoul"
index = 0
while index < len(l):
    if l[index] == 'u':
        break
    index += 1
else:
    index = -1
print(index,'\n')