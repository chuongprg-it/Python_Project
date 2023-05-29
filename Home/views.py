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
            selectBrand = request.POST.get('select-brand')
            form = SellForm(initial={'Brand': selectBrand})
            if form.is_valid():
                brand = form.cleaned_data['Brand'] 
                nameCar = form.cleaned_data['nameCar'] 
                Year = form.cleaned_data['Year'] 
                kmsDriven = form.cleaned_data['kmsDriven'] 
                Phone = form.cleaned_data['Phone'] 
                OwnerName = form.cleaned_data['OwnerName'] 
                sell = RegisterSell(1, brand, nameCar, Year, kmsDriven, Phone, OwnerName,  0)
                sell.save()
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
    
    @csrf_exempt
    def searchCar(request):
        input_search = request.POST.get('input')
        listCar = Car.objects.filter(nameCar__icontains=input_search)
        response = [{'id': data.idCar, 'nameCar': data.nameCar,'image':data.image,'year':data.year} for data in listCar]
        return JsonResponse(response, safe=False)