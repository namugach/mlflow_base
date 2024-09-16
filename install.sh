#!/bin/bash

docker build -t mlflow:0.1 .
docker container run -itd --name mlflow_server -p 5000:5000 -p 1234:1234 mlflow:0.1