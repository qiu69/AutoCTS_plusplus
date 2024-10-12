#!/bin/bash

export PYTHONPATH=../
export CUDA_VISIBLE_DEVICES=6
seq_len=48
sample_num=20
exp_id=1
epochs=5
in_dim=1
datatype="subset"
base="pems/PEMS07"
dataset=("5" "13" "35" "21" "28" "42")
mode="noisy_seeds"
train_script="../exps/generate_seeds.py"
for set in "${dataset[@]}"; do
    python  $train_script --dataset "${base}_${set}" \
                          --datatype $datatype \
                          --in_dim $in_dim \
                          --seq_len $seq_len \
                          --mode $mode \
                          --epochs $epochs \
                          --exp_id $exp_id \
                          --sample_num $sample_num
done