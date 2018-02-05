-- MySQL Script generated by MySQL Workbench
-- Sun Feb  4 21:33:20 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema wasps
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wasps
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wasps` DEFAULT CHARACTER SET utf8 ;
USE `wasps` ;

-- -----------------------------------------------------
-- Table `wasps`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wasps`.`User` ;

CREATE TABLE IF NOT EXISTS `wasps`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(100) NOT NULL,
  `userRole` ENUM('admin', 'driver', 'dispatcher', 'passanger') NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `registered` DATETIME NOT NULL,
  `lastLogin` DATETIME NULL,
  `wantsSMS` TINYINT(1) NULL,
  `wantsEmails` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `userID_UNIQUE` (`id` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
  UNIQUE INDEX `Email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wasps`.`Ride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wasps`.`Ride` ;

CREATE TABLE IF NOT EXISTS `wasps`.`Ride` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL,
  `driverID` INT NULL,
  `apptStart` DATETIME NOT NULL,
  `apptEnd` DATETIME NOT NULL,
  `numMiles` DECIMAL(5,3) NULL,
  `totalMinutes` INT NULL,
  `pickupTime` DATETIME NOT NULL,
  `wheelchairVan` TINYINT(1) NOT NULL,
  `status` ENUM('Unverified', 'Pending', 'Scheduled', 'Complete', 'Canceled') NOT NULL DEFAULT 'Unverified',
  `pickupStreetAddress` VARCHAR(255) NOT NULL,
  `pickupCity` VARCHAR(100) NOT NULL,
  `apptStreetAddress` VARCHAR(255) NOT NULL,
  `apptCity` VARCHAR(100) NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Ride_User`
    FOREIGN KEY (`userID`)
    REFERENCES `wasps`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ride_Driver`
    FOREIGN KEY (`driverID`)
    REFERENCES `wasps`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wasps`.`DriverAvailability`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wasps`.`DriverAvailability` ;

CREATE TABLE IF NOT EXISTS `wasps`.`DriverAvailability` (
  `id` INT NOT NULL COMMENT '	',
  `start` TIME NOT NULL,
  `end` TIME NOT NULL,
  `days` SET('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat') NOT NULL,
  `driverID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DriverAvailability_User1_idx` (`driverID` ASC),
  CONSTRAINT `fk_DriverAvailability_User1`
    FOREIGN KEY (`driverID`)
    REFERENCES `wasps`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wasps`.`DriverAvailabilityException`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wasps`.`DriverAvailabilityException` ;

CREATE TABLE IF NOT EXISTS `wasps`.`DriverAvailabilityException` (
  `id` INT NOT NULL COMMENT '	',
  `start` DATETIME NOT NULL,
  `end` DATETIME NOT NULL,
  `driverID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DriverAvailabilityException_User1_idx` (`driverID` ASC),
  CONSTRAINT `fk_DriverAvailabilityException_User1`
    FOREIGN KEY (`driverID`)
    REFERENCES `wasps`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wasps`.`VolunteerRequest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wasps`.`VolunteerRequest` ;

CREATE TABLE IF NOT EXISTS `wasps`.`VolunteerRequest` (
  `id` INT NOT NULL,
  `timestamp` DATETIME NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_VolunteerRequest_User1_idx` (`userID` ASC),
  CONSTRAINT `fk_VolunteerRequest_User1`
    FOREIGN KEY (`userID`)
    REFERENCES `wasps`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wasps`.`Comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wasps`.`Comments` ;

CREATE TABLE IF NOT EXISTS `wasps`.`Comments` (
  `id` INT NOT NULL,
  `comment` VARCHAR(2048) NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` INT NOT NULL,
  `rideID` INT NOT NULL,
  `updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_Comments_User1_idx` (`userID` ASC),
  INDEX `fk_Comments_Ride1_idx` (`rideID` ASC),
  CONSTRAINT `fk_Comments_User1`
    FOREIGN KEY (`userID`)
    REFERENCES `wasps`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comments_Ride1`
    FOREIGN KEY (`rideID`)
    REFERENCES `wasps`.`Ride` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wasps`.`SentMessagesLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wasps`.`SentMessagesLog` ;

CREATE TABLE IF NOT EXISTS `wasps`.`SentMessagesLog` (
  `id` INT NOT NULL,
  `type` ENUM('sms', 'email') NULL,
  `message` VARCHAR(2048) NULL,
  `userID` INT NOT NULL,
  `timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_SentMessagesLog_User1_idx` (`userID` ASC),
  CONSTRAINT `fk_SentMessagesLog_User1`
    FOREIGN KEY (`userID`)
    REFERENCES `wasps`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `wasps`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `wasps`;
INSERT INTO `wasps`.`User` (`id`, `password`, `userRole`, `firstName`, `lastName`, `phone`, `email`, `registered`, `lastLogin`, `wantsSMS`, `wantsEmails`) VALUES (1, '$2b$10$FAwacfpZVEEUKcbA1Hgcou.SQrtClJxUI4itEjACONP/d71kXl6YK', 'admin', 'Super', 'Admin', '5852167829', 'admin@websterwasps.com', '2018-01-01 00:00:00', '2018-03-01 00:00:00', true, true);
INSERT INTO `wasps`.`User` (`id`, `password`, `userRole`, `firstName`, `lastName`, `phone`, `email`, `registered`, `lastLogin`, `wantsSMS`, `wantsEmails`) VALUES (2, '$2b$10$SqfJMr261d3VBpvVZ1l8PeILqBn.E88Eghfq8BwDBwSn3csf5xUpy', 'dispatcher', 'Main', 'Dispatcher', '5852167819', 'dispatcher@websterwasps.com', '2018-01-01 00:00:00', '2018-03-01 00:00:00', true, true);
INSERT INTO `wasps`.`User` (`id`, `password`, `userRole`, `firstName`, `lastName`, `phone`, `email`, `registered`, `lastLogin`, `wantsSMS`, `wantsEmails`) VALUES (3, '$2b$10$6AnBy.iXxh2r9keggcxAZO1TpaYLAE7l2JXWUfHYIwze5CVe1L31C', 'driver', 'Main', 'Driver', '2035254835', 'driver@websterwasps.com', '2018-01-01 00:00:00', '2018-03-01 00:00:00', true, true);
INSERT INTO `wasps`.`User` (`id`, `password`, `userRole`, `firstName`, `lastName`, `phone`, `email`, `registered`, `lastLogin`, `wantsSMS`, `wantsEmails`) VALUES (4, '$2b$10$x5/o./v8KWXgnrbxYOKWIOBKj0kxVWfjUcIiHNPEcYseJXr16Ybqq', 'passanger', 'Main', 'Passanger', '2435254235', 'passanger@websterwasps.com', '2018-01-01 00:00:00', '2018-03-01 00:00:00', true, true);
INSERT INTO `wasps`.`User` (`id`, `password`, `userRole`, `firstName`, `lastName`, `phone`, `email`, `registered`, `lastLogin`, `wantsSMS`, `wantsEmails`) VALUES (5, '$2b$10$6AnBy.iXxh2r9keggcxAZO1TpaYLAE7l2JXWUfHYIwze5CVe1L31C', 'driver', 'Weekend', 'Driver', '5852167818', 'weekendDriver@websterwasps.com', '2018-01-01 00:00:00', '2018-03-01 00:00:00', true, true);
INSERT INTO `wasps`.`User` (`id`, `password`, `userRole`, `firstName`, `lastName`, `phone`, `email`, `registered`, `lastLogin`, `wantsSMS`, `wantsEmails`) VALUES (6, '$2b$10$x5/o./v8KWXgnrbxYOKWIOBKj0kxVWfjUcIiHNPEcYseJXr16Ybqq', 'passanger', 'WannaBe', 'Driver', '2432253835', 'wannabeDriver@websterwasps.com', '2018-01-01 00:00:00', '2018-03-01 00:00:00', true, true);
INSERT INTO `wasps`.`User` (`id`, `password`, `userRole`, `firstName`, `lastName`, `phone`, `email`, `registered`, `lastLogin`, `wantsSMS`, `wantsEmails`) VALUES (7, '$2b$10$6AnBy.iXxh2r9keggcxAZO1TpaYLAE7l2JXWUfHYIwze5CVe1L31C', 'driver', 'Weekday', 'Driver', '5852167813', 'weekdayDriver@websterwasps.com', '2018-01-01 00:00:00', '2018-03-01 00:00:00', true, true);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wasps`.`Ride`
-- -----------------------------------------------------
START TRANSACTION;
USE `wasps`;
INSERT INTO `wasps`.`Ride` (`id`, `userID`, `driverID`, `apptStart`, `apptEnd`, `numMiles`, `totalMinutes`, `pickupTime`, `wheelchairVan`, `status`, `pickupStreetAddress`, `pickupCity`, `apptStreetAddress`, `apptCity`, `created`, `modified`) VALUES (1, 4, 3, '2018-04-23 09:00:00', '2018-04-23 10:00:00', NULL, NULL, '2018-04-23 08:30:00', false, 'Scheduled', '855 publishers parkway', 'Webster', '45 Webster Commons Blvd #201', 'Webster', '2018-02-01 08:00:00', DEFAULT);
INSERT INTO `wasps`.`Ride` (`id`, `userID`, `driverID`, `apptStart`, `apptEnd`, `numMiles`, `totalMinutes`, `pickupTime`, `wheelchairVan`, `status`, `pickupStreetAddress`, `pickupCity`, `apptStreetAddress`, `apptCity`, `created`, `modified`) VALUES (2, 4, 3, '2018-04-25 09:00:00', '2018-04-25 10:00:00', NULL, NULL, '2018-04-25 08:30:00', false, 'Pending', '746 Newberry Ln', 'Webster', '55 North Ave B', 'Webster', '2018-02-01 08:00:00', DEFAULT);
INSERT INTO `wasps`.`Ride` (`id`, `userID`, `driverID`, `apptStart`, `apptEnd`, `numMiles`, `totalMinutes`, `pickupTime`, `wheelchairVan`, `status`, `pickupStreetAddress`, `pickupCity`, `apptStreetAddress`, `apptCity`, `created`, `modified`) VALUES (3, 4, NULL, '2018-04-24 09:00:00', '2018-04-24 10:00:00', NULL, NULL, '2018-04-24 08:30:00', false, 'Unverified', '746 Newberry Ln', 'Webster', '55 North Ave B', 'Webster', '2018-02-01 08:00:00', DEFAULT);
INSERT INTO `wasps`.`Ride` (`id`, `userID`, `driverID`, `apptStart`, `apptEnd`, `numMiles`, `totalMinutes`, `pickupTime`, `wheelchairVan`, `status`, `pickupStreetAddress`, `pickupCity`, `apptStreetAddress`, `apptCity`, `created`, `modified`) VALUES (4, 4, 3, '2018-04-27 09:00:00', '2018-04-27 10:00:00', 7, 120, '2018-04-27 08:30:00', false, 'Complete', '855 publishers parkway', 'Webster', '45 Webster Commons Blvd #201', 'Webster', '2018-02-01 08:00:00', DEFAULT);
INSERT INTO `wasps`.`Ride` (`id`, `userID`, `driverID`, `apptStart`, `apptEnd`, `numMiles`, `totalMinutes`, `pickupTime`, `wheelchairVan`, `status`, `pickupStreetAddress`, `pickupCity`, `apptStreetAddress`, `apptCity`, `created`, `modified`) VALUES (5, 4, 5, '2018-04-22 09:00:00', '2018-04-22 10:00:00', NULL, NULL, '2018-04-22 08:30:00', false, 'Scheduled', '746 Newberry Ln', 'Webster', '55 North Ave B', 'Webster', '2018-02-01 08:00:00', DEFAULT);
INSERT INTO `wasps`.`Ride` (`id`, `userID`, `driverID`, `apptStart`, `apptEnd`, `numMiles`, `totalMinutes`, `pickupTime`, `wheelchairVan`, `status`, `pickupStreetAddress`, `pickupCity`, `apptStreetAddress`, `apptCity`, `created`, `modified`) VALUES (6, 4, 5, '2018-04-22 09:00:00', '2018-04-22 10:00:00', NULL, NULL, '2018-04-22 08:30:00', false, 'Canceled', '855 publishers parkway', 'Webster', '45 Webster Commons Blvd #201', 'Webster', '2018-02-01 08:00:00', DEFAULT);
INSERT INTO `wasps`.`Ride` (`id`, `userID`, `driverID`, `apptStart`, `apptEnd`, `numMiles`, `totalMinutes`, `pickupTime`, `wheelchairVan`, `status`, `pickupStreetAddress`, `pickupCity`, `apptStreetAddress`, `apptCity`, `created`, `modified`) VALUES (7, 4, NULL, '2018-04-22 11:00:00', '2018-04-22 11:30:00', NULL, NULL, '2018-04-22 10:30:00', false, 'Unverified', '746 Newberry Ln', 'Webster', '55 North Ave B', 'Webster', '2018-02-01 08:00:00', DEFAULT);
INSERT INTO `wasps`.`Ride` (`id`, `userID`, `driverID`, `apptStart`, `apptEnd`, `numMiles`, `totalMinutes`, `pickupTime`, `wheelchairVan`, `status`, `pickupStreetAddress`, `pickupCity`, `apptStreetAddress`, `apptCity`, `created`, `modified`) VALUES (8, 4, 7, '2018-04-20 09:00:00', '2018-04-20 10:00:00', NULL, NULL, '2018-04-20 08:30:00', false, 'Unverified', '855 publishers parkway', 'Webster', '45 Webster Commons Blvd #201', 'Webster', '2018-02-01 08:00:00', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wasps`.`DriverAvailability`
-- -----------------------------------------------------
START TRANSACTION;
USE `wasps`;
INSERT INTO `wasps`.`DriverAvailability` (`id`, `start`, `end`, `days`, `driverID`) VALUES (1, '07:00:00', '04:00:00', 'Mon,Tue,Wed,Thu,Fri', 3);
INSERT INTO `wasps`.`DriverAvailability` (`id`, `start`, `end`, `days`, `driverID`) VALUES (2, '07:00:00', '04:00:00', 'Sat,Sun', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wasps`.`DriverAvailabilityException`
-- -----------------------------------------------------
START TRANSACTION;
USE `wasps`;
INSERT INTO `wasps`.`DriverAvailabilityException` (`id`, `start`, `end`, `driverID`) VALUES (1, '2018-04-20 00:00:00', '2018-04-21 00:00:00', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wasps`.`VolunteerRequest`
-- -----------------------------------------------------
START TRANSACTION;
USE `wasps`;
INSERT INTO `wasps`.`VolunteerRequest` (`id`, `timestamp`, `userID`) VALUES (1, '2018-02-01 08:01:00', 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wasps`.`Comments`
-- -----------------------------------------------------
START TRANSACTION;
USE `wasps`;
INSERT INTO `wasps`.`Comments` (`id`, `comment`, `created`, `userID`, `rideID`, `updated`) VALUES (1, 'This is a comment by admin on ride 1', '2018-02-01 08:01:00', 1, 1, DEFAULT);
INSERT INTO `wasps`.`Comments` (`id`, `comment`, `created`, `userID`, `rideID`, `updated`) VALUES (2, 'This is a comment by dispatcher on ride 1', '2018-02-01 08:02:00', 2, 1, DEFAULT);
INSERT INTO `wasps`.`Comments` (`id`, `comment`, `created`, `userID`, `rideID`, `updated`) VALUES (3, 'This is a comment by admin on ride 3', '2018-02-01 08:03:00', 1, 3, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wasps`.`SentMessagesLog`
-- -----------------------------------------------------
START TRANSACTION;
USE `wasps`;
INSERT INTO `wasps`.`SentMessagesLog` (`id`, `type`, `message`, `userID`, `timestamp`) VALUES (1, 'sms', 'Would you like to drive blah blah blah', 3, '2018-02-01 08:01:00');

COMMIT;

