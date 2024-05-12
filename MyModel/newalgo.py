# import os
# import cv2
# import numpy as np
# import tensorflow as tf
# from tensorflow.keras.models import Sequential # type: ignore
# from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense # type: ignore
# from tensorflow.keras.preprocessing.image import ImageDataGenerator # type: ignore

# # Define directories for train, validation, and test data
# train_dir = r'E:\DataSet\FDS\Train'
# validation_dir = r'E:\DataSet\FDS\Validation'
# test_dir = r'E:\DataSet\FDS\Test'

# # Define image dimensions and batch size
# img_width, img_height = 150, 150
# batch_size = 32

# # Create ImageDataGenerator instances for train, validation, and test data
# train_datagen = ImageDataGenerator(rescale=1.0/255)
# validation_datagen = ImageDataGenerator(rescale=1.0/255)
# test_datagen = ImageDataGenerator(rescale=1.0/255)

# train_generator = train_datagen.flow_from_directory(
#     train_dir,
#     target_size=(img_width, img_height),
#     batch_size=batch_size,
#     class_mode='categorical'
# )

# validation_generator = validation_datagen.flow_from_directory(
#     validation_dir,
#     target_size=(img_width, img_height),
#     batch_size=batch_size,
#     class_mode='categorical'
# )

# test_generator = test_datagen.flow_from_directory(
#     test_dir,
#     target_size=(img_width, img_height),
#     batch_size=batch_size,
#     class_mode='categorical'
# )

# # Define the CNN model
# model = Sequential([
#     Conv2D(32, (3, 3), activation='relu', input_shape=(img_width, img_height, 3)),
#     MaxPooling2D((2, 2)),
#     Conv2D(64, (3, 3), activation='relu'),
#     MaxPooling2D((2, 2)),
#     Conv2D(128, (3, 3), activation='relu'),
#     MaxPooling2D((2, 2)),
#     Conv2D(128, (3, 3), activation='relu'),
#     MaxPooling2D((2, 2)),
#     Flatten(),
#     Dense(512, activation='relu'),
#     Dense(26, activation='softmax')  # Assuming 26 classes
  
# ])

# # Compile the model
# model.compile(optimizer='adam',
#               loss='categorical_crossentropy',
#               metrics=['accuracy'])

# # Train the model
# history = model.fit(
#     train_generator,
#     steps_per_epoch=train_generator.samples // batch_size,
#     epochs=20,
#     validation_data=validation_generator,
#     validation_steps=validation_generator.samples // batch_size
# )

# # Evaluate the model on test data
# test_loss, test_accuracy = model.evaluate(test_generator)
# print("Test Loss:", test_loss)
# print("Test Accuracy:", test_accuracy)

# # Function to preprocess images
# def preprocess_image(image_path, img_width, img_height):
#     img = cv2.imread(image_path)
#     img = cv2.resize(img, (img_width, img_height))
#     img = img / 255.0  # Normalize pixel values
#     img = np.expand_dims(img, axis=0)  # Add batch dimension
#     return img

# # Function to detect symbols
# def detect_symbols(image_path):
#     # Preprocess the image
#     img = preprocess_image(image_path, img_width, img_height)
    
#     # Predict the symbols
#     predictions = model.predict(img)
    
#     # Get the predicted symbol labels
#     symbol_labels = train_generator.class_indices
    
#     # Get the predicted symbol with highest probability
#     predicted_symbol_index = np.argmax(predictions)
#     predicted_symbol_label = [k for k, v in symbol_labels.items() if v == predicted_symbol_index][0]
    
#     return predicted_symbol_label

# # Function to save the process
# def save_process(image_path, predicted_symbol):
#     # Save the image path and predicted symbol to a file
#     with open('process_log.txt', 'a') as file:
#         file.write(f"Image Path: {image_path}, Predicted Symbol: {predicted_symbol}\n")

# # Example usage
# image_path = r'E:\DataSet\FDS\Test\img\m001.jpg' 
# predicted_symbol = detect_symbols(image_path)
# print("Predicted Symbol:", predicted_symbol)
# save_process(image_path, predicted_symbol)

import os
import cv2
import numpy as np
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense
from tensorflow.keras.preprocessing.image import ImageDataGenerator

# Define directories for train, validation, and test data
train_dir = r'E:\DataSet\FDS\Train'
validation_dir = r'E:\DataSet\FDS\Validation'
test_dir = r'E:\DataSet\FDS\Test'

# Define image dimensions and batch size
img_width, img_height = 150, 150
batch_size = 32

# Create ImageDataGenerator instances for train, validation, and test data
train_datagen = ImageDataGenerator(rescale=1.0/255)
validation_datagen = ImageDataGenerator(rescale=1.0/255)
test_datagen = ImageDataGenerator(rescale=1.0/255)

train_generator = train_datagen.flow_from_directory(
    train_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='categorical'
)

validation_generator = validation_datagen.flow_from_directory(
    validation_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='categorical'
)

test_generator = test_datagen.flow_from_directory(
    test_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='categorical'
)

# Define the CNN model
model = Sequential([
    Conv2D(32, (3, 3), activation='relu', input_shape=(img_width, img_height, 3)),
    MaxPooling2D((2, 2)),
    Conv2D(64, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    Conv2D(128, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    Conv2D(128, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    Flatten(),
    Dense(512, activation='relu'),
    Dense(26, activation='softmax')  # Assuming 26 classes
])

# Compile the model
model.compile(optimizer='adam',
              loss='categorical_crossentropy',
              metrics=['accuracy'])

# Train the model
history = model.fit(
    train_generator,
    steps_per_epoch=train_generator.samples // batch_size,
    epochs=20,
    validation_data=validation_generator,
    validation_steps=validation_generator.samples // batch_size
)

# Evaluate the model on test data
test_loss, test_accuracy = model.evaluate(test_generator)
print("Test Loss:", test_loss)
print("Test Accuracy:", test_accuracy)

# Function to preprocess images
def preprocess_image(image_path, img_width, img_height):
    img = cv2.imread(image_path)
    img = cv2.resize(img, (img_width, img_height))
    img = img / 255.0  # Normalize pixel values
    img = np.expand_dims(img, axis=0)  # Add batch dimension
    return img

# Function to detect symbols
def detect_symbols(image_path):
    # Preprocess the image
    img = preprocess_image(image_path, img_width, img_height)
    
    # Predict the symbols
    predictions = model.predict(img)
    
    # Get the predicted symbol labels
    symbol_labels = train_generator.class_indices
    
    # Get the predicted symbol with highest probability
    predicted_symbol_index = np.argmax(predictions)
    predicted_symbol_label = [k for k, v in symbol_labels.items() if v == predicted_symbol_index][0]
    
    return predicted_symbol_label

# Function to save the process
def save_process(image_path, predicted_symbol):
    # Save the image path and predicted symbol to a file
    with open('process_log.txt', 'a') as file:
        file.write(f"Image Path: {image_path}, Predicted Symbol: {predicted_symbol}\n")
