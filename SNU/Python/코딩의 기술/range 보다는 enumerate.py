###
flavor_list = ['vanilla', 'chocolate', 'pecan', 'strawberry']
for flavor in flavor_list:
    print('{} is delicious'.format(flavor))
# >> vanilla is delicious
# >> chocolate is delicious
# >> pecan is delicious
# >> strawberry is delicious

for i in range(len(flavor_list)):
    flavor = flavor_list[i]
    print('{}: {}'.format(i+1, flavor))
# >> 1: vanilla
# >> 2: chocolate
# >> 3: pecan
# >> 4: strawberry

for x,m in enumerate(flavor_list):
    print('{}: {}'.format(x+1, m))
# >> 1: vanilla
# >> 2: chocolate
# >> 3: pecan
# >> 4: strawberry