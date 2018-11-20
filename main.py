import scipy.io as sio
import numpy as np
import pandas as pd
import scipy.stats.skew as skew

data = sio.loadmat('data2017.mat')

# print(data)

data = data['data']

# gx = E(ax); gy = E(ay) and gz = E(az)

activity = 0

m = len(data)
pre_process = np.zeros((m, 7))

# data.shoe.number_of_measure.axis -> recording

print(data['data']['shoe'][0]['x'])
# [0][0][activity][0]

# for i in range(m):
# 	pre_process[i][0] = np.mean(data[i][:][0])
# 	pre_process[i][1] = np.mean(data[i][:][1])
# 	pre_process[i][2] = np.mean(data[i][:][2])

# print(pre_process)


def gravity(ax, ay, az):
	gravity = np.zeros((3))
	gravity[0] = np.mean(ax)
	gravity[1] = np.mean(ay)
	gravity[2] = np.mean(az)
	return gravity

def dimReduction(ax, ay, az):
	return np.sqrt(ax*ax + ay*ay + az*az)

def standardDeviation(r):
	return np.std(r)

def skewness(r):
	return skew(r)

def frequence(data):
	freq = np.zeros(2)
	f_data = np.fft(data)

	energy = 0
	for i in range(len(f_data)):
		energy += f_data[i] * f_data[i]

	tmp_energy = 0
	for i in range(len(f_data)):
		tmp_energy += f_data[i] * f_data[i]
		if (4*tmp_energy >= energy):
			freq[0] = i
		elif (4*tmp_energy >= 3 * energy):
			freq[1] = i
			break
	return freq
