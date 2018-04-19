def rev_text(*args):
    for i in args:
        if len(i)%2 ==1:
            b = 0
            print(i[::-1])
            b +=1
        else:
            print(i)
    print(b)
