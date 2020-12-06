-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 06 juin 2020 à 14:34
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bdprojet4`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `idadresse` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `voie` varchar(45) NOT NULL,
  `codepostale` int(11) NOT NULL,
  `ville` varchar(45) NOT NULL,
  PRIMARY KEY (`idadresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`idadresse`, `numero`, `voie`, `codepostale`, `ville`) VALUES
(1, 57, 'Rue Jangot', 69007, 'Lyon'),
(2, 455, 'Rue Franklin', 69008, 'Lyon'),
(3, 1635, 'Rue de la Charité', 69004, 'Lyon'),
(4, 439, 'Rue Victor Lagrange', 69007, 'Lyon'),
(5, 545, 'Rue de Bruxelles', 69100, 'Villeurbanne'),
(6, 1266, 'Rue Alexis Perroncel', 69100, 'Villeurbanne'),
(7, 74, 'Rue Austerlitz', 69004, 'Lyon'),
(8, 992, 'Boulevard de Stalingrad', 69100, 'Villeurbanne'),
(9, 1555, 'Avenue Jean Mermoz', 69008, 'Lyon'),
(10, 3, 'Route de Genas', 69100, 'Villeurbanne');

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

DROP TABLE IF EXISTS `chef`;
CREATE TABLE IF NOT EXISTS `chef` (
  `idchef` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `idconnexion` int(11) NOT NULL,
  PRIMARY KEY (`idchef`),
  KEY `fk_Chef_Connexion1_idx` (`idconnexion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`idchef`, `nom`, `idconnexion`) VALUES
(1, 'Pierre', 1),
(2, 'Paul', 2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idclient` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `idconnexion` int(11) NOT NULL,
  `idadresse` int(11) NOT NULL,
  PRIMARY KEY (`idclient`),
  KEY `fk_Clients_Connexion1_idx` (`idconnexion`),
  KEY `fk_Clients_Adresse1_idx` (`idadresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idclient`, `nom`, `idconnexion`, `idadresse`) VALUES
(1, 'Julie', 7, 9),
(2, 'Théo', 8, 8),
(3, 'Elise', 9, 10),
(4, 'Lucas', 10, 6),
(5, 'Lucie', 11, 7),
(6, 'Jordan', 12, 5),
(7, 'Camille', 13, 3),
(8, 'Antoine', 14, 2),
(9, 'Marie', 15, 1),
(10, 'Romain', 16, 4);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idcommande` int(11) NOT NULL,
  `datecommande` datetime NOT NULL,
  `datelivraison` datetime DEFAULT NULL,
  `prixcommande` int(11) NOT NULL,
  `idlivreur` int(11) NOT NULL,
  `idclient` int(11) NOT NULL,
  PRIMARY KEY (`idcommande`),
  KEY `fk_Commande_Livreurs1_idx` (`idlivreur`),
  KEY `fk_Commande_Clients1_idx` (`idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idcommande`, `datecommande`, `datelivraison`, `prixcommande`, `idlivreur`, `idclient`) VALUES
(1, '2020-05-28 19:20:00', '2020-05-28 19:39:00', 30, 3, 5),
(2, '2020-05-28 11:41:13', '2020-05-28 11:53:00', 25, 4, 1),
(3, '2020-05-30 12:14:34', '2020-05-30 12:32:16', 15, 1, 9),
(4, '2020-05-28 06:29:00', '2020-05-28 06:35:00', 35, 1, 10),
(5, '2020-05-27 20:00:00', '2020-05-27 20:18:00', 40, 2, 2),
(6, '2020-05-26 12:00:00', '2020-05-26 12:20:00', 15, 2, 3),
(7, '2020-05-29 17:00:00', '2020-05-29 17:17:00', 60, 3, 7),
(8, '2020-05-30 16:00:00', '2020-05-30 16:15:00', 15, 4, 8),
(9, '2020-05-28 13:17:00', '2020-05-28 13:34:00', 10, 2, 6),
(10, '2020-05-25 11:39:00', '2020-05-25 11:54:00', 25, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

DROP TABLE IF EXISTS `connexion`;
CREATE TABLE IF NOT EXISTS `connexion` (
  `idconnexion` int(11) NOT NULL,
  `identifiant` varchar(45) NOT NULL,
  `motdepasse` varchar(45) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`idconnexion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `connexion`
--

INSERT INTO `connexion` (`idconnexion`, `identifiant`, `motdepasse`, `role`) VALUES
(1, 'chef1', '3e5Hrw2RL', 1),
(2, 'chef2', '3XD4dAnf3', 1),
(3, 'livreur1', 'PGq3wG4w4', 2),
(4, 'livreur2', '76gLTi4cW', 2),
(5, 'livreur3', 'Q8xQ3qM8d', 2),
(6, 'livreur4', '39SNuwhH5', 2),
(7, 'client1', '84vMp2SnY', 3),
(8, 'client2', 'MMqr668Tt', 3),
(9, 'client3', '2jRJyCp38', 3),
(10, 'client4', 'n3C9knWX3', 3),
(11, 'client5', 'x53YphVA7', 3),
(12, 'client6', 'xu3LKg5F4', 3),
(13, 'client7', 'AxWq47dC4', 3),
(14, 'client8', 'XgtGhN772', 3),
(15, 'client9', 'iN6KPgu56', 3),
(16, 'client10', 'UX6rrxU66', 3);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `idlivreur` int(11) NOT NULL,
  `disponible` tinyint(4) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `idlocalisation` int(11) NOT NULL,
  `idconnexion` int(11) NOT NULL,
  PRIMARY KEY (`idlivreur`),
  KEY `fk_Livreurs_Connexion1_idx` (`idconnexion`),
  KEY `idlocalisation` (`idlocalisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`idlivreur`, `disponible`, `nom`, `idlocalisation`, `idconnexion`) VALUES
(1, 0, 'Max', 1, 3),
(2, 0, 'Laura', 2, 4),
(3, 0, 'Alexis', 3, 5),
(4, 1, 'Lucas', 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

DROP TABLE IF EXISTS `localisation`;
CREATE TABLE IF NOT EXISTS `localisation` (
  `idlocalisation` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`idlocalisation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `localisation`
--

INSERT INTO `localisation` (`idlocalisation`, `latitude`, `longitude`) VALUES
(1, 45.75479, 4.867509),
(2, 45.749281, 4.88931),
(3, 45.726, 4.85137),
(4, 45.7689, 4.88347);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `idplat` int(11) NOT NULL,
  `idcommande` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`idplat`,`idcommande`),
  KEY `fk_Plats_has_Commande_Commande1_idx` (`idcommande`),
  KEY `fk_Plats_has_Commande_Plats1_idx` (`idplat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`idplat`, `idcommande`, `quantite`) VALUES
(2, 10, 1),
(3, 6, 1),
(5, 5, 1),
(6, 5, 1),
(7, 1, 1),
(7, 4, 1),
(8, 2, 1),
(9, 7, 2),
(10, 7, 1),
(11, 3, 1),
(13, 10, 1),
(17, 5, 1),
(19, 1, 1),
(19, 2, 1),
(19, 4, 2),
(20, 1, 1),
(20, 4, 1),
(20, 9, 1),
(22, 7, 1),
(23, 8, 1),
(24, 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `idplat` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prix` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  `dessertouplat` tinyint(4) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `date` datetime NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `idchef` int(11) NOT NULL,
  PRIMARY KEY (`idplat`),
  KEY `fk_Plats_Chef1_idx` (`idchef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`idplat`, `nom`, `prix`, `description`, `dessertouplat`, `image`, `date`, `quantite`, `idchef`) VALUES
(1, 'Moussaka', 15, 'plats fait avec des produits frais', 1, 'image1', '2020-05-25 00:00:00', 0, 2),
(2, 'Ratatouille', 20, 'plats fait avec des produits frais. ', 1, 'image2', '2020-05-25 00:00:00', 0, 1),
(3, 'Fish and chips', 15, 'plats fait avec des produits frais.  ', 1, 'image3', '2020-05-26 00:00:00', 0, 2),
(4, 'Choucroute d’Alsace', 20, 'plats fait avec des produits frais. ', 1, 'image4', '2020-05-26 00:00:00', 0, 1),
(5, 'Pâtes bolognaise', 15, 'plats fait avec des produits frais. ', 1, 'image5', '2020-05-27 00:00:00', 0, 2),
(6, 'Plateaux de sushis', 20, 'plats fait avec des produits frais. ', 1, 'image6', '2020-05-27 00:00:00', 0, 1),
(7, 'Pâtes à la carbonara', 15, 'plats fait avec des produits frais.  ', 1, 'image7', '2020-05-28 00:00:00', 0, 2),
(8, 'Pizza (Jambon, champignon)', 20, 'plats fait avec des produits frais. ', 1, 'image8', '2020-05-28 00:00:00', 0, 1),
(9, 'Kebab', 15, 'plats fait avec des produits frais.  ', 1, 'image9', '2020-05-29 00:00:00', 0, 2),
(10, 'Lasagnes', 20, 'plats fait avec des produits frais. ', 1, 'image10', '2020-05-29 00:00:00', 0, 1),
(11, 'Risotto aux champignons', 15, 'plats fait avec des produits frais. ', 1, 'image11', '2020-05-30 00:00:00', 0, 2),
(12, 'Bœuf bourguignon', 20, 'plats fait avec des produits frais. ', 1, 'image12', '2020-05-30 00:00:00', 0, 1),
(13, 'Crème brûlée', 5, 'plats fait avec des produits frais.', 2, 'image13', '2020-05-25 00:00:00', 0, 2),
(14, 'Tiramisu', 10, 'plats fait avec des produits frais.', 2, 'image14', '2020-05-25 00:00:00', 0, 1),
(15, 'Moelleux au chocolat', 5, 'plats fait avec des produits frais.', 2, 'image15', '2020-05-26 00:00:00', 0, 2),
(16, 'Banana split', 10, 'plats fait avec des produits frais.', 2, 'image16', '2020-05-26 00:00:00', 0, 1),
(17, 'Brownie', 5, 'plats fait avec des produits frais.', 2, 'image17', '2020-05-27 00:00:00', 0, 2),
(18, 'Mille feuille', 10, 'plats fait avec des produits frais.', 2, 'image18', '2020-05-27 00:00:00', 0, 1),
(19, 'Éclair au chocolat', 5, 'plats fait avec des produits frais.', 2, 'image19', '2020-05-28 00:00:00', 0, 2),
(20, 'Paris-Brest', 10, 'plats fait avec des produits frais.', 2, 'image20', '2020-05-28 00:00:00', 0, 1),
(21, 'Macaron', 5, 'plats fait avec des produits frais.', 2, 'image21', '2020-05-29 00:00:00', 0, 2),
(22, 'Kougelhopf', 10, 'plats fait avec des produits frais.', 2, 'image22', '2020-05-29 00:00:00', 0, 1),
(23, 'Choux à la crème', 5, 'plats fait avec des produits frais.', 2, 'image23', '2020-05-30 00:00:00', 0, 2),
(24, 'Kouign-amann', 10, 'plats fait avec des produits frais.', 2, 'image24', '2020-05-30 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sac_livreur`
--

DROP TABLE IF EXISTS `sac_livreur`;
CREATE TABLE IF NOT EXISTS `sac_livreur` (
  `idplat` int(11) NOT NULL,
  `idlivreur` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`idplat`,`idlivreur`),
  KEY `fk_Plats_has_Livreurs_Livreurs1_idx` (`idlivreur`),
  KEY `fk_Plats_has_Livreurs_Plats1_idx` (`idplat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sac_livreur`
--

INSERT INTO `sac_livreur` (`idplat`, `idlivreur`, `quantite`) VALUES
(11, 1, 27),
(11, 2, 3),
(11, 3, 4),
(11, 4, 17),
(12, 1, 7),
(12, 2, 21),
(12, 3, 28),
(12, 4, 6),
(23, 1, 14),
(23, 2, 9),
(23, 3, 19),
(23, 4, 13),
(24, 1, 20),
(24, 2, 12),
(24, 3, 30),
(24, 4, 9);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `fk_Chef_Connexion1` FOREIGN KEY (`idconnexion`) REFERENCES `connexion` (`idconnexion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_Client_Adresse1` FOREIGN KEY (`idadresse`) REFERENCES `adresse` (`idadresse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Client_Connexion1` FOREIGN KEY (`idconnexion`) REFERENCES `connexion` (`idconnexion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_Commande_Client1` FOREIGN KEY (`idclient`) REFERENCES `client` (`idclient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Commande_Livreur1` FOREIGN KEY (`idlivreur`) REFERENCES `livreur` (`idlivreur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_Livreur_Connexion1` FOREIGN KEY (`idconnexion`) REFERENCES `connexion` (`idconnexion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `fk_Plats_has_Commande_Commande1` FOREIGN KEY (`idcommande`) REFERENCES `commande` (`idcommande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Plats_has_Commande_Plats1` FOREIGN KEY (`idplat`) REFERENCES `plat` (`idplat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `fk_Plats_Chef1` FOREIGN KEY (`idchef`) REFERENCES `chef` (`idchef`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sac_livreur`
--
ALTER TABLE `sac_livreur`
  ADD CONSTRAINT `fk_Plats_has_Livreurs_Livreurs1` FOREIGN KEY (`idlivreur`) REFERENCES `livreur` (`idlivreur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Plats_has_Livreurs_Plats1` FOREIGN KEY (`idplat`) REFERENCES `plat` (`idplat`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
