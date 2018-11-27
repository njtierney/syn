#!/usr/local/bin/python3

# This script uses the NLTK library.
# I used 'pip' to install the library, as outlined here:
# https://www.nltk.org/install.html
#
# Then you need to initialise wordnet within the library
#  >>> import nltk
#  >>> nltk.download('wordnet')


from nltk.corpus import wordnet as wn

for i in wn.all_synsets():
	for j in i.lemmas(): # Iterating through lemmas for each synset.
		if j.antonyms(): # If adj has antonym.
			for ant in j.antonyms():
			  print(j.name(), ant.name())
