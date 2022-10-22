SELECT id, laboriousness, issue_date, planned_expiration_date
FROM assignments
WHERE project_id = 8
ORDER BY issue_date
