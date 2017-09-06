l = [1,2,3]
e1 = 2
e2 = 10

def search_ele(x, y):
    if y in x:
        return(x.index(y))
    else:
        return(False)

l[search_ele(l, e1)]
