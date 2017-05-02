#! /usr/bin/python
import fileinput
import os
import csv
import hashlib
import datetime
from peewee import *
import geoip2.database

reader = geoip2.database.Reader('/opt/scripts/GeoLite2-City.mmdb')



# global data base connection, it can use any peewee db connection
db = MySQLDatabase('squid', user='root', passwd='root')

class CustomModel(Model):
	class Meta:
		database = db

class Access(CustomModel):
	id = IntegerField()
	time = DateTimeField()
	elapse = FloatField()
	remotehost = CharField()
	country = CharField()
	city = CharField()
	code = CharField()
	bytes = IntegerField()
	method = CharField()
	url = CharField()
	url_0 = CharField()
	rfc931 = CharField()
	hierarchy_peerhost = CharField()
	hierarchy_peerhost_1 = CharField()
	type = CharField()

# pick the data from stdin and build two lists: raw and log,
# insert the values into the database
if __name__ == "__main__":
	raw = []
	log = []

	for line in fileinput.input("/var/log/squid3/access.log"):
		raw.append(line)
		print("Ok")

	for line in csv.reader(raw, delimiter=" ", skipinitialspace=True):
		log.append(line)

	db.connect()

	for line in log:
		entry = Access()
		entry.time = datetime.datetime.fromtimestamp(int(line[0]))
		entry.elapse = line[1]
		entry.remotehost = line[2]
		response = None
		entry.country = None
		entry.city = None
		try:
			response = reader.city(line[2])
			entry.country = response.country.name
			entry.city = response.city.name
		except ValueError:
			pass
		entry.code = line[3]
		entry.bytes = line[4]
		entry.method = line[5]
		entry.url = line[6]
		u_00 = line[6]
		u_0 = u_00.split("/")
		if u_0[0]!="http:":
			entry.url_0 = line[6]
		else:
			entry.url_0 = u_0[2]
		entry.rfc931 = line[7]
		entry.hierarchy_peerhost = line[8]
		h_p_11 = line[8]
		h_p_1 = h_p_11.split("/")
		entry.hierarchy_peerhost_1 = h_p_1[1]
		entry.type = line[9]

		try:
			entry.save()
		except:
			pass
#EOF
