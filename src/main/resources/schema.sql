CREATE TABLE UserAccount (
                             USER_ID INT AUTO_INCREMENT PRIMARY KEY,
                             NAME VARCHAR(100) NOT NULL,
                             EMAIL VARCHAR(100) NOT NULL UNIQUE,
                             PASSWORD_HASH VARCHAR(255) NOT NULL
);

CREATE TABLE Category (
                          CATEGORY_ID INT AUTO_INCREMENT PRIMARY KEY,
                          NAME VARCHAR(100) NOT NULL,
                          DESCRIPTION TEXT
);

CREATE TABLE BlogPost (
                          POST_ID INT AUTO_INCREMENT PRIMARY KEY,
                          TITLE VARCHAR(200) NOT NULL,
                          CONTENT TEXT NOT NULL,
                          CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          USER_ID INT,
                          CATEGORY_ID INT,
                          FOREIGN KEY (USER_ID) REFERENCES UserAccount(USER_ID),
                          FOREIGN KEY (CATEGORY_ID) REFERENCES Category(CATEGORY_ID)
);

CREATE TABLE Comments (
                          COMMENT_ID INT AUTO_INCREMENT PRIMARY KEY,
                          CONTENT TEXT NOT NULL,
                          CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          USER_ID INT,
                          POST_ID INT,
                          FOREIGN KEY (USER_ID) REFERENCES UserAccount(USER_ID),
                          FOREIGN KEY (POST_ID) REFERENCES BlogPost(POST_ID)
);

CREATE TABLE Tag (
                     TAG_ID INT AUTO_INCREMENT PRIMARY KEY,
                     NAME VARCHAR(100) NOT NULL
);

CREATE TABLE BlogPostTag (
                             POST_ID INT,
                             TAG_ID INT,
                             PRIMARY KEY (POST_ID, TAG_ID),
                             FOREIGN KEY (POST_ID) REFERENCES BlogPost(POST_ID),
                             FOREIGN KEY (TAG_ID) REFERENCES Tag(TAG_ID)
);

CREATE TABLE Forum (
                       FORUM_ID INT AUTO_INCREMENT PRIMARY KEY,
                       TITLE VARCHAR(200) NOT NULL,
                       DESCRIPTION TEXT
);

CREATE TABLE Thread (
                        THREAD_ID INT AUTO_INCREMENT PRIMARY KEY,
                        TITLE VARCHAR(200) NOT NULL,
                        CONTENT TEXT NOT NULL,
                        CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        USER_ID INT,
                        FORUM_ID INT,
                        FOREIGN KEY (USER_ID) REFERENCES UserAccount(USER_ID),
                        FOREIGN KEY (FORUM_ID) REFERENCES Forum(FORUM_ID)
);

CREATE TABLE CodingChallenge (
                                 CHALLENGE_ID INT AUTO_INCREMENT PRIMARY KEY,
                                 TITLE VARCHAR(200) NOT NULL,
                                 DESCRIPTION TEXT NOT NULL,
                                 DIFFICULTY VARCHAR(50),
                                 CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
