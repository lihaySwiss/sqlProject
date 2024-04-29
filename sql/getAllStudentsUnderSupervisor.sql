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
END