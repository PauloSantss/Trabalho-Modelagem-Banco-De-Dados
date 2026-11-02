
# Modelo Físico do Banco de Dados — GCaccessories

## 1. Introdução

O modelo físico representa a estrutura do banco de dados GCaccessories implementada no MySQL 8.0.46.

Ele apresenta as tabelas, os campos, os tipos de dados, as chaves primárias, as chaves estrangeiras e as principais restrições utilizadas para armazenar e relacionar as informações da loja de acessórios para celulares.

O banco de dados foi desenvolvido para apoiar o controle de produtos, estoque, fornecedores, compras, vendas, pagamentos, trocas e fechamento de caixa.

## 2. Características gerais

- **Banco de dados:** GCaccessories
- **SGBD:** MySQL 8.0.46
- **Quantidade de tabelas:** 17
- **Quantidade de relacionamentos por chave estrangeira:** 21
- **Modelagem:** Relacional
- **Codificação e mecanismo de armazenamento:** Não especificados neste documento.

## 3. Estrutura das tabelas

### 3.1. Tabela `categoria`

Armazena as categorias utilizadas para organizar os produtos.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_categoria | INT | Não | PK | — |
| nome | VARCHAR(100) | Não | UNIQUE | — |
| descricao | VARCHAR(255) | Sim | — | NULL |
| ativo | TINYINT(1) | Não | — | 1 |

### 3.2. Tabela `cliente`

Armazena os dados básicos dos clientes.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_cliente | INT | Não | PK | — |
| nome | VARCHAR(150) | Não | — | — |
| telefone | VARCHAR(20) | Sim | — | NULL |

O cadastro do cliente é opcional durante uma venda.

### 3.3. Tabela `compra`

Registra as compras realizadas com fornecedores.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_compra | INT | Não | PK | — |
| data_compra | DATETIME | Não | — | CURRENT_TIMESTAMP |
| valor_total | DECIMAL(10,2) | Não | — | — |
| status | ENUM('PENDENTE','RECEBIDA','CANCELADA') | Não | — | RECEBIDA |
| observacoes | VARCHAR(255) | Sim | — | NULL |
| id_fornecedor | INT | Não | FK | — |
| id_funcionario | INT | Não | FK | — |

### 3.4. Tabela `fechamento_caixa`

Registra a abertura e o fechamento do caixa, incluindo os valores financeiros e a conferência física do dinheiro.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_fechamento | INT | Não | PK | — |
| data_abertura | DATETIME | Não | — | CURRENT_TIMESTAMP |
| data_fechamento | DATETIME | Sim | — | NULL |
| valor_dinheiro | DECIMAL(10,2) | Sim | — | 0.00 |
| valor_pix | DECIMAL(10,2) | Sim | — | 0.00 |
| valor_cartao | DECIMAL(10,2) | Sim | — | 0.00 |
| valor_fisico_caixa | DECIMAL(10,2) | Sim | — | 0.00 |
| observacoes | VARCHAR(255) | Sim | — | NULL |
| status | ENUM('ABERTO','FECHADO') | Não | — | ABERTO |
| id_funcionario | INT | Não | FK | — |

### 3.5. Tabela `fornecedor`

Armazena os dados dos fornecedores da loja.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_fornecedor | INT | Não | PK | — |
| nome | VARCHAR(150) | Não | — | — |
| nome_contato | VARCHAR(120) | Sim | — | NULL |
| telefone | VARCHAR(20) | Sim | — | NULL |
| email | VARCHAR(150) | Sim | — | NULL |
| cnpj | VARCHAR(18) | Sim | UNIQUE | NULL |
| endereco | VARCHAR(255) | Sim | — | NULL |
| observacoes | TEXT | Sim | — | NULL |
| ativo | TINYINT(1) | Não | — | 1 |

### 3.6. Tabela `funcionario`

Armazena os dados dos funcionários responsáveis pelas operações da loja.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_funcionario | INT | Não | PK | — |
| nome | VARCHAR(150) | Não | — | — |
| cpf | VARCHAR(14) | Sim | UNIQUE | NULL |
| telefone | VARCHAR(20) | Sim | — | NULL |
| email | VARCHAR(150) | Sim | — | NULL |
| cargo | VARCHAR(80) | Sim | — | NULL |
| data_admissao | DATE | Sim | — | NULL |
| ativo | TINYINT(1) | Não | — | 1 |

### 3.7. Tabela `item_compra`

Armazena os produtos e seus respectivos valores dentro de cada compra.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_item_compra | INT | Não | PK | — |
| Quantidade | INT | Não | — | — |
| preco_unitario | DECIMAL(10,2) | Não | — | — |
| subtotal | DECIMAL(10,2) | Não | — | — |
| id_compra | INT | Não | FK | — |
| id_produto | INT | Não | FK | — |

O campo `preco_unitario` permite manter o histórico do custo dos produtos em cada compra.

### 3.8. Tabela `item_troca`

Armazena os produtos envolvidos em uma troca, identificando o item devolvido, o item entregue e o estado do produto devolvido.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_item_troca | INT | Não | PK | — |
| Quantidade | INT | Não | — | — |
| estado_produto_devolvido | ENUM('BOM','AVARIADO') | Não | — | — |
| id_troca | INT | Não | FK | — |
| id_produto_devolvido | INT | Não | FK | — |
| id_produto_entregue | INT | Não | FK | — |

### 3.9. Tabela `item_venda`

Armazena os produtos e valores correspondentes a cada venda.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_item_venda | INT | Não | PK | — |
| Quantidade| INT | Não | — | — |
| preco_unitario | DECIMAL(10,2) | Não | — | — |
| subtotal | DECIMAL(10,2) | Não | — | — |
| id_venda | INT | Não | FK | — |
| id_produto | INT | Não | FK | — |

### 3.10. Tabela `marca`

Armazena as marcas dos produtos comercializados.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_marca | INT | Não | PK | — |
| nome | VARCHAR(100) | Não | UNIQUE | — |
| ativo | TINYINT(1) | Não | — | 1 |

### 3.11. Tabela `modelo_celular`

Armazena os fabricantes e modelos de celulares utilizados para identificar a compatibilidade dos produtos.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_modelo | INT | Não | PK | — |
| fabricante | VARCHAR(100) | Não | INDEX | — |
| nome_modelo | VARCHAR(100) | Não | — | — |
| ativo | TINYINT(1) | Não | — | 1 |

### 3.12. Tabela `movimentacao_estoque`

Registra as movimentações de entrada, saída e ajuste de estoque.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_movimentacao | INT | Não | PK | — |
| tipo_movimentacao | ENUM('ENTRADA','SAIDA','AJUSTE') | Não | — | — |
| Quantidade | INT | Não | — | — |
| data_movimentacao | DATETIME | Não | INDEX | CURRENT_TIMESTAMP |
| motivo | VARCHAR(255) | Sim | — | NULL |
| id_produto | INT | Não | FK | — |
| id_funcionario | INT | Não | FK | — |

### 3.13. Tabela `pagamento`

Registra os pagamentos associados às vendas.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_pagamento | INT | Não | PK | — |
| forma_pagamento | ENUM('DINHEIRO','CARTAO_CREDITO','CARTAO_DEBITO','PIX','OUTRO') | Não | — | — |
| valor | DECIMAL(10,2) | Não | — | — |
| data_pagamento | DATETIME | Não | — | CURRENT_TIMESTAMP |
| id_venda | INT | Não | FK | — |

### 3.14. Tabela `produto`

Armazena os produtos comercializados pela loja e suas informações de preço, identificação e estoque.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_produto | INT | Não | PK | — |
| nome | VARCHAR(150) | Não | INDEX | — |
| codigo_barras | VARCHAR(50) | Sim | UNIQUE | NULL |
| sku | VARCHAR(50) | Sim | UNIQUE | NULL |
| descricao | VARCHAR(255) | Sim | — | NULL |
| cor | VARCHAR(50) | Sim | — | NULL |
| custo_medio_atual | DECIMAL(10,2) | Sim | — | 0.00 |
| preco_venda | DECIMAL(10,2) | Não | — | — |
| Quantidade_estoque | INT | Não | — | 0 |
| estoque_minimo | INT | Não | — | 0 |
| id_categoria | INT | Não | FK | — |
| id_marca | INT | Não | FK | — |
| ativo | TINYINT(1) | Não | — | 1 |
| criado_em | DATETIME | Não | — | CURRENT_TIMESTAMP |

### 3.15. Tabela `produto_modelo`

Tabela associativa que relaciona produtos aos modelos de celulares compatíveis.

Possui chave primária composta pelos campos `id_produto` e `id_modelo`.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_produto | INT | Não | PK / FK | — |
| id_modelo | INT | Não | PK / FK | — |

Essa estrutura permite que um produto seja compatível com vários modelos de celulares e que um modelo de celular esteja associado a vários produtos.

### 3.16. Tabela `troca`

Registra as trocas realizadas a partir de uma venda original.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_troca | INT | Não | PK | — |
| data_troca | DATETIME | Não | — | CURRENT_TIMESTAMP |
| valor_diferenca | DECIMAL(10,2) | Não | — | 0.00 |
| tipo_diferenca | ENUM('PAGAMENTO_ADICIONAL','DEVOLUCAO_DINHEIRO','SEM_DIFERENCA') | Não | — | — |
| id_venda_original | INT | Não | FK | — |
| id_funcionario | INT | Não | FK | — |

### 3.17. Tabela `venda`

Armazena as informações gerais das vendas realizadas.

| Campo | Tipo | Nulo | Chave | Padrão |
|---|---|---|---|---|
| id_venda | INT | Não | PK | — |
| data_venda | DATETIME | Não | — | CURRENT_TIMESTAMP |
| valor_subtotal | DECIMAL(10,2) | Não | — | — |
| desconto | DECIMAL(10,2) | Não | — | 0.00 |
| valor_total | DECIMAL(10,2) | Não | — | — |
| status | ENUM('CONCLUIDA','CANCELADA') | Não | — | CONCLUIDA |
| id_funcionario | INT | Não | FK | — |
| id_cliente | INT | Sim | FK | NULL |

O campo `id_cliente` permite registrar vendas sem a necessidade de identificar o cliente.

## 4. Relacionamentos e chaves estrangeiras

As chaves estrangeiras garantem a integridade referencial entre as tabelas do banco de dados.

| Tabela de origem | Campo | Tabela referenciada | Campo referenciado |
|---|---|---|---|
| compra | id_fornecedor | fornecedor | id_fornecedor |
| compra | id_funcionario | funcionario | id_funcionario |
| fechamento_caixa | id_funcionario | funcionario | id_funcionario |
| item_compra | id_compra | compra | id_compra |
| item_compra | id_produto | produto | id_produto |
| item_troca | id_produto_devolvido | produto | id_produto |
| item_troca | id_produto_entregue | produto | id_produto |
| item_troca | id_troca | troca | id_troca |
| item_venda | id_produto | produto | id_produto |
| item_venda | id_venda | venda | id_venda |
| movimentacao_estoque | id_funcionario | funcionario | id_funcionario |
| movimentacao_estoque | id_produto | produto | id_produto |
| pagamento | id_venda | venda | id_venda |
| produto | id_categoria | categoria | id_categoria |
| produto | id_marca | marca | id_marca |
| produto_modelo | id_modelo | modelo_celular | id_modelo |
| produto_modelo | id_produto | produto | id_produto |
| troca | id_funcionario | funcionario | id_funcionario |
| troca | id_venda_original | venda | id_venda |
| venda | id_cliente | cliente | id_cliente |
| venda | id_funcionario | funcionario | id_funcionario |

**Total: 21 chaves estrangeiras.**

## 5. Índices e restrições de unicidade

Além das chaves primárias e estrangeiras, foram identificados os seguintes índices e restrições na estrutura das tabelas:

- `categoria.nome`: UNIQUE.
- `fornecedor.cnpj`: UNIQUE.
- `funcionario.cpf`: UNIQUE.
- `marca.nome`: UNIQUE.
- `produto.codigo_barras`: UNIQUE.
- `produto.sku`: UNIQUE.
- `produto.nome`: INDEX.
- `modelo_celular.fabricante`: INDEX.
- `movimentacao_estoque.data_movimentacao`: INDEX.

A tabela `produto_modelo` utiliza uma chave primária composta por dois campos.

## 6. Triggers e regras implementadas

O banco de dados possui mecanismos de trigger para auxiliar no controle de pagamentos e estoque.

### 6.1. Controle de pagamentos

- `trg_pagamento_limite_insert`: verifica o limite de pagamentos ao inserir um pagamento.
- `trg_pagamento_limite_update`: verifica o limite de pagamentos ao atualizar um pagamento.

Essas regras limitam a quantidade de registros de pagamento por venda a dois.

### 6.2. Controle de estoque

- `trg_movimento_verifica_estoque`: verifica a disponibilidade de estoque antes de uma saída.
- `trg_movimento_atualiza_estoque`: atualiza a quantidade de estoque após a inserção de uma movimentação.
- `trg_movimento_bloqueia_update`: impede a alteração de movimentações de estoque.
- `trg_movimento_bloqueia_delete`: impede a exclusão de movimentações de estoque.

As movimentações são classificadas como entrada, saída ou ajuste.

## 7. Considerações finais

O modelo físico do banco de dados GCaccessories foi estruturado para atender às principais necessidades identificadas no levantamento de requisitos da loja.

A organização das informações em tabelas relacionadas permite registrar compras, vendas, pagamentos, trocas e movimentações de estoque, mantendo o histórico das operações.

A utilização de chaves primárias, chaves estrangeiras, índices, restrições de unicidade e triggers contribui para a integridade e consistência dos dados.

O banco de dados também contempla o controle de compatibilidade entre produtos e modelos de celulares, o registro de custos de aquisição e o acompanhamento do fechamento de caixa.
