# Plano técnico · uow-loja-2026-0201

| Fatia | Componente | Classe | Forma no branch principal |
| --- | --- | --- | --- |
| 1 | checkout-api | R2 | Regra do cupom em `src/checkout/pricing/discount.py`, atrás da flag `cupom-primeira-compra`, desligada |

- A flag fica desligada em produção e só liga pelo plano de release (G4).
- Testes unitários cobrem os três critérios de `cupom.feature` com a flag ligada, e o comportamento atual com ela
  desligada.
- Sem mudança de esquema nem de dados: reversível desligando a flag.
