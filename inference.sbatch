#!/bin/bash
#SBATCH -J ET-BERT
#SBATCH -n 4
#SBATCH -o logs/inference-%j
#SBATCH -e %j
#SBATCH --gres=gpu:V100:1

source /home/LAB/anaconda3/etc/profile.d/conda.sh
conda activate ET-BERT
d=/home/LAB/changc/ET-BERT-main
python inference/run_classifier_infer.py --load_model_path $d/models/fine-tuned_model.bin \
                                          --vocab_path $d/models/encryptd_vocab.txt \
                                          --test_path $d/datasets/cstnet-tls1.3/packet/nolabel_test_dataset.tsv \
                                          --prediction_path $d/datasets/cstnet-tls1.3/packet/prediction.tsv \
                                          --labels_num 120 \
                                          --embedding word_pos_seg --encoder transformer --mask fully_visible