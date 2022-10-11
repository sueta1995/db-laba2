CREATE TABLE projects (
    id integer PRIMARY KEY,
    cipher integer UNIQUE,
    name text UNIQUE,
    deadline timespamp,
    laboriousness integer
);

CREATE TABLE employees (
    id integer PRIMARY KEY,
    full_name text UNIQUE,
    function text
);

CREATE TABLE assignments (
    id integer PRIMARY KEY,
    laboriousness integer,
    issue_date timestamp,
    planned_expiration_date timestamp,
    real_expiration_date timestamp,
    project_id integer REFERENCES projects (id),
    employee_id integer REFERENCES employees (id)
);
    
