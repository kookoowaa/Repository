age = int(input("How old are you? ",))
##diff = 0

if age >= 20:
    #print('성인이 된지', age-20,'년 지났습니다')
    ##diff=age-20
    ##print('성인이 된지 {}년 {}지났습니다' .format(age-20, diff))
    ###print('성인이 된지 %s년 지났습니다'%diff)
    print('성인이 된지', str(age-20)+'년 지났습니다')
else:
    print('성인이 된지', str(20-age)+'년 지났습니다')

print('당신의 나이는', age, '입니다')