# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peoplesrole;
DROP TABLE IF EXISTS roles;

# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skill_id int NOT NULL,
    skill_name varchar(256) NOT NULL,
    skill_description TEXT NOT NULL,
    skill_tag varchar(256) NOT NULL,
    skill_url varchar(256),
    skill_timecommit int,
    PRIMARY KEY (skill_id)
);



# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!


INSERT INTO skills(skill_id, skill_name, skill_description, skill_tag, skill_url, skill_timecommit) VALUES
(1, "Juggling", "Throwing things up and not letting them fall. Warning: May involve throwing bananas.", "juggling", "juggling.com", 3),
(2, "Tightrope Walking", "Balancing on a thin line high above the ground without freaking out. Safety net not included.", "tightrope", "tightrope.com", 4),
(3, "Clowning", "Making people laugh without saying a word. Red nose and oversized shoes optional but highly recommended.", "clowning", "clowninglol.com", 5),
(4, "Aerial Silk Dancing", "Twirling gracefully in the air while wrapped in beautiful fabrics. May cause serious envy in birds.", "aerial-silk", "aerial.com", 4),
(5, "Fire Breathing", "Extinguishing birthday candles with style. Warning: Don't try this at home, or anywhere for that matter.", "fire-breathing", "firebreathingg.com", 2),
(6, "Acrobatics", "Doing flips, spins, and twists without turning into a human pretzel. Spandex not mandatory, but preferred.", "acrobatics", "acrobatics.com", 4),
(7, "Hula Hooping", "Swirling hoops around various body parts like it's the world's most stylish exercise routine. Hipster sunglasses recommended.", "hula-hooping", "hulahula.com", 3),
(8, "Human Cannonball", "Being launched through the air in a giant cannon. Helmet and an adventurous spirit required. Potential for superhero status.", "cannonball", "cannonballwoooo.com", 6);


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_last_name varchar(256) NOT NULL,
    people_first_name varchar(256),
    people_email varchar(256),
    people_linkedin_url varchar(256),
    people_headshot_url varchar(256),
    people_discord_handle varchar(256),
    people_brief_bio varchar(256), 
    people_date_joined DATETIME NOT NULL, 
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

-- insert into people (people_id,people_last_name) values (1,'Person 1'), (2,'Person 2');


INSERT INTO people (people_id, people_last_name, people_first_name, people_email, people_linkedin_url, people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined)
VALUES 
(1, 'Person 1', 'Alice', 'alice@email.com', 'linkedin.com/alice', 'headshots.com/alice', 'Alice#1234', 'I love coding and hiking!', NOW()),
(2, 'Person 2', 'Bob', 'bob@email.com', 'linkedin.com/bob', 'headshots.com/bob', 'Bob#5678', 'Passionate about music and cooking!', NOW()),
(3, 'Person 3', 'Charlie', 'charlie@email.com', 'linkedin.com/charlie', 'headshots.com/charlie', 'Charlie#9101', 'Tech enthusiast and coffee lover!', NOW()),
(4, 'Person 4', 'Diana', 'diana@email.com', 'linkedin.com/diana', 'headshots.com/diana', 'Diana#2345', 'Art and travel make life worthwhile!', NOW()),
(5, 'Person 5', 'Eve', 'eve@email.com', 'linkedin.com/eve', 'headshots.com/eve', 'Eve#6789', 'Fitness freak and bookworm!', NOW()),
(6, 'Person 6', 'Frank', 'frank@email.com', 'linkedin.com/frank', 'headshots.com/frank', 'Frank#3456', 'Film buff and amateur chef!', NOW()),
(7, 'Person 7', 'Grace', 'grace@email.com', 'linkedin.com/grace', 'headshots.com/grace', 'Grace#7890', 'Nature lover and yoga enthusiast!', NOW()),
(8, 'Person 8', 'Henry', 'henry@email.com', 'linkedin.com/henry', 'headshots.com/henry', 'Henry#1234', 'Software developer and avid reader!', NOW()),
(9, 'Person 9', 'Isabella', 'isabella@email.com', 'linkedin.com/isabella', 'headshots.com/isabella', 'Isabella#5678', 'Art and music inspire me!', NOW()),
(10, 'Person 10', 'Jack', 'jack@email.com', 'linkedin.com/jack', 'headshots.com/jack', 'Jack#9101', 'Adventure seeker and photography enthusiast!', NOW()),
(11, 'Person 11', 'Katherine', 'katherine@email.com', 'linkedin.com/katherine', 'headshots.com/katherine', 'Katherine#2345', 'Fashion lover and DIY enthusiast!', NOW());


# Section 6
# Create peopleskills( id, skill_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id),
    skill_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE default (current_date),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id) on delete cascade,
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    unique (skill_id,people_id)
);



# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

-- Inserting records for people and their associated skills
INSERT INTO peopleskills (people_id,skill_id, date_acquired) VALUES
    (1,1, '2022-08-19'),
    (1,3, '2022-02-11'),
    (1,6, '2023-02-14'),
    (2,3, '2022-01-09'),
    (2,4, '2018-12-12'),
    (2,5, '2021-08-19'),
    (3,1, '2022-07-21'),
    (3,5, '2020-01-02'),
    (5,3, '2019-08-04'),
    (5,6, '2020-04-19'),
    (6,2, '2016-12-22'),
    (6,3, '2022-08-19'),
    (6,4, '2022-08-18'),
    (7,3, '2017-06-12'),
    (7,5, '2011-04-19'),
    (7,6, '2023-08-07'),
    (8,1, '2022-08-19'),
    (8,3, '2021-08-19'),
    (8,5, '2022-08-09'),
    (8,6, '2022-08-19'),
    (9,2, '2018-05-19'),
    (9,5, '2022-08-20'),
    (9,6, '2022-05-19'),
    (10,1,'2017-02-09'),
    (10,4, '2022-08-17'),
    (10,5, '2023-04-19');

 
 
# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(256) NOT NULL,
    sort_priority INT NOT NULL
);




# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (name, sort_priority) VALUES
('Designer', 10),
('Developer', 20),
('Recruit', 30),
('Team Lead', 40),
('Boss', 50),
('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATETIME NOT NULL,
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

-- Inserting records for role assignments
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
(1, 2, NOW()), -- Person 1 is a Developer
(2, 5, NOW()), -- Person 2 is a Boss
(2, 6, NOW()), -- Person 2 is also a Mentor
(3, 2, NOW()), -- Person 3 is a Developer
(3, 4, NOW()), -- Person 3 is also a Team Lead
(4, 3, NOW()), -- Person 4 is a Recruit
(5, 3, NOW()), -- Person 5 is a Recruit
(6, 2, NOW()), -- Person 6 is a Developer
(6, 1, NOW()), -- Person 6 is also a Designer
(7, 1, NOW()), -- Person 7 is a Designer
(8, 1, NOW()), -- Person 8 is a Designer
(8, 4, NOW()), -- Person 8 is also a Team Lead
(9, 2, NOW()), -- Person 9 is a Developer
(10, 2, NOW()), -- Person 10 is a Developer
(10, 1, NOW()); -- Person 10 is also a Designer


select * FROM skills;