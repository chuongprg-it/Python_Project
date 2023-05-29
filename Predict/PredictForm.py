from django import forms
from Home.models import Brand,Car

class PredictForm(forms.Form):
    dbBrand = Brand.objects.values_list('nameBrand','nameBrand')
    dbCar = Car.objects.values_list('nameCar','nameCar')
    Company = forms.ChoiceField(choices= dbBrand,widget=forms.Select(),label='Công ty sản xuất')
    Name = forms.ChoiceField(choices=dbCar,widget=forms.Select(),label='Tên dòng xe')
    ListYear= tuple((i, i) for i in range(2000, 2024, 1))
    Year = forms.ChoiceField(choices=ListYear,widget=forms.Select(),label='Năm sản xuất')
    Price = forms.CharField(max_length=30, label='Giá tại thời điểm mua')
    kmsDriven = forms.CharField(max_length=10, label='Số Kms đã đi được')
    fuelType = forms.ChoiceField(choices=(('Diesel','Diesel'),('Petrol','Petrol')),widget=forms.Select(),label='Loại nhiên liệu sử dụng')
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs.update({'class': 'form-control form-control-sm'})