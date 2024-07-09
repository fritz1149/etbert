#!/bin/bash
#SBATCH -J ET-BERT
#SBATCH -n 4
#SBATCH -o logs/fine-tuning-%j
#SBATCH -e logs/fine-tuning-%j
#SBATCH --gres=gpu:V100:1

source /home/LAB/anaconda3/etc/profile.d/conda.sh
conda activate ET-BERT
d=/home/LAB/changc/etbert

dataset='cstnet-tls1.3/packet'
# dataset='ISCX-VPN_app_dataset'
# dataset='ISCX-VPN_Service_dataset'
# dataset='USTC-TFC_dataset'

ds_name=`echo $dataset | tr / _ `

python fine-tuning.py --pretrained_model_path $d/models/pre-trained_model.bin \
                        --vocab_path $d/models/encryptd_vocab.txt \
                        --train_path $d/datasets/$dataset/train.tsv \
                        --dev_path $d/datasets/$dataset/valid.tsv \
                        --test_path $d/datasets/$dataset/test.tsv \
                        --epochs_num 10 --batch_size 32 --embedding word_pos_seg \
                        --encoder transformer --mask fully_visible \
                        --seq_length 128 --learning_rate 2e-5 \
                        --output_model_path $d/models/fine-tuned_model-$ds_name.bin \
                        --report_steps 100