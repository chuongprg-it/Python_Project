from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
import os
from PIL import Image
import numpy as np
import base64
from Predict.views import Graph

from keras.models import load_model

class Recognition:
    @csrf_exempt
    def index(request):
        if request.method == 'POST':
            fileImage = request.FILES.get('files_image')
            image_data = base64.b64encode(fileImage.read()).decode('utf-8')

            project_root = os.path.dirname(os.path.abspath(__file__))
            temp_dir = os.path.join(project_root, 'temp')

            if not os.path.exists(temp_dir):
                os.mkdir(temp_dir)

            temp_path = os.path.join(temp_dir, fileImage.name)
            with open(temp_path, 'wb') as f:
                for chunk in fileImage.chunks():
                    f.write(chunk)  

            model = load_model('Recognition/model_resnet50.h5')
            img = Image.open(temp_path).resize((224, 224))
            x = np.array(img)

            x=x/255
            x = np.expand_dims(x, axis=0)

            preds = model.predict(x)
            preds=np.argmax(preds, axis=1)

            predicted_label = preds[0]
        else:
            fileImage = False
            predicted_label = ''
            temp_path = ''
            image_data = ''

        data = {'title': 'Nhận dạng giá xe', 'fileImage': image_data, 'prediction': predicted_label}
        response = render(request, 'Recognition.html', data)

        if temp_path:
            os.remove(temp_path)
        return response