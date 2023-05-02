from django.db import models

# Create your models here.
class Brand(models.Model):
    idBrand = models.AutoField(primary_key=True)
    nameBrand = models.CharField(max_length=50)
    nation = models.CharField(max_length=20)
    def __str__(self) -> str:
        return f'Hãng xe : {self.idBrand}'
    class Meta:
        db_table = 'home_brand'

class Car(models.Model):
    idCar = models.AutoField(primary_key=True)
    nameCar = models.CharField(max_length=50)
    idBrand = models.ForeignKey(Brand,on_delete=models.CASCADE)
    image = models.CharField(max_length=2048)
    year = models.CharField(max_length=5)
    price = models.CharField(max_length=20)
    kmsDriven = models.CharField(max_length=12)
    fuelType = models.CharField(max_length=20)
    def __str__(self) -> str:
        return f'Tên dòng xe : {self.nameCar}'
    
class DetailCar(models.Model):
    ID = models.AutoField(primary_key=True)
    idCar = models.ForeignKey(Car,on_delete=models.CASCADE)
    description = models.TextField()
    img = models.TextField()
    location = models.CharField(max_length=30)
    advange = models.TextField()
    phoneContact = models.CharField(max_length=11)
    def __str__(self) -> str:
        return f'Chi tiết sản phẩm xe : {self.idCar}'

class RegisterSell(models.Model):
    ID = models.AutoField(primary_key=True)
    Brand = models.CharField(max_length=50)
    nameCar = models.CharField(max_length=50)
    Year = models.CharField(max_length=10)
    kmsDriven = models.CharField(max_length=10)
    Phone = models.CharField(max_length=12)
    OwnerName = models.CharField(max_length=50)
    Accept = models.BooleanField(default=False)
    def __str__(self) -> str:
        return f'Mã đăng ký bán xe : {self.ID}'
    class Meta:
        db_table = 'home_registersell'