----------- CREATE
CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    nome_usuario VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
	id_endereco INT
);


CREATE TABLE endereco(
	id_cliente INT PRIMARY KEY,
	rua VARCHAR(100) NOT NULL,
	cep VARCHAR(20) NOT NULL,
	numero VARCHAR(20) NOT NULL,
	complemento VARCHAR (20),
	FOREIGN KEY (id_cliente) REFERENCES cliente (id)
);

CREATE TABLE pedido (
    id SERIAL PRIMARY KEY,
    data_pedido DATE NOT NULL,
    id_cliente INT REFERENCES cliente(id)
);

CREATE TABLE funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(100) NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL 
);

CREATE TABLE produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
	descricao TEXT NOT NULL,  
	data_fabricacao DATE NOT NULL,
	quantidade_estoque INT NOT NULL,
	valor_unitario REAL NOT NULL,
	id_funcionario int REFERENCES funcionario(id),
	id_categoria int REFERENCES categoria(id)
);

CREATE TABLE pedido_produto (
	PRIMARY KEY (id_produto, id_pedido),
	id_produto INT REFERENCES produto(id),
	id_pedido INT REFERENCES pedido(id),
	quantidade INT
	
);

------------ INSERT

INSERT INTO 
cliente (nome, telefone, nome_usuario, cpf, email, data_nascimento)
VALUES 
('Maria Santos', '(21) 5555-1234', 'maria88', '789.012.345-67', 'maria@example.com', '1995-10-20'),
('Carlos Oliveira', '(31) 3333-9876', 'carlos77', '654.321.987-45', 'carlos@example.com', '1988-03-12'),
('Ana Lima', '(47) 2222-1111', 'ana33', '987.654.321-09', 'ana@example.com', '2000-07-08'),
('Pedro Almeida', '(19) 7777-2222', 'pedro55', '123.456.789-90', 'pedro@example.com', '1992-12-03'),
('Isabel Oliveira', '(51) 4444-8888', 'isabel44', '567.890.123-45', 'isabel@example.com', '1985-06-28');

INSERT INTO
endereco (rua, cep, numero, complemento, id_cliente)
VALUES
('Rua das Palmeiras', '515426652', '456', 'Sobrado', 1 ),
('Rua dos Pássaros', '167624726', '789', 'Apartamento 04', 2),
('Rua das Rosas', '247641972', '15', 'Sobrado', 3),
('Rua das Montanhas', '127642356', '789', 'Apartamento 06', 4),
('Rua das Flores', '5255724261', '234', 'Apartamento 08', 5);

INSERT INTO 
funcionario (nome, cpf)
VALUES 
('Fernando Silva', '456.789.123-54'),
('Juliana Souza', '987.654.321-98'),
('Ricardo Santos', '123.456.789-01'),
('Camila Oliveira', '789.012.345-67'),
('Lucas Pereira', '234.567.890-12');

INSERT INTO 
categoria (nome, descricao)
VALUES 
('Roupas', 'Diversos tipos de roupas para todas as idades.'),
('Alimentos', 'Produtos alimentícios variados, incluindo enlatados e perecíveis.'),
('Livros', 'Livros de diferentes gêneros, como ficção, não-ficção e acadêmicos.'),
('Brinquedos', 'Brinquedos para crianças de todas as idades.'),
('Móveis', 'Móveis para casa e escritório, incluindo sofás, mesas e cadeiras.');

INSERT INTO 
produto (nome, descricao, data_fabricacao, quantidade_estoque, valor_unitario, id_funcionario, id_categoria)
VALUES 
('Camiseta Azul', 'Camiseta de algodão azul com estampa.', '2023-08-01', 100, 29.99, 1, 1),
('Arroz Integral', 'Pacote de arroz integral, 1kg.', '2023-07-15', 200, 5.99, 3, 2),
('A Culpa é das Estrelas', 'Livro best-seller de romance.', '2023-06-10', 50, 19.99, 2, 3),
('Lego City', 'Conjunto de blocos de montar da Lego.', '2023-08-05', 75, 39.99, 4, 4),
('Sofá Comfort', 'Sofá de três lugares com estofamento confortável.', '2023-07-20', 20, 499.99, 5, 5);

INSERT INTO 
pedido (data_pedido, id_cliente)
VALUES 
('2023-08-21', 1),
('2023-08-22', 2),
('2023-08-22', 3),
('2023-08-23', 1),
('2023-08-24', 4);

INSERT INTO 
pedido_produto (id_pedido, id_produto, quantidade)
VALUES 
(1, 1, 2),
(2, 2, 6),
(3, 3, 1),
(4, 4, 7),
(5, 5, 2);

------------ UPDATE
UPDATE 
produto SET quantidade_estoque = 6 WHERE id = 2;

------------ DELETE
DELETE 
FROM
pedido_produto 
WHERE 
id_produto = 5;

------------ JOIN 

SELECT P.NOME AS produto, C.NOME as categoria FROM PRODUTO AS P JOIN CATEGORIA AS C ON P.ID_CATEGORIA = C.ID;

SELECT P.DATA_PEDIDO, C.NOME as cliente FROM PEDIDO AS P JOIN CLIENTE AS C ON P.ID_CLIENTE = C.ID;

----------- GROUP BY 

SELECT ID_CATEGORIA, COUNT(QUANTIDADE_ESTOQUE) FROM PRODUTO GROUP BY ID_CATEGORIA;


----------- COUNT 

SELECT COUNT(quantidade_estoque) FROM produto;

---------- NOTA FISCAL
SELECT
    ped.id as numero_pedido,
    ped.data_pedido, 
    c.nome as nome_cliente,
    c.cpf as cpf_cliente,
    c.telefone as telefone_cliente,
    CONCAT(e.rua, ', ',  e.numero, ' ', e.complemento, ' cep:', e.cep) as endereco,
    prod.nome as nome_produto, prod.valor_unitario, pp.quantidade, 
    CAST(prod.valor_unitario * pp.quantidade AS DECIMAL(10, 2)) as valor_total
FROM 
    pedido_produto as pp 
JOIN produto as prod on  pp.id_produto = prod.id
JOIN pedido as ped on ped.id = pp.id_pedido	
JOIN cliente as c on c.id = ped.id_cliente
JOIN endereco as e on e.id_cliente = c.id
ORDER BY ped.id, prod.id;