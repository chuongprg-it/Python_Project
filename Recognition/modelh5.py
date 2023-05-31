from PIL import Image
from werkzeug.utils import secure_filename
import numpy as np
from keras.models import load_model
# Model saved with Keras model.save()
# MODEL_PATH ='D:/Python/pythonProject/Python_Project/Recognition/model_resnet50.h5'

# Load your trained model
# model = load_model(MODEL_PATH)
model = load_model('Recognition/model_resnet50.h5')

def model_predict(img_path, model):
        img = Image.load_img(img_path, target_size=(224, 224))

        # Preprocessing the image
        x = Image.img_to_array(img)
        # x = np.true_divide(x, 255)
        ## Scaling
        x=x/255
        x = np.expand_dims(x, axis=0)

        preds = model.predict(x)
        preds=np.argmax(preds, axis=1)
        if preds==0:
            preds="The Car IS Audi"
        elif preds==1:
            preds="The Car is Lamborghini"
        else:
            preds="The Car Is Mercedes"
        return preds