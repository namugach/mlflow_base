# 디렉토리 이동
cd ~/work/train/sklearn_elasticnet_diabetes


# 최신 실행 ID를 추출
RUN_ID=$(ls -td mlruns/0/* | head -n 1 | xargs -n 1 basename)
echo "Extracted RUN_ID: $RUN_ID"

# 모델 서빙
echo "Serving the model..."
mlflow models serve -m /root/work/train/sklearn_elasticnet_diabetes/mlruns/0/$RUN_ID/artifacts/model -p 1234 &

# 서빙 확인을 위한 curl 요청
echo "Testing model serving with curl..."
sleep 5  # 서버가 준비될 시간을 줌
curl -X POST -H "Content-Type: application/json" -d '{
  "dataframe_split": {
    "columns": ["age", "sex", "bmi", "bp", "s1", "s2", "s3", "s4", "s5", "s6"],
    "data": [[0.038076, 0.050680, 0.061696, 0.021872, -0.044223, -0.034821, -0.043401, -0.002592, 0.019908, -0.017646]]
  }
}' http://127.0.0.1:1234/invocations
