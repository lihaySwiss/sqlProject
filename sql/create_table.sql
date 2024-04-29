-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema magshimim
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema magshimim
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `magshimim` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `magshimim` ;

-- -----------------------------------------------------
-- Table `magshimim`.`People`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`People` (
  `People_id` VARCHAR(10) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `date_of_birth` DATE NOT NULL,
  PRIMARY KEY (`People_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Alumnies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Alumnies` (
  `People_Alumni_id` VARCHAR(10) NOT NULL,
  `date_of_graduation` DATE NOT NULL,
  PRIMARY KEY (`People_Alumni_id`),
  INDEX `fk_Alumnies_People1_idx` (`People_Alumni_id` ASC) VISIBLE,
  CONSTRAINT `fk_Alumnies_People1`
    FOREIGN KEY (`People_Alumni_id`)
    REFERENCES `magshimim`.`People` (`People_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Field_of_expertise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Field_of_expertise` (
  `idField_of_expertise` INT NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idField_of_expertise`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Alumnies_has_Field_of_expertise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Alumnies_has_Field_of_expertise` (
  `Alumnies_People_Alumni_id` VARCHAR(10) NOT NULL,
  `Field_of_expertise_idField_of_expertise` INT NOT NULL,
  PRIMARY KEY (`Alumnies_People_Alumni_id`, `Field_of_expertise_idField_of_expertise`),
  INDEX `fk_Alumnies_has_Field_of_expertise_Field_of_expertise1_idx` (`Field_of_expertise_idField_of_expertise` ASC) VISIBLE,
  INDEX `fk_Alumnies_has_Field_of_expertise_Alumnies1_idx` (`Alumnies_People_Alumni_id` ASC) VISIBLE,
  CONSTRAINT `fk_Alumnies_has_Field_of_expertise_Alumnies1`
    FOREIGN KEY (`Alumnies_People_Alumni_id`)
    REFERENCES `magshimim`.`Alumnies` (`People_Alumni_id`),
  CONSTRAINT `fk_Alumnies_has_Field_of_expertise_Field_of_expertise1`
    FOREIGN KEY (`Field_of_expertise_idField_of_expertise`)
    REFERENCES `magshimim`.`Field_of_expertise` (`idField_of_expertise`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Regions` (
  `Region_code` INT NOT NULL,
  PRIMARY KEY (`Region_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Cities` (
  `idCities` INT NOT NULL,
  `Regions_city_region` INT NOT NULL,
  `CityName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCities`),
  INDEX `fk_Cities_Regions1_idx` (`Regions_city_region` ASC) VISIBLE,
  CONSTRAINT `fk_Cities_Regions1`
    FOREIGN KEY (`Regions_city_region`)
    REFERENCES `magshimim`.`Regions` (`Region_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Classes` (
  `idClasses` INT NOT NULL,
  `Cities_idCities` INT NOT NULL,
  PRIMARY KEY (`idClasses`),
  INDEX `fk_Classes_Cities1_idx` (`Cities_idCities` ASC) VISIBLE,
  CONSTRAINT `fk_Classes_Cities1`
    FOREIGN KEY (`Cities_idCities`)
    REFERENCES `magshimim`.`Cities` (`idCities`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Guides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Guides` (
  `Guide_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Guide_id`),
  INDEX `fk_Guides_People1_idx` (`Guide_id` ASC) VISIBLE,
  CONSTRAINT `fk_Guides_People1`
    FOREIGN KEY (`Guide_id`)
    REFERENCES `magshimim`.`People` (`People_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Courses` (
  `idCourses` INT NOT NULL,
  `Guides_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idCourses`),
  INDEX `fk_Courses_Guides1_idx` (`Guides_id` ASC) VISIBLE,
  CONSTRAINT `fk_Courses_Guides1`
    FOREIGN KEY (`Guides_id`)
    REFERENCES `magshimim`.`Guides` (`Guide_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Classes_has_Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Classes_has_Courses` (
  `Classes_idClasses` INT NOT NULL,
  `Courses_idCourses` INT NOT NULL,
  PRIMARY KEY (`Classes_idClasses`, `Courses_idCourses`),
  INDEX `fk_Classes_has_Courses_Courses1_idx` (`Courses_idCourses` ASC) VISIBLE,
  INDEX `fk_Classes_has_Courses_Classes1_idx` (`Classes_idClasses` ASC) VISIBLE,
  CONSTRAINT `fk_Classes_has_Courses_Classes1`
    FOREIGN KEY (`Classes_idClasses`)
    REFERENCES `magshimim`.`Classes` (`idClasses`),
  CONSTRAINT `fk_Classes_has_Courses_Courses1`
    FOREIGN KEY (`Courses_idCourses`)
    REFERENCES `magshimim`.`Courses` (`idCourses`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`ProjectLog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`ProjectLog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NULL DEFAULT NULL,
  `project_name` VARCHAR(255) NULL DEFAULT NULL,
  `submission_date` DATE NULL DEFAULT NULL,
  `action_timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `action` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Project_topics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Project_topics` (
  `idproject_topic` INT NOT NULL,
  PRIMARY KEY (`idproject_topic`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Projects` (
  `idprojects` INT NOT NULL,
  `project_name` VARCHAR(45) NOT NULL,
  `date_of_submition` DATE NULL DEFAULT NULL,
  `idproject_topic` INT NOT NULL,
  `Alumnies_People_Alumni_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idprojects`),
  INDEX `fk_Projects_Project_topics1_idx` (`idproject_topic` ASC) VISIBLE,
  INDEX `fk_Projects_Alumnies1_idx` (`Alumnies_People_Alumni_id` ASC) VISIBLE,
  CONSTRAINT `fk_Projects_Alumnies1`
    FOREIGN KEY (`Alumnies_People_Alumni_id`)
    REFERENCES `magshimim`.`Alumnies` (`People_Alumni_id`),
  CONSTRAINT `fk_Projects_Project_topics1`
    FOREIGN KEY (`idproject_topic`)
    REFERENCES `magshimim`.`Project_topics` (`idproject_topic`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Students` (
  `Student_id` VARCHAR(10) NOT NULL,
  `Projects_idprojects` INT NULL DEFAULT NULL,
  `Classes_idClasses` INT NOT NULL,
  PRIMARY KEY (`Student_id`),
  INDEX `fk_Students_People1_idx` (`Student_id` ASC) VISIBLE,
  INDEX `fk_Students_Projects1_idx` (`Projects_idprojects` ASC) VISIBLE,
  INDEX `fk_Students_Classes1_idx` (`Classes_idClasses` ASC) VISIBLE,
  CONSTRAINT `fk_Students_Classes1`
    FOREIGN KEY (`Classes_idClasses`)
    REFERENCES `magshimim`.`Classes` (`idClasses`),
  CONSTRAINT `fk_Students_People1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `magshimim`.`People` (`People_id`),
  CONSTRAINT `fk_Students_Projects1`
    FOREIGN KEY (`Projects_idprojects`)
    REFERENCES `magshimim`.`Projects` (`idprojects`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magshimim`.`Supervisors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magshimim`.`Supervisors` (
  `Supervisor_id` VARCHAR(10) NOT NULL,
  `Region_Region_code` INT NOT NULL,
  PRIMARY KEY (`Supervisor_id`),
  INDEX `fk_Supervisors_People1_idx` (`Supervisor_id` ASC) VISIBLE,
  INDEX `fk_Supervisors_Region1_idx` (`Region_Region_code` ASC) VISIBLE,
  CONSTRAINT `fk_Supervisors_People1`
    FOREIGN KEY (`Supervisor_id`)
    REFERENCES `magshimim`.`People` (`People_id`),
  CONSTRAINT `fk_Supervisors_Region1`
    FOREIGN KEY (`Region_Region_code`)
    REFERENCES `magshimim`.`Regions` (`Region_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `magshimim` ;

-- -----------------------------------------------------
-- procedure getAllGuidesStudents
-- -----------------------------------------------------

DELIMITER $$
USE `magshimim`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllGuidesStudents`(in requestedGuide int)
BEGIN
-- get all students of specific guide
SELECT 
    co.idCourses,
    co.Guides_id,
    concat(g.first_name, " ", g.last_name) as guideName,
    concat(s.first_name, " ", s.last_name) as studentName,
    stu.student_id
FROM 
    Courses co
JOIN 
    Students stu ON co.idCourses = stu.Projects_idprojects
JOIN 
    People s ON stu.Student_id = s.People_id
join
	People g on co.Guides_id = g.people_id
WHERE 
    co.Guides_id = requestedGuide;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getAllStudentsUnderSupervisor
-- -----------------------------------------------------

DELIMITER $$
USE `magshimim`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllStudentsUnderSupervisor`(in requestedSupervisor int)
BEGIN

-- get info on all students that are from  a specific superviser region
SELECT 
	concat(p.first_name, " ", p.last_name) as studentName,
    s.Student_id,
    c.idClasses,
    ci.idCities,
    r.Region_code,
    ci.CityName
FROM 
    Students s
JOIN 
    Classes c ON s.Classes_idClasses = c.idClasses
JOIN 
    Cities ci ON c.Cities_idCities = ci.idCities
JOIN 
    Regions r ON ci.Regions_city_region = r.Region_code
JOIN 
    Supervisors sup ON r.Region_code = sup.Region_Region_code
join
	People p on s.student_id = p.people_id
WHERE 
    sup.Supervisor_id = requestedSupervisor;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getProjectsBetweenDates
-- -----------------------------------------------------

DELIMITER $$
USE `magshimim`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProjectsBetweenDates`(in startDate date, in endDate date)
BEGIN

-- all projects between these dates or null dates
SELECT *
FROM Projects p
WHERE date_of_submition BETWEEN startDate AND endDate
   OR date_of_submition IS NULL;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getStudentSubmittedAfterAlumniGrad
-- -----------------------------------------------------

DELIMITER $$
USE `magshimim`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudentSubmittedAfterAlumniGrad`(in alumniGradDate date)
BEGIN

-- Let's say we want to retrieve all students who have submitted projects 
-- that match the field of expertise of any alumni who graduated after a certain date.

SELECT DISTINCT s.*
FROM Students s
JOIN Projects p ON s.Projects_idprojects = p.idprojects
JOIN Alumnies a ON p.Alumnies_People_Alumni_id = a.People_Alumni_id
JOIN Alumnies_has_Field_of_expertise af ON a.People_Alumni_id = af.Alumnies_People_Alumni_id
WHERE a.date_of_graduation > alumniGradDate
AND p.idprojects IN (
    SELECT p.idprojects
    FROM Projects p
    JOIN Alumnies a ON p.Alumnies_People_Alumni_id = a.People_Alumni_id
    JOIN Alumnies_has_Field_of_expertise af ON a.People_Alumni_id = af.Alumnies_People_Alumni_id
    WHERE af.Field_of_expertise_idField_of_expertise = 
    (SELECT Field_of_expertise_idField_of_expertise
		FROM Alumnies_has_Field_of_expertise
		WHERE Alumnies_People_Alumni_id = a.People_Alumni_id));
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getStudentsOfCity
-- -----------------------------------------------------

DELIMITER $$
USE `magshimim`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudentsOfCity`(in idOfCity int)
BEGIN
-- id of all students from certain city
SELECT Student_id, concat(p.first_name, " ", p.last_name) as studentName, cityName
FROM Students s
join People p on p.people_id = s.student_id
join Cities on idCities = idOfCity;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure switchStudentClass
-- -----------------------------------------------------

DELIMITER $$
USE `magshimim`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `switchStudentClass`(in newClass int, in requstedStudent int)
BEGIN
-- update query to move student to different class
UPDATE Students
SET Classes_idClasses = newClass -- new class
WHERE Student_id = requstedStudent; -- student id
END$$

DELIMITER ;
USE `magshimim`;

DELIMITER $$
USE `magshimim`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `magshimim`.`project_submission_trigger`
AFTER INSERT ON `magshimim`.`Projects`
FOR EACH ROW
BEGIN
    -- Action: Insert into ProjectLog table
    INSERT INTO ProjectLog (project_id, project_name, submission_date, action_timestamp, action)
    VALUES (NEW.idprojects, NEW.project_name, NEW.date_of_submition, NOW(), 'New project submitted');
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
