# Deploy automatico na VPS (GitHub Actions + SSH)

Este projeto esta preparado com 2 workflows:

- `.github/workflows/deploy-vps-zero-downtime.yml` (recomendado, automatico em push na `main`)
- `.github/workflows/deploy-vps.yml` (manual, substituicao direta)

## 1) Requisitos na VPS (uma vez)

- Nginx (ou Apache) instalado e a servir um diretorio web.
- Um utilizador SSH com permissao de escrita no diretorio de deploy.
- Exemplo de diretorio de deploy: `/var/www/deploylabz-site`.

## 2) Secrets no GitHub

No repositorio: Settings > Secrets and variables > Actions > New repository secret

- `VPS_HOST`: IP ou dominio da VPS
- `VPS_PORT`: normalmente `22`
- `VPS_USER`: utilizador SSH
- `VPS_SSH_KEY`: chave privada SSH (formato OpenSSH, multiline)
- `VPS_TARGET_DIR`: pasta final servida pelo teu web server (ex: `/var/www/deploylabz-site`)

Ordem recomendada: primeiro cria estes secrets, depois faz o primeiro push/deploy.

## 3) Como funciona o deploy (zero downtime)

Quando fizeres push na branch `main`, o workflow recomendado:

1. Faz build de `flutter build web --release`.
2. Envia `build/web` para `/tmp/deploylabz-site-release` na VPS.
3. Cria nova release em `VPS_TARGET_DIR_releases/<timestamp>`.
4. Faz switch atomico do symlink `VPS_TARGET_DIR` para a nova release.
5. Remove releases antigas (mantem as 5 mais recentes).

## 4) Primeiro setup do Nginx (uma vez)

Exemplo de bloco Nginx para Flutter Web (history fallback):

```nginx
server {
  listen 80;
  server_name teu-dominio.com www.teu-dominio.com;

  root /var/www/deploylabz-site;
  index index.html;

  location / {
    try_files $uri $uri/ /index.html;
  }

  location ~* \.(js|css|png|jpg|jpeg|gif|svg|ico|woff2?)$ {
    expires 7d;
    add_header Cache-Control "public, max-age=604800";
  }
}
```

Depois:

```bash
sudo nginx -t && sudo systemctl reload nginx
```

## 5) Deploy manual (quando quiseres)

No GitHub: Actions > Deploy Flutter Web to VPS (Zero Downtime) > Run workflow.

Se quiseres fallback direto (sem releases):

Actions > Deploy Flutter Web to VPS (Direct Replace) > Run workflow.

## 6) Dica de seguranca

Se o utilizador SSH nao tiver permissao no `VPS_TARGET_DIR`, ajusta ownership uma vez:

```bash
sudo chown -R teu_user:teu_user /var/www/deploylabz-site
```

Assim nao precisas de `sudo` dentro do workflow.

## 7) Repositorio GitHub

Os workflows e docs ja estao no codigo local.
Se o repositorio remoto ainda nao existir, cria no GitHub e faz o primeiro push.
