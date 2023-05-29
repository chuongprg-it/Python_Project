from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

# Create your views here.
class Recognition:
    @csrf_exempt
    def index(request):
        if request.method == 'POST':
            fileImage = request.FILES.get('files_image')

            # xử lý nhận dạng tại đây

        else :
            fileImage = False
        data = {'title':'Nhận dạng giá xe','fileImage':fileImage}
        return render(request,'Recognition.html',data)