-- Create Database (run once)
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Authors
CREATE TABLE IF NOT EXISTS Authors (
  AuthorID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL
);

-- Publishers
CREATE TABLE IF NOT EXISTS Publishers (
  PublisherID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(150) NOT NULL,
  Address VARCHAR(255)
);

-- Books
CREATE TABLE IF NOT EXISTS Books (
  BookID INT PRIMARY KEY AUTO_INCREMENT,
  Title VARCHAR(200) NOT NULL,
  PublisherID INT,
  YearPublished INT,
  AvailableCopies INT DEFAULT 1,
  FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- Many-to-many: Book <-> Author
CREATE TABLE IF NOT EXISTS BookAuthors (
  BookID INT,
  AuthorID INT,
  PRIMARY KEY (BookID, AuthorID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);

-- Students
CREATE TABLE IF NOT EXISTS Students (
  StudentID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Course VARCHAR(50),
  Year INT,
  Contact VARCHAR(15),
  Email VARCHAR(100)
);

-- Librarians (store hashed password in real project)
CREATE TABLE IF NOT EXISTS Librarians (
  LibrarianID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100),
  Username VARCHAR(50) UNIQUE,
  PasswordHash VARCHAR(255)
);

-- IssuedBooks
CREATE TABLE IF NOT EXISTS IssuedBooks (
  IssueID INT PRIMARY KEY AUTO_INCREMENT,
  StudentID INT,
  BookID INT,
  IssueDate DATE NOT NULL,
  DueDate DATE,
  ReturnDate DATE,
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
