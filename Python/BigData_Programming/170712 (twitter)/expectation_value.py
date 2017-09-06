## 전제조건, 데이터 크롤링 하는 동안 프로그래밍이 돌고 있어야 함

import json

tweet_data = open('tweet_movie_stream.txt')
exp_val = {}
spidi_val = 0
marvel_val = 0

for line in tweet_data:
    try:
        content = json.loads(line)
        exp_val[content['text']] = content['user']['followers_count']   # 딕셔너리에 포스팅 내용을 키로, 팔로워 수를 값으로
    except:
        continue

for key in exp_val:
    trimmed_key = key.lower().replace(' ', '')  # 소문자 변화, 공백 제거
    if 'spiderman' in trimmed_key:
        spidi_val += exp_val[key]   # 키(포스팅)에 spiderman이 들어가면 spidi_val에 팔로워 수많큼 추가
    if 'marvel' in trimmed_key:
        marvel_val += exp_val[key]

print("Expentancy Value of 'Spider Man': {:,}".format(spidi_val))
print("Expentancy Value of 'Marvel': {:,}".format(marvel_val))