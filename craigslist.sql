CREATE TABLE region (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE "user" (
  id SERIAL PRIMARY KEY, 
  username TEXT NOT NULL,
  preferred_region_id INTEGER REFERENCES region (id)
);

CREATE TABLE category (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  region_id INTEGER REFERENCES region (id)
);

CREATE TABLE post (
  id SERIAL PRIMARY KEY, 
  title TEXT NOT NULL,
  body TEXT NOT NULL, 
  user_id INTEGER REFERENCES "user" (id),
  region_id INTEGER REFERENCES region (id),
  category_id INTEGER REFERENCES category (id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);