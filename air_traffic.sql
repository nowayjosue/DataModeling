DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

CREATE TABLE airports (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  departure_airport_id INTEGER REFERENCES airports (id),
  arrival_airport_id INTEGER REFERENCES airports (id),
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines (id)
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers (id),
  flight_id INTEGER REFERENCES flights (id),
  seat TEXT NOT NULL
);

-- Insert airport data
INSERT INTO airports (name, city, country)
VALUES
  ('Washington Dulles International Airport', 'Washington DC', 'United States'),
  ('Seattle-Tacoma International Airport', 'Seattle', 'United States'),
  ('Los Angeles International Airport', 'Los Angeles', 'United States'),
  ('Mexico City International Airport', 'Mexico City', 'Mexico'),
  ('Paris Charles de Gaulle Airport', 'Paris', 'France'),
  ('Dubai International Airport', 'Dubai', 'UAE'),
  ('Tokyo Haneda Airport', 'Tokyo', 'Japan'),
  ('London Heathrow Airport', 'London', 'United Kingdom'),
  ('Casablanca Mohammed V International Airport', 'Casablanca', 'Morocco'),
  ('Beijing Capital International Airport', 'Beijing', 'China'),
  ('John F. Kennedy International Airport', 'New York', 'United States'),
  ('Charlotte Douglas International Airport', 'Charlotte', 'United States'),
  ('McCarran International Airport', 'Las Vegas', 'United States'),
  ('O''Hare International Airport', 'Chicago', 'United States'),
  ('Louis Armstrong New Orleans International Airport', 'New Orleans', 'United States'),
  ('São Paulo-Guarulhos International Airport', 'Sao Paolo', 'Brazil'),
  ('Arturo Merino Benítez International Airport', 'Santiago', 'Chile'),
  ('Eastern Iowa Airport', 'Cedar Rapids', 'United States');

-- Insert airline data  
INSERT INTO airlines (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

-- Insert flight data
INSERT INTO flights (departure_airport_id, arrival_airport_id, departure_time, arrival_time, airline_id)
VALUES
  (1, 2, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1),
  (7, 8, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2),
  (3, 13, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3),
  (2, 4, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3),
  (5, 9, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4),
  (6, 10, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5),
  (11, 12, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1),
  (18, 14, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6),  
  (12, 15, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6),
  (16, 17, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7);

-- Insert passenger data
INSERT INTO passengers (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),  
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

-- Insert ticket data  
INSERT INTO tickets (passenger_id, flight_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),  
  (3, 3, '12F'),
  (1, 4, '20A'),
  (4, 5, '23D'),
  (2, 6, '18C'),
  (5, 7, '9E'),
  (6, 8, '1A'),
  (5, 9, '32B'),
  (7, 10, '10D');