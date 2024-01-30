from flask import Flask
from flask import jsonify
from flask import request

app = Flask(__name__)

def math(obj):
    obj = obj ** 2
    return obj

@app.route('/')
def hello_world():
    return "hello world!"

@app.route('/math', methods=['GET'])
def retrieve_name():
    args = request.args
    input = int(args['integer'])
    item = math(input)
    return jsonify(item)


if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0', port=5000)


