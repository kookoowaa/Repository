a = int(input ('정수a:',))
b = int(input ('정수b:',))
c = int(input ('정수c:',))

if a > b and a > c:
    print("a가 제일 큽니다")
elif b > a and b > c:
    print('b가 제일 큽니다')
elif c > a and c > b:
    print('c가 제일 큽니다')

print('a:', a)
print('b:', b)
print('c:', c)