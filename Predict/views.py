from django.shortcuts import render
import pickle
import pickletools

# Create your views here.
class Predict:
    def index(request):
        Predict.predictModel(1)
        data = {'title':'Dự đoán giá xe','brand':'','price':'','year':''}
        if request.method == 'POST':
            fields = ['brand', 'price', 'year']
            for field in fields :
                data[field] = request.POST.get(field)
        return render(request,'Predict.html',data)
    def predictModel(input_data):
        # use Model ML
        # load models from .pkl
        with open('LinearRegressionModel.pkl','rb') as f:
            model = pickle.load(f)
            print(model)
            data = f.read()
            pickletools.dis(data)

