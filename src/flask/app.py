import pickle
from flask import Flask, jsonify, request
import numpy as np
import json

app = Flask(__name__)

@app.route("/")
def hello_workd():
  return "<p>Hello?</p>"

@app.route("/fastcampus")
def hello_fastcampus():
  return "<p>Hello, Fast Campus!</p>"

model = pickle.load(open("./model.pkl", "rb"))



@app.route("/predict", methods=["POST", "PUT"])
def inference():
  request.get_json(force=True)
  return json.dumps({'hello': 'world'}), 200 

if __name__ == "__main__":
  app.run(debug=True, host="0.0.0.0", port=5000)