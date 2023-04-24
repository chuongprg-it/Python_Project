from django.shortcuts import render

# Create your views here.
class Home:
    def index(request):
        data = {'title' :'Webite bán ô tô'}
        return render(request,'Home.html',data)