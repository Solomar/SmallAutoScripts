# Philippe Rosa-Pong 
# Date: 26 janvier 2018
# Description:
# Python script that uses properly seperated tsv files from 
#!/usr/bin/python
import csv
import os

source_and_destination_files = [['iTunesConnectDescriptions.tsv','description.txt'], ['iTunesConnectKeywords.tsv','keywords.txt'], ['iTunesConnectSubtitles.tsv','subtitle.txt']]

for fileName, metadataFileCreated in source_and_destination_files:
  try:
    f = open(fileName)
  except IOError:
    print 'Cannot open or find', fileName
    break;

  # Get all the languages from the first line
  with open(fileName) as csvfile:
    reader = csv.reader(csvfile, dialect='excel-tab')
    language_line = next(reader)

  # Initialize the multidimensionnal array by the amount of languages
  # that have been found in the first line of the file
  text_array_by_language = [[] for index in enumerate(language_line)]

  # Seperating all paragraphes for each languages in their own language array 
  with open(fileName) as csvfile:
    reader = csv.DictReader(csvfile, dialect='excel-tab')
    for row in reader:
      for i,l in enumerate(language_line):
        text_array_by_language[i].append(row[l]) # Tried to turn this in a list comprehesion but gave up after a bit.

  # Create the folder for the given language if it doesn't exist
  # and create or overwrite the given file with the content read for that language
  for i,l in enumerate(language_line):
    if not os.path.exists(l):
      os.makedirs(l)
    f=open(l + '/' + metadataFileCreated, "w+")
    if metadataFileCreated == 'keywords.txt':
    	for word in text_array_by_language[i]:
    		f.write(word + ",")
    		print(word)
    else:
      for word in text_array_by_language[i]:
        f.write(word + "\n" + "\n")
    f.close()