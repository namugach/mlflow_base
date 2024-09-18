#!/bin/bash
SCRIPT_DIR=$(dirname "$0")
echo $SCRIPT_DIR
docker container rm -f mlflow_server
docker image rm -f $(docker images --filter=reference='mlflow*' -q)

sudo rm -rf $SCRIPT_DIR/src/basic/res