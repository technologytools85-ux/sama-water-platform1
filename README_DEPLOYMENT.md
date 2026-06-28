# Deployment Instructions (staging, automated)
Overview:
- The infra Terraform defines VPC, EKS module, RDS, ElastiCache, S3, and MSK.
Prerequisites:
- GitHub repo with Actions secrets set:
  - AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
  - STRIPE_SECRET_KEY, STRIPE_WEBHOOK_SECRET
  - JWT_SECRET
