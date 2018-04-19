found = False
a = ['aa','ab','ac','ad','ae']
for x,y in enumerate(a):
    if y == 'ab':
        break
print(x,y)