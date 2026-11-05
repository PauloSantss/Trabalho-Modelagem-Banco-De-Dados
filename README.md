# Entrega 2 — Modelo Lógico, Implementação SQL e Apresentação Final

### Modelagem de um sistema de gestão de informações para a MAXfood

## Integrantes

| Nome completo do aluno | RGM | Usuário do GitHub |
| :--- | :--- | :--- |
| Anderson Josué Quispe Salcedo | 50132075 | *(preencher)* |
| João Victor Cipriano Bezerra | 48071277 | *(preencher)* |
| Luis Angel Yana Poma | 50132229 | *(preencher)* |
| Nicolas de Oliveira Batista Barsoti | 48030058 | *(preencher)* |
| Paulo Henrique Oliveira dos Santos | 47848430 | *PauloSantss* |

&nbsp;

## 1. Relatório Técnico Final

### 1.1 Revisão do Modelo Conceitual

**Caracterização da organização**

- **Nome e natureza da organização:** Lanchonete **MAXfood**, estabelecimento comercial de alimentação com fins lucrativos, localizado dentro da UNICID — Universidade Cidade de São Paulo, Campus Tatuapé.
- **Contexto e porte:** Organização de pequeno porte. Funciona das **10h às 22h**. Possui **2 funcionários**: um no atendimento e outro na cozinha. A média é de **45 a 50 clientes por dia**, podendo chegar a **60** em dias de maior movimento. O volume estimado é de aproximadamente **1.200 a 1.500 pedidos por mês**.
- **Problemas e necessidades identificados (Crise Operacional):**
  - **P1 (Ruptura de Estoque):** Falta de controle sistemático gera falta de insumos, principalmente refrigerantes e bebidas.
  - **P2 (Desorganização de Pedidos):** Pedidos por WhatsApp/telefone são anotados manualmente em cadernos ou planilhas soltas, gerando risco de perda de informações.
  - **P3 (Perdas de Perecíveis):** Prejuízos eventuais com alimentos que não foram salvos e venceram, pois não há controle de validade.
  - **P4 (Fechamento de Caixa Manual):** Dificuldade em consolidar as diferentes formas de pagamento ao final do dia.
- **Escopo do sistema:** O banco de dados reunirá todos os dados da organização: fornecedores, compras/reposição, produtos, controle de estoque (entradas, saídas, perdas), funcionários, pedidos, itens, combos, acompanhamentos, pagamentos e fechamento de caixa.
- **Justificativa da escolha:** A MAXfood é uma organização real, acessível ao grupo, com processos claros e porte adequado para modelagem. A ausência de um sistema informatizado a torna um caso ideal para a aplicação dos conceitos de modelagem.
- **Evidências da organização:** Fotos do local e do cardápio anexadas ao repositório; Perfil no Google Maps e Instagram. Endereço: UNICID - Campus Tatuapé. 
- **Responsável pela organização:** Rafael Novais — Telefone: 11913433270.

**Relato da entrevista**

- **Quem:** Entrevista realizada com o responsável, Rafael Novais. Participação dos integrantes do grupo.
- **Quando e onde:** Realizada presencialmente no ambiente da organização (UNICID - Tatuapé), com comprovação via foto anexada no repositório (`levantamento/foto_entrevista.jpg`).
- **O que foi levantado (e observação presencial):** Durante a observação, notou-se que o estoque de bebidas é mantido em geladeiras separadas (estoque de amostra) e em um depósito nos fundos (estoque interno). Foi confirmado que não há cadastro de clientes e que a venda fiada é rara. O levantamento completo está detalhado no arquivo `levantamento/levantamento.md`.

**Processos de negócio**

1. **Vendas e Atendimento:** Pedidos no balcão, WhatsApp ou telefone; montagem de combos; escolha de acompanhamentos (até 3) e coberturas; aplicação de desconto UNICID; pagamento (débito, crédito, Pix, dinheiro); cancelamento de pedidos (antes da entrega).
2. **Compras e Recebimento:** Identificação de estoque mínimo; pedido de reposição ao fornecedor; recebimento de mercadoria com conferência e entrada no estoque.
3. **Apoio e Gestão de Estoque:** Contagem diária; registro de perdas de perecíveis; controle de validade; fechamento de caixa diário.
- *Processos não incluídos:* Emissão de nota fiscal (a lanchonete não emite e não repassa ao cliente) e cadastro de clientes (não é prática da organização).

**Requisitos do Sistema**

- **Requisitos Funcionais (RF):**
  - RF01 a RF16: *(Mantidos da E1: cadastro de fornecedores, produtos, movimentações, pedidos, prato do dia, combos, acompanhamentos, descontos)*.
  - RF17: O sistema deve permitir registrar pedidos de compra/reposição de fornecedores.
  - RF18: O sistema deve permitir registrar o recebimento de mercadorias e a entrada no estoque.
  - RF19: O sistema deve permitir registrar perdas de perecíveis (descarte).
  - RF20: O sistema deve permitir o cancelamento de pedidos com registro de justificativa.
  - RF21: O sistema deve permitir gerar o relatório de fechamento de caixa diário agrupado por forma de pagamento.
- **Requisitos Não Funcionais (RNF):**
  - RNF01 a RNF08: *(Mantidos da E1: usabilidade, disponibilidade, desempenho, segurança, integridade, backup, compatibilidade, privacidade)*.

**Regras de Negócio**

- **RN01:** Desconto de R$ 2,00 para funcionários da UNICID, mediante comprovação.
- **RN02:** O prato do dia é sempre um item do cardápio e muda diariamente.
- **RN03:** Formas de pagamento: Débito, Crédito, Pix e Dinheiro.
- **RN04:** Fiado só com autorização do dono (status pendente).
- **RN05:** Reposição antecipada quando o estoque atingir o mínimo.
- **RN06:** Contagem diária de estoque.
- **RN07:** Estoque de amostra (geladeira/vitrine) x Estoque interno (depósito).
- **RN08:** Até 3 acompanhamentos por refeição; coberturas apenas para batatas e sanduíches.
- **RN09 (Nova):** Produtos perecíveis vencidos devem ser descartados e registrados como perda.
- **RN10 (Nova):** Pedidos só podem ser cancelados se o status for "Aberto" ou "Em preparo".
- **RN11 (Nova):** A lanchonete não emite nota fiscal; o comprovante é o cupom não fiscal.

**Notação do DER conceitual (Caso A)**

O DER foi criado no software **brModelo Web**.

*Tabela de Correções (Apontamentos da E1):*

| Apontamento da correção da E1 | O que mudou no trabalho | Por quê |
| :--- | :--- | :--- |
| Identificadores não marcados (círculos vazios) | Todos os identificadores (chaves) foram preenchidos com círculo preto. | Para diferenciar atributos comuns de chaves primárias no modelo conceitual. |
| Fornece (1,1) do lado de FORNECEDOR | Alterado para (0,1) do lado de FORNECEDOR. | Nem toda movimentação de estoque (ex: saída, ajuste, perda) tem um fornecedor associado. |
| Registra (1,n) do lado de PEDIDO | Alterado para (0,n) do lado de PEDIDO. | Permite cadastrar um funcionário que ainda não registrou nenhum pedido. |
| Atributo id_funcionario com "(0, n)" | A cardinalidade foi removida do atributo. | Atributos simples não possuem cardinalidade no brModelo. |
| Divergências (Pagamento, Pedido, Fornecedor) | Atributos faltantes adicionados no DER (ex: forma pagamento, data, contato, email). | Para garantir que o DER reflita exatamente o Dicionário de Dados. |
| Ausência de processo de Compras | Criada a entidade `PEDIDO_COMPRA` e `ITEM_COMPRA`. | Para cobrir o processo de reposição de estoque e resolver o P1. |
| Ausência de fechamento e perdas | Criada entidade `FECHAMENTO_CAIXA` e adicionado tipo "Perda" em `ESTOQUE_MOVIMENTACAO`. | Para cobrir as regras RN09 e o problema P4. |

### 1.2 Conversão do Modelo Conceitual para o Modelo Lógico

- **Entidades → Tabelas:** Cada retângulo (ex: `PRODUTO`, `PEDIDO`) tornou-se uma tabela.
- **Atributos → Colunas:** Os atributos simples tornaram-se colunas. O atributo multivalorado foi convertido em tabelas filhas (ex: itens).
- **Relacionamentos → Chaves:** Relacionamentos 1:N foram convertidos pela migração da chave primária do lado 1 para o lado N como chave estrangeira (ex: `CD_FORNECEDOR` em `ESTOQUE_MOVIMENTACAO`). Relacionamentos N:N foram convertidos em tabelas associativas (ex: `ITEM_PEDIDO`, `COMBO_ITEM`).
- **Cardinalidades:** As cardinalidades (0,1) foram implementadas permitindo `NULL` nas FKs (ex: `CD_FORNECEDOR` na movimentação). As cardinalidades (1,1) e (1,n) foram implementadas com `NOT NULL`.
- **Generalização/Especialização:** O modelo não possui herança, portanto, todas as entidades são tabelas independentes.

### 1.3 Definição de Chaves Primárias e Estrangeiras

| Tabela | Chave Primária (PK) | Chaves Estrangeiras (FK) |
| :--- | :--- | :--- |
| FUNCIONARIO | CD_FUNCIONARIO | - |
| FORNECEDOR | CD_FORNECEDOR | - |
| PRODUTO | CD_PRODUTO | - |
| ESTOQUE_MOVIMENTACAO | CD_MOVIMENTACAO | CD_PRODUTO; CD_FORNECEDOR (opcional) |
| PEDIDO_COMPRA | CD_PEDIDO_COMPRA | CD_FORNECEDOR |
| ITEM_COMPRA | CD_ITEM_COMPRA | CD_PEDIDO_COMPRA; CD_PRODUTO |
| PEDIDO | CD_PEDIDO | CD_FUNCIONARIO |
| ITEM_PEDIDO | CD_ITEM | CD_PEDIDO; CD_PRODUTO |
| PAGAMENTO | CD_PAGAMENTO | CD_PEDIDO |
| PRATO_DO_DIA | CD_PRATO_DIA | CD_PRODUTO |
| COMBO_ITEM | CD_COMBO_ITEM | CD_PRODUTO_COMBO; CD_PRODUTO_ITEM |
| ACOMPANHAMENTO | CD_ACOMPANHAMENTO | - |
| ITEM_PEDIDO_ACOMP | CD_ITEM; CD_ACOMPANHAMENTO | CD_ITEM; CD_ACOMPANHAMENTO |
| FECHAMENTO_CAIXA | CD_FECHAMENTO | - |

### 1.4 Processo de Normalização (1FN, 2FN e 3FN)

- **1FN (Atomicidade):** Eliminamos grupos repetitivos ao criar as tabelas `ITEM_PEDIDO` e `ITEM_COMPRA`. Um pedido não armazena os produtos em uma única coluna de texto, mas sim em linhas separadas na tabela filha.
- **2FN (Dependência Parcial):** Na tabela `ITEM_PEDIDO`, os atributos `QT_ITEM` e `VL_UNITARIO` dependem exclusivamente da chave primária `CD_ITEM` (que é composta na origem, mas gerada como ID único). Se a PK fosse composta por `CD_PEDIDO` + `CD_PRODUTO`, o preço dependeria do produto, não do pedido, gerando dependência parcial. A criação do `CD_ITEM` resolve isso.
- **3FN (Dependência Transitiva):** Não há atributos não-chave dependendo de outros atributos não-chave. Por exemplo, o nome do fornecedor não é guardado na tabela `ESTOQUE_MOVIMENTACAO`, apenas o seu ID. A tabela `PAGAMENTO` foi separada de `PEDIDO` para evitar dependências transitivas (um pedido pode ter mais de um pagamento).

### 1.5 Justificativas Técnicas das Decisões

- **Chaves Primárias:** Optou-se por chaves artificiais (surrogadas) no padrão `CD_` (ex: `CD_PEDIDO` do tipo `INT AUTO_INCREMENT`) para garantir estabilidade. Dados naturais (como CNPJ ou Telefone) podem mudar ou conter erros de digitação.
- **Chaves Estrangeiras:** Implementam os relacionamentos e garantem a integridade referencial. A `FK` em `ESTOQUE_MOVIMENTACAO` para `FORNECEDOR` é opcional (`NULL`) porque atende à regra de negócio de que saídas e ajustes (RN09) não possuem fornecedor.
- **Restrições (Constraints):**
  - `UNIQUE` em `NR_CNPJ` (FORNECEDOR) para evitar duplicidade.
  - `CHECK (QT_ESTOQUE >= 0)` em `PRODUTO` para garantir integridade física do estoque.
  - `CHECK (TP_MOVIMENTACAO IN ('Entrada', 'Saída', 'Ajuste', 'Perda'))` para garantir a RN09.
  - `DEFAULT CURRENT_TIMESTAMP` em `DT_PEDIDO` para registrar o momento exato automaticamente.
- **Decisões Arquiteturais:** A entidade `CLIENTE` foi intencionalmente omitida, conforme levantamento. Os dados do cliente (nome e telefone) são atributos opcionais de `PEDIDO`. A entidade `PEDIDO_COMPRA` foi adicionada para cobrir o processo de reposição de estoque (P1).

### 1.6 Proposta de Arquitetura Analítica para BI e IA

**Indicadores e KPIs:**
- **KPI01 (Ticket Médio):** Média do valor gasto por cliente. Ajuda a avaliar promoções.
- **KPI02 (Ruptura de Estoque):** Quantidade de produtos abaixo do estoque mínimo.
- **KPI03 (Faturamento por Canal):** Comparar balcão vs WhatsApp.
- **KPI04 (Taxa de Perdas):** Valor financeiro descartado por validade.
- **KPI05 (Mix de Pagamento):** Percentual de uso de Pix vs Cartão.

**Aplicações Analíticas e de IA:**
- **Previsão de Demanda:** Utilizar o histórico de `ITEM_PEDIDO` e `DT_PEDIDO` para prever quais lanches venderão mais em dias de semana (para evitar P3).
- **Alerta Preditivo de Estoque:** IA que avisa com 2 dias de antecedência sobre a necessidade de pedido de reposição, em vez de esperar o estoque mínimo.

**Rastreabilidade:**

| Problema ou KPI | Tabelas envolvidas | Consulta no script |
| :--- | :--- | :--- |
| P1 - Ruptura de bebidas (KPI02) | PRODUTO | G01 |
| P2 - Desorganização de pedidos | PEDIDO, ITEM_PEDIDO | G02 |
| P3 - Perdas de perecíveis (KPI04) | ESTOQUE_MOVIMENTACAO | G03 |
| P4 - Fechamento de caixa (KPI05) | PAGAMENTO, FECHAMENTO_CAIXA | G04 |
| KPI01 - Ticket Médio | PEDIDO | G05 |

---

## 6. Uso de Inteligência Artificial

| Item | O que registrar |
| :--- | :--- |
| **Ferramenta e etapa** | **DeepSeek**. Utilizada na etapa de (1) reestruturação do README para a Entrega 2 e (2) revisão dos processos de negócio e cobertura de regras conforme apontamentos da Entrega 1. |
| **Motivação** | O grupo precisava adequar o modelo conceitual à luz dos feedbacks do professor (inserir processos de compras, corrigir cardinalidades no DER e adicionar regras de perdas/cancelamento) de forma ágil e estruturada. |
| **Prompt(s) utilizados** | 1) "Deepseek, preciso fazer a segunda entrega de uma atividade... A primeira entrega já foi feita e esse foi a explicação do passo a passo... Esse é um texto do professor corrigindo a entrega 1 falando o que tem que ser feito... Me ajude a fazer com essa explicação." |
| **Resposta recebida** | A IA sugeriu a inclusão das entidades `PEDIDO_COMPRA` e `FECHAMENTO_CAIXA`, a alteração do tipo de movimentação para incluir 'Perda', a correção da cardinalidade de `FORNECEDOR` para (0,1) e gerou a estrutura completa deste README. |
| **Fontes consultadas e verificadas** | As sugestões foram confrontadas com o DER original, o Dicionário de Dados HTML e as anotações de campo. A validação do fluxo de compras foi feita mentalmente simulando a rotina da lanchonete. |
| **Trechos rejeitados ou corrigidos** | A IA sugeriu criar uma entidade `CLIENTE` para resolver o problema do fiado, mas isso foi rejeitado pois contraria a entrevista (a MAXfood não cadastra clientes). A IA também sugeriu colocar a data de validade como atributo do produto, mas alteramos para que a data de validade seja registrada na entrada do lote (`ESTOQUE_MOVIMENTACAO`) para ser mais realista. |
| **Justificativa da escolha final** | O texto foi mantido e ajustado pois atende perfeitamente aos critérios do professor: cobre 100% dos processos prováveis, resolve os problemas declarados e detalha as consultas gerenciais para BI. |
| **Reflexão crítica** | A IA foi excelente para organizar o caos pós-correção, mas ainda tende a propor soluções "empresariais" genéricas (como cadastro de clientes e nota fiscal) que não se aplicam ao micro-negócio. O grupo precisou filtrar e manter o escopo fiel ao porte da MAXfood. |

---

*Nota: O script SQL, a massa de dados e o modelo lógico estão nos respectivos arquivos no repositório (`docs/script.sql`, `docs/massa_dados.sql` e `Modelo_Logico.png`).*
