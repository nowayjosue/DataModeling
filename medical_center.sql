CREATE TABLE doctor (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE patient (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL
);

CREATE TABLE patient_doctor (
  patient_id INTEGER REFERENCES patient (id),
  doctor_id INTEGER REFERENCES doctor (id),
  PRIMARY KEY (patient_id, doctor_id)
);

CREATE TABLE disease (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT
);

CREATE TABLE diagnosis (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patient (id),
  disease_id INTEGER REFERENCES disease (id),
  diagnosed_on DATE NOT NULL
);