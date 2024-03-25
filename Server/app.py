from flask import Flask, request, jsonify
import os

app = Flask(__name__)

@app.route('/upload', methods=["POST"])
def upload():
    if request.method == "POST":
        # Check if the 'image' file is present in the request
        if 'image' not in request.files:
            return jsonify({"error": "No image uploaded"}), 400
        
        imagefile = request.files['image']
        # Ensure that the directory 'uploadedimages' exists
        upload_dir = r"C:\Users\User\Documents\GitHub\3DHouse\Server\uploadedimages"
        os.makedirs(upload_dir, exist_ok=True)
        # Save the image to the specified directory
        image_path = os.path.join(upload_dir, imagefile.filename)
        imagefile.save(image_path)
        return jsonify({"message": "Image uploaded successfully", "image_path": image_path}), 200

if __name__ == "__main__":
    app.run(debug=True, port=4000)
