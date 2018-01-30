INSERT INTO "program" VALUES 
	('Automation Technology', 'AT'),
	('Industrial Mathematics', 'IMT'),
	('Information Technology', 'IT'),
	('Computer Science and Engineering', 'CSEP');

INSERT INTO department VALUES
	('Computer Engineering', 'CE'),
	('Scrum', 'SC'),
	('Mathematics', 'MT'),
	('Computer Science', 'CS');
	
INSERT INTO hosts VALUES
	('Computer Science', 'Computer Science and Engineering'),
	('Scrum', 'Information Technology'),
	('Computer Engineering', 'Computer Science and Engineering');

INSERT INTO student VALUES 
	('890611-1052', 'Andree Arnette', 'aandree', 'Computer Science and Engineering'),
    ('920421-4682', 'Axelina Johannesson', 'axelinaj', 'Computer Science and Engineering'),
    ('720426-4969', 'Viktoria Svedin', 'viktos', 'Computer Science and Engineering'),
    ('870721-0962', 'Karola Högberg', 'karolah', 'Computer Science and Engineering'),
	
	('980620-5267', 'Greta Albinsson', 'gretaa', 'Information Technology'),
    ('841123-8523', 'Anna-Stina Engdahl', 'annas', 'Information Technology'),
    ('971104-1575', 'Sixten Rydell', 'sixr', 'Information Technology'),
    ('750405-0985', 'Nanna Ringdahl', 'nanna', 'Information Technology'),
	
    ('861219-3469', 'Natalie Strömgren', 'natalies', 'Computer Science and Engineering');

INSERT INTO branch VALUES 
	('Computer languages', 'Computer Science and Engineering'),
	('Algorithms', 'Computer Science and Engineering'),
	('Software Engineering','Computer Science and Engineering'),
	('Interaction Design', 'Computer Science and Engineering'),
	('Interaction Design', 'Automation Technology'),
	('Test Driven Development', 'Information Technology'),
	('Statistics', 'Industrial Mathematics');

INSERT INTO belongsTo VALUES
	('890611-1052', 'Computer languages', 'Computer Science and Engineering'),
	('920421-4682', 'Computer languages', 'Computer Science and Engineering'),
	('720426-4969', 'Algorithms', 'Computer Science and Engineering'),
	('870721-0962', 'Algorithms', 'Computer Science and Engineering'),
	
	('980620-5267', 'Test Driven Development', 'Information Technology'),
    ('841123-8523', 'Test Driven Development', 'Information Technology'),
    ('971104-1575', 'Test Driven Development', 'Information Technology'),
    ('750405-0985', 'Test Driven Development', 'Information Technology');
	
INSERT INTO course VALUES
	('SYS080', 'Project planning', 7.5, 'Computer Science'),
	('TDA226', 'Programming C', 7.5, 'Computer Science'),
	('MME234', 'Data Science', 7.5, 'Computer Science'),
	('SSD673', 'Databases', 7.5, 'Computer Science'),
	('INT690', 'Introduction to Everything', 7.5, 'Computer Science'),
	('LPO221', 'Introduction to Computers', 7.5, 'Computer Science'),
	
	('TMV210', 'Embedded Systems', 7.5, 'Computer Engineering'),
	
	('KKL289', 'Calculus 1', 7.5, 'Mathematics'),
	('FGH345', 'Calculus 2', 7.5, 'Mathematics'),
	('JGT234', 'Probability', 7.5, 'Mathematics'),
	('ANM234', 'Discrete Mathematics', 7.5, 'Mathematics'),
	
	('TTB234', 'Introductory Unit Testing', 7.5, 'Scrum'),
	('GHT235', 'Mocks and Fakes', 7.5, 'Scrum'),
	('TFG662', 'Inversion of Control Containers', 7.5, 'Scrum'),
	('POG345', 'Generic Repository and Unit of Work Patterns', 7.5, 'Scrum'),
	('PSK153', 'Singleton Pattern', 7.5, 'Scrum');
	

INSERT INTO prerequisite VALUES
	('SYS080', 'INT690'),
	('TDA226', 'LPO221'), 
	('MME234', 'TDA226'),
	('SSD673', 'TDA226'),
	('TMV210', 'TDA226'),
	('KKL289', 'ANM234'),
	('FGH345', 'KKL289'),
	('JGT234', 'ANM234'),
	('TTB234', 'TDA226'),
	('GHT235', 'TTB234'),
	('TFG662', 'TTB234'),
	('POG345', 'TTB234'),
	('PSK153', 'TTB234'),
	('LPO221', 'INT690'),
	('ANM234', 'ANM234');

INSERT INTO classification VALUES
	('Mathematical'),
	('Research'),
	('Seminar');

INSERT INTO classified VALUES
	('SYS080', 'Seminar'),
	('TDA226', 'Research'),
	('MME234', 'Research'),
	('SSD673', 'Seminar'),
	('TMV210', 'Mathematical'),
	('KKL289', 'Mathematical'),
	('FGH345', 'Mathematical'),
	('JGT234', 'Mathematical'),
	('TTB234', 'Seminar'),
	('GHT235', 'Seminar'),
	('TFG662', 'Seminar'),
	('POG345', 'Seminar'),
	('PSK153', 'Seminar'),
	('LPO221', 'Research'),
	('ANM234', 'Mathematical');

INSERT INTO mandatoryprogram VALUES
	('SYS080', 'Automation Technology'),
	('TDA226', 'Automation Technology'),
	('MME234', 'Automation Technology'),
	('SSD673', 'Automation Technology'),
	
	('SYS080', 'Computer Science and Engineering'),
	('TDA226', 'Computer Science and Engineering'),
	('MME234', 'Computer Science and Engineering'),
	('SSD673', 'Computer Science and Engineering'),
	('TMV210', 'Computer Science and Engineering'),
	('TTB234', 'Computer Science and Engineering'),
	('GHT235', 'Computer Science and Engineering'),
	('TFG662', 'Computer Science and Engineering'),
	('POG345', 'Computer Science and Engineering'),
	('PSK153', 'Computer Science and Engineering'),
	('INT690', 'Computer Science and Engineering'),
	('LPO221', 'Computer Science and Engineering'),
    ('ANM234', 'Computer Science and Engineering'),
	
	('SYS080', 'Information Technology'),
	('TDA226', 'Information Technology'),
	('MME234', 'Information Technology'),
	('SSD673', 'Information Technology'),
	('TMV210', 'Information Technology'),
	('TTB234', 'Information Technology'),
	('GHT235', 'Information Technology'),
	('TFG662', 'Information Technology'),
	('POG345', 'Information Technology'),
	('PSK153', 'Information Technology'),
	('INT690', 'Information Technology'),
	('LPO221', 'Information Technology'),
	('ANM234', 'Information Technology'),
	
	('KKL289', 'Industrial Mathematics'),
	('FGH345', 'Industrial Mathematics'),
	('JGT234', 'Industrial Mathematics'),
	('INT690', 'Industrial Mathematics'),
	('LPO221', 'Industrial Mathematics'),
	('ANM234', 'Industrial Mathematics');

INSERT INTO mandatorybranch VALUES 
	('SYS080', 'Computer languages', 'Computer Science and Engineering'),
	('TDA226', 'Computer languages', 'Computer Science and Engineering'),
	('MME234', 'Computer languages', 'Computer Science and Engineering'),
	('SSD673', 'Computer languages', 'Computer Science and Engineering'),
	('TMV210', 'Computer languages', 'Computer Science and Engineering'),
	('TTB234', 'Computer languages', 'Computer Science and Engineering'),
	('GHT235', 'Computer languages', 'Computer Science and Engineering'),
	('TFG662', 'Computer languages', 'Computer Science and Engineering'),
	('POG345', 'Computer languages', 'Computer Science and Engineering'),
	('PSK153', 'Computer languages', 'Computer Science and Engineering'),
	('INT690', 'Computer languages', 'Computer Science and Engineering'),
	('LPO221', 'Computer languages', 'Computer Science and Engineering'),
	('ANM234', 'Computer languages', 'Computer Science and Engineering'),
	
	('SYS080', 'Test Driven Development', 'Information Technology'),
	('TDA226', 'Test Driven Development', 'Information Technology'),
	('MME234', 'Test Driven Development', 'Information Technology'),
	('SSD673', 'Test Driven Development', 'Information Technology'),
	('INT690', 'Test Driven Development', 'Information Technology'),
	('LPO221', 'Test Driven Development', 'Information Technology'),
	('ANM234', 'Test Driven Development', 'Information Technology');
	
	

INSERT INTO recommendedbranch VALUES 
	('SYS080', 'Computer languages', 'Computer Science and Engineering'),
	('TDA226', 'Computer languages', 'Computer Science and Engineering'),
	('MME234', 'Computer languages', 'Computer Science and Engineering'),
	('SSD673', 'Computer languages', 'Computer Science and Engineering'),
	('TMV210', 'Computer languages', 'Computer Science and Engineering'),
	('TTB234', 'Computer languages', 'Computer Science and Engineering'),
	('GHT235', 'Computer languages', 'Computer Science and Engineering'),
	('TFG662', 'Computer languages', 'Computer Science and Engineering'),
	('POG345', 'Computer languages', 'Computer Science and Engineering'),
	('PSK153', 'Computer languages', 'Computer Science and Engineering'),
	('INT690', 'Computer languages', 'Computer Science and Engineering'),
	('LPO221', 'Computer languages', 'Computer Science and Engineering'),
	('ANM234', 'Computer languages', 'Computer Science and Engineering'),
	
	('SYS080', 'Test Driven Development', 'Information Technology'),
	('TDA226', 'Test Driven Development', 'Information Technology'),
	('MME234', 'Test Driven Development', 'Information Technology'),
	('SSD673', 'Test Driven Development', 'Information Technology'),
	('INT690', 'Test Driven Development', 'Information Technology'),
	('LPO221', 'Test Driven Development', 'Information Technology'),
	('ANM234', 'Test Driven Development', 'Information Technology');

INSERT INTO registered VALUES
	('890611-1052', 'GHT235'),
	('890611-1052', 'SSD673'),
	('890611-1052', 'LPO221'),

	('920421-4682', 'SYS080'),
	('920421-4682', 'TMV210'),
	('920421-4682', 'MME234'),
	('920421-4682', 'LPO221'),

	('720426-4969', 'SYS080'),
	('720426-4969', 'TMV210'),
	('720426-4969', 'MME234'),
	('720426-4969', 'LPO221');

INSERT INTO taken VALUES
	('890611-1052', 'SYS080', '3'),
	('890611-1052', 'TDA226', '3'),
	('890611-1052', 'MME234', '4'),
	('890611-1052', 'SSD673', '3'),
	('890611-1052', 'TMV210', '3'),
	('890611-1052', 'TTB234', '3'),
	('890611-1052', 'GHT235', '3'),
	('890611-1052', 'TFG662', '3'),
	('890611-1052', 'POG345', '3'),
	('890611-1052', 'PSK153', '3'),
	('890611-1052', 'INT690', '3'),
	('890611-1052', 'LPO221', '3'),
	('890611-1052', 'ANM234', '3'),
	
    ('920421-4682', 'POG345', '3'),
	('920421-4682', 'PSK153', '5'),
	('920421-4682', 'INT690', '3'),
	('920421-4682', 'LPO221', '5'),

	('720426-4969', 'INT690', 'U'),
	('720426-4969', 'LPO221', 'U'),
	
	('980620-5267', 'SYS080', '3'),
	('980620-5267', 'TDA226', '3'),
	('980620-5267', 'MME234', '3'),
	
	('841123-8523', 'SYS080', '3'), 
	('841123-8523', 'TDA226', 'U'),
	('841123-8523', 'MME234', '3');

INSERT INTO limitedcourse VALUES
	('SYS080',  7),
	('TDA226',  5),
	('MME234',  5),
	('SSD673',  7),
	('TMV210',  4),
	('KKL289',  3),
	('FGH345',  7),
	('JGT234',  5),
	('TTB234',  5),
	('GHT235',  7),
	('TFG662',  4),
	('POG345',  3),
	('PSK153',  5),
	('INT690',  5),
	('LPO221',  5),
	('ANM234',  9);

INSERT INTO waitinglist VALUES
	('720426-4969', 'SYS080', 1),
	('920421-4682', 'MME234', 2),
	('720426-4969', 'TMV210', 3);