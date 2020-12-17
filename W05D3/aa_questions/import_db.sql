PRAGMA foreign_keys = ON; -- makes SQLite respect foreign keys

DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS questions;

DROP TABLE IF EXISTS question_follows;

DROP TABLE IF EXISTS replies;

DROP TABLE IF EXISTS question_likes;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255)
);

INSERT INTO 
  users(fname, lname) 

VALUES ('Ned', 'Smith'), ('Kush', 'Williams'), ('Earl', 'Anderson');

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    body TEXT(999),
    associated_author_id INTEGER,

    FOREIGN KEY (associated_author_id) REFERENCES users(id)
);

INSERT INTO 
  questions (title, body, associated_author_id) 

VALUES ('Ned Question', 'BODY OF NED QUESTION', 1), ('Kush Question', 'BODY OF KUSH QUESTION', 2), ('Earl Question', 'BODY OF EARL QUESTION', 3);

CREATE TABLE questions_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    parent_id INTEGER,--is this null if this is top-level reply?
    user_id INTEGER,
    body TEXT,
    
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
  replies (body, question_id, parent_id, user_id) 

VALUES ('Reply#1 to Ned question#1', 1, NULL, 1), ('Reply#1 to Kush Question#1', 2, NULL, 2), ('Reply#1 to Earl question#1', 3, NULL, 3), ('Reply#2 to Ned question#1', 1, 1, 1), ('Reply#2 to Kush Question#1', 2, 2, 2), ('Reply#2 to Earl question#1', 3, 3, 3);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,
    
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
  question_likes (question_id, user_id) 

VALUES (1, 1);