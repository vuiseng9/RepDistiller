#!/usr/bin/env bash

export CUDA_VISIBLE_DEVICES=0
OUTDIR=/data1/vchua/RepDistiller/kd_rn56to20/
mkdir -p $OUTDIR

nohup python train_student.py \
    --path_t ./save/models/resnet56_vanilla/ckpt_epoch_240.pth \
    --distill kd \
    --model_s resnet20 \
    -r 0.1 \
    -a 0.9 \
    -b 0 \
    --kd_T 4 \
    --trial 1 \
    --run_root $OUTDIR 2>&1 | tee $OUTDIR/run.log &