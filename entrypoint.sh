#!/usr/bin/env bash
set -euo pipefail

ZED_VERSION="${INPUT_ZED_VERSION:-latest}"
export ZED_VERSION

ARGS=""
[[ "${INPUT_FAIL_ON_WARN:-}" == "true" ]] && ARGS+=" --fail-on-warn"

/zed validate $ARGS "$INPUT_VALIDATIONFILE"
