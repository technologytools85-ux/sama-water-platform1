# Security Checklist

- [ ] تم تدوير كل المفاتيح المكشوفة (إذا وُجدت)
- [ ] لا توجد أسرار في الملفات النصية بالمستودع
- [ ] GitHub Secrets مُضافة: AWS_ROLE_TO_ASSUME, VITE_OPENWEATHER_API_KEY, STRIPE_SECRET_KEY, STRIPE_WEBHOOK_SECRET, JWT_SECRET
- [ ] حماية الفرع main مفعّلة وPRs تحتاج موافقات قبل الدمج
- [ ] فحص صور الحاويات (Trivy) مفعّل في CI
