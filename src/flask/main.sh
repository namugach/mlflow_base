SCRIPT_DIR=$(dirname "$0")

python $SCRIPT_DIR/train.py
python $SCRIPT_DIR/app.py&

while ! nc -z 127.0.0.1 5000; do   
  sleep 1 # 서버가 실행될 때까지 1초씩 대기
done

curl -X POST -H "Content-Type:application/json" --data '{"sepal_length": 5.9, "sepal_width": 3.0, "petal_length": 5.1, "petal_width": 3.0, "petal_length": 5.1, "petal_width": 1.8}' http://localhost:5000/predict