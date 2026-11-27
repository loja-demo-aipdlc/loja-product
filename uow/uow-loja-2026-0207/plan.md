# Plano (G2) · uow-loja-2026-0207 · Checks de artefato e deploy só pela identidade de verificação

UoW `maintenance`, aberta pela triagem g1-t da issue loja-checkout-api#17. Classe R3: a fatia muda
`.github/workflows/`, caminho sensível da Platform. Não muda o artefato.

## O que muda

| Fatia | Repositório | Caminhos | Classe |
| --- | --- | --- | --- |
| Tirar dos workflows os checks publicados pelo GitHub Actions | loja-checkout-api | `.github/workflows/build.yml`, `.github/workflows/deploy.yml` | R3 |

- `build.yml`: sai o job `verificacao`, que publicava `aipdlc-artefato` pelo GitHub Actions. Quem publica é o GitHub
  App `aipdlc-verify`, no fim do build, conferindo a atestação (ROADMAP F0, passo 4).
- `deploy.yml`: sai o passo que publicava `aipdlc-deploy`, e o job `deploy` perde `checks: write`. Quem publica é o
  App, a partir do que lê na AWS. O `liberar` não muda.
- O motor já ignora esses checks quando não vêm do App. Com o mesmo nome, porém, eles confundem a leitura e podem
  travar merge (achado A-16, exceção E-05).

## Riscos e reversão

- Se o App ou o Lambda de verificação estiverem fora do ar, o build e o deploy não ganham check, e o `liberar` do
  próximo deploy recusa (falha fechada).
- Reverter esta UoW: reverter o PR.

## Aprovação

G2 pelo TL (missiodev), que também é a Platform, com justificativa escrita (R3). G3 com duas pessoas além do autor,
uma delas Platform, com justificativa escrita.
