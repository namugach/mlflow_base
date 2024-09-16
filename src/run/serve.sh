#!/bin/bash


# 최신 실행 ID를 추출
# RUN_ID=$(ls mlruns/0 | head -n 1 | xargs -n 1 basename)
RUN_ID=$(ls -tr /root/work/train/mlruns/0 | grep -v 'meta.yaml' | grep -v 'datasets' | head -n 1)
echo "Extracted RUN_ID: $RUN_ID"

# 모델 서빙
echo "Serving the model..."
mlflow models serve -m /root/work/train/mlruns/0/$RUN_ID/artifacts/model --host 0.0.0.0 -p 1234