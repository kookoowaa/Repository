import json

KC = []
longtext = open('z://tweet_kyochon.txt')

for i in longtext:
    try:
        KC.append(json.loads(i))
    except:
        continue

print(len(KC))

MY = []
for i in KC:
    try:
        if i['place']['country_code'] == 'MY':
            MY.append(i['text'])
    except:
        pass
len(MY)

SETS = []
for i in KC:
    if i['place'] == None:
        SETS.append(i['user']['time_zone'])

SETS