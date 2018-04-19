# Assignment Number..: 7
# Author.............: Park, Chanwoo
# File name..........: hw7c.py
# Written Date.......: 2017-07-12
# Program Description: Manipulating csv data

# Import relevant module
from csv import DictReader

# Open csv file (object)
car = open('car.csv', 'r')
# Save csv file in dictionary (object)
car_dict = DictReader(car)
# Create a list to insert dictionary (readable)
car_list = []

# Insert iterate object into the list created in an order
for i in car_dict:
    car_list.append(i)

# Print the first value from the list
print('Q1: ', car_list[0],'\n')

# Define function to replace str into int (replace to 5 if car has any more than 5 doors)
def parser_doors(x):
    for i in range(len(x)):
        try:
            x[i]['doors'] = int(x[i]["doors"])
        except:
            x[i]['doors'] = 5   # If the original data has str value(5more) and returns error, it will return 5 instead

# Define function to replace class values into integers according to the instruction given
def parser_class(y):
    for i in range(len(y)):
        if y[i]['class'] == 'unacc':
            y[i]['class'] = 0
        elif y[i]['class'] == 'acc':
            y[i]['class'] = 1
        elif y[i]['class'] == 'good':
            y[i]['class'] = 2
        else:
            y[i]['class'] = 3

# Run functions
parser_doors(car_list)
parser_class(car_list)

# Print the first value from the converted list
print('Q2: ', car_list[0])