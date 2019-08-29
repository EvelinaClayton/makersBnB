CREATE TABLE properties(id SERIAL PRIMARY KEY, title VARCHAR(60), city VARCHAR(60), pricepernight INTEGER, details VARCHAR(240), user_id int, FOREIGN KEY (user_id) REFERENCES users(id));
