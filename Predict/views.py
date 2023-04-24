from django.shortcuts import render
import pickle
from .PredictForm import PredictForm

# Create your views here.
class Predict:
    def index(request):
        Predict.predictModel(1)
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
                inputModel['name'] = form.cleaned_data['Name']
                inputModel['company'] = form.cleaned_data['Company']
                inputModel['year'] = form.cleaned_data['Year']
                inputModel['price'] = form.cleaned_data['Price']
                inputModel['kms_driven'] = form.cleaned_data['kmsDriven']
                inputModel['fuel_type'] = form.cleaned_data['fuelType']
                Predict.predictModel([inputModel['name'],inputModel['company'],inputModel['year'],inputModel['price'],inputModel['kms_driven'],inputModel['fuel_type']])
        else :
            form = PredictForm()
        data = {'title':'Dự đoán giá xe','predictForm':form}
        return render(request,'Predict.html',data)
    def predictModel(input_data):
        # use Model ML
        # load models from .pkl
        with open('Predict/LinearRegressionModel.pkl','rb') as f:
            model = pickle.load(f)
            # data = model.predict(input_data)
            # print(data)

