import joblib
from flask import Flask, jsonify, request
from torchvision import models, transforms
from PIL import Image
import io
import torch
import json

import torch
import torch.nn as nn
import torch.nn.functional as F


class ResNet9(nn.Module):
    def __init__(self, in_channels, num_classes):
        super().__init__()

        self.conv1 = self.conv_block(in_channels, 64)
        self.conv2 = self.conv_block(64, 128, pool=True)
        self.res1 = nn.Sequential(self.conv_block(
            128, 128), self.conv_block(128, 128))

        self.conv3 = self.conv_block(128, 256, pool=True)
        self.conv4 = self.conv_block(256, 512, pool=True)
        self.res2 = nn.Sequential(self.conv_block(
            512, 512), self.conv_block(512, 512))

        self.classifier = nn.Sequential(nn.MaxPool2d(4),
                                        nn.Flatten(),
                                        nn.Linear(512, num_classes))

    def forward(self, xb):
        out = self.conv1(xb)
        out = self.conv2(out)
        out = self.res1(out) + out
        out = self.conv3(out)
        out = self.conv4(out)
        out = self.res2(out) + out
        out = self.classifier(out)
        return out

    def conv_block(self, in_channels, out_channels, pool=False):
        layers = [nn.Conv2d(in_channels, out_channels, kernel_size=3, padding=1),
                  nn.BatchNorm2d(out_channels),
                  nn.ReLU(inplace=True)]
        if pool:
            layers.append(nn.MaxPool2d(2))
        return nn.Sequential(*layers)


train = ['Apple___Apple_scab',
         'Apple___Black_rot',
         'Apple___Cedar_apple_rust',
         'Apple___healthy',
         'Blueberry___healthy',
         'Cherry_(including_sour)___Powdery_mildew',
         'Cherry_(including_sour)___healthy',
         'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot',
         'Corn_(maize)___Common_rust_',
         'Corn_(maize)___Northern_Leaf_Blight',
         'Corn_(maize)___healthy',
         'Grape___Black_rot',
         'Grape___Esca_(Black_Measles)',
         'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)',
         'Grape___healthy',
         'Orange___Haunglongbing_(Citrus_greening)',
         'Peach___Bacterial_spot',
         'Peach___healthy',
         'Pepper,_bell___Bacterial_spot',
         'Pepper,_bell___healthy',
         'Potato___Early_blight',
         'Potato___Late_blight',
         'Potato___healthy',
         'Raspberry___healthy',
         'Soybean___healthy',
         'Squash___Powdery_mildew',
         'Strawberry___Leaf_scorch',
         'Strawberry___healthy',
         'Tomato___Bacterial_spot',
         'Tomato___Early_blight',
         'Tomato___Late_blight',
         'Tomato___Leaf_Mold',
         'Tomato___Septoria_leaf_spot',
         'Tomato___Spider_mites Two-spotted_spider_mite',
         'Tomato___Target_Spot',
         'Tomato___Tomato_Yellow_Leaf_Curl_Virus',
         'Tomato___Tomato_mosaic_virus',
         'Tomato___healthy']

targets = {0: 'apple',
           1: 'banana',
           2: 'blackgram',
           3: 'chickpea',
           4: 'coconut',
           5: 'coffee',
           6: 'cotton',
           7: 'grapes',
           8: 'jute',
           9: 'kidneybeans',
           10: 'lentil',
           11: 'maize',
           12: 'mango',
           13: 'mothbeans',
           14: 'mungbean',
           15: 'muskmelon',
           16: 'orange',
           17: 'papaya',
           18: 'pigeonpeas',
           19: 'pomegranate',
           20: 'rice',
           21: 'watermelon'}

app = Flask(__name__)

#device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
device = "cpu"


def predict_image(img, model):
    img = img.to(device)
    xb = img.unsqueeze(0)
    yb = model(xb)
    _, preds = torch.max(yb, dim=1)
    return train[preds[0].item()]


diseasemodel = ResNet9(3, 38)
diseasemodel = torch.load(
    './plant-disease-model-complete.pth', map_location=torch.device('cpu'))
diseasemodel.eval()

loaded_model = joblib.load('gradient_boosting_model.pkl')

sensor_dict = {
    "NITROGEN": "50",
    "HUMIDITY": "60",
    "POTASSIUM": "70",
    "PHOSPHORUS": "55"
}


@app.route('/sensor', methods=["GET", "POST"])
def handle():
    global sensor_dict

    if request.method == 'POST':
        try:
            data = request.get_data()
            if data:
                data_dict = json.loads(data.decode('utf-8'))
                nitrogen = data_dict.get('nitrogen')
                potassium = data_dict.get('potassium')
                phosphorus = data_dict.get('phosphorus')
                humidity = data_dict.get('humidity')

                with open("trial.txt", "w") as f:
                    f.write(json.dumps(data_dict) + "\n")

                sensor_dict = {
                    "NITROGEN": str(nitrogen),
                    "PHOSPHORUS": str(phosphorus),
                    "POTASSIUM": str(potassium),
                    "HUMIDITY": str(humidity)
                }

                return "Successfully handled input", 200
            else:
                return "No data received", 400
        except (json.JSONDecodeError, UnicodeDecodeError):
            return "Invalid JSON data", 400
    else:
        return json.dumps(sensor_dict), 200


@app.route("/")
def hello():
    return "Hello World"


@app.route("/croprecommendation", methods=['GET', 'POST'])
def predictCropDisease():
    try:
        final_result = loaded_model.predict([[30, 60, 23, 20, 82, 6.5, 100]])
        final_result = int(final_result[0])
        return jsonify({'message': targets[final_result]}), 200
    except Exception as e:
        return jsonify({'message': str(e)}), 402


@app.route("/plantdisease", methods=['GET', 'POST'])
def predictPlantDisease():
    try:
        file = request.files['image']
        image_data = file.read()
        image = Image.open(io.BytesIO(image_data))
        transform = transforms.Compose([
            transforms.Resize((256, 256)),
            transforms.ToTensor(),
        ])
        transformed_image = transform(image)
        final_result = predict_image(transformed_image, diseasemodel)
        return jsonify({'message': final_result}), 200
    except Exception as e:
        return jsonify({'message': str(e)}), 402


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
