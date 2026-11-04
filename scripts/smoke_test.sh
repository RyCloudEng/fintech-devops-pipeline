#!/bin/bash
# Waits up to 30 seconds for /health. A failure here fails the deployment,
# and CodeDeploy rolls back to the last good version.
for _ in $(seq 1 15); do
  if curl --silent --fail http://localhost:8080/health | grep -q '"status":"ok"'; then
    echo "Smoke test passed"
    exit 0
  fi
  sleep 2
done

echo "Smoke test failed: /health did not return ok"
exit 1
