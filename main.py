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
          <h1 style="text-align:center;">This server is running version:</h1>
          <div style="text-align:center; color:red;font-size:3.0rem;">{app_version}</div>
        </html>
    """
    )


if __name__ == "__main__":
    serve(TransLogger(app, setup_console_handler=False))
