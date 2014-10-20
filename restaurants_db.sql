CREATE DATABASE restaurants_db;

\c restaurants_db;

CREATE TABLE parties(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	party_head_name VARCHAR(255),
	past_attendance varchar(3),
	attendees smallint,
	tab_num smallint,
	paid VARCHAR(3),
	diet_flags VARCHAR(255),
	allergen VARCHAR(255)
);

CREATE TABLE foods(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	price real,
	cuisine VARCHAR(255),
	allergen VARCHAR(255),
	diet_flags VARCHAR(255),
	calories smallint,
	inventory smallint
);

CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	food_id INTEGER, 
	party_id INTEGER,
	ready_to_serve varchar(3)
);

psql < restaurants_db