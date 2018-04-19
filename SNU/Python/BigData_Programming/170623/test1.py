def x_test(l,typein):
    for x,y in enumerate(l):
        if y==typein:
            break
    return x

x_test("Soul","o")