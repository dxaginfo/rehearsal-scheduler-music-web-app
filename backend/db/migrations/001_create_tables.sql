CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(120) UNIQUE NOT NULL,
  role VARCHAR(20) NOT NULL,
  password_hash VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  owner_id INTEGER REFERENCES users(id)
);

CREATE TABLE memberships (
  user_id INTEGER REFERENCES users(id),
  band_id INTEGER REFERENCES bands(id),
  joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, band_id)
);

CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  scheduled_time TIMESTAMP NOT NULL,
  location VARCHAR(128),
  created_by INTEGER REFERENCES users(id),
  status VARCHAR(16)
);

CREATE TABLE attendance (
  user_id INTEGER REFERENCES users(id),
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  status VARCHAR(16),
  notes TEXT,
  PRIMARY KEY (user_id, rehearsal_id)
);

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  amount NUMERIC,
  date TIMESTAMP,
  status VARCHAR(16),
  description TEXT
);

CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  type VARCHAR(32),
  content TEXT,
  sent_at TIMESTAMP
);
