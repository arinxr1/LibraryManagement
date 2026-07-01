CREATE DATABASE LibraryManagement;

USE LibraryManagement;


CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(100) NOT NULL,
    Biography TEXT
);


CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    PublishYear YEAR,
    Category VARCHAR(50),
    StatusBook VARCHAR(20) DEFAULT 'Available',
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);


CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    MemberName VARCHAR(100) NOT NULL,
    PhoneNumber CHAR(10),
    Email VARCHAR(100)
);


CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);


CREATE INDEX idxBookTitle
ON Books (Title);

CREATE INDEX idxMember
ON Borrowings (MemberID);

INSERT INTO Authors (AuthorName, Biography)
VALUES
('Ghazi Al Gosaibi',
'Saudi writer, poet, diplomat and former minister. He is well known for his literary works, management books, and contributions to public administration.'),

('Badr bin Abdulmohsen',
'Saudi poet and lyricist, widely recognized as one of the greatest contemporary Arab poets.');


INSERT INTO Books
(Title, PublishYear, Category, StatusBook, AuthorID)
VALUES
('Life in Administration',1998,'Management','Available',1),

('Abu Shalakh Al Barmaei',1983,'Novel','Borrowed',1),

('Gardens of Sunset',1995,'Poetry','Available',2),

('The Last Voyage',2001,'Poetry','Available',2);


INSERT INTO Members
(MemberName, PhoneNumber, Email)
VALUES
('Ahmed Ali','0551234567','ahmed@email.com'),

('Arin Mohammed','0557654321','arin@email.com'),

('Faisal Khalid','0559998888','faisal@email.com');


INSERT INTO Borrowings
(BookID, MemberID, BorrowDate, ReturnDate)
VALUES
(2,1,'2026-07-01','2026-07-15'),

(3,2,'2026-07-03','2026-07-17');


SELECT * FROM Authors;

SELECT * FROM Books;

SELECT * FROM Members;

SELECT * FROM Borrowings;