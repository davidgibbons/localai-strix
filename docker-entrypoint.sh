#!/usr/bin/env bash
set -euo pipefail

backends_dir="${LOCALAI_BACKENDS_PATH:-${BACKENDS_PATH:-/backends}}"

# Remove bundled backend libs to avoid glibc and ROCm ABI mismatches.
if [ -d "${backends_dir}" ]; then
  removed=0
  for libdir in "${backends_dir}"/*llama*/lib; do
    if [ -d "${libdir}" ]; then
      echo "Removing backend lib dir: ${libdir}"
      rm -rf "${libdir}"
      removed=1
    fi
  done
  if [ "${removed}" -eq 0 ]; then
    echo "No backend lib dirs found under ${backends_dir}"
  fi
fi

exec /usr/local/bin/local-ai "$@"
