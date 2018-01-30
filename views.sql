------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW StudentFollowing -------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW StudentFollowing AS 
	SELECT s.ssn, s.program, b.name AS branch FROM student AS s, branch AS b;

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
	SELECT s.ssn,
		ConcatCourseCodeAndCourseName(t.course, c.name) AS course, 
		(grade::TEXT) AS grade, 
		CASE WHEN grade = 'U' THEN 0 ELSE credits END AS credits FROM taken as t 
	INNER JOIN student as s ON (s.ssn = t.ssn)
	INNER JOIN course as c ON (c.code = t.course);

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW Registration --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE  VIEW Registrations AS	
	SELECT r.ssn, ConcatCourseCodeAndCourseName(r.course, c.name) AS course, 'Registered' As status 
	FROM registered as r JOIN course c ON(c.code = r.course)
	UNION 
	SELECT w.student, ConcatCourseCodeAndCourseName(w.course, c.name) AS course, 'Waiting' As status 
	FROM waitinglist AS w JOIN course c ON(c.code = w.course);

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW PassedCourses	--------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW PassedCourses AS
	SELECT ssn, t.course AS course, credits FROM taken t
	JOIN course c ON c.code = t.course
WHERE t.grade <> 'U';

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW UnreadMandatory --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW UnreadMandatory AS 
	SELECT k.ssn, array_agg(k.courseslist) AS course
		FROM ( SELECT s.ssn, m.course::text AS courseslist
				FROM student s
				JOIN mandatoryprogram m USING (program)
				GROUP BY s.ssn, m.course) k
	WHERE NOT (k.courseslist IN ( 
			SELECT t.course
			FROM taken t
			WHERE t.ssn = k.ssn AND t.grade <> 'U'::greid)
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
			JOIN classified AS h ON (h.course = k.course) WHERE k.ssn = sssn AND classification = classif);
	ELSE
		kount := (SELECT COALESCE(SUM(credits), 0) FROM passedcourses AS k 
			JOIN classified AS h ON (h.course = k.course) WHERE k.ssn = sssn AND classification = classif);
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
	(SELECT COALESCE(SUM(credits), 0) AS credo FROM passedcourses AS p WHERE p.ssn = s.ssn) AS  totalCredits,
	(SELECT array_length(course, 1) FROM unreadmandatory AS u WHERE u.ssn = s.ssn) AS mandatoryleft,
	(SELECT classification('Mathematical', s.ssn)) AS MathCredits,
	(SELECT classification('Research', s.ssn)) AS ResearchCredits,
	(SELECT classification('Seminar', s.ssn)) AS SeminarCredits,
	((CASE WHEN EXISTS (SELECT NOT EXISTS (SELECT * FROM unreadmandatory AS u WHERE u.ssn = s.ssn)) 
		THEN 'FALSE' 
		ELSE 'TRUE' END)::text) AS status
FROM student AS s;
