#!/bin/bash

docker build -t mlflow:0.1 .
docker container run -itd --name mlflow_server -v $(pwd)/src:/root/src -p 5000:5000 -p 1234:1234 mlflow:0.1