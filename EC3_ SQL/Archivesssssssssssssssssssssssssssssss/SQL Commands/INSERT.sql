/* actually should be full address ah later edit*/
INSERT INTO Person_R2 VALUES ('34 Nanyang Crescent', '637634', 'West', 'Singapore');
INSERT INTO Person_R2 VALUES ('35 Nanyang Crescent', '637635', 'West', 'Singapore');
INSERT INTO Person_R2 VALUES ('36 Nanyang Crescent', '637636', 'West', 'Singapore');
INSERT INTO Person_R2 VALUES ('37 Nanyang Crescent', '637637', 'West', 'Singapore');
INSERT INTO Person_R2 VALUES ('38 Nanyang Crescent', '637638', 'West', 'Singapore');
INSERT INTO Person_R2 VALUES ('34 Bedok Bedok', '437634', 'East', 'Singapore');
INSERT INTO Person_R2 VALUES ('35 Bedok Bedok', '437635', 'East', 'Singapore');
INSERT INTO Person_R2 VALUES ('36 Bedok Bedok', '437636', 'East', 'Singapore');
INSERT INTO Person_R2 VALUES ('37 Bedok Bedok', '437637', 'East', 'Singapore');
INSERT INTO Person_R2 VALUES ('38 Bedok Bedok', '437638', 'East', 'Singapore');

/* actually should be full address ah later edit */
INSERT INTO Person_R1 VALUES('S9957894X', 'Alice Chua Qin Hui', 'School of Computer Science and Engineering', '34 Nanyang Crescent', '83388222', 'ACHUA@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9934623E', 'Foo Chuan Sheng', 'School of Physical and Mathematical Sciences', '36 Nanyang Crescent', '83388221', 'D8201@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9028353J', 'Tanay Bharadwaja', 'School of Biological Sciences', '36 Bedok Bedok', '82222472', 'TANAYB@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9283837E', 'Vincent Ribli', 'Lee Kong Chian School of Medicine', '38 Bedok Bedok', '93832222', 'VRIBLI@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9952394X', 'Alice Choo Choo', 'School of Computer Science and Engineering', '35 Nanyang Crescent', '83388322', 'ACHOO@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9923623E', 'Foo Cha Cha', 'School of Physical and Mathematical Sciences', '37 Nanyang Crescent', '83354221', 'FCC@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9643531J', 'Tan Ya Bar', 'School of Biological Sciences', '37 Bedok Bedok', '82223472', 'TYBAR@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9283837Q', 'Vinnie Lee Blee', 'School of Civil and Environmental Engineering', '37 Bedok Bedok', '93762222', 'VIN@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9237894L', 'Bob Ho', 'School of Computer Science and Engineering', '38 Nanyang Crescent', '83383722', 'BOBOHO@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9234624W', 'Ahmad Faizal', 'School of Chemical and Biomedical Engineering', '36 Nanyang Crescent', '83238341', 'AFAIZAL@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9668353S', 'Robin Hood', 'School of Biological Sciences', '35 Bedok Bedok', '82274472', 'RHOOD@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9773837R', 'Bing Qian Biscuit', 'School of Electrical and Electronic Engineering', '34 Bedok Bedok', '93832782', 'BISCUITS@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9987894K', 'Phyllis Chyrallis', 'School of Computer Science and Engineering', '34 Nanyang Crescent', '83382922', 'PHY@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9934973H', 'Chua Kai Tao', 'School of Physical and Mathematical Sciences', '36 Nanyang Crescent', '83388081', 'CKAIT@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9028213N', 'Alice Yan Dao', 'School of Biological Sciences', '36 Bedok Bedok', '82292472', 'ALIYD@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9283317M', 'Nicole See', 'Lee Kong Chian School of Medicine', '38 Bedok Bedok', '93838322', 'NSEE@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9957904K', 'Carrie Lee', 'School of Computer Science and Engineering', '34 Nanyang Crescent', '83327322', 'CLEE@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9934123T', 'Lee Yee Zhen', 'School of Physical and Mathematical Sciences', '34 Nanyang Crescent', '82938221', 'LEEYZ@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9028453R', 'Tan Koo Hwee', 'School of Biological Sciences', '36 Bedok Bedok', '82832472', 'TANKH@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9283727F', 'Phoebe Wang', 'Lee Kong Chian School of Medicine', '35 Bedok Bedok', '92342222', 'WANGP@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9934983B', 'Rishab Arya', 'School of Physical and Mathematical Sciences', '36 Nanyang Crescent', '83382321', 'RARYA@e.ntu.edu.sg');
INSERT INTO Person_R1 VALUES('S9028233E', 'Jack Ma', 'School of Biological Sciences', '36 Bedok Bedok', '82234472', 'JACKM@e.ntu.edu.sg');

INSERT INTO Stakeholder VALUES('S9028233E', 'Student Advisory Committee');
INSERT INTO Stakeholder VALUES('S9934983B', 'School Development');
INSERT INTO Stakeholder VALUES('S9283727F', 'School Development');

INSERT INTO Professor VALUES('S9028453R', 'Genetic Engineering');
INSERT INTO Professor VALUES('S9934123T', 'Cryptography');
INSERT INTO Professor VALUES('S9957904K', 'Artificial Intelligence');
INSERT INTO Professor VALUES('S9283317M', 'Cardiovascular Surgery');
INSERT INTO Professor VALUES('S9028213N', 'Disease Transfer Modelling');

INSERT INTO Student VALUES('S9934973H', 'U1820776E', '2018-06-06', 'Mathematical Sciences', NULL);
INSERT INTO Student VALUES('S9987894K', 'U1820722K', '2018-06-03', 'Computer Engineering', 'Mathematical Sciences');
INSERT INTO Student VALUES('S9773837R', 'U1720276N', '2017-05-20', 'Electronical Engineering', 'Business');
INSERT INTO Student VALUES('S9668353S', 'U1722276N', '2017-05-25', 'Biological Sciences', 'Pharmacology');
INSERT INTO Student VALUES('S9234624W', 'U1822266N', '2018-06-03', 'Chemical Engineering', NULL);
INSERT INTO Student VALUES('S9237894L', 'U1822226N', '2018-06-03', 'Computer Engineering', NULL);
INSERT INTO Student VALUES('S9283837Q', 'U1822226N', '2018-06-03', 'Civil Engineering', NULL);