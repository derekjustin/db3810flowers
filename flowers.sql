-- Create database

CREATE DATABASE flowers;

-- Select Database

USE flowers;

-- Create tables

CREATE TABLE Zones(
    id TINYINT(2) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lowerTemp TINYINT(2) NOT NULL,
    higherTemp TINYINT(2) NOT NULL 
) AUTO_INCREMENT = 2;

CREATE TABLE Deliveries(
    id TINYINT(1) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    categ VARCHAR(5) NOT NULL,
    delSize DECIMAL(5,3) NULL
) AUTO_INCREMENT = 1;

CREATE TABLE FlowersInfo(
    id TINYINT(3) NOT NULL PRIMARY KEY,
    comName VARCHAR(30) NOT NULL,
    latName VARCHAR(35) NOT NULL,
    cZone TINYINT(2) NOT NULL,
    hZone TINYINT(2) NOT NULL,
    deliver TINYINT(2) NOT NULL,
    sunNeeds VARCHAR(5),

    FOREIGN KEY (cZone) REFERENCES Zones (id),
    FOREIGN KEY (hZone) REFERENCES Zones (id),
    FOREIGN KEY (deliver) REFERENCES Deliveries (id)

);


-- Populate tables

-- zones
INSERT INTO zones(lowerTemp,higherTemp) VALUES (-50,-40);
INSERT INTO zones(lowerTemp,higherTemp) VALUES (-40,-30);
INSERT INTO zones(lowerTemp,higherTemp) VALUES (-30,-20);
INSERT INTO zones(lowerTemp,higherTemp) VALUES (-20,-10);
INSERT INTO zones(lowerTemp,higherTemp) VALUES (-10,0);
INSERT INTO zones(lowerTemp,higherTemp) VALUES (0,10);
INSERT INTO zones(lowerTemp,higherTemp) VALUES (10,20);
INSERT INTO zones(lowerTemp,higherTemp) VALUES (20,30);
INSERT INTO zones(lowerTemp,higherTemp) VALUES (30,40);

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
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (101,'Lady Fern','Atbyrium filix-femina',2,9,5,'SH');
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (102,'Pink Caladiums','C.x bortulanum',10,10,6,'PtoSH');
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (103,'Lily-of-the-Valley','Convallaria majalis',2,8,5,'PtoSH');
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (105,'Purple Liatris','Liatris spicata',3,9,6,'StoP');
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (106,'Black Eyed Susan','Rudbeckia fulgida var. specios',4,10,2,'StoP');
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (107,'Nikko Blue Hydrangea','Hydrangea macrophylla',5,9,4,'StoSH');
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (108,'Variegated Weigela','W. florida Variegata',4,9,8,'StoP');
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (110,'Lombardy Poplar','Populus nigra Italica',3,9,9,'S');
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (111,'Purple Leaf Plum Hedge','Prunus x cistena',2,8,7,'S');
INSERT INTO FlowersInfo(id,comName,latName,cZone,hZone,deliver,sunNeeds) VALUES (114,'Thorndale Ivy','Hedera belix Thorndale',3,9,1,'StoSH');

-- TODO: Query db
-- a) the total number of zones.
SELECT COUNT(*) AS 'Total Zones' FROM zones;

-- b) the number of flowers per cool zone.
SELECT cZone AS 'Cool Zone' , COUNT(*) AS 'Number of Flowers' FROM flowersInfo GROUP BY cZone;

-- c) common names of the plants that have delivery sizes less than 5.
SELECT comName AS 'Common Name: delSize < 5' FROM FlowersInfo A INNER JOIN Deliveries B ON A.deliver = B.id WHERE B.delSize < 5;

-- d) common names of the plants that require full sun (i.e., sun needs contains ‘S’).
SELECT comName AS 'Common Name: requires full Sun' FROM flowersInfo WHERE sunNeeds LIKE 'Sto%' OR sunNeeds LIKE 'S';

-- e) all delivery category names order alphabetically (without repetition).
SELECT categ AS 'Delivery Category Names' FROM Deliveries GROUP BY categ ORDER BY categ;

-- f) the exact output (note that it is order by Name):
SELECT A.comName AS 'Name',B.lowerTemp AS 'Cool Zone (low)',B.higherTemp AS 'Cool Zone (high)',C.categ AS 'Delivery Category' FROM FlowersInfo A INNER JOIN Zones B ON A.cZone = B.id,Deliveries C WHERE C.id = A.deliver ORDER BY A.comName;

-- g) plant names that have the same hot zone as “Pink Caladiums” (your solution MUST get
-- the hot zone of “Pink Caladiums” in a variable).
SET @PChzone := (SELECT hZone FROM FlowersInfo WHERE comName = 'Pink Caladiums');
SELECT comName AS 'Common Name',latName AS 'Latin Name' FROM flowersInfo A WHERE A.hZone = @PChzone AND A.comName != 'Pink Caladiums';

-- h) the total number of plants, the minimum delivery size, the maximum delivery size, and
-- the average size based on the plants that have delivery sizes (note that the average value
-- should be rounded using two decimals).
SET @Totalplants := (SELECT COUNT(deliver) FROM flowersInfo A WHERE deliver != 5 AND deliver != 6);
SET @MINdelSize := (SELECT ROUND(MIN(delSize),1) FROM Deliveries);
SET @MAXdelSize := (SELECT ROUND(MAX(delSize),0) FROM Deliveries);
SET @AVGdelSize := (SELECT ROUND(SUM(delSize) / @TotalPlants,2) FROM Deliveries WHERE deliver != 5 AND deliver != 6);
SELECT @Totalplants AS 'Total',@MINdelSize AS 'Min',@MAXdelSize AS 'Max',@AVGdelSize AS 'Average'; 

-- i) the Latin name of the plant that has the word ‘Eyed’ in its name (you must use LIKE in
-- this query to get full credit).
SELECT latName AS 'Latin Name' FROM flowersInfo WHERE comName LIKE '%Eyed%';

-- j) the exact output (ordered by Category and then by Name):
SELECT A.categ AS 'Category',B.comName AS 'Name' FROM Deliveries A INNER JOIN flowersInfo B ON A.id = B.deliver ORDER BY A.categ,B.comName;