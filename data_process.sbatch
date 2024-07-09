#!/bin/bash
#SBATCH -J ET-BERT
#SBATCH -n 4
#SBATCH -o logs/dataprocess-%j
#SBATCH -e logs/dataprocess-%j

source /home/LAB/anaconda3/etc/profile.d/conda.sh
conda activate ET-BERT
d=/home/LAB/changc/etbert

dataset='cstnet-tls1.3/packet'
# dataset='ISCX-VPN_app_dataset'
# dataset='ISCX-VPN_Service_dataset'
# dataset='USTC-TFC_dataset'

ds_name=`echo $dataset | tr / _ `

python data_process/main.py --_category=120 --dataset_dir=$d/datasets/cross_platform/etbert/test \
                            --pcap_path=$d/datasets/cross_platform/etbert/pcap \
                            --dataset_save_path=$d/datasets/cross_platform/etbert/test \
                            --samples=10000 \
                            --dataset_level=flow \
                            --open_dataset_not_pcap=0 \
                            --file2dir=0 \
                            --splitcap_finish=0 \
                            payload length