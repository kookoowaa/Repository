
# coding: utf-8
from bs4 import BeautifulSoup as BS
from urllib.request import urlopen
import jsonurl = 'https://ko.wikipedia.org/wiki/%EC%8A%A4%ED%83%80%EB%B2%85%EC%8A%A4'
mcd = BS(urlopen(url),'html.parser')
table = mcd.find('table', {'class': 'wikitable'})
keys = table.find_all('th')
for i in range(0,len(keys)):
    keys[i] = keys[i].get_text()
vals = table.find_all('li')
for i in range(0,len(vals)):
    vals[i] = vals[i].get_text().strip()countings = (6, 4, 2, 20, 2, 18)
nval = []

def xorx(x,y):
    for i in y:
        nval.append(x[:i])
        x = x[i:]

xorx(vals, countings)SB = {}
for i in range(0,len(keys)):
    SB[keys[i]] = nval[i]
SB