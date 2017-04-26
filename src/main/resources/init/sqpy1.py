#! /usr/bin/python
import fileinput
import os
import csv
import hashlib
import datetime
import psycopg2
from peewee import *


# global data base connection, it can use any peewee db connection
db = psycopg2.connect("dbname='squid' user='root' password='root'")

class CustomModel(Model):
	class Meta:
		database = db

class Store(CustomModel):
	id = IntegerField()
	time = DateTimeField()
	action = CharField()
	filenum=CharField()
	http_reply_code = CharField()
	http_date = CharField()
	http_expires = CharField()
	http_content_type = CharField()
	size = CharField()
	method = CharField()
	url = CharField()

# pick the data from stdin and build two lists: raw and log,
# insert the values into the database
if __name__ == "__main__":
	raw = []
	log = []
	i = 0
	
	for line in fileinput.input("/var/log/squid3/store.log"):
		raw.append(line)
		
	print("Ok1")
	for line in csv.reader(raw, delimiter=" ", skipinitialspace=True):
		log.append(line)
		
	print("Ok2")
	db.connect()
		
	for line in log:
		entry = Store() 
		entry.time = datetime.datetime.fromtimestamp(int(float(line[0])))
		entry.action = line[1]
		entry.filenum = line[3]
		entry.http_reply_code = line[5]
		entry.http_date = line[6]
		entry.http_expires = line[8]
		entry.http_content_type = line[9]
		entry.size = line[10]
		entry.method = line[11]
		entry.url = line[12]
		i=i+1

		try:
			entry.save()
		except:
			pass
	print(i)	
#EOF