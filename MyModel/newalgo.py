# import os
# import cv2
# import numpy as np
# from tensorflow.keras.models import Sequential
# from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense

# # Define paths to your dataset
# train_dir = 'E:/DataSet/FDS/Train'
# validation_dir = 'E:/DataSet/FDS/Validation'
# test_dir = 'E:/DataSet/FDS/Test'

# # Parameters
# batch_size = 32
# image_size = (150, 150)
# input_shape = (150, 150, 3)  # Assuming RGB images

# def load_images_from_directory(directory):
#     images = []
#     labels = []
#     for label, class_name in enumerate(sorted(os.listdir(directory))):
#         class_dir = os.path.join(directory, class_name)
#         for image_name in os.listdir(class_dir):
#             image_path = os.path.join(class_dir, image_name)
#             image = cv2.imread(image_path)
#             image = cv2.resize(image, image_size)
#             images.append(image)
#             labels.append(label)
#     return np.array(images), np.array(labels)

# # Load train, validation, and test images
# train_images, train_labels = load_images_from_directory(train_dir)
# validation_images, validation_labels = load_images_from_directory(validation_dir)
# test_images, test_labels = load_images_from_directory(test_dir)  # Load test labels

# # Normalize pixel values
# train_images = train_images.astype('float32') / 255
# validation_images = validation_images.astype('float32') / 255
# test_images = test_images.astype('float32') / 255

# # Define the CNN model
# model = Sequential([
#     Conv2D(32, (3, 3), activation='relu', input_shape=input_shape),
#     MaxPooling2D((2, 2)),
#     Conv2D(64, (3, 3), activation='relu'),
#     MaxPooling2D((2, 2)),
#     Conv2D(128, (3, 3), activation='relu'),
#     MaxPooling2D((2, 2)),
#     Flatten(),
#     Dense(512, activation='relu'),
#     Dense(26, activation='softmax')  # Assuming 26 classes
# ])

# # Compile the model
# model.compile(optimizer='adam',
#               loss='sparse_categorical_crossentropy',
#               metrics=['accuracy'])

# # Train the model
# history = model.fit(
#     train_images, train_labels,
#     batch_size=batch_size,
#     epochs=10,
#     validation_data=(validation_images, validation_labels)
# )

# # Evaluate the model on the test data
# test_loss, test_accuracy = model.evaluate(test_images, test_labels)
# print('Test loss:', test_loss)
# print('Test accuracy:', test_accuracy)

# # Save the model
# model.save('symbol_detection_model.h5')

import os
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense
from tensorflow.keras.preprocessing.image import ImageDataGenerator

# Define paths to your dataset
train_dir = 'E:/DataSet/FDS/Train'
validation_dir = 'E:/DataSet/FDS/Validation'
test_dir = 'E:/DataSet/FDS/Test'

# Parameters
batch_size = 64  # Increase the batch size
image_size = (150, 150)

# Define data generators
train_datagen = ImageDataGenerator(rescale=1./255)
validation_datagen = ImageDataGenerator(rescale=1./255)
test_datagen = ImageDataGenerator(rescale=1./255)

train_generator = train_datagen.flow_from_directory(
    train_dir,
    target_size=image_size,
    batch_size=batch_size,
    class_mode='categorical',
    shuffle=True)  # Shuffle the data

# Calculate the total number of samples in the training dataset
total_train_samples = len(train_generator.filenames)

# Calculate the steps_per_epoch based on the total number of samples and the batch size
steps_per_epoch = total_train_samples // batch_size

# If there's any remainder, add 1 to steps_per_epoch to include the remaining samples
if total_train_samples % batch_size:
    steps_per_epoch += 1

# Print the calculated steps_per_epoch
print("Steps per epoch:", steps_per_epoch)

validation_generator = validation_datagen.flow_from_directory(
    validation_dir,
    target_size=image_size,
    batch_size=batch_size,
    class_mode='categorical')

test_generator = test_datagen.flow_from_directory(
    test_dir,
    target_size=image_size,
    batch_size=batch_size,
    class_mode='categorical')

# Determine the number of classes dynamically
num_classes = len(os.listdir(train_dir))

# Define the CNN model
model = Sequential([
    Conv2D(32, (3, 3), activation='relu', input_shape=(150, 150, 3)),
    MaxPooling2D((2, 2)),
    Conv2D(64, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    Conv2D(128, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    Flatten(),
    Dense(512, activation='relu'),
    Dense(num_classes, activation='softmax')
])

# Compile the model
model.compile(optimizer='adam',
              loss='categorical_crossentropy',
              metrics=['accuracy'])

# Print model summary
model.summary()

# Train the model using data generators
try:
    history = model.fit(
        train_generator,
        steps_per_epoch=steps_per_epoch,
        epochs=10,
        validation_data=validation_generator,
        validation_steps=validation_generator.samples // batch_size
    )
except Exception as e:
    print("Error occurred during training:", e)

# Evaluate the model on the test data
try:
    test_loss, test_accuracy = model.evaluate(test_generator)
    print('Test loss:', test_loss)
    print('Test accuracy:', test_accuracy)
except Exception as e:
    print("Error occurred during evaluation:", e)

# Save the model using the native Keras format
model.save('symbol_detection_model.keras')  # Add the .keras extension
