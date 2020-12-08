#!/usr/bin/env bash
REPO_DIR=$(git rev-parse --show-toplevel)
PYTHONPATH=REPO_DIR:$PYTHONPATH pre-commit run "$1" -a --config "$REPO_DIR"/tools/ci-pre-commit-config.yaml

# Display coverage report
if [ -z "$1" ] || [ "$1" == "pytest" ]
  then
    coverage report
fi
