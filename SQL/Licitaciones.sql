CREATE DATABASE Licitaciones;
USE Licitaciones;
/*Orden para ejecutar:4,5,1,2,3,6,7,8,9,10,11,12,13,14,15 */
/*---------------------------------------------------------------------------------*/

/*(1)TABLAS DE USUARIOS*/
CREATE TABLE usuario(
	idUsuario INT AUTO_INCREMENT PRIMARY KEY,
	nombres VARCHAR (45) NOT NULL,
	apellidos VARCHAR (45) NOT NULL,	
    nombreUsuario VARCHAR (45) NOT NULL,
	correoUsuario VARCHAR (45) NOT NULL,
	telefonoUsuario VARCHAR (45) NOT NULL,
	fechaCreacion DATE NOT NULL,
	fechaAcceso TIMESTAMP NOT NULL,
	contrasenia VARCHAR (45) NOT NULL,
    idDepto INT NULL,
    idRol INT NULL,
    idArea INT NULL,
    idEspecialidad INT NULL,
    CONSTRAINT fk_usuario_depto 
	FOREIGN KEY (idDepto) REFERENCES departamento(idDepto),
    CONSTRAINT fk_usuario_especialidad
	FOREIGN KEY (idEspecialidad) REFERENCES especialidad(idEspecialidad)
);

/*(2)TABLAS DE EMPLEADOS*/
CREATE TABLE empleado (
	idUsuario INT PRIMARY KEY,
	nickname VARCHAR (45) NOT NULL, 
    fotoEmpleado BLOB NULL,
	CONSTRAINT fk_empleado_usuario 
	FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

/*(3)TABLAS DE CLIENTES*/
CREATE TABLE cliente(
	idUsuario INT PRIMARY KEY,
	institucion VARCHAR (45) NOT NULL,
	calleCte VARCHAR (45) NOT NULL,
	ciudadCte VARCHAR (45) NOT NULL,
	estadoCte VARCHAR (45) NOT NULL,
	CONSTRAINT fk_cte_usuario 
	FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

/*(4)TABLA DE DEPARTAMENTO DE LA EMPRESA*/
CREATE TABLE departamento(
	idDepto INT AUTO_INCREMENT PRIMARY KEY,
    nombreDepto VARCHAR (45) NOT NULL,
	descripcionDepto VARCHAR (45) NOT NULL
);

/*(5)TABLA DE ESPECIALIDADES*/
CREATE TABLE  especialidad(
	idEspecialidad  INT AUTO_INCREMENT PRIMARY KEY,
	nombreEspecialidad VARCHAR (45) NOT NULL,
	descripcionEspecialidad VARCHAR (45) NOT NULL,
	numEmpleados INT NULL
);


/*(6)TABLA DE LICITACIONES*/
CREATE TABLE licitacion(
	idLicitacion INT AUTO_INCREMENT PRIMARY KEY,
	nombreLicitacion VARCHAR (55) NOT NULL,
	tipoLicitacion VARCHAR (55) NOT NULL,
    fechaLicitacion DATE NOT NULL,
    idEspecialidad INT NOT NULL,
    CONSTRAINT fk_licitacion_especialidad
    FOREIGN KEY (idEspecialidad) REFERENCES especialidad (idEspecialidad)
);

/*(7)TABLA DE CONTRATOS*/
CREATE TABLE contrato (
	idContrato INT AUTO_INCREMENT PRIMARY KEY,
	fechaInicial DATE NOT NULL,
	fechaFin DATE NOT NULL,
	montoContrato DECIMAL(10,2) NOT NULL,
    idLicitacion INT NOT NULL,
	CONSTRAINT fk_contrato_licitacion
	FOREIGN KEY (idLicitacion) REFERENCES licitacion(idLicitacion)
);

/*(8)TABLA DE PRODUCTO*/
CREATE TABLE producto (
	idProducto VARCHAR (20) PRIMARY KEY,
	nombreProducto VARCHAR (45) NOT NULL,
	descripcionProducto VARCHAR (45) NOT NULL,
	Lote VARCHAR (18) NOT NULL,
	refProducto VARCHAR (45) NOT NULL,
	fechaCaducidad DATE NULL,
	tipoProducto VARCHAR (45) NOT NULL, -- CHECK
	fotoProducto BLOB NULL
);

/*(9)TABLA DE PAQUETE*/
CREATE TABLE paquete (
	idPaquete INT AUTO_INCREMENT PRIMARY KEY,
	descripPaquete VARCHAR (45) NOT NULL
);

/*(10)TABLA DE INVENTARIO*/
CREATE TABLE inventario (
	idInventario INT AUTO_INCREMENT PRIMARY KEY,
	nombreInventario VARCHAR (45) NOT NULL,
	cantidad INT NOT NULL,
	stock TINYINT NOT NULL,
    idProducto VARCHAR (20) NOT NULL
);

/*(11)TABLA DE PROVEEDOR*/
CREATE TABLE proveedor (
	idProveedor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nombreProveedor VARCHAR (45) NOT NULL,
	correoProveedor VARCHAR (45) NOT NULL,
	telefonoProveedor VARCHAR (10) NOT NULL,
	RFC VARCHAR (18) NOT NULL,
	tipo VARCHAR (45) NOT NULL,
    idDirProveedor INT NOT NULL
);

/*(12)TABLA DE DIRECCIÓN-PROVEEDOR*/
CREATE TABLE direccion_proveedor (
  idDirProveedor INT AUTO_INCREMENT PRIMARY KEY,
  calleProveedor VARCHAR(45) NOT NULL,
  delegacionProveedor VARCHAR(45) NOT NULL,
  cpProveedor VARCHAR(5) NOT NULL,
  estadoProveedor VARCHAR(45) NOT NULL,
  idProveedor INT NOT NULL,
  CONSTRAINT fk_proveedor_direccion FOREIGN KEY (idProveedor) REFERENCES proveedor(idProveedor)
);


/*TABLAS COMPUESTAS*/
-- Tabla que muestra los proveedores que surten cada producto
/*(13)TABLA DE PRODUCTO-PROVEEDOR*/
CREATE TABLE producto_proveedor(
    idProducto VARCHAR (20) NOT NULL, 
	idProveedor INT NOT NULL,
    PRIMARY KEY (idProducto, idProveedor),
	CONSTRAINT fk_producto_proveedor_producto
	FOREIGN KEY (idProducto) REFERENCES producto(idProducto),
    CONSTRAINT fk_producto_proveedor_proveedor
	FOREIGN KEY (idProveedor) REFERENCES proveedor(idProveedor)
);

-- Tabla que muestra los productos que vienen en paquetes 
/*(14)TABLA DE PAQUETE-PRODUCTO*/
CREATE TABLE paquete_producto (
	idPaquete INT NOT NULL,
	idProducto VARCHAR (20) NOT NULL,
    precioProducto DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (idPaquete, idProducto),
    CONSTRAINT fk_paquete_producto_paquete
    FOREIGN KEY (idPaquete) REFERENCES paquete(idPaquete),
    CONSTRAINT fk_paquete_producto_producto
    FOREIGN KEY (idProducto) REFERENCES producto(idProducto)
);

-- Catálogo para las licitaciones con los productos y paquetes
/*(15)TABLA DE LICITACION-PAQUETE-PRODUCTO*/
CREATE TABLE licitacion_paquete_producto (
  idLicitacion INT,
  idPaquete INT,
  idProducto VARCHAR(20),
  PRIMARY KEY (idLicitacion, idPaquete, idProducto),
  FOREIGN KEY (idLicitacion) REFERENCES licitacion (idLicitacion),
  FOREIGN KEY (idPaquete) REFERENCES paquete_producto(idPaquete),
  FOREIGN KEY (idProducto) REFERENCES producto(idProducto)
);