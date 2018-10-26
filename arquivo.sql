# ************************************************************
# Sequel Pro SQL dump
# Vers�o 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Base de Dados: curso_spring
# Tempo de Gera��o: 2018-10-26 19:30:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela categoria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;

INSERT INTO `categoria` (`id`, `nome`)
VALUES
	(1,'Informática'),
	(2,'Escritório'),
	(3,'Escritório'),
	(4,'Eletrônicos'),
	(5,'Jardinagem'),
	(6,'Decoração'),
	(7,'Perfumaria');

/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela cidade
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cidade`;

CREATE TABLE `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(255) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkworrwk40xj58kevvh3evi500` (`estado_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;

INSERT INTO `cidade` (`id`, `cidade`, `estado_id`)
VALUES
	(1,'Uberlândia',1),
	(2,'São Paulo',2),
	(3,'Campinas',2);

/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela cliente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf_ou_cnpj` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cmxo70m08n43599l3h0h07cc6` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;

INSERT INTO `cliente` (`id`, `cpf_ou_cnpj`, `email`, `nome`, `tipo`)
VALUES
	(1,'36378912377','maria@gmail.com','Maria Silva',1);

/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela endereco
# ------------------------------------------------------------

DROP TABLE IF EXISTS `endereco`;

CREATE TABLE `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bairro` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `cidade_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8b1kcb3wucapb8dejshyn5fsx` (`cidade_id`),
  KEY `FK8s7ivtl4foyhrfam9xqom73n9` (`cliente_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;

INSERT INTO `endereco` (`id`, `bairro`, `cep`, `complemento`, `logradouro`, `numero`, `cidade_id`, `cliente_id`)
VALUES
	(1,'Jardim','38220834','Apto 303','Rua Flores','300',1,1),
	(2,'Centro','38777012','Sala 800','Avenida Matos','105',2,1);

/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela estado
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;

INSERT INTO `estado` (`id`, `nome`)
VALUES
	(1,'Minas Gerais'),
	(2,'São Paulo');

/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela item_pedido
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item_pedido`;

CREATE TABLE `item_pedido` (
  `desconto` double DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `pedido_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  PRIMARY KEY (`pedido_id`,`produto_id`),
  KEY `FKtk55mn6d6bvl5h0no5uagi3sf` (`produto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;

INSERT INTO `item_pedido` (`desconto`, `preco`, `quantidade`, `pedido_id`, `produto_id`)
VALUES
	(0,2000,1,1,1),
	(0,80,2,1,3),
	(100,800,1,2,2);

/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela pagamento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pagamento`;

CREATE TABLE `pagamento` (
  `pedido` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`pedido`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;

INSERT INTO `pagamento` (`pedido`, `estado`)
VALUES
	(1,2),
	(2,1);

/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela pagamento_com_boleto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pagamento_com_boleto`;

CREATE TABLE `pagamento_com_boleto` (
  `data_pagamento` datetime DEFAULT NULL,
  `data_vencimento` datetime DEFAULT NULL,
  `pedido` int(11) NOT NULL,
  PRIMARY KEY (`pedido`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `pagamento_com_boleto` WRITE;
/*!40000 ALTER TABLE `pagamento_com_boleto` DISABLE KEYS */;

INSERT INTO `pagamento_com_boleto` (`data_pagamento`, `data_vencimento`, `pedido`)
VALUES
	(NULL,'2017-10-20 00:00:00',2);

/*!40000 ALTER TABLE `pagamento_com_boleto` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela pagamento_com_cartao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pagamento_com_cartao`;

CREATE TABLE `pagamento_com_cartao` (
  `numero_de_parcelas` int(11) DEFAULT NULL,
  `pedido` int(11) NOT NULL,
  PRIMARY KEY (`pedido`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `pagamento_com_cartao` WRITE;
/*!40000 ALTER TABLE `pagamento_com_cartao` DISABLE KEYS */;

INSERT INTO `pagamento_com_cartao` (`numero_de_parcelas`, `pedido`)
VALUES
	(6,1);

/*!40000 ALTER TABLE `pagamento_com_cartao` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela pedido
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instante` datetime DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `endereco_de_entrega_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK30s8j2ktpay6of18lbyqn3632` (`cliente_id`),
  KEY `FK1fihyy2fnocpuwc74674qmfkv` (`endereco_de_entrega_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;

INSERT INTO `pedido` (`id`, `instante`, `cliente_id`, `endereco_de_entrega_id`)
VALUES
	(1,'2017-09-30 10:32:00',1,1),
	(2,'2017-10-10 19:35:00',1,2);

/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela produto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `produto`;

CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `preco` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;

INSERT INTO `produto` (`id`, `nome`, `preco`)
VALUES
	(1,'Computador',2000),
	(2,'Impressora',800),
	(3,'Mouse',80),
	(4,'Mesa de escritório',300),
	(5,'Toalha',50),
	(6,'Colcha',200),
	(7,'Tv true color',1200),
	(8,'Roçadeira',800),
	(9,'Abajour',100),
	(10,'Pendente',180),
	(11,'Shampoo',90);

/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela produto_categoria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `produto_categoria`;

CREATE TABLE `produto_categoria` (
  `produto_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  KEY `FKq3g33tp7xk2juh53fbw6y4y57` (`categoria_id`),
  KEY `FK1c0y58d3n6x3m6euv2j3h64vt` (`produto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `produto_categoria` WRITE;
/*!40000 ALTER TABLE `produto_categoria` DISABLE KEYS */;

INSERT INTO `produto_categoria` (`produto_id`, `categoria_id`)
VALUES
	(1,1),
	(1,4),
	(2,1),
	(2,2),
	(2,4),
	(3,1),
	(3,4),
	(4,2),
	(5,3),
	(6,3),
	(7,4),
	(8,5),
	(9,6),
	(10,6),
	(11,7);

/*!40000 ALTER TABLE `produto_categoria` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela telefone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `telefone`;

CREATE TABLE `telefone` (
  `cliente_id` int(11) NOT NULL,
  `telefones` varchar(255) DEFAULT NULL,
  KEY `FK8aafha0njkoyoe3kvrwsy3g8u` (`cliente_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;

INSERT INTO `telefone` (`cliente_id`, `telefones`)
VALUES
	(1,'27363323'),
	(1,'93838393');

/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
