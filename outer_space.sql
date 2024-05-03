DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;  
\c outer_space

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies (id)
);  

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars (id)
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,  
  name TEXT NOT NULL
);

CREATE TABLE planet_moons (
  planet_id INTEGER REFERENCES planets (id),
  moon_id INTEGER REFERENCES moons (id),
  PRIMARY KEY (planet_id, moon_id)  
);

-- Insert galaxy data
INSERT INTO galaxies (name)
VALUES
  ('Milky Way');

-- Insert star data  
INSERT INTO stars (name, galaxy_id)
VALUES
  ('The Sun', 1),  
  ('Proxima Centauri', 1),
  ('Gliese 876', 1);

-- Insert planet data
INSERT INTO planets (name, orbital_period_in_years, orbits_around)  
VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 1),
  ('Proxima Centauri b', 0.03, 2),
  ('Gliese 876 b', 0.23, 3);

-- Insert moon data  
INSERT INTO moons (name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),  
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),  
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),  
  ('Psamathe'),
  ('Neso');

-- Insert planet moon data
INSERT INTO planet_moons (planet_id, moon_id)
VALUES  
  (1, 1),
  (2, 2),
  (2, 3),
  (4, 4),
  (4, 5),
  (4, 6),
  (4, 7),
  (4, 8),
  (4, 9),
  (4, 10),
  (4, 11),
  (4, 12),  
  (4, 13),
  (4, 14),
  (4, 15),
  (4, 16),
  (4, 17);