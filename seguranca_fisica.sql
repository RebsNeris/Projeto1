-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/11/2023 às 17:47
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

--
-- Despejando dados para a tabela `cameras`
--

INSERT INTO `cameras` (`ID`, `Modelo`, `IP`, `Resolucao`, `Deleted`) VALUES
(1, 'Intelbras', '192.168.0.1', '420p', 0x30),
(2, 'Intelbras', '192.168.0.2', '720p', 0x31),
(3, 'Intelbras', '192.168.0.3', '720p', 0x30),
(4, 'Intelbras', '192.168.0.4', '720p', 0x31),
(5, 'Intelbras', '192.168.0.5', '420p', 0x31),
(6, 'Intelbras', '192.168.0.6', '420p', 0x30);

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
-- Despejando dados para a tabela `localidade`
--

INSERT INTO `localidade` (`ID`, `Local`, `Ambiente`, `Cidade`, `ID_camera`, `Deleted`) VALUES
(7, 'Rainha Guilhermina', 'Porta principal', 'Vitória', 3, 0x30),
(8, 'Rainha Guilhermina', 'Porta Hall', 'Vitória', 1, 0x30),
(9, 'Vogue', 'Porta Principal', 'Vitória', 5, 0x30),
(10, 'Vogue', 'Porta Hall', 'Vitória', 6, 0x30),
(11, 'Ilhas do pacifico', 'porta principal', 'vila velha', 4, 0x31),
(12, 'Ilhas do pacifico', 'garagem', 'vila velha', 2, 0x31);

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
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `localidade`
--
ALTER TABLE `localidade`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
