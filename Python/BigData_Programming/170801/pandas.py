import pandas as pd

dotop = pd.read_excel('dotop2.xlsx', sheetname ='dotop')

animal_subs = animals.loc[:5, 'name':'feathers']

animal_sub.to_excel('animals_sub.xlsx')