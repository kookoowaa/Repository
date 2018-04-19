from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import sys


consumer_key = 'XvVfJVUicoqgIn1QAGY0nzfvd'
consumer_secret = 'hFv61a6wJUethRERSqgmkHZ8rvlNx6Goj0QnAmexXLCAr6aunP'
access_token = '1522909470-RJmC5Aoi9wvK4YZURk6C6aUggzpf52zdavHuD8L'
access_token_secret = 'On8jdrUtGIdauYAsqDwEtOSIdKapeUM7meJ9CSPBjRAlA'

#####

kyochon = open('D:/kyochon.txt', 'a')
seoul = open('D:/seoul.txt', 'a')
kakao = open('D:/kakao.txt', 'a')

class KC_Listner(StreamListener):

    def on_data(self, data):
        while(True):
            try:
                kyochon.write(data)
                kyochon.write('\n')
                return True
            except BaseException:
                pass

    def on_error(self, status):
        print(status)
        return True #keep connected to the stream

    def on_timeout(self):
        print(sys.stderr)
        return True

class SEOUL_Listner(StreamListener):

    def on_data(self, data):
        while(True):
            try:
                seoul.write(data)
                seoul.write('\n')
                return True
            except BaseException:
                pass

    def on_error(self, status):
        print(status)
        return True #keep connected to the stream

    def on_timeout(self):
        print(sys.stderr)
        return True


class KAKAO_Listner(StreamListener):

    def on_data(self, data):
        while(True):
            try:
                kakao.write(data)
                kakao.write('\n')
                return True
            except BaseException:
                pass

    def on_error(self, status):
        print(status)
        return True #keep connected to the stream

    def on_timeout(self):
        print(sys.stderr)
        return True


auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token,access_token_secret)

print('{} commence'.format('Kyochon'))
KC_list = KC_Listner()
KC = Stream(auth, KC_list)
KC.filter(track = ['Kyochon', 'kyochon', 'KYOCHON'])

print('{} commence'.format('서울'))
SEOUL_list = SEOUL_Listner()
SEOUL = Stream(auth, SEOUL_list)
SEOUL.filter(track = ['Seoul', 'seoul', 'SEOUL', '서울'])

print('{} commence'.format('카카오'))
KAKAO_list = KAKAO_Listner()
KAKAO = Stream(auth, KAKAO_list)
KAKAO.filter(track = ['Kakao', 'kakao', 'KAKAO', '카카오'])
