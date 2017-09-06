# Assignment Number..: 3
# Author.............: Park, Chanwoo
# File name..........: hw3a.py
# Written Date.......: 2017-06-28
# Program Description: input tester, conditional command

# Create variable ID and assign name to it
ID = 'Park Chanwoo'
print('Q1 : ', ID)
print()

# Separate ID into two variables by an empty space
last_name = ID.split(' ')[0]
print('Q2a: ', last_name)
first_name = ID.split(' ')[-1]
print('Q2b: ', first_name)
print()

# Receive values from users and assign it to variables
last_name_input = input('Q4 : What is your last name? ')
first_name_input = input('Q4 : What is your first name? ')
print()

# Test given names with original ID and return variables accordingly. (Not case sensitive)
if last_name == last_name_input:
    if first_name == first_name_input:
        print('Your ID is verified')
    else:
        print('first name is incorrect')
else:
    if first_name != first_name_input:
        print('both first and last name are incorrect')
    else:
        print('last name is incorrect')
