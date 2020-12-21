USE projeto_b;

CREATE TABLE usuario
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  s_nome            VARCHAR(150) NOT NULL,                # NOME DO usuario
  s_email           VARCHAR(150) NOT NULL,                # EMAIL DO usuario
  d_data_nasc       DATE         NOT NULL,                # DATA DE NASCIMENTO
  s_senha           VARCHAR(150) NOT NULL,                # SENHA
  s_flag_tipo       CHAR(1) NOT NULL,                # TIPO PESSOA FISICA(F) OU JURIDICA(J) 
  s_ativo           CHAR(1) NOT NULL,                # FLAG ATIVO
  PRIMARY KEY     (id)                                    # ID CHAVE PRIMARIA
); 

CREATE TABLE cpf
(
  s_cpf             VARCHAR(14)  NOT NULL,                # NUM_CPF
  n_id_usuario      INT unsigned NOT NULL,                # ID DO usuario
  PRIMARY KEY     (s_cpf),                                # CPF CHAVE PRIMARIA
  FOREIGN KEY (n_id_usuario)                              # ID_usuario CHAVE ESTRANGEIRA
        REFERENCES usuario(id)
);
CREATE TABLE cnpj
(
  s_cnpj             VARCHAR(18) NOT NULL,                 # NUM_cnpj
  n_id_usuario      INT unsigned NOT NULL,                 # ID DO usuario
  PRIMARY KEY     (s_cnpj),                                # cnpj CHAVE PRIMARIA
  FOREIGN KEY (n_id_usuario)                               # ID_usuario CHAVE ESTRANGEIRA
        REFERENCES usuario(id)
);

CREATE TABLE pais
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  s_pais            VARCHAR(150) NOT NULL,                # NOME DO PAIS
  n_cod_pais        INT          NOT NULL,                # CODIGO DO PAIS
  PRIMARY KEY     (id)                                    # ID CHAVE PRIMARIA
); 
CREATE TABLE ddd
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  n_ddd             INT unsigned NOT NULL,                # CODIGO DDD
  n_id_pais         INT  unsigned NOT NULL,               # ID CODIGO DO PAIS
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (n_id_pais)                                 # ID DO PAIS CHAVE ESTRANGEIRA
  REFERENCES pais(id)
); 

CREATE TABLE telefone
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  n_telefone        INT unsigned NOT NULL,                # TELEFONE
  n_id_usuario      INT unsigned NOT NULL,                # ID usuario
  n_id_ddd          INT unsigned NOT NULL,                # ID CODIGO DDD
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (n_id_usuario)                              # ID_usuario CHAVE ESTRANGEIRA
  REFERENCES usuario(ID),
  FOREIGN KEY (n_id_ddd)                                  # ID_DDD CHAVE ESTRANGEIRA
  REFERENCES ddd(id)
); 

CREATE TABLE estado
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  s_estado          VARCHAR(150) NOT NULL,                # NOME ESTADO
  s_uf_estado       VARCHAR(2)   NOT NULL,                # UF DO ESTADO
  PRIMARY KEY     (id)                                    # ID CHAVE PRIMARIA
); 

CREATE TABLE cidade
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  s_cidade          VARCHAR(150) NOT NULL,                # NOME DA CIDADE
  n_id_estado       INT unsigned NOT NULL,                # ID DO ESTADO
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (n_id_estado)                               # ID DO ESTADO CHAVE ESTRANGEIRA
  REFERENCES estado(id)
);

CREATE TABLE endereco
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  s_endereco        VARCHAR(150) NOT NULL,                # ENDERECO
  n_cep             INT unsigned NOT NULL,                # NUMERO DO CEP
  n_id_cidade       INT unsigned NOT NULL,                # ID DA CIDADE
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (n_id_cidade)                               # ID DA CIDADE CHAVE ESTRANGEIRA
  REFERENCES cidade(id)
);

CREATE TABLE usuario_x_endereco
(
  id                INT unsigned NOT NULL AUTO_INCREMENT, # ID UNICO E AUTO INCREMENTAVEL
  n_id_usuario      INT unsigned NOT NULL,                # ID DO usuario
  n_id_endereco     INT unsigned NOT NULL,                # ID DO ENDERECO
  n_num_end         INT unsigned,                         # NUMERO DO ENDERECO
  s_flag_principal  CHAR(1),                              # ENDERECO PRINCIPAL, SE SIM FLAG "S" 
  s_flag_ativo      CHAR(1)   NOT NULL,                   # FLAG ATIVO SIM "S"/NAO "N" 
  PRIMARY KEY     (id),                                   # ID CHAVE PRIMARIA
  FOREIGN KEY (n_id_usuario)                              # ID DO usuario CHAVE ESTRANGEIRA
  REFERENCES usuario(ID),
  FOREIGN KEY (n_id_endereco)                             # ID DO ENDERECO CHAVE ESTRANGEIRA
  REFERENCES endereco(id)
);
DELIMITER $$
create procedure Cria_Cadastro(IN nome varchar(150),
                    IN email varchar(150), IN data Date,
                    IN senha varchar(150),IN flag_f_j char(1), OUT id_out INT)

begin
    insert into usuario (
                s_nome,
                s_email,
                d_data_nasc,
                s_senha,
                s_flag_tipo,	
                s_ativo)
                Values
                (nome,
                email,
                data,
                senha,
                flag_f_j,
                'S');
Select id
INTO id_out
from usuario where s_email= email;

end;
$$

insert into estado (s_estado,s_uf_estado) value ('ACRE','AC');
insert into estado (s_estado,s_uf_estado) value ('ALAGOAS','AL');
insert into estado (s_estado,s_uf_estado) value ('AMAPÁ','AP');
insert into estado (s_estado,s_uf_estado) value ('AMAZONAS','AM');
insert into estado (s_estado,s_uf_estado) value ('BAHIA','BA');
insert into estado (s_estado,s_uf_estado) value ('CEARÁ','CE');
insert into estado (s_estado,s_uf_estado) value ('DISTRITO FEDERAL','DF');
insert into estado (s_estado,s_uf_estado) value ('ESPÍRITO SANTO','ES');
insert into estado (s_estado,s_uf_estado) value ('GOIÁS','GO');
insert into estado (s_estado,s_uf_estado) value ('MARANHÃO','MA');
insert into estado (s_estado,s_uf_estado) value ('MATO GROSSO','MT');
insert into estado (s_estado,s_uf_estado) value ('MATO GROSSO DO SUL','MS');
insert into estado (s_estado,s_uf_estado) value ('MINAS GERAIS','MG');
insert into estado (s_estado,s_uf_estado) value ('PARÁ','PA');
insert into estado (s_estado,s_uf_estado) value ('PARAÍBA','PB');
insert into estado (s_estado,s_uf_estado) value ('PARANÁ','PR');
insert into estado (s_estado,s_uf_estado) value ('PERNAMBUCO','PE');
insert into estado (s_estado,s_uf_estado) value ('PIAUÍ','PI');
insert into estado (s_estado,s_uf_estado) value ('RIO DE JANEIRO','RJ');
insert into estado (s_estado,s_uf_estado) value ('RIO GRANDE DO NORTE','RN');
insert into estado (s_estado,s_uf_estado) value ('RIO GRANDE DO SUL','RS');
insert into estado (s_estado,s_uf_estado) value ('RONDONIA','RO');
insert into estado (s_estado,s_uf_estado) value ('RORAIMA','RR');
insert into estado (s_estado,s_uf_estado) value ('SANTA CATARINA','SC');
insert into estado (s_estado,s_uf_estado) value ('SÃO PAULO','SP');
insert into estado (s_estado,s_uf_estado) value ('SERGIPE','SE');
insert into estado (s_estado,s_uf_estado) value ('TOCANTINS','TO');
insert into pais set n_cod_pais = '55', s_pais = 'Brasil';
insert into ddd (n_ddd,n_id_pais) value ('68','1');
insert into ddd (n_ddd,n_id_pais) value ('82','1');
insert into ddd (n_ddd,n_id_pais) value ('96','1');
insert into ddd (n_ddd,n_id_pais) value ('97','1');
insert into ddd (n_ddd,n_id_pais) value ('92','1');
insert into ddd (n_ddd,n_id_pais) value ('71','1');
insert into ddd (n_ddd,n_id_pais) value ('73','1');
insert into ddd (n_ddd,n_id_pais) value ('74','1');
insert into ddd (n_ddd,n_id_pais) value ('77','1');
insert into ddd (n_ddd,n_id_pais) value ('72','1');
insert into ddd (n_ddd,n_id_pais) value ('75','1');
insert into ddd (n_ddd,n_id_pais) value ('85','1');
insert into ddd (n_ddd,n_id_pais) value ('88','1');
insert into ddd (n_ddd,n_id_pais) value ('61','1');
insert into ddd (n_ddd,n_id_pais) value ('27','1');
insert into ddd (n_ddd,n_id_pais) value ('28','1');
insert into ddd (n_ddd,n_id_pais) value ('62','1');
insert into ddd (n_ddd,n_id_pais) value ('64','1');
insert into ddd (n_ddd,n_id_pais) value ('98','1');
insert into ddd (n_ddd,n_id_pais) value ('99','1');
insert into ddd (n_ddd,n_id_pais) value ('65','1');
insert into ddd (n_ddd,n_id_pais) value ('66','1');
insert into ddd (n_ddd,n_id_pais) value ('67','1');
insert into ddd (n_ddd,n_id_pais) value ('31','1');
insert into ddd (n_ddd,n_id_pais) value ('32','1');
insert into ddd (n_ddd,n_id_pais) value ('33','1');
insert into ddd (n_ddd,n_id_pais) value ('34','1');
insert into ddd (n_ddd,n_id_pais) value ('35','1');
insert into ddd (n_ddd,n_id_pais) value ('36','1');
insert into ddd (n_ddd,n_id_pais) value ('37','1');
insert into ddd (n_ddd,n_id_pais) value ('38','1');
insert into ddd (n_ddd,n_id_pais) value ('91','1');
insert into ddd (n_ddd,n_id_pais) value ('93','1');
insert into ddd (n_ddd,n_id_pais) value ('94','1');
insert into ddd (n_ddd,n_id_pais) value ('83','1');
insert into ddd (n_ddd,n_id_pais) value ('41','1');
insert into ddd (n_ddd,n_id_pais) value ('42','1');
insert into ddd (n_ddd,n_id_pais) value ('43','1');
insert into ddd (n_ddd,n_id_pais) value ('44','1');
insert into ddd (n_ddd,n_id_pais) value ('45','1');
insert into ddd (n_ddd,n_id_pais) value ('46','1');
insert into ddd (n_ddd,n_id_pais) value ('81','1');
insert into ddd (n_ddd,n_id_pais) value ('87','1');
insert into ddd (n_ddd,n_id_pais) value ('86','1');
insert into ddd (n_ddd,n_id_pais) value ('21','1');
insert into ddd (n_ddd,n_id_pais) value ('22','1');
insert into ddd (n_ddd,n_id_pais) value ('24','1');
insert into ddd (n_ddd,n_id_pais) value ('83','1');
insert into ddd (n_ddd,n_id_pais) value ('51','1');
insert into ddd (n_ddd,n_id_pais) value ('53','1');
insert into ddd (n_ddd,n_id_pais) value ('54','1');
insert into ddd (n_ddd,n_id_pais) value ('55','1');
insert into ddd (n_ddd,n_id_pais) value ('69','1');
insert into ddd (n_ddd,n_id_pais) value ('95','1');
insert into ddd (n_ddd,n_id_pais) value ('47','1');
insert into ddd (n_ddd,n_id_pais) value ('48','1');
insert into ddd (n_ddd,n_id_pais) value ('49','1');
insert into ddd (n_ddd,n_id_pais) value ('11','1');
insert into ddd (n_ddd,n_id_pais) value ('12','1');
insert into ddd (n_ddd,n_id_pais) value ('13','1');
insert into ddd (n_ddd,n_id_pais) value ('14','1');
insert into ddd (n_ddd,n_id_pais) value ('15','1');
insert into ddd (n_ddd,n_id_pais) value ('16','1');
insert into ddd (n_ddd,n_id_pais) value ('17','1');
insert into ddd (n_ddd,n_id_pais) value ('18','1');
insert into ddd (n_ddd,n_id_pais) value ('19','1');
insert into ddd (n_ddd,n_id_pais) value ('79','1');
insert into ddd (n_ddd,n_id_pais) value ('63','1');
insert into cidade SET s_cidade = 'Abdon Batista',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Abelardo Luz',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Agrolândia',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Agronômica',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Água Doce',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Águas de Chapecó',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Águas Frias',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Águas Mornas',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Alfredo Wagner',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Alto Bela Vista',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Anchieta',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Angelina',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Anita Garibaldi',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Anitápolis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Antônio Carlos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Apiúna',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Arabutã',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Araquari',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Araranguá',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Armazém',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Arroio Trinta',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Arvoredo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ascurra',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Atalanta',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Aurora',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Balneário Arroio do Silva',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Balneário Barra do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Balneário Camboriú',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Balneário Gaivota',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Balneário Piçarras',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Balneário Rincão',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Bandeirante',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Barra Bonita',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Barra Velha',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Bela Vista do Toldo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Belmonte',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Benedito Novo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Biguaçu',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Blumenau',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Bocaína do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Bom Jardim da Serra',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Bom Jesus',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Bom Jesus do Oeste',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Bom Retiro',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Bombinhas',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Botuverá',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Braço do Norte',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Braço do Trombudo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Brunópolis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Brusque',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Caçador',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Caibi',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Calmon',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Camboriú',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Campo Alegre',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Campo Belo do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Campo Erê',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Campos Novos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Canelinha',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Canoinhas',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Capão Alto',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Capinzal',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Capivari de Baixo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Catanduvas',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Caxambu do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Celso Ramos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Cerro Negro',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Chapadão do Lageado',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Chapecó',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Cocal do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Concórdia',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Cordilheira Alta',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Coronel Freitas',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Coronel Martins',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Correia Pinto',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Corupá',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Criciúma',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Cunha Porã',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Cunhataí',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Curitibanos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Descanso',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Dionísio Cerqueira',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Dona Emma',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Doutor Pedrinho',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Entre Rios',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ermo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Erval Velho',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Faxinal dos Guedes',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Flor do Sertão',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Florianópolis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Formosa do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Forquilhinha',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Fraiburgo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Frei Rogério',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Galvão',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Garopaba',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Garuva',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Gaspar',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Governador Celso Ramos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Grão Pará',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Gravatal',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Guabiruba',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Guaraciaba',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Guaramirim',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Guarujá do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Guatambú',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Herval D Oeste',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ibiam',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ibicaré',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ibirama',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Içara',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ilhota',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Imaruí',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Imbituba',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Imbuia',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Indaial',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Iomerê',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ipira',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Iporã do Oeste',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ipuaçu',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ipumirim',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Iraceminha',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Irani',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Irati',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Irineópolis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Itá',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Itaiópolis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Itajaí',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Itapema',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Itapiranga',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Itapoá',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ituporanga',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Jaborá',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Jacinto Machado',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Jaguaruna',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Jaraguá do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Jardinópolis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Joaçaba',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Joinville',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'José Boiteux',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Jupiá',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Lacerdópolis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Lages',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Laguna',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Lajeado Grande',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Laurentino',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Lauro Müller',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Lebon Régis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Leoberto Leal',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Lindóia do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Lontras',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Luiz Alves',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Luzerna',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Macieira',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Mafra',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Major Gercino',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Major Vieira',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Maracajá',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Maravilha',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Marema',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Massaranduba',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Matos Costa',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Meleiro',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Mirim Doce',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Modelo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Mondaí',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Monte Carlo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Monte Castelo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Morro da Fumaça',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Morro Grande',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Navegantes',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Nova Erechim',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Nova Itaberaba',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Nova Trento',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Nova Veneza',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Novo Horizonte',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Orleans',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Otacílio Costa',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ouro',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ouro Verde',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Paial',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Painel',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Palhoça',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Palma Sola',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Palmeira',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Palmitos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Papanduva',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Paraíso',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Passo de Torres',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Passos Maia',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Paulo Lopes',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Pedras Grandes',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Penha',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Peritiba',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Pescaria Brava',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Petrolândia',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Pinhalzinho',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Pinheiro Preto',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Piratuba',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Planalto Alegre',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Pomerode',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ponte Alta',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ponte Alta do Norte',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Ponte Serrada',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Porto Belo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Porto União',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Pouso Redondo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Praia Grande',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Presidente Castello Branco',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Presidente Getúlio',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Presidente Nereu',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Princesa',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Quilombo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rancho Queimado',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rio das Antas',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rio do Campo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rio do Oeste',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rio do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rio dos Cedros',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rio Fortuna',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rio Negrinho',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rio Rufino',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Riqueza',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Rodeio',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Romelândia',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Salete',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Saltinho',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Salto Veloso',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Sangão',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Santa Cecília',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Santa Helena',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Santa Rosa de Lima',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Santa Rosa do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Santa Terezinha',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Santa Terezinha do Progresso',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Santiago do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Santo Amaro da Imperatriz',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Bento do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Bernardino',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Bonifácio',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Carlos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Cristóvão do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Domingos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Francisco do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São João Batista',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São João do Itaperiú',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São João do Oeste',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São João do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Joaquim',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São José',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São José do Cedro',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São José do Cerrito',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Lourenço do Oeste',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Ludgero',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Martinho',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Miguel da Boa Vista',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Miguel do Oeste',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'São Pedro de Alcântara',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Saudades',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Schroeder',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Seara',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Serra Alta',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Siderópolis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Sombrio',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Sul Brasil',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Taió',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Tangará',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Tigrinhos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Tijucas',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Timbé do Sul',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Timbó',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Timbó Grande',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Três Barras',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Treviso',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Treze de Maio',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Treze Tílias',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Trombudo Central',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Tubarão',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Tunápolis',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Turvo',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'União do Oeste',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Urubici',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Urupema',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Urussanga',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Vargeão',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Vargem',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Vargem Bonita',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Vidal Ramos',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Videira',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Vitor Meireles',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Witmarsum',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Xanxerê',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Xavantina',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Xaxim',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');
insert into cidade SET s_cidade = 'Zortéa',n_id_estado =  (select id from estado where estado.s_uf_estado ='SC');