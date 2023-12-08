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
            <style>
              body {{
                background-image: url('https://www.netskope.com/wp-content/uploads/2022/05/1920-Dark-Hero-Background-1920x845-1.jpg');
                font-family: Tahoma, sans-serif;
                font-size: 1.0rem;
                text-align: center;
                color: white;
                outline-color: black;
              }}
            </style>
          </head>
          <body>
            <h1>Netskope Hackathon 2023</h1>
            <h1>This server is running version:</h1>
            <h1>{app_version}</h1>
          </body>
        </html>
        """
    )


if __name__ == "__main__":
    serve(TransLogger(app, setup_console_handler=False))
