CREATE OR REPLACE VIEW public.studentfollowing AS 
	SELECT s.ssn, s.program, b.name FROM student AS s, branch AS b;

CREATE OR REPLACE VIEW FinishedCourses AS
	SELECT s.ssn, t.course, c.name, grade, credits FROM taken as t 
		INNER JOIN student as s ON (s.ssn = t.ssn)
		INNER JOIN course as c ON (c.code = t.course);

CREATE OR REPLACE  VIEW Registrations AS	
	SELECT r.ssn, r.course, c.name, 
		(CASE WHEN EXISTS 
			(SELECT true 
				FROM waitinglist AS w
				WHERE r.ssn = w.student AND r.course = w.course)
		THEN 'waiting'
		ELSE 'registered' END) AS status
	FROM registered AS r, course AS c;
	
CREATE OR REPLACE VIEW PassedCourses AS
	SELECT ssn, t.course, credits FROM taken t
	INNER JOIN course c ON c.code = t.course
WHERE t.grade <> 'U';

CREATE OR REPLACE VIEW public.unreadmandatory AS 
	SELECT k.ssn, array_agg(k.courseslist) AS course
		FROM ( SELECT s.ssn, m.course::text AS courseslist
				FROM mandatoryprogram m
				JOIN student s USING (program)
				GROUP BY s.ssn, m.course) k
	WHERE NOT (k.courseslist IN ( SELECT t.course
           FROM taken t
          WHERE t.ssn = k.ssn AND t.grade <> 'U'::greid))
  GROUP BY k.ssn;
	
CREATE OR REPLACE VIEW PathToGraduation AS
SELECT 
	s.ssn AS student,
	(SELECT COALESCE(SUM(credits), 0) AS credo FROM passedcourses AS p WHERE p.ssn = s.ssn) AS  totalCredits,
	(SELECT array_length(course, 1) FROM unreadmandatory AS u WHERE u.ssn = s.ssn) AS mandatoryleft,
	(SELECT COALESCE(SUM(credits), 0) FROM passedcourses AS k JOIN classified AS h ON (h.course = k.course) WHERE k.ssn = s.ssn AND classification = 'Mathematical') AS MathCredits,
	(SELECT COUNT(*) FROM passedcourses AS k JOIN classified AS h ON (h.course = k.course) WHERE k.ssn = s.ssn AND classification = 'Research') AS ResearchCredits,
	(SELECT COUNT(*) FROM passedcourses AS k JOIN classified AS h ON (h.course = k.course) WHERE k.ssn = s.ssn AND classification = 'Seminar') AS SeminarCredits,
	(SELECT NOT EXISTS (SELECT * FROM unreadmandatory AS u WHERE u.ssn = s.ssn)) AS status
FROM student AS s;
