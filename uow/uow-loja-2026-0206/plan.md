# Plano (G2) · uow-loja-2026-0206 · Check aipdlc pelo GitHub App aipdlc-verify

UoW `maintenance`, aberta pela triagem g1-t da issue loja-checkout-api#15.
Classe R3: a fatia muda `.github/workflows/`, caminho sensível da Platform. Não muda o artefato.

## O que muda

| Fatia | Repositório | Caminhos | Classe |
| --- | --- | --- | --- |
| Remover o workflow do check antigo | loja-checkout-api | `.github/workflows/aipdlc.yml` (removido) | R3 |

- O check obrigatório `aipdlc` passa a vir do GitHub App `aipdlc-verify`. A chave do App só é lida pelo Lambda de
  verificação, implantado pelo `verify-deploy.yml` do `aipdlc-checks` (CORE-02, CORE-33).
- Antes do merge, o ruleset `protecao-main` passa a exigir o `aipdlc` do `integration_id` do App, e não mais do
  GitHub Actions. Sem isso, qualquer workflow do repositório conseguiria publicar o check.
- O `build.yml` e o `deploy.yml` não mudam.

## Riscos e reversão

- Se o Lambda de verificação cair, o check não sai e os PRs ficam bloqueados (falha fechada). Para voltar atrás,
  o ruleset volta a exigir o check do GitHub Actions e este PR é revertido.
- Reverter esta UoW: reverter o PR e o ruleset.

## Aprovação

G2 pelo TL (missiodev), que também é a Platform. G3 com duas pessoas além do autor, uma delas Platform, com
justificativa escrita (R3).
