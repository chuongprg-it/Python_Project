from django.db import models

# Create your models here.
class Booking(models.Model):
    ID = models.AutoField(primary_key=True)
    FullName = models.CharField(max_length=50)
    Age = models.IntegerField()
    Email = models.EmailField()
    Address = models.TextField()
    Phone = models.CharField(max_length=12)
    DateDrive = models.DateField()
    def __str__(self) -> str:
        return f'Fullname : {self.FullName}'