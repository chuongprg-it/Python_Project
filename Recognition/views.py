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

            model = load_model('Recognition/model.h5')
            image = cv2.imread(temp_path) # ảnh được lưu vào trong temp_path và dòng này để lấy ảnh thử temp_path ra
            # lỗi mảng truyền vào từ dòng này
            image = cv2.resize(image, (320, 256))  
            image = np.transpose(image, (0, 1, 2))  

            os.remove(temp_path)
            print(image) # cái này để log giá trị của biến trên terminal
            prediction = model.predict(image)
            predicted_label = np.argmax(prediction)


        else:
            fileImage = False
            predicted_label = ''

        data = {'title': 'Nhận dạng giá xe', 'fileImage': fileImage, 'prediction': predicted_label}
        return render(request, 'Recognition.html', data)
