# import os
# from tensorflow.keras.models import Sequential
# from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense
# from tensorflow.keras.preprocessing.image import ImageDataGenerator

# # Define paths to your dataset
# train_dir = 'E:/DataSet/FDS/Train'
# validation_dir = 'E:/DataSet/FDS/Validation'
# test_dir = 'E:/DataSet/FDS/Test'

# # Parameters
# batch_size = 64  # Increase the batch size
# image_size = (150, 150)

# # Define data generators
# train_datagen = ImageDataGenerator(rescale=1./255)
# validation_datagen = ImageDataGenerator(rescale=1./255)
# test_datagen = ImageDataGenerator(rescale=1./255)

# train_generator = train_datagen.flow_from_directory(
#     train_dir,
#     target_size=image_size,
#     batch_size=batch_size,
#     class_mode='categorical',
#     shuffle=True)  # Shuffle the data

# # Calculate the total number of samples in the training dataset
# total_train_samples = len(train_generator.filenames)

# # Calculate the steps_per_epoch based on the total number of samples and the batch size
# steps_per_epoch = total_train_samples // batch_size

# # If there's any remainder, add 1 to steps_per_epoch to include the remaining samples
# if total_train_samples % batch_size:
#     steps_per_epoch += 1

# # Print the calculated steps_per_epoch
# print("Steps per epoch:", steps_per_epoch)

# validation_generator = validation_datagen.flow_from_directory(
#     validation_dir,
#     target_size=image_size,
#     batch_size=batch_size,
#     class_mode='categorical')

# test_generator = test_datagen.flow_from_directory(
#     test_dir,
#     target_size=image_size,
#     batch_size=batch_size,
#     class_mode='categorical')

# # Determine the number of classes dynamically
# num_classes = len(os.listdir(train_dir))

# # Define the CNN model
# model = Sequential([
#     Conv2D(32, (3, 3), activation='relu', input_shape=(150, 150, 3)),
#     MaxPooling2D((2, 2)),
#     Conv2D(64, (3, 3), activation='relu'),
#     MaxPooling2D((2, 2)),
#     Conv2D(128, (3, 3), activation='relu'),
#     MaxPooling2D((2, 2)),
#     Flatten(),
#     Dense(512, activation='relu'),
#     Dense(num_classes, activation='softmax')
# ])

# # Compile the model
# model.compile(optimizer='adam',
#               loss='categorical_crossentropy',
#               metrics=['accuracy'])

# # Print model summary
# model.summary()

# # Train the model using data generators
# try:
#     history = model.fit(
#         train_generator,
#         steps_per_epoch=steps_per_epoch,
#         epochs=10,
#         validation_data=validation_generator,
#         validation_steps=validation_generator.samples // batch_size
#     )
# except Exception as e:
#     print("Error occurred during training:", e)

# # Evaluate the model on the test data
# try:
#     test_loss, test_accuracy = model.evaluate(test_generator)
#     print('Test loss:', test_loss)
#     print('Test accuracy:', test_accuracy)
# except Exception as e:
#     print("Error occurred during evaluation:", e)

# # Save the model using the native Keras format
# model.save('symbol_detection_model.keras')  # Add the .keras extension

# import os
# from tensorflow.keras.models import Sequential
# from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense
# from tensorflow.keras.preprocessing.image import ImageDataGenerator

# # Define paths to your dataset
# base_dir = 'E:/DataSet/FDS'
# train_dir = os.path.join(base_dir, 'Train')
# validation_dir = os.path.join(base_dir, 'Validation')
# test_dir = os.path.join(base_dir, 'Test')

# # Parameters
# batch_size = 64
# image_size = (150, 150)

# # Define data generators
# train_datagen = ImageDataGenerator(rescale=1./255)
# validation_datagen = ImageDataGenerator(rescale=1./255)
# test_datagen = ImageDataGenerator(rescale=1./255)

# train_generator = train_datagen.flow_from_directory(
#     train_dir,
#     target_size=image_size,
#     batch_size=batch_size,
#     class_mode='categorical',
#     shuffle=True)

# validation_generator = validation_datagen.flow_from_directory(
#     validation_dir,
#     target_size=image_size,
#     batch_size=batch_size,
#     class_mode='categorical')

# test_generator = test_datagen.flow_from_directory(
#     test_dir,
#     target_size=image_size,
#     batch_size=batch_size,
#     class_mode='categorical')

# # Determine the number of classes
# num_classes = len(train_generator.class_indices)

# # Define the CNN model
# model = Sequential([
#     Conv2D(32, (3, 3), activation='relu', input_shape=(150, 150, 3)),
#     MaxPooling2D((2, 2)),
#     Conv2D(64, (3, 3), activation='relu'),
#     MaxPooling2D((2, 2)),
#     Conv2D(128, (3, 3), activation='relu'),
#     MaxPooling2D((2, 2)),
#     Flatten(),
#     Dense(512, activation='relu'),
#     Dense(num_classes, activation='softmax')
# ])

# # Compile the model
# model.compile(optimizer='adam',
#               loss='categorical_crossentropy',
#               metrics=['accuracy'])

# # Print model summary
# model.summary()

# # Train the model
# history = model.fit(
#     train_generator,
#     steps_per_epoch=train_generator.samples // batch_size,
#     epochs=10,
#     validation_data=validation_generator,
#     validation_steps=validation_generator.samples // batch_size
# )

# # Evaluate the model on the test data
# test_loss, test_accuracy = model.evaluate(test_generator)
# print('Test loss:', test_loss)
# print('Test accuracy:', test_accuracy)

# # Save the model
# model.save('symbol_detection_model.h5')

import os
import numpy as np
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense, Dropout
from tensorflow.keras.preprocessing.image import ImageDataGenerator, load_img, img_to_array

# Constants
IMAGE_SIZE = (150, 150)
BATCH_SIZE = 32
NUM_CLASSES = 23
NUM_EPOCHS = 20

# Data paths
train_dir = 'E:/DataSet/FDS/Train'
val_dir = 'E:/DataSet/FDS/Validation'
test_dir = 'E:/DataSet/FDS/Test'

# Data augmentation and preprocessing
train_datagen = ImageDataGenerator(rescale=1./255,
                                   rotation_range=20,
                                   width_shift_range=0.2,
                                   height_shift_range=0.2,
                                   shear_range=0.2,
                                   zoom_range=0.2,
                                   horizontal_flip=True,
                                   fill_mode='nearest')

val_datagen = ImageDataGenerator(rescale=1./255)

train_generator = train_datagen.flow_from_directory(train_dir,
                                                    target_size=IMAGE_SIZE,
                                                    batch_size=BATCH_SIZE,
                                                    class_mode='categorical')

val_generator = val_datagen.flow_from_directory(val_dir,
                                                target_size=IMAGE_SIZE,
                                                batch_size=BATCH_SIZE,
                                                class_mode='categorical')

# Model definition
model = Sequential([
    Conv2D(32, (3, 3), activation='relu', input_shape=(IMAGE_SIZE[0], IMAGE_SIZE[1], 3)),
    MaxPooling2D(2, 2),
    Conv2D(64, (3, 3), activation='relu'),
    MaxPooling2D(2, 2),
    Conv2D(128, (3, 3), activation='relu'),
    MaxPooling2D(2, 2),
    Flatten(),
    Dropout(0.5),
    Dense(512, activation='relu'),
    Dense(NUM_CLASSES, activation='softmax')
])

model.compile(optimizer='adam',
              loss='categorical_crossentropy',
              metrics=['accuracy'])

# Training
history = model.fit(train_generator,
                    steps_per_epoch=train_generator.samples // BATCH_SIZE,
                    epochs=NUM_EPOCHS,
                    validation_data=val_generator,
                    validation_steps=val_generator.samples // BATCH_SIZE)

# Load test images
test_images = []
test_labels = []

# Iterate over each image file in the test directory
for filename in os.listdir(test_dir):
    # Construct the full path to the image
    image_path = os.path.join(test_dir, filename)
    
    # Load the image and resize it to the desired input size
    image = load_img(image_path, target_size=IMAGE_SIZE)
    
    # Convert the image to a numpy array and scale its values
    image_array = img_to_array(image) / 255.0
    
    # Add the image array to the list of test images
    test_images.append(image_array)
    
    # Extract the label from the filename (assuming filename format: "label_imageID.jpg")
    label = filename.split('_')[0]
    test_labels.append(label)

# Convert the lists of images and labels to numpy arrays
test_images = np.array(test_images)
test_labels = np.array(test_labels)

# Convert labels to one-hot encoding
test_labels_one_hot = tf.keras.utils.to_categorical(test_labels, NUM_CLASSES)

# Evaluate the model on the test set
test_loss, test_accuracy = model.evaluate(test_images, test_labels_one_hot)
print("Test Accuracy:", test_accuracy)
