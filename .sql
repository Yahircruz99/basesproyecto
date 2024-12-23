CREATE DATABASE TiendaComputadoras;
USE TiendaComputadoras;

CREATE TABLE Fabricante (
    id_fabricante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    pais_origen VARCHAR(50)
    GO
);

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
    GO
);

CREATE TABLE Subcategoria (
    id_subcategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
    GO
);

CREATE TABLE Articulo (
    sku VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock INT,
    estado VARCHAR(20),
    id_fabricante INT,
    id_subcategoria INT,
    FOREIGN KEY (id_fabricante) REFERENCES Fabricante(id_fabricante),
    FOREIGN KEY (id_subcategoria) REFERENCES Subcategoria(id_subcategoria)
    GO
);

CREATE TABLE Caracteristica (
    id_caracteristica INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    descripcion TEXT
    GO
);

CREATE TABLE ArticuloCaracteristica (
    id_articulo_caracteristica INT PRIMARY KEY AUTO_INCREMENT,
    sku VARCHAR(20),
    id_caracteristica INT,
    valor VARCHAR(50),
    FOREIGN KEY (sku) REFERENCES Articulo(sku),
    FOREIGN KEY (id_caracteristica) REFERENCES Caracteristica(id_caracteristica)
); GO 