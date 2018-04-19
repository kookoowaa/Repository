def norm(*args):
    global v
    v = []
    for i in args:
        v.append(i)
    print('Q2: ',len(v))
norm(1,2,3,4,5,6,7)