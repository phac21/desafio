/*
Scrips para a criação das tabelas do banco de dados:

CREATE TABLE estados (
    id_estado INT PRIMARY KEY,
    uf CHAR(2) UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE tipos_telefone (
    id_tipo INT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES estados(id_estado)
);

CREATE TABLE telefones (
    id_telefone INT PRIMARY KEY,
    id_cliente INT,
    id_tipo INT,
    numero VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_tipo) REFERENCES tipos_telefone(id_tipo)
);

-- Relacionamento entre as tabelas:
estados (1) ----< clientes (1) ----< telefones (N) >---- (1) tipos_telefone
PK: id_estado    PK: id_cliente     PK: id_telefone        PK: id_tipo
    uf               id_estado (FK)      id_cliente (FK)
    nome                                 id_tipo (FK)
                                        numero
--insert para teste
-- Populando a tabela estados
INSERT INTO estados (id_estado, uf, nome) VALUES
(1, 'SP', 'São Paulo'),
(2, 'RJ', 'Rio de Janeiro'),
(3, 'MG', 'Minas Gerais'),
(4, 'ES', 'Espírito Santo'),
(5, 'PR', 'Paraná');

-- Populando a tabela tipos_telefone
INSERT INTO tipos_telefone (id_tipo, descricao) VALUES
(1, 'Celular'),
(2, 'Comercial'),
(3, 'Residencial'),
(4, 'WhatsApp'),
(5, 'Recados');

-- Populando a tabela clientes
INSERT INTO clientes (id_cliente, razao_social, id_estado) VALUES
(1, 'Empresa ABC Ltda', 1),        -- SP
(2, 'Comercial XYZ S.A.', 1),      -- SP
(3, 'Distribuidora 123', 2),       -- RJ
(4, 'Indústria São Paulo', 1),     -- SP
(5, 'Atacado Mineiro', 3),         -- MG
(6, 'Loja Paulista', 1),           -- SP
(7, 'Comércio SP', 1);             -- SP

-- Populando a tabela telefones
INSERT INTO telefones (id_telefone, id_cliente, id_tipo, numero) VALUES
(1, 1, 1, '11-98765-4321'),
(2, 1, 2, '11-3333-4444'), 
(3, 2, 2, '11-2222-3333'),   
(4, 2, 4, '11-99988-7777'),   
(5, 4, 2, '11-4444-5555'),    
(6, 4, 1, '11-98888-7777'),   
(7, 6, 2, '11-5555-6666'),   
(8, 7, 3, '11-6666-7777'),   
(9, 7, 1, '11-97777-8888'),  
(10, 3, 1, '21-98765-1234'), 
(11, 3, 2, '21-2222-1111'),    
(12, 3, 4, '21-99999-8888'),  
(13, 5, 2, '31-3333-2222'),    
(14, 5, 1, '31-98888-9999'),  
(15, 5, 4, '31-97777-6666'); 

--Consulta SQL:
  SELECT 
      c.id_cliente,
      c.razao_social,
      t.numero,
      tt.descricao as tipo_telefone
  FROM 
      clientes c
      INNER JOIN estados e ON c.id_estado = e.id_estado
      LEFT JOIN telefones t ON c.id_cliente = t.id_cliente
      LEFT JOIN tipos_telefone tt ON t.id_tipo = tt.id_tipo
  WHERE 
      e.uf = 'SP'
  ORDER BY 
      c.razao_social, tt.descricao;
*/

/* 
Explicações:
  Estrutura das Tabelas:
    estados: Armazena os estados brasileiros
    tipos_telefone: Cadastro de tipos de telefone (celular, comercial, etc.)
    clientes: Dados principais dos clientes
    telefones: Números de telefone vinculados aos clientes
  Relacionamentos:
    Um estado pode ter vários clientes (1:N)
    Um cliente pode ter vários telefones (1:N)
    Um tipo de telefone pode estar em vários telefones (1:N)
  Sobre a Consulta SQL:
    Usa INNER JOIN com estados para garantir que só trará clientes de SP
    Usa LEFT JOIN com telefones para trazer todos os clientes, mesmo sem telefones
    Ordena por razão social e tipo de telefone para melhor visualização
    Traz o tipo do telefone para melhor identificação
  Esta estrutura permite:
    Cadastro ilimitado de telefones por cliente
    Flexibilidade para novos tipos de telefone
    Cadastro de novos estados
    Integridade referencial através das chaves estrangeiras
    Consultas eficientes através dos relacionamentos estabelecidos
*/