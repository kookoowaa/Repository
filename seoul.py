from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import sys
print('commence')

consumer_key = 'XvVfJVUicoqgIn1QAGY0nzfvd'
consumer_secret = 'hFv61a6wJUethRERSqgmkHZ8rvlNx6Goj0QnAmexXLCAr6aunP'
access_token = '1522909470-RJmC5Aoi9wvK4YZURk6C6aUggzpf52zdavHuD8L'
access_token_secret = 'On8jdrUtGIdauYAsqDwEtOSIdKapeUM7meJ9CSPBjRAlA'

#####

tweet_stream = open('seoul.txt', 'a')

class Listener(StreamListener):

    def on_data(self, data):
        while(True):
            try:
                tweet_stream.write(data)
                tweet_stream.write('\n')
                return True
            except BaseException:
                pass

    def on_error(self, status):
        print(status)
        return True #keep connected to the stream

    def on_timeout(self):
        print(sys.stderr)
        return True

listener = Listener()
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token,access_token_secret)
stream = Stream(auth, listener)

stream.filter(track = ['seoul', 'SEOUL', 'Seoul'])