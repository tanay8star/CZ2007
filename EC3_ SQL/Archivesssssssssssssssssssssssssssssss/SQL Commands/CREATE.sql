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
	school varchar(50) NOT NULL,
	addressP varchar(50) NOT NULL,
	phone varchar(8) NOT NULL,
	email varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY (personID),
	FOREIGN KEY (addressP) REFERENCES Person_R2
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Stakeholder(
	personID varchar(9),
	domain varchar(40) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Professor(
	personID varchar(9),
	expertiseField varchar(40) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Student(
	personID varchar(9),
	studentID varchar(9) NOT NULL UNIQUE,
	admissionDate date NOT NULL,
	major varchar(50) NOT NULL,
	minor varchar(50),
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Staff(
	personID varchar(9) NOT NULL,
	staffID varchar(9) NOT NULL,
	dateHired datetime NOT NULL,
	position varchar(20) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Undergraduate(
	personID varchar(9) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Graduate(
	personID varchar(9) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
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
	PRIMARY KEY (name, school),
	FOREIGN KEY (name, school) REFERENCES Lab
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Teaching_Lab(
	name varchar(20),
	school varchar(20),
	labType varchar(20),
	PRIMARY KEY (name, school),
	FOREIGN KEY (name,school) REFERENCES Lab
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Technical_Staff(
	personID varchar(9) NOT NULL,
	labName varchar(20) NOT NULL,
	labSchool varchar(20) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (labName, labSchool) REFERENCES Lab(name, school)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Admin_Staff(
	personID varchar(9) NOT NULL,
	office varchar(20) NOT NULL,
	officePhone varchar(8) NOT NULL,
	portfolio varchar(20) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Timetable(
	datetimeT datetime NOT NULL,
	venue varchar(20) NOT NULL,
	classType varchar(20) NOT NULL,
	PRIMARY KEY (datetimeT,venue)
)

CREATE TABLE Course(
	courseCode varchar(6) NOT NULL,
	PRIMARY KEY (courseCode)
)

CREATE TABLE CommentSuggestion(
	topic varchar(20),
	dateCS date,
	stakeholderPersonID varchar(9),
	statusCS varchar(10) NOT NULL,
	PRIMARY KEY (topic, dateCS, stakeholderPersonID),
	FOREIGN KEY (stakeholderPersonID) REFERENCES Stakeholder(personID)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Experiment(
	datetimeE datetime NOT NULL,
	undergraduatePersonID varchar(9) NOT NULL,
	labName varchar(20) NOT NULL,
	labSchool varchar(20) NOT NULL,
	PRIMARY KEY (datetimeE, undergraduatePersonID, labName, labSchool),
	FOREIGN KEY (undergraduatePersonID) REFERENCES Undergraduate(personID)
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (labName, labSchool) REFERENCES Lab(name, school)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Equipment(
	ID varchar(9),
	name varchar(20),
	labName varchar(20),
	labSchool varchar(20),
	modelNo varchar(10) NOT NULL,
	datePurchased date NOT NULL,
	PRIMARY KEY (ID, name, labName, labSchool),
	FOREIGN KEY (labName, labSchool) REFERENCES Lab(name, school)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE teach(
	dateTimeT datetime,
	venue varchar(20),
	courseCode varchar(6),
	professorPersonID varchar(9),
	PRIMARY KEY (dateTimeT, venue, courseCode, professorPersonID),
	FOREIGN KEY (professorPersonID) REFERENCES Professor(personID)
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (dateTimeT, venue) REFERENCES Timetable
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (courseCode) REFERENCES Course
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE takes(
	courseCode varchar(6),
	personID varchar(9),
	PRIMARY KEY (courseCode, personID),
	FOREIGN KEY (courseCode) REFERENCES Course
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (personID) REFERENCES Student
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE partOf(
	courseCode varchar(6),
	dateTimeE datetime,
	personID varchar(9),
	labName varchar(20),
	labSchool varchar(20),
	PRIMARY KEY (courseCode, dateTimeE, personID, labName, labSchool),
	FOREIGN KEY (courseCode) REFERENCES Course
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (datetimeE, personID, labName, labSchool) REFERENCES Experiment(datetimeE, undergraduatePersonID, labName, labSchool)
	ON DELETE cascade
	ON UPDATE cascade,
)

CREATE TABLE assignGraduateResearchLab(
	personID varchar(9),
	labName varchar(20),
	labSchool varchar(20),
	PRIMARY KEY (personID, labName, labSchool),
	FOREIGN KEY (personID) REFERENCES Graduate(personID)
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (labName, labSchool) REFERENCES Research_Lab(name, school)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE assignCommentSuggestionAdminStaff(
	AdminStaffPersonID varchar(9),
	StakeholderPersonID varchar(9),
	topic varchar(20),
	dateA date,
	PRIMARY KEY (AdminStaffPersonID, StakeholderPersonID),
	FOREIGN KEY (AdminStaffPersonID) REFERENCES Admin_Staff(personID)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	FOREIGN KEY (StakeholderPersonID) REFERENCES Stakeholder(personID)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE supervisedBy(
	ProfessorPersonID varchar(9),
	UndergraduatePersonID varchar(9),
	topic varchar(20),
	PRIMARY KEY (ProfessorPersonID, UndergraduatePersonID),
	FOREIGN KEY (ProfessorPersonID) REFERENCES Professor(personID)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	FOREIGN KEY (UndergraduatePersonID) REFERENCES Undergraduate(personID)
	ON DELETE cascade
	ON UPDATE cascade
)
