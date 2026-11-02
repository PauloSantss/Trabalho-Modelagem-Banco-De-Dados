# Modelo Lógico — GCaccessories

## 1. Legenda

- **PK (Primary Key):** chave primária, identifica cada registro.
- **FK (Foreign Key):** chave estrangeira, estabelece relacionamento entre tabelas.
- **NN (NOT NULL):** campo de preenchimento obrigatório.
- **NULL:** campo que pode ficar sem preenchimento.

## 2. Estrutura das tabelas

### 2.1 CLIENTE

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_cliente | INT | PK |
| nome | VARCHAR(150) | NN |
| telefone | VARCHAR(20) | NULL |

### 2.2 FUNCIONARIO

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_funcionario | INT | PK |
| nome | VARCHAR(150) | NN |
| cpf | VARCHAR(14) | NULL |
| telefone | VARCHAR(20) | NULL |
| cargo | VARCHAR(80) | NULL |

### 2.3 FORNECEDOR

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_fornecedor | INT | PK |
| nome | VARCHAR(150) | NN |
| telefone | VARCHAR(20) | NULL |
| email | VARCHAR(150) | NULL |
| endereco | VARCHAR(255) | NULL |

### 2.4 CATEGORIA

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_categoria | INT | PK |
| nome | VARCHAR(100) | NN |
| descricao | VARCHAR(255) | NULL |

### 2.5 MARCA

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_marca | INT | PK |
| nome | VARCHAR(100) | NN |

### 2.6 MODELO_CELULAR

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_modelo | INT | PK |
| fabricante | VARCHAR(100) | NN |
| nome_modelo | VARCHAR(100) | NN |

### 2.7 PRODUTO

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_produto | INT | PK |
| nome | VARCHAR(150) | NN |
| codigo_barras | VARCHAR(50) | NULL |
| descricao | VARCHAR(255) | NULL |
| cor | VARCHAR(50) | NULL |
| custo_medio_atual | DECIMAL(10,2) | NULL |
| preco_venda | DECIMAL(10,2) | NN |
| quantidade_estoque | INT | NN |
| estoque_minimo | INT | NN |
| id_categoria | INT | FK |
| id_marca | INT | FK |

O custo médio atual poderá ser atualizado conforme as novas compras. O histórico dos custos de aquisição será preservado na tabela ITEM_COMPRA.

### 2.8 PRODUTO_MODELO

Tabela intermediária utilizada para relacionar produtos aos modelos de celulares compatíveis.

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_produto | INT | PK, FK |
| id_modelo | INT | PK, FK |

A chave primária é composta pelos campos `id_produto` e `id_modelo`.

Um produto pode ser compatível com vários modelos de celulares, e um modelo de celular pode possuir vários produtos compatíveis.

### 2.9 MOVIMENTACAO_ESTOQUE

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_movimentacao | INT | PK |
| tipo_movimentacao | VARCHAR(30) | NN |
| quantidade | INT | NN |
| data_movimentacao | DATETIME | NN |
| motivo | VARCHAR(255) | NULL |
| id_produto | INT | FK |
| id_funcionario | INT | FK |

Os tipos de movimentação poderão ser ENTRADA, SAIDA ou AJUSTE. A quantidade será registrada como valor positivo, e o tipo determinará o efeito no estoque.

Exemplos de movimentações:

- Entrada por compra de produtos.
- Saída por venda.
- Saída por utilização de peças em consertos.
- Ajustes por perdas, avarias ou correções de inventário.
- Entrada por devolução ou troca, quando o produto estiver em boas condições.

### 2.10 COMPRA

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_compra | INT | PK |
| data_compra | DATETIME | NN |
| valor_total | DECIMAL(10,2) | NN |
| id_fornecedor | INT | FK |
| id_funcionario | INT | FK |

### 2.11 ITEM_COMPRA

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_item_compra | INT | PK |
| quantidade | INT | NN |
| preco_unitario | DECIMAL(10,2) | NN |
| subtotal | DECIMAL(10,2) | NN |
| id_compra | INT | FK |
| id_produto | INT | FK |

O preço unitário registrado em cada item de compra permite consultar o histórico dos custos de aquisição dos produtos.

### 2.12 VENDA

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_venda | INT | PK |
| data_venda | DATETIME | NN |
| valor_total | DECIMAL(10,2) | NN |
| id_funcionario | INT | FK |
| id_cliente | INT | FK, NULL permitido |

O cliente é opcional, pois a loja também realiza vendas diretamente no balcão.

### 2.13 ITEM_VENDA

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_item_venda | INT | PK |
| quantidade | INT | NN |
| preco_unitario | DECIMAL(10,2) | NN |
| subtotal | DECIMAL(10,2) | NN |
| id_venda | INT | FK |
| id_produto | INT | FK |

### 2.14 PAGAMENTO

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_pagamento | INT | PK |
| forma_pagamento | VARCHAR(50) | NN |
| valor | DECIMAL(10,2) | NN |
| data_pagamento | DATETIME | NN |
| id_venda | INT | FK |

Uma venda poderá possuir até dois registros de pagamento, permitindo a divisão do valor entre duas formas de pagamento, conforme a regra de negócio da loja.

### 2.15 TROCA

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_troca | INT | PK |
| data_troca | DATETIME | NN |
| valor_diferenca | DECIMAL(10,2) | NN |
| tipo_diferenca | VARCHAR(30) | NN |
| id_venda_original | INT | FK |
| id_funcionario | INT | FK |

A troca deverá estar vinculada à venda original, permitindo verificar o comprovante e registrar o funcionário responsável.

O campo `tipo_diferenca` poderá indicar pagamento adicional, devolução em dinheiro ou ausência de diferença.

### 2.16 ITEM_TROCA

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_item_troca | INT | PK |
| quantidade | INT | NN |
| estado_produto_devolvido | VARCHAR(30) | NN |
| id_troca | INT | FK |
| id_produto_devolvido | INT | FK |
| id_produto_entregue | INT | FK |

Essa tabela registra o produto devolvido pelo cliente e o produto entregue em substituição. Os produtos devolvidos somente retornarão ao estoque quando estiverem em boas condições.

### 2.17 FECHAMENTO_CAIXA

| Atributo | Tipo de dado | Restrição |
|---|---|---|
| id_fechamento | INT | PK |
| data_fechamento | DATETIME | NN |
| valor_dinheiro | DECIMAL(10,2) | NULL |
| valor_pix | DECIMAL(10,2) | NULL |
| valor_cartao | DECIMAL(10,2) | NULL |
| valor_fisico_caixa | DECIMAL(10,2) | NULL |
| id_funcionario | INT | FK |

A tabela registra os valores apurados no fechamento, incluindo o dinheiro físico contado no caixa.

## 3. Relacionamentos entre as tabelas

| Tabela de origem | Tabela relacionada | Cardinalidade |
|---|---|---|
| CATEGORIA | PRODUTO | 1:N |
| MARCA | PRODUTO | 1:N |
| PRODUTO | PRODUTO_MODELO | 1:N |
| MODELO_CELULAR | PRODUTO_MODELO | 1:N |
| FORNECEDOR | COMPRA | 1:N |
| FUNCIONARIO | COMPRA | 1:N |
| COMPRA | ITEM_COMPRA | 1:N |
| PRODUTO | ITEM_COMPRA | 1:N |
| FUNCIONARIO | VENDA | 1:N |
| CLIENTE | VENDA | 1:N (cliente opcional na venda) |
| VENDA | ITEM_VENDA | 1:N |
| PRODUTO | ITEM_VENDA | 1:N |
| VENDA | PAGAMENTO | 1:N |
| PRODUTO | MOVIMENTACAO_ESTOQUE | 1:N |
| FUNCIONARIO | MOVIMENTACAO_ESTOQUE | 1:N |
| VENDA | TROCA | 1:N |
| FUNCIONARIO | TROCA | 1:N |
| TROCA | ITEM_TROCA | 1:N |
| PRODUTO (devolvido) | ITEM_TROCA | 1:N |
| PRODUTO (entregue) | ITEM_TROCA | 1:N |
| FUNCIONARIO | FECHAMENTO_CAIXA | 1:N |

**Observação:** a cardinalidade 1:N indica que um registro da tabela de origem pode estar relacionado a vários registros da tabela relacionada. No caso de CLIENTE e VENDA, o cadastro do cliente é opcional para cada venda.

## 4. Regras de negócio consideradas

1. Toda venda deve possuir pelo menos um produto.
2. Uma venda pode ser realizada sem cadastro de cliente.
3. Uma venda pode possuir até duas formas de pagamento.
4. O estoque deve ser atualizado após entradas, saídas e ajustes.
5. A utilização de peças em consertos será registrada como saída de estoque.
6. As compras devem registrar os produtos, quantidades e preços de aquisição.
7. O histórico de custos poderá ser consultado pelos registros de itens de compra.
8. As trocas devem estar vinculadas a uma venda original e possuir registro dos produtos envolvidos.
9. Produtos devolvidos somente poderão retornar ao estoque se estiverem em boas condições.
10. Diferenças financeiras nas trocas serão resolvidas em dinheiro, sem geração de crédito na loja.
11. As movimentações de estoque devem possuir registro do produto, quantidade, data, tipo e funcionário responsável.

## 5. Considerações finais

O modelo lógico da GCaccessories organiza as informações necessárias para o gerenciamento de produtos, categorias, marcas, fornecedores, funcionários, compras, vendas, pagamentos, movimentações de estoque, trocas e fechamento de caixa.

A estrutura servirá como base para a elaboração do modelo físico e posterior implementação no MySQL 8.0.

O sistema terá como foco principal o controle de vendas e estoque, mantendo o registro das movimentações para facilitar a consulta das quantidades disponíveis e o acompanhamento das operações da loja.
