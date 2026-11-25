# PRD · Cupom de primeira compra · uow-loja-2026-0201

## Problema
Visitantes novos montam o carrinho e não concluem a primeira compra.

## Proposta
Um cupom de 10% na primeira compra, aplicado no carrinho, que não acumula com outros cupons.

## Critérios de aceite
Em `cupom.feature`.

## Classe proposta
R2: regra de preço no `checkout-api` (`src/checkout/pricing/`). Entra atrás da flag `cupom-primeira-compra`.
