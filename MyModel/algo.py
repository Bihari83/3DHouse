import cv2
import numpy as np
from matplotlib import pyplot as plt

# Function to resize image to a specific width and height
def resize_image(image, width, height):
    return cv2.resize(image, (width, height))

# Load the input image
img_rgb = cv2.imread(r'C:\Users\User\Desktop\ComFinal\Model\images\houseplan6.jpg')
img_gray = cv2.cvtColor(img_rgb, cv2.COLOR_BGR2GRAY)

# Define the desired width and height for output images
output_width = 800
output_height = 600

# List of template paths
template_paths = [
    r'C:\Users\User\Desktop\ComFinal\Model\images\temp1.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\temp2.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\temp3.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\temp4.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\temp5.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\temp6.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\temp7.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\temp8.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\temp9.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\win1.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\win2.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\win3.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\win4.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\win5.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\win6.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\win7.jpg',
    r'C:\Users\User\Desktop\ComFinal\Model\images\win8.jpg'
    # Add more template paths as needed
]

# Loop through each template
for template_path in template_paths:
    # Load the template image
    template = cv2.imread(template_path, 0)
    if template is None:
        print(f"Error: Unable to load template image '{template_path}'.")
        continue

    # Get the dimensions of the template image
    h, w = template.shape[::-1]

    # Perform template matching
    res = cv2.matchTemplate(img_gray, template, cv2.TM_CCOEFF_NORMED)

    # Define a threshold for matching
    threshold = 0.8

    # Find all locations where the match score is above the threshold
    loc = np.where(res >= threshold)

    # Draw rectangles around the matched areas
    for pt in zip(*loc[::-1]):
        cv2.rectangle(img_rgb, pt, (pt[0] + w, pt[1] + h), (0, 0, 255), 2)

# Resize the final matched image to the desired output width and height
img_rgb_resized = resize_image(img_rgb, output_width, output_height)

# Display the resized matched image
cv2.imshow("Matched image", img_rgb_resized)
cv2.waitKey(0)
cv2.destroyAllWindows()
