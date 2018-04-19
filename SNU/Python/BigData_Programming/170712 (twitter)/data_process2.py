import json

tweet_data = open('tweet_movie_stream.txt')

for i in tweet_data:
    try:
        content = json.loads(i)         #json.load > 딕셔너리 파일
        print(content['text'])
        print(content['user']['followers_count'])
    except:
        continue

