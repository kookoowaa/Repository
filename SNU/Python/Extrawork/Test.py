import random

ans1 = "go for it"
ans2 = "no wat Jose"
ans3 = 'Im not sure, ask me again'

print('welcome to my magic ball')

question = input('ask me for advice then press enter to shake me.\n')
print('shaking...\n' *4)

choice = random.randint(1,8)
if choice ==1:
    answer = ans1
elif choice ==2:
    answer = ans2
else:
    answer = ans3

print (answer)