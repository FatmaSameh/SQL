CREATE DATABASE SocialMediaPlatform ;

USE SocialMediaPlatform;

CREATE TABLE Users (
    UserID INT IDENTITY PRIMARY KEY,
    UserName NVARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    JoinDate DATETIME DEFAULT GETUTCDATE()
);


CREATE TABLE Post (
    PostID INT IDENTITY PRIMARY KEY,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    Content NVARCHAR(100) NOT NULL,
    PostDate DATETIME DEFAULT GETUTCDATE(),
    Visibility VARCHAR(10) CHECK (Visibility IN ('Public', 'Private')) DEFAULT 'Public'
);

CREATE TABLE Interaction (
    InteractionID INT IDENTITY PRIMARY KEY,
    Type VARCHAR(10) CHECK (Type IN ('Like', 'Share', 'Love', 'Angry')) NOT NULL,
    InteractionDate DATETIME DEFAULT GETUTCDATE()
);


CREATE TABLE Comment (
    CommentID INT IDENTITY PRIMARY KEY,
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE,
    CommentDate DATETIME DEFAULT GETUTCDATE(),
    Content NVARCHAR(255) NOT NULL
);

CREATE TABLE Interact (
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    InteractionID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE,
    FOREIGN KEY (InteractionID) REFERENCES Interaction(InteractionID) ON DELETE CASCADE
);



INSERT INTO Users (UserName, DOB, Email, Gender) VALUES
('Ali Mohamed', '1995-06-15', 'ali@example.com', 'Male'),
('Sara Ahmed', '1998-09-25', 'sara@example.com', 'Female');


INSERT INTO Post (UserID, Content) VALUES
(1, 'Hello,This is mu first post'),
(2, 'I love this');


INSERT INTO Interaction (Type) VALUES
('Like'), ('Share'), ('Love');
 

INSERT INTO Comment (UserID, PostID, Content) VALUES
(1, 1, 'Perfect!'),
(2, 2, 'like that');


INSERT INTO Interact (UserID, PostID, InteractionID) VALUES
(1, 2, 3);



DROP TABLE Users;

DROP DATABASE SocialMediaPlatform;
