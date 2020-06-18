CREATE TABLE Person_R2( --done
	addressP varchar(50),
	zip varchar(6) NOT NULL,
	stateP varchar(20) NOT NULL,
	city varchar(20) NOT NULL,
	PRIMARY KEY (addressP)
)

CREATE TABLE Person_R1( --done
	personID varchar(9),
	name varchar(20) NOT NULL,
	school varchar(100) NOT NULL,
	addressP varchar(50) NOT NULL,
	phone varchar(8) NOT NULL,
	email varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY (personID),
	FOREIGN KEY (addressP) REFERENCES Person_R2
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Stakeholder( --done
	personID varchar(9),
	domain varchar(40) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Professor( --done
	personID varchar(9),
	expertiseField varchar(40) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Student( --done
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

CREATE TABLE Staff( --done
	personID varchar(9) NOT NULL,
	staffID varchar(9) NOT NULL,
	dateHired datetime NOT NULL,
	position varchar(20) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Undergraduate( --done
	personID varchar(9) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Graduate( --done
	personID varchar(9) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Lab( --done
	nameL varchar(20),
	school varchar(50),
	location varchar(50),
	PRIMARY KEY (nameL,school)
)

CREATE TABLE Research_Lab( --done
	nameRL varchar(20),
	school varchar(50),
	researchArea varchar(50),
	PRIMARY KEY (nameRL, school),
	FOREIGN KEY (nameRL, school) REFERENCES Lab
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Teaching_Lab( --done
	name varchar(20),
	school varchar(50),
	labType varchar(20),
	PRIMARY KEY (name, school),
	FOREIGN KEY (name,school) REFERENCES Lab
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Technical_Staff( --done
	personID varchar(9) NOT NULL,
	labName varchar(20) NOT NULL,
	labSchool varchar(50) NOT NULL,
	PRIMARY KEY (personID, labName, labSchool),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (labName, labSchool) REFERENCES Lab(nameL, school)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Admin_Staff( --done
	personID varchar(9) NOT NULL,
	office varchar(20) NOT NULL,
	officePhone varchar(8) NOT NULL,
	portfolio varchar(20) NOT NULL,
	PRIMARY KEY (personID),
	FOREIGN KEY (personID) REFERENCES Person_R1
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Timetable( --done
	dayT varchar(20) NOT NULL,
	timeTstart TIME (0) NOT NULL,
	timeTend TIME (0) NOT NULL,
	venue varchar(20) NOT NULL,
	classType varchar(20) NOT NULL,
	PRIMARY KEY (dayT,timeTstart,timeTend,venue)
)

CREATE TABLE Course( --done
	courseCode varchar(6) NOT NULL UNIQUE,
	courseName varchar(50) NOT NULL,
	PRIMARY KEY (courseCode)
)

CREATE TABLE CommentSuggestion( --done
	topic varchar(20),
	dateCS date,
	stakeholderPersonID varchar(9),
	statusCS varchar(10) NOT NULL,
	PRIMARY KEY (topic, dateCS, stakeholderPersonID),
	FOREIGN KEY (stakeholderPersonID) REFERENCES Stakeholder(personID)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Experiment( --done
	dayE varchar(20) NOT NULL,
	timeEstart TIME (0) NOT NULL,
	timeEend TIME (0) NOT NULL,
	undergraduatePersonID varchar(9) NOT NULL,
	labName varchar(20) NOT NULL,
	labSchool varchar(50) NOT NULL,
	PRIMARY KEY (dayE, timeEstart, timeEend, undergraduatePersonID, labName, labSchool),
	FOREIGN KEY (undergraduatePersonID) REFERENCES Undergraduate(personID)
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (labName, labSchool) REFERENCES Lab(nameL, school)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE Equipment(--done
	ID varchar(9),
	nameE varchar(20),
	labName varchar(20),
	labSchool varchar(50),
	modelNo varchar(10) NOT NULL,
	datePurchased date NOT NULL,
	PRIMARY KEY (ID, nameE, labName, labSchool),
	FOREIGN KEY (labName, labSchool) REFERENCES Lab(nameL, school)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE teach( --done
	dayT varchar(20) NOT NULL,
	timeTstart TIME (0) NOT NULL,
	timeTend TIME (0) NOT NULL,
	venue varchar(20),
	courseCode varchar(6),
	professorPersonID varchar(9),
	PRIMARY KEY (dayT, timeTstart, timeTend, venue, courseCode, professorPersonID),
	FOREIGN KEY (professorPersonID) REFERENCES Professor(personID)
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (dayT, timeTstart, timeTend, venue) REFERENCES Timetable(dayT,timeTstart,timeTend,venue)
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (courseCode) REFERENCES Course(courseCode)
	ON DELETE cascade
	ON UPDATE cascade
)


CREATE TABLE takes( --done
	personID varchar(9),
	courseCode varchar(6),
	PRIMARY KEY (courseCode, personID),
	FOREIGN KEY (courseCode) REFERENCES Course
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (personID) REFERENCES Student
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE partOf( --done
	courseCode varchar(6),
	dayPO varchar(20) NOT NULL,
	timePOstart TIME (0) NOT NULL,
	timePOend TIME (0) NOT NULL,
	personID varchar(9),
	labName varchar(20),
	labSchool varchar(50),
	PRIMARY KEY (courseCode, dayPO, timePOstart, timePOend, personID, labName, labSchool),
	FOREIGN KEY (courseCode) REFERENCES Course
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (dayPO, timePOstart, timePOend, personID, labName, labSchool) REFERENCES Experiment(dayE, timeEstart, timeEend, undergraduatePersonID, labName, labSchool)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE assignGraduateResearchLab( --done
	personID varchar(9),
	labName varchar(20),
	labSchool varchar(50),
	PRIMARY KEY (personID, labName, labSchool),
	FOREIGN KEY (personID) REFERENCES Graduate(personID)
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (labName, labSchool) REFERENCES Research_Lab(nameRL, school)
	ON DELETE cascade
	ON UPDATE cascade
)

CREATE TABLE assignCommentSuggestionAdminStaff( --done
	AdminStaffPersonID varchar(9),
	StakeholderPersonID varchar(9),
	topic varchar(20),
	dateA date,
	PRIMARY KEY (AdminStaffPersonID, StakeholderPersonID),
	FOREIGN KEY (AdminStaffPersonID) REFERENCES Admin_Staff(personID)
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (StakeholderPersonID) REFERENCES Stakeholder(personID)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
)

CREATE TABLE supervisedBy( --done
	ProfessorPersonID varchar(9),
	GraduatePersonID varchar(9),
	topic varchar(50),
	PRIMARY KEY (ProfessorPersonID, GraduatePersonID),
	FOREIGN KEY (ProfessorPersonID) REFERENCES Professor(personID)
	ON DELETE cascade
	ON UPDATE cascade,
	FOREIGN KEY (GraduatePersonID) REFERENCES Graduate(personID)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
)
