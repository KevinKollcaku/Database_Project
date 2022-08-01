CREATE TABLE Region
(
  regionID INT NOT NULL auto_increment,
  regionName VARCHAR(50) NOT NULL DEFAULT "Unspecified",
  PRIMARY KEY (regionID)
);

CREATE TABLE Volume
(
  volumeID INT NOT NULL auto_increment,
  volumeTitle VARCHAR(50) NOT NULL unique,
  PRIMARY KEY (volumeID)
);

CREATE TABLE Level
(
  Title VARCHAR(50) NOT NULL unique,
  LevelD INT NOT NULL auto_increment,
  PRIMARY KEY (LevelD)
);

CREATE TABLE Programming_Language
(
  languageID INT NOT NULL auto_increment,
  languageName VARCHAR(50) NOT NULL,
  PRIMARY KEY (languageID)
);

CREATE TABLE Contest
(
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  ContestID INT NOT NULL auto_increment,
  ContestDescription TEXT NOT NULL,
  PRIMARY KEY (ContestID),
  CHECK (StartDate < EndDate)
);

CREATE TABLE Errors_type
(
  errorID INT NOT NULL auto_increment,
  errorType VARCHAR(50) NOT NULL unique,
  PRIMARY KEY (errorID)
);

CREATE TABLE ranks
(
  rankID INT NOT NULL auto_increment,
  rankName VARCHAR(25) NOT NULL DEFAULT 'Default',
  PRIMARY KEY (rankID)
);

CREATE TABLE AccessLevel
(
  Acces_ID INT NOT NULL auto_increment,
  Access_name VARCHAR(25) NOT NULL unique,
  PRIMARY KEY (Acces_ID)
);

CREATE TABLE person
(
  personID INT NOT NULL auto_increment,
  birthday DATE NOT NULL,
  fname VARCHAR(25) NOT NULL,
  lastName VARCHAR(25) NOT NULL,
  email VARCHAR(50) NOT NULL,
  username VARCHAR(25) NOT NULL unique,
  Gender CHAR(1) NOT NULL CHECK(Gender IN ('M', 'F')),
  regionID INT NOT NULL,
  PRIMARY KEY (personID),
  FOREIGN KEY (regionID) REFERENCES Region(regionID)
  ON DELETE RESTRICT
  ON UPDATE CASCADE
);

CREATE TABLE password
(
  Hash VARCHAR(64) NOT NULL,
  Salt VARCHAR(16) NOT NULL,
  personID INT NOT NULL,
  PRIMARY KEY (personID),
  FOREIGN KEY (personID) REFERENCES person(personID)
  ON DELETE CASCADE
);

CREATE TABLE user
(
  Date_Created DATE NOT NULL,
  personID INT NOT NULL,
  rankID INT,
  PRIMARY KEY (personID),
  FOREIGN KEY (personID) REFERENCES person(personID)
  ON DELETE CASCADE,
  FOREIGN KEY (rankID) REFERENCES ranks(rankID) ON DELETE SET NULL
);

CREATE TABLE Staff
(
  Institution VARCHAR(50) NOT NULL,
  personID INT NOT NULL,
  Acces_ID INT ,
  PRIMARY KEY (personID),
  FOREIGN KEY (personID) REFERENCES person(personID) ON DELETE CASCADE, 
  FOREIGN KEY (Acces_ID) REFERENCES AccessLevel(Acces_ID) ON DELETE SET NULL
);

CREATE TABLE participatesIN
(
  ContestID INT NOT NULL,
  personID INT NOT NULL,
  StartTOCompetDate  DATE NOT NULL,
  PRIMARY KEY (ContestID, personID),
  FOREIGN KEY (ContestID) REFERENCES Contest(ContestID) ON DELETE CASCADE, 
  FOREIGN KEY (personID) REFERENCES user(personID) ON DELETE CASCADE
);

CREATE TABLE Question
(
  QuestionTitle VARCHAR(256) NOT NULL,
  QuestionDescription TEXT NOT NULL,
  questionID INT NOT NULL auto_increment,
  Number_of_views INT NOT NULL DEFAULT 0,
  DateOfQuestionWritten DATE NOT NULL ,
  LevelD INT,
  personID INT,
  PRIMARY KEY (questionID),
  FOREIGN KEY (LevelD) REFERENCES Level(LevelD) ON DELETE SET NULL,
  FOREIGN KEY (personID) REFERENCES Staff(personID) ON DELETE SET NULL
);

CREATE TABLE Test_case
(
  case_input TEXT NOT NULL,
  case_output TEXT NOT NULL,
  case_ID INT NOT NULL auto_increment,
  questionID INT NOT NULL,
  PRIMARY KEY (case_ID),
  FOREIGN KEY (questionID) REFERENCES Question(questionID) ON DELETE CASCADE
);

CREATE TABLE submission
(
  dateOfSubmission DATE NOT NULL,
  userAnswer TEXT NOT NULL,
  successOrNot BOOLEAN NOT NULL,
  questionID INT NOT NULL,
  errorID INT,
  personID INT NOT NULL,
  languageID INT,
  PRIMARY KEY (questionID, personID, dateOfSubmission),
  FOREIGN KEY (questionID) REFERENCES Question(questionID) ON DELETE CASCADE,
  FOREIGN KEY (errorID) REFERENCES Errors_type(errorID),
  FOREIGN KEY (personID) REFERENCES user(personID) ON DELETE CASCADE,
  FOREIGN KEY (languageID) REFERENCES programming_language(languageID) ON DELETE SET NULL
);

CREATE TABLE Comment
(
  CommentID INT NOT NULL auto_increment,
  Comment_Text TEXT NOT NULL,
  DateOfComment DATE NOT NULL,
  Up_Vote INT NOT NULL DEFAULT 0,
  Down_Vote INT NOT NULL DEFAULT 0,
  questionID INT NOT NULL,
  personID INT,
  PRIMARY KEY (CommentID),
  FOREIGN KEY (questionID) REFERENCES Question(questionID) ON DELETE CASCADE,
  FOREIGN KEY (personID) REFERENCES user(personID) ON DELETE SET NULL
);


CREATE TABLE belongsTo
(
  questionID INT NOT NULL,
  volumeID INT NOT NULL,
  PRIMARY KEY (questionID, volumeID),
  FOREIGN KEY (questionID) REFERENCES Question(questionID) ON DELETE CASCADE,
  FOREIGN KEY (volumeID) REFERENCES Volume(volumeID) ON DELETE CASCADE
);

CREATE TABLE isOf
(
  languageID INT NOT NULL,
  questionID INT NOT NULL,
  PRIMARY KEY (languageID, questionID),
  FOREIGN KEY (languageID) REFERENCES Programming_Language(languageID) ON DELETE CASCADE,
  FOREIGN KEY (questionID) REFERENCES Question(questionID) ON DELETE CASCADE
);

CREATE TABLE Contains
(
  questionID INT NOT NULL,
  ContestID INT NOT NULL,
  PRIMARY KEY (questionID, ContestID),
  FOREIGN KEY (questionID) REFERENCES Question(questionID) ON DELETE CASCADE,
  FOREIGN KEY (ContestID) REFERENCES Contest(ContestID) ON DELETE CASCADE
);



###Region###

INSERT INTO Region VALUES(1, 'Albania');
INSERT INTO Region VALUES(2, 'Austria');
INSERT INTO Region VALUES(3, 'Belgium');
INSERT INTO Region VALUES(4, 'Brazil');
INSERT INTO Region VALUES(5, 'Bangladesh');
INSERT INTO Region VALUES(6, 'Bulgaria');
INSERT INTO Region VALUES(7, 'China');
INSERT INTO Region VALUES(8, 'Croatia');
INSERT INTO Region VALUES(10, 'Denmark');
INSERT INTO Region VALUES(11, 'Egypt');
INSERT INTO Region VALUES(12, 'Ethiopia');
INSERT INTO Region VALUES(13, 'Finland');
INSERT INTO Region VALUES(14, 'France');
INSERT INTO Region VALUES(15, 'Germany');
INSERT INTO Region VALUES(16, 'Greece');
INSERT INTO Region VALUES(17, 'Hungary');
INSERT INTO Region VALUES(18, 'India');
INSERT INTO Region VALUES(19, 'Indonesia');
INSERT INTO Region VALUES(20, 'Iran');
INSERT INTO Region VALUES(21, 'Iraq');
INSERT INTO Region VALUES(22, 'Israel');
INSERT INTO Region VALUES(23, 'Italy');
INSERT INTO Region VALUES(24, 'Japan');
INSERT INTO Region VALUES(25, 'Jamaica');
INSERT INTO Region VALUES(26, 'Kenya');

###Volume###

INSERT into Volume VALUES(1, 'Arrays');
INSERT into Volume VALUES(2, 'Binary Search Trees');
INSERT into Volume VALUES(3, 'AVL Trees');
INSERT into Volume VALUES(4, 'Recursion');
INSERT into Volume VALUES(5, 'Matrices');
INSERT into Volume VALUES(6, 'Functions');
INSERT into Volume VALUES(7, 'Object Oriented Programming');
INSERT into Volume VALUES(8, 'Sorting Problems');
INSERT INTO Volume VALUES(9, 'Competitive Programing');

###Level###

INSERT INTO Level VALUES("easy", 1);
INSERT INTO Level VALUES("Intermediate", 2);
INSERT INTO Level VALUES("hard", 3);
INSERT INTO Level VALUES("expert", 4);

###Programming Language###

Insert into Programming_Language VALUES(1, 'Python');
Insert into Programming_Language VALUES(2, 'Java');
Insert into Programming_Language VALUES(3, 'C++');
Insert into Programming_Language VALUES(4, 'C');
Insert into Programming_Language VALUES(5, 'C#');
Insert into Programming_Language VALUES(6, 'Kotlin');
Insert into Programming_Language VALUES(7, 'JavaScript');
Insert into Programming_Language VALUES(8, 'Swift');

###Contest###

INSERT INTO Contest(StartDate, EndDate, ContestDescription)  VALUES ("2021-09-15","2022-10-17", 'Smart Solutions');
 
INSERT INTO Contest(StartDate, EndDate, ContestDescription) VALUES ("2021-10-01", "2021-11-20", "Conquer Data Structures");
 
INSERT INTO Contest(StartDate, EndDate, ContestDescription) VALUES ("2021-12-10", "2021-12-20", "Fast coding challenge");
 
INSERT INTO Contest(StartDate, EndDate, ContestDescription) VALUES ("2021-12-10","2022-12-15", 'Capture the flag');




###Error Type###

Insert into Errors_type values(1, 'Runtime error');
Insert INTO Errors_type Values(2, 'Syntax error'); 
Insert into Errors_type Values(3, 'Logic error');
Insert into Errors_type VALUES(4, 'Compilation error');
Insert into Errors_type Values(5, 'Space Limit reached error');
Insert into Errors_type Values(6, 'Time Limit reached error');

###Ranks###

Insert into Ranks VALUES(1, 'Beginner Programmer');
Insert Into Ranks VALUES(2, 'Novice Programmer');
Insert Into Ranks VALUES(3, 'Junior Programmer');
Insert Into Ranks VALUES(4, 'Assistant Programmer');
Insert Into Ranks VALUES(5, 'Programmer');
Insert Into Ranks Values(6, 'Advanced Programmer');
Insert Into Ranks Values(7, 'Senior Programmer');

###Access Level###

insert into AccessLevel VALUES(1, 'Admin');
Insert Into AccessLevel VALUES(2, 'Creator'); 
Insert Into AccessLevel VALUEs(3, 'Manager');


###Person###

INSERT INTO person VALUES(1, '2000-01-02','Kevin','Kollcaku', 'kkollcaku20@epoka.edu.al','KingKevin','M',1);
INSERT INTO person VALUES(2, '2002-07-31', 'Joana', 'Jaupi', 'jjaupi20@epoka.edu.al', 'jjaupi20', 'F', 1);
INSERT INTO person VALUES(3, '2001-04-06', 'Jack', 'Sparrow', 'jackk@disney.com', 'captain21', 'M', '3');
INSERT INTO person VALUES(4, '2000-11-21', 'Rafaela', 'Gjoshe', 'rgjoshe20@epoka.edu.al', 'rgjoshe', 'F', 1);
INSERT INTO person VALUES(5, '1999-10-10', 'Bruno', 'Bajo', 'bbajo21@epoka.edu.al', 'b_bajo21', 'M', 1);
INSERT INTO person VALUES(6, '2002-01-21', 'Mirsada', 'Halili', 'mhalili21@epoka.edu.al', 'm.halili 21', 'F', 1);
INSERT INTO person VALUES(7, '1998-10-10', 'John', 'Doe', 'jdoe19@epoka.edu.al', 'jdoe', 'M', 1);
INSERT INTO person VALUES(8, '2000-07-06', 'Tomas', 'Wilson', 'TomeWilson@gmail.com', 'Tomas3', 'M', 1);
INSERT INTO person VALUES(9, '2001-04-06', 'Johnny', 'Depp', 'jdepp@disney.com', 'johny21', 'M', 3);
INSERT INTO person VALUES (10, '1999-07-13', 'Katerina', 'Grauber', 'kgrauber@gmail.com', 'kate1', 'F', 12);
INSERT INTO person VALUES (11, '1980-04-06', 'Amber', 'Heard', 'aHeard@gmail.com', 'Liar', 'F', 10); 
INSERT INTO person VALUES (12, '1979-01-31', 'James', 'Steward', 'jSt@yahoo.com', 'James', 'M', 20);
INSERT INTO person VALUES (13, '2001-04-06', 'Robert', 'Pattinson', 'rpat12@gmail.com', 'rPatt', 'M', 21);
INSERT INTO person VALUES (14, '2000-05-06', 'Michael', 'Smith', 'msmith@gmail.com', 'michael_1', 'M', 22);
INSERT INTO person VALUES (15, '2001-07-06', 'Mattew', 'Miller', 'mmiller@gmail.com', 'miller.m', 'M', 4);
INSERT INTO person VALUES (16, '2001-02-03', 'Chars', 'Thomas', 'cthomas1@gmail.com', 'chars.s', 'M', 5);
INSERT INTO person VALUES (17, '2001-01-01', 'Mary', 'Lee', 'leem12@gmail.com', 'lee_mary', 'F', 6);
INSERT INTO person VALUES (18, '2001-01-03', 'Linda', 'Harrison', 'lindah15@gmail.com', 'lindah1', 'F', 7);
INSERT INTO person VALUES (19, '1976-08-05', 'Susan', 'Smith', 'ssmith1976@gmail.com', 'susans.s', 'F', 8);
INSERT INTO person VALUES (20, '1999-10-11', 'Jessica', 'Jones', 'jjones@gmail.com', 'jessica.j', 'F', 8);
INSERT INTO person VALUES (21, '2000-11-12', 'Jessica', 'Taylor', 'taylorj@gmail.com', 'taylor.j', 'F', 8);
INSERT INTO person VALUES (22, '2006-11-22', 'Emily', 'Johnson', 'emilyj6@gmail.com', 'emily.12', 'F', 19);
INSERT INTO person VALUES (23, '1999-04-15', 'Melisa', 'White', 'melisaw@gmail.com', 'melisaw.9', 'F', 20);
INSERT INTO person VALUES (24, '2000-09-18', 'Melisa', 'Rodrigues', 'rmelisa@gmail.com', 'melissa_rodrigues', 'F', 1);
INSERT INTO person VALUES (25, '2002-03-03', 'Melisa', 'Harris', 'harrism1@gmail.com', 'harrismelisa_m', 'F', 1);
INSERT INTO person VALUES (26, '2001-04-20', 'Laura', 'Depp', 'ldepp8@gmail.com', 'laurad2', 'F', 4);
INSERT INTO person VALUES (27, '1998-06-13', 'Emma', 'Brown', 'emma1brown@gmail.com', 'emmaB.2', 'F', 4);
INSERT INTO person VALUES (28, '2003-05-27', 'Helen', 'Evans', 'hevans@gmail.com', 'helene', 'F', 1);
INSERT INTO person VALUES (29, '2002-01-15', 'Diane', 'Robinson', 'dianer9@gmail.com', 'diane.robinson', 'F', 10);
INSERT INTO person VALUES (30, '2001-03-11', 'Diane', 'Green', 'green7@gmail.com', 'green_diane', 'F', 12);
INSERT INTO person VALUES (31, '1999-07-03', 'Diane', 'Lewis', 'lewisd23@gmail.com', 'lewisd', 'F', 20); 
INSERT INTO person VALUES (32, '2003-02-18', 'Julie', 'Jackson', 'julie4j@gmail.com', 'juliej4', 'F', 20);
INSERT INTO person VALUES (33, '2001-02-14', 'Kyle', 'Clarke', 'kylec2@gmail.com', 'kylec15', 'F', 21);
INSERT INTO person VALUES (34, '1998-11-19', 'Robert', 'Wood', 'woodr0@gmail.com', 'robert.w', 'F', 12);
INSERT INTO person VALUES (35, '1999-09-25', 'John', 'Hughes', 'jhughes@gmail.com', 'johnh8', 'M', 5);
INSERT INTO person VALUES (36, '2001-10-18', 'Michael', 'Walker', 'walkerm21@gmail.com', 'walkermichael', 'F', 6);
INSERT INTO person VALUES (37, '2000-01-31', 'Robert', 'Depp', 'robertd31@gmail.com', 'roberto.d31', 'F', 5);

###Password###

INSERT INTO password VALUES("65CEAAB8D57F80D734E21814B0DEDB390CDE1C32063AFC88EA0298D4BA59F01E","VDgzzjkTdgAhZDcf",1);
INSERT INTO password VALUES("12574DA7B292DB615A09A765332B57AD1BCF96B4E440CF7E778C7C815E5E74AA","h4x72d5JFqfeeBAQ",2);
INSERT INTO Password Values("EDEAAFF3F1774AD2888673770C6D64097E391BC362D7D6FB34982DDF0EFD18CB", "96XsDVWsgAWG98l4", 3);
INSERT INTO Password Values("24D4B96F58DA6D4A8512313BBD02A28EBF0CA95DEC6E4C86EF78CE7F01E788AC", "10hV9jIxcVbM8eRm", 4);
INSERT INTO Password Values("66105AACE95F66D503EF310D64D512F6B2C9C4B55525430B0885DAB8DA31F5C0", "NvI51vNFodZHe7tq", 5);
INSERT INTO Password Values("DF17D6D87D8ED3695FD9F77970E8E3657F649E439611D0E12B044BDFD255181A", "d2Udm0JdqeAvJU1x", 6);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "Jn7hrC0zarfSjYi1", 7);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "W2vvMSGREUDQmHt5", 8);
INSERT INTO Password Values("3C6EFB268BDE2923E4F7CBC086995F6158A606E66DF45E307829E6B28F7AAF0E", "32SHxWPOhu7V5F62", 9);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "PJuMeU8Kg4m8wN07", 10);
INSERT INTO Password Values("B3AD1249849EF065FFBA04CDC47100FDC6D11A0F9C92E932B7BAFF832ED95B52", "UoutKXuVrnf1B7q0", 11);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "cBzBmvtJYkxEreKZ", 12);
INSERT INTO Password Values("6343697FA9E855C124BF78BF61447036CE31E847745EEE1C5F4895839C426729", "fU1L87vGyTag06hW", 13);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "uTOm7CUOPCf3xaZa", 14);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "wFXoSqH2HqPMjrPy", 15);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "EROWN2cUaprmBtWj", 16);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "DWCN9s4FnaKqPca2", 17);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "bzjjXQ72HuRWt7PC", 18);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "QU3n21ZZ3wGsILcN", 19);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "BqYzlZ9gqeqxHS29", 20);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "iuygF30lNCmuBa3W", 21);
INSERT INTO Password Values("98FA4D59C08E5E3B611DA495C95FCD6473E3AB4D10314BDF3B084CF194DD41C3", "ZzPpyi5FJ9blEIeF", 22);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "1sU9WcBXltgMlFLt", 23);
INSERT INTO Password Values("BA26BB4AC5186376AACB07B162F514D0F1328E74E96FA67BB7EACE78F6E93061", "GLOsJrwh6QLkjaUb", 24);
INSERT INTO Password Values("F780F44E320A7ACF220274B7E5CFEDA21CEB043E31C4792C79F2FBA8A74E5FB8", "jYNTEa34RCTzOL8m", 25);
INSERT INTO Password Values("78DA4A596A88BC5114F071BA590793BF3B37329D761230F33129983A747F414E", "2bHcvFPEqYdUn5xh", 26);
INSERT INTO Password Values("F66CC33674EB9C7E13C5026866125BD0E734545479D197873C1A3EB40B43CF08", "sWUJCohru48himLl", 27);
INSERT INTO Password Values("046DBA443BF39DC2AB25A6BE2A224D20D7289A41BF192195B72B6E4D28558BB4", "ZmcisUD9HLpUi94d", 28);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "w5jcHHrjFQETjo4n", 29);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "DQ0incMj2ESV8O7n", 30);
INSERT INTO Password Values("5893E2EE9405A8118D09DC0841603FC12F75E2570CB49040947F38C77445BAB9", "uXAJUwskNgH0hlIn", 31);
INSERT INTO Password Values("6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B", "A5MOg83UjTbpBr6x", 32);

INSERT INTO Password Values("A7A996AC41C140C08CAE10543AB58F06124BFB966267852D4A7167530C3B31A2", "C2uOSKcIStXNEOrO", 33);
INSERT INTO Password Values("5A9E67380ADF22A6D0766B17FD607C4BE780A50333AEBEB2471538B464148E90", "MWAR8lLUpi7dwWfL", 34);
INSERT INTO Password Values("5FBF4735B690DCC73405392859EF01E9CF94405C2545F20FB270FD01A6A152C7", "0I96oPIYzOR6l1c5", 35);
INSERT INTO Password Values("5FBF4735B690DCC73405392859EF01E9CF94405C2545F20FB270FD01A6A152C7", "ziBJwCExspkFfzvr", 36);
INSERT INTO Password Values("5FBF4735B690DCC73405392859EF01E9CF94405C2545F20FB270FD01A6A152C7", "LqsPcXUUHo1jDk7F", 37);




###User###

INSERT INTO user VALUES("2021-08-04", 11, 7);
INSERT INTO user VALUES("2021-01-07", 12, 1);
INSERT INTO user VALUES("2021-02-05", 13, 2);
INSERT INTO user VALUES("2021-03-07", 14, 7);
INSERT INTO user VALUES("2021-08-18", 15, 2);
INSERT INTO user VALUES("2021-04-05", 16, 3);
INSERT INTO user VALUES("2021-12-18", 17, 5);
INSERT INTO user VALUES("2021-05-11", 18, 2);
INSERT INTO user VALUES("2021-01-03", 19, 4);
INSERT INTO user VALUES("2021-12-13", 20, 5);
INSERT INTO user VALUES("2021-01-04", 21, 7);
INSERT INTO user VALUES("2021-06-10", 22, 6);
INSERT INTO user VALUES("2021-05-03", 23, 3);
INSERT INTO user VALUES("2021-12-12", 24, 5);
INSERT INTO user VALUES("2021-10-16", 25, 1);
INSERT INTO user VALUES("2021-12-16", 26, 3);
INSERT INTO user VALUES("2021-03-13", 27, 4);
INSERT INTO user VALUES("2021-12-12", 28, 2);
INSERT INTO user VALUES("2021-09-15", 29, 2);
INSERT INTO user VALUES("2021-04-05", 30, 4);
INSERT INTO user VALUES("2021-11-18", 31, 6);
INSERT INTO user VALUES("2021-02-19", 32, 2);
INSERT INTO user VALUES("2021-11-19", 33, 6);
INSERT INTO user VALUES("2021-11-15", 34, 6);
INSERT INTO user VALUES("2021-10-20", 35, 1);
INSERT INTO user VALUES("2021-07-01", 36, 5);
INSERT INTO user VALUES("2021-01-06", 37, 5);		

###Staff###

INSERT INTO Staff VALUES('EPOKA', 1, 1);
INSERT INTO Staff VALUES('EPOKA', 2, 1);
INSERT INTO Staff VALUES('EPOKA', 3, 1);
INSERT INTO Staff VALUES('EPOKA', 4, 1);
INSERT INTO Staff VALUES('EPOKA', 5, 2);
INSERT INTO Staff VALUES('EPOKA', 6, 2);
INSERT INTO Staff VALUES('EPOKA', 7, 2);
INSERT INTO Staff VALUES("EPOKA", 8, 3);
INSERT INTO Staff VALUES('EPOKA', 9, 3);
INSERT INTO Staff VALUES('EPOKA', 10, 3);




###Participates in###

INSERT INTO participatesIn VALUES (1,11,'2021-09-22');
INSERT INTO participatesIn VALUES(1, 13, "2021-10-02");
INSERT INTO participatesIn VALUES (1, 17,'2021-09-30');
INSERT INTO participatesIn VALUES (1, 22,'2021-10-02');
 
INSERT INTO participatesIn VALUES(2, 14, "2021-10-03");
INSERT INTO participatesIn VALUES(2, 11, "2021-11-10");
INSERT INTO participatesIn VALUES(2, 17, "2021-10-20");
 
INSERT INTO participatesIn VALUES(3, 19, "2021-12-10");
INSERT INTO participatesIn VALUES(3, 20, "2021-12-11");
INSERT INTO participatesIn VALUES(3, 11, "2021-12-15");
INSERT INTO participatesIn VALUES(3, 17, "2021-12-10");
 
INSERT INTO participatesIn VALUES(4, 19, "2021-12-10");
INSERT INTO participatesIn VALUES(4, 11, "2021-12-10");
INSERT INTO participatesIn VALUES(4, 30, "2021-12-11");
INSERT INTO participatesIn VALUES(4, 24, "2021-12-12");


###Question###
 
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Biggest Value ", "FInd biggest value in the list of integers", "2020-10-07", 1, 2, 10);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Ascending Order", "Order the given list in ascending order", "2022-01-07", 1, 8, 30);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Hot Potato ", "Hot potato question ", "2021-12-12", 2, 2, 20);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Capture the flag", "Capture the flag", "2021-04-20", 3, 8, 30);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Traverse", "Traverse Binary Tree", "2020-07-01", 2, 8, 40);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Median of Two Sorted Arrays", "Find the Median of Two Sorted Arrays", "2020-04-18", 2, 8, 70);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("REGEX", "Regular Expression Matching", "2020-03-18", 3, 1, 24);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Remove a node", "Remove Nth Node From End of List", "2020-11-21", 4, 2, 36);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Parenthesis", "Generate Parentheses", "2020-07-13", 3, 3, 100);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Merge Sorted", "Merge k Sorted Lists", "2020-12-21", 4, 4, 41);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Division", "Divide Two Integers", "2020-07-01", 1, 1, 62);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Searching", "Search in Rotated Sorted Array", "2020-04-17", 3, 8, 18);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Palindromic Substring" , "Find the Longest Palindromic Substring", "2020-08-02", 1, 8, 49);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Addition", "Add Two Numbers", "2020-07-02", 1, 3, 150);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Conversion from Roman", "Convert roman to Integer", "2020-06-01", 1, 4, 69);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Post-Fix", "Read a post fix expression and find the result.", "2020-09-04", 3, 8, 33);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Donors", "Show the list of the top N donors.", "2020-07-01", 3, 1, 40);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Balanced parentheses", "Check if the parenthesis in an expression is balanced or not", "2020-04-12", 4, 1, 20);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Ticket Time", "Calculate the min. total time for all the people to buy tickets", "2020-01-29", 3, 2, 48);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Most Sold Items", "Read the stock information and, show the most sold top m items.", "2020-07-30", 2, 8, 62);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Sum of Leaf Nodes", "Calculate the sum of the leaf node values of a BST", "2020-08-01", 4, 3, 31);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Weighted average", "Calculate the weighted average of the grades", "2020-07-22", 1, 5, 74);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("N letter", "Print out a big N letter made of N characters", "2020-11-11", 1, 5, 103);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Remove Duplicates" , "Remove Duplicates from Sorted Array", "2020-04-07", 2, 5, 59);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Decimal form of numbers","Convert the given number in decimal form", "2020-12-15", 1, 5, 41);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES (" Numbers from m to n","Write a program that shows the numbers from m to n with the steps k", "2020-07-05", 3, 1, 60);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Summator" ,"Calculate sum of the numbers from a to b with the steps of k.", "2020-03-01", 2, 8, 150);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Show odd numbers between n and m.","giving the range form 4 to 100, print all the odd number.", "2020-07-01", 3, 4, 91);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Area finder", "Given the dimensions, find the sum of areas", "2020-01-02", 2, 8, 70);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Divisible numbers", "Show numbers divisible from 1 to N.", "2020-02-016", 1, 8, 23);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Square drawer", "Draw a square with size N with stars (*).", "2020-07-11", 1, 7, 16);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Calculate the mass of a molecule", "Given the number of protons, electrons and neutrons and also their respective mass calculate the mass of the atom", "2020-03-11", 2, 7, 40);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Profit evaluation","Choose the most profitable share according to equity values", "2020-08-09", 4, 6, 20);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("AVL tree","Write the methods for AVL tree rotation", "2020-05-01", 4, 6, 30);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Payed amount of a product.","Read nr of passengers and price. Show the amount payed total", "2020-02-22", 2, 3, 36);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Calculator","Create a caluclator program. Given N operations output their result.", "2020-07-17", 4, 6, 34);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Pythagorean triplets","Show the number of pythagorean triplets up to N.", "2020-02-14", 4, 9, 42);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("highest and lowest salary", "Show the employees who have received the highest and lowest salaries", "2020-07-17", 3, 9, 60);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("nth digit", "Show nth digit of a given number.", "2020-04-29", 3, 10, 24);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("space occupied", "Show the total space occupied.", "2020-01-12", 2, 10, 50);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Euclidean Distance", "Show the max euclidean distance between 2 islands.", "2020-09-27", 4, 6, 19);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Divisible by 11", "Show if given num is divisible by 11 checking sum of digits", "2020-11-07", 2, 10, 30);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("comet stay/go", "Determine if the comet should stay or go", "2020-01-27", 4, 7, 29);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("0s Border", "Create a border with 0s around a matrix.", "2020-12-25", 2, 9, 20);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Multiplier", "Multiply a number with 1-10. Show counter of num with all digits different", "2020-06-01", 3, 8, 36);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("bitonic sequence", "Compute the length of the longest bitonic sequence.", "2020-05-30", 4, 5, 50);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Encryption ","Encrypt a password entered by a user", "2020-07-01", 4, 6, 50);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Pizzashop", "Calculate the daily balance for a pizza shop", "2020-10-10", 1, 9, 40);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Decryption", "Decrypt the given text.", "2020-10-21", 4, 10, 48);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Pascal triangle", "Show n-th row, r-th element of pascal triangle", "2020-07-01", 2, 6, 46);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Number of floors", "Calculate the total number of floors that the elevator has traveled", "2020-07-01", 3, 8, 13);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Numbers with closest difference ", "Print the two numbers whose difference is the closest", "2020-07-01", 1, 5, 62);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("KMap letter finder", "Find which letter A,B,C or D is different in Modified Karnaugh-Map", "2020-07-01", 4, 7, 32);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Wait time for a client", "Calculate the waiting time for a new client", "2020-07-01", 1, 7, 28);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("From Dec to Binary", "Convert the number into binary form", "2020-07-01", 3, 9, 24);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Inner Product", "Find the inner product of the given sequence", "2020-07-01", 4, 4, 16);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Word Location", "Given a grid of letters, find the location of the words", "2020-07-01", 4, 2, 29);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Censor 4 letter word", "Censor all the 4-letter words", "2020-07-01", 2, 1, 61);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Find the sum of k-th diagonal","Given a matrix. Find the sum of the k-th diagonal", "2020-07-09", 2, 1, 45);
INSERT INTO Question(QuestionTitle, QuestionDescription, DateOfQuestionWritten, LevelD, personID, Number_of_views) VALUES ("Parallel Line", "Show the number of parallel line segments ", "2020-08-09", 4, 7, 11);
 



###TestCase###

INSERT INTO Test_case(case_input,case_output,questionID) VALUES("90","70",1);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("64","48",1);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("68","38",2);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("22","27",2);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("29","8",2);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("53","44",3);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("79","90",3);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("77","56",3);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("21","95",4);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("52","47",4);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("23","89",4);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("55","7",5);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("66","42",5);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("26","96",5);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("37","77",6);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("57","17",6);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("53","78",6);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("5","87",7);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("63","63",7);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("42","73",7);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("23","89",8);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("36","42",8);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("85","30",8);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("65","76",9);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("20","27",9);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("14","89",9);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("61","53",10);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("100","81",10);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("32","79",10);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("69","92",11);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("52","79",11);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("7","87",11);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("54","68",12);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("20","23",12);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("12","99",12);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("36","22",13);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("37","87",13);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("69","31",13);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("87","30",14);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("64","5",14);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("98","44",14);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("39","95",15);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("66","97",15);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("21","46",15);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("40","84",16);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("40","67",16);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("30","99",16);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("44","89",17);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("30","96",17);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("44","66",17);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("31","40",18);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("70","81",18);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("18","18",18);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("7","53",19);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("19","83",19);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("55","57",19);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("59","71",20);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("28","26",20);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("25","42",20);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("95","77",21);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("41","88",21);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("94","12",21);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("39","71",22);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("50","41",22);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("88","96",22);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("8","95",23);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("10","23",23);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("11","45",23);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("53","8",24);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("78","82",24);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("39","61",24);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("19","10",25);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("30","76",25);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("11","58",25);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("97","36",26);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("28","41",26);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("48","88",26);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("22","41",27);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("48","65",27);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("14","37",27);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("50","72",28);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("9","33",28);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("26","68",28);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("33","43",29);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("16","59",29);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("91","76",29);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("84","82",30);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("57","94",30);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("25","79",30);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("28","15",31);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("77","7",31);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("36","62",31);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("78","11",32);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("10","72",32);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("73","81",32);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("66","5",33);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("88","20",33);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("8","67",33);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("15","29",34);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("77","53",34);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("12","23",34);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("11","53",35);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("28","36",35);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("54","93",35);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("5","89",36);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("37","69",36);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("37","14",36);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("46","54",37);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("31","89",37);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("74","7",37);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("57","73",38);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("59","58",38);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("24","69",38);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("43","13",39);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("42","47",39);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("24","29",39);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("75","83",40);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("82","92",40);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("51","91",40);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("48","88",41);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("65","58",41);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("46","38",41);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("38","41",42);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("57","43",42);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("76","9",42);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("95","38",43);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("64","76",43);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("44","8",43);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("11","66",44);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("75","66",44);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("23","68",44);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("68","38",45);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("81","14",45);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("100","76",45);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("84","74",46);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("32","84",46);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("62","64",46);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("62","34",47);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("48","99",47);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("57","37",47);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("93","6",48);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("68","13",48);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("17","89",48);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("86","59",49);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("78","55",49);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("60","20",49);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("37","60",50);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("69","49",50);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("68","95",50);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("66","26",51);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("27","30",51);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("83","37",51);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("43","24",52);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("78","95",52);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("82","75",52);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("54","14",53);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("6","61",53);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("95","76",53);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("30","59",54);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("20","78",54);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("90","5",54);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("31","67",55);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("6","59",55);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("76","27",55);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("9","30",56);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("86","85",56);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("13","31",56);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("23","6",57);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("19","20",57);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("77","20",57);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("81","75",58);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("34","28",58);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("49","81",58);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("5","79",59);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("6","95",59);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("86","46",59);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("8","49",60);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("23","63",60);
INSERT INTO Test_case(case_input,case_output,questionID) VALUES("54","46",60);



###Comment### te gjithe commentet duhet te jete mbii 10 

INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-10",0,0,1,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-19",0,3,1,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-2",9,5,1,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-24",6,4,1,28);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-1",2,1,2,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-10",4,5,2,33);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-9",6,2,2,12);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-26",7,1,2,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-26",9,0,3,15);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-7",3,3,3,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-11",11,2,3,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-12",10,4,4,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-5",10,0,4,11);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-27",7,5,4,26);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-1",13,2,4,37);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-21",11,2,4,37);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-11",3,5,5,33);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-4",1,4,5,26);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-20",7,5,5,28);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-1",2,3,5,34);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-6",11,5,6,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-5",13,1,7,27);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-1",4,3,7,37);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-14",7,1,7,27);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-18",14,5,8,21);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-17",3,1,8,35);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-6",3,2,8,11);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-5",12,0,8,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-14",7,1,9,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-28",7,0,10,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-5",13,0,11,34);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-27",10,2,11,29);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-1",10,3,11,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-20",12,5,12,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-16",13,5,12,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-14",0,4,12,13);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-22",11,0,12,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-26",13,2,13,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-28",11,3,13,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-12",0,2,13,32);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-28",3,1,13,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-6",6,1,13,13);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-14",8,2,13,32);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-8",14,4,14,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-27",11,2,14,21);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-2",7,2,14,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-23",14,3,14,29);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-12",2,5,14,24);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-23",1,5,15,12);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-28",0,1,16,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-28",2,0,16,13);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-20",1,4,16,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-5",10,5,16,20);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-15",13,0,17,33);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-15",3,5,18,11);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-22",4,4,18,28);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-22",5,5,18,37);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-4",1,4,18,20);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-14",10,5,18,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-17",8,5,18,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-5",13,1,19,35);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-18",9,2,19,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-2",4,1,19,37);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-6",8,0,20,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-12",9,2,20,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-23",2,3,20,12);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-1",13,0,20,24);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-26",3,3,20,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-11",14,1,21,16);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-3",1,1,21,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-2",6,4,21,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-21",9,2,22,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-20",11,1,23,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-19",5,5,23,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-7",13,3,24,13);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-20",8,1,24,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-10",3,0,25,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-13",1,2,25,26);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-24",13,2,25,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-18",0,1,25,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-27",14,1,25,35);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-27",11,5,25,26);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-16",9,1,26,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-1",1,5,27,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-24",6,4,28,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-3",0,2,28,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-25",13,0,28,37);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-21",8,0,28,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-7",13,3,28,21);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-15",9,5,28,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-7",7,0,29,28);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-13",5,5,29,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-3",12,1,29,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-20",4,2,29,35);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-18",11,3,30,11);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-18",5,0,31,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-10",8,2,31,16);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-7",1,4,31,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-8",2,1,31,26);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-18",13,0,31,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-21",7,0,31,34);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-22",1,3,32,26);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-16",12,0,32,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-25",10,5,32,26);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-15",12,2,32,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-14",13,4,32,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-13",0,1,33,33);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-10",10,3,33,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-16",12,5,33,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-8",0,2,34,21);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-4",10,0,34,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-7",8,4,34,12);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-18",10,4,35,33);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-4",6,0,35,32);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-3",6,3,35,34);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-13",14,1,35,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-10",9,2,35,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-6",9,3,35,34);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-10",11,4,36,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-8",14,4,36,14);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-9",8,4,36,28);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-17",6,5,36,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-26",6,2,36,14);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-19",8,1,36,33);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-19",1,0,37,34);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-13",2,4,37,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-3",0,3,37,28);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-6",8,4,37,24);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-11",11,0,37,14);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-19",8,3,37,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-9",4,0,38,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-24",3,4,38,12);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-16",13,5,38,35);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-9",11,2,38,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-15",1,2,39,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-23",8,3,39,20);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-27",8,3,40,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-14",11,5,40,32);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-18",14,4,40,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-26",6,0,40,35);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-9",7,2,40,16);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-2",12,0,41,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-10",14,0,41,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-23",3,3,42,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-1",0,1,42,20);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-20",10,3,42,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-6",12,2,42,20);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-21",9,0,42,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-21",14,4,42,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-5",0,0,43,12);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-19",8,0,43,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-23",3,4,43,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-22",3,2,44,34);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-18",4,4,44,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-26",14,4,44,27);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-1",10,5,44,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-1",10,0,45,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-26",10,0,45,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-3",5,2,45,11);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-4",1,3,45,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-10",4,2,45,27);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-5",8,3,45,11);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-16",9,1,46,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-2",4,1,47,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-11",7,2,47,15);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-16",9,3,47,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-26",14,5,47,27);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-24",1,0,47,37);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-21",9,3,47,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-5-23",2,4,48,16);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-2",2,4,49,20);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-6",14,1,50,17);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-2",2,5,50,14);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-23",9,0,50,36);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-9",4,3,50,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-5",14,5,50,34);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-11-2",14,5,50,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-13",9,3,51,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-1",8,4,51,13);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-11",10,0,52,26);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-6",14,1,52,19);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-14",14,4,52,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-28",1,4,53,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-14",10,4,53,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-8",9,4,53,32);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-7",1,3,54,14);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-15",11,4,54,16);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-11",8,4,54,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-5",14,1,54,11);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-4-17",14,3,55,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-16",1,2,55,23);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-10-19",8,5,55,31);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-1",10,2,55,29);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-2",6,1,56,18);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-11",6,3,56,34);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-25",1,3,56,25);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-27",2,2,57,35);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-23",0,0,57,33);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-23",4,0,57,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-21",2,1,58,11);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-12-10",13,1,58,24);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-26",5,0,59,15);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-14",1,1,59,16);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-2-19",6,0,59,14);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-15",10,3,59,14);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-9-16",4,3,59,28);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-6-7",13,4,60,30);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-3-10",11,1,60,28);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-1-24",4,0,60,22);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-8-9",5,4,60,16);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-5",5,5,60,13);
INSERT INTO Comment(Comment_Text,DateOfComment,Up_Vote,Down_Vote,questionID,personID) VALUES( "COMMENT_TEXT","2022-7-27",11,0,60,12);



###Belongs to###

INSERT INTO belongsTo VALUES(1, 1);
INSERT INTO belongsTo VALUES(2, 2);
INSERT INTO belongsTo VALUES(3, 3);
INSERT INTO belongsTo VALUES(4, 1);
INSERT INTO belongsTo VALUES(5, 2);
INSERT INTO belongsTo VALUES(6, 3);
INSERT INTO belongsTo VALUES(7, 5);
INSERT INTO belongsTo VALUES(8, 4);
INSERT INTO belongsTo VALUES(9, 4);
INSERT INTO belongsTo VALUES(10, 5);
INSERT INTO belongsTo VALUES(11, 4);
INSERT INTO belongsTo VALUES(12, 5);
INSERT INTO belongsTo VALUES(13, 6);
INSERT INTO belongsTo VALUES(14, 6);
INSERT INTO belongsTo VALUES(15, 7);
INSERT INTO belongsTo VALUES(16, 3);
INSERT INTO belongsTo VALUES(17, 7);
INSERT INTO belongsTo VALUES(18, 8);
INSERT INTO belongsTo VALUES(19, 8);
INSERT INTO belongsTo VALUES(20, 5);
INSERT INTO belongsTo VALUES(21, 8);
INSERT INTO belongsTo VALUES(22, 9);
INSERT INTO belongsTo VALUES(23, 9);
INSERT INTO belongsTo VALUES(24, 9);
INSERT INTO belongsTo VALUES(25, 6);
INSERT INTO belongsTo VALUES(26, 5);
INSERT INTO belongsTo VALUES(27, 4);
INSERT INTO belongsTo VALUES(28, 4);
INSERT INTO belongsTo VALUES(29, 4);
INSERT INTO belongsTo VALUES(30, 5);
INSERT INTO belongsTo VALUES(31, 6);
INSERT INTO belongsTo VALUES(32, 5);
INSERT INTO belongsTo VALUES(33, 1);
INSERT INTO belongsTo VALUES(34, 2);
INSERT INTO belongsTo VALUES(35, 2);
INSERT INTO belongsTo VALUES(36, 2);
INSERT INTO belongsTo VALUES(37, 3);
INSERT INTO belongsTo VALUES(38, 7);
INSERT INTO belongsTo VALUES(39, 8);
INSERT INTO belongsTo VALUES(40, 9);
INSERT INTO belongsTo VALUES(41, 3);
INSERT INTO belongsTo VALUES(42, 4);
INSERT INTO belongsTo VALUES(43, 4);
INSERT INTO belongsTo VALUES(44, 3);
INSERT INTO belongsTo VALUES(45, 3);
INSERT INTO belongsTo VALUES(46, 2);
INSERT INTO belongsTo VALUES(47, 1);
INSERT INTO belongsTo VALUES(48, 2);
INSERT INTO belongsTo VALUES(49, 1);
INSERT INTO belongsTo VALUES(50, 5);
INSERT INTO belongsTo VALUES(51, 6);
INSERT INTO belongsTo VALUES(52, 7);
INSERT INTO belongsTo VALUES(53, 8);
INSERT INTO belongsTo VALUES(54, 8);
INSERT INTO belongsTo VALUES(55, 6);
INSERT INTO belongsTo VALUES(56, 4);
INSERT INTO belongsTo VALUES(57, 4);
INSERT INTO belongsTo VALUES(58, 4);
INSERT INTO belongsTo VALUES(59, 3);
INSERT INTO belongsTo VALUES(60, 2);



###Is Of###

INSERT INTO isOf VALUES(7,1);
INSERT INTO isOf VALUES(5,1);
INSERT INTO isOf VALUES(5,2);
INSERT INTO isOf VALUES(6,2);
INSERT INTO isOf VALUES(7,3);
INSERT INTO isOf VALUES(6,3);
INSERT INTO isOf VALUES(8,4);
INSERT INTO isOf VALUES(7,4);
INSERT INTO isOf VALUES(8,5);
INSERT INTO isOf VALUES(4,5);
INSERT INTO isOf VALUES(5,6);
INSERT INTO isOf VALUES(4,6);
INSERT INTO isOf VALUES(5,7);
INSERT INTO isOf VALUES(3,7);
INSERT INTO isOf VALUES(3,8);
INSERT INTO isOf VALUES(8,8);
INSERT INTO isOf VALUES(8,9);
INSERT INTO isOf VALUES(4,9);
INSERT INTO isOf VALUES(5,10);
INSERT INTO isOf VALUES(6,10);
INSERT INTO isOf VALUES(3,11);
INSERT INTO isOf VALUES(8,11);
INSERT INTO isOf VALUES(5,12);
INSERT INTO isOf VALUES(4,12);
INSERT INTO isOf VALUES(6,13);
INSERT INTO isOf VALUES(3,13);
INSERT INTO isOf VALUES(5,14);
INSERT INTO isOf VALUES(7,14);
INSERT INTO isOf VALUES(1,15);
INSERT INTO isOf VALUES(7,15);
INSERT INTO isOf VALUES(4,16);
INSERT INTO isOf VALUES(8,16);
INSERT INTO isOf VALUES(1,17);
INSERT INTO isOf VALUES(3,17);
INSERT INTO isOf VALUES(8,18);
INSERT INTO isOf VALUES(4,18);
INSERT INTO isOf VALUES(1,19);
INSERT INTO isOf VALUES(3,19);
INSERT INTO isOf VALUES(7,20);
INSERT INTO isOf VALUES(5,20);
INSERT INTO isOf VALUES(2,21);
INSERT INTO isOf VALUES(1,21);
INSERT INTO isOf VALUES(2,22);
INSERT INTO isOf VALUES(4,22);
INSERT INTO isOf VALUES(6,23);
INSERT INTO isOf VALUES(5,23);
INSERT INTO isOf VALUES(1,24);
INSERT INTO isOf VALUES(5,24);
INSERT INTO isOf VALUES(6,25);
INSERT INTO isOf VALUES(4,25);
INSERT INTO isOf VALUES(4,26);
INSERT INTO isOf VALUES(6,26);
INSERT INTO isOf VALUES(4,27);
INSERT INTO isOf VALUES(7,27);
INSERT INTO isOf VALUES(8,28);
INSERT INTO isOf VALUES(7,28);
INSERT INTO isOf VALUES(2,29);
INSERT INTO isOf VALUES(4,29);
INSERT INTO isOf VALUES(8,30);
INSERT INTO isOf VALUES(3,30);
INSERT INTO isOf VALUES(2,31);
INSERT INTO isOf VALUES(6,31);
INSERT INTO isOf VALUES(3,32);
INSERT INTO isOf VALUES(1,32);
INSERT INTO isOf VALUES(2,33);
INSERT INTO isOf VALUES(8,33);
INSERT INTO isOf VALUES(3,34);
INSERT INTO isOf VALUES(1,34);
INSERT INTO isOf VALUES(6,35);
INSERT INTO isOf VALUES(1,35);
INSERT INTO isOf VALUES(3,36);
INSERT INTO isOf VALUES(2,36);
INSERT INTO isOf VALUES(3,37);
INSERT INTO isOf VALUES(8,37);
INSERT INTO isOf VALUES(1,38);
INSERT INTO isOf VALUES(8,38);
INSERT INTO isOf VALUES(2,39);
INSERT INTO isOf VALUES(4,39);
INSERT INTO isOf VALUES(2,40);
INSERT INTO isOf VALUES(8,40);
INSERT INTO isOf VALUES(6,41);
INSERT INTO isOf VALUES(3,41);
INSERT INTO isOf VALUES(5,42);
INSERT INTO isOf VALUES(2,42);
INSERT INTO isOf VALUES(6,43);
INSERT INTO isOf VALUES(7,43);
INSERT INTO isOf VALUES(1,44);
INSERT INTO isOf VALUES(5,44);
INSERT INTO isOf VALUES(3,45);
INSERT INTO isOf VALUES(6,45);
INSERT INTO isOf VALUES(2,46);
INSERT INTO isOf VALUES(1,46);
INSERT INTO isOf VALUES(1,47);
INSERT INTO isOf VALUES(8,47);
INSERT INTO isOf VALUES(5,48);
INSERT INTO isOf VALUES(4,48);
INSERT INTO isOf VALUES(3,49);
INSERT INTO isOf VALUES(2,49);
INSERT INTO isOf VALUES(7,50);
INSERT INTO isOf VALUES(5,50);
INSERT INTO isOf VALUES(8,51);
INSERT INTO isOf VALUES(6,51);
INSERT INTO isOf VALUES(3,52);
INSERT INTO isOf VALUES(6,52);
INSERT INTO isOf VALUES(6,53);
INSERT INTO isOf VALUES(3,53);
INSERT INTO isOf VALUES(3,54);
INSERT INTO isOf VALUES(6,54);
INSERT INTO isOf VALUES(7,55);
INSERT INTO isOf VALUES(3,55);
INSERT INTO isOf VALUES(1,56);
INSERT INTO isOf VALUES(5,56);
INSERT INTO isOf VALUES(5,57);
INSERT INTO isOf VALUES(2,57);
INSERT INTO isOf VALUES(7,58);
INSERT INTO isOf VALUES(4,58);
INSERT INTO isOf VALUES(8,59);
INSERT INTO isOf VALUES(3,59);
INSERT INTO isOf VALUES(5,59);
INSERT INTO isOf VALUES(7,60);
INSERT INTO isOf VALUES(2,60);

###Contains###

INSERT INTO Contains VALUES(1,1);
INSERT INTO Contains VALUES(4,1);
INSERT INTO Contains VALUES(9,1);
INSERT INTO Contains VALUES(11,1);
INSERT INTO Contains VALUES(15,1);
INSERT INTO Contains VALUES(17,1);
INSERT INTO Contains VALUES(21,1);
INSERT INTO Contains VALUES(24,1);
INSERT INTO Contains VALUES(37,1);
INSERT INTO Contains VALUES(40,1);
INSERT INTO Contains VALUES(42,1);
INSERT INTO Contains VALUES(43,1);
INSERT INTO Contains VALUES(47,1);
INSERT INTO Contains VALUES(49,1);
INSERT INTO Contains VALUES(59,1);
INSERT INTO Contains VALUES(4,2);
INSERT INTO Contains VALUES(7,2);
INSERT INTO Contains VALUES(8,2);
INSERT INTO Contains VALUES(9,2);
INSERT INTO Contains VALUES(11,2);
INSERT INTO Contains VALUES(17,2);
INSERT INTO Contains VALUES(20,2);
INSERT INTO Contains VALUES(21,2);
INSERT INTO Contains VALUES(22,2);
INSERT INTO Contains VALUES(30,2);
INSERT INTO Contains VALUES(31,2);
INSERT INTO Contains VALUES(34,2);
INSERT INTO Contains VALUES(49,2);
INSERT INTO Contains VALUES(51,2);
INSERT INTO Contains VALUES(58,2);
INSERT INTO Contains VALUES(7,3);
INSERT INTO Contains VALUES(8,3);
INSERT INTO Contains VALUES(10,3);
INSERT INTO Contains VALUES(13,3);
INSERT INTO Contains VALUES(18,3);
INSERT INTO Contains VALUES(19,3);
INSERT INTO Contains VALUES(21,3);
INSERT INTO Contains VALUES(27,3);
INSERT INTO Contains VALUES(29,3);
INSERT INTO Contains VALUES(34,3);
INSERT INTO Contains VALUES(45,3);
INSERT INTO Contains VALUES(48,3);
INSERT INTO Contains VALUES(51,3);
INSERT INTO Contains VALUES(53,3);
INSERT INTO Contains VALUES(58,3);
INSERT INTO Contains VALUES(2,4);
INSERT INTO Contains VALUES(7,4);
INSERT INTO Contains VALUES(9,4);
INSERT INTO Contains VALUES(11,4);
INSERT INTO Contains VALUES(15,4);
INSERT INTO Contains VALUES(29,4);
INSERT INTO Contains VALUES(32,4);
INSERT INTO Contains VALUES(38,4);
INSERT INTO Contains VALUES(39,4);
INSERT INTO Contains VALUES(40,4);
INSERT INTO Contains VALUES(43,4);
INSERT INTO Contains VALUES(44,4);
INSERT INTO Contains VALUES(49,4);
INSERT INTO Contains VALUES(55,4);
INSERT INTO Contains VALUES(59,4);

###Submissions###

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-4","USER_RESPONSE",0,8,3,18,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-8-22","USER_RESPONSE",1,30,NULL,32,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-8-12","USER_RESPONSE",0,20,1,29,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-18","USER_RESPONSE",1,58,NULL,32,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-17","USER_RESPONSE",1,6,NULL,36,7);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-4","USER_RESPONSE",0,7,2,15,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-16","USER_RESPONSE",0,47,2,30,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-8-19","USER_RESPONSE",1,11,NULL,24,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-18","USER_RESPONSE",1,34,NULL,35,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-14","USER_RESPONSE",0,25,3,37,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-15","USER_RESPONSE",1,22,NULL,16,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-3","USER_RESPONSE",1,36,NULL,21,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-5","USER_RESPONSE",1,51,NULL,25,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-19","USER_RESPONSE",1,3,NULL,12,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-9-27","USER_RESPONSE",1,17,NULL,26,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-11","USER_RESPONSE",0,1,1,28,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-23","USER_RESPONSE",0,47,1,11,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-8-15","USER_RESPONSE",0,19,2,24,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-17","USER_RESPONSE",1,20,NULL,29,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-22","USER_RESPONSE",0,57,4,36,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-27","USER_RESPONSE",0,44,5,14,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-18","USER_RESPONSE",0,15,3,21,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-10-23","USER_RESPONSE",1,25,NULL,12,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-15","USER_RESPONSE",1,10,NULL,25,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-2","USER_RESPONSE",1,39,NULL,22,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-5","USER_RESPONSE",1,38,NULL,21,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-4","USER_RESPONSE",0,56,5,35,7);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-5","USER_RESPONSE",0,12,6,37,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-27","USER_RESPONSE",1,31,NULL,22,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-2","USER_RESPONSE",0,50,4,16,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-9-10","USER_RESPONSE",0,5,3,35,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-9-2","USER_RESPONSE",0,4,1,27,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-22","USER_RESPONSE",1,38,NULL,25,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-16","USER_RESPONSE",1,59,NULL,20,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-17","USER_RESPONSE",0,20,2,21,7);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-9","USER_RESPONSE",1,12,NULL,20,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-1","USER_RESPONSE",0,2,2,32,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-26","USER_RESPONSE",1,24,NULL,26,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-16","USER_RESPONSE",1,22,NULL,34,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-28","USER_RESPONSE",1,15,NULL,33,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-2","USER_RESPONSE",0,12,3,11,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-2","USER_RESPONSE",1,4,NULL,11,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-1","USER_RESPONSE",1,29,NULL,12,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-22","USER_RESPONSE",1,7,NULL,31,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-2","USER_RESPONSE",1,45,NULL,20,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-18","USER_RESPONSE",1,32,NULL,13,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-24","USER_RESPONSE",1,43,NULL,34,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-13","USER_RESPONSE",0,27,4,14,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-19","USER_RESPONSE",1,57,NULL,12,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-28","USER_RESPONSE",1,45,NULL,25,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-14","USER_RESPONSE",1,59,NULL,22,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-1","USER_RESPONSE",1,35,NULL,15,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-10-12","USER_RESPONSE",0,44,6,15,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-19","USER_RESPONSE",0,28,4,21,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-18","USER_RESPONSE",1,26,NULL,28,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-12","USER_RESPONSE",1,44,NULL,14,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-8-25","USER_RESPONSE",1,55,NULL,28,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-22","USER_RESPONSE",1,15,NULL,24,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-10","USER_RESPONSE",0,34,5,19,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-2","USER_RESPONSE",1,32,NULL,33,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-10-5","USER_RESPONSE",0,14,1,32,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-12","USER_RESPONSE",1,11,NULL,23,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-20","USER_RESPONSE",0,30,1,16,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-2","USER_RESPONSE",1,58,NULL,23,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-3","USER_RESPONSE",0,13,6,11,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-10-10","USER_RESPONSE",0,38,2,30,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-1","USER_RESPONSE",0,53,4,28,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-15","USER_RESPONSE",0,18,3,31,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-9-1","USER_RESPONSE",0,17,3,36,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-13","USER_RESPONSE",1,54,NULL,24,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-23","USER_RESPONSE",1,43,NULL,29,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-16","USER_RESPONSE",1,55,NULL,15,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-6","USER_RESPONSE",0,8,1,23,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-24","USER_RESPONSE",1,20,NULL,21,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-11","USER_RESPONSE",1,21,NULL,14,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-9-8","USER_RESPONSE",0,18,3,22,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-6","USER_RESPONSE",0,60,1,33,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-24","USER_RESPONSE",1,5,NULL,14,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-27","USER_RESPONSE",1,13,NULL,31,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-27","USER_RESPONSE",1,57,NULL,14,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-10-23","USER_RESPONSE",0,2,3,27,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-12","USER_RESPONSE",0,58,2,20,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-9","USER_RESPONSE",0,27,3,14,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-5","USER_RESPONSE",0,39,5,29,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-10-16","USER_RESPONSE",0,30,4,31,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-11","USER_RESPONSE",1,57,NULL,24,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-8-28","USER_RESPONSE",1,18,NULL,28,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-3","USER_RESPONSE",0,18,2,20,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-17","USER_RESPONSE",0,10,5,22,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-27","USER_RESPONSE",1,47,NULL,31,7);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-23","USER_RESPONSE",0,9,6,18,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-22","USER_RESPONSE",1,25,NULL,16,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-10","USER_RESPONSE",1,34,NULL,37,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-26","USER_RESPONSE",1,8,NULL,11,7);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-18","USER_RESPONSE",1,18,NULL,37,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-21","USER_RESPONSE",0,9,2,23,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-20","USER_RESPONSE",1,33,NULL,18,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-27","USER_RESPONSE",0,13,1,31,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-8-16","USER_RESPONSE",1,57,NULL,23,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-3","USER_RESPONSE",0,41,3,15,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-12","USER_RESPONSE",0,55,6,32,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-7","USER_RESPONSE",0,42,6,29,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-27","USER_RESPONSE",0,53,2,24,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-1","USER_RESPONSE",1,23,NULL,20,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-3","USER_RESPONSE",0,25,4,24,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-25","USER_RESPONSE",1,34,NULL,25,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-9-20","USER_RESPONSE",1,45,NULL,11,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-16","USER_RESPONSE",0,50,6,23,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-1","USER_RESPONSE",0,30,3,27,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-8-21","USER_RESPONSE",0,10,1,18,7);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-21","USER_RESPONSE",0,12,6,17,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-17","USER_RESPONSE",1,26,NULL,20,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-25","USER_RESPONSE",1,7,NULL,22,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-8","USER_RESPONSE",0,58,6,25,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-18","USER_RESPONSE",0,8,3,12,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-13","USER_RESPONSE",1,40,NULL,37,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-16","USER_RESPONSE",0,7,4,34,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-6","USER_RESPONSE",0,26,2,16,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-17","USER_RESPONSE",1,54,NULL,28,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-16","USER_RESPONSE",0,16,4,13,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-18","USER_RESPONSE",1,36,NULL,17,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-9-11","USER_RESPONSE",0,10,6,14,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-10","USER_RESPONSE",1,10,NULL,11,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-8-15","USER_RESPONSE",0,51,5,19,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-26","USER_RESPONSE",0,43,6,23,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-20","USER_RESPONSE",1,45,NULL,35,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-22","USER_RESPONSE",0,40,1,14,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-26","USER_RESPONSE",1,9,NULL,22,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-23","USER_RESPONSE",1,22,NULL,25,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-10-8","USER_RESPONSE",1,4,NULL,14,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-12","USER_RESPONSE",1,26,NULL,14,7);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-5-2","USER_RESPONSE",0,45,1,28,7);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-11-6","USER_RESPONSE",1,36,NULL,26,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-10-17","USER_RESPONSE",1,40,NULL,31,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-11","USER_RESPONSE",1,15,NULL,26,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-12","USER_RESPONSE",1,6,NULL,22,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-17","USER_RESPONSE",0,31,1,28,7);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-9-7","USER_RESPONSE",1,34,NULL,34,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-8","USER_RESPONSE",1,45,NULL,19,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-27","USER_RESPONSE",0,55,1,20,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-8","USER_RESPONSE",0,39,3,31,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-5","USER_RESPONSE",0,6,4,13,4);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-3-14","USER_RESPONSE",1,38,NULL,37,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-7-25","USER_RESPONSE",1,36,NULL,33,1);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-6-3","USER_RESPONSE",0,12,5,19,2);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-1-4","USER_RESPONSE",1,50,NULL,14,3);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-2-2","USER_RESPONSE",1,33,NULL,19,6);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-21","USER_RESPONSE",1,32,NULL,19,5);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-4-11","USER_RESPONSE",0,41,6,30,8);

INSERT INTO SUBMISSION(dateofSubmission,userAnswer,successOrNot,questionID,errorID,personID,languageID) Values ("2022-12-22","USER_RESPONSE",1,51,NULL,13,2);



