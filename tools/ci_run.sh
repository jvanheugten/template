#!/usr/bin/env bash

# Activate conda environment
source activate repo

# Run CI checks
./tools/ci_checks.sh
