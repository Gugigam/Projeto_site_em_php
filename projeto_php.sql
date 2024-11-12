-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 12/11/2024 às 01:36
-- Versão do servidor: 8.3.0
-- Versão do PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_php`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `anuidades`
--

DROP TABLE IF EXISTS `anuidades`;
CREATE TABLE IF NOT EXISTS `anuidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ano` year NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `associados`
--

DROP TABLE IF EXISTS `associados`;
CREATE TABLE IF NOT EXISTS `associados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_filiacao` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `associados`
--

INSERT INTO `associados` (`id`, `nome`, `email`, `cpf`, `data_filiacao`) VALUES
(1, 'Paulo', 'PauloCezar@gmail.com', '111111111-11', '2024-10-30'),
(2, 'Enzio', 'EnzioDanilo@gmail.com', '123456780-00', '2018-12-12'),
(3, 'Rosado', 'Tiagoago@gmail.com', '987654320-99', '2023-12-30'),
(4, 'Danillo', 'DanilloSilva@gmail.com', '987654320-09', '2022-05-05'),
(5, 'Claudio', 'ClaudioLira@gmail.com', '123456780-88', '2021-04-19'),
(6, 'Landim', 'LandimGustavo0@gmail.com', '839275431-00', '2019-02-11'),
(7, 'Gustavo', 'GustavoQuezado@gmail.com', '449494949-49', '2016-11-11'),
(8, 'Giovanna', 'GiovannaLouise@gmail.com', '100100100-01', '2017-09-04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
CREATE TABLE IF NOT EXISTS `pagamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `associado_id` int NOT NULL,
  `anuidade_id` int NOT NULL,
  `status` enum('pago','pendente') DEFAULT 'pendente',
  `data_pagamento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `associado_id` (`associado_id`),
  KEY `anuidade_id` (`anuidade_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pagamentos`
--

INSERT INTO `pagamentos` (`id`, `associado_id`, `anuidade_id`, `status`, `data_pagamento`) VALUES
(1, 1, 9, 'pago', '2024-04-02'),
(2, 1, 10, 'pago', '2025-02-02'),
(3, 2, 3, 'pago', '2018-02-01'),
(4, 2, 4, 'pago', '2019-09-01'),
(5, 2, 5, 'pago', '2021-01-01'),
(6, 2, 6, 'pago', '2021-12-01'),
(7, 2, 7, 'pendente', '0001-01-01'),
(8, 2, 8, 'pendente', '0001-01-01'),
(9, 2, 9, 'pendente', '0001-01-01'),
(10, 2, 10, 'pendente', '0001-01-01'),
(11, 3, 8, 'pago', '2023-04-01'),
(12, 3, 9, 'pago', '2024-02-01'),
(13, 3, 10, 'pago', '2025-02-01'),
(14, 4, 7, 'pago', '2022-01-01'),
(15, 4, 8, 'pendente', '0001-01-01'),
(16, 4, 9, 'pendente', '0001-01-01'),
(17, 4, 10, 'pendente', '0001-01-01'),
(18, 5, 6, 'pago', '2021-01-03'),
(19, 5, 7, 'pago', '2022-01-12'),
(20, 5, 8, 'pago', '2023-04-03'),
(21, 5, 9, 'pago', '2024-02-23'),
(22, 5, 10, 'pago', '2025-01-07'),
(23, 6, 4, 'pago', '2019-06-01'),
(24, 6, 5, 'pago', '2020-01-03'),
(25, 6, 6, 'pago', '2021-12-13'),
(26, 6, 7, 'pago', '2022-08-02'),
(27, 6, 8, 'pendente', '0001-01-01'),
(28, 6, 9, 'pendente', '0001-01-01'),
(29, 6, 10, 'pendente', '0001-01-01'),
(30, 7, 1, 'pago', '2016-01-01'),
(31, 7, 2, 'pago', '2017-02-01'),
(32, 7, 3, 'pago', '2018-02-15'),
(33, 7, 4, 'pago', '2019-02-25'),
(34, 7, 5, 'pago', '2020-01-30'),
(35, 7, 6, 'pago', '2021-01-14'),
(36, 7, 7, 'pago', '2022-02-26'),
(37, 7, 8, 'pago', '2023-10-06'),
(38, 7, 9, 'pago', '2024-01-11'),
(39, 7, 10, 'pago', '2025-02-15'),
(40, 8, 2, 'pago', '2017-01-01'),
(41, 8, 3, 'pago', '2018-01-01'),
(42, 8, 4, 'pago', '2019-01-01'),
(43, 8, 5, 'pago', '2020-01-01'),
(44, 8, 6, 'pago', '2021-01-01'),
(45, 8, 7, 'pago', '2022-01-01'),
(46, 8, 8, 'pago', '2023-01-01'),
(47, 8, 9, 'pago', '2024-01-01'),
(48, 8, 10, 'pago', '2025-01-01');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
