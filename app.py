"""Small Flask app deployed by the pipeline."""
import os
from pathlib import Path

from flask import Flask, jsonify

app = Flask(__name__)
VERSION_FILE = Path(__file__).with_name("version.txt")


def get_version():
    """Return the commit written by the Build stage, or 'dev' when run locally."""
    if VERSION_FILE.exists():
        return VERSION_FILE.read_text().strip()
    return "dev"


@app.get("/")
def home():
    environment = os.environ.get("APP_ENV", "local")
    return f"<h1>Hello from {environment}</h1><p>Version: {get_version()}</p>"


@app.get("/health")
def health():
    return jsonify(status="ok", version=get_version())
