CREATE DATABASE PROJETO_B;
USE PROJETO_B;

CREATE TABLE USUARIO
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  S_NOME            VARCHAR(150) NOT NULL,                # NOME DO USUARIO
  S_EMAIL           VARCHAR(150) NOT NULL,                # EMAIL DO USUARIO
  D_DATA_NASCIMENTO DATE         NOT NULL,                # DATA DE NASCIMENTO
  S_SENHA           VARCHAR(150) NOT NULL,                # SENHA
  S_FLAG_TIPO_PESSOA     CHAR(1) NOT NULL,                # TIPO PESSOA FISICA(F) OU JURIDICA(J) 
  S_FLAG_ATIVO           CHAR(1) NOT NULL,                # FLAG ATIVO
  PRIMARY KEY     (id)                                    # ID CHAVE PRIMARIA
); 

CREATE TABLE CPF
(
  S_CPF             VARCHAR(14)  NOT NULL,                # NUM_CPF
  N_ID_USUARIO      INT unsigned NOT NULL,                # ID DO USUARIO
  PRIMARY KEY     (S_CPF),                                # CPF CHAVE PRIMARIA
  FOREIGN KEY (N_ID_USUARIO)                              # ID_USUARIO CHAVE ESTRANGEIRA
        REFERENCES USUARIO(ID)
);
CREATE TABLE CNPJ
(
  S_CNPJ             VARCHAR(18) NOT NULL,                 # NUM_CNPJ
  N_ID_USUARIO      INT unsigned NOT NULL,                 # ID DO USUARIO
  PRIMARY KEY     (S_CNPJ),                                # CNPJ CHAVE PRIMARIA
  FOREIGN KEY (N_ID_USUARIO)                               # ID_USUARIO CHAVE ESTRANGEIRA
        REFERENCES USUARIO(ID)
);

CREATE TABLE PAIS
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  S_PAIS            VARCHAR(150) NOT NULL,                # NOME DO PAIS
  N_COD_PAIS        INT          NOT NULL,                # CODIGO DO PAIS
  PRIMARY KEY     (id)                                    # ID CHAVE PRIMARIA
); 
CREATE TABLE DDD
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  N_DDD             INT unsigned NOT NULL,                # CODIGO DDD
  N_ID_PAIS         INT  unsigned NOT NULL,               # ID CODIGO DO PAIS
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (N_ID_PAIS)                                 # ID DO PAIS CHAVE ESTRANGEIRA
  REFERENCES PAIS(ID)
); 

CREATE TABLE TELEFONE
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  N_TELEFONE        INT unsigned NOT NULL,                # TELEFONE
  N_ID_USUARIO      INT unsigned NOT NULL,                # ID USUARIO
  N_ID_DDD          INT unsigned NOT NULL,                # ID CODIGO DDD
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (N_ID_USUARIO)                              # ID_USUARIO CHAVE ESTRANGEIRA
  REFERENCES USUARIO(ID),
  FOREIGN KEY (N_ID_DDD)                                  # ID_DDD CHAVE ESTRANGEIRA
  REFERENCES DDD(ID)
); 

CREATE TABLE ESTADO
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  S_ESTADO          VARCHAR(150) NOT NULL,                # NOME ESTADO
  S_UF_ESTADO       VARCHAR(2)   NOT NULL,                # UF DO ESTADO
  PRIMARY KEY     (id)                                    # ID CHAVE PRIMARIA
); 

CREATE TABLE CIDADE
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  S_CIDADE          VARCHAR(150) NOT NULL,                # NOME DA CIDADE
  N_ID_ESTADO       INT unsigned NOT NULL,                # ID DO ESTADO
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (N_ID_ESTADO)                               # ID DO ESTADO CHAVE ESTRANGEIRA
  REFERENCES ESTADO(ID)
);

CREATE TABLE ENDERECO
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  S_ENDERECO        VARCHAR(150) NOT NULL,                # ENDERECO
  N_CEP             INT unsigned NOT NULL,                # NUMERO DO CEP
  N_ID_CIDADE       INT unsigned NOT NULL,                # ID DA CIDADE
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (N_ID_CIDADE)                               # ID DA CIDADE CHAVE ESTRANGEIRA
  REFERENCES CIDADE(ID)
);

CREATE TABLE USUARIO_X_ENDERECO
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  N_ID_USUARIO      INT unsigned NOT NULL,                # ID DO USUARIO
  N_ID_ENDERECO     INT unsigned NOT NULL,                # ID DO ENDERECO
  N_NUM_END         INT unsigned,                         # NUMERO DO ENDERECO
  S_FLAG_PRINCIPAL  CHAR(1),                              # ENDERECO PRINCIPAL, SE SIM FLAG "S" 
  S_FLAG_ATIVO      CHAR(1)   NOT NULL,                   # FLAG ATIVO SIM "S"/NAO "N" 
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (N_ID_USUARIO)                              # ID DO USUARIO CHAVE ESTRANGEIRA
  REFERENCES USUARIO(ID),
  FOREIGN KEY (N_ID_ENDERECO)                             # ID DO ENDERECO CHAVE ESTRANGEIRA
  REFERENCES ENDERECO(ID)
);

