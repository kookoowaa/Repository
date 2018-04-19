def calculator(x1, x2 ,x3 ,x4 ,x5):
    a = (x1, x2 ,x3 ,x4 ,x5)
    if 0 in a:
        b = a[:a.index(0)]
        print(sum(b), int(sum(b)/len(b)))
    else:
        print(sum(a), (sum(a)/5))