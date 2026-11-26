# Plano (G2) · uow-loja-2026-0203 · Build com proveniência da checkout-api

UoW `maintenance`, aberta pela triagem g1-t da issue "Empacotar a checkout-api" no loja-checkout-api.
Classe R3: a fatia muda `.github/workflows/`, caminho sensível da Platform.

## O que muda

| Fatia | Repositório | Caminhos | Classe |
| --- | --- | --- | --- |
| Build e app HTTP | loja-checkout-api | `src/checkout/app.py`, `Dockerfile`, `requirements.txt`, `.github/workflows/build.yml`, `tests/test_app.py` | R3 |

- **App HTTP:** FastAPI sobre o carrinho existente. Não toca `src/checkout/pricing/`, que é regra de negócio
  (CORE-09). As flags vêm do ambiente (`CHECKOUT_FLAGS`), e todas ficam desligadas por padrão.
- **Build:** no push para a main, o workflow chama o builder confiável `aipdlc-checks`, que publica a imagem
  no GHCR com a proveniência assinada (CORE-14).
- **Testes:** rodam sobre a imagem publicada, pelo digest, sem escrita no registro (CORE-35).
- **Verificação:** o motor publica o check `aipdlc-artefato` no commit de origem lido da proveniência.

## Riscos e reversão

- Nada vai para produção nesta UoW: o deploy é a etapa 5, pelo G4.
- Reverter é reverter o PR. A imagem publicada fica no GHCR, sem uso.

## Aprovação

G2 pelo TL (missiodev), que também é a Platform. G3 com duas pessoas além do autor, uma delas Platform.
