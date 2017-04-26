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
	rfc931 = CharField()
	hierarchy_peerhost = CharField()
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
		response = reader.city(line[2])
		entry.country = response.country.name
		entry.city = response.city.name
		entry.latitude = response.location.latitude
		entry.longitude = response.location.longitude
		entry.code = line[3]
		entry.bytes = line[4]
		entry.method = line[5]
		entry.url = line[6]
		entry.rfc931 = line[7]
		entry.hierarchy_peerhost = line[8]
		entry.type = line[9]

		try:
			entry.save()
		except:
			pass
#EOF