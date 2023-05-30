from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
import h5py
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
            
            # xử lý nhận dạng tại đây
            # with h5py.File('C:/Users/Acer/Downloads/Python_Project-main/Python_Project-main/Predict/model.h5', 'r') as model_file:
            model = load_model('D:\Python\pythonProject\Python_Project\Recognition\model.h5')
            # Lấy dữ liệu từ file .h5
            # Ví dụ: weights, labels, ...
            # image_path = 'D:/Python/pythonProject/Python_Project/Recognition/Stanfordatasets/car_data/car_data/test/Acura Integra Type R 2001/00128.jpg'  # Đường dẫn đến hình ảnh cần nhận dạng
            image = Image.open(fileImage)
            image = cv2.imread(fileImage)
            image = cv2.resize(image, (224, 224))  # Thay đổi kích thước hình ảnh nếu cần thiết
            image = np.expand_dims(image, axis=0)  # Mở rộng số chiều của hình ảnh

                # Xử lý ảnh
                # image = Image.open(fileImage)
                # Tiền xử lý ảnh (resize, chuẩn hóa, ...)
                # processed_image = preprocess_image(image)
            
                # Nhận dạng hình ảnh
            prediction = model.predict(image, verbose=0)
            predicted_label = np.argmax(prediction)
                # image = '"C:/Users/Acer/Downloads/StanforDataSets/car_data/car_data/train/smart fortwo Convertible 2012/00222.jpg"'
            context = {
                'image': image,
                'prediction': predicted_label
            }

        else :
            fileImage = False
        data = {'title':'Nhận dạng giá xe','fileImage':fileImage}
        return render(request,'Recognition.html',data)