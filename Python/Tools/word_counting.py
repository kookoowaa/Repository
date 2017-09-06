import string
#Creates a dictionary to hold a unique word and the number of occurrences
words = {}

#Create a string that contains all those unwanted characters to ignore
strip = string.whitespace + string.punctuation + string.digits

#Ask the file name and open the file
filename = input('Enter a file name: ')
fin = open(filename, encoding = 'utf-8')

#Iterate over each line in the file
for line in fin:
    #Split each lower-cased line into words
    for word in line.lower().split():
        #Strip off the unwanted characters from both ends of each words
        word = word.strip(strip)
        #Add the word to the dictionary if the word is at least 2 characters long
        if len(word) > 1:
            if word not in words:
                words[word] = 1
            else:
                words[word] += 1
#Display the result
for word in sorted(words):
    print('"{}" occurs {} time(s).'.format(word, words[word]))