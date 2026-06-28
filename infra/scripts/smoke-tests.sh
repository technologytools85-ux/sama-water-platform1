#!/usr/bin/env bash
set -euo pipefail
API_BASE=${1:-"https://api.staging.moel.example.com"}
HTTP=$(curl -sS -o /dev/null -w "%{http_code}" "$API_BASE/health")
if [ "$HTTP" != "200" ]; then echo "Backend health check failed: $HTTP"; exit 1; fi
echo "Backend OK"
