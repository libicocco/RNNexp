import subprocess as sbp
import os
from os.path import basename, dirname
import copy
import socket as soc
from datetime import datetime
import sys

# Inputs
model = sys.argv[1]
checkpoint = sys.argv[2]
train_for = basename(dirname(checkpoint)).split('_')[1]
#if train_for == 'walking':
#    train_for = 'walkingdog'

supported_model = ['srnn','lstm3lr','erd']
if model not in supported_model:
    print 'Incorrect model, Supported models: ',supported_model
    sys.exit(1)


my_env = os.environ
# Adding CUDA to path
my_env['PATH'] += ':/usr/local/cuda/bin'
my_env['THEANO_FLAGS']='mode=FAST_RUN,device=gpu0,floatX=float32'

params = {}
params['forecast'] = model
params['checkpoint'] = checkpoint
params['train_for'] = train_for

params['motion_prefix'] = 50
params['motion_suffix'] = 100
args = ['python','forecastTrajectories.py']
for k in params.keys():
    args.append('--{0}'.format(k))
    if not isinstance(params[k],list):
        args.append(str(params[k]))
    else:
        for x in params[k]:
            args.append(str(x))
p=sbp.Popen(args)#,shell=False,stderr=sbp.STDOUT)
p.wait()
