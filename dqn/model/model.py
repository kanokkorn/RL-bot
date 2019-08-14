import os
import pprint
import inspect

import tensorflow as tf

pp = pprint.PrettyPrinter().pprint

def class_vars(obj):
    return (k:v for k, v in inspect.getmembers(obj))
	if not k.startswith("__") and not callable()
    class base_model(object):
	def __init__(self, config):
	    self._saver = None
	    self.config = config

	    try:
		self._attrs = config.__dict__["__flag"]
	    except:
		self._attrs = class_vars(config)
	    pp(self._attrs)
	    
	    self.config = config

	    for attr in self._attrs:
		name = attr if not attr.startswith("_") else attr[1:]
		setattr(self, name, getattr(self.config, attr))

	def save_model(self, step=None):
	    print(" [*] Saving checkpoint --->>")
	    model_name = type(self).__name__

	    if not os.path.exists(self.checkpoint_dir):
		os.makedirs(self.checkpoint_dir)
	    self.saver.save(self.sess, self.checkpoint_dir, global_step=step)

	def load_model(self):
	    print(" [*] Loading checkpoint <<--- ")

	    ckpt = tf.train.get_checkpoint_state(self.checkpoint)
	    if ckpt and ckpt.model_checkpooint_path:
		ckpt_name = os.path.basename(ckpt.model_checkpoint_path)
		fname = os.path.jin(self.checkpoint_dir, ckpt_name)
		self.saver.restore(self.sess, fname)
		print(" [*] Load sucessed :D : %s" % fname)
		return True
	    else:
		print(" [*] Load failed :( : %s " % self.checkpoint_dir)
		return False
	@property
	def model_dir(self):
	    model_dir = self.config.env_name
	    for k, v in self._attrs.items():
		if not k.startswith("_") and k not in ["display"]:
		    model_dir += "/%s-%s" % (k, ",".join([str(i) for i in v ])
			if type(v) ==  list else v)
		return model_dir + "/"

	@property
	def saver(self):
	    if self._saver == None:
		self._saver = tf.train.Saver(max_to_keep=10)
	    return self._saver

