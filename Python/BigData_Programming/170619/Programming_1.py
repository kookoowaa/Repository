print('\nWelcome to Python Programming')		#Greetings
print('This is Your First Python Program\n')
print('What is your name?')						#Ask for your input
name = input()

print('Hi! ' + name)								#compare this with the following line
print('Hi!', name)
print('The length of your name is:')
print(len(name))

age = input ('\nWhat is your age?')
print('You will be ' + '(int(age) + 1)' + 'years old in the next year.')	#Another way of asking user input
print('You will be\t', int(age) + 1, '\tyears old in the next year.')
print('Bye~~!')

