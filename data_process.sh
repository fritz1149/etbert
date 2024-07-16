#!/bin/bash
source /root/miniconda3/bin/activate ET-BERT

d=/root/etbert

dataset='cstnet-tls1.3/packet'
# dataset='ISCX-VPN_app_dataset'
# dataset='ISCX-VPN_Service_dataset'
# dataset='USTC-TFC_dataset'

ds_name=`echo $dataset | tr / _ `
dataset_name=test

python data_process/main.py --_category=253 --dataset_dir=$d/datasets/cross_platform/etbert/$dataset_name \
                            --pcap_path=$d/datasets/cross_platform/${dataset_name}_splitcap \
                            --dataset_save_path=$d/datasets/cross_platform/etbert/$dataset_name \
                            --samples=10000 \
                            --dataset_level=flow \
                            --open_dataset_not_pcap=0 \
                            --file2dir=0 \
                            --splitcap_finish=1 \
                            payload length