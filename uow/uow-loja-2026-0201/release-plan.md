# Plano de release (G4) · uow-loja-2026-0201

- **Componente:** checkout-api · **ambiente:** production
- **Artefato:** `ghcr.io/loja-demo-aipdlc/loja-checkout-api@sha256:eb8ea22dabb60d7314e387f3eb646d1556d9e8b79f729dc39989001aabd23631`
- **Commit de origem (proveniência):** `51334fdd1a7a557f3aaca1bc09f541246bf7502e`
- **Em produção hoje:** `0058751e87741503acdb9397a0c56a4d24d078df` (bootstrap do repositório (loja-checkout-api#1))
- **Classe do G4:** R1 (a maior do delta; fatia atrás de flag conta como R1)

## Delta de deploy (calculado pelo motor)

| UoW | Classe | Flag |
| --- | --- | --- |
| uow-loja-2026-0201 | R2 | cupom-primeira-compra |
| uow-loja-2026-0203 | R1 | — |
| uow-loja-2026-0204 | R1 | — |

- 00f6e5b320848e42cd1d11559ebd0f4510b75a07 (None) só toca caminhos fora do runtime e não entra no delta (spec 12)
- 8bba5ce2ea653d69f72e2aae3183221f700faabf (None) só toca caminhos fora do runtime e não entra no delta (spec 12)
- d6c35bfa0e3c268bcde9c65185b75581c5854ffe (uow-loja-2026-0202) só toca caminhos fora do runtime e não entra no delta (spec 12)
- uow-loja-2026-0203: fatia R3 pelo caminho fora do artefato; no delta vale R1, a classe do que vai para produção (spec 12)

## Rollout

- `cupom-primeira-compra`: ligada

Aprovar este plano é aprovar o delta inteiro (CORE-36). O deploy só aceita este digest, e as flags só mudam
por este plano (CORE-20). Reverter: o alias production volta para a versão anterior da função.

```yaml
deployments:
- component: checkout-api
  environment: production
  digest: sha256:eb8ea22dabb60d7314e387f3eb646d1556d9e8b79f729dc39989001aabd23631
  delta:
  - uow: uow-loja-2026-0201
    riskClass: R2
    behindFlag: cupom-primeira-compra
  - uow: uow-loja-2026-0203
    riskClass: R1
  - uow: uow-loja-2026-0204
    riskClass: R1
flags:
  cupom-primeira-compra: true
```

