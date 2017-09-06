from bs4 import BeautifulSoup as BS
from urllib.request import urlopen

moviecode = (2250912, 2771200, 5013056,3498820)
for n in moviecode:
    finaltxt = []
    url = 'http://www.imdb.com/title/tt{}/reviews?start='.format(n)

    for i in range(0,10):
        wp = BS(urlopen(url+str(i)),'html.parser')
        body = wp.find_all('div',{'id':'tn15content'})
        txt = body[0].find_all('p')
        for m in txt:
            text = m.get_text().replace('\n', '').replace('\r', '')
            if ('This review may contain spoilers' not in text) and ('Add another review' not in text):
                finaltxt.append(text)

    title = wp.find('a',{'class':'main'}).get_text().replace('-',' ').replace(':',' -')

    book = open('d://{}.txt'.format(title), 'w', encoding='UTF-8')
    for i in finaltxt:
        book.write(i+'\n')
#    book.write('['+str(finaltxt.index(i)+1)+']\n'+i+'\n\n')
    book.close()