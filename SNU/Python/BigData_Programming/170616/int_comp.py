x = int(input('첫번째 함수를 기입해 주세요: ',))
y = input('두번째 함수를 기입해 주세요: ',)

if int(x) > int(y):
    print (x,'가', y,'보다 큽니다')
elif int(x) == int(y):
    print(x,'와', y,'가 같습니다')
else:
    print(x,'가', y,'보다 작습니다')

print()
print('x는', x)
print('y는', y)