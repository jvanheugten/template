#!/usr/bin/env bash

# Activate conda environment
# shellcheck disable=SC1091
source activate repo

# Run CI checks
./tools/ci_checks.sh
