CREATE TABLE wizards(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  age INTEGER,
  color TEXT
);

CREATE TABLE spells(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  amount INTEGER,
  effect TEXT,
  wizard_id REFERENCES wizards
);

INSERT INTO wizards (name, age, color) VALUES
  ('Alviarin', 103, 'White'),
  ('Tenser', 75, 'Brown'),
  ('Eriadna', 85, 'Green'),
  ('Bigby', 40, 'Yellow');

INSERT INTO spells(name, amount, effect, wizard_id) VALUES
  ('Fire Ball', 7, 'damage', 1),
  ('Ice Storm', 13, 'damage', 3),
  ('Shape Shift', 3, 'powerup', 4), 
  ('Invisibility', 0, 'invuln', 2),
  ('Lightning Bolt', 23, 'damage', 1),
  ('Earth Quake', 15, 'damage', 2),
  ('Tidal Wave', 44, 'damage', 4),
  ('Teleport', 0, 'invuln', 3);