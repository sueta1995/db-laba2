SELECT a.id, p.name, a.laboriousness
FROM assignments a, projects p
WHERE a.project_id = p.id
AND a.laboriousness = (
	SELECT MAX(aa.laboriousness)
	FROM assignments aa
	WHERE aa.project_id = p.id
)
ORDER BY laboriousness
