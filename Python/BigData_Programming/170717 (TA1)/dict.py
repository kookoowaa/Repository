Name = ('John', 'Jane', 'Paul', 'Elizabeth', 'Seth')
Salary = (30000, 50000, 45000,70000,10000)

Stable = {}
for i in range(0,5):
    Stable[Name[i]] = Salary[i]

print(Stable)

for i in Stable:
    print(i)