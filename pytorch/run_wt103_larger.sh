#!/bin/bash

if [[ $1 == 'train' ]]; then
    echo 'Run training...'
    python train.py \
        --cuda \
        --eval-interval 1000 \
        --data ../data/wikitext-103/ \
        --dataset wt103 \
        --adaptive \
        --n_layer 16 \
        --d_model 510 \
        --n_head 10 \
        --d_head 51 \
        --d_inner 2612 \
        --dropout 0.12 \
        --dropatt 0.02 \
        --optim adam \
        --lr 0.00025 \
        --warmup_step 4000 \
        --max_step 200000 \
        --tgt_len 150 \
        --mem_len 150 \
        --eval_tgt_len 150 \
        --batch_size 60 \
        --multi_gpu \
        --gpu0_bsz 4 \
        ${@:2}
elif [[ $1 == 'eval' ]]; then
    echo 'Run evaluation...'
    python eval.py \
        --cuda \
        --data ../data/wikitext-103/ \
        --dataset wt103 \
        --tgt_len 64 \
        --mem_len 640 \
        --clamp_len 400 \
        --same_length \
        --split test \
        ${@:2}
else
    echo 'unknown argment 1'
fi
