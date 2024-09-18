#!/bin/bash

base_path=/root/src/basic
model_path=$base_path/models

# 디렉토리 이동
cd $base_path/res

# 모델 학습 실행
echo "Running model training..."
python $model_path/sklearn_elasticnet_diabetes/linux/train_diabetes.py

python $model_path/sklearn_autolog/pipeline.py

python $model_path/xgboost/xgboost_native/train.py
python $model_path/xgboost/xgboost_sklearn/train.py

# 학습 결과 확인
echo "Training finished. Checking mlruns structure..."
tree mlruns
