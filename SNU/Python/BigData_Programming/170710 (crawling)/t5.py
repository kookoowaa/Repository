from bs4 import BeautifulSoup
from urllib.request import urlopen


key = open('search.txt').readlines()
dict = open('dictionary3.txt', 'w', encoding='UTF-8')

for i in key:
    key_search = BeautifulSoup(urlopen('http://dic.daum.net/search.do?q='+i), 'html.parser')
    key_title = key_search.find(attrs= {'class': 'txt_emph1'})
    print(key_title.get_text())
    key_def = key_search.find(attrs= {'class': 'list_search'})
    print(key_def.get_text())
    dict.write(key_title.get_text()+'\n'+key_def.get_text()+'\n\n')

dict.close()