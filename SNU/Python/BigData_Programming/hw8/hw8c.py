# Assignment Number..: 8
# Author.............: Park, Chanwoo
# File name..........: hw8c.py
# Written Date.......: 2017-07-12
# Program Description: Statistics with python

### Codings from hw7c - begin
from csv import DictReader

car = open('car.csv', 'r')
car_dict = DictReader(car)
car_list = []

for i in car_dict:
    car_list.append(i)

def parser_doors(x):
    for i in range(len(x)):
        try:
            x[i]['doors'] = int(x[i]["doors"])
        except:
            x[i]['doors'] = 5

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

parser_doors(car_list)
parser_class(car_list)
### Codings from hw7c -end


# Import relevant module, (and change the command line)
import numpy as np

# Create lists to allocate values from relevant keys
doors = []
classes = []

# Allocate relevant values to a list in a right order
for i in range(len(car_list)):
    doors.append(car_list[i]['doors'])
for i in range(len(car_list)):
    classes.append(car_list[i]['class'])

# Print first 5 values from the list 'doors'
print('{:<5}'.format('Q1'), 'The first 5 values from \'doors\' are', doors[0:5], '\n')

# Calculate and print mean and standard deviation from the list 'doors', using numpy module
print('{:<5}'.format('Q2-1'), 'The mean for \'doors\' is', np.mean(doors))
print('{:<5}'.format('Q2-2'), 'The standard deviation for \'doors\' is', np.std(doors), '\n')

# Calculate and print the correlation between 'doors' and 'class'
print('{:<5}'.format('Q3'), 'The correlation matrix between \'doors\' and \'class\' is:\n',
      np.corrcoef(doors,classes))
