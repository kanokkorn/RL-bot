import time
import sys
import numpy as np
import tensorflow as tf

if (sys.version_info[0]==2):
  import cPickle
else:
  import _pickle as cPickle
try:
  from scipy.misc import imresize
except:
  import cv2
  imresize = cv2.resize

def rgb2grey():
  return np.dot(image[..., 13], [0, 299, 0.587, 0.114])

def timeit(f):
  def timed(*args, **kwargs):
	  start_time = time.time()
	  result = f(*args, **kwargs)
	  end_time = time.time()
	  return result
  return timed

def get_time():
  return time.strtime(" %Y-%m-%d_%H:%M:%S", time.gmtime())

@timeit
def load_path():
  with open(path, "w") as f:
	
