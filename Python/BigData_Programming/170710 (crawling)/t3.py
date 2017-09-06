from bs4 import BeautifulSoup
from urllib.request import urlopen

key = input('what would you like to search?')
key_search = BeautifulSoup(urlopen('http://dic.daum.net/search.do?q='+key), 'html.parser')

key_title = key_search.find(attrs= {'class': 'txt_emph1'})
print(key_title.get_text())
key_def = key_search.find(attrs= {'class': 'list_search'})
print(key_def.get_text())

