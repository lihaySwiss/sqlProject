-- Insert data into Project_topics table
INSERT INTO `Project_topics` (`idproject_topic`) VALUES (1), (2), (3);

-- Insert data into People table
INSERT INTO `People` (`People_id`, `first_name`, `last_name`, `phone_number`, `date_of_birth`) 
VALUES 
('000001', 'John', 'Doe', '1234567890' , '1990-05-15'),
('000002', 'Jane', 'Smith', '0987654321' , '1992-08-20'),
('000003', 'Michael', 'Johnson', '9876543210' , '1988-03-10'),
('000004', 'John', 'exit', '1234567890' , '1990-05-15'),
('000005', 'Tim', 'Mcnil', '0987654321' , '1992-08-20'),
('000006', 'Ben', 'Dover', '9876543210' , '1988-03-10'),
('000007', 'Nig', 'Mansen', '1234567890' , '1990-05-15'),
('000008', 'Crolin', 'Tory', '0987654321' , '1992-08-20'),
('000009', 'bobson', 'jake', '9876543210' , '1988-03-10'),
('000010', 'bon', 'jole', '9876876542' , '1988-02-12');

-- Insert data into Alumnies table
INSERT INTO `Alumnies` (`People_Alumni_id`, `date_of_graduation`) 
VALUES 
('000001', '2010-06-30'),
('000002', '2012-07-15'),
('000003', '2011-05-20');

-- Insert data into Projects table
INSERT INTO `Projects` (`idprojects`, `project_name`, `date_of_submition`, `idproject_topic`, `Alumnies_People_Alumni_id`) 
VALUES 
(1, 'Compiler - quartz', '2023-01-20', 1, '000001'),
(2, 'TOR - onion', '2023-02-15', 2, '000002'),
(3, 'Operating system - atOS', '2023-03-10', 3, '000003');

-- Insert data into Field_of_expertise table
INSERT INTO `Field_of_expertise` (`idField_of_expertise`, `description`) VALUES (1, 'networking'), (2, 'low-level'), (3, 'web');

-- Insert data into Guides table
INSERT INTO `Guides` (`Guide_id`) VALUES ('000001'), ('000002'), ('000003');

-- Insert data into Regions table
INSERT INTO `Regions` (`Region_code`) VALUES (100), (200), (300);

-- Insert data into Cities table
INSERT INTO `Cities` (`idCities`, `Regions_city_region`, `CityName`) VALUES (1, 100, 'Beer-Sheva'), (2, 200, 'Tel-aviv'), (3, 300, 'Karmiel');

-- Insert data into Classes table
INSERT INTO `Classes` (`idClasses`, `Cities_idCities`) VALUES (101, 1), (102, 2), (103, 3);

-- Insert data into Students table
INSERT INTO `Students` (`Student_id`, `Projects_idprojects`, `Classes_idClasses`) 
VALUES 
('000010', null ,101),
('000004', 1, 101),
('000005', 2, 102),
('000006', 3, 103);

-- Insert data into Courses table
INSERT INTO `Courses` (`idCourses`, `Guides_id`) VALUES (1, '000001'), (2, '000002'), (3, '000003');

-- Insert data into Supervisors table
INSERT INTO `Supervisors` (`Supervisor_id`, `Region_Region_code`) VALUES ('000007', 100), ('000008', 200), ('000009', 300);

-- Insert data into Classes_has_Courses table
INSERT INTO `Classes_has_Courses` (`Classes_idClasses`, `Courses_idCourses`) 
VALUES 
(101, 1),
(102, 2),
(103, 3);

-- Insert data into Alumnies_has_Field_of_expertise table
INSERT INTO `Alumnies_has_Field_of_expertise` (`Alumnies_People_Alumni_id`, `Field_of_expertise_idField_of_expertise`) 
VALUES 
('000001', 1),
('000002', 2),
('000003', 3);
