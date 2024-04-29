CREATE DEFINER=`root`@`localhost` PROCEDURE `switchStudentClass`(in newClass int, in requstedStudent int)
BEGIN
-- update query to move student to different class
UPDATE Students
SET Classes_idClasses = newClass -- new class
WHERE Student_id = requstedStudent; -- student id
END