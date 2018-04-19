import random

difficulty = input('1-3까지 난이도를 선택 해 주세요')

if difficulty == '1':
    comp_pick = random.randint(1, 10)
    print('컴퓨터가 1에서 10사이의 수를 선택하였습니다.')
elif difficulty == '2':
    comp_pick = random.randint(1, 50)
    print('컴퓨터가 1에서 50사이의 수를 선택하였습니다.')
else:
    comp_pick = random.randint(1, 100)
    print('컴퓨터가 1에서 100사이의 수를 선택하였습니다.')

guess = int(input('숫자를 하나 선택 해 주세요\n'))
n = 1

while comp_pick != guess:
    if comp_pick > guess:
        judge = ' 높은 수를 다시 선택 해 주세요'
    else:
        judge = ' 낮은 수를 다시 선택 해 주세요'
    print(judge)
    guess = int(input())
    n += 1

print('정답입니다. 컴퓨터가 선택한 숫자는 <', comp_pick, '> 입니다')
print(n,'번만에 정답을 맞췄습니다')
