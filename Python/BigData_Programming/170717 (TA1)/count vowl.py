vowls = ('a', 'e', 'i', 'o', 'u')


def vowl(x):
    countv = 0
    for i in x:
        if i in vowls:
            countv += 1
    return countv