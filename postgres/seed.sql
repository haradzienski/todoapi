\connect tododb

CREATE TABLE todos
(
    id          SERIAL PRIMARY KEY,
    title       VARCHAR(140) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    done        BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE todos OWNER TO todouser;

INSERT INTO todos (title, description, done)
VALUES
    ('Run the app', 'Run the application', true),
    ('See the todos', 'See the actual todo items', true),
    ('Cross one out', 'Cross this one out', false);