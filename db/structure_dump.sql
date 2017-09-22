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
-- Temporary view structure for view `CHILD_PARENT_VIEW_de`
--

DROP TABLE IF EXISTS `CHILD_PARENT_VIEW_de`;
/*!50001 DROP VIEW IF EXISTS `CHILD_PARENT_VIEW_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `CHILD_PARENT_VIEW_de` AS SELECT 
 1 AS `childID`,
 1 AS `parentID`,
 1 AS `childName`,
 1 AS `parentName`,
 1 AS `childGender`,
 1 AS `parentGender`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CHILD_PARENT_VIEW_en`
--

DROP TABLE IF EXISTS `CHILD_PARENT_VIEW_en`;
/*!50001 DROP VIEW IF EXISTS `CHILD_PARENT_VIEW_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `CHILD_PARENT_VIEW_en` AS SELECT 
 1 AS `childID`,
 1 AS `parentID`,
 1 AS `childName`,
 1 AS `parentName`,
 1 AS `childGender`,
 1 AS `parentGender`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `HUSBAND`
--

DROP TABLE IF EXISTS `HUSBAND`;
/*!50001 DROP VIEW IF EXISTS `HUSBAND`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `HUSBAND` AS SELECT 
 1 AS `personID`,
 1 AS `name_de`,
 1 AS `name_en`,
 1 AS `gender`,
 1 AS `wifeID`,
 1 AS `husbandID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `PARENT`
--

DROP TABLE IF EXISTS `PARENT`;
/*!50001 DROP VIEW IF EXISTS `PARENT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `PARENT` AS SELECT 
 1 AS `personID`,
 1 AS `name_de`,
 1 AS `name_en`,
 1 AS `gender`,
 1 AS `childFK`,
 1 AS `parentFK`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `WIFE`
--

DROP TABLE IF EXISTS `WIFE`;
/*!50001 DROP VIEW IF EXISTS `WIFE`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `WIFE` AS SELECT 
 1 AS `personID`,
 1 AS `name_de`,
 1 AS `name_en`,
 1 AS `gender`,
 1 AS `wifeID`,
 1 AS `husbandID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `WIFE_HUSBAND_VIEW_de`
--

DROP TABLE IF EXISTS `WIFE_HUSBAND_VIEW_de`;
/*!50001 DROP VIEW IF EXISTS `WIFE_HUSBAND_VIEW_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `WIFE_HUSBAND_VIEW_de` AS SELECT 
 1 AS `wifeID`,
 1 AS `husbandID`,
 1 AS `wife`,
 1 AS `husband`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `WIFE_HUSBAND_VIEW_en`
--

DROP TABLE IF EXISTS `WIFE_HUSBAND_VIEW_en`;
/*!50001 DROP VIEW IF EXISTS `WIFE_HUSBAND_VIEW_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `WIFE_HUSBAND_VIEW_en` AS SELECT 
 1 AS `wifeID`,
 1 AS `husbandID`,
 1 AS `wife`,
 1 AS `husband`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `genderID` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`genderID`),
  UNIQUE KEY `gender_UNIQUE` (`gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parentAndChild`
--

DROP TABLE IF EXISTS `parentAndChild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentAndChild` (
  `childFK` int(11) NOT NULL,
  `parentFK` int(11) NOT NULL,
  PRIMARY KEY (`childFK`,`parentFK`),
  KEY `parent_fk_idx` (`parentFK`),
  CONSTRAINT `child_fk` FOREIGN KEY (`childFK`) REFERENCES `person` (`personID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `parent_fk` FOREIGN KEY (`parentFK`) REFERENCES `person` (`personID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personID` int(11) NOT NULL AUTO_INCREMENT,
  `name_de` varchar(45) NOT NULL,
  `name_en` varchar(45) DEFAULT NULL,
  `gender` int(11) DEFAULT '1',
  PRIMARY KEY (`personID`),
  UNIQUE KEY `name_ger_UNIQUE` (`name_de`),
  UNIQUE KEY `name_eng_UNIQUE` (`name_en`),
  KEY `gender_fk_idx` (`gender`),
  CONSTRAINT `gender_fk` FOREIGN KEY (`gender`) REFERENCES `gender` (`genderID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personDescription`
--

DROP TABLE IF EXISTS `personDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personDescription` (
  `personFK` int(11) NOT NULL,
  `desc_de` text,
  `desc_en` text,
  PRIMARY KEY (`personFK`),
  UNIQUE KEY `personFK_UNIQUE` (`personFK`),
  CONSTRAINT `FK__personDescription__person` FOREIGN KEY (`personFK`) REFERENCES `person` (`personID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wifeAndHusband`
--

DROP TABLE IF EXISTS `wifeAndHusband`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wifeAndHusband` (
  `wifeID` int(11) NOT NULL,
  `husbandID` int(11) NOT NULL,
  PRIMARY KEY (`wifeID`,`husbandID`),
  KEY `husband_fk_idx` (`husbandID`),
  KEY `wifeID_UNIQUE` (`wifeID`),
  CONSTRAINT `husband_fk` FOREIGN KEY (`husbandID`) REFERENCES `person` (`personID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wife_fk` FOREIGN KEY (`wifeID`) REFERENCES `person` (`personID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `CHILD_PARENT_VIEW_de`
--

/*!50001 DROP VIEW IF EXISTS `CHILD_PARENT_VIEW_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CHILD_PARENT_VIEW_de` AS select `parentAndChild`.`childFK` AS `childID`,`parentAndChild`.`parentFK` AS `parentID`,`t1`.`name_de` AS `childName`,`t2`.`name_de` AS `parentName`,`t1`.`gender` AS `childGender`,`t2`.`gender` AS `parentGender` from ((`parentAndChild` join `person` `t1` on((`parentAndChild`.`childFK` = `t1`.`personID`))) join `person` `t2` on((`parentAndChild`.`parentFK` = `t2`.`personID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CHILD_PARENT_VIEW_en`
--

/*!50001 DROP VIEW IF EXISTS `CHILD_PARENT_VIEW_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CHILD_PARENT_VIEW_en` AS select `parentAndChild`.`childFK` AS `childID`,`parentAndChild`.`parentFK` AS `parentID`,`t1`.`name_en` AS `childName`,`t2`.`name_en` AS `parentName`,`t1`.`gender` AS `childGender`,`t2`.`gender` AS `parentGender` from ((`parentAndChild` join `person` `t1` on((`parentAndChild`.`childFK` = `t1`.`personID`))) join `person` `t2` on((`parentAndChild`.`parentFK` = `t2`.`personID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HUSBAND`
--

/*!50001 DROP VIEW IF EXISTS `HUSBAND`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `HUSBAND` AS select `person`.`personID` AS `personID`,`person`.`name_de` AS `name_de`,`person`.`name_en` AS `name_en`,`person`.`gender` AS `gender`,`wifeAndHusband`.`wifeID` AS `wifeID`,`wifeAndHusband`.`husbandID` AS `husbandID` from (`person` join `wifeAndHusband` on((`person`.`personID` = `wifeAndHusband`.`husbandID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PARENT`
--

/*!50001 DROP VIEW IF EXISTS `PARENT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `PARENT` AS select `person`.`personID` AS `personID`,`person`.`name_de` AS `name_de`,`person`.`name_en` AS `name_en`,`person`.`gender` AS `gender`,`parentAndChild`.`childFK` AS `childFK`,`parentAndChild`.`parentFK` AS `parentFK` from (`person` join `parentAndChild` on((`person`.`personID` = `parentAndChild`.`parentFK`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WIFE`
--

/*!50001 DROP VIEW IF EXISTS `WIFE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `WIFE` AS select `person`.`personID` AS `personID`,`person`.`name_de` AS `name_de`,`person`.`name_en` AS `name_en`,`person`.`gender` AS `gender`,`wifeAndHusband`.`wifeID` AS `wifeID`,`wifeAndHusband`.`husbandID` AS `husbandID` from (`person` join `wifeAndHusband` on((`person`.`personID` = `wifeAndHusband`.`wifeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WIFE_HUSBAND_VIEW_de`
--

/*!50001 DROP VIEW IF EXISTS `WIFE_HUSBAND_VIEW_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `WIFE_HUSBAND_VIEW_de` AS select `WIFE`.`personID` AS `wifeID`,`HUSBAND`.`personID` AS `husbandID`,`WIFE`.`name_de` AS `wife`,`HUSBAND`.`name_de` AS `husband` from (`WIFE` join `HUSBAND` on((`WIFE`.`personID` = `HUSBAND`.`wifeID`))) where (`WIFE`.`husbandID` = `HUSBAND`.`husbandID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WIFE_HUSBAND_VIEW_en`
--

/*!50001 DROP VIEW IF EXISTS `WIFE_HUSBAND_VIEW_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `WIFE_HUSBAND_VIEW_en` AS select `WIFE`.`personID` AS `wifeID`,`HUSBAND`.`personID` AS `husbandID`,`WIFE`.`name_en` AS `wife`,`HUSBAND`.`name_en` AS `husband` from (`WIFE` join `HUSBAND` on((`WIFE`.`personID` = `HUSBAND`.`wifeID`))) where (`WIFE`.`husbandID` = `HUSBAND`.`husbandID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-22 13:08:57
