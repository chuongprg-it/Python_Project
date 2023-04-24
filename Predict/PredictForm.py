from django import forms

class PredictForm(forms.Form):
    Name = forms.CharField(max_length=50, label='Tên dòng xe')
    Company = forms.CharField(max_length=50, label='Công ty sản xuất')
    Year = forms.CharField(label='Năm sản xuất')
    Price = forms.CharField(max_length=30, label='Giá tại thời điểm mua')
    kmsDriven = forms.CharField(max_length=10, label='Số Kms đã đi được')
    fuelType = forms.CharField(max_length=10, label='Loại nhiên liệu sử dụng của xe')
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['Name'].widget.attrs.update({'class': 'Name'})
        self.fields['Company'].widget.attrs.update({'class': 'Company'})
        self.fields['Year'].widget.attrs.update({'class': 'Year'})
        self.fields['Price'].widget.attrs.update({'class': 'Price'})
        self.fields['kmsDriven'].widget.attrs.update({'class': 'kmsDriven'})
        self.fields['fuelType'].widget.attrs.update({'class': 'fuelType'})