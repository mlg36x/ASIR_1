CREATE TABLE Users (
    UserID int NOT NULL,
    UserName varchar(255),
    UserEmail varchar(255),
    PRIMARY KEY (UserID)
);


CREATE TABLE Products (
    ProductID int NOT NULL,
    ProductName varchar(255),
    ProductPrice decimal,
    PRIMARY KEY (ProductID)
);


CREATE TABLE Orders (
    OrderID int NOT NULL,
    UserID int,
    ProductID int,
    OrderDate date,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Users (UserID, UserName, UserEmail) 
VALUES (1, 'John Doe', 'johndoe@example.com'),
       (2, 'Jane Doe', 'janedoe@example.com');


INSERT INTO Products (ProductID, ProductName, ProductPrice) 
VALUES (1, 'Product A', 19.99),
       (2, 'Product B', 29.99);

INSERT INTO Orders (OrderID, UserID, ProductID, OrderDate) 
VALUES (1, 1, 1, '2022-01-01'),
       (2, 2, 2, '2022-01-02');