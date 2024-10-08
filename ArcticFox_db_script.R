library(DBI)
library(RSQLite)

#Establish database connection and create database
ArcticFox_db <- dbConnect(RSQLite::SQLite(), "ArcticFox_db.db")

#Create tables

dbExecute(ArcticFox_db,
         "CREATE TABLE sites (
            site_id char(3) NOT NULL PRIMARY KEY,
            site varchar(40)
          );")

dbExecute(ArcticFox_db, 
          "CREATE TABLE individuals (
indiv_ID varchar(12) NOT NULL PRIMARY KEY,
morph char(1) CHECK (morph IN ('W', 'B'))
);")

dbExecute(ArcticFox_db,
          "CREATE TABLE site_year_conditions (
site_year_id integer PRIMARY KEY AUTOINCREMENT,
site_id char(3),
year char(4),
rodent integer CHECK (rodent IN ('1', '2', '3', '4')),
temperature real,
snow_depth real,
sonw_continuous integer,
FOREIGN KEY (site_id) REFERENCES sites(site_id)
);")

dbExecute(ArcticFox_db,
          "CREATE TABLE molt_observations (
molt_id integer PRIMARY KEY AUTOINCREMENT,
site_year_id integer,
indiv_ID varchar(12),
date integer,
moult_score integer,
FOREIGN KEY (site_year_id) REFERENCES site_year_conditions(site_year_id),
FOREIGN KEY (indiv_ID) REFERENCES individuals(indiv_ID)
);")
