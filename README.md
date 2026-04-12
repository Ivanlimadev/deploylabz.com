# deploylabz_site

Site institucional da Deploy Labz em Flutter Web.

## Deploy recomendado

O caminho mais simples para este projeto agora e Vercel.

- Guia: `DEPLOY_VERCEL.md`
- Config: `vercel.json`

## Desenvolvimento local

```bash
flutter pub get
flutter run -d web-server --web-port=5050 --release
```

## Deploy na VPS (automatico)

O projeto inclui pipeline de deploy via GitHub Actions + SSH para VPS:

- Workflow recomendado: `.github/workflows/deploy-vps-zero-downtime.yml`
- Workflow alternativo (manual): `.github/workflows/deploy-vps.yml`
- Guia completo: `DEPLOY_VPS.md`
