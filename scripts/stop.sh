#!/bin/bash
# Stops the running app. "|| true" keeps this safe if the service is missing.
systemctl stop demo-app 2>/dev/null || true
