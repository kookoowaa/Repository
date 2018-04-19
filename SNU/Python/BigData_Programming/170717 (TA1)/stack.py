stack = [1,2,3,4,5]

def is_empty(x):
    if len(x) == 0:
        return True
    else:
        return False

def push(x, y):
    x.append(y)

def pop(x):
    x.pop()

def top_value(x):
    return x[-1]

def get_size(x):
    return len(x)

print(is_empty(stack))
push(stack, 6)
print(stack)
pop(stack)
print(stack)
print(top_value(stack))
print(get_size(stack))