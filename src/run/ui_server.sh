#!/bin/bash

echo "start mlflow ui server"

# 디렉토리 이동
cd ~/work/train

mlflow ui --host 0.0.0.0