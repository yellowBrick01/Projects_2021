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
SELECT id_no, first_name, last_name, school_id, school_address, school_name FROM student_mv;;

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
