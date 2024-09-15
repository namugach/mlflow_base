#!/bin/bash

# 디렉토리 이동
cd ~/work/train/sklearn_elasticnet_diabetes

# 모델 학습 실행
echo "Running model training..."
python train_diabetes.py

# 학습 결과 확인
echo "Training finished. Checking mlruns structure..."
tree mlruns
