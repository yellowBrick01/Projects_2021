# Relational Database Normalization
###### Presented By: Raymond Delgado

## Topics Covered
- Types of entities
- Types of keys
- Normal Forms 1 - 3
- Case Study: How to transform an unnormalized table into third normal form.
- Introduction to database denormalization

## Learning Objectives
At the end of this tutorial, you would be **able to**:
- Know the different types of entities, relationships, and keys
- Define Normal Forms 1—3
- Transform an unnormalize database into into third normal form.
- Be familiar with the concept of database denormalization and why denormalization would be utilized.

## Types Of Entities
The first thing that you should know is that within a relational database, all entities are presented as tables.  Therefore, it would be helpful to think of entities as a table that you might see in an Excel spreadsheet. Moreover, many people will use the terms "entity" and "table" interchangeably.

Here is an example of a student entity/table on SQLite Studio:

<img src = "https://user-images.githubusercontent.com/76761559/192178228-620680a0-9373-48ad-8f27-3fbe62d00a5a.PNG" width="400" height="200">

This student entity (or table) contains three fields (or table columns) and  three records (or table rows).

**Entity/Fundamental Entity**: Any object(people, places,  or things) that are relevant to the database and that we want to store information about.
- Example: Students, Countries, Movies

Here is how we are going to represent Fundamental Entities in our Entity Relationship Diagram (ERD):

<img src = "https://user-images.githubusercontent.com/76761559/192182252-01c02a38-1a85-4ed2-ad37-20f0f3711f8a.png" width="300" height="150">

**Attributive Entity**: An entity that depends on another entity for parts of its primary key(_discussed later_).

- Example: A student’s hobby is dependent on the student. Therefore, if we create a student-hobby table will need to contain some information that will uniquely identify the student.

Here is how we are going to represent Attributive Entities in our Entity Relationship Diagram (ERD):
 
<img src = "https://user-images.githubusercontent.com/76761559/192183609-f1ded00c-0405-4020-8554-ca86a762dad7.png" width="300" height="150">

**Associative Entity**: An entity that serves as a connection between two entities with a many-to-many relationship(_discussed later_).
- Example: Many students will enroll in many courses, and many courses will contain many students. Therefore, we can create a student enrollment table to better organize the information of a student's enrollment.

Here is how we are going to represent Associative Entities in our Entity Relationship Diagram (ERD):

<img src = "https://user-images.githubusercontent.com/76761559/192187251-627f76a6-0a34-4fc3-ae0f-88d45d6f1742.png" width="300" height="150">

## Types Of Relationships
**One-to-One Relationship**: Connects _one_ record from an entity to _one_ record of  antother entity.
- Example: A bussing company assigns one driver to one spceific bus. This means that a driver record on our database should only relate to one bus.

Here is how we are going to represent One-to-One Relationships in our Entity Relationship Diagram (ERD):

<img src = "https://user-images.githubusercontent.com/76761559/192189632-6e29e775-28d7-4b3f-ab3d-c3054c6f27f6.png" width="800" height="200">

**One-to-Many Relationship**: Connects _one_ record from an entity to _one or more_ records of another entity.
- Example: An owner can own one or many vehicles. This means that an owner record on our database could relate to one or more vehicles.

Here is how we are going to represent One-to-Many Relationships in our Entity Relationship Diagram (ERD):

<img src = "https://user-images.githubusercontent.com/76761559/192195525-480f2a0a-8e9f-4ba2-86e7-e06dd3cacd19.png" width="800" height="200">

**Many-to-Many Relationship**: Connects _one or many_ records from an entity to _one or more_ records of another entity.
- Warning: Many-to-Many relationships create data redundancy and may cause inaccuracies in the results of queries. Thus, it is recommended to create an Assocaitve Entity to transform the Many-to-Many relationship into two One-to-Many relationships.
- Example: Many students will be enrolled in many high school courses.
  - Bad Practice: Many records of the student entity will be related to many records in the course entity.
  - Good Practice: A student enrollment entity will be placed between the student and course entities. This will allow the database to better manage the students' course enrollment because the student enrollment entity will many records  that corresponds to a specific student and a specific course.

Here is how we are going to represent Many-to-Many Relationships without an Assocaitve Entity in our ERD -- Not recommend:

<img src = "https://user-images.githubusercontent.com/76761559/192199822-0bf39d9c-96a2-4f37-aa66-5ad1b1e5f82f.png" width="800" height="200">

Here is how we are going to represent Many-to-Many Relationships with an Assocaitve Entity in our ERD -- Recommend:

<img src = "https://user-images.githubusercontent.com/76761559/192200452-a2dccc04-2347-4eff-94e6-ac454a3871e3.png" width="800" height="200">

## Types of Keys
The first thing that you must know is that all types of keys in a relational database must be unique and not null.

**Primary Key**: A unique field that identifies a specific record of an entity.

**Candidate Key**: Any field or collection of fields that could serve as the primary key of an entity.

**Foreign Key**: The primary key of a different entity that is used to establish relations between entities.

**Composite Key**: Two or more fields that are used to identify a specific record of an entity.
- *Reminder*: A traditional primary key consists of a single field, and a composite key consists of multiple fields.

## Normal Forms 1--3
Before we begin, we must remember that database normalization is a sequential process. This means that a database cannot achieve a higher normal form without first achieving the previous normal form.
- Example: A requirement for Second Normal Form is achieving First Normal Form.

### 1st Normal Form
The first step to making a properly normalized database.

**Rule**: No Repeating Groups/ Multivalued Attributes in the database.
- *Repeating Groups*: A repeating set of values that occurred with an entity.
- *Multivalued Attributes*: A record that contains multiple values of a field(s).
   - Note: Please review "Appendix 01: Multivalued Attributes V.S Repeating Groups" for details about the difference between Repeating Groups and Multivalued Attributes

**Process**: Remove the Repeating Groups and/or Multivalued Attributes and places them into a new entity.

### 2nd Normal Form
**Rule**: Must be in 1st normal form & cannot have partial dependencies
- *Partial Dependency*: An attribute is functionally dependent on part of a record's key, not the whole key.

**Process**: create a new entity. Convert an attributive entity to an associative entity.

### 3rd Normal Form
**Rule**: Must be in 2nd normal form & cannot have any transitive dependencies
- *Transitive Dependency*: A non-key field is dependent on another non-key field.

**Process**: Create a new entity that contains the fields that form the transitive dependency.

## Case Study: Normalize this unnormalized Student Table

### Before we begin
The following case study focuses on how to normalize an unnormalized table.

- Meaning, the case study does not represent a finished database.
- The following SQL statements lack key features, most notable the needed constraints

Technology used to create this case study:
- The following SQL statment are written in SQLite
  - Click [here](https://www.sqlite.org/index.html) to learn more about SQLite.
  - Click [here](https://github.com/yellowBrick01/Projects_2021/blob/main/database_normalization/source_code.sql) to see the source code used in this document
- I am using SQLiteStudio to run the SQL statements.
  - Click [here](https://sqlitestudio.pl/) to learn more about SQLiteStudio

## Case Study: Normalize this unnormalized Student Table
### Stage 01: Going from an unnormalized table  to 1st Normal Form
Let us begin our case study by creating and inserting data into the unnormalized student table.

```
/*
This SQL statement to create an unnormalized Student table that utilizes repeating groups.
*/
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
```

```
/*
This SQL statement to insert data into the unnormalized Student table that utilizes repeating groups.
*/
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

```

Now let us run some queries to test our new table.

```
/*
Returns the total number of rows(records) in the unnormalized Student table that utilizes repeating groups..
*/
SELECT COUNT(*) AS total_rows FROM student_rg;
```

Here is the result:

<img src = "https://user-images.githubusercontent.com/76761559/197426241-49d170ff-8223-4469-ba8e-c5009cf741d9.PNG" width="400" height="200">

```
/*
Returns all the rows(records) in the unnormalized Student table that utilizes repeating groups.
*/
SELECT * FROM student_rg;
```

Here is the result:

![Capture_DN04](https://user-images.githubusercontent.com/76761559/197427132-408002b2-5b02-4a2c-b4f7-0e8bdad6da9a.PNG)


## A  brief introduction to Database Denormalization
Do not think Database Denormalization as simply the opposite of database normalization or the absence of database normalization.
The process of database denormalization is adding data redundancy in the database to meet any speed and optimization requirements set for the database (SELECT statements).

*Benefit*: 
- Simple SELECT statements and faster data retrieval
- No need for many join statements to retrieve the requested data.

*Warning*: Inserting and managing data will be more complex due to the data redundancy.

## Appendix
### Appendix 01: Multivalued Attributes V.S Repeating Groups
As stated before, we go into detail on the main differences between Repeating Groups and Multivalue Attributes by studying the unnormalized student table.

First, let us create the two unnormalized student tables and insert values into them:
```
/*
This SQL statement to create an unnormalized Student table that utilizes multivalue attributes.
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
```

```
/*
This SQL statement to insert data into the unnormalized Student table that utilizes multivalue attributes.
*/

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
```

```
/*
This SQL statement to create an unnormalized Student table that utilizes repeating groups.
*/
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
```

```
/*
This SQL statement to insert data into the unnormalized Student table that utilizes repeating groups.
*/
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

```

Now that we have created our two unnormalized student tables, let us run some queries to compare them.

```
/*
Returns the total number of rows(records) in the unnormalized Student table that utilizes multivalue attributes.
*/
SELECT COUNT(*) AS total_rows FROM student_mv;
```

Here is the result:

<img src = "https://user-images.githubusercontent.com/76761559/197420343-274b59dd-d33c-4e1f-842a-d0cc27bb0f06.PNG" width="400" height="200">


```
/*
Returns all the rows(records) in the unnormalized Student table that utilizes multivalue attributes.
*/
SELECT * FROM student_mv;
```

Here is the result:

![Capture_DN02](https://user-images.githubusercontent.com/76761559/197421281-06934be4-5acf-45cb-994e-fa58d968f471.PNG)

Note the highlighted section of our results. The school has identified that Tom has three skills(English,  Java, SQL). The database users decided to put all the information of skills into a single record.

*Benefit*:
- Can use Tom's ID number as the primary key of their record since they only have a single record.
Speed of processing is faster because there a fewer records. 

*Drawback*: 
- Query/updates will be error-prone due to the extra data within the fields
  - Example: It will be difficult to get only the information related to Tom's Java knowledge

```
/*
Returns the total number of rows(records) in the unnormalized Student table that utilizes repeating groups..
*/
SELECT COUNT(*) AS total_rows FROM student_rg;
```

Here is the result:

<img src = "https://user-images.githubusercontent.com/76761559/197426241-49d170ff-8223-4469-ba8e-c5009cf741d9.PNG" width="400" height="200">

```
/*
Returns all the rows(records) in the unnormalized Student table that utilizes repeating groups.
*/
SELECT * FROM student_rg;
```

Here is the result:

![Capture_DN04](https://user-images.githubusercontent.com/76761559/197427132-408002b2-5b02-4a2c-b4f7-0e8bdad6da9a.PNG)

Note the highlighted section of our results. This time, the database designers decide to create a new record for Tom's different skills.

*Benefit*:
- It is now possible to isolate information about Tom's different skills.

*Drawbacks*: 
- Cannot use Tom's ID number because it is no longer unique
- The processing speed is slow due to added rows.
- Queries/Updates are error-prone because of the repeating information is found in many areas.
