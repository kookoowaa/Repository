import tweepy

consumer_key = 'XvVfJVUicoqgIn1QAGY0nzfvd'
consumer_secret = 'hFv61a6wJUethRERSqgmkHZ8rvlNx6Goj0QnAmexXLCAr6aunP'
access_token = '1522909470-RJmC5Aoi9wvK4YZURk6C6aUggzpf52zdavHuD8L'
access_token_secret = 'On8jdrUtGIdauYAsqDwEtOSIdKapeUM7meJ9CSPBjRAlA'

auth = tweepy.OAuthHandler(consumer_key,consumer_secret)
auth.set_access_token(access_token,access_token_secret)


# 트윗 접속
api = tweepy.API(auth)

# 본인 트윗의 타임라인 출력
public_tweets = api.home_timeline()
for tweet in public_tweets:
    print (tweet.text)

# 해당 유저의 팔로워 명단
user = api.get_user('@park_cw_pablo')
for friend in user.followers():
    print(friend.screen_name)

# 트윗 중 해당 명령어가 들어간 트윗 검색
search = api.search('오바마')
for tweets in search:
    try:
        print(tweets)
    except:
        pass

# 포스팅 올리기
api.update_status(status='Test tweet2')