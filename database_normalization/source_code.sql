/*
This 
*/

CREATE TABLE IF NOT EXISTS student_mv (
    id_no INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    school_id INTEGER,
    school_address TEXT,
    school_name TEXT, 
    skill TEXT,
    skill_category TEXT,
    proficency TEXT
);

INSERT INTO student_mv (id_no, first_name, last_name, school_id, school_address, school_name, skill, skill_category, proficency)
VALUES ('123456789',
    'Tom',
    'King',
    '145789022',
    '2259 NotReal Ave.',
    'Straw Hat H.S',
    'English, Java, SQL',
    'Language, Computer Science, Computer Science',
'VH, H, M'),
('222444666',
    'Sam',
    'Pam',
    '100200300',
    '1234 Fake St.',
    'Microsoft H.S',    
    'Python',
    'Computer Science',
'VH'),
('111222333',
    'Kate',
    'Late',
    '999888777',
    '4321 Noname Ave.',
    'Github H.S',
    'HTML',
    'Computer Science', 
'VL');

SELECT COUNT(*) AS total_rows FROM student_mv;
SELECT * FROM student_mv;

CREATE TABLE IF NOT EXISTS student_rg (
    id_no INTEGER NOT NULL,
    first_name TEXT,
    last_name TEXT,
    school_id INTEGER,
    school_address TEXT,
    school_name TEXT, 
    skill TEXT,
    skill_category TEXT,
    proficency TEXT
);

INSERT INTO student_rg (id_no, first_name, last_name, school_id, school_address, school_name, skill, skill_category, proficency)
VALUES ('123456789',
    'Tom',
    'King',
    '145789022',
    '2259 NotReal Ave.',
    'Straw Hat H.S',
    'English',
    'Language',
'VH'),
('123456789',
    'Tom',
    'King',
    '145789022',
    '2259 NotReal Ave.',
    'Straw Hat H.S',
    'Java',
    'Computer Science',
'H'),
('123456789',
    'Tom',
    'King',
    '145789022',
    '2259 NotReal Ave.',
    'Straw Hat H.S',
    'SQL',
    'Computer Science',
'M'),
('222444666',
    'Sam',
    'Pam',
    '100200300',
    '1234 Fake St.',
    'Microsoft H.S',    
    'Python',
    'Computer Science',
'VH'),
('111222333',
    'Kate',
    'Late',
    '999888777',
    '4321 Noname Ave.',
    'Github H.S',
    'HTML',
    'Computer Science', 
'VL');

SELECT COUNT(*) AS total_rows FROM student_rg;
SELECT * FROM student_rg;

CREATE TABLE IF NOT EXISTS student_fn (
    id_no INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    school_id INTEGER,
    school_address TEXT,
    school_name TEXT
);

INSERT INTO student_fn (id_no, first_name, last_name, school_id, school_address, school_name)
SELECT id_no, first_name, last_name, school_id, school_address, school_name FROM student_mv;

SELECT COUNT(*) AS total_rows FROM student_fn;
SELECT * FROM student_fn;


CREATE TABLE IF NOT EXISTS student_has_skill(
    id_no INTEGER, 
    skill TEXT, 
    skill_category TEXT,
    proficency TEXT,
    PRIMARY KEY(id_no,skill)
);

INSERT INTO student_has_skill (id_no, skill, skill_category, proficency)
SELECT id_no, skill, skill_category, proficency FROM student_rg;

SELECT COUNT(*) AS total_rows FROM student_has_skill;
SELECT * FROM student_has_skill;

CREATE TABLE IF NOT EXISTS skill_t(
    skill_name TEXT PRIMARY KEY, 
    skill_category TEXT
);

INSERT INTO skill_t (skill_name, skill_category)
SELECT skill, skill_category FROM student_has_skill;

SELECT COUNT(*) AS total_rows FROM skill_t;
SELECT * FROM skill_t;

ALTER TABLE student_has_skill
DROP COLUMN skill_category;

SELECT COUNT(*) AS total_rows FROM student_has_skill;
SELECT * FROM student_has_skill;

CREATE TABLE IF NOT EXISTS school (
    school_id INTEGER PRIMARY KEY,
    school_address TEXT,
    school_name TEXT
);

INSERT INTO school (school_id, school_address, school_name)
SELECT school_id, school_address, school_name FROM student_fn;

SELECT COUNT(*) AS total_rows FROM school;
SELECT * FROM school;

CREATE TABLE IF NOT EXISTS student_school_t(
    id_no INTEGER, 
    school_id,
    PRIMARY KEY (id_no, school_id)
);

INSERT into student_school_t (id_no, school_id)
SELECT student_fn.id_no, school.school_id
FROM student_fn JOIN school
ON student_fn.school_id = school.school_id;

ALTER TABLE student_fn DROP COLUMN school_id;
ALTER TABLE student_fn DROP COLUMN school_address;
ALTER TABLE student_fn DROP COLUMN school_name;

SELECT student_fn.first_name AS Name, 
school.school_name AS School, 
school.school_address AS Address, 
skill_t.skill_name,
skill_t.skill_category,
student_has_skill.proficency
FROM student_fn JOIN student_school_t ON student_fn.id_no = student_school_t.id_no
JOIN school ON student_school_t.school_id = school.school_id
JOIN student_has_skill on student_fn.id_no = student_has_skill.id_no
JOIN skill_t on skill_t.skill_name = student_has_skill.skill;

SELECT student_fn.first_name AS Name, 
school.school_name AS School, 
school.school_address AS Address, 
skill_t.skill_name,
skill_t.skill_category,
student_has_skill.proficency
FROM student_fn JOIN student_school_t ON student_fn.id_no = student_school_t.id_no
JOIN school ON student_school_t.school_id = school.school_id
JOIN student_has_skill on student_fn.id_no = student_has_skill.id_no
JOIN skill_t on skill_t.skill_name = student_has_skill.skill
WHERE skill_t.skill_category = "Computer Science"
AND
student_has_skill.proficency != "VL";
