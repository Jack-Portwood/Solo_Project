DROP TABLE exhibits;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  style VARCHAR(255),
  info VARCHAR(255)
);

CREATE TABLE exhibits (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  style VARCHAR(255),
  info VARCHAR(255),
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE 

);
