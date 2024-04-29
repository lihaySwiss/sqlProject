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
END