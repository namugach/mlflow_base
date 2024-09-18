#!/bin/bash

# 서빙 확인을 위한 curl 요청
echo "Testing model serving with curl..."
curl -X POST -H "Content-Type: application/json" -d '{
  "dataframe_split": {
    "columns": ["age", "sex", "bmi", "bp", "s1", "s2", "s3", "s4", "s5", "s6"],
    "data": [[0.038076, 0.050680, 0.061696, 0.021872, -0.044223, -0.034821, -0.043401, -0.002592, 0.019908, -0.017646]]
  }
}' http://127.0.0.1:1234/invocations
