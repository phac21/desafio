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