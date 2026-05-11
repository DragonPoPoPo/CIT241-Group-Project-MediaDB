-- Create Tables in order to maintain Foreign Key integrity
CREATE TABLE Artists (
    ArtistId INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Genres (
    GenreId INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Albums (
    AlbumId INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ArtistId INT,
    FOREIGN KEY (ArtistId) REFERENCES Artists(ArtistId)
);

CREATE TABLE Tracks (
    TrackId INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    AlbumId INT,
    GenreId INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (AlbumId) REFERENCES Albums(AlbumId),
    FOREIGN KEY (GenreId) REFERENCES Genres(GenreId)
);

CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE
);

CREATE TABLE Invoices (
    InvoiceId INT PRIMARY KEY,
    CustomerId INT,
    InvoiceDate DATETIME,
    Total DECIMAL(10, 2),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

CREATE TABLE InvoiceItems (
    InvoiceLineId INT PRIMARY KEY,
    InvoiceId INT,
    TrackId INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (InvoiceId) REFERENCES Invoices(InvoiceId),
    FOREIGN KEY (TrackId) REFERENCES Tracks(TrackId)
);