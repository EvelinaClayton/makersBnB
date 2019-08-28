CREATE TABLE properties(id SERIAL PRIMARY KEY, title  VARCHAR(60), city VARCHAR(60), user_id SERIAL REFERENCES user(id));
