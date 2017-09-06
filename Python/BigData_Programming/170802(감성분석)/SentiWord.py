### 데이터 다운
## http://ai.stanford.edu/~amaas/data/sentiment/

### 데이터 정리

import os
files = os.listdir('D:/pyt(local)/aclImdb/train/pos')

#first_file = files[0]
#with open('D:/pyt(local)/aclImdb/train/pos/{}'.format(first_file), 'r', encoding = 'utf-8') as f:
#    review = f.read()
#    f.close

total_review = []
for i in files:
    with open('D:/pyt(local)/aclImdb/train/pos/{}'.format(i), 'r', encoding = 'utf-8') as f:
        total_review.append(f.read())
        f.close()



### 단어/문장 분석
import nltk
from nltk.corpus import sentiwordnet as swn


def word_sentiment_calculator(word, tag):
    pos_score = 0
    neg_score = 0

    if 'NN' in tag and len(list(swn.senti_synsets(word, 'n'))) > 0:
        syn_set = list(swn.senti_synsets(word, 'n'))
    elif 'VB' in tag and len(list(swn.senti_synsets(word, 'v'))) > 0:
        syn_set = list(swn.senti_synsets(word, 'v'))
    elif 'JJ' in tag and len(list(swn.senti_synsets(word, 'a'))) > 0:
        syn_set = list(swn.senti_synsets(word, 'a'))
    elif 'RB' in tag and len(list(swn.senti_synsets(word, 'r'))) > 0:
        syn_set = list(swn.senti_synsets(word, 'r'))
    else:
        return (0, 0)

    for syn in syn_set:
        pos_score += syn.pos_score()
        neg_score -= syn.neg_score()
    return (pos_score / len(syn_set), neg_score / len(syn_set))

## 문장 분석
def sentence_sentiment_calculator(sent):
    tokens = nltk.word_tokenize(sent)
    pos_tags = nltk.pos_tag(tokens)

    pos_score = 0
    neg_score = 0
    for word, tag in pos_tags:
        pos_score += word_sentiment_calculator(word, tag)[0]
        neg_score += word_sentiment_calculator(word, tag)[1]
    return (pos_score, neg_score)
