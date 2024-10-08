#!/bin/bash

path=/root/src/basic/run

$path/train.sh
$path/serve.sh &
# 모델 서버가 127.0.0.1:1234에서 열릴 때까지 대기
echo "Waiting for the model server to start..."
while ! nc -z 127.0.0.1 1234; do   
  sleep 1 # 서버가 실행될 때까지 1초씩 대기
done

$path/ui_server.sh &
while ! nc -z 127.0.0.1 5000; do   
  sleep 1 # 서버가 실행될 때까지 1초씩 대기
done

echo "Model server is up, proceeding to post-serve."
$path/post_serve.sh

