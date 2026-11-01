# GCaccessories — Projeto de Banco de Dados

## 1. Identificação do projeto

| INFORMAÇÃO| Descrição |
|---|---|
| Nome do projeto | GCaccessories |
| Área de atuação | Comércio de acessórios e peças e assistência técnica em celulares e computadores |
| Localização | Jardim Caçula, Ribeirão Pires — SP |
| Responsável pelo levantamento | Paulo Henrique Oliveira dos Santos |
| Entrevistado | Proprietário da empresa |
| Data da entrevista | 18/09/2026 |
| SGBD | MySQL 8.0.46 |

## 2. Apresentação da empresa

A GCaccessories é uma empresa que atua no comércio de acessórios e peças para celulares e computadores, além de prestar serviços de assistência técnica.

Entre os serviços realizados estão reparos em telas e baterias de celulares e manutenção de computadores. A empresa também comercializa produtos como capinhas, carregadores, películas, fones de ouvido e outros acessórios.

A equipe é composta por cinco colaboradores. O proprietário exerce atividades administrativas e gerenciais, além de também realizar reparos.

A empresa atende principalmente pessoas físicas, mas também recebe clientes pessoa jurídica.

## 3. Levantamento de requisitos

O levantamento foi realizado por meio de entrevista individual com o proprietário, em 18/09/2026, fora das dependências da loja.

As informações obtidas foram utilizadas para compreender os processos da empresa, identificar dificuldades e definir as necessidades que deverão ser atendidas pelo banco de dados.

O documento completo do levantamento está disponível em:

`levantamento/levantamento.md`

### 3.1. Características operacionais

Segundo estimativas informadas pelo proprietário:

- 5 colaboradores;
- Aproximadamente 10 a 50 vendas por dia;
- Aproximadamente 3 a 10 ordens de serviço por dia;
- Atendimento principalmente a pessoas físicas, mas também a pessoas jurídicas;
- Estoque compartilhado entre vendas de balcão e serviços de assistência técnica.

Os volumes apresentados são estimativas fornecidas durante a entrevista, não números extraídos de registros oficiais.

### 3.2. Principais problemas identificados

**P1 — Controle de estoque**

A empresa utiliza anotações e planilhas para controlar parte das informações de estoque. Isso pode ocasionar divergências entre a quantidade registrada e a quantidade física, dificultando a identificação dos produtos disponíveis e a reposição de mercadorias.

**P2 — Organização e consulta das informações comerciais**

A utilização de registros separados dificulta a organização e a consulta de informações sobre clientes, produtos, fornecedores, compras, vendas e serviços.

### 3.3. Objetivo geral

Desenvolver um banco de dados relacional capaz de centralizar e organizar as informações da GCaccessories, priorizando o controle de estoque e facilitando a consulta dos registros comerciais e de assistência técnica.

### 3.4. Objetivos específicos

- Organizar os cadastros de clientes, funcionários, produtos e fornecedores;
- Registrar compras, vendas e pagamentos;
- Controlar entradas, saídas e movimentações de estoque;
- Registrar ordens de serviço e os respectivos serviços e peças utilizados;
- Organizar informações de trocas e garantias;
- Permitir consultas gerenciais e operacionais.

## 4. Escopo do projeto

O banco de dados deverá contemplar os seguintes módulos:

1. Clientes e aparelhos;
2. Funcionários e permissões;
3. Produtos, categorias, marcas e compatibilidade;
4. Fornecedores e compras;
5. Estoque e movimentações;
6. Vendas e pagamentos;
7. Caixa;
8. Ordens de serviço e técnicos;
9. Serviços, peças utilizadas e garantias;
10. Trocas.

### 4.1. Itens fora do escopo

Não estão previstos nesta etapa:

- Desenvolvimento de loja virtual;
- Integração com plataformas de vendas on-line;
- Integração com sistemas de emissão fiscal;
- Integração direta com máquinas de cartão;
- Desenvolvimento de um módulo financeiro completo;
- Desenvolvimento de interface gráfica para o usuário.

## 5. Requisitos funcionais (RF)

Os requisitos funcionais descrevem as operações que o banco de dados deverá permitir registrar, consultar e organizar.

| Código | Descrição |
|---|---|
| RF01 | Cadastrar, consultar, alterar e inativar clientes. |
| RF02 | Identificar clientes como pessoa física ou jurídica. |
| RF03 | Registrar aparelhos vinculados aos clientes. |
| RF04 | Cadastrar funcionários e seus dados de identificação. |
| RF05 | Organizar os níveis de permissão dos funcionários. |
| RF06 | Cadastrar produtos, categorias, marcas e modelos compatíveis. |
| RF07 | Cadastrar e consultar fornecedores. |
| RF08 | Registrar compras e seus respectivos itens. |
| RF09 | Registrar entradas e saídas de estoque. |
| RF10 | Consultar quantidade atual e quantidade mínima dos produtos. |
| RF11 | Registrar vendas contendo um ou mais produtos. |
| RF12 | Registrar pagamentos por uma ou mais formas de pagamento. |
| RF13 | Registrar abertura e fechamento de caixa. |
| RF14 | Cadastrar e acompanhar ordens de serviço. |
| RF15 | Registrar diagnósticos, orçamentos e decisões dos clientes. |
| RF16 | Registrar serviços executados e peças utilizadas nas ordens de serviço. |
| RF17 | Registrar técnicos responsáveis e alterações de responsabilidade. |
| RF18 | Registrar pagamentos antecipados e pagamentos realizados na retirada do aparelho. |
| RF19 | Registrar informações de garantia de peças e serviços. |
| RF20 | Registrar trocas de produtos e diferenças de valores. |
| RF21 | Consultar vendas, compras, estoque e ordens de serviço por período. |
| RF22 | Identificar produtos abaixo da quantidade mínima de estoque. |
| RF23 | Consultar a quantidade de serviços realizados por técnico. |
| RF24 | Disponibilizar informações de vendas e serviços para acompanhamento gerencial. |

## 6. Requisitos não funcionais (RNF)

Os requisitos não funcionais definem condições de qualidade, segurança e confiabilidade que deverão ser consideradas durante a implementação.

| Código | Descrição |
|---|---|
| RNF01 | O banco de dados deverá utilizar o MySQL 8.0.46. |
| RNF02 | Os dados deverão possuir tipos adequados e restrições de integridade. |
| RNF03 | As tabelas deverão utilizar chaves primárias para identificar seus registros. |
| RNF04 | Os relacionamentos deverão utilizar chaves estrangeiras quando aplicável. |
| RNF05 | Informações de acesso deverão ser protegidas, evitando o armazenamento de senhas em texto puro. |
| RNF06 | Os acessos deverão respeitar as permissões definidas para cada função. |
| RNF07 | As operações importantes deverão manter registros suficientes para consulta e rastreabilidade. |
| RNF08 | O banco deverá permitir consultas consistentes entre diferentes tabelas relacionadas. |
| RNF09 | Dados pessoais deverão ser armazenados somente quando necessários aos processos da empresa. |
| RNF10 | A estrutura deverá permitir manutenção e expansão futura sem comprometer a integridade dos dados. |

## 7. Regras de negócio (RN)

As regras de negócio representam condições que deverão ser respeitadas pelos processos registrados no banco de dados.

| Código | Regra |
|---|---|
| RN01 | Cada cliente deverá possuir identificação por CPF ou CNPJ, conforme seu tipo. |
| RN02 | Um cliente poderá possuir vários aparelhos cadastrados. |
| RN03 | Um cliente poderá possuir várias ordens de serviço. |
| RN04 | Cada ordem de serviço deverá possuir número próprio e sequencial. |
| RN05 | Uma ordem de serviço poderá conter vários serviços e peças. |
| RN06 | Uma ordem de serviço poderá ser atribuída a diferentes técnicos ao longo de seu andamento. |
| RN07 | O orçamento terá validade de sete dias. |
| RN08 | O diagnóstico é gratuito. |
| RN09 | O pagamento antecipado de 50% do orçamento é normalmente solicitado, mas não é obrigatório. |
| RN10 | Caso o cliente recuse o orçamento e nenhum reparo tenha sido realizado, poderá retirar o aparelho sem cobrança pelo diagnóstico. |
| RN11 | Quando um reparo autorizado for realizado, o valor correspondente deverá ser registrado para pagamento. |
| RN12 | A garantia das peças deverá respeitar o prazo e as condições estabelecidas pelo fabricante. |
| RN13 | As condições específicas de garantia dos serviços ainda deverão ser definidas. |
| RN14 | Um produto poderá ser compatível com vários modelos de aparelhos, e um modelo poderá possuir vários produtos compatíveis. |
| RN15 | O estoque de produtos será compartilhado entre vendas de balcão e assistência técnica. |
| RN16 | As entradas e saídas de produtos deverão ser registradas para manter o histórico de movimentações. |
| RN17 | Um produto poderá ser adquirido de diferentes fornecedores. |
| RN18 | Uma venda poderá possuir vários itens e poderá ser registrada sem identificação de cliente, quando for uma venda avulsa. |
| RN19 | Uma venda poderá possuir pagamentos divididos entre diferentes formas de pagamento. |
| RN20 | As formas de pagamento incluem dinheiro, Pix, débito e crédito parcelado em até três vezes. |
| RN21 | O fechamento de caixa deverá considerar a conferência de dinheiro físico, Pix e cartões. |
| RN22 | A troca de produtos deverá ser registrada mediante apresentação do comprovante da compra. |
| RN23 | Quando houver diferença de valor a favor do cliente em uma troca, a devolução será realizada em dinheiro, sem geração de crédito acumulado. |
| RN24 | Cada funcionário deverá possuir seu próprio acesso individual. |
| RN25 | Somente o proprietário poderá visualizar relatórios financeiros e alterar preços. |
| RN26 | Quando uma peça encomendada chegar, poderá ser reservada para uma ordem de serviço. |

**Pontos que ainda dependem de validação:** momento exato da baixa do estoque, tratamento de cancelamentos e condições de garantia dos serviços.

## 8. Modelagem conceitual — DER

O modelo conceitual deverá representar as entidades, atributos, relacionamentos e cardinalidades, sem apresentar chaves estrangeiras.

### 8.1. Entidades previstas

- Cliente;
- Aparelho;
- Funcionario;
- PerfilAcesso;
- Produto;
- Categoria;
- Marca;
- ModeloCelular;
- ProdutoModelo;
- Fornecedor;
- Compra;
- ItemCompra;
- Venda;
- ItemVenda;
- Pagamento;
- FechamentoCaixa;
- MovimentacaoEstoque;
- OrdemServico;
- ItemOrdemServico;
- Servico;
- TecnicoOrdemServico;
- Garantia;
- Troca;
- ItemTroca.

A lista é uma proposta inicial e poderá ser ajustada durante a construção do diagrama.

### 8.2. Relacionamentos conceituais principais

- Um cliente pode possuir vários aparelhos.
- Um cliente pode abrir várias ordens de serviço.
- Um aparelho pode aparecer em várias ordens de serviço ao longo do tempo.
- Uma categoria pode classificar vários produtos.
- Uma marca pode identificar vários produtos.
- Um produto pode ser compatível com vários modelos de aparelhos.
- Um fornecedor pode participar de várias compras.
- Uma compra possui um ou mais itens.
- Uma venda possui um ou mais itens.
- Uma venda pode possuir vários pagamentos.
- Um produto pode aparecer em vários itens de compra e venda.
- Uma ordem de serviço pode conter vários serviços e peças.
- Um técnico pode atuar em várias ordens de serviço.
- Uma movimentação de estoque está associada a um produto.

**Arquivo previsto:** `diagramas/DER_conceitual.png`.

O DER será construído conforme a notação solicitada pelo professor, com entidades em retângulos, relacionamentos em losangos, atributos, identificadores e cardinalidades mínimas e máximas.

## 9. Modelo lógico

O modelo lógico apresentará a estrutura relacional do banco de dados, incluindo tabelas, atributos, chaves primárias e chaves estrangeiras.

A estrutura atual possui inicialmente 15 tabelas, mas deverá ser revisada para contemplar todos os requisitos identificados, especialmente os relacionados a clientes, aparelhos, ordens de serviço, serviços e técnicos.

A modelagem final deverá apresentar:

- Identificação das chaves primárias;
- Identificação das chaves estrangeiras;
- Tipos de dados;
- Restrições de integridade;
- Relacionamentos entre as tabelas.

**Arquivo previsto:** `diagramas/Modelo_logico.png`.

## 10. Normalização

A estrutura será analisada considerando as três primeiras formas normais.

### 10.1. Primeira Forma Normal (1FN)

Cada campo deverá armazenar um valor individual, evitando listas de valores ou grupos repetidos em uma mesma coluna.

### 10.2. Segunda Forma Normal (2FN)

As tabelas deverão atender à 1FN e todos os atributos não-chave deverão depender da chave primária completa, eliminando dependências parciais.

### 10.3. Terceira Forma Normal (3FN)

As tabelas deverão atender à 2FN e evitar dependências transitivas entre atributos não-chave.

A análise definitiva será realizada após a validação do modelo lógico, com justificativas para as decisões de normalização adotadas.

## 11. Justificativa da modelagem

A modelagem relacional foi escolhida para organizar os dados da empresa e representar os relacionamentos entre seus processos.

A separação das informações em entidades específicas permite reduzir redundâncias, manter a integridade dos registros e facilitar consultas.

A utilização de tabelas associativas permite representar relacionamentos de muitos para muitos, como a compatibilidade entre produtos e modelos de aparelhos.

O controle de movimentações de estoque permitirá manter o histórico das entradas e saídas, contribuindo para o principal problema identificado no levantamento.

## 12. Proposta de BI e indicadores

O banco de dados poderá fornecer informações para apoiar decisões gerenciais.

| Indicador | Objetivo | Tabelas envolvidas |
|---|---|---|
| Produtos abaixo do mínimo | Identificar necessidades de reposição. | Produto, MovimentacaoEstoque |
| Vendas por período | Acompanhar o volume de vendas. | Venda, ItemVenda |
| Produtos mais vendidos | Identificar os itens com maior saída. | Produto, ItemVenda, Venda |
| Compras por fornecedor | Consultar o histórico de aquisição. | Fornecedor, Compra, ItemCompra |
| Ordens de serviço em aberto | Acompanhar serviços pendentes. | OrdemServico |
| Serviços por técnico | Consultar a quantidade de atendimentos realizados. | OrdemServico, TecnicoOrdemServico |
| Receitas registradas por período | Acompanhar valores registrados em vendas e serviços. | Venda, Pagamento, OrdemServico |

### 12.1. Consultas SQL previstas

As consultas abaixo são exemplos iniciais. Os nomes das tabelas e colunas serão adaptados ao modelo lógico definitivo.

**KPI 01 — Produtos abaixo do estoque mínimo**

Objetivo: identificar produtos que precisam de reposição.

```sql
SELECT
    p.idProduto,
    p.nome,
    p.estoqueAtual,
    p.estoqueMinimo
FROM Produto p
WHERE p.estoqueAtual <= p.estoqueMinimo;
```

**KPI 02 — Vendas por período**

Objetivo: acompanhar o total de vendas em determinado período.

```sql
SELECT
    DATE(v.dataVenda) AS data,
    COUNT(v.idVenda) AS quantidadeVendas,
    SUM(v.valorTotal) AS totalVendido
FROM Venda v
GROUP BY DATE(v.dataVenda)
ORDER BY data;
```

**KPI 03 — Produtos mais vendidos**

Objetivo: identificar os produtos com maior quantidade vendida.

```sql
SELECT
    p.nome,
    SUM(iv.quantidade) AS quantidadeVendida
FROM ItemVenda iv
JOIN Produto p
    ON p.idProduto = iv.idProduto
GROUP BY p.idProduto, p.nome
ORDER BY quantidadeVendida DESC;
```

**KPI 04 — Compras por fornecedor**

Objetivo: consultar os valores de compras agrupados por fornecedor.

```sql
SELECT
    f.nome,
    COUNT(c.idCompra) AS quantidadeCompras,
    SUM(c.valorTotal) AS totalComprado
FROM Compra c
JOIN Fornecedor f
    ON f.idFornecedor = c.idFornecedor
GROUP BY f.idFornecedor, f.nome;
```

**KPI 05 — Ordens de serviço por situação**

Objetivo: acompanhar a quantidade de ordens de serviço em cada situação.

```sql
SELECT
    status,
    COUNT(*) AS quantidade
FROM OrdemServico
GROUP BY status;
```

**Observação:** os exemplos são propostas de consulta e dependem da estrutura definitiva das tabelas. O cálculo de lucro deverá considerar custos de aquisição e custos dos serviços, não apenas valores de vendas.

## 13. Proposta de utilização de Inteligência Artificial

Como possibilidade futura, técnicas de Inteligência Artificial poderão auxiliar na análise de informações históricas, por exemplo:

- Identificação de padrões de consumo;
- Estimativa de demanda de produtos;
- Apoio ao planejamento de reposição de estoque;
- Identificação de produtos com maior frequência de saída.

Essas possibilidades serão apresentadas como propostas de evolução, e não como funcionalidades já implementadas.

## 14. Dicionário de dados

O dicionário de dados deverá documentar cada tabela e seus respectivos campos.

Para cada atributo, deverão ser apresentados:

- Nome do campo;
- Descrição;
- Tipo de dado;
- Tamanho, quando aplicável;
- Identificação de chave primária ou estrangeira;
- Restrições;
- Obrigatoriedade.

**Arquivo previsto:** `dicionario/dicionario_dados.html`.

## 15. Implementação e testes

A implementação será realizada no MySQL 8.0.46.

Os scripts SQL deverão conter:

1. Criação do banco de dados;
2. Criação das tabelas;
3. Definição de chaves primárias e estrangeiras;
4. Restrições de integridade;
5. Inserção de dados fictícios;
6. Consultas com relacionamentos (JOIN);
7. Operações de inclusão, alteração e exclusão;
8. Consultas de gerenciamento;
9. Consultas de auditoria.

Os dados fictícios serão utilizados exclusivamente para demonstração e testes, sem representar registros reais da empresa.

A massa de dados deverá contemplar situações variadas, como vendas canceladas, clientes sem compras, produtos com estoque baixo, pagamentos divididos, compras de diferentes fornecedores e ordens de serviço em diferentes situações.

Os testes deverão verificar a integridade dos relacionamentos, consistência dos dados e funcionamento das consultas.

### 15.1. Arquivos SQL

Os scripts serão organizados na pasta `docs/`:

- `GCaccessories_MySQL.sql` — criação e estrutura do banco de dados;
- `massa_de_dados.sql` — inserção de dados fictícios para testes.

## 16. Evidências do levantamento

As evidências do levantamento serão armazenadas em:

`levantamento/evidencias/`

Serão incluídos registros fotográficos relacionados à empresa e ao levantamento, respeitando a autorização dos envolvidos.

A entrevista foi realizada fora da loja. Portanto, não será descrita como observação presencial do funcionamento interno.

## 17. Utilização de Inteligência Artificial no projeto

A utilização de ferramentas de Inteligência Artificial será documentada de acordo com as orientações da atividade.

O registro deverá apresentar:

- Ferramentas utilizadas;
- Etapas em que foram utilizadas;
- Motivos da utilização;
- Prompts relevantes;
- Resumo das respostas;
- Informações verificadas, corrigidas ou descartadas;
- Justificativas das decisões adotadas;
- Reflexão sobre os resultados e limitações.

As decisões finais serão revisadas pelo responsável pelo projeto e confrontadas com as informações obtidas no levantamento.

## 18. Organização do repositório

A estrutura prevista para o repositório será:

```text
GCaccessories/
│
├── README.md
│
├── diagramas/
│   ├── DER_conceitual.png
│   └── Modelo_logico.png
│
├── docs/
│   ├── GCaccessories_MySQL.sql
│   └── massa_de_dados.sql
│
├── levantamento/
│   ├── levantamento.md
│   └── evidencias/
│
└── dicionario/
    └── dicionario_dados.html
```

## 19. Considerações finais

O projeto GCaccessories busca desenvolver uma estrutura de banco de dados relacional que represente os processos comerciais e operacionais da empresa.

A prioridade é melhorar a organização das informações e o controle de estoque, mantendo também os registros de clientes, fornecedores, compras, vendas e assistência técnica.

A modelagem será validada com base no levantamento realizado e nas regras de negócio informadas pelo proprietário.

A implementação e os testes serão realizados após a validação dos modelos conceitual e lógico.

---

**Projeto acadêmico — Banco de Dados**

**GCaccessories**

**Responsável pelo desenvolvimento:** Paulo Henrique Oliveira dos Santos
