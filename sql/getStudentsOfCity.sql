CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudentsOfCity`(in idOfCity int)
BEGIN
-- id of all students from certain city
SELECT Student_id, concat(p.first_name, " ", p.last_name) as studentName, cityName
FROM Students s
join People p on p.people_id = s.student_id
join Cities on idCities = idOfCity;
END