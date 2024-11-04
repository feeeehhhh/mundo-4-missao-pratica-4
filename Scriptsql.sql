CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CNH VARCHAR(20) NOT NULL,
    Endereço VARCHAR(200) NOT NULL,
    Contato VARCHAR(50) NOT NULL
);
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Empresa VARCHAR(100),
    Endereço VARCHAR(200) NOT NULL,
    Contato VARCHAR(50) NOT NULL
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ClientID INT NOT NULL,
    DriverID INT NOT NULL,
    DetalhesPedido TEXT NOT NULL,
    DataEntrega DATE NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

INSERT INTO Drivers (DriverID, Nome, CNH, Endereço, Contato) VALUES
(1, 'João Silva', '123456789', 'Rua A, 123', '(11) 99999-9999'),
(2, 'Maria Oliveira', '987654321', 'Rua B, 456', '(11) 98888-8888');

INSERT INTO Clients (ClientID, Nome, Empresa, Endereço, Contato) VALUES
(1, 'Carlos Pereira', 'Transp Brasil', 'Rua C, 789', '(11) 97777-7777'),
(2, 'Ana Santos', 'Logística Rápida', 'Rua D, 101', '(11) 96666-6666');

INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status) VALUES
(1, 1, 1, 'Entrega de móveis', '2024-11-10', 'Pendente'),
(2, 2, 2, 'Transporte de mercadorias', '2024-11-12', 'Concluído');

SELECT * FROM Orders WHERE Status = 'Pendente';

SELECT o.OrderID, c.Nome AS Cliente, d.Nome AS Motorista, o.DetalhesPedido, o.DataEntrega, o.Status
FROM Orders o
JOIN Clients c ON o.ClientID = c.ClientID
JOIN Drivers d ON o.DriverID = d.DriverID;

INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status) 
VALUES (3, 1, 2, 'Entrega de eletrônicos', '2024-11-15', 'Pendente');

SELECT * FROM Drivers WHERE Nome LIKE 'João%';

UPDATE Orders 
SET Status = 'Concluído' 
WHERE OrderID = 1;



