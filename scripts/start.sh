#!/bin/bash
set -euo pipefail

systemctl enable demo-app
systemctl restart demo-app
