import nltk

sent1 = 'My only regret in life is that I did not drink more wine'
sent2 = 'I drink to make other people more interesting'
sent3 = 'An intelligent man is sometimes forced to be drunk to spend time with his fools'

# 토큰화
token1 = nltk.word_tokenize(sent1.lower())

# 토큰에 태그
toekn_tag = nltk.pos_tag(token1)

# Lemmatize 유사한 단어 동일하게 만듬 ex) cars, car = car, car
lemmatizer = nltk.wordnet.WordNetLemmatizer()       # 귀찮음 반복 방지 + 함수가 아니고 클래스라 이런 방식으로 소환(필수!)
print('Lemmatiziing sent1: ')
lemm1 = []
for token in token1:
    lemm1.append(lemmatizer.lemmatize(token))

# Stopwords 제거 ex) a, the, is, at, which 등

from nltk.corpus import stopwords

stopWords = stopwords.words('english')      # 안쓰는 영어단어 리스트 생성
impW = []
for i in token1:
    if i not in stopWords:
        impW.append(i)
print(impW)