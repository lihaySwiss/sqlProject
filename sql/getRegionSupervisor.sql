CREATE DEFINER=`root`@`localhost` PROCEDURE `getRegionSupervisor`(in requestedRegionCode int)
BEGIN
SELECT
	p.first_name AS supervisor_first_name,
	p.last_name AS supervisor_last_name,
	sup.Supervisor_id,
	r.Region_code,
	p.phone_number
FROM
	Supervisors sup
JOIN
	People p on sup.Supervisor_id = p.People_id
JOIN
	Regions r ON sup.Region_Region_code = r.Region_code

where requestedRegionCode = r.Region_code;
END