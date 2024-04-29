SET SQL_SAFE_UPDATES = 0;

call getProjectsBetweenDates('2023-01-20', '2023-05-20');
call getStudentsOfCity(1);
call magshimim.getAllStudentsUnderSupervisor('000009');
call getAllGuidesStudents("000001");
call switchStudentClass(101, 4);
call getStudentSubmittedAfterAlumniGrad('2009-01-07');
call getRegionSupervisor(100);

-- all Alumnis that helped with a project 
SELECT p.project_name, CONCAT(ppl.first_name, " ", ppl.last_name) AS alumniName
FROM Projects p
INNER JOIN People ppl ON p.Alumnies_People_Alumni_id = ppl.People_id
WHERE EXISTS (
    SELECT 1
    FROM Alumnies a
    WHERE a.People_Alumni_id = ppl.People_id
);

-- earliest project latest project and total number of projects
SELECT MAX(date_of_submition) AS latest_project_submitted, 
MIN(date_of_submition) AS earlies_project_submitted, 
COUNT(*) AS total_projects
FROM Projects;

-- get total of projects from a topic with at least 1 project
SELECT idproject_topic ,COUNT(*) AS total_projects
FROM Projects p
GROUP BY  idproject_topic
HAVING COUNT(*) > 0;
    
-- get supervisors with regions and phone number 
SELECT 
    p.first_name AS supervisor_first_name,
    p.last_name AS supervisor_last_name,
    sup.Supervisor_id,
    r.Region_code,
    p.phone_number
FROM 
    Supervisors sup
JOIN 
    People p ON sup.Supervisor_id = p.People_id
JOIN 
    Regions r ON sup.Region_Region_code = r.Region_code
    order by supervisor_first_name;

-- get all students with no project
SELECT s.Student_id, concat(p.first_name, " ", p.last_name) as studentName
FROM Students s
LEFT JOIN Projects pr ON s.Projects_idprojects = pr.idprojects
join People p on p.people_id = s.student_id
WHERE pr.idprojects IS NULL;
    
-- count classes in each city
SELECT c.CityName, COUNT(cl.idClasses) AS class_count
FROM Cities c
LEFT JOIN Classes cl ON c.idCities = cl.Cities_idCities
GROUP BY c.CityName;

-- INSERT INTO magshimim.Projects (idprojects, project_name, date_of_submition, idproject_topic, Alumnies_People_Alumni_id) 
-- VALUES (198, 'test2', '2024-03-05', 1, '000001');

-- CREATE TABLE magshimim.ProjectLog (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   project_id INT,
--   project_name VARCHAR(255),
--   submission_date DATE,
--   action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   action VARCHAR(255)
-- );
