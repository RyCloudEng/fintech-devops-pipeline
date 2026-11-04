#!/bin/bash
# Installs dependencies and the systemd service.
# CodeDeploy provides DEPLOYMENT_GROUP_NAME (staging or production).
set -euo pipefail

APP_DIR=/opt/demo-app

python3.11 -m venv "$APP_DIR/venv"
"$APP_DIR/venv/bin/pip" install --quiet -r "$APP_DIR/requirements.txt"

cp "$APP_DIR/scripts/demo-app.service" /etc/systemd/system/demo-app.service
echo "APP_ENV=$DEPLOYMENT_GROUP_NAME" > /etc/demo-app.env
systemctl daemon-reload
