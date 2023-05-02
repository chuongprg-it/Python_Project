from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from .models import Brand,DetailCar,Car,RegisterSell
from .SellForm import SellForm

# Create your views here.
class Home:
    @csrf_exempt
    def index(request):
        allBrand = Brand.objects.all()
        car = Car.objects.all()
        data = {'title' :'Webite bán ô tô','listBrand':allBrand,'newCarUpload':car}
        return render(request,'Home.html',data)
    
    def detailCar(request,**kwargs):
        car = DetailCar.objects.select_related('idCar').filter(idCar = kwargs['idCar']).first()
        data = {'title' :'Webite bán ô tô','car':car,'images':car.img.split(',')}
        return render(request,'DetailCar.html',data)
    
    @csrf_exempt
    def sellCar(request):
        if request.method == 'POST':
            brand = request.POST.get('select-brand')
            form = SellForm(initial={'Brand': brand})
            if form.is_valid():
                form.cleaned_data['Brand'] = brand
        else :
            form = SellForm()
        data = {'title' :'Đăng ký bán xe','form':form}
        return render(request,'Sell.html',data)
    
    @csrf_exempt
    def getListCarByBrand(request):
        idBrand = request.POST.get('idBrand')
        datas = Car.objects.filter(idBrand_id=idBrand)
        response = [{'id': data.idCar, 'nameCar': data.nameCar} for data in datas]
        return JsonResponse(response, safe=False)