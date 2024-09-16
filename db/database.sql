CREATE DATABASE IF NOT EXISTS vuelos;

USE vuelos;

CREATE TABLE Aerolineas (
    ID_Aerolinea INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Pais VARCHAR(50)
);

CREATE TABLE Aeropuertos (
    ID_Aeropuerto INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(100),
    Pais VARCHAR(50),
    Codigo_IATA CHAR(3) UNIQUE
);

CREATE TABLE Aviones (
    ID_Avion INT PRIMARY KEY,
    Modelo VARCHAR(100),
    Capacidad INT,
    ID_Aerolinea INT,
    FOREIGN KEY (ID_Aerolinea) REFERENCES Aerolineas(ID_Aerolinea)
);

CREATE TABLE Vuelos (
    ID_Vuelo INT PRIMARY KEY,
    Origen CHAR(3),
    Destino CHAR(3),
    Fecha_Salida DATE,
    Hora_Salida TIME,
    Fecha_Llegada DATE,
    Hora_Llegada TIME,
    ID_Avion INT,
    Precio DECIMAL(10,2),
    Duracion INT,
    Escalas INT,
    ID_Aerolinea INT,
    FOREIGN KEY (Origen) REFERENCES Aeropuertos(Codigo_IATA),
    FOREIGN KEY (Destino) REFERENCES Aeropuertos(Codigo_IATA),
    FOREIGN KEY (ID_Avion) REFERENCES Aviones(ID_Avion),
    FOREIGN KEY (ID_Aerolinea) REFERENCES Aerolineas(ID_Aerolinea)
);

CREATE TABLE Pasajeros (
    ID_Pasajero INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Documento VARCHAR(50),
    Fecha_Nacimiento DATE,
    Nacionalidad VARCHAR(50),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Reservas (
    ID_Reserva INT PRIMARY KEY,
    ID_Vuelo INT,
    ID_Pasajero INT,
    Fecha_Reserva DATETIME,
    Asiento VARCHAR(10), 
    Clase VARCHAR(20), 
    Precio_Total DECIMAL(10,2),
    FOREIGN KEY (ID_Vuelo) REFERENCES Vuelos(ID_Vuelo),
    FOREIGN KEY (ID_Pasajero) REFERENCES Pasajeros(ID_Pasajero)
);

CREATE TABLE Asientos (
    ID_Asiento INT PRIMARY KEY,
    ID_Vuelo INT,
    Numero_Asiento VARCHAR(5),
    Clase VARCHAR(20),
    Estado ENUM('Disponible', 'Ocupado'),
    FOREIGN KEY (ID_Vuelo) REFERENCES Vuelos(ID_Vuelo)
);


INSERT INTO Aerolineas (ID_Aerolinea, Nombre, Pais)
VALUES
  (1, 'Aerolíneas Argentinas', 'Argentina'),
  (2, 'LATAM Airlines', 'Chile'),
  (3, 'Iberia', 'España'),
  (4, 'American Airlines', 'Estados Unidos'),
  (5, 'Air France', 'Francia'),
  (6, 'Emirates', 'Emiratos Árabes Unidos');

INSERT INTO Aeropuertos (ID_Aeropuerto, Nombre, Ciudad, Pais, Codigo_IATA)
VALUES
  (1, 'Aeropuerto Internacional de Ezeiza', 'Buenos Aires', 'Argentina', 'EZE'),
  (2, 'Aeropuerto Internacional de Santiago', 'Santiago', 'Chile', 'SCL'),
  (3, 'Aeropuerto Adolfo Suárez Madrid-Barajas', 'Madrid', 'España', 'MAD'),
  (4, 'Aeropuerto Internacional John F. Kennedy', 'Nueva York', 'Estados Unidos', 'JFK'),
  (5, 'Aeropuerto de París-Charles de Gaulle', 'París', 'Francia', 'CDG'),
  (6, 'Aeropuerto Internacional de Dubai', 'Dubai', 'Emiratos Árabes Unidos', 'DXB');

INSERT INTO Aviones (ID_Avion, Modelo, Capacidad, ID_Aerolinea)
VALUES
  (1, 'Boeing 737-800', 189, 1),
  (2, 'Airbus A350-900', 325, 2),
  (3, 'Airbus A320', 180, 3),
  (4, 'Boeing 777-300ER', 396, 4),
  (5, 'Airbus A380', 525, 5),
  (6, 'Boeing 787-9', 296, 6);

INSERT INTO Vuelos (ID_Vuelo, Origen, Destino, Fecha_Salida, Hora_Salida, Fecha_Llegada, Hora_Llegada, ID_Avion, Precio, Duracion, Escalas, ID_Aerolinea)
VALUES
  (1, 'EZE', 'SCL', '2024-11-20', '10:00:00', '2024-11-20', '14:00:00', 1, 500.00, 4, 0, 1),
  (2, 'MAD', 'JFK', '2024-12-05', '15:30:00', '2024-12-05', '19:00:00', 3, 800.00, 8, 1, 3),
  (3, 'CDG', 'DXB', '2025-01-10', '09:00:00', '2025-01-11', '15:00:00', 5, 1200.00, 7, 1, 5),
  (4, 'JFK', 'MAD', '2025-02-15', '12:00:00', '2025-02-16', '18:00:00', 4, 1500.00, 14, 2, 4),
  (5, 'SCL', 'CDG', '2025-03-20', '18:00:00', '2025-03-21', '06:00:00', 2, 1800.00, 18, 1, 2),
  (6, 'DXB', 'JFK', '2025-04-05', '07:00:00', '2025-04-05', '12:00:00', 6, 900.00, 14, 0, 6);

INSERT INTO Pasajeros (ID_Pasajero, Nombre, Apellido, Documento, Fecha_Nacimiento, Nacionalidad, Email, Telefono)
VALUES
  (1, 'Juan', 'Pérez', '123456789', '1980-01-01', 'Argentina', 'jperez@example.com', '+5491123456789'),
  (2, 'María', 'García', '987654321', '1990-05-15', 'España', 'mgarcia@example.com', '+34654321987'),
  (3, 'Pedro', 'Rodríguez', '112233445', '1975-11-28', 'México', 'pedro@example.com', '+52555555555'),
  (4, 'Ana', 'Martínez', '554433221', '1995-03-07', 'Estados Unidos', 'ana@example.com', '+12125551212'),
  (5, 'Carlos', 'López', '887766554', '1985-09-22', 'Francia', 'carlos@example.com', '+33123456789'),
  (6, 'Sofía', 'Fernández', '443322118', '2000-07-18', 'Brasil', 'sofia@example.com', '+5521987654321');

INSERT INTO Reservas (ID_Reserva, ID_Vuelo, ID_Pasajero, Fecha_Reserva, Asiento, Clase, Precio_Total)
VALUES
  (1, 1, 1, '2024-11-15', '2A', 'Economy', 500.00),
  (2, 2, 2, '2024-12-03', '10B', 'Business', 1000.00),
  (3, 3, 3, '2025-01-05', '5C', 'First', 2000.00),
  (4, 4, 4, '2025-02-10', '12A', 'Economy', 1500.00),
  (5, 5, 5, '2025-03-15', '14D', 'Premium Economy', 1800.00),
  (6, 6, 6, '2025-04-01', '1B', 'Business', 900.00);

INSERT INTO Asientos (ID_Asiento, ID_Vuelo, Numero_Asiento, Clase, Estado)
VALUES
  (1, 1, '1A', 'Economy', 'Disponible'),
  (2, 1, '1B', 'Economy', 'Ocupado'),
  (3, 2, '2A', 'Business', 'Disponible'),
  (4, 2, '2B', 'Business', 'Ocupado'),
  (5, 3, '3C', 'Economy', 'Disponible'),
  (6, 3, '3D', 'Economy', 'Ocupado'),
  (7, 4, '1A', 'First', 'Disponible'),
  (8, 4, '1B', 'First', 'Ocupado'),
  (9, 5, '5A', 'Economy', 'Disponible'),
  (10, 5, '5B', 'Economy', 'Ocupado'),
  (11, 6, '10A', 'Business', 'Disponible'),
  (12, 6, '10B', 'Business', 'Ocupado');

