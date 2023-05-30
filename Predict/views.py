from django.shortcuts import render
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import pickle
import base64
import io
import locale
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
                predictValue = Predict.convert_inr_to_usd(predictValue,0.012) 
                locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')
                predictValue = locale.currency(predictValue, grouping=True)
        else :
            form = PredictForm()
            predictValue = ''
        data = {'title':'Dự đoán giá xe','predictForm':form, 'inputModel':inputModel ,'predictValue': predictValue}
        return render(request,'Predict.html',data)
    

    @staticmethod
    def predictModel(input_data):
        # use Model ML
        # load models from .pkl
        with open('Predict/DecisionTreeModel.pkl','rb') as f:
            model = pickle.load(f)
            data = model.predict(pd.DataFrame(input_data, columns = ['name','company','year','price','kms_driven','fuel_type']))
            return data[0]
    @staticmethod
    def convert_inr_to_usd(amount_inr,exchange_rate):
        # exchange_rate: Tỷ giá hối đoái từ INR sang USD 
        return amount_inr * exchange_rate
        
# data visualization
class Graph:
    def graph(request):
        dataset = pd.read_csv('Predict/datasets/CleanedCar.csv')
        
        # Tạo DataFrame từ dữ liệu
        df = pd.DataFrame(dataset)

        corr_matrix = Graph.corr_matrix(df)
        #Bar Chart
        total_car_each_year = Graph.total_car_each_year(dataset)
        count_car_each_brand = Graph.count_car_each_brand(dataset)
        count_car_by_fuel = Graph.count_car_by_fuel(dataset)
        barChart = {
            'total_car_each_year': total_car_each_year,
            'count_car_each_brand': count_car_each_brand,
            'count_car_by_fuel': count_car_by_fuel
        }
        # Line Chart
        price_each_year = Graph.price_each_year(dataset)
        # Histogram
        car_price_distribution = Graph.car_price_distribution(dataset)
        kms_distribution = Graph.kms_distribution(dataset)
        kms_distribution_by_boxplot = Graph.kms_distribution_by_boxplot(dataset)
        scatter_plot = Graph.scatter_plot(dataset)
        data_render = {
            'title':'Trực quan hóa dữ liệu', 
            'corr_matrix': corr_matrix,
            'barChart': barChart,
            'price_each_year':price_each_year,
            'car_price_distribution':car_price_distribution,
            'kms_distribution':kms_distribution,
            'kms_distribution_by_boxplot':kms_distribution_by_boxplot,
            'scatter_plot':scatter_plot
        }
        return render(request,'graph.html',data_render)
    
    @staticmethod
    def convert_to_base64(fig):
        buffer = io.BytesIO()
        fig.savefig(buffer, format='png')
        plt.close(fig)
        buffer.seek(0)
        image_base64 = base64.b64encode(buffer.getvalue()).decode('utf-8')
        return image_base64

    @staticmethod
    def corr_matrix(dataframe):
        # Tính toán ma trận tương quan
        corr_matrix = np.corrcoef([
            dataframe['Price'],
            pd.Categorical(dataframe['fuel_type']).codes,
            pd.Categorical(dataframe['name']).codes,
            pd.Categorical(dataframe['kms_driven']).codes,
            pd.Categorical(dataframe['company']).codes,
            pd.Categorical(dataframe['year']).codes
        ])

        # Chuyển sang DataFrame để trực quan hóa
        corr_df = pd.DataFrame(
            corr_matrix,
            columns=dataframe.columns[[0, 1, 2, 3, 4, 5]],
            index=dataframe.columns[[0, 1, 2, 3, 4, 5]]
        )

        # Hiển thị heatmap
        fig, ax = plt.subplots()
        sns.heatmap(corr_df, annot=True, cmap='coolwarm', ax=ax)
        plt.tight_layout()

        image_base64_matrix = Graph.convert_to_base64(fig)
        return image_base64_matrix
    @staticmethod
    def total_car_each_year(dataset):
        # Tạo một DataFrame mới với số lượng xe theo từng năm
        car_counts = dataset['year'].value_counts().sort_index()

        # Vẽ biểu đồ
        plt.bar(car_counts.index, car_counts.values)

        # Đặt tiêu đề và các nhãn cho trục x và y
        plt.title('Tổng số xe của từng năm')
        plt.xlabel('Năm')
        plt.ylabel('Số lượng xe')
    
        # Chuyển đổi biểu đồ sang dạng base64 để hiển thị trong template HTML
        image_base64 = Graph.convert_to_base64(plt.gcf())
        return image_base64
    @staticmethod
    def count_car_each_brand(dataset):
        # Tạo một DataFrame mới với số lượng xe theo từng hãng
        car_counts_by_company = dataset['company'].value_counts()

        # Vẽ biểu đồ cột
        plt.figure(figsize=(25, 6)) 
        plt.bar(car_counts_by_company.index, car_counts_by_company.values)

        # Đặt tiêu đề và các nhãn cho trục x và y
        plt.title('Số lượng xe của từng hãng')
        plt.xlabel('Hãng xe')
        plt.ylabel('Số lượng xe')
        # Chuyển đổi biểu đồ sang dạng base64 để hiển thị trong template HTML
        image_base64 = Graph.convert_to_base64(plt.gcf())
        return image_base64
    @staticmethod
    def count_car_by_fuel(dataset):
        car_counts_by_fuel_type = dataset['fuel_type'].value_counts()

        # Tạo một danh sách màu sắc cho các cột
        colors = ['green', 'orange', 'purple'] 

        # Vẽ biểu đồ cột
        plt.bar(car_counts_by_fuel_type.index, car_counts_by_fuel_type.values, color=colors)

        # Đặt tiêu đề và các nhãn cho trục x và y
        plt.title('Số lượng xe theo loại nhiên liệu')
        plt.xlabel('Loại nhiên liệu')
        plt.ylabel('Số lượng xe')

        # Chuyển đổi biểu đồ sang dạng base64 để hiển thị trong template HTML
        image_base64 = Graph.convert_to_base64(plt.gcf())
        return image_base64
    
    @staticmethod
    def price_each_year(dataset):
        df_price_year = dataset[['Price', 'year']]

        # Tính giá trung bình của các xe theo từng năm
        average_price_by_year = df_price_year.groupby('year').mean()

        # Vẽ biểu đồ đường
        plt.plot(average_price_by_year.index, average_price_by_year['Price'])

        # Đặt tiêu đề và các nhãn cho trục x và y
        plt.title('Xu hướng thay đổi giá xe theo từng năm')
        plt.xlabel('Năm')
        plt.ylabel('Giá xe (USD)')
        # Chuyển đổi biểu đồ sang dạng base64 để hiển thị trong template HTML
        image_base64 = Graph.convert_to_base64(plt.gcf())
        return image_base64
    @staticmethod
    def car_price_distribution(dataset):
        plt.hist(dataset['Price'], bins=20, edgecolor='black')

        # Đặt tiêu đề và các nhãn cho trục x và y
        plt.title('Phân phối giá xe')
        plt.xlabel('Giá xe')
        plt.ylabel('Số lượng xe')
        # Chuyển đổi biểu đồ sang dạng base64 để hiển thị trong template HTML
        image_base64 = Graph.convert_to_base64(plt.gcf())
        return image_base64
    @staticmethod 
    def kms_distribution(dataset):
        plt.hist(dataset['kms_driven'], bins=20, edgecolor='black')

        # Đặt tiêu đề và các nhãn cho trục x và y
        plt.title('Phân phối số km đã đi')
        plt.xlabel('Số km đã đi')
        plt.ylabel('Số lượng xe')
        # Chuyển đổi biểu đồ sang dạng base64 để hiển thị trong template HTML
        image_base64 = Graph.convert_to_base64(plt.gcf())
        return image_base64
    @staticmethod
    def kms_distribution_by_boxplot(dataset):
        sns.boxplot(x=dataset['Price'], color='red')

        # Đặt tiêu đề và nhãn cho trục x
        plt.title('Phân phối giá xe')
        plt.xlabel('Giá xe')
        # Chuyển đổi biểu đồ sang dạng base64 để hiển thị trong template HTML
        image_base64 = Graph.convert_to_base64(plt.gcf())
        return image_base64
    def scatter_plot(dataset):
        df_scatter = dataset[['Price', 'kms_driven', 'fuel_type']].copy()

        # Tạo dictionary để ánh xạ các loại nhiên liệu thành màu sắc
        fuel_colors = {'Petrol': 'red', 'Diesel': 'blue', 'LPG': 'green'}

        # Vẽ biểu đồ scatter với màu sắc và kích thước điểm biểu thị thông tin
        plt.scatter(df_scatter['kms_driven'], df_scatter['Price'], c=df_scatter['fuel_type'].map(fuel_colors), s=50)

        # Đặt tiêu đề và nhãn cho trục x và y
        plt.title('Mối quan hệ giữa giá xe và số km đã đi')
        plt.xlabel('Số km đã đi')
        plt.ylabel('Giá xe')

        # Tạo legend cho màu sắc
        for fuel, color in fuel_colors.items():
            plt.scatter([], [], c=color, label=fuel)

        # Hiển thị legend
        plt.legend()

        # Chuyển đổi biểu đồ sang dạng base64 để hiển thị trong template HTML
        image_base64 = Graph.convert_to_base64(plt.gcf())
        return image_base64