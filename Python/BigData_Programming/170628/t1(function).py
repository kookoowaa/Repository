def print_name(name):           #전역함수
    def print_num(n):           #지역함수
        print (n, end=': ')     #print 함수는 기본값이 (end='\n')임
    print_num(1)
    print('Hi ', name)

print_name('pablo')

####

def product(*args):
    result = 1
    for arg in args:
        result *= arg
    return result