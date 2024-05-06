CREATE TABLE Customers (
    CustomerID INT NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Products (
    ProductID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    PRIMARY KEY (ProductID)
);

CREATE TABLE Orders (
    OrderID INT NOT NULL,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES 
(1, 'John', 'Doe', 'johndoe@example.com'),
(2, 'Jane', 'Doe', 'janedoe@example.com');

INSERT INTO Products (ProductID, ProductName)
VALUES 
(1, 'large coffee'),
(2, 'small coffee');

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate)
VALUES 
(1, 1, 1, 2, NOW()),
(2, 1, 2, 1, NOW()),
(3, 2, 1, 1, NOW());