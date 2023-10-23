### P3. Sum the numbers in the sample image data.

import re
import pytesseract
from PIL import Image

image_path = 'sample-image-data.png'

img = Image.open(image_path)
img = img.convert('L')  # Convert the image to grayscale to get a better result.

text = pytesseract.image_to_string(img)

# According to a recent notice, I used regular expression to remove the '-' symbol and just simply add 2017 + 20.
text = re.sub(r'-(?=\d{2}\b)', ' ', text)

# Or, I can add " 20" to make '2017-20' a meaningful years -- 2017 AND 2020. That way, the answer might be 22017 not 20017.
# text = re.sub(r'-(?=\d{2}\b)', ' 20', text)

numbers = [int(word) for word in text.split() if word.isdigit()]

total = sum(numbers)

print("Extracted numbers:", numbers) # The result will be 20017 as I simply split "2017-20" to 2017 and 20. But as I mentioned before, it can be 22017.
print("Sum of the numbers:", total)

