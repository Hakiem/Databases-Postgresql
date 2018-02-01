------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW StudentFollowing -------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW StudentsFollowing AS 
	SELECT s.ssn AS student, s.program, (SELECT branch FROM belongsto b WHERE b.student = s.ssn AND b.program = s.program) AS branch FROM student s;

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW FinishedCourses --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW FinishedCourses AS
	SELECT s.ssn AS student,t.course, grade::TEXT, credits FROM taken as t 
	INNER JOIN student as s ON (s.ssn = t.student)
	INNER JOIN course as c ON (c.code = t.course);

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW Registration --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE  VIEW Registrations AS	
	SELECT r.student, r.course, 'registered' As status 
		FROM registered as r JOIN course c ON(c.code = r.course)
	UNION 
	SELECT w.student AS student, w.course, 'waiting' As status 
		FROM waitinglist AS w JOIN course c ON(c.code = w.course);

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW PassedCourses	--------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW PassedCourses AS
	SELECT student, t.course, credits FROM taken t
	JOIN course c ON c.code = t.course
WHERE t.grade <> 'U';

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW UnreadMandatory --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW UnreadMandatory AS 
	SELECT a.ssn AS student, courseslist AS course FROM 
	(
		SELECT s.ssn, m.course::text AS courseslist
			FROM student s
			LEFT JOIN mandatoryprogram m USING (program)
		WHERE m.course NOT IN (SELECT t.course FROM taken t WHERE grade <> 'U' AND t.student = s.ssn)
		GROUP BY s.ssn, m.course
	UNION
		SELECT s.ssn, v.course::text AS courseslist
			FROM student s
			LEFT JOIN mandatorybranch v USING(program)
		WHERE branch = (SELECT branch FROM belongsto b WHERE b.student = s.ssn AND b.program = s.program) 
			AND v.course NOT IN (SELECT t.course FROM taken t WHERE grade <> 'U' AND t.student = s.ssn)
		GROUP BY s.ssn, v.course
	) AS a 
GROUP BY a.ssn, a.courseslist;

------------------------------------------------------------------------------------------------------------------------
-------------------- VIEW PathToGraduation --------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW PathToGraduation AS
SELECT 
	s.ssn AS student,
	(SELECT COALESCE(SUM(credits), 0) AS credo FROM passedcourses AS p WHERE p.student = s.ssn) AS  totalCredits,
	(SELECT COUNT(*) FROM unreadmandatory WHERE student = s.ssn) AS mandatoryLeft,
	(SELECT COALESCE(SUM(credits),0) FROM passedCourses JOIN classified USING (course) WHERE student = s.ssn AND classification = 'Mathematical')  AS mathCredits,
	(SELECT COALESCE(SUM(credits),0) FROM passedCourses JOIN classified USING (course) WHERE student = s.ssn AND classification = 'Research') AS researchCredits,
	(SELECT COUNT(*) FROM passedCourses JOIN classified USING (course) WHERE student = s.ssn AND classification = 'Seminar') AS seminarCourses,
	(
		-- Check for all passed courses as per student program
		(SELECT COUNT(*) FROM passedCourses JOIN mandatoryprogram USING (course) WHERE student = s.ssn AND program = s.program) 
			= (SELECT COUNT(*) FROM mandatoryprogram WHERE program = s.program) AND

		-- Check for all passed courses as per student program chosen branch
		(SELECT COUNT(*) FROM passedCourses JOIN mandatorybranch USING (course) WHERE student = s.ssn AND program = s.program) 
			= (SELECT COUNT(*) FROM mandatorybranch WHERE program = s.program AND branch = 
				(SELECT branch from belongsto b WHERE b.student = s.ssn AND program = program)) AND

		-- Check that at least 10 Credit Units among recommendedCourses are passed
		(SELECT COALESCE(SUM(credits),0) >= 10 FROM passedCourses JOIN recommendedbranch USING(course) WHERE student = s.ssn AND program = s.program AND 
			branch = (SELECT branch from belongsto b WHERE b.student = s.ssn AND program = s.program)) AND

		-- Check that at least 20 Credit Units among Courses classified as Mathematical are passed
		(SELECT COALESCE(SUM(credits),0) >= 20 FROM passedCourses JOIN classified USING (course) WHERE student = s.ssn AND classification = 'Mathematical') AND

		-- Check that at least 10 Credit Units among Courses classified as Research are passed
		(SELECT COALESCE(SUM(credits),0) >= 10 FROM passedCourses JOIN classified USING (course) WHERE student = s.ssn AND classification = 'Research') AND

		-- Check that at least 1 Credit Units among Courses classified as Seminar are passed
		(SELECT COALESCE(SUM(credits),0) >= 1 FROM passedCourses JOIN classified USING (course) WHERE student = s.ssn AND classification = 'Seminar')
	) AS status
FROM student AS s;

