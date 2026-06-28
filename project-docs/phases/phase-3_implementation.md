# Phase 3 — Implementation

## Tasks
- Implement backend API endpoints (ingest, health, metrics)
- Implement frontend dashboard components (map, time-series, alerts)
- Containerize backend and frontend (Dockerfiles)
- Create Helm chart for backend (infra/helm/moel-backend)
- Write Terraform modules for VPC, EKS, RDS, IAM

## CI/CD
- Build images and push to GHCR in CI
- Run terraform plan on PRs; apply on approved merges or manual runs
- Deploy to staging via ArgoCD or `helm upgrade --install` from CI

## Testing
- Unit tests for backend and frontend
- Integration tests for APIs (use test DB or ephemeral stack)
- End-to-end smoke tests (infra/scripts/smoke-tests.sh)

## Rollout Plan
- Stage -> Canary -> Production
- Start with limited traffic and monitor key metrics (error rate, latency)
