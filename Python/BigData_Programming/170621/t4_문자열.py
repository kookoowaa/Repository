fruits = ['apples', 'bananas', 'berries']
for fruit in fruits:
    print('I love {}'.format(fruit))
print()

s = 'The sum of 1 + 2 is {}'
s.format(3)
print(s.format(3))
print()

k = '{0} + {1} = {2}'
print(k.format(1,2,3))
kT = str(1, 2, 3)
print(k.format(kT))