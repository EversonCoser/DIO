CREATE DATABASE ECOMMERCENOVO;

USE ECOMMERCENOVO;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    TipoCliente ENUM('FISICA', 'JURIDICA') NOT NULL,
    Endereco VARCHAR(100) NOT NULL
);

ALTER TABLE Cliente auto_increment=1;

CREATE TABLE PessoaFisica (
    idPessoaFisica INT PRIMARY KEY AUTO_INCREMENT,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Cliente_idCliente INT UNIQUE NOT NULL,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);
ALTER TABLE PessoaFisica auto_increment=1;

CREATE TABLE PessoaJuridica (
    idPessoaJuridica INT PRIMARY KEY AUTO_INCREMENT,
    CNPJ VARCHAR(18) UNIQUE NOT NULL,
    Cliente_idCliente INT UNIQUE NOT NULL,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);
ALTER TABLE PessoaJuridica auto_increment=1;

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    Categoria VARCHAR(45) NOT NULL,
    Descricao VARCHAR(100),
    Valor DECIMAL(10,2) NOT NULL
);
ALTER TABLE Produto auto_increment=1;

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    Status ENUM('PENDENTE', 'PAGO', 'ENVIADO', 'ENTREGUE', 'CANCELADO') NOT NULL,
    Descricao VARCHAR(100),
    Frete DECIMAL(10,2) NOT NULL,
    ValorPedido DECIMAL(10,2) NOT NULL
);
ALTER TABLE Pedido auto_increment=1;

CREATE TABLE Cliente_has_Pedido (
    Cliente_idCliente INT,
    Pedido_idPedido INT,
    PRIMARY KEY (Cliente_idCliente, Pedido_idPedido),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido) ON DELETE CASCADE
);

CREATE TABLE Produto_has_Pedido (
    Produto_idProduto INT,
    Pedido_idPedido INT,
    PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido) ON DELETE CASCADE
);

CREATE TABLE FormaPagamento (
    idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
    TipoPagamento ENUM('CARTAO', 'PIX', 'BOLETO') NOT NULL,
    Detalhe VARCHAR(100) NOT NULL,
    Pedido_idPedido INT NOT NULL,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido) ON DELETE CASCADE
);
ALTER TABLE FormaPagamento auto_increment=1;

CREATE TABLE InformacoesCartao (
    idInformacoesCartao INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(45) NOT NULL,
    Limite DECIMAL(10,2) NOT NULL,
    Validade DATE NOT NULL
);
ALTER TABLE InformacoesCartao auto_increment=1;

CREATE TABLE PessoaFisica_has_InformacoesCartao (
    PessoaFisica_idPessoaFisica INT,
    InformacoesCartao_idInformacoesCartao INT,
    PRIMARY KEY (PessoaFisica_idPessoaFisica, InformacoesCartao_idInformacoesCartao),
    FOREIGN KEY (PessoaFisica_idPessoaFisica) REFERENCES PessoaFisica(idPessoaFisica) ON DELETE CASCADE,
    FOREIGN KEY (InformacoesCartao_idInformacoesCartao) REFERENCES InformacoesCartao(idInformacoesCartao) ON DELETE CASCADE
);

CREATE TABLE PessoaJuridica_has_InformacoesCartao (
    PessoaJuridica_idPessoaJuridica INT,
    InformacoesCartao_idInformacoesCartao INT,
    PRIMARY KEY (PessoaJuridica_idPessoaJuridica, InformacoesCartao_idInformacoesCartao),
    FOREIGN KEY (PessoaJuridica_idPessoaJuridica) REFERENCES PessoaJuridica(idPessoaJuridica) ON DELETE CASCADE,
    FOREIGN KEY (InformacoesCartao_idInformacoesCartao) REFERENCES InformacoesCartao(idInformacoesCartao) ON DELETE CASCADE
);

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ VARCHAR(18) UNIQUE NOT NULL
);
ALTER TABLE Fornecedor auto_increment=1;

CREATE TABLE Fornecedor_has_Produto (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor) ON DELETE CASCADE,
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Local VARCHAR(100) NOT NULL
);
ALTER TABLE Estoque auto_increment=1;

CREATE TABLE Estoque_has_Produto (
    Estoque_idEstoque INT,
    Produto_idProduto INT,
    PRIMARY KEY (Estoque_idEstoque, Produto_idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque) ON DELETE CASCADE,
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE
);

CREATE TABLE TerceiroVendedor (
    idTerceiroVendedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(45) NOT NULL,
    Local VARCHAR(100) NOT NULL
);
ALTER TABLE TerceiroVendedor auto_increment=1;

CREATE TABLE TerceiroVendedor_has_Pedido (
    TerceiroVendedor_idTerceiroVendedor INT,
    Pedido_idPedido INT,
    PRIMARY KEY (TerceiroVendedor_idTerceiroVendedor, Pedido_idPedido),
    FOREIGN KEY (TerceiroVendedor_idTerceiroVendedor) REFERENCES TerceiroVendedor(idTerceiroVendedor) ON DELETE CASCADE,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido) ON DELETE CASCADE
);

CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    CodigoDeRastreamento VARCHAR(45) NOT NULL,
    Status ENUM('PREPARANDO', 'ENVIADO', 'ENTREGUE') NOT NULL
);
ALTER TABLE Entrega auto_increment=1;

CREATE TABLE Pedido_has_Entrega (
    Pedido_idPedido INT,
    Entrega_idEntrega INT,
    PRIMARY KEY (Pedido_idPedido, Entrega_idEntrega),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido) ON DELETE CASCADE,
    FOREIGN KEY (Entrega_idEntrega) REFERENCES Entrega(idEntrega) ON DELETE CASCADE
);


-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Nome, TipoCliente, Endereco) VALUES
('João Silva', 'FISICA', 'Rua A, 123'),
('Empresa XYZ', 'JURIDICA', 'Av. B, 456'),
('Maria Souza', 'FISICA', 'Rua C, 789'),
('Comércio ABC', 'JURIDICA', 'Rua D, 321'),
('Carlos Lima', 'FISICA', 'Av. E, 654');

-- Inserindo dados na tabela PessoaFisica
INSERT INTO PessoaFisica (CPF, Cliente_idCliente) VALUES
('111.222.333-44', 1),
('555.666.777-88', 3),
('999.888.777-66', 5);

-- Inserindo dados na tabela PessoaJuridica
INSERT INTO PessoaJuridica (CNPJ, Cliente_idCliente) VALUES
('12.345.678/0001-99', 2),
('98.765.432/0001-11', 4);

-- Inserindo dados na tabela Produto
INSERT INTO Produto (Categoria, Descricao, Valor) VALUES
('Eletrônico', 'Smartphone', 1500.00),
('Móveis', 'Mesa de Escritório', 500.00),
('Eletrodoméstico', 'Geladeira', 3000.00),
('Vestimenta', 'Jaqueta de Couro', 250.00),
('Alimento', 'Chocolate Importado', 25.00);

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (Status, Descricao, Frete, ValorPedido) VALUES
('PENDENTE', 'Pedido de João Silva', 15.00, 520.00),
('PAGO', 'Pedido da Empresa XYZ', 20.00, 320.00),
('ENVIADO', 'Pedido de Maria Souza', 10.00, 150.00),
('ENTREGUE', 'Pedido do Comércio ABC', 30.00, 5000.00),
('CANCELADO', 'Pedido de Carlos Lima', 0.00, 340.00);

-- Relacionando Clientes com Pedidos
INSERT INTO Cliente_has_Pedido (Cliente_idCliente, Pedido_idPedido) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Relacionando Produtos com Pedidos
INSERT INTO Produto_has_Pedido (Produto_idProduto, Pedido_idPedido) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Inserindo dados na tabela FormaPagamento
INSERT INTO FormaPagamento (TipoPagamento, Detalhe, Pedido_idPedido) VALUES
('CARTAO', 'Cartão Visa', 1),
('PIX', 'Chave e-mail', 2),
('BOLETO', 'Boleto Bancário', 3),
('CARTAO', 'Cartão Master', 4),
('PIX', 'Chave CPF', 5);

-- Inserindo dados na tabela InformacoesCartao
INSERT INTO InformacoesCartao (Tipo, Limite, Validade) VALUES
('Crédito', 5000.00, '2026-12-01'),
('Débito', 2000.00, '2025-08-15'),
('Crédito', 7000.00, '2027-05-10'),
('Débito', 1000.00, '2024-11-30'),
('Crédito', 3000.00, '2025-07-20');

-- Relacionando PessoaFisica com InformacoesCartao
INSERT INTO PessoaFisica_has_InformacoesCartao (PessoaFisica_idPessoaFisica, InformacoesCartao_idInformacoesCartao) VALUES
(1, 1), (3, 2), (3, 3);

-- Relacionando PessoaJuridica com InformacoesCartao
INSERT INTO PessoaJuridica_has_InformacoesCartao (PessoaJuridica_idPessoaJuridica, InformacoesCartao_idInformacoesCartao) VALUES
(2, 3), (1, 5);

-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (RazaoSocial, CNPJ) VALUES
('Tech Eletrônicos', '11.111.111/0001-11'),
('Moveis & Cia', '22.222.222/0001-22'),
('EletroBrasil', '33.333.333/0001-33'),
('Moda Premium', '44.444.444/0001-44'),
('Doces Finos', '55.555.555/0001-55');

-- Relacionando Fornecedores com Produtos
INSERT INTO Fornecedor_has_Produto (Fornecedor_idFornecedor, Produto_idProduto) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (Local) VALUES
('Depósito Central'), ('Filial Norte'), ('Filial Sul'), ('Armazém Leste'), ('Armazém Oeste');

-- Relacionando Estoque com Produtos
INSERT INTO Estoque_has_Produto (Estoque_idEstoque, Produto_idProduto) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Inserindo dados na tabela TerceiroVendedor
INSERT INTO TerceiroVendedor (RazaoSocial, Local) VALUES
('Marketplace A', 'São Paulo'),
('Marketplace B', 'Rio de Janeiro'),
('Loja Parceira 1', 'Curitiba'),
('Loja Parceira 2', 'Belo Horizonte'),
('E-commerce X', 'Porto Alegre');

-- Relacionando TerceiroVendedor com Pedidos
INSERT INTO TerceiroVendedor_has_Pedido (TerceiroVendedor_idTerceiroVendedor, Pedido_idPedido) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Inserindo dados na tabela Entrega
INSERT INTO Entrega (CodigoDeRastreamento, Status) VALUES
('AA123456BR', 'PREPARANDO'),
('BB234567BR', 'ENVIADO'),
('CC345678BR', 'ENTREGUE'),
('DD456789BR', 'ENVIADO'),
('EE567890BR', 'PREPARANDO');

-- Relacionando Pedidos com Entregas
INSERT INTO Pedido_has_Entrega (Pedido_idPedido, Entrega_idEntrega) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Retorna o nome do cliente, o status do pedido, sua descrição e valor, além do status da entrega on o status do pedido é PAGO
select c.nome, p.status, p.descricao, p.valorpedido, e.status  from cliente c join cliente_has_pedido cp on c.idcliente = cp.cliente_idcliente
	join pedido p on cp.pedido_idpedido = p.idpedido join pedido_has_entrega pe on p.idpedido = pe.pedido_idpedido
    join entrega e on pe.entrega_identrega = e.identrega where p.status = 'PAGO';

-- Retorna a descrição a categoria o valor do produto, além de um novovalor com o reajuste de um aumento de 35%
select p.descricao, p.categoria, p.valor, p.valor*1.35 as reajuste from produto p having p.valor > 350.00;

-- Retorna a categoria e o local onde os produtos estão armazenados ordenados pela categoria
select p.categoria, e.local from produto p join estoque_has_produto ep on p.idproduto = ep.produto_idproduto
join estoque e on ep.estoque_idestoque = e.idestoque order by p.categoria;




