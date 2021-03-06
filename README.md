# Databases-Postgresql

## Purpose

The purpose of this assignment is to give you hands-on experience with designing, constructing and using a database for a real-world-like domain. You will see all aspects of database creation, from understanding the domain to using the final database from external applications.

## Domain description

 The domain that you will model in this assignment is that of courses and students at a university. So as not to make the task too large and unspecified, you will here get a description of the domain that restricts the problem somewhat. Note that the described domain is not identical to Chalmers or GU.

The university for which you are building this system is organized into departments for employees, such as the Dept. of Computing Science (CS), and study programmes for students, such as the Computer Science and Engineering programme (CSEP). Programmes are hosted by departments, but several departments may collaborate on a programme, which is the case with CSEP that is co-hosted by the CS department and the Department of Computer Engineering (CE). Department names and abbreviations are unique, as are programme names but not necessarily abbreviations.

Each study programme is further divided into branches, for example CSEP has branches Computer Languages, Algorithms, Software Engineering etc. Note that branch names are unique within a given programme, but not necessarily across several programmes. For instance, both CSEP and a programme in Automation Technology could have a branch called Interaction Design. For each study programme, there are mandatory courses. For each branch, there are additional mandatory courses that the students taking that branch must read. Branches also name a set of recommended courses from which all students taking that branch must read a certain amount to fulfill the requirements of graduation, see below.

A student always belongs to a programme. Students must pick a single branch within that programme, and fulfill its graduation requirements, in order to graduate. Typically students choose which branch to take in their fourth year, which means that students who are in the early parts of their studies may not yet belong to any branch.

Courses are given by a department (e.g. CS gives the Databases course), and may be read by students reading any study programme. Some courses may be mandatory for certain programmes, but not so for others. Students get credits for passing courses, the exact number may vary between courses (but all students get the same number of credits for the same course). Some, but not all, courses have a restriction on the number of students that may take the course at the same time. Courses can be classified as being mathematical courses, research courses or seminar courses. Not all courses need to be classified, and some courses may have more than one classification. The university will occasionally introduce other classifications. Some courses have prerequisites, i.e. other courses that must be read before a student is allowed to register to it.

Students need to register for courses in order to read them. To be allowed to register, the student must first fulfill all prerequisites for the course. It should not be possible for a student to register to a course unless the prerequisite courses are already passed. It should not be possible for a student to register for a course which they have already passed.

If a course becomes full, subsequent registering students are put on a waiting list. If one of the previously registered students decides to drop out, such that there is an open slot on the course, that slot is given to the student who has waited the longest. When the course is finished, all students are graded on a scale of 'U', '3', '4', '5'. Getting a 'U' means the student has not passed the course, while the other grades denote various degrees of success.

A study administrator can override both course prerequisite requirements and size restrictions and add a student directly as registered to a course. (Note: you will not implement any front end application for study administrators, only for students. The database must still be able to handle this situation.)

For a student to graduate there are a number of requirements she must first fulfill. She must have passed (have at least grade 3) in all mandatory courses of the study programme she belongs to, as well as the mandatory courses of the particular branch that she must have chosen. Also she must have passed at least 10 credits worth of courses among the recommended courses for the branch. Furthermore she needs to have read and passed (at least) 20 credits worth of courses classified as mathematical courses, 10 credits worth of courses classified as research courses, and one seminar course. Mandatory and recommended courses that are also classified in some way are counted just like any other course. As an example, if one of the mandatory courses of a programme is also a seminar course, students of that programme will not be required to read any more seminar courses. 

## Constructing the database

 You should implement the schema with CREATE TABLE statements that

- use exactly the given table and attribute names
- express the same primary key, foreign key, and uniqueness constraints
- use reasonable types (not expressed in the abstract schema, but should be obvious from the domain description)
- no column may accept NULL values 
 
  Thus you should create all tables, marking key and foreign key constraints in the process, and you should also insert checks that ensure that only valid data can be inserted in the database. Examples of invalid data would be the grade '6', or a course that takes a negative number of students.

When you have created the tables, you should fill the tables with example data. This can be time-consuming, but it is an important part of the development of a database. Having data in the database is crucial in order to properly verify that it behaves the way that you expect it to. You should fill the tables with enough data so that it is possible to test that your application can handle the various operations specified above. Just inserting tons of data is of no use if the data still doesn't test all parts of the database. Here is a (very) non-exhaustive list of data you will need to include:

- A handful of students, at least one of which fulfils the requirements for graduation and a couple that do not for different reasons.
- A number of courses that test all of the various aspects a course. This includes classifications, mandatory, recommended etc. You need at least three waiting students for two different (limited) courses. 

Important: When you insert data in the database, do it by writing the insert statements in a file that can then be executed. This way you won't have to re-do all the work if there is something that you need to change with the table.

Since you know exactly what information your application will need from the database, in what forms, it is a good idea to write views that provide that information in a simple form. In a real setting, we would even ensure using privileges that the application cannot work with anything but these views. Unfortunately we cannot let you test working with privileges on the PostgreSQL machine we use, but we will still expect your application to adhere to the privileges we list.

Following the system specification, create these views:

- View: **StudentsFollowing**(student, program, branch) For all students, their SSN, the program and the branch (if any) they are following. The branch column is the only column in any of the views that is allowed to be NULLABLE.
- View: **FinishedCourses**(student, course, grade, credits) For all students, all finished courses, along with their codes, grades (grade 'U', '3', '4' or '5') and number of credits. The type of the grade should be a character type, e.g. TEXT.
- View: **Registrations**(student, course, status) All registered and waiting students for all courses, along with their waiting status ('registered' or 'waiting').
* View: **PassedCourses**(student, course, credits) For all students, all passed courses, i.e. courses finished with a grade other than 'U', and the number of credits for those courses. This view is intended as a helper view towards the PathToGraduation view (and for task 4), and will not be directly used by your application.
* View: **UnreadMandatory**(student, course) For all students, the mandatory courses (branch and programme) they have not yet passed. This view is intended as a helper view towards the PathToGraduation view, and will not be directly used by your application.
* View: **PathToGraduation**(student, totalCredits, mandatoryLeft, mathCredits, researchCredits, seminarCourses, status) For all students, their path to graduation, i.e. a view with columns for - ssn: the student's SSN. - totalCredits: the number of credits they have taken. - mandatoryLeft: the number of courses that are mandatory for a branch or a program they have yet to read. - mathCredits: the number of credits they have taken in courses that are classified as math courses. - researchCredits: the number of credits they have taken in courses that are classified as research courses. - seminarsCourses: the number of seminar courses they have read. - status: whether or not they qualify for graduation. The SQL type of this field should be BOOLEAN (i.e. TRUE or FALSE).

Make sure that your views use the right names of columns! Use AS to name a column.

Deliverables: For task 1, you should submit the following files through Fire

* tables.sql: your SQL code for creating the tables.
* insert.sql: your SQL code containing the insert statements for the data.
* views.sql: your SQL code for creating the listed views. 
