/*
This 
*/

CREATE TABLE IF NOT EXISTS student_mv (
    cin INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    school_id INTEGER,
    school_address TEXT, 
    skill TEXT,
    how_hard_is_skill TEXT
);

INSERT INTO student_mv (cin, first_name, last_name, school_id, school_address, skill, how_hard_is_skill)
VALUES ('123456789','Tom','King','145789022','2259 NotReal Ave.','English Java SQL','VE E H'),
('222444666','Sam','Pam','100200300','1234 Fake St.','Python','VH'),
('111222333','Kate','Late','999888777','4321 Noname Ave.','HTML', 'E');

SELECT COUNT(*) AS total_rows FROM student_mv;
SELECT * FROM student_mv;

CREATE TABLE IF NOT EXISTS student_rg (
    cin INTEGER,
    first_name TEXT,
    last_name TEXT,
    school_id INTEGER,
    school_address TEXT, 
    skill TEXT,
    how_hard_is_skill TEXT
);

INSERT INTO student_rg (cin, first_name, last_name, school_id, school_address, skill, how_hard_is_skill)
VALUES ('123456789','Tom','King','145789022','2259 NotReal Ave.','English','VE'),
('123456789','Tom','King','145789022','2259 NotReal Ave.','Java','E'),
('123456789','Tom','King','145789022','2259 NotReal Ave.','SQL','H'),
('222444666','Sam','Pam','100200300','1234 Fake St.','Python','VH'),
('111222333','Kate','Late','999888777','4321 Noname Ave.','HTML', 'E');

SELECT COUNT(*) AS total_rows FROM student_rg;
SELECT * FROM student_rg;

CREATE TABLE IF NOT EXISTS student_fn (
    cin INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    school_id INTEGER,
    school_address TEXT
);

INSERT INTO student_fn (cin, first_name, last_name, school_id, school_address)
SELECT cin, first_name, last_name, school_id, school_address FROM student_mv;


CREATE TABLE IF NOT EXISTS student_has_skill(
    cin INTEGER, 
    skill TEXT, 
    how_hard_is_skill TEXT,
    PRIMARY KEY(cin,skill)
);
