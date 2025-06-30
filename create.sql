create database fallscar;
use fallscar;
CREATE TABLE lojas (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(100) NOT NULL,
  cnpj varchar(18) NOT NULL,
  email varchar(200) NOT NULL,
  telefone varchar(20) NOT NULL,
  endereco varchar(100) NOT NULL,
  cidade varchar(50) NOT NULL,
  estado char(2) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE categorias (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(50) NOT NULL,
  descricao varchar(500) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE carros (
  id int NOT NULL AUTO_INCREMENT,
  id_categoria int NOT NULL,
  id_loja int NOT NULL,
  marca varchar(50) NOT NULL,
  modelo varchar(50) NOT NULL,
  ano year NOT NULL,
  placa varchar(8) NOT NULL,
  cor varchar(30) NOT NULL,
  tipo_combustivel varchar(30) NOT NULL,
  cambio varchar(30) NOT NULL,
  preco decimal(10,2) NOT NULL,
  manutencao boolean NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(id_categoria) REFERENCES categorias(id),
  FOREIGN KEY(loja) REFERENCES lojas(id)
);


CREATE TABLE motoristas (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(100) NOT NULL,
  cpf varchar(14) NOT NULL,
  telefone varchar(20) NOT NULL,
  loja int NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(loja) REFERENCES lojas(id)
);

CREATE TABLE clientes (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(100) NOT NULL,
  cpf varchar(14) NOT NULL,
  telefone varchar(20) NOT NULL,
  email varchar(200) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE periodos (
  id int NOT NULL AUTO_INCREMENT,
  dias int NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE alocacoes (
  id int NOT NULL AUTO_INCREMENT,
  id_cliente int NOT NULL,
  id_carro int NOT NULL,
  id_motorista int,
  id_loja int NOT NULL,
  data_retirada date NOT NULL,
  periodo_alugado int NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(id_cliente) REFERENCES clientes(id),
  FOREIGN KEY(id_carro) REFERENCES carros(id),
  FOREIGN KEY(id_motorista) REFERENCES motoristas(id),
  FOREIGN KEY(id_loja) REFERENCES lojas(id),
  FOREIGN KEY(periodo_alugado) REFERENCES periodos(id)
);

CREATE TABLE pagamentos (
  id int NOT NULL AUTO_INCREMENT,
  id_cliente int NOT NULL,
  id_alocacao int NOT NULL,
  codigo_autorizacao varchar(50) NOT NULL,
  parcelas int,
  data_pagamento date NOT NULL,
  valor decimal(10,2) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(id_cliente) REFERENCES clientes(id),
  FOREIGN KEY(id_alocacao) REFERENCES alocacoes(id)
);


