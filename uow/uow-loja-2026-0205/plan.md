# Plano (G2) · uow-loja-2026-0205 · Deploy governado da checkout-api no Lambda

UoW `maintenance`, aberta pela triagem g1-t da issue "Deploy governado no Lambda" no loja-checkout-api.
Classe R3: a fatia muda `.github/workflows/`, caminho sensível da Platform. Não muda o artefato.

## O que muda

| Fatia | Repositório | Caminhos | Classe |
| --- | --- | --- | --- |
| Workflow de deploy | loja-checkout-api | `.github/workflows/deploy.yml` | R3 |

- **liberar:** o motor só libera o digest que está num plano G4 aprovado e mergeado, com a atestação de builder
  confiável conferida de novo e o check `aipdlc-artefato`. Devolve as flags do plano (CORE-20, CORE-36).
- **deploy:** environment `production`, que só aceita a main e é o único que a role da AWS aceita (CORE-35). Ordem:
  1. copia a imagem pelo digest para o ECR;
  2. atualiza a função;
  3. aplica as flags do plano;
  4. publica a versão e confere que ela roda o digest do plano;
  5. aponta o alias `production`, testa e volta sozinho se o teste falhar;
  6. registra o check `aipdlc-deploy`.

## Riscos e reversão

- O deploy só acontece com um G4 aprovado: este PR não implanta nada.
- Reverter o deploy: o alias `production` volta para a versão anterior (automático se o teste falhar).
- Reverter esta UoW: reverter o PR.

## Aprovação

G2 pelo TL (missiodev), que também é a Platform. G3 com duas pessoas além do autor, uma delas Platform, com
justificativa escrita (R3).
