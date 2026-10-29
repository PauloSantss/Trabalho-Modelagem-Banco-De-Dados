GCaccessories --- Sistema de Gerenciamento de Loja
Repositório destinado à entrega das atividades da disciplina de
Modelagem de Banco de Dados.

O projeto tem como objetivo desenvolver um sistema de gerenciamento para
a GCaccessories, uma loja que comercializa acessórios para celulares e
computadores e também trabalha com manutenção de computadores. A
primeira versão do sistema prioriza o controle de produtos, estoque,
compras, vendas e cadastros auxiliares. O controle de ordens de serviço
de manutenção poderá ser considerado em uma etapa futura.
Integrante
- Paulo Henrique Oliveira dos Santos --- RGM: 47848430
Entrega 1 --- Modelo Conceitual
1. Caracterização da Organização
Nome e natureza da organização
A GCaccessories é uma loja que atua no comércio de acessórios para
celulares e computadores. Seu catálogo pode incluir produtos utilizados
para proteção, carregamento, conexão e complementação de dispositivos
eletrônicos. A loja também realiza serviços relacionados a computadores,
incluindo manutenção e suporte técnico.

Entre os produtos comercializados estão:
- Capinhas e películas para celulares;
- Cabos e carregadores;
- Fones de ouvido e caixas de som;
- Acessórios e periféricos para computadores;
- Outros produtos relacionados a celulares e computadores.
A loja trabalha com diferentes marcas e modelos de produtos. Por isso, é
importante controlar informações como preço de venda, quantidade
disponível, categoria, marca e, quando aplicável, compatibilidade com
modelos de celulares.
Contexto e porte
O projeto considera a realidade de uma pequena loja comercial que
utiliza um computador para auxiliar no atendimento e no gerenciamento
das operações.

Entre as principais atividades estão:
- Cadastro e consulta de produtos;
- Organização dos produtos por categorias e marcas;
- Controle das quantidades disponíveis em estoque;
- Registro de vendas;
- Registro de compras realizadas junto a fornecedores;
- Acompanhamento das entradas e saídas de produtos;
- Consulta de informações sobre fornecedores e funcionários;
- Comercialização de produtos e acessórios para computadores;
- Prestação de serviços de manutenção e suporte relacionados a
  computadores.
O sistema foi planejado inicialmente para utilização local, priorizando
simplicidade, facilidade de uso e organização das informações.
Problemas e necessidades identificados
O projeto considera dificuldades que podem ocorrer no controle manual de
produtos e estoque. A ausência de informações centralizadas pode
dificultar a identificação da quantidade real de cada produto disponível
e exigir consultas a diferentes controles para verificar preços,
categorias, marcas e compatibilidade.

Entre os problemas considerados estão:
- Divergências entre a quantidade registrada e a quantidade física de
  produtos;
- Dificuldade para identificar produtos com estoque baixo;
- Risco de registrar vendas de produtos indisponíveis;
- Necessidade de consultar informações em diferentes controles;
- Dificuldade para manter os cadastros organizados;
- Falta de integração entre as operações de compra, venda e
  movimentação de estoque.
Dessa forma, identificou-se a necessidade de desenvolver um sistema que
centralize os registros e permita acompanhar as operações de maneira
mais organizada.
Justificativa da escolha
A escolha desse cenário permite aplicar os conceitos de modelagem de
banco de dados em uma situação comercial concreta. Uma loja que
comercializa acessórios para celulares e computadores possui diferentes
tipos de produtos, categorias, marcas, fornecedores e operações de
compra e venda.

Essas características permitem identificar entidades, atributos,
relacionamentos, cardinalidades e regras de negócio relevantes para a
construção de um banco de dados. O controle de estoque exige que as
movimentações sejam relacionadas aos produtos correspondentes,
possibilitando acompanhar as entradas e saídas registradas no sistema.

A atividade de manutenção de computadores também faz parte da
caracterização da loja. Entretanto, para manter o escopo acadêmico
viável, a primeira versão priorizará o cadastro de produtos, o estoque e
as vendas. O controle de ordens de serviço de manutenção poderá ser
desenvolvido futuramente, caso haja tempo e necessidade.
Forma de acesso à organização
O cenário do projeto foi definido com base na proposta de desenvolver um
sistema para uma loja de acessórios para celulares e computadores que
também oferece manutenção de computadores. As informações e os
requisitos deverão ser conferidos conforme o levantamento realizado e as
necessidades efetivamente identificadas na organização considerada.
Evidências da organização
As evidências da pesquisa e do levantamento deverão ser adicionadas ao
repositório conforme forem disponibilizadas e validadas.

Não devem ser publicados dados pessoais, informações comerciais
confidenciais ou documentos privados sem autorização.
2. Processos de Negócio
Principais processos mapeados
O sistema considera inicialmente os processos relacionados ao cadastro
de produtos, controle de estoque, compras, vendas e gerenciamento dos
cadastros auxiliares. A manutenção de computadores é uma atividade da
loja, mas o gerenciamento de ordens de serviço não faz parte da
prioridade da primeira versão.
2.1. Cadastro de Produtos
- Cadastrar produtos;
- Informar nome, código identificador e preço de venda;
- Associar produtos às respectivas categorias;
- Informar marcas e modelos de celulares compatíveis, quando
  aplicável;
- Consultar e atualizar os dados dos produtos;
- Identificar produtos cadastrados.
2.2. Controle de Estoque
- Consultar a quantidade disponível de cada produto;
- Registrar entradas de mercadorias;
- Registrar saídas relacionadas às operações realizadas;
- Consultar o histórico de movimentações;
- Definir quantidades mínimas para os produtos;
- Identificar produtos que necessitam de reposição.
2.3. Processos de Compra
- Cadastrar fornecedores;
- Registrar compras de mercadorias;
- Associar cada compra ao fornecedor correspondente;
- Registrar os produtos e as quantidades adquiridas;
- Utilizar os registros de compra para apoiar o controle de entradas
  no estoque.
2.4. Processos de Venda
- Registrar vendas;
- Associar os produtos comercializados às respectivas vendas;
- Informar quantidades e preços dos itens vendidos;
- Consultar os registros das vendas;
- Utilizar as vendas registradas como referência para o controle de
  saídas de estoque.
2.5. Cadastros Auxiliares
- Cadastro de categorias;
- Cadastro de marcas;
- Cadastro de modelos de celulares;
- Cadastro de fornecedores;
- Cadastro de funcionários.
Esses cadastros permitem organizar as informações e estabelecer
relacionamentos entre os registros do sistema.
2.6. Manutenção de Computadores
A loja também realiza manutenção e serviços relacionados a computadores.
Essa atividade é registrada na caracterização da organização, mas o
controle de clientes, equipamentos, diagnósticos, ordens de serviço e
status de manutenção poderá ser incluído em uma versão futura, para
evitar ampliar excessivamente o escopo inicial.
Fluxogramas
Os fluxos operacionais previstos para o projeto incluem:

Fluxo de cadastro de produtos

Início → Cadastro do produto → Preenchimento dos dados → Validação das
informações → Registro do produto → Fim.

Fluxo de venda

Início → Seleção dos produtos → Informação das quantidades → Verificação
da disponibilidade → Registro da venda → Atualização do estoque → Fim.

Fluxo de compra

Início → Seleção do fornecedor → Registro da compra → Inclusão dos
produtos e quantidades → Confirmação da entrada → Atualização do estoque
→ Fim.

Fluxo de movimentação de estoque

Início → Identificação do produto → Registro da entrada ou saída →
Atualização da quantidade → Consulta do saldo atualizado → Fim.

Os fluxogramas deverão ser adicionados ao repositório como imagens ou
arquivos editáveis, conforme a documentação produzida.
3. Requisitos do Sistema
3.1. Requisitos Funcionais
Os requisitos funcionais descrevem as operações que o sistema deverá
permitir.

RF01 --- Cadastro de Produtos: permitir cadastrar produtos com
informações de identificação, descrição, preço de venda e demais
atributos definidos para o sistema.

RF02 --- Consulta de Produtos: permitir consultar e visualizar os
produtos cadastrados.

RF03 --- Atualização de Produtos: permitir alterar as informações
dos produtos existentes.

RF04 --- Organização por Categorias: permitir cadastrar categorias e
associá-las aos produtos correspondentes.

RF05 --- Cadastro de Marcas: permitir cadastrar marcas e
relacioná-las aos produtos.

RF06 --- Compatibilidade com Modelos: permitir cadastrar modelos de
celulares e registrar a compatibilidade dos acessórios quando aplicável.

RF07 --- Controle de Estoque: permitir consultar a quantidade
disponível de cada produto.

RF08 --- Movimentação de Estoque: permitir registrar entradas e
saídas de produtos, mantendo o histórico das movimentações.

RF09 --- Estoque Mínimo: permitir definir uma quantidade mínima para
os produtos e identificar aqueles que necessitam de reposição.

RF10 --- Cadastro de Fornecedores: permitir cadastrar e consultar os
fornecedores da loja.

RF11 --- Registro de Compras: permitir registrar compras de
mercadorias e associar os respectivos fornecedores.

RF12 --- Itens de Compra: permitir registrar os produtos e as
quantidades correspondentes a cada compra.

RF13 --- Registro de Vendas: permitir registrar as vendas realizadas
pela loja.

RF14 --- Itens de Venda: permitir associar produtos, quantidades e
preços aos respectivos registros de venda.

RF15 --- Validação de Disponibilidade: verificar se há quantidade
suficiente em estoque antes de confirmar uma venda.

RF16 --- Cadastro de Funcionários: permitir cadastrar e consultar os
funcionários relacionados à utilização do sistema.

RF17 --- Navegação entre Módulos: permitir acessar as diferentes
telas do sistema por meio do menu de navegação.

RF18 --- Consulta de Movimentações: permitir consultar os registros
de entradas e saídas de estoque.
3.2. Requisitos Não Funcionais
RNF01 --- Usabilidade: as telas deverão apresentar informações de
maneira clara e organizada, facilitando a utilização do sistema.

RNF02 --- Integridade: o sistema deverá preservar a consistência dos
registros e dos relacionamentos entre as entidades.

RNF03 --- Desempenho: as operações de consulta e atualização deverão
apresentar tempo de resposta adequado para o uso cotidiano da loja.

RNF04 --- Manutenibilidade: o código deverá ser organizado de forma
a facilitar correções e futuras ampliações.

RNF05 --- Responsividade: a interface deverá adaptar-se a diferentes
tamanhos de tela, incluindo computadores e dispositivos móveis.

RNF06 --- Disponibilidade Local: a aplicação deverá ser planejada
para utilização local, reduzindo a dependência de conexão com a internet
para as operações previstas.

RNF07 --- Segurança: informações de configuração e credenciais
deverão ser protegidas, evitando sua exposição desnecessária no
código-fonte público.

RNF08 --- Integridade Referencial: os relacionamentos entre as
tabelas deverão respeitar as restrições definidas no modelo lógico e no
banco de dados.

RNF09 --- Organização: os módulos deverão seguir uma estrutura
consistente de navegação, apresentação e tratamento das informações.

RNF10 --- Evolução: a estrutura deverá permitir a inclusão de novos
módulos e funcionalidades sem exigir a reformulação completa do projeto.
4. Regras de Negócio
As regras de negócio definem condições que deverão ser respeitadas
durante as operações realizadas pelo sistema.
Regras operacionais
RN01 --- Identificação de Produtos: cada produto deverá possuir um
identificador único, como um código interno ou SKU.

RN02 --- Categoria: cada produto deverá estar associado a uma
categoria válida.

RN03 --- Marca: quando informada, a marca deverá corresponder a um
registro válido no cadastro de marcas.

RN04 --- Modelo Compatível: produtos que dependam de compatibilidade
com celulares deverão permitir registrar os modelos correspondentes.

RN05 --- Preço de Venda: o preço de venda deverá ser informado como
um valor válido, não negativo.

RN06 --- Quantidade em Estoque: as quantidades registradas deverão
respeitar as regras de movimentação e os limites definidos para cada
operação.

RN07 --- Venda: uma venda deverá possuir pelo menos um item válido
para ser confirmada.

RN08 --- Disponibilidade: uma venda não deverá ser confirmada quando
a quantidade solicitada superar o estoque disponível.

RN09 --- Movimentação: toda movimentação registrada deverá estar
associada ao produto correspondente e possuir uma quantidade válida.

RN10 --- Compra: uma compra deverá estar vinculada a um fornecedor
previamente cadastrado.

RN11 --- Itens de Compra: os itens de uma compra deverão referenciar
produtos existentes.

RN12 --- Itens de Venda: os itens de uma venda deverão referenciar
produtos existentes.

RN13 --- Atualização do Estoque: as entradas e saídas confirmadas
deverão refletir-se no controle de estoque, evitando inconsistências
entre as operações e os saldos registrados.

RN14 --- Histórico: as movimentações de estoque deverão manter
registros suficientes para identificar o produto, a operação, a
quantidade e a data correspondente.

RN15 --- Exclusão de Registros: registros relacionados a operações
já realizadas deverão ser tratados de forma a preservar a integridade e
o histórico do sistema.
Restrições organizacionais
RO01 --- Consistência dos Cadastros: os registros deverão seguir os
campos obrigatórios e os formatos definidos para cada cadastro.

RO02 --- Integridade dos Relacionamentos: compras, vendas e
movimentações não deverão referenciar produtos, fornecedores ou outros
registros inexistentes.

RO03 --- Proteção das Informações: os dados armazenados deverão ser
utilizados para as finalidades relacionadas à gestão da loja.

RO04 --- Credenciais: senhas, chaves e outras informações
confidenciais não deverão ser incluídas em arquivos públicos do
repositório.

RO05 --- Rastreabilidade: as movimentações relevantes deverão
permitir identificar as operações que alteraram o estoque.

RO06 --- Dados de Demonstração: os dados fictícios utilizados para
apresentação acadêmica deverão ser identificados como exemplos, evitando
confusão com registros reais da loja.
Relação entre regras e processos
  Processo                    Regras relacionadas
  Cadastro de produtos        RN01, RN02, RN03, RN04 e RN05
  Controle de estoque         RN06, RN09, RN13 e RN14
  Registro de vendas          RN07, RN08, RN12 e RN13
  Registro de compras         RN10, RN11 e RN13
  Cadastro de fornecedores    RN10 e RO01
  Integridade dos registros   RO01, RO02 e RO05
  Segurança das informações   RO03 e RO04

As regras apresentadas constituem a proposta inicial do sistema e
deverão ser verificadas conforme a implementação evoluir.
5. Dicionário de Dados Conceitual
O dicionário de dados conceitual deverá descrever as entidades, seus
atributos, as respectivas finalidades e as regras relevantes para a
interpretação das informações.

Entre as informações previstas estão:
- Nome da entidade;
- Nome do atributo;
- Descrição do atributo;
- Identificação dos atributos principais;
- Relacionamentos com outras entidades;
- Restrições e observações pertinentes.
O dicionário deverá ser mantido em um arquivo próprio no repositório,
conforme o formato definido.

Arquivo: [adicionar o caminho do dicionário de dados]
6. Modelagem Conceitual --- Entidades, Atributos e Relacionamentos
Entidades reconhecidas
A proposta inicial contempla as seguintes entidades:

Produto: representa os produtos comercializados pela loja, incluindo
acessórios para celulares e computadores e seus dados de identificação e
características.

Categoria: representa a classificação utilizada para organizar os
produtos.

Marca: representa as marcas dos produtos comercializados.

ModeloCelular: representa os modelos de celulares utilizados para
identificar a compatibilidade de determinados acessórios.

Fornecedor: representa os fornecedores responsáveis pelo
fornecimento de mercadorias.

Funcionario: representa os funcionários relacionados às operações da
loja.

Compra: representa uma operação de aquisição de mercadorias.

ItemCompra: representa cada produto e sua quantidade dentro de uma
compra.

Venda: representa uma operação de venda realizada pela loja.

ItemVenda: representa cada produto e sua quantidade dentro de uma
venda.

MovimentacaoEstoque: representa as entradas e saídas registradas no
estoque.

Essas entidades constituem uma proposta inicial e deverão ser comparadas
com o modelo conceitual e o esquema efetivamente implementados.
Atributos e identificadores
Cada entidade deverá possuir atributos compatíveis com sua finalidade e,
quando aplicável, um identificador que permita distinguir cada registro.

Como exemplos de atributos previstos:
- Produto: identificador, nome, código interno, descrição, preço
  de venda, quantidade disponível e estoque mínimo;
- Categoria: identificador e nome;
- Marca: identificador e nome;
- ModeloCelular: identificador, fabricante e modelo;
- Fornecedor: identificador, nome e dados de contato;
- Funcionario: identificador, nome e dados cadastrais necessários;
- Compra: identificador, fornecedor, funcionário responsável e
  data;
- ItemCompra: identificador da compra, produto, quantidade e valor
  unitário de aquisição;
- Venda: identificador, funcionário responsável e data;
- ItemVenda: identificador da venda, produto, quantidade e preço
  unitário praticado;
- MovimentacaoEstoque: identificador, produto, tipo de
  movimentação, quantidade, data e motivo.
A lista definitiva de atributos deverá corresponder ao dicionário de
dados e ao modelo lógico aprovados.
Relacionamentos previstos
Categoria --- Produto: uma categoria poderá classificar vários
produtos, enquanto cada produto estará associado à categoria definida
para seu cadastro.

Marca --- Produto: uma marca poderá estar relacionada a vários
produtos.

ModeloCelular --- Produto: o relacionamento deverá representar a
compatibilidade dos acessórios com os modelos de celulares. Caso um
produto seja compatível com vários modelos, a modelagem deverá
considerar essa possibilidade.

Fornecedor --- Compra: um fornecedor poderá estar relacionado a
várias compras, enquanto cada compra deverá identificar seu fornecedor.

Compra --- ItemCompra: uma compra poderá conter vários itens, e cada
item deverá pertencer a uma compra.

Produto --- ItemCompra: um produto poderá aparecer em diferentes
itens de compra.

Funcionario --- Compra: um funcionário poderá ser associado às
compras pelas quais for responsável.

Funcionario --- Venda: um funcionário poderá estar associado às
vendas que registrar.

Venda --- ItemVenda: uma venda poderá conter vários itens, e cada
item deverá pertencer a uma venda.

Produto --- ItemVenda: um produto poderá aparecer em diferentes
itens de venda.

Produto --- MovimentacaoEstoque: um produto poderá possuir diversos
registros de movimentação ao longo do tempo.
Restrições aplicadas ao modelo
Os relacionamentos deverão respeitar as regras de negócio e preservar a
integridade dos registros.

Por exemplo, um item de venda deverá estar associado a uma venda e a um
produto existentes. Da mesma forma, uma compra deverá identificar seu
fornecedor, e uma movimentação de estoque deverá estar associada ao
produto correspondente.

O modelo também deverá permitir que as operações de compra e venda sejam
relacionadas ao controle de estoque, mantendo consistência entre os
registros realizados.
7. Diagrama Entidade-Relacionamento (DER)
O Diagrama Entidade-Relacionamento deverá representar as entidades do
sistema, seus atributos, identificadores, relacionamentos e
cardinalidades.

O DER deverá ser coerente com:
- Os requisitos funcionais;
- As regras de negócio;
- O dicionário de dados;
- O modelo lógico;
- A estrutura implementada no banco de dados.
Entidades previstas no modelo
- Produto;
- Categoria;
- Marca;
- ModeloCelular;
- Fornecedor;
- Funcionario;
- Compra;
- ItemCompra;
- Venda;
- ItemVenda;
- MovimentacaoEstoque.
O diagrama definitivo deverá ser anexado ao repositório como imagem ou
arquivo editável.

Arquivo do DER:
[adicionar o caminho da imagem ou do arquivo do diagrama]
Registro de correções do modelo
As correções realizadas durante a elaboração do DER deverão ser
documentadas, informando:
  Aspecto revisado        Correção realizada      Justificativa
  Identificadores         A definir conforme a    Garantir a
                          revisão do diagrama     identificação única das
                                                  entidades

  Cardinalidades          A definir conforme a    Representar
                          revisão do diagrama     corretamente os
                                                  relacionamentos

  Atributos               A definir conforme a    Manter coerência com o
                          revisão do diagrama     dicionário de dados
  Integridade dos         A definir conforme a    Evitar vínculos
  relacionamentos         revisão do diagrama     inconsistentes
Os itens dessa tabela deverão ser atualizados conforme as correções
efetivamente realizadas.
8. Justificativa Técnica
A modelagem proposta foi estruturada considerando a necessidade de
organizar os dados de uma loja que comercializa acessórios para
celulares e computadores e que também oferece manutenção de
computadores. A primeira versão do sistema, contudo, prioriza cadastro,
compra, venda e controle de estoque.

A entidade Produto centraliza as informações dos itens comercializados,
evitando a repetição desnecessária de seus dados em diferentes
operações.

A entidade Categoria permite agrupar os produtos de acordo com suas
características comerciais. A entidade Marca mantém as informações das
marcas separadas dos registros dos produtos, enquanto ModeloCelular
permite representar a compatibilidade de acessórios com diferentes
dispositivos.

As entidades Compra e Venda representam operações comerciais distintas.
A separação de ItemCompra e ItemVenda permite que cada operação possua
vários produtos, cada um com sua quantidade e seus respectivos valores.

A entidade Fornecedor identifica as origens das mercadorias adquiridas.
A entidade Funcionario permite relacionar as operações aos responsáveis
pelos registros, conforme as regras definidas para o sistema.

A entidade MovimentacaoEstoque foi prevista para registrar as entradas e
saídas de produtos. Essa separação permite manter o histórico das
alterações de estoque, em vez de considerar apenas a quantidade atual.

A modelagem relacional também favorece a aplicação de chaves primárias,
chaves estrangeiras e restrições de integridade, contribuindo para a
consistência das informações armazenadas.

Do ponto de vista da aplicação, o projeto utiliza Python com Flask para
estruturar as rotas e processar as requisições, HTML para a estrutura
das páginas, CSS para a apresentação visual e JavaScript para as
interações da interface.

A conexão com o banco de dados será incorporada durante a implementação,
respeitando o modelo de dados definido. O gerenciamento detalhado de
ordens de serviço de manutenção poderá ser avaliado em uma etapa futura.
9. Tecnologias Utilizadas
Interface e aplicação
- Python: linguagem utilizada no desenvolvimento da aplicação;
- Flask: framework utilizado para disponibilizar as páginas e
  organizar as rotas;
- HTML: estruturação das páginas;
- CSS: estilização e adaptação visual da interface;
- JavaScript: implementação das interações no navegador.
Banco de dados
- MySQL: tecnologia prevista para armazenar os dados do sistema
  após a instalação e configuração do ambiente.
Ferramentas de desenvolvimento
- Visual Studio Code: editor utilizado no desenvolvimento;
- Git e GitHub: controle de versão e armazenamento do
  código-fonte.
A documentação deverá ser atualizada caso as tecnologias sejam alteradas
ou ferramentas adicionais sejam adotadas durante o desenvolvimento.
10. Estado Atual do Projeto
O desenvolvimento está sendo realizado por etapas, começando pela
estrutura da interface e seguindo para a implementação dos módulos e
integração com o banco de dados.
Etapas do desenvolvimento
- [x] Criação da estrutura inicial da aplicação Flask;
- [x] Criação da estrutura inicial do dashboard;
- [x] Criação do arquivo CSS principal;
- [ ] Implementação da navegação funcional entre os módulos;
- [ ] Desenvolvimento da interface de cadastro e consulta de produtos;
- [ ] Desenvolvimento da interface de estoque e movimentações;
- [ ] Desenvolvimento das interfaces de compras e vendas;
- [ ] Desenvolvimento das interfaces dos cadastros auxiliares;
- [ ] Instalação e configuração do MySQL;
- [ ] Criação do banco de dados e das tabelas;
- [ ] Integração entre a aplicação Flask e o banco de dados;
- [ ] Testes de cadastro, consulta, atualização e integridade;
- [ ] Revisão do DER e do dicionário de dados;
- [ ] Finalização da documentação acadêmica.
Os itens concluídos indicam apenas o progresso inicial da interface. As
funcionalidades de persistência de dados e os módulos ainda não
implementados não devem ser considerados concluídos.
11. Uso de Inteligência Artificial
Durante o desenvolvimento do projeto, ferramentas de inteligência
artificial foram utilizadas como apoio em atividades de organização,
revisão e programação.
Organização da documentação
O ChatGPT foi utilizado como apoio para estruturar e revisar o conteúdo
do README.md, organizando as informações em seções compatíveis com a
apresentação acadêmica do projeto. O conteúdo final deverá ser revisado
para verificar se corresponde aos requisitos definidos pelo professor e
às informações efetivamente levantadas.
Apoio ao desenvolvimento da interface
A ferramenta também foi utilizada como apoio na revisão e elaboração de
códigos relacionados à estrutura HTML, à estilização CSS e à aplicação
Python com Flask. As sugestões de código devem ser testadas e
compreendidas antes de serem consideradas parte definitiva do sistema.
Limitações e revisão crítica
A inteligência artificial pode apresentar sugestões que não correspondam
integralmente à estrutura atual do projeto. Por esse motivo, os códigos,
requisitos e documentos deverão ser verificados.

A definição final das regras de negócio, a validação do modelo
conceitual, a conferência das cardinalidades e a aprovação dos
requisitos são responsabilidades do autor do projeto.

O registro do uso de IA deverá seguir as orientações do professor,
incluindo, se solicitado, ferramentas utilizadas, objetivos, prompts,
resultados aproveitados e alterações realizadas.
12. Considerações Finais
O GCaccessories tem como objetivo aplicar os conceitos de modelagem de
banco de dados ao desenvolvimento de um sistema de gerenciamento para
uma loja que comercializa acessórios para celulares e computadores e
também realiza manutenção de computadores.

A proposta busca organizar os cadastros, registrar as operações
comerciais e acompanhar as movimentações de estoque por meio de uma
estrutura de dados consistente.

A separação das entidades e a definição de seus relacionamentos
constituem a base para a implementação do banco de dados e das
funcionalidades da aplicação.

O desenvolvimento será realizado progressivamente, desde a construção
das interfaces até a integração com o banco de dados e a validação das
operações. O controle de serviços de manutenção poderá ser considerado
uma expansão futura, conforme o tempo disponível e os requisitos da
entrega.

A documentação será atualizada conforme o projeto avançar, mantendo a
correspondência entre os requisitos, o modelo conceitual, o modelo
lógico e o sistema implementado.
