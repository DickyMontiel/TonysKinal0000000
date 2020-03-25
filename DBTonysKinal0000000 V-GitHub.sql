DROP DATABASE IF EXISTS DBTonysKinal0000000;
CREATE DATABASE DBTonysKinal0000000;


USE DBTonysKinal0000000;

CREATE TABLE Empresas (
    codigoEmpresa INT NOT NULL AUTO_INCREMENT,
    nombreEmpresa VARCHAR(150) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    telefono VARCHAR(10) NOT NULL,

    PRIMARY KEY PK_codigoEmpresa (codigoEmpresa)
);


CREATE TABLE Presupuesto (
    codigoPresupuesto INT NOT NULL AUTO_INCREMENT,
    fechaSolicitud DATE NOT NULL,
    cantidadPresupuesto DECIMAL(10,2) NOT NULL,
    codigoEmpresa INT NOT NULL,

    PRIMARY KEY PK_codigoPresupuesto (codigoPresupuesto),
    CONSTRAINT FK_Presupuesto_Empresas FOREIGN KEY(codigoEmpresa) REFERENCES Empresas(codigoEmpresa)
);

CREATE TABLE TipoEmpleado (
    codigoTipoEmpleado INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(100) NOT NULL,

    PRIMARY KEY PK_codigoTipoEmpleado (codigoTipoEmpleado)
);

CREATE TABLE Empleados (
    codigoEmpleado INT NOT NULL AUTO_INCREMENT,
    numeroEmpleado INT NOT NULL,
    apellidosEmpleado VARCHAR(150) NOT NULL,
    nombresEmpleado VARCHAR(150) NOT NULL,
    direccionEmpleado VARCHAR(150) NOT NULL,
    telefonoContacto VARCHAR(10) NOT NULL,
    gradoConcinero VARCHAR(50),
    codigoTipoEmpleado INT NOT NULL,

    PRIMARY KEY PK_codigoEmpleado (codigoEmpleado),
    CONSTRAINT FK_Empleados_TipoEmpleado FOREIGN KEY(codigoTipoEmpleado) REFERENCES TipoEmpleado(codigoTipoEmpleado)
);

CREATE TABLE Servicios_has_Empleados (
    Servicios_codigoServicio INT,
    Empleados_codigoEmpleado INT,
    fechaEvento DATE NOT NULL,
    horaEvento TIME NOT NULL,
    lugarEvento VARCHAR(150) NOT NULL
);

CREATE TABLE Productos (
    codigoProducto INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(100) NOT NULL,

    PRIMARY KEY PK_codigoProducto (codigoProducto)
);

CREATE TABLE TipoPlato (
    codigoTipoPlato INT NOT NULL AUTO_INCREMENT,
    nombreProducto VARCHAR(150) NOT NULL,
    cantidad INT NOT NULL,

    PRIMARY KEY PK_codigoTipoPlato (codigoTipoPlato)
);

CREATE TABLE Productos_has_Platos(
    Productos_codigoProducto INT,
    Platos_codigoPlato INT
);

CREATE TABLE Platos (
    codigoPlato INT NOT NULL AUTO_INCREMENT,
    cantidad INT NOT NULL,
    nombrePlato VARCHAR(50) NOT NULL,
    descripcionPlato VARCHAR(150) NOT NULL,
    precioPlato DECIMAL(10,2) NOT NULL,
    codigoTipoPlato INT,

    PRIMARY KEY PK_codigoPlato (codigoPlato),
    CONSTRAINT FK_Platos_TipoPlato FOREIGN KEY(codigoTipoPlato) REFERENCES TipoPlato(codigoTipoPlato)
);

CREATE TABLE Servicios_has_Platos (
    Servicios_codigoServicio INT,
    Platos_codigoPlato INT
);

CREATE TABLE Servicios (
    codigoServicio INT NOT NULL AUTO_INCREMENT,
    fechaServicio DATE NOT NULL,
    tipoServicio VARCHAR(100) NOT NULL,
    horaServicio TIME NOT NULL,
    lugarServicio VARCHAR(100) NOT NULL,
    telefonoContacto VARCHAR(10) NOT NULL,
    codigoEmpresa INT,

    PRIMARY KEY PK_codigoServicio (codigoServicio),
    CONSTRAINT FK_Servicios_Empresas FOREIGN KEY(codigoEmpresa) REFERENCES Empresas(codigoEmpresa)
);