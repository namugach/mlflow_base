#!/bin/bash

# 디렉토리 이동
cd /root/work/train

# 모델 학습 실행
echo "Running model training..."
python /root/work/models/sklearn_elasticnet_diabetes/train_diabetes.py

python /root/work/models/sklearn_autolog/utils.py
python /root/work/models/sklearn_autolog/pipeline.py

python /root/work/models/xgboost/xgboost_native/train.py
python /root/work/models/xgboost/xgboost_sklearn/train.py

# 학습 결과 확인
echo "Training finished. Checking mlruns structure..."
tree mlruns
