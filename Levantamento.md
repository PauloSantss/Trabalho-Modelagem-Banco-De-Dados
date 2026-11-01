# Levantamento de Requisitos — GCaccessories

## 1. Identificação da empresa

|    Inf             | Descrição                                                                        |
| ----------------------------- | -------------------------------------------------------------------------------- |
| Nome da empresa               | GCaccessories                                                                    |
| Área de atuação               | Comércio de acessórios e peças e assistência técnica em celulares e computadores |
| Localização                   | Jardim Caçula, Ribeirão Pires – SP                                               |
| Responsável entrevistado      | Proprietário da empresa                                                          |
| Responsável pelo levantamento | Paulo Henrique Oliveira dos Santos                                               |
| Data da entrevista            | 18/09/2026                                                                       |
| Modalidade                    | Entrevista individual                                                            |
| Local da entrevista           | Fora das dependências da empresa                                                 |

## 2. Caracterização da empresa

A GCaccessories é uma empresa que atua no comércio de acessórios e peças tecnológicas, além de oferecer serviços de assistência técnica para celulares e computadores.

Entre os produtos comercializados estão capinhas, películas, carregadores, cabos, fones de ouvido, caixas de som e peças utilizadas em reparos.

Na área de assistência técnica, a empresa realiza serviços como substituição de telas, baterias e outros componentes, atendendo tanto aparelhos celulares quanto computadores.

A empresa possui uma equipe de cinco funcionários, distribuídos entre as seguintes funções:

- Proprietário e gerente, que também realiza serviços de assistência técnica.
- Atendente responsável pelo atendimento aos clientes.
- Técnico especializado em celulares.
- Técnico especializado em computadores.
- Auxiliar responsável pelo estoque e apoio no atendimento.

A empresa atende principalmente pessoas físicas, mas também possui clientes corporativos.

Segundo estimativas informadas pelo entrevistado, são realizadas aproximadamente de 10 a 50 vendas por dia e de 3 a 10 ordens de serviço diariamente. Esses números são estimativas fornecidas durante a entrevista, não dados oficiais de movimentação.

## 3. Metodologia do levantamento

O levantamento de requisitos foi realizado por meio de uma entrevista individual com o proprietário da GCaccessories, em 18 de setembro de 2026.

Foi preparado um conjunto de 20 perguntas para compreender os processos internos da empresa, identificar dificuldades e levantar informações necessárias para o desenvolvimento do banco de dados.

Foram recuperados 15 registros de perguntas e respostas. As informações apresentadas neste documento estão organizadas como resumos das respostas fornecidas pelo entrevistado, não como transcrições literais.

A entrevista foi realizada fora das dependências da empresa. Portanto, este levantamento não deve ser interpretado como resultado de uma observação presencial dos processos internos.

## 4. Informações obtidas na entrevista

### 4.1. Funcionamento e estrutura da empresa

A empresa trabalha com comércio de acessórios e peças tecnológicas e também realiza serviços de assistência técnica em celulares e computadores.

A equipe possui cinco funcionários, incluindo o proprietário, que também participa das atividades técnicas.

Cada funcionário possui seu próprio acesso ao sistema. Entretanto, somente o proprietário deve ter permissão para consultar relatórios financeiros e realizar alterações nos preços dos produtos.

### 4.2. Cadastro de clientes

A empresa atende pessoas físicas e jurídicas.

Para o cadastro de clientes, são utilizadas informações como:

- Nome ou razão social.
- CPF ou CNPJ.
- Telefone.
- E-mail.
- Endereço.

O CPF ou CNPJ é utilizado para identificação do cliente.

Um mesmo cliente pode possuir vários aparelhos e realizar diferentes atendimentos ao longo do tempo.

### 4.3. Aparelhos e ordens de serviço

Quando um cliente deixa um aparelho para assistência técnica, é aberta uma ordem de serviço.

O processo normalmente segue estas etapas:

1. O cliente entrega o aparelho.
2. O atendente registra a entrada e as informações do equipamento.
3. O técnico realiza o diagnóstico.
4. É elaborado um orçamento.
5. O cliente aprova ou recusa o orçamento.
6. Caso aprovado, o serviço é realizado.
7. O cliente é informado quando o aparelho está pronto.
8. O cliente realiza o pagamento e retira o equipamento.

Cada ordem de serviço possui uma identificação própria.

Entre as informações relevantes do aparelho e do atendimento estão:

- Marca e modelo do aparelho.
- IMEI ou número de série, quando aplicável.
- Defeito relatado pelo cliente.
- Estado físico do equipamento.
- Acessórios deixados junto ao aparelho.
- Serviços realizados.
- Peças utilizadas.

Uma ordem de serviço pode envolver mais de um serviço e mais de uma peça. Normalmente, um técnico realiza o atendimento, mas pode haver participação de outros profissionais.

### 4.4. Orçamentos e garantias

O orçamento possui validade de sete dias.

O diagnóstico é gratuito. Caso o cliente não aprove o orçamento e nenhum reparo tenha sido realizado, poderá retirar o aparelho sem cobrança.

Quando o reparo é autorizado e executado, o pagamento é devido.

A garantia das peças segue os prazos e as condições estabelecidos pelos respectivos fabricantes.

As condições específicas de garantia dos serviços ainda precisam ser detalhadas com o responsável pela empresa.

### 4.5. Produtos e estoque

Os produtos são organizados por categorias, marcas e códigos internos.

Entre os exemplos de categorias estão:

- Capinhas.
- Películas.
- Carregadores.
- Cabos.
- Fones de ouvido.
- Peças para manutenção.

A compatibilidade entre acessórios, peças e modelos de aparelhos é uma informação importante. Um mesmo produto pode ser compatível com diferentes modelos de celulares.

O estoque é compartilhado entre os produtos vendidos no balcão e as peças utilizadas nos serviços de assistência técnica.

A empresa precisa controlar a quantidade disponível e estabelecer quantidades mínimas para identificar a necessidade de reposição.

Quando uma peça necessária não está disponível, ela pode ser solicitada a um fornecedor. Após a chegada, pode ser reservada para determinado atendimento.

### 4.6. Fornecedores e compras

A empresa trabalha com diferentes fornecedores.

Um fornecedor pode comercializar diversos produtos, e um mesmo produto pode ser adquirido de fornecedores diferentes.

As informações relevantes para o controle das compras incluem:

- Dados do fornecedor.
- CNPJ.
- Informações de contato.
- Nota fiscal.
- Data da compra.
- Produtos adquiridos.
- Quantidades.
- Valores de compra.

O registro dessas informações permite acompanhar o histórico de aquisição dos produtos e os custos envolvidos.

### 4.7. Vendas e pagamentos

As vendas podem ocorrer diretamente no balcão, sem a obrigatoriedade de cadastrar o cliente. Entretanto, o cadastro é preferível quando o cliente aceita fornecer seus dados.

Uma venda pode conter vários produtos.

As formas de pagamento aceitas são:

- Dinheiro.
- Pix.
- Cartão de débito.
- Cartão de crédito, com possibilidade de parcelamento em até três vezes.

Uma mesma venda pode ser paga utilizando mais de uma forma de pagamento.

A empresa fornece recibo das vendas e emite nota fiscal quando solicitada.

Nas ordens de serviço, normalmente é solicitado um adiantamento de aproximadamente 50% do valor, mas essa condição não é obrigatória. O restante costuma ser pago na retirada do aparelho.

### 4.8. Controle financeiro e fechamento de caixa

No fechamento do caixa, são conferidos os valores recebidos em dinheiro, Pix e cartões.

O controle considera o valor inicial do caixa e o valor final, permitindo comparar os valores registrados com os recebimentos efetivamente realizados.

### 4.9. Trocas de produtos

Para realizar uma troca, o cliente precisa apresentar o comprovante da compra.

O cliente escolhe outro produto e, caso o novo item tenha valor superior, paga a diferença.

Se o produto devolvido tiver valor maior que o novo produto escolhido, a diferença é devolvida em dinheiro.

A empresa não trabalha com crédito para utilização em compras futuras nesses casos.

### 4.10. Relatórios e dificuldades atuais

O proprietário demonstrou interesse em consultar informações que facilitem o acompanhamento das atividades da empresa, como:

- Vendas por período.
- Produtos com estoque baixo.
- Ordens de serviço em aberto.
- Produtividade dos técnicos.
- Resultados das vendas e dos serviços.

Atualmente, parte das informações é controlada por meio de cadernos e planilhas.

Entre as dificuldades identificadas estão falhas no controle de estoque, perda de informações e dificuldades para consultar dados comerciais de maneira organizada.

O objetivo do novo sistema é centralizar essas informações e facilitar o acompanhamento das operações.

## 5. Principais processos identificados

| Processo             | Descrição                                                        |
| -------------------- | ---------------------------------------------------------------- |
| Cadastro de clientes | Registro e consulta das informações dos clientes.                |
| Cadastro de produtos | Organização dos produtos por categoria, marca e compatibilidade. |
| Controle de estoque  | Registro das entradas, saídas e quantidades disponíveis.         |
| Compras              | Registro das aquisições realizadas com fornecedores.             |
| Vendas               | Registro das vendas e dos respectivos itens.                     |
| Pagamentos           | Controle dos valores recebidos e das formas de pagamento.        |
| Assistência técnica  | Abertura e acompanhamento das ordens de serviço.                 |
| Trocas               | Registro dos produtos devolvidos e dos novos produtos entregues. |
| Fechamento de caixa  | Conferência dos valores recebidos durante o expediente.          |
| Relatórios           | Consulta de informações comerciais e operacionais.               |

## 6. Problemas identificados e prioridades

A partir das informações obtidas na entrevista, foram identificadas duas prioridades principais.

### P1 — Controle de estoque

A principal necessidade identificada é melhorar o controle do estoque.

A utilização de controles manuais pode gerar divergências entre as quantidades registradas e as quantidades realmente disponíveis.

Essas divergências podem ocasionar vendas de produtos indisponíveis, perda de oportunidades de venda e dificuldades para identificar o momento correto de realizar novas compras.

O sistema deverá permitir o acompanhamento das entradas e saídas, a consulta das quantidades disponíveis e a identificação de produtos com estoque abaixo do mínimo estabelecido.

### P2 — Organização e consulta das informações comerciais

Outra necessidade identificada é centralizar e organizar as informações relacionadas às vendas, compras, clientes e ordens de serviço.

A consulta dessas informações deverá ser facilitada por meio de registros organizados e relatórios que auxiliem o proprietário no acompanhamento das atividades.

## 7. Escopo proposto para o sistema

Com base nas necessidades identificadas, o projeto prevê os seguintes módulos:

| Módulo            | Funcionalidades previstas                                                  |
| ----------------- | -------------------------------------------------------------------------- |
| Clientes          | Cadastro e consulta de clientes pessoas físicas e jurídicas.               |
| Funcionários      | Cadastro de funcionários e identificação dos responsáveis pelas operações. |
| Produtos          | Cadastro de acessórios e peças, categorias, marcas e compatibilidade.      |
| Estoque           | Controle de entradas, saídas, quantidades e estoque mínimo.                |
| Fornecedores      | Cadastro e consulta de fornecedores.                                       |
| Compras           | Registro de compras e itens adquiridos.                                    |
| Vendas            | Registro de vendas e respectivos produtos.                                 |
| Pagamentos        | Registro de pagamentos e diferentes formas de recebimento.                 |
| Aparelhos         | Cadastro dos equipamentos recebidos para assistência.                      |
| Ordens de serviço | Abertura, acompanhamento e conclusão dos atendimentos técnicos.            |
| Serviços          | Cadastro dos serviços realizados pela assistência técnica.                 |
| Trocas            | Registro de devoluções e substituições de produtos.                        |
| Caixa             | Registro de fechamentos e conferência dos valores recebidos.               |
| Relatórios        | Consultas comerciais e operacionais.                                       |

O escopo foi definido considerando as necessidades informadas pelo responsável e os objetivos acadêmicos do projeto.

## 8. Segurança e informações sensíveis

Durante a entrevista, foi informado que, em algumas situações, pode ser necessário solicitar a senha ou o padrão de desbloqueio do aparelho para realizar testes ou determinados procedimentos técnicos.

Entretanto, essa informação é sensível e não deve ser armazenada sem necessidade no banco de dados do projeto.

A proposta é priorizar a proteção das informações dos clientes e restringir o acesso aos dados conforme as responsabilidades de cada funcionário.

Quando houver necessidade de acesso ao aparelho, deverão ser observados os cuidados de autorização, utilização e proteção das informações pessoais.

## 9. Evidências do levantamento

O levantamento foi realizado por meio de entrevista individual com o proprietário da GCaccessories em 18/09/2026.

As evidências complementares, como fotografias autorizadas e outros registros relacionados à entrevista, serão adicionadas posteriormente a este projeto.

**Observação:** não foi realizada observação presencial das atividades internas da empresa, pois a entrevista ocorreu fora de suas dependências.

## 10. Pontos que ainda precisam de confirmação

Algumas informações precisam ser detalhadas antes da definição final do modelo do banco de dados:

- Quais são exatamente as condições e os prazos de garantia dos serviços de assistência técnica?
- Em qual momento o estoque deve ser atualizado durante uma venda?
- Em qual momento as peças utilizadas em uma ordem de serviço devem ser retiradas do estoque?
- Como devem ser registradas as vendas canceladas e as ordens de serviço canceladas?
- Como será realizado o controle de peças reservadas para determinadas ordens de serviço?
- Quais informações adicionais devem ser registradas em cada fechamento de caixa?
- O proprietário autoriza a divulgação de seus dados de contato no relatório acadêmico?
- Quais fotografias da empresa podem ser utilizadas como evidências no trabalho

Esses pontos serão considerados durante a elaboração e validação do modelo conceitual e lógico.

## 11. Conclusão do levantamento

O levantamento permitiu compreender as principais atividades da GCaccessories, incluindo o comércio de acessórios e peças, o controle de estoque, as compras, as vendas e os serviços de assistência técnica.

A entrevista também possibilitou identificar as principais necessidades da empresa, com destaque para o controle de estoque e a organização das informações comerciais.

Com base nas informações obtidas, será possível elaborar o modelo conceitual do banco de dados, identificar as entidades e seus relacionamentos e, posteriormente, desenvolver o modelo lógico e a implementação em MySQL.

## 12. Utilização de Inteligência Artificial no levantamento de requisitos

Durante a preparação do levantamento de requisitos da GCaccessories, foi utilizada a ferramenta ChatGPT, desenvolvida pela OpenAI, como apoio na elaboração das perguntas para a entrevista com o responsável pela empresa.

A ferramenta foi utilizada com o objetivo de sugerir perguntas que ajudassem a compreender o funcionamento da empresa, identificar suas necessidades e levantar informações importantes para a construção do banco de dados, incluindo possíveis entidades, atributos, relacionamentos, regras de negócio e funcionalidades do sistema.

A maior parte das perguntas utilizadas na preparação da entrevista foi elaborada com o auxílio da Inteligência Artificial. As sugestões foram utilizadas como referência e adaptadas conforme a necessidade do levantamento.

### 12.1. Ferramenta utilizada

- **Ferramenta:** ChatGPT.
- **Desenvolvedor:** OpenAI.
- **Finalidade:** Auxiliar na elaboração de perguntas para a entrevista e orientar a identificação dos requisitos do sistema.

### 12.2. Prompt utilizado

O prompt enviado à ferramenta foi:

> Vou entrevistar uma empresa que vende acesorios tecnologicos e que faz assistencias tecnicas com o intuito de criar um banco de dados para o sistema da empresa para que possa ser ultilizado no dia a dia. Me envie 10 Perguntas que podem ser ultilizadas nessa entrevista para que eu possa levantar requisitos e identificar entidades, Regras de negocios e que me ajude a criar diagramas para o projeto tambem.

### 12.3. Exemplos de perguntas utilizadas na entrevista

Entre as perguntas utilizadas com o auxílio da ferramenta, destacam-se:

**Assistência técnica**

- **Pergunta 5:** Que informações são registradas na entrada do aparelho (marca, modelo, IMEI ou número de série, defeito relatado, estado físico, acessórios deixados)? Cada atendimento gera uma ordem de serviço com número próprio?
- **Pergunta 6:** Uma ordem de serviço pode ter mais de um serviço e mais de uma peça usada? Um mesmo técnico faz tudo ou várias pessoas podem atuar na mesma ordem?
- **Pergunta 7:** Como funcionam orçamento e garantia? O cliente pode recusar o orçamento? Qual o prazo de garantia e o que acontece se o aparelho volta com o mesmo defeito?

**Produtos e estoque**

- **Pergunta 9:** Como vocês organizam os produtos (categorias, marca, modelo compatível, código ou SKU)? A mesma peça pode servir para vários modelos de aparelho?
- **Pergunta 10:** Como é feito o controle de estoque? Existe quantidade mínima para alerta, e as peças usadas em reparos saem do mesmo estoque das peças vendidas no balcão?

**Fornecedores e compras**

- **Pergunta 11:** Como vocês compram peças e acessórios? Um fornecedor vende vários produtos e um mesmo produto pode vir de vários fornecedores? Quais dados do fornecedor e da compra (nota fiscal, data, valor) são guardados?

**Vendas e pagamentos**

- **Pergunta 12:** Como é o processo de uma venda? Uma venda pode ter vários itens e é sempre associada a um cliente cadastrado, ou pode ser avulsa?
- **Pergunta 13:** Quais formas de pagamento vocês aceitam (dinheiro, Pix, cartão, parcelamento, fiado)? Um pagamento pode ser dividido em mais de uma forma? Vocês emitem nota fiscal ou recibo?

**Regras, relatórios e futuro**

- **Pergunta 14:** Quais relatórios ou consultas você precisa ver com frequência (vendas por período, estoque baixo, ordens em aberto, desempenho por técnico, lucro)?
- **Pergunta 15:** Hoje como as informações são controladas (papel, planilha, outro sistema)? Quais são os maiores problemas e o que você gostaria que o novo sistema resolvesse, incluindo possíveis necessidades futuras como venda online ou mais de uma unidade?

### 12.4. Validação e responsabilidade sobre as informações

As perguntas sugeridas pela Inteligência Artificial serviram como apoio para a preparação e realização da entrevista. Entretanto, as informações sobre o funcionamento da GCaccessories foram obtidas por meio das respostas fornecidas pelo responsável pela empresa.

Após a entrevista, as respostas foram organizadas e analisadas para identificar os processos, as necessidades, as entidades e as regras de negócio relevantes para o projeto.

A ferramenta não foi utilizada como fonte de informações sobre a empresa, mas como auxílio na estruturação do levantamento. A conferência das informações e as decisões sobre os requisitos e a modelagem do banco de dados ficaram sob responsabilidade do aluno.
