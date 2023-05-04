from django.shortcuts import render,redirect
from django.core.mail import send_mail
from .BookingForm import BookingForm
from .models import Booking
from Home.models import Brand
# Create your views here.
class BookDriveTest:
    def handleBooking(request):
        allBrand = Brand.objects.all()
        if request.method == 'POST':
            form = BookingForm(request.POST)
            if form.is_valid():
                FullName = form.cleaned_data['FullName']
                Age  = form.cleaned_data['Age']
                Email = form.cleaned_data['Email']
                Address = form.cleaned_data['Address']
                Phone = form.cleaned_data['Phone']
                DateDrive = form.cleaned_data['DateDrive']
                brandCar = request.POST.get('select-brand')
                nameCar = request.POST.get('select-car')
                book = Booking(FullName = FullName,Age = Age,Email = Email,Address = Address,Phone = Phone,DateDrive = DateDrive,Brand = brandCar,nameCar = nameCar)
                book.save()
                BookDriveTest.sendMail(FullName, Phone, [Email])
                redirect('Home.index')
        else :
            form = BookingForm()
        data = {'title':'Đặt lịch lái thử','form':form,'listBrand':allBrand}
        return render(request,'BookDriveTest.html',data)
    def sendMail(fullname, phone, recipient_list):
        subject = 'Thông tin đăng ký đặt lịch lái thử'
        message = f'Cảm ơn bạn đã đăng ký đặt lịch lái thử tại cửa hàng!\nThông tin khách hàng :\nHọ tên : {fullname}\t Số điện thoại : {phone}'
        email_from = '20521745@gm.uit.edu.vn'
        # recipient_list = ['20521745@gm.uit.edu.vn',]
        send_mail(subject, message, email_from, recipient_list)

        