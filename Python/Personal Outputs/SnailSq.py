# 달팽이 사각형의 한변 크기 입력
snail_length = int(input('Insert matrix size : '))

# 정사각형 생성
import numpy as np
table = np.zeros((snail_length,snail_length))
# (0,0) 칸에서 달팽이 시작
cur_row, cur_col = 0, 0
table[cur_row][cur_col] = 1

# 달팽이 프로세스는 상하좌우 4종류 (하단 while문 참조)의 프로세스가 반복됨
# 반복 횟수는 다음과 같음: [n, n-1, n-1, n-2, n-2, ... , 1, 1] = loop
loop = [snail_length]
a = snail_length
while True:
    if a == 1:
        break
    else:
        loop.append(a-1)
        loop.append(a-1)
        a -=1

# loop 인덱스 순으로 인덱스 값만큼 상하좌우 프로세스 반복
# 반복 할때바다 달팽이 값 1씩 증가, 인덱스 값 1씩 차감
# 인덱스 값이 0이되면 다음 인덱스/프로세스로 넘어감
input_number = 1    # 시작 숫자
index_number = 0    # 시작 인덱스
while True:
    if input_number == snail_length**2:     # 최대 숫자에서 나가기 (변의 길이 홀수)
        break
    if index_number%4 == 0:             # 4의 배수번째 인덱스에서는
        input_number += 1               # 숫자를 1 늘리고
        cur_col += 1                    # 한칸 우측으로 이동하고
        loop [index_number] -= 1        # 인덱스 값을 1 줄임
        if loop[index_number] == 0:     # 만약 인덱스 값이 0이라면,
            index_number += 1           # 다음 인덱스로 넘어가고
            cur_col -=1                 # 마지막 숫자에서 한칸 아래로 내려감
            cur_row +=1
        table[cur_row][cur_col] = input_number      # 옮겨진 칸에 숫자를 기입
    if index_number%4 == 1:             # 4로 나눠 첫번째 인덱스에서는 한칸 아래로 이동
        input_number += 1
        cur_row += 1
        loop [index_number] -= 1
        if loop[index_number] == 0:
            index_number += 1
            cur_row -=1
            cur_col -=1
        table[cur_row][cur_col] = input_number
    if index_number%4 == 2:             # 4로 나눠 두번째 인덱스에서는 한칸 좌측로 이동
        if input_number == snail_length ** 2:   # 최대 숫자에서 while문 나가기 (변의 길이 짝수)
            break
        input_number += 1
        cur_col -= 1
        loop [index_number] -= 1
        if loop[index_number] == 0:
            index_number += 1
            cur_col +=1
            cur_row -=1
        table[cur_row][cur_col] = input_number
    if index_number%4 == 3:             # 4로 나눠 세번째 인덱스에서는 한칸 위로 이동
        input_number += 1
        cur_row -= 1
        loop [index_number] -= 1
        if loop[index_number] == 0:
            index_number += 1
            cur_row +=1
            cur_col +=1
        table[cur_row][cur_col] = input_number

print(table)