### map 함수는 오히려 복잡, 풀어서 표현
even_squares = [i for i in range(1,11) if i % 2 == 0]
print(even_squares)
# >> [2, 4, 6, 8, 10]

alternative_square = map(lambda i: i**2, filter(lambda i: i % 2 == 0, range(1,11)))
print(alternative_square)

chile_ranks = {'ghost':1, 'habanero':2, 'cayenne':3}
rank_dict = {rank : name for name, rank in chile_ranks.items()}
print(rank_dict)
# >> {1: 'ghost', 2: 'habanero', 3: 'cayenne'}
chile_len_set = {len(n) for n in rank_dict.values()}
print(chile_len_set)
# >> {8, 5, 7}


### 리스트 컴프리헨션에서 표현식은 유용하지만 두개 넘지 않도록 (후자 선호)
matrix = [[1 , 2 , 3] , [4 , 5 , 6] , [7 , 8 , 9]]
flat = [i for row in matrix for i in row]
print(flat)
# >> [1, 2, 3, 4, 5, 6, 7, 8, 9]
squared = [[i**2 for i in row] for row in matrix]
print(squared)
# >> [[1, 4, 9], [16, 25, 36], [49, 64, 81]]
flat2 = []
for i in matrix:
    for m in i:
        flat2.append(m)
print(flat2)
# >> [1, 2, 3, 4, 5, 6, 7, 8, 9]