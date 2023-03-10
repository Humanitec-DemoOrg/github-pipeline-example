from flask import Flask
import os


app = Flask(__name__)


@app.route('/')
def main():
    return dict(os.environ)
