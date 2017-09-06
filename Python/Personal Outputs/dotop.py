from bs4 import BeautifulSoup as bs
from urllib.request import urlopen

url = 'http://dotopstory.kr/docs/hero/'
n = 0
dot = open('d://dotop2.txt', 'a')
while True:
    url_connect = url+str(n)
    dotop_main = bs(urlopen(url_connect,), 'html.parser')

    dotop_names = dotop_main.find('h1')
    dot_n = dotop_names.get_text().split()
    dot.write(str(n)+',')
    for i in dot_n:
         dot.write(i.rstrip(',')+',')
    dot.write('\n')
    n += 1
    if n == 97:
        n += 1
    if n == 100:
        n = 10001
dot.close()