#!/usr/bin/env python

import numpy
import pickle
import sys
import cv2

initial_img = cv2.imread(sys.argv[2],0)
print(initial_img.size)
initial_shape= initial_img.shape

file_mat = open (sys.argv[1],"rb")
initial_mat = pickle.load(file_mat)
file_mat.close()
floor = initial_mat.min()
ceil = initial_mat.max()
non_log = numpy.exp(initial_mat) 
partial = numpy.exp(initial_mat[1])
arg_max = non_log.argmax(0)
identity = numpy.ones(partial.shape)
final = identity - partial
res_mat = cv2.resize(final*255, dsize =(initial_shape[1],initial_shape[0]) , interpolation=cv2.INTER_NEAREST)
cv2.imwrite("./test.png",res_mat)
