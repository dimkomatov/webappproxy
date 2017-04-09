/*
 * postgres script.
 * Create the database schema for the application.
 */

--DROP SEQUENCE IF EXISTS hibernate_sequence;
--CREATE SEQUENCE hibernate_sequence START WITH 1 INCREMENT BY 1;

DROP TABLE IF EXISTS Account CASCADE;
DROP TABLE IF EXISTS PersonVote;
DROP TABLE IF EXISTS Vote;
DROP TABLE IF EXISTS Person;

CREATE TABLE Person(
  id SERIAL,
  name VARCHAR(100) NOT NULL,
  surName VARCHAR(100) NOT NULL,
  middleName VARCHAR(100) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone VARCHAR(100) NOT NULL,
  birthdate TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Vote(
  id SERIAL,
  dateTime TIMESTAMP NOT NULL,
  address VARCHAR(100) NOT NULL,
  description VARCHAR(100) NULL,
  PRIMARY KEY (id)
);
CREATE TABLE PersonVote(
  id SERIAL,
  personId INT REFERENCES Person ON DELETE CASCADE ,
  voteId INT REFERENCES Vote ON DELETE CASCADE ,
  voted BOOLEAN NOT NULL,
  PRIMARY KEY (personId,voteId)
);
CREATE TABLE Account (
  id SERIAL,
  adminFlag BOOLEAN NOT NULL,
  username VARCHAR(100) NOT NULL,
  password VARCHAR(200) NOT NULL,
  PRIMARY KEY (id)
  );

