CREATE DEFINER=`root`@`localhost` TRIGGER `project_submission_trigger` AFTER INSERT ON `Projects` FOR EACH ROW BEGIN
    -- Action: Insert into ProjectLog table
    INSERT INTO ProjectLog (project_id, project_name, submission_date, action_timestamp, action)
    VALUES (NEW.idprojects, NEW.project_name, NEW.date_of_submition, NOW(), 'New project submitted');
END