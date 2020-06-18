CREATE TABLE Person_R2(
	addressP varchar(50),
	zip varchar(6) NOT NULL,
	stateP varchar(20) NOT NULL,
	city varchar(20) NOT NULL,
	PRIMARY KEY (addressP)
)

CREATE TABLE Person_R1(
	personID varchar(9),
	name varchar(20) NOT NULL,
	school varchar(20) NOT NULL,
	addressP varchar(50) NOT NULL,
	phone varchar(8) NOT NULL,
	email varchar(20) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (addressP) REFERENCES Person_R2
)

CREATE TABLE Stakeholder(
	personID varchar(9),
	domain varchar(40),
	PRIMARY KEY (personID)
)

CREATE TABLE Professor(
	personID varchar(9),
	expertiseField varchar(40),
	PRIMARY KEY (personID)
)

CREATE TABLE Student(
	personID varchar(9),
	studentID varchar(9),
	admissionDate date,
	major varchar(50),
	minor varchar(50),
	PRIMARY KEY (personID)
)

CREATE TABLE Staff(
	personID varchar(9),
	staffID varchar(9),
	dateHired datetime,
	position varchar(20),
	PRIMARY KEY (personID)
)

CREATE TABLE Undergraduate(
	personID varchar(9),
	PRIMARY KEY (personID)
)

CREATE TABLE Graduate(
	personID varchar(9),
	PRIMARY KEY (personID)
)

CREATE TABLE Technical_Staff(
	personID varchar(9),
	labName varchar(20),
	labSchool varchar(20),
	PRIMARY KEY (personID)
)

CREATE TABLE Admin_Staff(
	personID varchar(9),
	office varchar(20),
	officePhone varchar(8),
	portfolio varchar(20),
	PRIMARY KEY (personID)
)

CREATE TABLE Lab(
	name varchar(20),
	school varchar(20),
	location varchar(50),
	PRIMARY KEY (name,school)
)

CREATE TABLE Research_Lab(
	name varchar(20),
	school varchar(20),
	researchArea varchar(20),
	PRIMARY KEY (name,school)
)

CREATE TABLE Teaching_Lab(
	name varchar(20),
	school varchar(20),
	labType varchar(20),
	PRIMARY KEY (name,school)
)

CREATE TABLE Timetable(
	datetimeT datetime,
	venue varchar(20),
	classType varchar(20),
	PRIMARY KEY (datetimeT,venue)
)

CREATE TABLE Course(
	courseCode varchar(6),
	PRIMARY KEY (courseCode)
)

CREATE TABLE CommentSuggestion(
	topic varchar(20),
	dateCS date,
	stakeholderPersonID varchar(9),
	statusCS varchar(10),
	PRIMARY KEY (topic, dateCS, stakeholderPersonID)
)

CREATE TABLE Experiment(
	datetimeE datetime,
	undergraduatePersonID varchar(9),
	labName varchar(20),
	labSchool varchar(20),
	PRIMARY KEY (datetimeE, undergraduatePersonID, labName, labSchool)
)

CREATE TABLE Equipment(
	ID varchar(9),
	name varchar(20),
	labName varchar(20),
	labSchool varchar(20),
	modelNo varchar(10),
	datePurchased date,
	PRIMARY KEY (ID, name, labName, labSchool)
)

CREATE TABLE teach(
	ID varchar(9),
	name varchar(20),
	labName varchar(20),
	labSchool varchar(20),
	modelNo varchar(10),
	datePurchased date,
	PRIMARY KEY (ID, name, labName, labSchool)
)

