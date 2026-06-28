#!/usr/bin/env bash
# Create project-docs, add documentation files and push to infra/moel-deploy
set -euo pipefail

TARGET_BRANCH="${1:-infra/moel-deploy}"
DOC_DIR="${2:-project-docs}"

# 1. verify git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: run this script from the repository root."
  exit 1
fi

# 2. ensure git user config
if [ -z "$(git config --get user.name || true)" ] || [ -z "$(git config --get user.email || true)" ]; then
  echo "Please configure git user.name and user.email first:"
  echo "  git config --global user.name \"Your Name\""
  echo "  git config --global user.email \"you@example.com\""
  exit 1
fi

# 3. fetch and checkout/create branch
git fetch origin --quiet
if git show-ref --verify --quiet "refs/heads/${TARGET_BRANCH}"; then
  git checkout "${TARGET_BRANCH}"
  git pull --ff-only origin "${TARGET_BRANCH}" || true
else
  # create branch from origin/main if exists
  if git ls-remote --exit-code --heads origin main >/dev/null 2>&1; then
    git checkout -b "${TARGET_BRANCH}" origin/main
  else
    git checkout -b "${TARGET_BRANCH}"
  fi
fi

# 4. create docs files (idempotent - overwrite)
mkdir -p "${DOC_DIR}/diagrams" "${DOC_DIR}/deployment-scripts" "${DOC_DIR}/design" "${DOC_DIR}/demos"

cat > "${DOC_DIR}/README_PROJECT_DOCS.md" <<'MD'
# Project Documentation - Sama Water Platform

(ملخّص ومحتويات — راجع الملف داخل المجلد لمزيد من التفاصيل)
MD

cat > "${DOC_DIR}/infra-notes.md" <<'MD'
# Infra Notes - placeholder (see project-docs/infra-notes.md for full content)
MD

cat > "${DOC_DIR}/diagrams/architecture.txt" <<'TXT'
Architecture placeholder - see project-docs/diagrams for ASCII/PNG/SVG diagrams.
TXT

cat > "${DOC_DIR}/checklists-security.md" <<'MD'
# Security Checklist
- [ ] rotate secrets
- [ ] add GitHub Secrets
- [ ] enable branch protection
MD

# Copy a reference of the deployment script if exists
if [ -f "./deploy_push_and_pr.sh" ]; then
  cp ./deploy_push_and_pr.sh "${DOC_DIR}/deployment-scripts/deploy_push_and_pr.sh" || true
fi

# Create demos placeholders (todo & weather)
mkdir -p "${DOC_DIR}/demos/todo-demo" "${DOC_DIR}/demos/weather-dashboard"
cat > "${DOC_DIR}/demos/todo-demo/README.md" <<'TXT'
Todo demo placeholder - the full demo lives in /todo-demo (root).
TXT

cat > "${DOC_DIR}/demos/weather-dashboard/README.md" <<'TXT'
Weather demo placeholder - the full demo lives in /weather-dashboard (root).
TXT

# Stage, commit, push
git add "${DOC_DIR}"
if git diff --cached --quiet --exit-code; then
  echo "No doc changes to commit."
else
  git commit -m "docs: add project-docs (reports, diagrams, deployment scripts, checklists)"
  git push -u origin "${TARGET_BRANCH}"
  echo "Pushed ${TARGET_BRANCH} to origin."
fi

# Try to update PR by pushing to the same branch (PR auto-updates)
echo "Done. If a PR exists from ${TARGET_BRANCH} -> main it will be automatically updated."
