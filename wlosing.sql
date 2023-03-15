-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: wlosing
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jest_dostepne`
--
use wlosing;
-- CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
-- GRANT ALL ON *.* TO  'root'@'localhost';
DROP TABLE IF EXISTS `jest_dostepne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jest_dostepne` (
  `id_jest_dostepne` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `id_produkt` tinyint(3) unsigned NOT NULL,
  `id_sklep` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_jest_dostepne`),
  KEY `id_produkt` (`id_produkt`),
  KEY `id_sklep` (`id_sklep`),
  CONSTRAINT `jest_dostepne_ibfk_1` FOREIGN KEY (`id_produkt`) REFERENCES `produkty` (`id_produkt`),
  CONSTRAINT `jest_dostepne_ibfk_2` FOREIGN KEY (`id_sklep`) REFERENCES `sklepy` (`id_sklep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jest_dostepne`
--

LOCK TABLES `jest_dostepne` WRITE;
/*!40000 ALTER TABLE `jest_dostepne` DISABLE KEYS */;
/*!40000 ALTER TABLE `jest_dostepne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problemy`
--

DROP TABLE IF EXISTS `problemy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problemy` (
  `id_problem` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa` char(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_problem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problemy`
--

LOCK TABLES `problemy` WRITE;
/*!40000 ALTER TABLE `problemy` DISABLE KEYS */;
/*!40000 ALTER TABLE `problemy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producenci`
--

DROP TABLE IF EXISTS `producenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producenci` (
  `id_producent` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `kraj` char(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_producent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producenci`
--

LOCK TABLES `producenci` WRITE;
/*!40000 ALTER TABLE `producenci` DISABLE KEYS */;
/*!40000 ALTER TABLE `producenci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkty`
--

DROP TABLE IF EXISTS `produkty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkty` (
  `id_produkt` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `cena` decimal(6,2) NOT NULL,
  `weganski` tinyint(3) unsigned NOT NULL,
  `id_producent` tinyint(3) unsigned NOT NULL,
  `id_typ` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_produkt`),
  KEY `id_producent` (`id_producent`),
  KEY `id_typ` (`id_typ`),
  CONSTRAINT `produkty_ibfk_1` FOREIGN KEY (`id_producent`) REFERENCES `producenci` (`id_producent`),
  CONSTRAINT `produkty_ibfk_2` FOREIGN KEY (`id_typ`) REFERENCES `typy` (`id_typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkty`
--

LOCK TABLES `produkty` WRITE;
/*!40000 ALTER TABLE `produkty` DISABLE KEYS */;
/*!40000 ALTER TABLE `produkty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rozwiazuje`
--

DROP TABLE IF EXISTS `rozwiazuje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rozwiazuje` (
  `id_rozwiazuje` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `id_typ` tinyint(3) unsigned NOT NULL,
  `id_problem` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_rozwiazuje`),
  KEY `id_typ` (`id_typ`),
  KEY `id_problem` (`id_problem`),
  CONSTRAINT `rozwiazuje_ibfk_1` FOREIGN KEY (`id_typ`) REFERENCES `typy` (`id_typ`),
  CONSTRAINT `rozwiazuje_ibfk_2` FOREIGN KEY (`id_problem`) REFERENCES `problemy` (`id_problem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rozwiazuje`
--

LOCK TABLES `rozwiazuje` WRITE;
/*!40000 ALTER TABLE `rozwiazuje` DISABLE KEYS */;
/*!40000 ALTER TABLE `rozwiazuje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sklepy`
--

DROP TABLE IF EXISTS `sklepy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sklepy` (
  `id_sklep` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa` char(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_sklep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sklepy`
--

LOCK TABLES `sklepy` WRITE;
/*!40000 ALTER TABLE `sklepy` DISABLE KEYS */;
/*!40000 ALTER TABLE `sklepy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typy`
--

DROP TABLE IF EXISTS `typy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typy` (
  `id_typ` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `typ` char(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typy`
--

LOCK TABLES `typy` WRITE;
/*!40000 ALTER TABLE `typy` DISABLE KEYS */;
/*!40000 ALTER TABLE `typy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25  9:18:17


-- zmienilam zeby bez pl znakow, decimal 6,2; nazwa produktu char50, nazwa producenta 30

INSERT INTO `producenci` VALUES
(1, 'Hair in Balance by ONLYBIO', 'Polska'),
(2, 'HAIRY TALE COSMETICS', 'Polska'),
(3, 'Anwen', 'Polska'),
(4, 'BANDI', 'Polska'),
(5, 'Biolaven', 'Polska'),
(6, 'Herbaria Banfi', 'Wegry'),
(7, 'Sattva', 'Polska'),
(8, 'Nowa Kosmetyka', 'Polska'),
(9, 'Radical', 'Polska'),
(10, 'Gosh', 'Dania'),
(11, 'BOSPHAERA', 'Polska'),
(12, 'Yope', 'Polska'),
(13, 'Equilibra', 'Polska'),
(14, 'Trust My Sister', 'Polska'),
(15, 'Alkemilla', 'Wlochy'),
(16, 'BIOELIXIRE Istota Natury', 'Polska'),
(17,'Dr. Sante', 'Polska'),
(18, 'CURLSMITH', 'USA'),
(19, 'Barwa', 'Polska'),
(20, 'Cantu', 'USA'),
(21, 'Jantar', 'Polska');

INSERT INTO `typy` VALUES
(1, 'Odzywka emolientowa'),
(2, 'Odzywka proteinowa'),
(3, 'Odzywka humektantowa'),
(4, 'Maska emolientowa'),
(5, 'Szampon rypacz'),
(6, 'Szampon delikatny'),
(7, 'Maska humektantowa'),
(8, 'Maska proteinowa'),
(9, 'Wcierka'),
(10, 'Peeling');

INSERT INTO `problemy` VALUES
(1, 'Puszenie'),
(2, 'Matowosc'),
(3, 'Koltunienie'),
(4, 'Straczkowanie'),
(5, 'Suchosc'),
(6, 'Szorstkosc'),
(7, 'Nadmierne obciazenie'),
(8, 'lamanie sie wlosow'),
(9, 'Elektryzowanie'),
(10, 'Szybkie przetluszczanie'),
(11, 'Wypadanie wlosow');

INSERT INTO `sklepy` VALUES
(1, 'Rossmann'),
(2, 'Napieknewlosy'),
(3, 'Loczek');

INSERT INTO `rozwiazuje` VALUES
(1, 1, 1), -- puszenie
(2, 2, 1),
(5, 1, 2) , -- matowosc
(6, 2, 2),
(7, 1, 3), -- koltunienie
(8, 2, 3),
(9, 2, 4), -- straczkowanie
(10, 3, 5), -- suchosc
(11, 1, 5), 
(12, 1, 6), -- szorstkosc p i h oba / to nie bede pisac
(13 , 2, 7), -- nadmierne obciazenie
(14 , 3, 7),
(15 , 1, 8), -- lamanie
(16, 2, 8),
(17, 1, 9), -- elektryzowanie same szorstkosc
(18, 2, 10), -- sz p
(19, 3, 10), -- koniec odzywek
(20, 4,1), -- maski
(21,8,1),
(24, 4,2),
(25, 8,2),
(26, 4,3),
(27,8,3),
(28,8,4),
(29,4,5),
(30,7,5),
(31,4,6),
(32,7,7),
(33,8,7),
(34,4,8),
(35,8,8),
(36,4,9),
(37,7,10),
(38,8,10),
(39, 9,11),-- wcierka
(40, 9, 10),
(41,10, 10), -- peeling
(43,6,10) ,-- szampon delikatny
(44,6,11),
(45,5,7), -- rypacz
(46, 10,11), -- peeling
(47,5, 11); 


INSERT INTO `produkty` VALUES 
(1, 'Odzywka do wlosow, emolientowa', 22.99, 1 , 1, 1), -- ross only bio
(2, 'Odzywka do wlosow, proteinowa', 22.99, 1 , 1, 2),
(3, 'Odzywka do wlosow, humektantowa', 22.99, 1 , 1, 3),
(4, 'Odbudowujaca maska do wlosow suchych', 69.95, 1,15,8), --  napiekne alkemilla *
(5, 'Szampon do wlosow intensywnie oczyszczajacy', 22.99, 1,1,5),
(6, 'Maska do wlosow wysokoporowatych', 24.99, 1,1,4),
(7, 'Maska do wlosow srednioporowatych', 24.99, 1,1,4),
(8, 'Maska do wlosow niskoporowatych', 24.99, 1,1,7),
(9, 'Szampon nawilzajacy', 22.99, 1,1,6),
(10, 'Szampon balansujacy', 22.99, 1,1,6)  ,
(11, 'Biana -  maska do wlosow', 65.00, 1,2,4), -- napieknewlosy hairytale
(12, 'Flylight - odzywka do wlosow niskoporowatych', 50.00, 1,2,1),
(13, 'Flylight - odzywka do wlosow srednioporowatych', 50.00, 1,2,1),
(14,'Flylight - odzywka do wlosow wysokoporowatych', 50.00, 1,2,1),
(15, 'Oatme - maska do wlosow', 65.00, 1,2,8),
(16, 'Merhair - Bogata maska do wlosow', 69.00, 0,2,7),
(17, 'Murky – Kojacy szampon', 59.00,0,2,6) ,
(18, 'Weganska maska humektantowa', 27.00, 1,16,7),  -- bioelixire napiekne * 
(19, 'Proteinowa Magnolia - odzywka do wlosow', 28.99, 0,3,2), -- anwen
(20, 'Proteinowa Orchidea - odzywka do wlosow', 28.99, 0,3,2),
(21, 'Proteinowa Zielona Herbata - odzywka do wlosow', 28.99, 1,3,2),
(22, 'Kielki pszenicy i Kakao - Maska do wlosow', 36.99, 0,3,4),
(23, 'Kokos i Glinka - Maska do wlosow', 36.99, 0,3,4),
(24, 'Maska kokosowa do suchych i lamliwych wlosow', 42.99, 1, 17, 8), -- napiekne dr sante *
(25, 'Double Cream Deep Quencher Maska odzywiajaca', 53.00, 1, 18,7), -- curlsmith napiekne * 
(26, 'Emolientowa Roza - odzywka do wlosow', 28.99, 1,3,1),
(27, 'Emolientowy Irys - odzywka do wlosow', 28.99, 1,3,1),
(28, 'Nawilzajacy Bez - odzywka do wlosow', 28.99, 1,3,3),
(29, 'Hair Me More Szampon ', 34.99, 1,3,6), 
(30, 'PIANKA Szampon Pomarancza i Bergamotka', 29.99, 0,3,6), 
(31, 'Szampon Brzoskwinia i Kolendra', 29.99, 1,3,6), 
(32, 'Odzywka zwiekszajaca objetosc wlosow', 75.95, 1, 15, 2), -- alkemilla napiekne * 
(33, 'Wake it Up - Szampon kawowy enzymatyczny', 34.99, 0,3,5),
(34, 'Tricho-odzywka przeciw wypadaniu wlosow', 49.00, 1, 4, 1), -- bandi
(35, 'Tricho-maska wzmacniajaca do wlosow', 49.00, 0, 4, 7),
(36, 'Tricho-szampon przeciw wypadaniu wlosow', 44.00, 1,4,6),
(37, 'Tricho-ekstrakt przeciw przetluszczaniu', 45.00, 0,4,9),
(38, 'Tricho-ekstrakt przeciw wypadaniu wlosow', 49.00, 1,4,9),
(39, 'Tricho-ekstrakt nawilzajaco-regenerujacy', 45.00, 1,4,9),
(40, 'Tricho-lotion stymulujacy wzrost wlosow', 49.00, 1,4,9),
(41, 'Tricho-peeling oczyszczajacy do skory glowy', 39.00, 0,4,10),
(42, 'Wcierka pobudzajaca wzrost wlosow', 22.99, 1,1,9), -- only bio - peelinigi i wcierki
(43, 'Wcierka odzywiajaca skore glowy', 22.99, 1,1,9),
(44, 'Peeling do skory glowy', 22.99, 1,1,10),
(45, 'Peeling enzymatyczny do skory glowy', 22.99, 1,1,10),
(46, 'Murky - Peeling regulujacy do skory glowy', 75.00, 0,2,10) ,-- hairy tale
(47, 'Squeaky Clean - Peeling kwasowy do skory glowy', 75.00, 1,2,10),
(48, 'Grasshopper - Wcierka regulujaca', 75.00, 1,2,9),
(49, 'Magic Mushrooms - Wcierka odzywcza', 75.00, 1,2,9),
(50, 'Wasabi - Wcierka stymulujaca', 75.00, 1,2,9),
(51, 'Darling Clementine - serum do skory glowy', 39.99, 0,3,9), -- anwen
(52, 'Odzywka Mleko Owsiane', 21.99, 1, 12, 2), -- yope napiekne * 
(53, 'Szampon do wlosow z olejem z pestek winogron', 26.00, 1,5,6), -- biolaven 
(54, 'Odzywka z olejem z pestek winogron', 26.00, 1,5,1), 
(55, 'Maska do wlosow', 34.00, 1,5,4),
(56, 'Wcierka klasyczna',24.99, 0,6,9), -- herbaria banfi
(57, 'Wcierka kofeinowa zen-szen', 36.99, 0,6,9),
(58, 'Szampon mango',40.00,0,7,6 ), -- sattva
(59, 'Szampon miod i migdaly', 40.00, 0,7,6),
(60, 'Wygladzajaca odzywka lniana', 12.99, 0, 19, 1), -- barwa napieknne * 
(61, 'Grapeseed Strengthening Conditioner', 35.00, 0, 20,1), -- cantu napiekne*
(62, 'Wcierka Henna i Amla', 32.00, 0,7,9),
(63, 'Duo-maska z wyciagiem z bursztynu',16.00, 0, 21, 1), -- jantar napiekne *
(64, 'Wcierka Kozieradka', 32.00, 0,7,9),
(65, 'Krio-maska zakwaszajaca z wyciagiem z bursztynu',20.00, 0,21,1), -- jantar napiekne *
(66, 'Wcierka Mniej problemow wiecej wlosow', 28.00, 0,8,9) ,-- nowa kosmetyka
(67, 'Maska do wlosow roza i miodem plynaca', 29.00, 0,8,7),
(68, 'Maska do wlosow Keratynowy Szot', 29.00, 0,8,8),
(69, 'Odzywka mango', 37.00, 0, 7, 2),  --  sattva napiekne *
(70, 'Szampon przyspieszajacy wzrost wlosow', 18.50, 1,9,5), -- radical
(71, 'Trychologiczna wcierka na wzrost wlosow', 22.50, 1,9,9),
(72, 'Trychologiczny peeling oczyszczajacy', 20.49, 0,9,10),
(73, 'Enzymatyczny peeling oczyszczajacy', 18.50, 1,9,10),
(74, 'Odzywka do wlosow z olejkiem rozanym', 25.00, 1, 10, 1), -- gosh
(75, 'Szampon do wlosow Macadamia Oil', 25.00, 1, 10,5),
(76, 'Szampon do wlosow Coconut Oil', 25.00, 1, 10, 5),
(77, 'Szampon do wlosow Argan Oil', 25.00, 1, 10, 5),
(78, 'Odzywka do wlosow Vitamin Booster', 25.00, 1, 10, 3),
(79, 'Odzywka jasmin i aloes', 37.00, 0,7,2 ), --  sattva napiekne * 
(80, 'Peeling do skory glowy', 59.00, 0, 15, 10), -- alkemilla napiekne *
(81, 'Hydro Creme Soothing Mask - Maska nawilzajaca', 53.00, 1,18, 7), -- curlsmith napiekne *
(82, 'Szampon do wlosow Vitamin Booster', 25.00, 1, 10, 5),
(83, 'Naturalny szampon wielozadaniowy', 35.00, 1, 11, 6) ,-- BOSPHAERA
(84, 'Odzywka ekspresowa nawilzajaco-regenerujaca', 40.00, 1, 11, 3),
(85, 'sWIEzA TRAWA - Odzywka', 19.99, 0,12, 3), -- sklep loczek yope
(86, 'sWIEzA TRAWA - Szampon oczyszczajacy', 19.99, 0, 12, 5),
(87, 'MLEKO OWSIANE - Szampon', 18.99, 0, 12, 5),
(88, 'ORIENTALNY OGRoD – Szampon oczyszczajacy', 18.99, 0, 12, 5),
(89, 'BALSAMO IDRATANTE - Nawilzajaca odzywka', 18.99, 0, 13, 3) ,-- equilibro nap tez 
(90, 'CARBONE ATTIVO BALSAMO DETOX Odzywka', 25.99, 0, 13, 3),
(91, 'Szampon do wlosow wysokoporowatych', 29.49, 0, 14, 6), -- trust my sister ross i loczek
(92, 'Szampon do wlosow niskoporowatych', 29.49, 0, 14, 6),
(93, 'Szampon do wlosow srednioporowatych', 29.49, 0, 14, 6),
(94, 'Emolientowa maska do wlosow niskoporowatych', 35.99, 0, 14, 4),
(95, 'Emolientowa maska do wlosow srednioporowatych', 35.99, 0, 14, 4) ,
(96, 'Emolientowa maska do wlosow wysokoporowatych',35.99, 0,14,4),
(97, 'Humektantowa maska uniwersalna', 35.99, 0, 14, 7),
(98, 'Proteinowa maska do wlosow niskoporowatych', 35.99, 0, 14, 8),
(99, 'Proteinowa maska do wlosow srednioporowatych', 35.99, 0,14,8),
(100, 'Proteinowa maska do wlosow wysokoporowatych', 35.99, 0,14, 8);

INSERT INTO `jest_dostepne` VALUES
(1, 1, 1),-- onlybio tylko ross
(2, 2, 1),
(3, 3, 1),
(4, 4, 2), -- nap alkemi 
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1), 
(11, 11, 2),-- hairytale tylko napiekne
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 2),
(16, 16, 2),
(17, 17, 2), 
(18, 18, 2),
(19, 19, 2), -- anwen nap, ross, locz
(20, 20, 2),
(21, 21, 2),
(22, 22, 2),
(23, 23, 2),
(24, 19, 1),
(25, 20, 1),
(26, 21, 1),
(27, 22, 1),
(28, 23, 1),
(29, 19, 3),
(30, 20, 3),
(31, 21, 3),
(32, 22, 3),
(33, 23, 3),
(34,  24, 2), -- dr sante nap i loczek
(35,  25, 2), -- curl
(36,  24, 3),
(37, 26, 1 ), -- anwen cd
(38, 27, 1 ),
(39, 28, 1 ),
(40, 29, 1), 
(41, 30, 1),
(42, 31, 1),
(43,26, 2),
(44,27, 2),
(45,28, 2),
(46,29, 2),
(47,30, 2), 
(48,31, 2),
(49, 26, 3), 
(50, 27, 3),
(51, 28, 3),
(52, 29, 3),
(53, 30, 3),
(54, 31, 3),
(55, 32, 2), -- alk n
(56, 33, 1),
(57, 33, 2),
(58, 33, 3),
(59, 34, 2), -- bandi tylko nap
(60, 35, 2),
(61, 36, 2),
(62, 37, 2),
(63, 38, 2),
(64, 39, 2),
(65, 40, 2),
(66, 41, 2),
(67, 42, 1), -- ob
(68, 43, 1),
(69, 44, 1),
(70, 45, 1), 
(71, 46, 2), -- hairytale
(72, 47, 2),
(73, 48, 2),
(74, 49, 2),
(75, 50, 2),
(76, 51,1),
(77, 51,2),
(78, 51,3),
(79, 52, 1), -- yope tez wszedzie
(80, 52, 2),
(81, 52, 3),
(82, 53,2), -- biolaven lo i nap
(83, 53, 3),
(84, 54,2),
(85, 54,3),
(86, 55, 2),
(87, 55, 3),
(88, 56,2), -- banfi nap
(89, 57,2),
(90, 58,1), -- sattva ross, nap lo
(91, 59,2),
(92, 60,2), -- barwa lo nap
(93, 61,1), -- cantu ross, lo, nap
(94, 62,2),
(95, 63,1), -- jantar ross, nap, lo
(96, 64,2),
(97, 65,1), -- jantar
(98, 58,2),
(99, 58,3), -- sattva 
(100, 60,3),
(101,61,2),
(102 , 61, 3),
(103 ,63,2),
(104 ,63,3),
(105 ,65,2),
(106 ,65,3),
(107 , 66, 2), -- nowa kosm lo, nap
(108 ,66, 3),
(109 ,67, 2),
(110 ,67, 3),
(111 ,68, 2),
(112 ,68, 3),
(113 , 69, 1),
(114 ,69 ,2),
(115 ,69 ,3),
(116 ,70, 1), -- radical ross lo nap
(117 ,71, 1),
(118 ,72, 1),
(119 ,73, 1),
(120 ,70,2),
(121 ,71,2),
(122 ,72,2),
(123 ,73,2),
(124 ,70,3),
(125 ,71,3),
(126 ,72,3),
(127 ,73,3),
(128, 74, 2), -- gosh nap lo
(129, 75, 2),
(130, 76, 2),
(131, 77, 2),
(132, 78, 2),
(133, 74, 3),
(134, 75, 3),
(135, 76, 3),
(136, 77, 3),
(137, 78, 3),
(138, 79, 1),
(139, 79, 2),
(140, 79, 3),
(141, 80, 2),
(142, 81, 2),
(143, 82, 2),
(144, 82, 3),
(145, 83, 2), -- bosphaera n
(146, 84, 2),
(147, 85, 1), 
(148, 86, 1),
(149, 87, 1),
(150, 88, 1),
(151, 85, 2),
(152, 86, 2),
(153, 87, 2),
(154, 88, 2),
(155, 85, 3),
(156, 86, 3),
(157, 87, 3),
(158, 88, 3),
(159, 89, 2),
(160, 90, 2),
(161, 89, 3),
(162, 90, 3),
(163, 91, 1), -- trust my sis ross lo
(164, 92, 1),
(165, 93, 1),
(166, 94, 1),
(167, 95, 1),
(168, 96, 1),
(169, 97, 1),
(170, 98, 1),
(171, 99, 1),
(172, 100,1 ),
(173, 91, 3),
(174, 92, 3),
(175, 93, 3),
(176, 94, 3),
(177, 95, 3),
(178, 96, 3),
(179, 97, 3),
(180, 98, 3),
(181, 99, 3),
(182, 100,3);