#!/bin/bash

docker build -t mlflow:0.1 .
docker run -itd --name mlflow_server mlflow:0.1