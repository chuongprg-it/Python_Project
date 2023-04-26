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
        for field_name, field in self.fields.items():
            field.widget.attrs.update({'class': 'form-control form-control-sm'})