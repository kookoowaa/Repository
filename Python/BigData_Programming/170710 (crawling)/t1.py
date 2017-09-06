from bs4 import BeautifulSoup
from urllib.request import urlopen

oxford = BeautifulSoup(urlopen('http://dictionary.cambridge.org/dictionary/english/python?fallbackFrom=english-korean'), 'html.parser')
oxford_title = oxford.find(attrs= {'class': 'headword'})
print(oxford_title.get_text())
oxford_def = oxford.find(attrs= {'class': 'def'})
print(oxford_def.get_text())

fout = open('dictionary.txt', 'w')
fout.write(oxford_title.get_text()+': '+oxford_def.get_text())
fout.close()
