CREATE TABLE team (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE player (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team_id INTEGER REFERENCES team (id)  
);

CREATE TABLE referee (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE season (
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE match (
  id SERIAL PRIMARY KEY,
  home_team_id INTEGER REFERENCES team (id),
  away_team_id INTEGER REFERENCES team (id),
  match_date DATE NOT NULL,
  season_id INTEGER REFERENCES season (id)
);

CREATE TABLE goal (
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES player (id),
  match_id INTEGER REFERENCES match (id),
  scored_at TIME NOT NULL
);

CREATE TABLE match_referees (
  match_id INTEGER REFERENCES match (id),
  referee_id INTEGER REFERENCES referee (id),
  PRIMARY KEY (match_id, referee_id)
);

CREATE TABLE standings (
  season_id INTEGER REFERENCES season (id),
  team_id INTEGER REFERENCES team (id),
  games_played INTEGER,
  wins INTEGER,
  losses INTEGER, 
  draws INTEGER,
  points INTEGER,
  PRIMARY KEY (season_id, team_id)
);