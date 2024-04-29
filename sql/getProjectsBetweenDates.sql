CREATE DEFINER=`root`@`localhost` PROCEDURE `getProjectsBetweenDates`(in startDate date, in endDate date)
BEGIN

-- all projects between these dates or null dates
SELECT *
FROM Projects p
WHERE date_of_submition BETWEEN startDate AND endDate
   OR date_of_submition IS NULL;

END