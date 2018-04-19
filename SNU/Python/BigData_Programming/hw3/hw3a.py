# Assignment Number..: 3
# Author.............: Park, Chanwoo
# File name..........: hw3a.py
# Written Date.......: 2017-06-28
# Program Description: exercise on input, slicing, conditional commands

# Create variable ID and assign name to it
ID = 'Park Chanwoo'
print('Q1 :', ID)
print()

# Separate ID into two variables by blank space
last_name = ID.split(' ')[0]
print('Q2a:', last_name)
first_name = ID.split(' ')[-1]
print('Q2b:', first_name)
print()

# Return the types of variable 'first_name' and 'last_name'
print('Q3a: first_name ', type(first_name), '\nQ3b: last_name  ', type(last_name))
print()

# Receive values from users and assign it to variables
last_name_input = input('Q4a: What is your last name? ')
first_name_input = input('Q4b: What is your first name? ')
print()

# Test whether given names are same as the original ID and return messages accordingly.
# It seems meaningless to verify conditions case sensitive, at least for this case.
if last_name.lower() == last_name_input.lower():
    if first_name.lower() == first_name_input.lower():
        print('Q5 : Your ID is verified')
    else:
        print('Q5 : first name is incorrect')
else:
    if first_name.lower() != first_name_input.lower():         # Although not in instruction, this line is needed to
        print('Q5 : both first and last names are incorrect')  # distinguish whether; both or just last name is incorrect
    else:
        print('Q5 : last name is incorrect')
print()

# I would preferably make coding as follows:
#if last_name.lower() == last_name_input.lower() and first_name.lower() == first_name_input.lower():
#    print('Your ID is verified')
#elif last_name.lower() == last_name_input.lower() and first_name.lower() != first_name_input.lower():
#    print('first name is incorrect')
#elif last_name.lower() != last_name_input.lower() and first_name.lower() == first_name_input.lower():
#    print('last name is incorrect')
#else:
#    print('both first and last name are incorrect')


# Calculate square root of integer from 0 to 9 using 'for' command
import math
print('Q6 : srqt 0-9 using \'for\'')
for given_number in range(10):
    print('',given_number, ':', math.sqrt(given_number))
print()

# calculate square root of integer from 0 to 9 using 'while' command
print('Q7 : srqt 0-9 using \'while\'')
given_number2 = 0
while given_number2 < 10:
    print('', given_number2, ':', math.sqrt(given_number2))
    given_number2 += 1