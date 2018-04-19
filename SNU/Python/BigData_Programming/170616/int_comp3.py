a = int(input('정수 a: ',))
b = int(input('정수 b: ',))


#if b>a:
    #a, b = b, a
#print(a%b)
#print(int(a/b))

if a > b:
    print('a/b의 나머지', a%b)
    print('a/b의 몫', int(a/b))
else:
    print('b/a의 나머지', b%a)
    print('b/a의 몫', int(b/a))
