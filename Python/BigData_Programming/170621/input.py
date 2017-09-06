count = int(input('숫자 기입'))

print('{} file{}'.format((count if count != 0 else 'No'),('s' if count != 1 else '')))