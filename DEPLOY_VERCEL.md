# Deploy no Vercel

Esta e agora a opcao mais simples para este projeto.

## O que ja esta pronto

- Config do Vercel: `vercel.json`
- Script de build do Flutter Web: `scripts/vercel-build.sh`
- Rewrite para SPA / rotas do Flutter Web

## Passo a passo

1. Faz push do codigo para o GitHub.
2. Abre o Vercel e clica em `Add New...` > `Project`.
3. Importa o repositorio `site-deploylabz.com`.
4. O Vercel deve ler automaticamente o `vercel.json`.
5. Clica em `Deploy`.

## O que o Vercel vai fazer

1. Instalar o Flutter stable no ambiente de build.
2. Executar `flutter pub get`.
3. Executar `flutter build web --release`.
4. Publicar a pasta `build/web`.

## Dominio deploylabz.com

Depois do primeiro deploy:

1. No projeto do Vercel, entra em `Settings` > `Domains`.
2. Adiciona `deploylabz.com`.
3. Adiciona tambem `www.deploylabz.com` se quiseres.
4. O Vercel vai mostrar os DNS records a configurar.

## Vantagem desta opcao

- Nao precisas de SSH, VPS user, chave privada nem pipeline manual de servidor.
- HTTPS e deploy preview ficam muito mais simples.
- Para um site Flutter Web institucional, e suficiente.