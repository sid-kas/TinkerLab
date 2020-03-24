import tensorflow_hub as hub
import tensorflow as tf

base = tf.keras.applications.MobileNet(include_top=False, input_shape=(224,224,3),weights='imagenet')

tf.keras.applications.

print(base.summary())
