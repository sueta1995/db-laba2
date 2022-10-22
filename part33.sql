SELECT DISTINCT p.id, p.name, (
	SELECT AVG(aa.laboriousness)::NUMERIC(10,2)
	FROM assignments aa
	WHERE aa.project_id = p.id
)
FROM assignments a, projects p
ORDER BY avg
