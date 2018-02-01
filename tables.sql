DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE public.program(
    	"name" VARCHAR(50) NOT NULL,
    	abbreviation CHAR(4) NOT NULL,
	CONSTRAINT program_name_pkey PRIMARY KEY ("name")
);

CREATE TABLE public.department(
    	"name" VARCHAR(50) NOT NULL,
    	abbreviation CHAR(4) NOT NULL,
	CONSTRAINT department_name_pkey PRIMARY KEY ("name"),
	CONSTRAINT department_ukey UNIQUE(abbreviation)
);

CREATE TABLE hosts(
	department VARCHAR(50) NOT NULL, 
    	"program" VARCHAR(50) NOT NULL,
    	CONSTRAINT hosts_pkeys PRIMARY KEY (department, "program"),
    	CONSTRAINT hosts_department_fkey FOREIGN KEY (department) REFERENCES public.department ("name"),
    	CONSTRAINT hosts_program_fkey FOREIGN KEY ("program") REFERENCES public.program ("name")
);

CREATE TABLE student(
	ssn CHAR(12) NOT NULL, 
    	"name" VARCHAR(50) NOT NULL,
    	login VARCHAR(15) NOT NULL,
    	"program" VARCHAR(50) NOT NULL,
	CONSTRAINT student_ssn_pkey PRIMARY KEY ("ssn"),
	CONSTRAINT student_ukey UNIQUE (login),
    	CONSTRAINT student_ukeys UNIQUE(ssn, "program"),
    	CONSTRAINT student_program_fkey FOREIGN KEY ("program") REFERENCES public.program ("name")
);

CREATE TABLE branch(
    	"name" VARCHAR(50) NOT NULL,
    	"program" VARCHAR(50) NOT NULL,
	CONSTRAINT branch_pkeys PRIMARY KEY ("name", "program"),
	CONSTRAINT branch_program_program_fkey FOREIGN KEY ("program") REFERENCES public.program("name")
);

CREATE TABLE belongsTo(
    	student CHAR(12) NOT NULL,
    	branch VARCHAR(50) NOT NULL, 
    	"program" VARCHAR(50) NOT NULL,
    	CONSTRAINT belongsto_pkey PRIMARY KEY (student),
	CONSTRAINT belongsto_student_ssn_fkey FOREIGN KEY (student) REFERENCES student(ssn),
    	CONSTRAINT belongsto_student_fkeys FOREIGN KEY (student, "program") REFERENCES student("ssn", "program"),
    	CONSTRAINT belongsTo_branch_fkeys FOREIGN KEY(branch, "program") REFERENCES branch ("name", "program")
);

CREATE TABLE course(
	code CHAR(8) NOT NULL, 
    	"name" VARCHAR(50) NOT NULL,
    	credits float(1) DEFAULT 0.0 NOT NULL,
    	department VARCHAR(50) NOT NULL,
	CONSTRAINT course_code_pkey PRIMARY KEY (code),
    	CONSTRAINT course_department_fkey FOREIGN KEY ("department") REFERENCES department ("name") 
);

CREATE TABLE prerequisite(
	course VARCHAR(50) NOT NULL,
    	prerequisite VARCHAR(50) NOT NULL,
    	CONSTRAINT prerequisite_pkeys PRIMARY KEY ("course", "prerequisite"),
	CONSTRAINT prerequisite_course_course_fkey FOREIGN KEY (course) REFERENCES course(code),
	CONSTRAINT prerequisite_course_prerequisite_fkey FOREIGN KEY (prerequisite) REFERENCES course(code)
);

CREATE TABLE classification(
	"name" VARCHAR(50) NOT NULL,
	CONSTRAINT classification_pkey PRIMARY KEY ("name")
);

CREATE TABLE classified(
	course CHAR(8) NOT NULL,
    	classification VARCHAR(50) NOT NULL,
	CONSTRAINT classified_course_pkey PRIMARY KEY ("course", classification),
	CONSTRAINT classified_course_course_fkey FOREIGN KEY ("course") REFERENCES course ("code"),
	CONSTRAINT classified_classification_classification_fkey FOREIGN KEY ("classification") REFERENCES classification ("name")
);

CREATE TABLE mandatoryprogram(
	course CHAR(8) NOT NULL,
    	"program" VARCHAR(50) NOT NULL,
    	CONSTRAINT mandatoryprogram_pkeys PRIMARY KEY ("course", "program"),
	CONSTRAINT mandatoryprogram_course_course_fkey FOREIGN KEY (course) REFERENCES course (code),
	CONSTRAINT mandatoryprogram_program_program_fkey FOREIGN KEY ("program") REFERENCES public.program ("name")
);

CREATE TABLE mandatorybranch(
	course CHAR(8) NOT NULL,
    	branch VARCHAR(50) NOT NULL,
    	"program" VARCHAR(50) NOT NULL,
    	CONSTRAINT mandatorybranch_pkeys PRIMARY KEY ("course", "program", "branch"),
	CONSTRAINT mandatorybranch_course_course_fkey FOREIGN KEY (course) REFERENCES course(code),
	CONSTRAINT mandatorybranch_branch_fkeys FOREIGN KEY ("branch", "program") REFERENCES branch ("name", "program")
);

CREATE TABLE recommendedbranch(
	course CHAR(8) NOT NULL,
    	branch VARCHAR(50) NOT NULL,
    	"program" VARCHAR(50) NOT NULL,
    	CONSTRAINT recommendedbranch_pkeys PRIMARY KEY ("course", "program", "branch"),
	CONSTRAINT recommendedbranch_course_course_fkey FOREIGN KEY ("course") REFERENCES course ("code"),
	CONSTRAINT recommendedbranch_branch_fkeys FOREIGN KEY ("branch", "program") REFERENCES branch ("name", "program")
);

CREATE TABLE registered (
	student CHAR(12) NOT NULL,
    	course VARCHAR(50) NOT NULL,
    	CONSTRAINT registered_pkeys PRIMARY KEY (student, course),
	CONSTRAINT registered_student_ssn_fkey FOREIGN KEY (student) REFERENCES student (ssn),
	CONSTRAINT registered_course_course_fkey FOREIGN KEY (course) REFERENCES course (code)
);

CREATE TABLE Taken(
	student CHAR(12) NOT NULL,
    	course VARCHAR(50) NOT NULL,
    	grade CHAR(1) NOT NULL DEFAULT 'U',
    	CONSTRAINT taken_pkeys PRIMARY KEY (student, course),
	CONSTRAINT taken_student_ssn_fkey FOREIGN KEY (student) REFERENCES student ("ssn"),
	CONSTRAINT taken_course_course_fkey FOREIGN KEY (course) REFERENCES course ("code")
);

CREATE TABLE limitedcourse(
	code CHAR(8) NOT NULL,
    	seats SMALLINT DEFAULT 0 NOT NULL,
	CONSTRAINT limitedcourse_pkey PRIMARY KEY (code),
	CONSTRAINT limitedcourse_course_course_fkey FOREIGN KEY (code) REFERENCES course (code)
);

CREATE TABLE waitinglist(
	student CHAR(12) NOT NULL,
    	course CHAR(8) NOT NULL,
    	"position" SMALLINT DEFAULT 0 NOT NULL,
    	CONSTRAINT waitinglist_pkeys PRIMARY KEY (student, course),
	CONSTRAINT waitinglist_ukeys UNIQUE(course, "position"),
	CONSTRAINT waitinglist_student_student_fkey FOREIGN KEY ("student") REFERENCES student ("ssn"),
	CONSTRAINT waitinglist_limitedcourse_course_fkey FOREIGN KEY (course) REFERENCES limitedcourse (code)
);


