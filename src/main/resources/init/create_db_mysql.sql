CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';

CREATE DATABASE squid;
GRANT all privileges ON database.squid TO 'root'@'localhost' IDENTIFIED BY 'root';

use squid;

CREATE TABLE access (
id INT NOT NULL AUTO_INCREMENT,
time DATETIME,
elapse FLOAT,
remotehost VARCHAR(160),
country VARCHAR(32),
city VARCHAR(64),
code VARCHAR(12),
latitude FLOAT,
longitude FLOAT,
bytes INT,
method VARCHAR(12),
url VARCHAR(500),
rfc931 VARCHAR(12),
hierarchy_peerhost VARCHAR(32),
type VARCHAR(12),
PRIMARY KEY (id,remotehost)
);

CREATE TABLE store (
id INT NOT NULL AUTO_INCREMENT,
time DATETIME,
action VARCHAR(20),
filenum VARCHAR(100),
http_reply_code VARCHAR(100),
http_date VARCHAR(100),
http_expires VARCHAR(26),
http_content_type VARCHAR(26),
size VARCHAR(26),
method VARCHAR(12),
url VARCHAR(500),
PRIMARY KEY (id,url)
);
