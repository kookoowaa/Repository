### 병렬에서 루프문 보다는 zip 활용
names = ['Cecilia', 'Lise', 'Marie']
letters = [len(n) for n in names]
longest_name = None
max_letters = 0

# 루프문 활용
for i in range(len(names)):
    count = letters[i]
    if count > max_letters:
        longest_name = names[i]
        max_letters = count
print(longest_name)
print(max_letters)
# >> Cecilia
# >> 7

# 루프 enumerate 활용
for order, name in enumerate(names):
    if len(name)>max_letters:
        max_letters, longest_name = letters[order], name
print(longest_name)
print(max_letters)
# >> Cecilia
# >> 7

# zip 활용
for name, length in zip(names, letters):
    if length > max_letters:
        max_letters, longest_name = length, name
print(longest_name)
print(max_letters)
# >> Cecilia
# >> 7