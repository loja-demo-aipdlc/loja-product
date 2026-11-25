# language: pt
Funcionalidade: Cupom de primeira compra

  Cenário: Cliente sem pedido anterior recebe 10% de desconto
    Dado um cliente sem pedido anterior
    E um carrinho com subtotal de R$ 100,00
    Quando ele aplica o cupom PRIMEIRA10
    Então o total é R$ 90,00

  Cenário: Cupom não vale para quem já comprou
    Dado um cliente com um pedido anterior
    Quando ele aplica o cupom PRIMEIRA10
    Então o cupom é recusado

  Cenário: Cupom não acumula com outro cupom
    Dado um carrinho com o cupom PRIMEIRA10
    Quando o cliente aplica outro cupom
    Então o segundo cupom é recusado
