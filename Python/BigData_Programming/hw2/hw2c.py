# Assignment Number..: 2
# Author.............: Park, Chanwoo
# File name..........: hw2c.py
# Written Date.......: 2017-06-26
# Program Description: Handling variable types

# Create set named 'colors'
colors = {'blue', 'red', 'violet', 'black', 'grey'}
print('Q1: ', colors,'\n')

# Count the number of values in the set
print('Q2: ', len(colors),'\n')

# Call the values in the set 'colors' and print a value per line
for x,y in enumerate(colors):
    print('Q3: ', y)
print()

# Create a list with name of movies
movies = ['life is beautiful', 'mission impossible', 'fight club', 'green mile']
print('Q4: ', movies, '\n')

# Create a new list from the list 'movies', and using the values 2nd from the back
movies_sub = movies[-2:]
print('Q5: ', movies_sub, '\n')

# Create dictionary (last names as keys; height in numbers for values) Q6
height = dict(Kim = 5.7, Lee = 5.3, Park = 6.7, Han = 5.3)

# Call the keys of dictionary 'height' and assign it to set 'keys'
keys = set(height.keys())
# On the instruction example, it showed return from the command below.
# However, the type of 'height.keys()' returned <class 'dict_keys'>, not set.
# keys = height.keys()
print('Q7: ', keys, '\n')

# Call value using command directly from dictionary to print
print('Q8: ', height['Kim'], '\n')
print('Q8: ', height['Lee'])