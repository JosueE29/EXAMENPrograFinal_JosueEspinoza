Create DATABASE		
GO

USE ConstructoresAvance
Go

CREATE TABLE Empleados (
    Id INT IDENTITY(1,1) PRIMARY KEY, 
    NumeroCarnet VARCHAR(25) UNIQUE NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Categoria VARCHAR(50) NOT NULL CHECK (Categoria IN ('Administrador', 'Operario', 'Peón')),
    Salario INT DEFAULT 250000 CHECK(Salario BETWEEN 250000 AND 500000),
    Direccion VARCHAR(255) DEFAULT 'San José',
    Telefono VARCHAR(15),
    Correo VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Proyectos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(50) UNIQUE NOT NULL,
    NombreProyecto VARCHAR(100) UNIQUE NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE
);

CREATE TABLE Roles (
    Id INT IDENTITY(1,1) PRIMARY KEY, 
    Nombre VARCHAR(50) UNIQUE NOT NULL 
);

CREATE TABLE Asignaciones (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EmpleadoId INT NOT NULL,
    ProyectoId INT NOT NULL,
    RolId INT NOT NULL,
    FechaAsignacion DATE NOT NULL,
    UNIQUE (EmpleadoId, ProyectoId), 
    FOREIGN KEY (EmpleadoId) REFERENCES Empleados(Id),
    FOREIGN KEY (ProyectoId) REFERENCES Proyectos(Id),
    FOREIGN KEY (RolId) REFERENCES Roles(Id) 
);

CREATE PROCEDURE AgregarEmpleados
    @NumeroCarnet VARCHAR(25),
    @Nombre VARCHAR(100),
    @FechaNacimiento DATE,
    @Categoria VARCHAR(50),
    @Salario INT,
    @Direccion VARCHAR(255),
    @Telefono VARCHAR(15),
    @Correo VARCHAR(100)
AS
BEGIN
    INSERT INTO Empleados (NumeroCarnet, Nombre, FechaNacimiento, Categoria, Salario, Direccion, Telefono, Correo)
    VALUES (@NumeroCarnet, @Nombre, @FechaNacimiento, @Categoria, @Salario, @Direccion, @Telefono, @Correo);
END;

CREATE PROCEDURE VerEmpleados
AS
BEGIN
    SELECT * FROM Empleados;
END;

CREATE PROCEDURE BorrarEmpleado
    @Id INT
AS
BEGIN
    DELETE FROM Empleados
    WHERE Id = @Id;
END;

CREATE PROCEDURE CrearAsignacion
    @EmpleadoId INT,
    @ProyectoId INT,
    @FechaAsignacion DATE,
    @RolId INT
AS
BEGIN
    
    INSERT INTO Asignaciones (EmpleadoId, ProyectoId, FechaAsignacion, RolId)
    VALUES (@EmpleadoId, @ProyectoId, @FechaAsignacion, @RolId);
END;

CREATE PROCEDURE VerAsignaciones
AS
BEGIN
    SELECT * FROM Asignaciones;
END;

CREATE PROCEDURE EliminarAsignacion
    @Id INT
AS
BEGIN
    DELETE FROM Asignaciones
    WHERE Id = @Id;
END;

CREATE PROCEDURE CrearProyecto
    @Codigo VARCHAR(50),
    @NombreProyecto VARCHAR(100),
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    INSERT INTO Proyectos (Codigo, NombreProyecto, FechaInicio, FechaFin)
    VALUES (@Codigo, @NombreProyecto, @FechaInicio, @FechaFin);
END;

CREATE PROCEDURE VerProyectos
AS
BEGIN
    SELECT * FROM Proyectos;
END;

CREATE PROCEDURE EliminarProyecto
    @Id INT
AS
BEGIN
    DELETE FROM Proyectos
    WHERE Id = @Id;
END;

CREATE PROCEDURE CrearRol
    @Nombre VARCHAR(50)
AS
BEGIN
    INSERT INTO Roles (Nombre)
    VALUES (@Nombre);
END;

CREATE PROCEDURE VerRoles
AS
BEGIN
    SELECT * FROM Roles;
END;

CREATE PROCEDURE EliminarRol
    @Id INT
AS
BEGIN
    DELETE FROM Roles
    WHERE Id = @Id;
END;

