import cv2
import numpy as np
from matplotlib import pyplot as plt

# Load the input image
img_rgb = cv2.imread(r'C:\Users\User\Desktop\Model\images\houseplan6.jpg')
img_gray = cv2.cvtColor(img_rgb, cv2.COLOR_BGR2GRAY)

# List of template paths
template_paths = [
    r'C:\Users\User\Desktop\Model\images\temp1.jpg',
    r'C:\Users\User\Desktop\Model\images\temp2.jpg',
    r'C:\Users\User\Desktop\Model\images\temp3.jpg',
    r'C:\Users\User\Desktop\Model\images\temp4.jpg',
    r'C:\Users\User\Desktop\Model\images\temp5.jpg',
    r'C:\Users\User\Desktop\Model\images\temp6.jpg',
    r'C:\Users\User\Desktop\Model\images\temp7.jpg',
    r'C:\Users\User\Desktop\Model\images\temp8.jpg',
    r'C:\Users\User\Desktop\Model\images\temp9.jpg'
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

# Display the matched image
cv2.imshow("Matched image", img_rgb)
cv2.waitKey(0)
cv2.destroyAllWindows()
