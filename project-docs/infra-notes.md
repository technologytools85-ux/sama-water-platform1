# Infrastructure Notes (Sama Water Platform)

1) Terraform
- المسار: infra/terraform
- ننصح باستخدام backend S3 + DynamoDB lock.
- قبل apply تأكد من تشغيل terraform init مع backend مُهيّأ.

2) Helm
- Charts: infra/helm/moel-backend
- تأكد من عدم وضع قيم حساسة في values.yaml — استخدم Secrets أو SecretProviderClass.

3) GitHub Actions & OIDC
- تعريف دور IAM (AWS_ROLE_TO_ASSUME) مع trust إلى token.actions.githubusercontent.com
- خزّن ARN الدور في GitHub secret: AWS_ROLE_TO_ASSUME

4) CI/CD
- الخطة: build image → push GHCR → terraform plan → (apply يدوي/عند الدمج) → helm deploy أو ArgoCD sync.

5) Security checklist
- تدوير أي مفاتيح مكشوفة فوراً.
- منع تخزين أي secrets في الملفات النصية.
- تمكين حماية الفرع main ومرور الاختبارات قبل الدمج.
