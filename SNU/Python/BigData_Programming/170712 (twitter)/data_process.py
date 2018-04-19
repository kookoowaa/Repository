import json

tweet_data = open('tweet_movie_stream.txt')
tweet = []

for i in tweet_data:
    try:
        content = json.loads(i)
        tweet.append(content)
    except:
        continue

