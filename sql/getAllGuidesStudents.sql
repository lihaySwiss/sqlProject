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
END