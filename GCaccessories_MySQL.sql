```sql
CREATE DATABASE IF NOT EXISTS GCaccessories
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE GCaccessories;

CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255),
    ativo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE Marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE ModeloCelular (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    fabricante VARCHAR(100) NOT NULL,
    nome_modelo VARCHAR(100) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    UNIQUE (fabricante, nome_modelo)
) ENGINE=InnoDB;

CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    nome_contato VARCHAR(120),
    telefone VARCHAR(20),
    email VARCHAR(150),
    CNPJ VARCHAR(18),
    endereco VARCHAR(255),
    observacoes TEXT,
    ativo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    CPF VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150),
    cargo VARCHAR(80),
    data_admissao DATE,
    ativo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE FechamentoCaixa (
    id_fechamento INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    data_abertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_fechamento DATETIME,
    valor_caixa_inicial DECIMAL(10,2) DEFAULT 0.00,
    valor_dinheiro_esperado DECIMAL(10,2) DEFAULT 0.00,
    valor_dinheiro_contado DECIMAL(10,2),
    diferenca_caixa DECIMAL(10,2),
    total_cartao DECIMAL(10,2) DEFAULT 0.00,
    total_pix DECIMAL(10,2) DEFAULT 0.00,
    observacoes TEXT,
    status ENUM('ABERTO', 'FECHADO') DEFAULT 'ABERTO',

    FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario)
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    codigo_barras VARCHAR(50) UNIQUE,
    SKU VARCHAR(50) UNIQUE,
    descricao TEXT,
    id_categoria INT NOT NULL,
    id_marca INT,
    id_modelo INT,
    cor VARCHAR(50),
    preco_custo DECIMAL(10,2) DEFAULT 0.00,
    preco_venda DECIMAL(10,2) NOT NULL,
    estoque_atual INT DEFAULT 0,
    estoque_minimo INT DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_categoria)
        REFERENCES Categoria(id_categoria),

    FOREIGN KEY (id_marca)
        REFERENCES Marca(id_marca),

    FOREIGN KEY (id_modelo)
        REFERENCES ModeloCelular(id_modelo),

    CHECK (preco_venda >= 0 AND preco_custo >= 0),
    CHECK (estoque_atual >= 0 AND estoque_minimo >= 0)
) ENGINE=InnoDB;

CREATE TABLE Compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) DEFAULT 0.00,
    observacoes TEXT,
    status ENUM('PENDENTE', 'RECEBIDA', 'CANCELADA') DEFAULT 'PENDENTE',

    FOREIGN KEY (id_fornecedor)
        REFERENCES Fornecedor(id_fornecedor),

    FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario)
) ENGINE=InnoDB;

CREATE TABLE Venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    id_fechamento INT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_subtotal DECIMAL(10,2) DEFAULT 0.00,
    desconto DECIMAL(10,2) DEFAULT 0.00,
    valor_total DECIMAL(10,2) DEFAULT 0.00,
    status ENUM('CONCLUIDA', 'CANCELADA') DEFAULT 'CONCLUIDA',

    FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario),

    FOREIGN KEY (id_fechamento)
        REFERENCES FechamentoCaixa(id_fechamento),

    CHECK (valor_subtotal >= 0 AND desconto >= 0 AND valor_total >= 0)
) ENGINE=InnoDB;

CREATE TABLE ItemCompra (
    id_item_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_compra)
        REFERENCES Compra(id_compra),

    FOREIGN KEY (id_produto)
        REFERENCES Produto(id_produto),

    CHECK (quantidade > 0),
    CHECK (preco_unitario >= 0 AND subtotal >= 0)
) ENGINE=InnoDB;

CREATE TABLE ItemVenda (
    id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) DEFAULT 0.00,
    subtotal DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_venda)
        REFERENCES Venda(id_venda),

    FOREIGN KEY (id_produto)
        REFERENCES Produto(id_produto),

    CHECK (quantidade > 0),
    CHECK (preco_unitario >= 0 AND desconto >= 0 AND subtotal >= 0)
) ENGINE=InnoDB;

CREATE TABLE Pagamento (
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
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_venda)
        REFERENCES Venda(id_venda),

    CHECK (valor > 0)
) ENGINE=InnoDB;

CREATE TABLE Troca (
    id_troca INT AUTO_INCREMENT PRIMARY KEY,
    id_venda_original INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_troca DATETIME DEFAULT CURRENT_TIMESTAMP,
    motivo VARCHAR(255),
    observacoes TEXT,

    FOREIGN KEY (id_venda_original)
        REFERENCES Venda(id_venda),

    FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario)
) ENGINE=InnoDB;

CREATE TABLE ItemTroca (
    id_item_troca INT AUTO_INCREMENT PRIMARY KEY,
    id_troca INT NOT NULL,
    id_produto_devolvido INT NOT NULL,
    id_produto_entregue INT NOT NULL,
    quantidade_devolvida INT NOT NULL,
    quantidade_entregue INT NOT NULL,
    valor_diferenca DECIMAL(10,2) DEFAULT 0.00,

    FOREIGN KEY (id_troca)
        REFERENCES Troca(id_troca),

    FOREIGN KEY (id_produto_devolvido)
        REFERENCES Produto(id_produto),

    FOREIGN KEY (id_produto_entregue)
        REFERENCES Produto(id_produto),

    CHECK (quantidade_devolvida > 0 AND quantidade_entregue > 0)
) ENGINE=InnoDB;

CREATE TABLE MovimentacaoEstoque (
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
    data_movimentacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    motivo VARCHAR(255),

    FOREIGN KEY (id_produto)
        REFERENCES Produto(id_produto),

    FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario(id_funcionario),

    FOREIGN KEY (id_compra)
        REFERENCES Compra(id_compra),

    FOREIGN KEY (id_venda)
        REFERENCES Venda(id_venda),

    FOREIGN KEY (id_troca)
        REFERENCES Troca(id_troca),

    CHECK (quantidade > 0)
) ENGINE=InnoDB;

SHOW TABLES;
```
