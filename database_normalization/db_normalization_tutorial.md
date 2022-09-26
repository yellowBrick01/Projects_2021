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

- Example:  A student’s hobby is dependent on the student. Therefore, if we create a student-hobby table will need to contain some information that will uniquely identify the student.

Here is how we are going to represent Attributive Entities in our Entity Relationship Diagram (ERD):
 
<img src = "https://user-images.githubusercontent.com/76761559/192183609-f1ded00c-0405-4020-8554-ca86a762dad7.png" width="300" height="150">

**Associative Entity**: An entity that serves as a connection between two entities with a many-to-many relationship(_discussed later_).
- Example: Many students will enroll in many courses, and many courses will contain many students. Therefore, we can create a student enrollment table to better organize the information of a student's enrollment.

Here is how we are going to represent Associative Entities in our Entity Relationship Diagram (ERD):

<img src = "https://user-images.githubusercontent.com/76761559/192187251-627f76a6-0a34-4fc3-ae0f-88d45d6f1742.png" width="300" height="150">

## Types Of Relationships
**One-to-One Relationship**: Connects one entity to one other entity.
- Example: A bussing company assigns _one_ driver to _one_ spceific bus. This means that a driver record on our database should only relate to one bus.

Here is how we are going to represent One-to-One Relationships in our Entity Relationship Diagram (ERD):

<img src = "https://user-images.githubusercontent.com/76761559/192189632-6e29e775-28d7-4b3f-ab3d-c3054c6f27f6.png" width="800" height="200">
