CREATE TABLE projects (
    id serial PRIMARY KEY,
    cipher integer UNIQUE NOT NULL,
    name text UNIQUE NOT NULL,
    deadline timestamp NOT NULL,
    laboriousness integer NOT NULL
);

CREATE TABLE employees (
    id serial PRIMARY KEY,
    full_name text UNIQUE NOT NULL,
    function text NOT NULL
);

CREATE TABLE assignments (
    id serial PRIMARY KEY,
    laboriousness integer NOT NULL,
    issue_date timestamp NOT NULL,
    planned_expiration_date timestamp NOT NULL,
    real_expiration_date timestamp NOT NULL,
    project_id integer REFERENCES projects (id) NOT NULL,
    employee_id integer REFERENCES employees (id) NOT NULL
);
