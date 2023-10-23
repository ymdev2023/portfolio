### P1. Count the number of exact matches for the word “data” in the sample text, not including “Data” or “data-driven”. 

import re

file_path = 'sample-text-data.txt'

with open(file_path, 'r', encoding='utf-8') as file:
    text = file.read()

words = [word.strip() for word in re.split(r'\s|[,\.]', text)]

data_count = 0

for word in words:
    if word == "data":
        # print(word)
        data_count += 1

print("the number of exact matches for the word 'data' in the sample text:", data_count)
