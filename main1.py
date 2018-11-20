
import scipy.io as sio
import numpy as np
import pandas as pd


# data = sio.loadmat('data2017.mat')



mat = sio.loadmat('data2017.mat')
# data = mat.shoe
# print(data)
# for key, value in mat.items():
	# print(key, value)

print(len(mat['data']['shoe'][0][0]['x'][0]))
