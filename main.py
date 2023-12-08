import textwrap
import os

from flask import Flask, jsonify
from waitress import serve
from paste.translogger import TransLogger

app = Flask(__name__)

app_version = os.environ["APP_VERSION"]


@app.route("/", methods=["GET"])
def get_version():
    return textwrap.dedent(
        f"""\
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=10.0" />
            <title>Hacky App {app_version}</title>
          </head>
          <style>
            body { background-image: url('netskope.jpg'); }
          </style>
          <body>
            <h1>Netskope Hackathon 2023</h1>
            <h1>This server is running version:</h1>
            <div>{app_version}</div>
          </body>
        </html>
    """
    )


if __name__ == "__main__":
    serve(TransLogger(app, setup_console_handler=False))
