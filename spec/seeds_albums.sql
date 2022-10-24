-- truncate the table - this is so our table is emptied between each test run,
TRUNCATE TABLE albums RESTART IDENTITY;

-- use INSERT statements to provide seed data for the test file

INSERT INTO albums (title, release_year, artist_id) VALUES ('Dookie', '1995', 3);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Dude Ranch', '1997', 2);