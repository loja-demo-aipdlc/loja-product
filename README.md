# loja-product

Artefatos de produto da Loja Demo, um varejo fictício. O gate de cada PR vem do caminho tocado, e não de rótulo:

| Caminho | Gate |
| --- | --- |
| `uow/<id>/prd.md`, `uow/<id>/*.feature` | G1 (G1 incremental depois do primeiro merge) |
| `uow/<id>/plan.md`, `uow/<id>/adr/*` | G2 |
| `uow/<id>/release-plan.md` | G4 |

O id da UoW segue `uow-loja-<ano>-<sequência>` e aparece no nome do branch (`uow-loja-2026-0201/prd`).
