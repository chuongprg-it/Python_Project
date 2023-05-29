from django.contrib import admin
from django.urls import path
from Home.views import Home
from Predict.views import Predict,Graph
from BookDriveTest.views import BookDriveTest
from Recognition.views import Recognition

urlpatterns = [
    path('', Home.index),
    path('detailCar/<int:idCar>/', Home.detailCar),
    path('sell/', Home.sellCar),
    path('booking/', BookDriveTest.handleBooking,name='booking'),
    path('predict/', Predict.index),
    path('graph/',Graph.graph),
    path('recognition/',Recognition.index),

    # route response JSON
    path('get_listCar/',Home.getListCarByBrand,name='getListCarByBrand'),
    path('booking/get_listCar/',Home.getListCarByBrand,name='getListCarByBrand'),
    path('search/',Home.searchCar,name='searchCar')
]
