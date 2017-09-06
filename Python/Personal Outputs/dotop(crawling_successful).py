from bs4 import BeautifulSoup as bs
from urllib.request import urlopen

url = 'http://dotopstory.kr/docs/hero/'
n = 1
dot = open('d://dotop2.txt', 'w', encoding = 'UTF-8')
while True:
    url_connect = url+str(n)
    dotop_main = bs(urlopen(url_connect, timeout = 5), 'html.parser')
    
    
    name = dotop_main.find('h1')
    position = name.get_text().split(',')[-1].replace(' ','')
    hname, attrib = name.get_text().split(',')[0].split()[:-1], name.get_text().split(',')[0].split()[-1]
    hname2 = ''
    
    for i in hname:
        hname2 += i

    drop = dotop_main.find_all('li')
    where_to_get = dotop_main.find_all('ul', {'class': 'dtcq-list'})
    chest = []
    for i in where_to_get:
        chest.append(i.get_text().strip().replace(' ','').replace('[정예]','').replace('\n',' '))

    where_to_drop = dotop_main.find_all('ol', {'class': 'dtcq-list'})
    try:
        awake = where_to_drop[0].find('li').get_text().split('정예')[1].split(')')[0].replace(' ','').split('/')
    except:
        awake = ['N']

    chests = ''
    for i in chest:
        chests += i
        chests += ' '

    awakes = ''
    for i in awake:
        awakes += i
        awakes += ' '

    aline = ''
    aline = str(n) + ',' + hname2 + ',' + position + ',' + attrib + ',' + chests + ',' + awakes

    dot.write(aline+'\n')
    n += 1
    if n == 97:
        n += 1
    if n == 100:
        n = 10001
    if n == 10003:
        n = 10005
    if n == 10006:
        n = 10008
    if n == 10010:
        n = 10011

dot.close()