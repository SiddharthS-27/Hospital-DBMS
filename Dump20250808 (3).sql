-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitaldbms
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` int NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DEPARTMENT_ID` int NOT NULL,
  `LOCATION` varchar(20) DEFAULT NULL,
  `DEPARTMENT_NAME` varchar(20) DEFAULT NULL,
  `DESCRIPITION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emergency_care`
--

DROP TABLE IF EXISTS `emergency_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_care` (
  `EMERGENCY_TYPE` varchar(50) DEFAULT NULL,
  `CONDITION_ON_ARRIVAL` varchar(100) DEFAULT NULL,
  `ARRIVAL_TIME` time DEFAULT NULL,
  `PATIENT_ID` int DEFAULT NULL,
  `TREATMENT_GIVEN` varchar(50) DEFAULT NULL,
  `EMERGENCY_ID` int NOT NULL,
  `ASSIGNED_STAFF_ID` int NOT NULL,
  `OUTCOME` varchar(50) DEFAULT NULL,
  `RESOURCES_USED` varchar(50) DEFAULT NULL,
  `NOTES` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EMERGENCY_ID`),
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `emergency_care_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `PURCHASE_DATE` date DEFAULT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `EQUIPMENT_ID` int NOT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `NEXT_MAINTAINENCE` varchar(50) DEFAULT NULL,
  `AGE` int DEFAULT NULL,
  `NOTES` varchar(50) DEFAULT NULL,
  `STAFF_ID` int DEFAULT NULL,
  `DEPARTMENT_ID` int DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `LAST_MAINTAINENCE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EQUIPMENT_ID`),
  KEY `FK_STAFF_ID` (`STAFF_ID`),
  CONSTRAINT `FK_STAFF_ID` FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_bill`
--

DROP TABLE IF EXISTS `hospital_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_bill` (
  `BILL_ID` int NOT NULL,
  `PATIENT_ID` int NOT NULL,
  `AMOUNT` int DEFAULT NULL,
  `PAYMENT_STATUS` varchar(10) DEFAULT NULL,
  `BILL_DATE` date DEFAULT NULL,
  PRIMARY KEY (`BILL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_test`
--

DROP TABLE IF EXISTS `lab_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_test` (
  `BILL_ID` int DEFAULT NULL,
  `TEST_ID` int DEFAULT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `COST` int DEFAULT NULL,
  KEY `BILL_ID` (`BILL_ID`),
  KEY `TEST_ID` (`TEST_ID`),
  CONSTRAINT `lab_test_ibfk_1` FOREIGN KEY (`BILL_ID`) REFERENCES `hospital_bill` (`BILL_ID`),
  CONSTRAINT `lab_test_ibfk_2` FOREIGN KEY (`TEST_ID`) REFERENCES `test_result` (`TEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_history` (
  `allergy_information` varchar(50) DEFAULT NULL,
  `HPI` varchar(100) DEFAULT NULL,
  `PAST_MEDICAL_HISTORY` varchar(50) DEFAULT NULL,
  `PATIENT_ID` int DEFAULT NULL,
  `MEDICATION_HISTORY` varchar(100) DEFAULT NULL,
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `NAME` varchar(20) DEFAULT NULL,
  `AGE` int NOT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `PATIENT_ID` int NOT NULL,
  PRIMARY KEY (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `STAFF_ID` int NOT NULL,
  `ROLE` varchar(20) DEFAULT NULL,
  `SCHEDULE` varchar(20) DEFAULT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `CONTACT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `PURCHASE_DATE` date DEFAULT NULL,
  `LAST_UPDATED` date DEFAULT NULL,
  `EXPIRY_DATE` date DEFAULT NULL,
  `NOTES` varchar(100) DEFAULT NULL,
  `DEPARTMENT_ID` int DEFAULT NULL,
  `SUPPLY_ID` int NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `CATEGORY` varchar(20) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `SUPPLIER_INFO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SUPPLY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_result`
--

DROP TABLE IF EXISTS `test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_result` (
  `TEST_DATE` date DEFAULT NULL,
  `PATIENT_ID` int DEFAULT NULL,
  `RESULT` varchar(100) DEFAULT NULL,
  `TEST_ID` int NOT NULL,
  PRIMARY KEY (`TEST_ID`),
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `test_result_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ROLE` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `USERNAME` varchar(20) DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `STAFF_ID` int DEFAULT NULL,
  KEY `STAFF_ID` (`STAFF_ID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-08 10:12:35
