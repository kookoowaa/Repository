# Assignment Number..: 4
# Author.............: Park, Chanwoo
# File name..........: hw4b.py
# Written Date.......: 2017-07-03
# Program Description: Defining functions

# Load module to define pi(3.14) more precisely
import math

# Defining function for area calculation
def area_circ(r):
    print('Q1:  The area of circle is', round(math.pi,2) * r**2)
# Running the function at r = 5
area_circ(5)

# Defining function to create a list and measure the length of the list
def norm(*args):
    global v                                    # Command to allow v to append values
    v = []                                       # Create a list called (v)
    for i in args:
        v.append(i)                              # Add values to the list (v) in the parameter order
    print('Q2:  v has length of',len(v))     # Calculate the length of the list (v)
# Running the function at v = [1, 2, 3, 4]
norm(1,2,3,4)

# Defining recursive function that counts down
def count(n):
    if n > 0:                                    # As long as n is greater than 0,
        print('Q3:  Count-down', n)           # it will decrease by 1 while printing its value
        count(n-1)
    elif n == 0:                                 # If it hits 0, then print Zero!!
        print('Q3:  Zero!!')
# Running the function at n = 5
count(5)

# Lambda function to calculate area of a circle
area_circ_id = lambda RADIUS:  print('Q4:  The are of cicle using lamda function is',
                                     round(math.pi,2) * RADIUS**2)  # Assign function to calculate and print the result
# Running the lambda function at RADIUS = 5
area_circ_id(5)