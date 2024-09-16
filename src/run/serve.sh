#!/bin/bash

# 디렉토리 이동
cd ~/work/train/sklearn_elasticnet_diabetes

#!bin/bash

# 최신 실행 ID를 추출
RUN_ID=$(ls -td mlruns/0/* | head -n 1 | xargs -n 1 basename)
echo "Extracted RUN_ID: $RUN_ID"

# 모델 서빙
echo "Serving the model..."
mlflow models serve -m /root/work/train/sklearn_elasticnet_diabetes/mlruns/0/$RUN_ID/artifacts/model -p 1234