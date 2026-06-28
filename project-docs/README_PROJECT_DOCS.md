# Project Documentation - Sama Water Platform

ملخّص المشروع
- اسم المشروع: Sama Water Platform
- هدف المشروع: نظام لإدارة بيانات المراقبة والبيئة المائية، مع واجهة عرض Weather dashboard، وخدمات خلفية قابلة للنشر على EKS.

محتويات هذا المجلد
- /diagrams : مخططات معمارية (SVG / PNG / نصية)
- /design : قرارات التصميم، متطلبات NFR، والاعتبارات الأمنية
- /deployment : سكربتات النشر، ملفات Workflow، ملاحظات Terraform/Helm
- README_DEPLOYMENT.md : تعليمات النشر (موجودة على مستوى المستودع كذلك)
- infra-notes.md : ملاحظات infra و OIDC و TF backend

تعليمات سريعة
- لمعاينة الملفات محليًا: افتح المجلد project-docs في VSCode أو Codespace.
- لتعديل أو تحديث أي مستند: حرّر الملف ثم نفّذ: git add <file> && git commit -m "docs: update ..." && git push
