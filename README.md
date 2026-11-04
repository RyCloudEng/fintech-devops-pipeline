# CodePipeline Python Demo

A small Flask app that AWS CodePipeline builds, tests, and deploys from GitHub.

```
GitHub -> Build -> Test -> Deploy to staging -> Manual approval -> Deploy to production
```

| File | Purpose |
| --- | --- |
| `app.py`, `test_app.py` | The app and its tests |
| `buildspec.yml` | CodeBuild steps for the Build stage |
| `buildspec-test.yml` | CodeBuild steps for the Test stage |
| `appspec.yml`, `scripts/` | CodeDeploy steps for each server |
| `infra/setup.yaml` | CloudFormation template for the servers and roles |
| `legacy/deploy.sh` | The old broken process, for analysis only |

## Run it locally

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt -r requirements-dev.txt
pytest
flask --app app run --port 8080
```

Then open http://localhost:8080.
