from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
import h5py
import os
import numpy as np
from PIL import Image

import cv2
from keras.models import load_model

# Create your views here.
class Recognition:
    @csrf_exempt
    def index(request):
        if request.method == 'POST':
            fileImage = request.FILES.get('files_image')
            
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
            # Preprocessing the image
            x = np.array(img)

            # x = np.true_divide(x, 255)
            ## Scaling
            x=x/255
            x = np.expand_dims(x, axis=0)

            preds = model.predict(x)
            preds=np.argmax(preds, axis=1)
            # if preds==0:
            #     preds="The Car IS Audi"
            # elif preds==1:
            #     preds="The Car is Lamborghini"
            # else:
            #     preds="The Car Is Mercedes"
            

            os.remove(temp_path)
            # print(x) # cái này để log giá trị của biến trên terminal
            # prediction = preds
            predicted_label = preds[0]

            

        else:
            fileImage = False
            predicted_label = ''

        data = {'title': 'Nhận dạng giá xe', 'fileImage': fileImage, 'prediction': predicted_label}
        return render(request, 'Recognition.html', data)