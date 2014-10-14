psql

CREATE DATABASE restaurants_db;

\c restaurants_db;

CREATE TABLE parties(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	party_head_name VARCHAR(255),
	past_attendance smallint,
	dietary_restrictions VARCHAR(255),
	allergies VARCHAR(255)
);

#To build, a third table for individual patrons.
#This will allow you to mark which individual patron has attended in the past
#Which individual is allergic, or has a dietary restriction.

#This will also allow you to say who ordered what.

CREATE TABLE foods(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	price real,
	cuisine_type VARCHAR(255),
	allergen VARCHAR(255),
	diet_flags VARCHAR(255),
	calories smallint,
	inventory smallint
);

CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	food_id INTEGER, party_id INTEGER
);

psql < restaurants_db