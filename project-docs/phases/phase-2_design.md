# Phase 2 — Design & Architecture

## High Level Architecture
- Clients (web/mobile) → CDN/Ingress → Frontend → Backend API → Database & Cache
- Optional stream pipeline for real-time processing (Kafka/MSK)

## Components
- Frontend: React/Vite (weather dashboard)
- Backend: Node.js (Express/Nest) REST API
- Database: Postgres (RDS)
- Cache: Redis (ElastiCache)
- Container runtime: EKS (Fargate/managed nodegroups)
- CI/CD: GitHub Actions + GHCR + ArgoCD for delivery

## Data Flows
- Sensor data / external weather API → Backend ingestion endpoint → writes to Postgres and publishes to events topic → consumer updates analytics / caches

## Security Considerations
- Use OIDC for GitHub Actions to assume AWS role
- Store secrets in GitHub Secrets or AWS Secrets Manager
- Enforce least privilege for IAM roles

## Operational Considerations
- Logging: CloudWatch / Fluentd or vector + ELK/Opensearch
- Monitoring: Prometheus + Grafana
- Backups: Automated RDS snapshots, S3 lifecycle for artifacts
