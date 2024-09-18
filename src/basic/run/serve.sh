#!/bin/bash

path=/root/src/basic/res/mlruns/0

# 최신 실행 ID를 추출
RUN_ID=$(ls -tr $path | grep -v 'meta.yaml' | grep -v 'datasets' | head -n 1)
echo "Extracted RUN_ID: $RUN_ID"

# 모델 서빙
echo "Serving the model..."
mlflow models serve -m $path/$RUN_ID/artifacts/model --host 0.0.0.0 -p 1234