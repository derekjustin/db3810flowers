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
    id TINYINT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    comName VARCHAR(30) NOT NULL,
    latName VARCHAR(35) NOT NULL,
    cZone TINYINT(2) NOT NULL,
    hZone TINYINT(2) NOT NULL,
    deliver TINYINT(2) NOT NULL,
    sunNeeds VARCHAR(5),

    FOREIGN KEY (cZone) REFERENCES Zones (id),
    FOREIGN KEY (hZone) REFERENCES Zones (id),
    FOREIGN KEY (deliver) REFERENCES Deliveries (id)

) AUTO_INCREMENT = 101;


-- Populate tables

-- zones
INSERT INTO zones(lowerTemp,higerTemp) VALUES (-50,-40);
INSERT INTO zones(lowerTemp,higerTemp) VALUES (-40,-30);
INSERT INTO zones(lowerTemp,higerTemp) VALUES (-30,-20);
INSERT INTO zones(lowerTemp,higerTemp) VALUES (-20,-10);
INSERT INTO zones(lowerTemp,higerTemp) VALUES (-10,0);
INSERT INTO zones(lowerTemp,higerTemp) VALUES (0,10);
INSERT INTO zones(lowerTemp,higerTemp) VALUES (10,20);
INSERT INTO zones(lowerTemp,higerTemp) VALUES (20,30);
INSERT INTO zones(lowerTemp,higerTemp) VALUES (30,40);

-- deliveries
INSERT INTO Deliveries(categ,delSize) VALUES ('pot',1.500);
INSERT INTO Deliveries(categ,delSize) VALUES ('pot',2.250);
INSERT INTO Deliveries(categ,delSize) VALUES ('pot',2.625);
INSERT INTO Deliveries(categ,delSize) VALUES ('pot',4.250);
INSERT INTO Deliveries(categ,delSize) VALUES ('plant',NULL);
INSERT INTO Deliveries(categ,delSize) VALUES ('bulb',NULL);
INSERT INTO Deliveries(categ,delSize) VALUES ('hedge',18.000);
INSERT INTO Deliveries(categ,delSize) VALUES ('shrub',24.000);
INSERT INTO Deliveries(categ,delSize) VALUES ('tree',36.000);

-- flowersInfo
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Lady Fern','Atbyrium filix-femina',2,9,5,'SH');
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Pink Caladiums','C.x bortulanum',10,10,6,'PtoSH');
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Lily-of-the-Valley','Convallaria majalis',2,8,5,'PtoSH');
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Purple Liatris','Liatris spicata',3,9,6,'StoP');
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Black Eyed Susan','Rudbeckia fulgida var. specios',4,10,2,'StoP');
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Nikko Blue Hydrangea','Hydrangea macrophylla',5,9,4,'StoSH');
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Variegated Weigela','W. florida Variegata',4,9,8,'StoP');
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Lombardy Poplar','Populus nigra Italica',3,9,9,'S');
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Purple Leaf Plum Hedge','Prunus x cistena',2,8,7,'S');
INSERT INTO FlowersInfo(comName,latName,cZone,hZone,deliver,sunNeeds) VALUES ('Thorndale Ivy','Hedera belix Thorndale',3,9,1,'StoSH');

-- TODO: Query db
-- a) the total number of zones.
SELECT COUNT(*) AS 'Total Zones' FROM zones;

-- b) the number of flowers per cool zone.


-- c) common names of the plants that have delivery sizes less than 5.
-- d) common names of the plants that require full sun (i.e., sun needs contains ‘S’).
-- e) all delivery category names order alphabetically (without repetition).
-- f) the exact output (note that it is order by Name):