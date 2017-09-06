file_name = input()
text = open(file_name, 'r').read()
text2 = text.upper()
new_name = 'upper'+ file_name
open(new_name, 'w')