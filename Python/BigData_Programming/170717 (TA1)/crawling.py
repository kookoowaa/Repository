from bs4 import BeautifulSoup as BS
from urllib.request import urlopen


url = 'http://www.imdb.com/title/tt1345836/reviews?start=0'
wp = BS(urlopen(url),'html.parser')

body = wp.find_all('div',{'id':'tn15content'})
txt = body[0].find_all('p')
finaltxt = []

for i in txt:

    if ('*** This review may contain spoilers ***' not in i.get_text()) and ('Add another review' not in i.get_text()):
        finaltxt.append(i)

book = open('d://a.txt', 'w', encoding='UTF-8')
for i in finaltxt:
    book.write(i.get_text()+'\n')

