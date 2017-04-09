/*
 * postgres script.
 * Load the database with reference data and unit test data.
 */

-- password is 'password'
INSERT INTO Account (username, password, adminFlag)
 VALUES ('admin', '$2a$10$9/44Rne7kQqPXa0cY6NfG.3XzScMrCxFYjapoLq/wFmHz7EC9praK', true);
-- password is 'password'
INSERT INTO Account (username, password, adminFlag)
VALUES ('user', '$2a$10$9/44Rne7kQqPXa0cY6NfG.3XzScMrCxFYjapoLq/wFmHz7EC9praK', false);
-- password is 'operations'

INSERT INTO Person(name,surname,middleName,address, phone, birthdate)
  VALUES ('Барак', 'Обама', 'Игоревич', 'Бирюлево','89199999119','1966-01-01');
INSERT INTO Person(name,surname,middleName,address, phone, birthdate)
  VALUES ('Олег',  'Обама','Игоревич','Бирюлево','89144999119','1946-01-01');
INSERT INTO Person(name,surname,middleName,address, phone, birthdate)
  VALUES ('Владимир',  'Путин','Владимирович','ЦАО','89999999999','1960-11-01');
INSERT INTO Person(name,surname,middleName,address, phone, birthdate)
 VALUES ('Дмитрий','Матов', 'Владимирович', 'Москворечье','89191991919','1996-01-11');
INSERT INTO Person(name,surname,middleName,address, phone, birthdate)
  VALUES ('Бро', 'Бро', 'Бро','ЦАО','89166666666','1990-05-01');
INSERT INTO Person(name,surname,middleName,address, phone, birthdate)
  VALUES ('Семен', 'Михайл', 'Михин','ЦАО','891666669966','2000-05-01');


INSERT INTO Vote(dateTime, address, description)
  VALUES ('2018-12-12', 'Москва','Выборы президента');

INSERT INTO Vote(dateTime, address, description)
  VALUES ('2016-12-12', 'Самара','Выборы в думу');


INSERT INTO PersonVote(personId,voteId,voted)
  VALUES (1, 2, false);
 INSERT INTO PersonVote(personId,voteId,voted)
   VALUES (3, 2, true);
INSERT INTO PersonVote(personId,voteId,voted)
  VALUES (4, 2, true);
