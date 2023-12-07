import os 

from flask import Flask, jsonify
from waitress import serve
from paste.translogger import TransLogger

app = Flask(__name__)

app_version = os.environ["APP_VERSION"]

@app.route("/", methods=["GET"])
def get_version():
    data = {"message": f"Hey you, this server is running {app_version} as the application version"}
    return jsonify(data)

if __name__ == "__main__":
    serve(TransLogger(app, setup_console_handler=False))