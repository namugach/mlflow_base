#!/bin/bash

docker container rm -f mlflow_server
docker image rm -f $(docker images --filter=reference='mlflow*' -q)