# Assignment Number..: 1
# Author.............: Park, Chanwoo
# File name..........: hw1a.py
# Written Date.......: 2017-06-21
# Program Description: Age identification

# Retrieve user name /w instruction
name = input('What is your name? ',)
message = '\nQ1: Welcome, {}'
print(message.format(name))
# Also, print(name,'\n')...for a simple version

# Retrieve user age /w instruction
age = input('What is your age? ',)  #Q2

# Identify class of variable 'age'
print('''
Q3: The class of variable 'age' is ''', type(age),'\n')

# Replace the class of variable 'age' to float
age = float(age)
print('Q4: The class of variable \'age\' has been replaced to', type(age),'\n')

# Return different messages according to the user age(@20)
if age < 20:
    print('You are a minor')
else:
    print('You are an adult')
# Also, print('You are a minor') if age<20 else print('You are an adult')... for a simple version
