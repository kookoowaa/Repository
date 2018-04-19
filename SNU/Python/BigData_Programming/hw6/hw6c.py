# Assignment Number..: 6
# Author.............: Park, Chanwoo
# File name..........: hw6c.py
# Written Date.......: 2017-07-10
# Program Description: Crawling data from the web

# Import relevant modules
from bs4 import BeautifulSoup
from urllib.request import urlopen

# Open website using urlopen function
url = 'https://en.wikipedia.org/wiki/List_of_Presidents_of_the_United_States'
web = urlopen(url)      # not sure if it is a necessary step


# Retrieve html data from Wikipedia using BeautifulSoup
source = BeautifulSoup(urlopen(url), 'html.parser')

# Retrieve 'wikitable' data from 'source'
# There are three tables within the data.
table = source.findAll(attrs={'class': 'wikitable'})

# Retrieve 'names of presidents' from the 'first table' via html tag <big>
names = table[0].findAll('big')

# Select the first 10 from the list 'names' and print the outcome
for i in range(10):
    print("{:<3}".format(i+1),names[i].get_text())