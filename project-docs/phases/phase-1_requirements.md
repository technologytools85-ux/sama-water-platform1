# Phase 1 — Requirements & Discovery

## Goals
- Define scope and success criteria for MVP.
- Identify stakeholders and user personas.
- Gather non-functional requirements (availability, scalability, latency, retention).

## Scope
- Weather monitoring dashboard (frontend)
- Backend API for sensor ingestion and external weather services
- Persistent storage (Postgres RDS)
- Caching (ElastiCache) and asynchronous processing if needed

## Stakeholders
- Product Owner
- Engineering Team
- DevOps / SRE
- QA

## Acceptance criteria
- End-to-end demo of data ingestion → storage → dashboard with sample data.
- CI pipeline builds the backend and frontend images and runs tests.
- Terraform plan runs successfully without secrets in the repo.

## Deliverables
- Requirements document
- Sample dataset and ingestion script
- Acceptance test checklist
