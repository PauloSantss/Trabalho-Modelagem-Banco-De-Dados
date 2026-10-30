-- =====================================================
-- GCaccessories
-- Banco de dados para loja de acessórios de celular
-- MySQL 8.0
-- =====================================================

CREATE DATABASE IF NOT EXISTS GCaccessories
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE GCaccessories;

-- =====================================================
-- 1. CATEGORIAS
-- =====================================================

CREATE TABLE IF NOT EXISTS Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

-- =====================================================
-- 2. MARCAS
-- =====================================================

CREATE TABLE IF NOT EXISTS Marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

-- =====================================================
-- 3. MODELOS DE CELULAR
-- =====================================================

CREATE TABLE IF NOT EXISTS ModeloCelular (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    fabricante VARCHAR(100) NOT NULL,
    nome_modelo VARCHAR(100) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE (fabricante, nome_modelo)
) ENGINE=InnoDB;

-- =====================================================
-- 4. FORNECEDORES
-- =====================================================

CREATE TABLE IF NOT EXISTS Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    nome_contato VARCHAR(120),
    telefone VARCHAR(20),
    email VARCHAR(150),
    CNPJ VARCHAR(18),
    endereco VARCHAR(255),
    observacoes TEXT,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

-- =====================================================
-- 5. FUNCIONÁRIOS
-- =====================================================

CREATE TABLE IF NOT EXISTS Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    CPF VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150),
    cargo VARCHAR(80),
    data_admissao DATE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

-- =====================================================
-- 6. FECHAMENTO DE CAIXA
-- =====================================================

CREATE TABLE IF NOT EXISTS FechamentoCaixa (
    id_fechamento INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    data_abertura DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_fechamento DATETIME,
    valor_caixa_inicial DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    valor_dinheiro_esperado DECIMAL(10,2) DEFAULT 0.00,
    valor_dinheiro_contado DECIMAL(10,2),
    diferenca_caixa DECIMAL(10,2),
    total_cartao DECIMAL(10,2) DEFAULT 0.00,
    total_pix DECIMAL(10,2) DEFAULT 0.00,
    observacoes TEXT,
    status ENUM('ABERTO', 'FECHADO') NOT NULL DEFAULT 'ABERTO',

    CONSTRAINT FK_Fechamento_Funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario)
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =====================================================
-- 7. PRODUTOS
-- =====================================================

CREATE TABLE IF NOT EXISTS Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    codigo_barras VARCHAR(50) UNIQUE,
    SKU VARCHAR(50) UNIQUE,
    descricao TEXT,
    id_categoria INT NOT NULL,
    id_marca INT,
    id_modelo INT,
    cor VARCHAR(50),
    preco_custo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    preco_venda DECIMAL(10,2) NOT NULL,
    estoque_atual INT NOT NULL DEFAULT 0,
    estoque_minimo INT NOT NULL DEFAULT 0,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT FK_Produto_Categoria
        FOREIGN KEY (id_categoria)
        REFERENCES Categoria(id_categoria)
        ON UPDATE CASCADE,

    CONSTRAINT FK_Produto_Marca
        FOREIGN KEY (id_marca)
        REFERENCES Marca(id_marca)
        ON UPDATE CASCADE,

    CONSTRAINT FK_Produto_ModeloCelular
        FOREIGN KEY (id_modelo)
        REFERENCES ModeloCelular(id_modelo)
        ON UPDATE CASCADE,

    CONSTRAINT CK_Produto_Preco
        CHECK (preco_venda >= 0 AND preco_custo >= 0),

    CONSTRAINT CK_Produto_Estoque
        CHECK (estoque_atual >= 0 AND estoque_minimo >= 0)
) ENGINE=InnoDB;

-- =====================================================
-- 8. COMPRAS
-- =====================================================

CREATE TABLE IF NOT EXISTS Compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_compra DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    observacoes TEXT,
    status ENUM('PENDENTE', 'RECEBIDA', 'CANCELADA')
        NOT NULL DEFAULT 'PENDENTE',

    CONSTRAINT FK_Compra_Fornecedor
        FOREIGN KEY (id_fornecedor)
        REFERENCES Fornecedor(id_fornecedor),

    CONSTRAINT FK_Compra_Funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario)
) ENGINE=InnoDB;

-- =====================================================
-- 9. VENDAS
-- =====================================================

CREATE TABLE IF NOT EXISTS Venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    id_fechamento INT,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_subtotal DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    desconto DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    status ENUM('CONCLUIDA', 'CANCELADA')
        NOT NULL DEFAULT 'CONCLUIDA',

    CONSTRAINT FK_Venda_Funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario),

    CONSTRAINT FK_Venda_Fechamento
        FOREIGN KEY (id_fechamento)
        REFERENCES FechamentoCaixa(id_fechamento),

    CONSTRAINT CK_Venda_Valores
        CHECK (
            valor_subtotal >= 0
            AND desconto >= 0
            AND valor_total >= 0
        )
) ENGINE=InnoDB;

-- =====================================================
-- 10. ITENS DAS COMPRAS
-- =====================================================

CREATE TABLE IF NOT EXISTS ItemCompra (
    id_item_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_ItemCompra_Compra
        FOREIGN KEY (id_compra)
        REFERENCES Compra(id_compra),

    CONSTRAINT FK_ItemCompra_Produto
        FOREIGN KEY (id_produto)
        REFERENCES Produto(id_produto),

    CONSTRAINT CK_ItemCompra_Quantidade
        CHECK (quantidade > 0),

    CONSTRAINT CK_ItemCompra_Valores
        CHECK (preco_unitario >= 0 AND subtotal >= 0)
) ENGINE=InnoDB;

-- =====================================================
-- 11. ITENS DAS VENDAS
-- =====================================================

CREATE TABLE IF NOT EXISTS ItemVenda (
    id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_ItemVenda_Venda
        FOREIGN KEY (id_venda)
        REFERENCES Venda(id_venda),

    CONSTRAINT FK_ItemVenda_Produto
        FOREIGN KEY (id_produto)
        REFERENCES Produto(id_produto),

    CONSTRAINT CK_ItemVenda_Quantidade
        CHECK (quantidade > 0),

    CONSTRAINT CK_ItemVenda_Valores
        CHECK (
            preco_unitario >= 0
            AND desconto >= 0
            AND subtotal >= 0
        )
) ENGINE=InnoDB;

-- =====================================================
-- 12. PAGAMENTOS
-- Uma venda pode ter vários pagamentos.
-- =====================================================

CREATE TABLE IF NOT EXISTS Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    forma_pagamento ENUM(
        'DINHEIRO',
        'CARTAO_CREDITO',
        'CARTAO_DEBITO',
        'PIX',
        'OUTRO'
    ) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT FK_Pagamento_Venda
        FOREIGN KEY (id_venda)
        REFERENCES Venda(id_venda),

    CONSTRAINT CK_Pagamento_Valor
        CHECK (valor > 0)
) ENGINE=InnoDB;

-- =====================================================
-- 13. TROCAS
-- =====================================================

CREATE TABLE IF NOT EXISTS Troca (
    id_troca INT AUTO_INCREMENT PRIMARY KEY,
    id_venda_original INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_troca DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    motivo VARCHAR(255),
    observacoes TEXT,

    CONSTRAINT FK_Troca_Venda
        FOREIGN KEY (id_venda_original)
        REFERENCES Venda(id_venda),

    CONSTRAINT FK_Troca_Funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario)
) ENGINE=InnoDB;

-- =====================================================
-- 14. ITENS DAS TROCAS
-- Registra o produto devolvido e o produto entregue.
-- =====================================================

CREATE TABLE IF NOT EXISTS ItemTroca (
    id_item_troca INT AUTO_INCREMENT PRIMARY KEY,
    id_troca INT NOT NULL,
    id_produto_devolvido INT NOT NULL,
    id_produto_entregue INT NOT NULL,
    quantidade_devolvida INT NOT NULL,
    quantidade_entregue INT NOT NULL,
    valor_diferenca DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT FK_ItemTroca_Troca
        FOREIGN KEY (id_troca)
        REFERENCES Troca(id_troca),

    CONSTRAINT FK_ItemTroca_Devolvido
        FOREIGN KEY (id_produto_devolvido)
        REFERENCES Produto(id_produto),

    CONSTRAINT FK_ItemTroca_Entregue
        FOREIGN KEY (id_produto_entregue)
        REFERENCES Produto(id_produto),

    CONSTRAINT CK_ItemTroca_Quantidade
        CHECK (
            quantidade_devolvida > 0
            AND quantidade_entregue > 0
        )
) ENGINE=InnoDB;

-- =====================================================
-- 15. MOVIMENTAÇÕES DE ESTOQUE
-- Registra entradas, saídas, trocas e ajustes.
-- =====================================================

CREATE TABLE IF NOT EXISTS MovimentacaoEstoque (
    id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_compra INT,
    id_venda INT,
    id_troca INT,
    tipo_movimentacao ENUM(
        'ENTRADA_COMPRA',
        'SAIDA_VENDA',
        'ENTRADA_TROCA',
        'SAIDA_TROCA',
        'AJUSTE_ENTRADA',
        'AJUSTE_SAIDA'
    ) NOT NULL,
    quantidade INT NOT NULL,
    data_movimentacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    motivo VARCHAR(255),

    CONSTRAINT FK_Movimentacao_Produto
        FOREIGN KEY (id_produto)
        REFERENCES Produto(id_produto),

    CONSTRAINT FK_Movimentacao_Funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario),

    CONSTRAINT FK_Movimentacao_Compra
        FOREIGN KEY (id_compra)
        REFERENCES Compra(id_compra),

    CONSTRAINT FK_Movimentacao_Venda
        FOREIGN KEY (id_venda)
        REFERENCES Venda(id_venda),

    CONSTRAINT FK_Movimentacao_Troca
        FOREIGN KEY (id_troca)
        REFERENCES Troca(id_troca),

    CONSTRAINT CK_Movimentacao_Quantidade
        CHECK (quantidade > 0)
) ENGINE=InnoDB;

-- =====================================================
-- FIM DA ESTRUTURA DO BANCO GCaccessories
-- =====================================================

-- Consulta para conferir as tabelas criadas:
SHOW TABLES;
