-- Create database

CREATE DATABASE flowers;

-- Select Database

USE flowers;

-- Create tables

CREATE TABLE Zones(
    id TINYINT(2) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lowerTemp TINYINT(2) NOT NULL,
    higerTemp TINYINT(2) NOT NULL 
) AUTO_INCREMENT = 2;

CREATE TABLE Deliveries(
    id TINYINT(1) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    categ VARCHAR(5) NOT NULL,
    delSize DECIMAL(5,3) NULL
) AUTO_INCREMENT = 1;

CREATE TABLE FlowersInfo(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    comName VARCHAR(30) NOT NULL,
    latName VARCHAR(35) NOT NULL,
    cZone TINYINT(2) NOT NULL,
    hZone TINYINT(2) NOT NULL,
    deliver TINYINT(2) NOT NULL,
    sunNeeds VARCHAR(5)
) AUTO_INCREMENT = 101;

-- Populate tables
-- zones
LOAD DATA INFILE
'/Users/jstre/Desktop/fall19/cs_3810_DBsystems/projects/project1/db3810flowers/zones.csv'
INTO TABLE zones
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(lowerTemp,higerTemp);

-- deliveries
LOAD DATA INFILE
'/Users/jstre/Desktop/fall19/cs_3810_DBsystems/projects/project1/db3810flowers/deliveries.csv'
INTO TABLE deliveries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(categ,delSize)
;

LOAD DATA INFILE
'/Users/jstre/Desktop/fall19/cs_3810_DBsystems/projects/project1/db3810flowers/flowersInfo.csv'
INTO TABLE FlowersInfo
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(comName,latName,cZone,hZone,deliver,sunNeeds);

-- Query db
