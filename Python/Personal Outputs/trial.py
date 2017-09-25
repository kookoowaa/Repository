import random
import webbrowser
import pytagcloud # requires Korean font support
import sys
from collections import Counter
from konlpy.tag import Kkma
from konlpy.utils import pprint
kkma = Kkma()

a = open('d:/github/r/visualization/snack_proj/twitter_text.txt', 'r', encoding = 'utf-8')
b = a.read()

pprint(kkma.nouns(b))

