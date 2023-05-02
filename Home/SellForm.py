from django import forms
from Home.models import Brand

class SellForm(forms.Form):
    dbBrand = Brand.objects.values_list('idBrand','nameBrand')
    Brand = forms.ChoiceField(choices= dbBrand,widget=forms.Select(),label='Thương hiệu')
    nameCar = forms.CharField(label='Tên ô tô')
    ListYear= tuple((i, i) for i in range(2000, 2024, 1))
    Year = forms.ChoiceField(choices=ListYear,widget=forms.Select(),label='Năm sản xuất')
    kmsDriven = forms.CharField(max_length=30, label='Số km đi được')
    Phone = forms.CharField(max_length=12, label='Số điện thoại')
    OwnerName = forms.CharField(max_length=50, label='Tên chủ sở hữu xe')
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs.update({'class': 'form-control form-control-sm'})