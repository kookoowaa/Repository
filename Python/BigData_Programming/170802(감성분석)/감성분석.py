### 1) 문장 정리
def parse_input(str):
    '''Parse the given sentence and store it to a list

    str......: sentence (string)
    Return...: a list of words
    '''
    import re

    str = re.sub(r'[!?;,.:]', '', str)

    str = str.lower()

    words = str.split(' ')

    return words


### 2) 가중치 딕션화
def parse_weight(fname):
    '''Parse boosters and their weights

    fname....: file containing boosteres list
    Return...: a dictionary containning boosters as keys and
               their weights as values
    '''
    w = {}
    f = open(fname, 'r')

    for line in f:
        rule = line.split('\t')
        w[rule[0]] = int(rule[1])

    return w


### 3) 부정어 리스트화
def parse_negate(fname):
    '''Parse negators

    fname....: file containing negators list
    Return...: a list of negators
    '''

    f = open(fname, 'r')

    w = f.read().splitlines()

    return w


### 4) 문장 정리 & 가중치 딕션
def weight_default(list_words, dic_weights):
    '''Set default weights of words

    list_words..: a list of words to be analyzed from "parse_input()"
    dic_weights.: a dictionary of words and their defaults weights
                  processed by "parse_weidht() using
                  EmotionLookupTable.txt
    '''
    l = []
    for word in list_words:
        if word in dic_weights:
            l.append((word, dic_weights[word]))
        else:
            substr = word
            while substr != '':
                pat = substr + '*'
                if pat in dic_weights:
                    l.append((word, dic_weights[pat]))
                    break
                else:
                    substr = substr[:-1]
            if substr == '':
                l.append((word, 0))

    return l


### 5) 4번에 부스팅에 따라 가중치 변경
def weight_boost(list_pairs, dic_boost):
    '''If any booster exists, apply the booster to the corresponding word

    list_pairs.: a list of (word, weight) processed by weight_default()
    dic_boost..: a dictionary processed by parse_weight() using
                 BoosterWordList.txt
    Return.....: a list of boosted (word, weight) pairs
    '''
    l = []
    boost = 0
    for p in list_pairs:
        w = p[1]
        if boost != 0:
            if w > 0:
                w += boost
            elif w < 0:
                w -= boost
            boost = 0
            l.append((p[0], w))
        else:
            l.append(p)
        if p[0] in dic_boost:
            boost = dic_boost[p[0]]

    return l

### 6) 부정어의 경우 음수를 취하게 함
def weight_negate(list_pairs, list_negates):
    '''If any negator exists, apply the negator to the corresponding word

    list_pairs...: a list of (word,weight) processed by weight_boost()
                   which updates the weights
    list_negates.: a dictionary processed by parse_negate() using
                   NegatingWordList.txt
    Return.......: a list of negated (word,weight) pairs
    '''
    l = []
    negate = 0
    for p in list_pairs:
        w = p[1]
        if negate != 0:
            if w > 0:
                if w % 2 == 1:
                    w = (w + 1) * -0.5
                else:
                    w *= -0.5
            else:
                w = 0
            negate = 0
            l.append((p[0], int(w)))
        else:
            l.append(p)
        if p[0] in list_negates:
            negate = 1
    return l


### 7) 1~6모든 가중치릐 평균 구하기
def extract_avg(list_pairs):
    '''Extract average weights for words in the text

    lsit_pairs.: a list of (word, weight)
    Return.....: a tuple of (avg_positive, avg_negative)
    '''
    pos_sum = 0
    neg_sum = 0

    for p in list_pairs:
        if p[1] > 0:
            pos_sum += p[1]
        elif p[1] < 0:
            neg_sum += p[1]
    pos_avg = pos_sum / len(list_pairs)
    neg_avg = neg_sum / len(list_pairs)

    return (pos_avg, neg_avg)


### 8) 모든 단계를 종합하기
def senti(str):
    '''Aggregation of methods to get sentiment value
    (pos or neg strength) of words input

    str......: any sentence
    Return...: positive, negative strength
    '''
    # Parsing rules
    w_emotion = parse_weight('EmotionLookupTable.txt')
    w_boost = parse_weight('BoosterWordList.txt')
    w_negate = parse_negate('NegatingWordList.txt')

    # Parse Input
    words = parse_input(str)

    # Weighting
    default = weight_default(words, w_emotion)
    boosted = weight_boost(default, w_boost)
    negated = weight_negate(boosted, w_negate)

    return extract_avg(negated)
