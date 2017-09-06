try:
    age = int(input('age'))
    year = int(input('year'))
    print(age > year)
except ValueError:
    age = int(input('age in number'))
    year = int(input('years in number'))
    print(age > year)
except Exception as e:
    age = input('age in number')
    years = input('years in number')
    print(age > year)