-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/11/2023 às 18:05
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `seguranca_fisica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cameras`
--

CREATE TABLE `cameras` (
  `ID` int(100) NOT NULL,
  `Modelo` varchar(100) NOT NULL,
  `IP` varchar(100) NOT NULL,
  `Resolucao` varchar(100) NOT NULL,
  `Deleted` binary(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `localidade`
--

CREATE TABLE `localidade` (
  `ID` int(100) NOT NULL,
  `Local` varchar(100) NOT NULL,
  `Ambiente` varchar(100) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `ID_camera` int(100) NOT NULL,
  `Deleted` binary(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cameras`
--
ALTER TABLE `cameras`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `localidade`
--
ALTER TABLE `localidade`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_chave_estrangeira` (`ID_camera`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cameras`
--
ALTER TABLE `cameras`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `localidade`
--
ALTER TABLE `localidade`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `localidade`
--
ALTER TABLE `localidade`
  ADD CONSTRAINT `fk_chave_estrangeira` FOREIGN KEY (`ID_camera`) REFERENCES `cameras` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
