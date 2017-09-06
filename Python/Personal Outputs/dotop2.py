from bs4 import BeautifulSoup as bs
from urllib.request import urlopen

url = 'http://dotopstory.kr/docs/hero/'
n = 0
dot = open('d://dotop2.txt', 'a')
while True:
    url_connect = url+str(n)
    dotop_main = bs(urlopen(url_connect), 'html.parser')
    name = dotop_main.find('h1')

    position = name.get_text().split(',')[-1]
    hname, attrib = name.get_text().split(',')[0].split()[:-1], name.get_text().split(',')[0].split()[-1]
    hname2 = ''
    for i in hname:
        hname2 += i

    drop = dotop_main.find_all('li')
    where_to_get = dotop_main.find_all('ul', {'class': 'dtcq-list'})
    chest = []
    for i in where_to_get:
        chest.append(i.get_text().strip().replace(' ',''))

    where_to_drop = dotop_main.find_all('ol', {'class': 'dtcq-list'})
    awake = where_to_drop[0].find('li').get_text().split('정예')[1].split(')')[0].replace(' ','').split('/')

    chests = ''
    for i in chest:
        chests += i
        chests += ','

    awakes = ''
    for i in awake:
        awakes += i
        awakes += ','

    aline = ''
    aline = hname2 + ' ' + position + ' ' + attrib + ' ' + chests + ' ' + awakes

    dot.write(aline+'\n')
    n += 1
    if n == 97:
        n += 1
    if n == 100:
        n = 10001

dot.close()