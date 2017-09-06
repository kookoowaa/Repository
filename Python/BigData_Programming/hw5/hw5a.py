# Assignment Number..: 5
# Author.............: Park, Chanwoo
# File name..........: hw5a.py
# Written Date.......: 2017-07-05
# Program Description: Using package and module

# Q1: Printing current time using 'datetime' module
import datetime
now = datetime.datetime.now()   # Retrieve local time from the computer
print('Q1: ',now.strftime('%Y-%m-%d %H:%M:%S'))    # Assign format for time to print & print
print()

# Q2: Manipulating csv file using open function
text = open('cars.csv', 'r').readlines()    # Make sure the file 'cars.csv' is located at the same working directory
for row in text:    # Print lines
    print('Q2: ',row, end='')
print()

# Q3: Manipulating csv file using csv module
import csv
file = open('cars.csv', 'r')    # Load csv file
file_csv = csv.reader(file)    # Read loaded file using csv module, so that it can be understood in python
for row2 in file_csv:    # Print lines
    print('Q3: ',row2)
