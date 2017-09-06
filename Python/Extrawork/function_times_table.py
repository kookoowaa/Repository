def times_table(n,num):
    num = int(input('which cal., would you like to have?'))
    n=1
    while n < num:
        print(num, '*', n, '=', num * n)
        n += 1

times_table(5,6)
