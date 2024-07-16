#!/bin/bash
source /root/miniconda3/bin/activate ET-BERT

d=/root/etbert

dir1='cross_platform'
dir2='android_split'

python data_process.py --file_path=$d/datasets/$dir1/$dir2 --samples=10000