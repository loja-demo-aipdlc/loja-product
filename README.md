# loja-product

Artefatos de produto da Loja Demo, um varejo fictício. O gate de cada PR vem do caminho tocado, e não de rótulo:

| Caminho | Gate |
| --- | --- |
| `uow/<id>/uow.yaml`, `uow/<id>/prd.md`, `uow/<id>/*.feature` | G1 (G1 incremental depois do primeiro merge) |
| `uow/<id>/plan.md`, `uow/<id>/adr/*` | G2 |
| `uow/<id>/release-plan.md` | G4 |

O id da UoW segue `uow-loja-<ano>-<sequência>` e aparece no nome do branch (`uow-loja-2026-0201/prd`).

O PR do G1 leva o manifesto `uow/<id>/uow.yaml`, com o tipo, a squad, a dona e a classe proposta. A UoW nasce do
merge desse PR:

```yaml
type: feature
squad: checkout
owner: github:<login da PO>
riskClass: R2
```
