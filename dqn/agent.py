from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
import numpy as np 
import matplotlib
import matplotlib.pyplot as plt

import random 
import math
import time
import os

class agent():
    
    def __init__(self):
        self.sess = sess
        self.weight_dir = "weight"
    
    def train(self):
        start_step = self.step_op_eval()
        start_time = time.time()

        num_env, self.update_count, ep_reward = 0, 0, 0.
        total_reward, self.total_loss, self.total_q = 0., 0., 0.
        max_avg_reward = 0
        ep_rewards, action = [],[]

        screen, reward, action, terminal = self.env.new_random_env()

        for _ in range(self.history_lenght):
            self.history.add(screen)
    
    def evac(self):

        with tf.Session() as tfx :
            tfx.run()
    

class dqn(object):
    def __init__(parameter_list):
        super(dqn, self).__init__()
        self
        