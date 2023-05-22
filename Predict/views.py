from django.shortcuts import render
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import pickle
import base64
import io
from .PredictForm import PredictForm

# Create your views here.
class Predict:
    def index(request):
        inputModel = {
            'name' : '',
            'company' : '',
            'year' : '',
            'price' : '',
            'kms_driven' : '',
            'fuel_type' : '',
        }
        if request.method == 'POST':
            form = PredictForm(request.POST)
            if form.is_valid():
                inputModel['company'] = form.cleaned_data['Company']
                inputModel['name'] = form.cleaned_data['Name']
                inputModel['year'] = form.cleaned_data['Year']
                inputModel['price'] = form.cleaned_data['Price']
                inputModel['kms_driven'] = form.cleaned_data['kmsDriven']
                inputModel['fuel_type'] = form.cleaned_data['fuelType']

                predictValue = Predict.predictModel([[inputModel['name'],inputModel['company']
                ,inputModel['year'],inputModel['price'],inputModel['kms_driven'],inputModel['fuel_type']]])
                
        else :
            form = PredictForm()
            predictValue = ''
        data = {'title':'Dự đoán giá xe','predictForm':form, 'inputModel':inputModel ,'predictValue': predictValue}
        return render(request,'Predict.html',data)
    

    @staticmethod
    def predictModel(input_data):
        # use Model ML
        # load models from .pkl
        with open('Predict/LinearRegressionModel.pkl','rb') as f:
            model = pickle.load(f)
            data = model.predict(pd.DataFrame(input_data, columns = ['name','company','year','price','kms_driven','fuel_type']))
            return data[0]
    def graph(request):
        dataset = pd.read_csv('Predict/datasets/CleanedCar.csv')

        # Tạo DataFrame từ dữ liệu
        df = pd.DataFrame(dataset)

        # Tính toán ma trận tương quan
        corr_matrix = np.corrcoef([df['Price'], pd.Categorical(df['fuel_type']).codes, pd.Categorical(df['name']).codes, pd.Categorical(df['kms_driven']).codes, pd.Categorical(df['company']).codes,pd.Categorical(df['year']).codes])

        # Chuyển sang DataFrame để trực quan hóa
        corr_df = pd.DataFrame(corr_matrix, columns=df.columns[[0,1,2,3,4,5]], index=df.columns[[0,1,2,3,4,5]])

        # Hiển thị heatmap
        fig, ax = plt.subplots()
        sns.heatmap(corr_df, annot=True, cmap='coolwarm', ax=ax)
        plt.tight_layout()

        # Chuyển đổi biểu đồ sang dạng base64 để hiển thị trong template HTML
        buffer = io.BytesIO()
        plt.savefig(buffer, format='png')
        buffer.seek(0)
        image_base64 = base64.b64encode(buffer.getvalue()).decode('utf-8')

        # Truyền biểu đồ dưới dạng base64 vào template HTML
        context = {'heatmap': image_base64}
        data = {'title':'Đồ thị dữ liệu','heatmap': image_base64}
        return render(request,'graph.html',data)