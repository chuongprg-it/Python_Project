from django import forms

class BookingForm(forms.Form):
    FullName = forms.CharField(max_length=50, label='Họ và tên')
    Age = forms.CharField(max_length=3, label='Tuổi')
    Email = forms.EmailField(label='Email')
    Address = forms.CharField(max_length=30, label='Địa chỉ')
    Phone = forms.CharField(max_length=12, label='Số điện thoại')
    DateDrive = forms.DateField(label='Ngày lái thử', widget=forms.widgets.DateInput(attrs={'type': 'date'}))
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs.update({'class': 'form-control form-control-sm'})

