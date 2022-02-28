-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 28 fév. 2022 à 15:11
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `magasin`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Code_client` int(11) NOT NULL,
  `nom` varchar(254) NOT NULL,
  `prénom` varchar(254) NOT NULL,
  `adresse` text NOT NULL,
  `numéro_de_téléphone` bigint(11) NOT NULL,
  `email` text NOT NULL,
  `mot_de_passe` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `Numéro_de_commande` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `adresse_livraison` text NOT NULL,
  `code_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Numéro_de_commande`, `date_commande`, `adresse_livraison`, `code_client`) VALUES
(99, '0000-00-00', 'IUJYUGHJK', 908);

-- --------------------------------------------------------

--
-- Structure de la table `détailcommande`
--

CREATE TABLE `détailcommande` (
  `Quantité_commandé` int(11) NOT NULL,
  `Code_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `Code_produit` int(11) NOT NULL,
  `libellé` varchar(254) NOT NULL,
  `description` text NOT NULL,
  `prix_unitaire` int(11) NOT NULL,
  `quantité_en_stock` int(11) NOT NULL,
  `Numéro_de_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`Code_produit`, `libellé`, `description`, `prix_unitaire`, `quantité_en_stock`, `Numéro_de_commande`) VALUES
(200, 'JKHUKJ', 'descrHIUHKJiption', 29, 899, 99);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Code_client`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`Numéro_de_commande`);

--
-- Index pour la table `détailcommande`
--
ALTER TABLE `détailcommande`
  ADD PRIMARY KEY (`Quantité_commandé`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`Code_produit`),
  ADD KEY `test` (`Numéro_de_commande`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `détailcommande`
--
ALTER TABLE `détailcommande`
  MODIFY `Quantité_commandé` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `Code_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `test` FOREIGN KEY (`Numéro_de_commande`) REFERENCES `commande` (`Numéro_de_commande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
