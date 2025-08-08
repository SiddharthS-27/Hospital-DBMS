-- Table structure for table `appointment`
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `appointment_id` int NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
);

-- Table structure for table `bill`
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `BILL_ID` int NOT NULL,
  `PATIENT_ID` int NOT NULL,
  `AMOUNT` int DEFAULT NULL,
  `PAYMENT_STATUS` varchar(10) DEFAULT NULL,
  `BILL_DATE` date DEFAULT NULL,
  PRIMARY KEY (`BILL_ID`)
);

-- Table structure for table `patient`
-- Table structure for table `patient`
-- Create patient table first with proper primary key
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `NAME` varchar(20) DEFAULT NULL,
  `AGE` int NOT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `PATIENT_ID` int NOT NULL,
  PRIMARY KEY (`PATIENT_ID`)
) ;

-- Create test_result table that references patient table
DROP TABLE IF EXISTS `test_result`;

CREATE TABLE `test_result` (
  `TEST_DATE` date DEFAULT NULL,
  `PATIENT_ID` int DEFAULT NULL,
  `RESULT` varchar(100) DEFAULT NULL,
  `TEST_ID` int NOT NULL,
  PRIMARY KEY (`TEST_ID`),
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `test_result_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`PATIENT_ID`)
) ;
