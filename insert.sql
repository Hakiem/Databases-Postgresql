INSERT INTO "program" VALUES 
	('Automation Technology', 'AT'),
	('Industrial Mathematics', 'IMT'),
	('Computer Science and Engineering', 'CSEP') ON CONFLICT ("name") DO NOTHING;

INSERT INTO department VALUES
	('Computer Engineering', 'CE'),
	('Mathematics', 'MT'),
	('Computer Science', 'CS') ON CONFLICT ("name") DO NOTHING;
	
INSERT INTO hosts VALUES
	('Computer Science', 'Computer Science and Engineering'),
	('Computer Engineering', 'Computer Science and Engineering') ON CONFLICT ("program", department) DO NOTHING;

INSERT INTO student VALUES 
	('890611-1052', 'Andree Arnette', 'aandree', 'Computer Science and Engineering'),
        ('920421-4682', 'Axelina Johannesson', 'axelinaj', 'Computer Science and Engineering'),
        ('720426-4969', 'Viktoria Svedin', 'viktos', 'Computer Science and Engineering'),
        ('870721-0962', 'Karola Högberg', 'karolah', 'Computer Science and Engineering'),
        ('861219-3469', 'Natalie Strömgren', 'natalies', 'Computer Science and Engineering') ON CONFLICT ("ssn") DO NOTHING;

INSERT INTO branch VALUES 
	('Computer languages', 'Computer Science and Engineering'),
	('Algorithms', 'Computer Science and Engineering'),
	('Software Engineering','Computer Science and Engineering'),
	('Interaction Design', 'Computer Science and Engineering'),
	('Interaction Design', 'Automation Technology'),
	('Statistics', 'Industrial Mathematics') ON CONFLICT ("name", "program") DO NOTHING;

INSERT INTO belongsTo VALUES
	('890611-1052', 'Computer languages', 'Computer Science and Engineering'),
	('920421-4682', 'Computer languages', 'Computer Science and Engineering'),
	('720426-4969', 'Algorithms', 'Computer Science and Engineering'),
	('870721-0962', 'Algorithms', 'Computer Science and Engineering'),
	('861219-3469', 'Interaction Design', 'Computer Science and Engineering') ON CONFLICT (ssn) DO NOTHING;
	
INSERT INTO course VALUES
	('AA1', 'Project planning', 7.5, 'Computer Science'),
	('AA2', 'Programming C', 7.5, 'Computer Science'),
	('AA3', 'Data Science', 7.5, 'Computer Science'),
	('AA4', 'Databases', 7.5, 'Computer Science'),
	('AA5', 'Embedded Systems', 7.5, 'Computer Engineering'),
	('AA6', 'Calculus 1', 7.5, 'Mathematics'),
	('AA7', 'Calculus 2', 7.5, 'Mathematics'),
	('AA8', 'Probability', 7.5, 'Mathematics'),
	('AA9', 'Introduction to Computers', 7.5, 'Computer Science'),
	('BB1', 'Discrete Mathematics', 7.5, 'Mathematics') ON CONFLICT (code) DO NOTHING;

INSERT INTO prerequisite VALUES
	('AA3', 'AA9'),
	('AA6', 'BB1'),
	('AA7', 'AA6'),
	('AA8', 'BB1'),
	('AA2', 'AA9'),
	('AA4', 'AA9') ON CONFLICT (course, prerequisite) DO NOTHING;

INSERT INTO classification VALUES
	('Mathematical'),
	('Hands On'),
	('Research'),
	('Technical'),
	('Seminar') ON CONFLICT ("name") DO NOTHING;

INSERT INTO classified VALUES
	('AA1', 'Hands On'),
	('AA2', 'Technical'),
	('AA3', 'Research'),
	('AA4', 'Hands On'),
	('AA5', 'Hands On'),
	('AA6', 'Mathematical'),
	('AA7', 'Mathematical'),
	('AA8', 'Mathematical'),
	('AA9', 'Technical'),
	('BB1', 'Mathematical') ON CONFLICT (course) DO NOTHING;

INSERT INTO mandatoryprogram VALUES
	('AA1', 'Automation Technology'),
	('AA2', 'Automation Technology'),
	('AA3', 'Automation Technology'),
	('AA4', 'Automation Technology'),
	
	('AA1', 'Computer Science and Engineering'),
	('AA2', 'Computer Science and Engineering'),
	('AA3', 'Computer Science and Engineering'),
	('AA4', 'Computer Science and Engineering'),
	('AA5', 'Computer Science and Engineering'),
	('AA6', 'Computer Science and Engineering'),
	('AA7', 'Computer Science and Engineering'),
	('AA8', 'Computer Science and Engineering'),
	('AA9', 'Computer Science and Engineering'),
	('BB1', 'Computer Science and Engineering'),

	('AA1', 'Industrial Mathematics'),
	('AA6', 'Industrial Mathematics'),
	('AA7', 'Industrial Mathematics'),
	('AA8', 'Industrial Mathematics'),
	('AA9', 'Industrial Mathematics'),
	('BB1', 'Industrial Mathematics') ON CONFLICT (course, "program") DO NOTHING;

INSERT INTO mandatorybranch VALUES 
	('AA1','Computer languages', 'Computer Science and Engineering'),
	('AA2','Computer languages', 'Computer Science and Engineering'),
	('AA3','Computer languages', 'Computer Science and Engineering'),
	('AA4','Computer languages', 'Computer Science and Engineering'),
	('AA5','Computer languages', 'Computer Science and Engineering'),
	('AA6','Computer languages', 'Computer Science and Engineering'),
	('AA7','Computer languages', 'Computer Science and Engineering'),
	('AA8','Computer languages', 'Computer Science and Engineering'),
	('AA9','Computer languages', 'Computer Science and Engineering'),
	('BB1','Computer languages', 'Computer Science and Engineering') ON CONFLICT ("course", "program", "branch") DO NOTHING;

INSERT INTO recommendedbranch VALUES 
	('AA1','Computer languages', 'Computer Science and Engineering'),
	('AA2','Computer languages', 'Computer Science and Engineering'),
	('AA3','Computer languages', 'Computer Science and Engineering'),
	('AA4','Computer languages', 'Computer Science and Engineering'),
	('AA5','Computer languages', 'Computer Science and Engineering'),
	('AA6','Computer languages', 'Computer Science and Engineering'),
	('AA7','Computer languages', 'Computer Science and Engineering'),
	('AA8','Computer languages', 'Computer Science and Engineering'),
	('AA9','Computer languages', 'Computer Science and Engineering'),
	('BB1','Computer languages', 'Computer Science and Engineering') ON CONFLICT ("course", "program", "branch") DO NOTHING;

INSERT INTO registered VALUES
	('890611-1052', 'AA1'),
	('890611-1052', 'AA3'),
	('890611-1052', 'AA5'),

	('920421-4682', 'AA2'),
	('920421-4682', 'AA1'),
	('920421-4682', 'AA6'),
	('920421-4682', 'BB1'),

	('720426-4969', 'AA9'),
	('720426-4969', 'AA7'),
	('720426-4969', 'AA6'),
	('720426-4969', 'BB1') ON CONFLICT (ssn, course) DO NOTHING;

INSERT INTO taken VALUES
	('890611-1052', 'AA1', 'U'),
	('890611-1052', 'AA3', '3'),

    ('920421-4682', 'AA6', '3'),
	('920421-4682', 'BB1', '5'),

	('720426-4969', 'AA6', 'U'),
	('720426-4969', 'BB1', 'U') ON CONFLICT (ssn, course) DO NOTHING;

INSERT INTO limitedcourse VALUES
	('AA1', 20),
	('AA2', 15),
	('AA3', 10),
	('AA4', 10),
	('AA5', 10),
	('AA6', 15),
	('AA7', 10),
	('AA8', 10),
	('AA9', 10),
	('BB1', 10) ON CONFLICT (course) DO NOTHING;

INSERT INTO waitinglist VALUES
	('890611-1052', 'AA3', 1),
	('920421-4682', 'AA3', 2),
	('720426-4969', 'AA3', 3) ON CONFLICT (student, course) DO NOTHING;