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

Here is an example of a student entity/table on SQLLite Studio:

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
