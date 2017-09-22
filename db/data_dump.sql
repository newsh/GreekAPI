CREATE DATABASE  IF NOT EXISTS `greekMythology` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `greekMythology`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (2,'female'),(1,'male');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `parentAndChild`
--

LOCK TABLES `parentAndChild` WRITE;
/*!40000 ALTER TABLE `parentAndChild` DISABLE KEYS */;
INSERT INTO `parentAndChild` VALUES (29,1),(40,1),(60,1),(65,1),(66,1),(108,1),(133,1),(2,3),(2,4),(147,4),(3,5),(3,6),(2,7),(10,8),(10,9),(12,10),(13,14),(20,14),(21,14),(22,14),(13,15),(20,15),(21,15),(22,15),(8,17),(8,18),(17,18),(17,19),(24,20),(25,20),(26,20),(27,20),(28,20),(24,23),(25,23),(26,23),(27,23),(28,23),(31,24),(38,26),(29,28),(31,30),(34,33),(34,35),(37,36),(38,39),(48,40),(49,40),(50,40),(49,41),(50,41),(48,42),(40,43),(58,49),(57,50),(125,50),(53,51),(53,52),(54,55),(54,56),(58,59),(85,60),(60,61),(62,63),(62,64),(64,65),(64,66),(66,67),(133,67),(65,68),(85,68),(1,69),(1,70),(69,71),(70,71),(69,72),(70,72),(79,78),(80,78),(81,78),(82,78),(83,78),(84,78),(79,85),(80,85),(81,85),(82,85),(83,85),(84,85),(88,86),(88,87),(90,88),(90,89),(93,91),(94,91),(93,92),(94,92),(97,95),(98,95),(97,96),(98,96),(101,99),(104,99),(101,100),(104,100),(103,101),(103,102),(107,105),(108,105),(107,106),(131,108),(132,108),(134,108),(135,108),(139,109),(109,110),(112,111),(113,112),(116,114),(117,114),(116,115),(117,115),(119,118),(120,118),(125,124),(124,126),(127,126),(129,128),(131,130),(132,130),(134,133),(135,133),(137,136),(139,138),(141,140),(144,143),(146,145),(147,146),(149,148),(150,148),(151,148),(149,152),(150,152),(151,152),(154,153),(156,154),(156,155),(158,156),(158,157),(73,159),(73,160);
/*!40000 ALTER TABLE `parentAndChild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Zeus','Zeus',1),(2,'Bellerophontes','Bellerophon',1),(3,'Glaukos','Glaucus',1),(4,'Poseidon','Poseidon',1),(5,'Sisyphos','Sisyphus',1),(6,'Merope','Merope',2),(7,'Eurynome','Eurynome',2),(8,'Polyneikes','Polynices',1),(9,'Argeia','Argea',2),(10,'Thersandros','Thersander',1),(12,'Teisamenos','Tisamenus',1),(13,'Europa','Europa',2),(14,'Agenor','Agenor',1),(15,'Telephassa','Telephassa',2),(17,'Ödipus','Oedipus',1),(18,'Iokaste','Jocasta',2),(19,'Laios','Laios',1),(20,'Kadmos','Cadmus',1),(21,'Kilix','Cilix',1),(22,'Phoinix','Phoenix',1),(23,'Harmonia','Harmonia',2),(24,'Agaue','Agave',2),(25,'Polydoros','Polydorus',1),(26,'Autonoë','Autonoë',2),(27,'Ino','Ino',2),(28,'Semele','Semele',2),(29,'Dionysos','Dionysus',1),(30,'Echion','Echion',1),(31,'Pentheus','Pentheus',1),(32,'Xuthos','Xuthus',1),(33,'Krëusa','Creusa',2),(34,'Ion','Ion',1),(35,'Apollon','Apollo',1),(36,'Daidalos','Daedalus',1),(37,'Ikarus','Icarus',1),(38,'Aktaion','Actaeon',1),(39,'Aristaios','Aristaeus',1),(40,'Aiakos','Aeacus',1),(41,'Endeïs','Endeïs',2),(42,'Psamathe','Psamathe',2),(43,'Aigina','Aegina',2),(48,'Phokos','Phocus',1),(49,'Peleus','Peleus',1),(50,'Telamon','Telamon',1),(51,'Herse','Herse',2),(52,'Hermes','Hermes',1),(53,'Kephalos','Cephalus',1),(54,'Prokris','Procris',2),(55,'Erechtheus','Erechtheus',1),(56,'Praxithea','Praxithea',2),(57,'Aias','Ajax',1),(58,'Achilleus','Achilles',1),(59,'Thetis','Thetis',2),(60,'Tantalos','Tantalus',1),(61,'Pluto','Plouto',2),(62,'Hedone','Hedone',2),(63,'Psyche','Psyche',2),(64,'Eros','Eros',1),(65,'Aphrodite','Aphrodite',2),(66,'Ares','Ares',1),(67,'Hera','Hera',2),(68,'Dione','Dione',2),(69,'Rhea','Rhea',2),(70,'Kronos','Cronos',1),(71,'Uranos','Uranus',1),(72,'Gaia','Gaia',2),(73,'Leto','Leto',2),(74,'Teiresias','Tiresias',1),(75,'Manto','Manto',2),(77,'Rhakios','Rhacius',1),(78,'Amphion','Amphion',1),(79,'Ismenos','Ismenus',1),(80,'Siphlos','Sipylus',1),(81,'Phaidimos','Phaedimus',1),(82,'Alphenor','Alphenor',1),(83,'Damasichthon','Damasichthon',1),(84,'Ilioneus','Ilioneus',1),(85,'Niobe','Niobe',2),(86,'Hermothoe','Hermothoe',2),(87,'Pandareos','Pandareus',1),(88,'Aëdon','Aedon',2),(89,'Zethos','Zethus',1),(90,'Itylos','Ithylus',1),(91,'Leda','Leda',2),(92,'Tyndareos','Tyndareus',1),(93,'Kastor','Castor',1),(94,'Polydeukes','Polydeuces',1),(95,'Arene','Arene',2),(96,'Aphareus','Aphareus',1),(97,'Lynkeus','Lynceus',1),(98,'Idas','Idas',1),(99,'Asterope','Sterope',2),(100,'Oinomaos','Oenomaus',1),(101,'Alkippe','Alcippe',2),(102,'Euenos','Evenus',1),(103,'Marpessa','Marpessa',2),(104,'Hippodameia','Hippodamia',2),(105,'Alkmene','Alcmene',2),(106,'Amphytrion','Amphytrion',1),(107,'Iphikles','Iphicles',1),(108,'Herakles','Heracles',1),(109,'Megara','Megara',2),(110,'Kreon','Creon',1),(111,'Helios','Helios',1),(112,'Augias','Augeas',1),(113,'Phyleus','Phyleus',1),(114,'Chloris','Chloris',2),(115,'Neleus','Neleus',1),(116,'Periklymenos','Periclymenus',1),(117,'Nestor','Nestor',1),(118,'Eurytos','Eurytos',1),(119,'Iole','Iole',2),(120,'Iphitos','Iphitos',1),(124,'Hesione','Hesione',2),(125,'Teukros','Teucer',1),(126,'Laomedon','Laomedon',1),(127,'Podarkes','Podarces',1),(128,'Syleus','Syleus',1),(129,'Xenodoke','Xenodice',2),(130,'Deïaneira','Deianira',2),(131,'Hyllos','Hyllus',1),(132,'Makaria','Macaria',2),(133,'Hebe','Hebe',2),(134,'Aniketos','Anicetos',1),(135,'Alexiares','Alexiares',1),(136,'Midas','Midas',1),(137,'Lytierses','Lityerses',1),(138,'Iolaos','Iolaus',1),(139,'Leipephile','Leipephilene',2),(140,'Pelias','Pelias',1),(141,'Alkestis','Alcestis',2),(142,'Admetos','Admetus',1),(143,'Oikles','Oecles',1),(144,'Amphiaraos','Amphiaraus',1),(145,'Kerkyon','Cercyon',1),(146,'Alope','Alope',2),(147,'Hippothoon','Hippothoon',1),(148,'Minos','Minos',1),(149,'Phaidra','Phaedra',2),(150,'Androgeos','Androgeos',1),(151,'Ariadne','Ariadne',2),(152,'Pasiphae','Pasiphae',2),(153,'Pittheus','Pittheus',1),(154,'Aithra','Aethra',2),(155,'Aigeus','Aegeus',1),(156,'Theseus','Theseus',1),(157,'Antiope','Antiope',2),(158,'Hippolytos','Hippolytus',1),(159,'Phoibe','Phoebe',2),(160,'Koios','Coeus',1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personDescription`
--

LOCK TABLES `personDescription` WRITE;
/*!40000 ALTER TABLE `personDescription` DISABLE KEYS */;
INSERT INTO `personDescription` VALUES (2,'Zähmte Pegasus \r Tötete die Chimära \r  Versuchte übermütig, den Olymp zu erreichen',NULL);
/*!40000 ALTER TABLE `personDescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `wifeAndHusband`
--

LOCK TABLES `wifeAndHusband` WRITE;
/*!40000 ALTER TABLE `wifeAndHusband` DISABLE KEYS */;
INSERT INTO `wifeAndHusband` VALUES (67,1),(7,3),(6,5),(9,8),(15,14),(18,17),(18,19),(23,20),(151,29),(24,30),(33,32),(26,39),(41,40),(59,49),(124,50),(51,52),(54,53),(56,55),(63,64),(65,66),(69,70),(72,71),(75,77),(85,78),(86,87),(88,89),(91,92),(95,96),(99,100),(101,102),(109,108),(133,108),(114,115),(119,131),(109,138),(141,142),(152,148),(157,156),(159,160);
/*!40000 ALTER TABLE `wifeAndHusband` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-22 13:09:46
