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
	
	-- New ones added start from here : COMPUTER SCIENCE
	('AHA000', 'Fluency In Information Technology', 7.5, 'Computer Science'),
	('BET000', 'Computer Science Principles', 7.5, 'Computer Science'),
    ('BWE000', 'Science and Art of Digital Photography', 7.5, 'Computer Science'),
    ('BZM000', 'Computer Programming I', 7.5, 'Computer Science'),
    ('DHA000', 'Computer Programming II', 7.5, 'Computer Science'),
    ('EQS000', 'Web Programming', 7.5, 'Computer Science'),
    ('FPK000', 'Data Programming', 7.5, 'Computer Science'),
    ('HJK000', 'Women in CSE Seminar', 7.5, 'Computer Science'),
    ('HMF000', 'Direct Admission Seminar', 7.5, 'Computer Science'),
    ('JZT000', 'Foundations Of Computing I', 7.5, 'Computer Science'),
    ('KQM000', 'Foundations Of Computing II', 7.5, 'Computer Science'),
    ('LBH000', 'Functional Programming I', 7.5, 'Computer Science'),
    ('MRG000', 'Functional Programming II', 7.5, 'Computer Science'),
    ('NUJ000', 'Concurrent Programming I', 7.5, 'Computer Science'),
    ('NVG000', 'Concurrent Programming II', 7.5, 'Computer Science'),
    ('NYL000', 'Data Structures and Parallelism', 7.5, 'Computer Science'),
    ('PGL000', 'Systems Programming', 7.5, 'Computer Science'),
    ('QAZ000', 'Programming Languages', 7.5, 'Computer Science'),
    ('RKS000', 'Computer Vision', 7.5, 'Computer Science'),
    ('RMY000', 'Introduction To Computer Networks', 7.5, 'Computer Science'),
    ('TQH000', 'Computer Architecture I', 7.5, 'Computer Science'),
    ('TUY000', 'Introduction To Computational Linguistics', 7.5, 'Computer Science'),
    ('WFF000', 'Undergraduate Research Seminar', 7.5, 'Computer Science'),
    ('XNX000', 'Computer Security', 7.5, 'Computer Science'),
    ('YRZ000', 'Neurobotics', 7.5, 'Computer Science'),
               
    ('ARZ000', 'Introduction To Data Management', 7.5, 'Computer Science'),
    ('BGF000', 'Introduction to Digital Design', 7.5, 'Computer Science'),
    ('BZE000', 'Design of Digital Circuits and Systems', 7.5, 'Computer Science'),
    ('CWG000', 'Data Structures And Algorithms', 7.5, 'Computer Science'),
    ('EEY000', 'Leadership Seminar Series', 7.5, 'Computer Science'),
    ('FJW000', 'Transfer Admit Seminar', 7.5, 'Computer Science'),
    ('GCR000', 'System and Software Tools', 7.5, 'Computer Science'),
    ('HJM000', 'Introduction To Compiler Construction', 7.5, 'Computer Science'),
    ('JHC000', 'Computer Systems', 7.5, 'Computer Science'),
    ('KCD000', 'Introduction to Machine Learning', 7.5, 'Computer Science'),
    ('KRB000', 'Introduction To Artificial Intelligence', 7.5, 'Computer Science'),
    ('MCQ000', 'Algorithms And Computational Complexity', 7.5, 'Computer Science'),
    ('NNL000', 'Computational Biology', 7.5, 'Computer Science'),
    ('NUX000', 'Computational Biology Capstone', 7.5, 'Computer Science'),
    ('NXV000', 'Data Visualization', 7.5, 'Computer Science'),
    ('PGK000', 'Animation Production Seminar', 7.5, 'Computer Science'),
    ('PJV000', 'Introduction To Operating Systems', 7.5, 'Computer Science'),
    ('QZG000', 'Introduction to Distributed Systems', 7.5, 'Computer Science'),
    ('RLE000', 'Computer Graphics', 7.5, 'Computer Science'),
    ('TKB000', 'Software For Embedded Systems', 7.5, 'Computer Science'),
    ('TSZ000', 'Computer Architecture II', 7.5, 'Computer Science'),
    ('VTS000', 'Introduction to Embedded Systems', 7.5, 'Computer Science'),
    ('WUV000', 'Reading And Research', 7.5, 'Computer Science'),
    ('XZL000', 'Entrepreneurship', 7.5, 'Computer Science'),
    ('ZPM000', 'Undergraduate Research Seminar', 7.5, 'Computer Science'),
	
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
	('AHA000','ARZ000'),
    ('BET000','BGF000'),
    ('BWE000','BZE000'),
    ('BZM000','CWG000'),
    ('DHA000','EEY000'),
    ('EQS000','FJW000'),
    ('FPK000','GCR000'),
    ('HJK000','HJM000'),
    ('HMF000','JHC000'),
    ('JZT000','KCD000'),
    ('KQM000','KRB000'),
    ('LBH000','MCQ000'),
    ('MRG000','NNL000'),
    ('NUJ000','NUX000'),
    ('NVG000','NXV000'),
    ('NYL000','PGK000'),
    ('PGL000','PJV000'),
    ('QAZ000','QZG000'),
    ('RKS000','RLE000'),
    ('RMY000','TKB000'),
    ('TQH000','TSZ000'),
    ('TUY000','VTS000'),
    ('WFF000','WUV000'),
    ('XNX000','XZL000'),
    ('YRZ000','ZPM000'),
	
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
	
	('TMV210', 'Mathematical'),
	('KKL289', 'Mathematical'),
	('FGH345', 'Mathematical'),
	('JGT234', 'Mathematical'),
	
	-- New ones Mathematical added start here
	('ANM234', 'Mathematical'),
	('AHA000', 'Mathematical'),
	('BET000', 'Mathematical'),
	('BWE000', 'Mathematical'),
	('BZM000', 'Mathematical'),
	('DHA000', 'Mathematical'),
	('EQS000', 'Mathematical'),
	('FPK000', 'Mathematical'),
	('HJK000', 'Mathematical'),
	('HMF000', 'Mathematical'),
	('JZT000', 'Mathematical'),
	('KQM000', 'Mathematical'),
	('LBH000', 'Mathematical'),
	('MRG000', 'Mathematical'),
	('NUJ000', 'Mathematical'),
	('NVG000', 'Mathematical'),
	('NYL000', 'Mathematical'),
	('PGL000', 'Mathematical'),
	('QAZ000', 'Mathematical'),
	('RKS000', 'Mathematical'),
	
	-- New ones Research added start here
	('RMY000', 'Research'),
	('TQH000', 'Research'),
	('TUY000', 'Research'),
	('WFF000', 'Research'),
	('XNX000', 'Research'),
	('ARZ000', 'Research'),
    ('BGF000', 'Research'),
    ('BZE000', 'Research'),
    ('CWG000', 'Research'),
    ('EEY000', 'Research'),
    ('FJW000', 'Research'),

	-- Old ones Research
	('TDA226', 'Research'),
	('MME234', 'Research'),
	('LPO221', 'Research'),

	-- Old ones Seminar
	('SYS080', 'Seminar'),
	('SSD673', 'Seminar'),
	('TTB234', 'Seminar'),
	('GHT235', 'Seminar'),
	('TFG662', 'Seminar'),
	('POG345', 'Seminar'),
	('PSK153', 'Seminar'),
	
	-- New ones Seminar
	('GCR000', 'Seminar'),
	('HJM000', 'Seminar'),
	('JHC000', 'Seminar'),
	('KCD000', 'Seminar'),
	('KRB000', 'Seminar'),
	('MCQ000', 'Seminar'),
	('NNL000', 'Seminar'),
	('NUX000', 'Seminar'),
	('NXV000', 'Seminar'),
	('PGK000', 'Seminar'),
	('PJV000', 'Seminar'),
	('QZG000', 'Seminar'),
	('RLE000', 'Seminar'),
	('TKB000', 'Seminar'),
	('TSZ000', 'Seminar'),
	('VTS000', 'Seminar'),
	('WUV000', 'Seminar'),
	('XZL000', 'Seminar'),
	('ZPM000', 'Seminar');

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
	
	-- New ones mandatoryprogram in Computer Science and Engineering Programming
	('AHA000', 'Computer Science and Engineering'),
	('BET000', 'Computer Science and Engineering'),
	('BWE000', 'Computer Science and Engineering'),
	('BZM000', 'Computer Science and Engineering'),
	('DHA000', 'Computer Science and Engineering'),
	('EQS000', 'Computer Science and Engineering'),
	('FPK000', 'Computer Science and Engineering'),
	('HJK000', 'Computer Science and Engineering'),
	('HMF000', 'Computer Science and Engineering'),
	('JZT000', 'Computer Science and Engineering'),
	('KQM000', 'Computer Science and Engineering'),
	('LBH000', 'Computer Science and Engineering'),
	('MRG000', 'Computer Science and Engineering'),
	('NUJ000', 'Computer Science and Engineering'),
	('NVG000', 'Computer Science and Engineering'),
	('NYL000', 'Computer Science and Engineering'),
	('PGL000', 'Computer Science and Engineering'),
	('QAZ000', 'Computer Science and Engineering'),
	('RKS000', 'Computer Science and Engineering'),
	('RMY000', 'Computer Science and Engineering'),
	('TQH000', 'Computer Science and Engineering'),
	('TUY000', 'Computer Science and Engineering'),
	('WFF000', 'Computer Science and Engineering'),
	('XNX000', 'Computer Science and Engineering'),
	('YRZ000', 'Computer Science and Engineering'),
	
	('ARZ000', 'Computer Science and Engineering'),
	('BGF000', 'Computer Science and Engineering'),
	('BZE000', 'Computer Science and Engineering'),
	('CWG000', 'Computer Science and Engineering'),
	('EEY000', 'Computer Science and Engineering'),
	('FJW000', 'Computer Science and Engineering'),
	('GCR000', 'Computer Science and Engineering'),
	('HJM000', 'Computer Science and Engineering'),
	('JHC000', 'Computer Science and Engineering'),
	('KCD000', 'Computer Science and Engineering'),
	('KRB000', 'Computer Science and Engineering'),
	('MCQ000', 'Computer Science and Engineering'),
	('NNL000', 'Computer Science and Engineering'),
	('NUX000', 'Computer Science and Engineering'),
	('NXV000', 'Computer Science and Engineering'),
	('PGK000', 'Computer Science and Engineering'),
	('PJV000', 'Computer Science and Engineering'),
	('QZG000', 'Computer Science and Engineering'),
	('RLE000', 'Computer Science and Engineering'),
	('TKB000', 'Computer Science and Engineering'),
	('TSZ000', 'Computer Science and Engineering'),
	('VTS000', 'Computer Science and Engineering'),
	('WUV000', 'Computer Science and Engineering'),
	('XZL000', 'Computer Science and Engineering'),
	('ZPM000', 'Computer Science and Engineering'),
	
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
	
	-- New ones mandatoryprogram in Computer Science and Engineering Programming
	('AHA000', 'Computer languages', 'Computer Science and Engineering'),
	('BET000', 'Computer languages', 'Computer Science and Engineering'),
	('BWE000', 'Computer languages', 'Computer Science and Engineering'),
	('BZM000', 'Computer languages', 'Computer Science and Engineering'),
	('DHA000', 'Computer languages', 'Computer Science and Engineering'),
	('EQS000', 'Computer languages', 'Computer Science and Engineering'),
	('FPK000', 'Computer languages', 'Computer Science and Engineering'),
	('HJK000', 'Computer languages', 'Computer Science and Engineering'),
	('HMF000', 'Computer languages', 'Computer Science and Engineering'),
	('JZT000', 'Computer languages', 'Computer Science and Engineering'),
	('KQM000', 'Computer languages', 'Computer Science and Engineering'),
	('LBH000', 'Computer languages', 'Computer Science and Engineering'),
	('MRG000', 'Computer languages', 'Computer Science and Engineering'),
	('NUJ000', 'Computer languages', 'Computer Science and Engineering'),
	('NVG000', 'Computer languages', 'Computer Science and Engineering'),
	('NYL000', 'Computer languages', 'Computer Science and Engineering'),
	('PGL000', 'Computer languages', 'Computer Science and Engineering'),
	('QAZ000', 'Computer languages', 'Computer Science and Engineering'),
	('RKS000', 'Computer languages', 'Computer Science and Engineering'),
	('RMY000', 'Computer languages', 'Computer Science and Engineering'),
	('TQH000', 'Computer languages', 'Computer Science and Engineering'),
	('TUY000', 'Computer languages', 'Computer Science and Engineering'),
	('WFF000', 'Computer languages', 'Computer Science and Engineering'),
	('XNX000', 'Computer languages', 'Computer Science and Engineering'),
	('YRZ000', 'Computer languages', 'Computer Science and Engineering'),
	
	('ARZ000', 'Computer languages', 'Computer Science and Engineering'),
	('BGF000', 'Computer languages', 'Computer Science and Engineering'),
	('BZE000', 'Computer languages', 'Computer Science and Engineering'),
	('CWG000', 'Computer languages', 'Computer Science and Engineering'),
	('EEY000', 'Computer languages', 'Computer Science and Engineering'),
	('FJW000', 'Computer languages', 'Computer Science and Engineering'),
	('GCR000', 'Computer languages', 'Computer Science and Engineering'),
	('HJM000', 'Computer languages', 'Computer Science and Engineering'),
	('JHC000', 'Computer languages', 'Computer Science and Engineering'),
	('KCD000', 'Computer languages', 'Computer Science and Engineering'),
	('KRB000', 'Computer languages', 'Computer Science and Engineering'),
	('MCQ000', 'Computer languages', 'Computer Science and Engineering'),
	('NNL000', 'Computer languages', 'Computer Science and Engineering'),
	('NUX000', 'Computer languages', 'Computer Science and Engineering'),
	('NXV000', 'Computer languages', 'Computer Science and Engineering'),
	('PGK000', 'Computer languages', 'Computer Science and Engineering'),
	('PJV000', 'Computer languages', 'Computer Science and Engineering'),
	('QZG000', 'Computer languages', 'Computer Science and Engineering'),
	('RLE000', 'Computer languages', 'Computer Science and Engineering'),
	('TKB000', 'Computer languages', 'Computer Science and Engineering'),
	('TSZ000', 'Computer languages', 'Computer Science and Engineering'),
	('VTS000', 'Computer languages', 'Computer Science and Engineering'),
	('WUV000', 'Computer languages', 'Computer Science and Engineering'),
	('XZL000', 'Computer languages', 'Computer Science and Engineering'),
	('ZPM000', 'Computer languages', 'Computer Science and Engineering'),
	
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
	
	-- New ones added here below
	('AHA000', 'Computer languages', 'Computer Science and Engineering'),
	('BET000', 'Computer languages', 'Computer Science and Engineering'),
	('BWE000', 'Computer languages', 'Computer Science and Engineering'),
	('BZM000', 'Computer languages', 'Computer Science and Engineering'),
	('DHA000', 'Computer languages', 'Computer Science and Engineering'),
	('EQS000', 'Computer languages', 'Computer Science and Engineering'),
	('FPK000', 'Computer languages', 'Computer Science and Engineering'),
	('HJK000', 'Computer languages', 'Computer Science and Engineering'),
	('HMF000', 'Computer languages', 'Computer Science and Engineering'),
	('JZT000', 'Computer languages', 'Computer Science and Engineering'),
	('KQM000', 'Computer languages', 'Computer Science and Engineering'),
	('LBH000', 'Computer languages', 'Computer Science and Engineering'),
	('MRG000', 'Computer languages', 'Computer Science and Engineering'),
	('NUJ000', 'Computer languages', 'Computer Science and Engineering'),
	('NVG000', 'Computer languages', 'Computer Science and Engineering'),
	('NYL000', 'Computer languages', 'Computer Science and Engineering'),
	('PGL000', 'Computer languages', 'Computer Science and Engineering'),
	('QAZ000', 'Computer languages', 'Computer Science and Engineering'),
	('RKS000', 'Computer languages', 'Computer Science and Engineering'),
	('RMY000', 'Computer languages', 'Computer Science and Engineering'),
	('TQH000', 'Computer languages', 'Computer Science and Engineering'),
	('TUY000', 'Computer languages', 'Computer Science and Engineering'),
	('WFF000', 'Computer languages', 'Computer Science and Engineering'),
	('XNX000', 'Computer languages', 'Computer Science and Engineering'),
	('YRZ000', 'Computer languages', 'Computer Science and Engineering'),
	
	('ARZ000', 'Computer languages', 'Computer Science and Engineering'),
	('BGF000', 'Computer languages', 'Computer Science and Engineering'),
	('BZE000', 'Computer languages', 'Computer Science and Engineering'),
	('CWG000', 'Computer languages', 'Computer Science and Engineering'),
	('EEY000', 'Computer languages', 'Computer Science and Engineering'),
	('FJW000', 'Computer languages', 'Computer Science and Engineering'),
	('GCR000', 'Computer languages', 'Computer Science and Engineering'),
	('HJM000', 'Computer languages', 'Computer Science and Engineering'),
	('JHC000', 'Computer languages', 'Computer Science and Engineering'),
	('KCD000', 'Computer languages', 'Computer Science and Engineering'),
	('KRB000', 'Computer languages', 'Computer Science and Engineering'),
	('MCQ000', 'Computer languages', 'Computer Science and Engineering'),
	('NNL000', 'Computer languages', 'Computer Science and Engineering'),
	('NUX000', 'Computer languages', 'Computer Science and Engineering'),
	('NXV000', 'Computer languages', 'Computer Science and Engineering'),
	('PGK000', 'Computer languages', 'Computer Science and Engineering'),
	('PJV000', 'Computer languages', 'Computer Science and Engineering'),
	('QZG000', 'Computer languages', 'Computer Science and Engineering'),
	('RLE000', 'Computer languages', 'Computer Science and Engineering'),
	('TKB000', 'Computer languages', 'Computer Science and Engineering'),
	('TSZ000', 'Computer languages', 'Computer Science and Engineering'),
	('VTS000', 'Computer languages', 'Computer Science and Engineering'),
	('WUV000', 'Computer languages', 'Computer Science and Engineering'),
	('XZL000', 'Computer languages', 'Computer Science and Engineering'),
	('ZPM000', 'Computer languages', 'Computer Science and Engineering'),
	
	('SYS080', 'Test Driven Development', 'Information Technology'),
	('TDA226', 'Test Driven Development', 'Information Technology'),
	('MME234', 'Test Driven Development', 'Information Technology'),
	('SSD673', 'Test Driven Development', 'Information Technology'),
	('INT690', 'Test Driven Development', 'Information Technology'),
	('LPO221', 'Test Driven Development', 'Information Technology'),
	('ANM234', 'Test Driven Development', 'Information Technology');

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
	
	-- New ones added here
	('890611-1052', 'AHA000', '3'), 
    ('890611-1052', 'BET000', '3'),
    ('890611-1052', 'BWE000', '3'),
    ('890611-1052', 'BZM000', '4'),
    ('890611-1052', 'DHA000', '3'),
    ('890611-1052', 'EQS000', '3'),
    ('890611-1052', 'FPK000', '3'),
    ('890611-1052', 'HJK000', '3'),
    ('890611-1052', 'HMF000', '3'),
    ('890611-1052', 'JZT000', '3'),
    ('890611-1052', 'KQM000', '3'),
    ('890611-1052', 'LBH000', '3'),
	('890611-1052', 'MRG000', '3'), 
	('890611-1052', 'NUJ000', '4'), 
	('890611-1052', 'NVG000', '3'),
	('890611-1052', 'NYL000', '3'),
	('890611-1052', 'PGL000', '3'),
	('890611-1052', 'QAZ000', '3'),
	('890611-1052', 'RKS000', '3'),
	('890611-1052', 'RMY000', '3'),
	('890611-1052', 'TQH000', '3'),
	('890611-1052', 'TUY000', '3'),
	('890611-1052', 'WFF000', '3'),
	('890611-1052', 'XNX000', '3'),
	('890611-1052', 'YRZ000', '3'),
	
	('890611-1052', 'ARZ000', '3'),
	('890611-1052', 'BGF000', '3'),
	('890611-1052', 'BZE000', '4'),
	('890611-1052', 'CWG000', '3'),
	('890611-1052', 'EEY000', '3'),
	('890611-1052', 'FJW000', '3'),
	('890611-1052', 'GCR000', '3'),
	('890611-1052', 'HJM000', '3'),
	('890611-1052', 'JHC000', '3'),
	('890611-1052', 'KCD000', '3'),
	('890611-1052', 'KRB000', '3'),
	('890611-1052', 'MCQ000', '3'),
	('890611-1052', 'NNL000', '3'),
	('890611-1052', 'NUX000', '3'),
	('890611-1052', 'NXV000', '3'),
	('890611-1052', 'PGK000', '3'),
	('890611-1052', 'PJV000', '3'),
	('890611-1052', 'QZG000', '3'),
	('890611-1052', 'RLE000', '3'),
	('890611-1052', 'TKB000', '3'),
	('890611-1052', 'TSZ000', '3'),
	('890611-1052', 'VTS000', '3'),
	('890611-1052', 'WUV000', '3'),
	('890611-1052', 'XZL000', '3'),
	('890611-1052', 'ZPM000', '3'),
	
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

INSERT INTO registered VALUES
	('890611-1052', 'GHT235'),
	('890611-1052', 'SSD673'),
	('890611-1052', 'LPO221'),

	('920421-4682', 'SYS080'),
	('920421-4682', 'TMV210'),
	('920421-4682', 'LPO221'),

	('720426-4969', 'MME234'),
	('720426-4969', 'LPO221');
	
INSERT INTO waitinglist VALUES
	('720426-4969', 'SYS080', 1),
	('920421-4682', 'MME234', 2),
	('720426-4969', 'TMV210', 3);