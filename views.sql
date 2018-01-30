------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW StudentFollowing -------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW StudentFollowing AS 
	SELECT s.ssn AS student, s.program, b.name AS branch FROM student AS s, branch AS b;

------------------------------------------------------------------------------------------------------------------------
-------------------- Helper Function : Concatenates Course Code and Name --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION ConcatCourseCodeAndCourseName (code CHAR(12), courseName character varying) RETURNS TEXT AS $$
BEGIN

	RETURN code::text || ' - ' || courseName::text;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW FinishedCourses --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW FinishedCourses AS
	SELECT s.ssn AS student,
		ConcatCourseCodeAndCourseName(t.course, c.name) AS course, 
		(grade::TEXT) AS grade, 
		CASE WHEN grade = 'U' THEN 0 ELSE credits END AS credits FROM taken as t 
	INNER JOIN student as s ON (s.ssn = t.student)
	INNER JOIN course as c ON (c.code = t.course);

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW Registration --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE  VIEW Registrations AS	
	SELECT r.student, ConcatCourseCodeAndCourseName(r.course, c.name) AS course, 'Registered' As status 
	FROM registered as r JOIN course c ON(c.code = r.course)
	UNION 
	SELECT w.student AS student, ConcatCourseCodeAndCourseName(w.course, c.name) AS course, 'Waiting' As status 
	FROM waitinglist AS w JOIN course c ON(c.code = w.course);

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW PassedCourses	--------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW PassedCourses AS
	SELECT student, t.course AS course, credits FROM taken t
	JOIN course c ON c.code = t.course
WHERE t.grade <> 'U';

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW UnreadMandatory --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW UnreadMandatory AS 
	SELECT k.ssn AS student, array_agg(k.courseslist) AS course
		FROM ( SELECT s.ssn, m.course::text AS courseslist
				FROM student s
				LEFT JOIN mandatoryprogram m USING (program)
				GROUP BY s.ssn, m.course) k
	WHERE NOT (k.courseslist IN ( 
			SELECT t.course
			FROM taken t
			WHERE t.student = k.ssn AND t.grade <> 'U'::greid)
		)
  GROUP BY k.ssn;

------------------------------------------------------------------------------------------------------------------------
-------------------- Helper Function : classification - Returns an Integer
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION classification (classif character varying, sssn CHAR(12)) RETURNS INTEGER AS $$
DECLARE
  kount SMALLINT;

BEGIN
	IF classif <> 'Mathematical' THEN
		kount := (SELECT COUNT(*) FROM passedcourses AS k 
			JOIN classified AS h ON (h.course = k.course) WHERE k.student = sssn AND classification = classif);
	ELSE
		kount := (SELECT COALESCE(SUM(credits), 0) FROM passedcourses AS k 
			JOIN classified AS h ON (h.course = k.course) WHERE k.student = sssn AND classification = classif);
	END IF;
	RETURN kount;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW PathToGraduation --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW PathToGraduation AS
SELECT 
	s.ssn AS student,
	(SELECT COALESCE(SUM(credits), 0) AS credo FROM passedcourses AS p WHERE p.student = s.ssn) AS  totalCredits,
	(SELECT COALESCE(array_length(course, 1), 0) FROM unreadmandatory AS u RIGHT JOIN student g ON g.ssn = u.student WHERE g.ssn = s.ssn) AS mandatoryleft,
	(SELECT classification('Mathematical', s.ssn)) AS mathCredits,
	(SELECT classification('Research', s.ssn)) AS researchCredits,
	(SELECT classification('Seminar', s.ssn)) AS seminarCredits,
	(SELECT NOT EXISTS (SELECT * FROM unreadmandatory AS u WHERE u.student = s.ssn)) AS status
FROM student AS s;
