--Create database

CREATE DATABASE flowers;

--Select Database

USE flowers;

--Create tables

CREATE TABLE Zones(
    id TINYINT(2) NOT NULL PRIMARY AUTO_INCREMENT,
    lowerTemp TINYINT(2) NOT NULL,
    higerTemp TINYINT(2) NOT NULL )
    AUTO_INCREMENT = 2;

CREATE TABLE Deliveries(
    id TINYINT(1) NOT NULL PRIMARY AUTO_INCREMENT,
    categ VARCHAR(5) NOT NULL,
    delSize DECIMAL(5,3)
);

CREATE TABLE FLowersInfo(
    id CHAR(3) NOT NULL PRIMARY AUTO_INCREMENT,
    comName VARCHAR(30) NOT NULL,
    latName VARCHAR(35) NOT NULL,
    cZone TINYINT(2) NOT NULL,
    hZone TINYINT(2) NOT NULL,
    deliver TINYINT(2) NOT NULL,
    sunNeeds VARCHAR(5)
);

--Populate tables

--Query db