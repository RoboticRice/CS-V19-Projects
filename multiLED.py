import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
#STOP LIGHT
GPIO.setup(11,GPIO.OUT)#Green
GPIO.setup(10,GPIO.OUT)#Yellow
GPIO.setup(9,GPIO.OUT) #Red
#Breadboard
GPIO.setup(17,GPIO.OUT)#Green
GPIO.setup(27,GPIO.OUT)#Yellow
GPIO.setup(22,GPIO.OUT)#Red
#MultiColor
GPIO.setup(24,GPIO.OUT)#Green
GPIO.setup(23,GPIO.OUT)#Blue
GPIO.setup(25,GPIO.OUT)#Red
print ("Blue")
GPIO.output(10,GPIO.HIGH)
GPIO.output(27,GPIO.HIGH)
GPIO.output(23,GPIO.HIGH)
time.sleep(2)
print ("Blue+Green      (Light Blue)")
GPIO.output(11,GPIO.HIGH)
GPIO.output(17,GPIO.HIGH)
GPIO.output(24,GPIO.HIGH)
time.sleep(2)
print ("Blue+Green+Red  (White)")
GPIO.output(9,GPIO.HIGH)
GPIO.output(22,GPIO.HIGH)
GPIO.output(25,GPIO.HIGH)
time.sleep(2)
print ("Green+Red       (Lime Green/Yellow)")
GPIO.output(10,GPIO.LOW)
GPIO.output(27,GPIO.LOW)
GPIO.output(23,GPIO.LOW)
time.sleep(2)
print ("Red")
GPIO.output(11,GPIO.LOW)
GPIO.output(17,GPIO.LOW)
GPIO.output(24,GPIO.LOW)
time.sleep(2)
print ("Blue+Red        (Purple)")
GPIO.output(10,GPIO.HIGH)
GPIO.output(27,GPIO.HIGH)
GPIO.output(23,GPIO.HIGH)
time.sleep(2)
print ("Green")
GPIO.output(11,GPIO.HIGH)
GPIO.output(17,GPIO.HIGH)
GPIO.output(24,GPIO.HIGH)
GPIO.output(10,GPIO.LOW)
GPIO.output(27,GPIO.LOW)
GPIO.output(23,GPIO.LOW)
GPIO.output(9,GPIO.LOW)
GPIO.output(22,GPIO.LOW)
GPIO.output(25,GPIO.LOW)
time.sleep(2)
print ("OFF")
GPIO.output(11,GPIO.LOW)
GPIO.output(17,GPIO.LOW)
GPIO.output(24,GPIO.LOW)
