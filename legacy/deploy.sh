#!/bin/bash
# OLD PROCESS, kept only for Activity 1. Do not run it.
# A developer ran this by hand from a laptop to update production.
SERVER=ec2-user@203.0.113.10

ssh -i ~/prod-key.pem $SERVER "
  cd /opt/demo-app
  git pull origin main
  pip install -r requirements.txt
  pkill -9 gunicorn
  nohup gunicorn --bind 0.0.0.0:8080 app:app &
"

echo "Deployed!"
