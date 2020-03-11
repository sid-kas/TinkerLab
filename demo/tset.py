# import tensorflow_hub as hub
import tensorflow as tf
import time, os, sys, logging
import numpy as np
image_shape = 224
base = tf.keras.applications.VGG16(include_top=False, input_shape=(image_shape,image_shape,3),weights='imagenet')
print(base.summary())

import cv2

vid = cv2.VideoCapture(0)

# width = int(vid.get(cv2.CAP_PROP_FRAME_WIDTH))
# height = int(vid.get(cv2.CAP_PROP_FRAME_HEIGHT))
# fps = int(vid.get(cv2.CAP_PROP_FPS))
# codec = cv2.VideoWriter_fourcc('XVID')
# out = cv2.VideoWriter(0, codec, fps, (width, height))

def transform_images(x_train, size):
    x_train = tf.expand_dims(x_train, 0)
    x_train = tf.image.resize(x_train, (size, size))
    x_train = x_train / 255
    return x_train
times = []
while True:
        _, img = vid.read()

        if img is None:
            logging.warning("Empty Frame")
            time.sleep(0.1)
            continue

        
        
        t1 = time.time()
        img_in = cv2.cvtColor(img, cv2.COLOR_BGR2RGB) 
        img_in = transform_images(img_in, image_shape)
        f = base(img_in)
        # print(np.shape(f))
        # break
        # boxes, scores, classes, nums = yolo.predict(img_in)
        t2 = time.time()
        times.append(t2-t1)
        times = times[-20:]

        # img = draw_outputs(img, (boxes, scores, classes, nums), class_names)
        img = cv2.putText(img, "Time: {:.2f}ms".format(sum(times)/len(times)*1000), (0, 30),
                          cv2.FONT_HERSHEY_COMPLEX_SMALL, 1, (0, 0, 255), 2)
        if False:
            out.write(img_in)
        cv2.imshow('output', img)
        if cv2.waitKey(1) == ord('q'):
            break