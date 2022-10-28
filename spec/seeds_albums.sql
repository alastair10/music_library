-- truncate the table - this is so our table is emptied between each test run,
-- TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY;
-- use INSERT statements to provide seed data for the test file

-- INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');
-- INSERT INTO artists (name, genre) VALUES ('Blink-182', 'Alternative');

INSERT INTO albums (title, release_year, artist_id) VALUES ('Dookie', '1995', 1);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Dude Ranch', '1997', 2);