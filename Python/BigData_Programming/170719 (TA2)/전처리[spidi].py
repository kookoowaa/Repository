import nltk
from nltk.corpus import stopwords
stopWords = stopwords.words('english')
lemmatizer = nltk.wordnet.WordNetLemmatizer()

with open('d://Spider Man - Homecoming.txt', encoding='UTF-8') as x:
    TEXT = x.readlines()
    x.close()

TheList = []

for i in TEXT:
    LINE = ''
    tokened_line = nltk.word_tokenize(i.lower())
    for tokend_word_from_line in tokened_line:
        if tokend_word_from_line.lower() not in stopWords:
            LINE += ' ' + lemmatizer.lemmatize(tokend_word_from_line)
    TheList.append(LINE)

with open('d://spidi2.txt', 'w', encoding= 'UTF-8') as spidi:
    for i in TheList:
         spidi.write(i+'\n')
    spidi.close()
