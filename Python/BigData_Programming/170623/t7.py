list1 = ['banana', 'apple', 'orange']
list2 = [1,2,3]
list3 = list1           #list3이 list1과 같은 주소 참조

list3.append('grape')
print(list1, list3)

list1 = list2           #list1이 list2와 같은 주소 참조
print (list1, list2, list3)

a = [1,2,3]
b = [1,2,3]
c = a
print(a is b)
print(a is c)

d = 'case'
e = 'case'
print(d,e,d is e)