###
# 1 string을 가져옴
# 2 string을 토큰화함 (단어단위)
# 3 토큰화 한 단어들을 레마타이즈 함 (비슷한 단어화)
# 3-1 비슷한 단어 중 stopwords 제외
# 4 비슷한 단어화 한 것들에 tag 붙임
# 5 그 이후 필요한 후처리

### 파일 열기
with open('d://Spider Man - Homecoming.txt') as x:
    longtxt = x.read()
    x.close()

### 불러온 값 토큰화
import nltk
#nltk.download()

lt_token = nltk.word_tokenize(longtxt.lower())

### 토큰값 중 비슷한 단어 일치
lemmatizer = nltk.wordnet.WordNetLemmatizer()

ltt_lemm = []
for i in lt_token:
    ltt_lemm.append(lemmatizer.lemmatize(i))

from nltk.stem import PorterStemmer
PorterStemmer().stem(i)

### 불필요한 단어 제거
from nltk.corpus import stopwords
stopWords = stopwords.words('english')
# stopWords.append()   필요한 경우 stopWords 추가


lttl_removed = []
for i in ltt_lemm:
    if i not in stopWords:
        lttl_removed.append(i)
# lttl_removed = [i.text for i in ltt_lemm not in stopWords]

### 단어의 tag 추가
lttlr_taged = nltk.pos_tag(lttl_removed)

### tag 중 명사형만 추려서 리스트화
### 참고. http://dbrang.tistory.com/1139
lttlrt_list = []
for i,k in lttlr_taged:
    if k in ['NN','NNS','NNP','NNPS']:
        lttlrt_list.append(i)

### 리스트에서 빈도 수 확인
from collections import Counter
nL_counts = Counter(lttlrt_list)
print(nL_counts.most_common(10))

### 원치 않는 값 제거
while True:
    lttlrt_list.remove('movie')

### 기타 활용방식

a = nltk.Text(lttlrt_list)
set(lttlrt_list)


###