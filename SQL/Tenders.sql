/*creación de base da datos de Licitacion V2 
CREATE DATABASE Licitaciones_v2;
USE Licitaciones_v2;
DROP DATABASE Licitaciones_v2;

/backend/SQL/Tenders.sql

*/


/*(1) Tabla de departamentos dentro de la empresa*/
CREATE TABLE department (
    deptoId INT PRIMARY KEY AUTO_INCREMENT,
    deptoName VARCHAR(45) NOT NULL,
    deptoDescription TEXT
);

/*(2) Tabla de usuarios registrados en el sistema*/
CREATE TABLE user (
    userId INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    username VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    creationDate DATE NOT NULL,
    lastAccess TIMESTAMP NOT NULL,
    password VARCHAR(45) NOT NULL,
    userPhoto BLOB NULL,
    deptoId INT NULL,
    FOREIGN KEY (deptoId) REFERENCES department(deptoId)
);

/*(3) Tabla de lineas de negocio*/
CREATE TABLE business_unit (
    businessUnitId INT PRIMARY KEY AUTO_INCREMENT,
    businessUnitName VARCHAR(45) NOT NULL,
    businessUnitDescription VARCHAR(45) NULL,
    userId INT NULL
);

/*CATÁLOGOS*/
/*(4) Tabla para tipo de licitación*/
CREATE TABLE tender_type (
    tenderTypeId INT PRIMARY KEY AUTO_INCREMENT,
    tenderTypeName VARCHAR(45) NOT NULL
);

/*(5) Tabla para tipo de procedimiento */
CREATE TABLE procedure_type (
    procedureTypeId INT PRIMARY KEY AUTO_INCREMENT,
    procedureTypeName VARCHAR(45) NOT NULL
);

/*(6) Tabla de carácter de la licitación*/
CREATE TABLE character_type (
    characterTypeId INT PRIMARY KEY AUTO_INCREMENT,
    characterTypeName VARCHAR(45) NOT NULL
);

/*(7) Tabla de medio de contacto*/
CREATE TABLE medium_type (
    mediumTypeId INT PRIMARY KEY AUTO_INCREMENT,
    mediumTypeName VARCHAR(45) NOT NULL
);

/*CLIENTES*/
/*(8) Tabla de estados de la républica*/
CREATE TABLE state (
    stateId INT PRIMARY KEY AUTO_INCREMENT,
    stateName VARCHAR(45) NOT NULL
);

/*(9) Tablas de dependencias de los clientes*/
CREATE TABLE dependency (
    dependencyId INT PRIMARY KEY AUTO_INCREMENT,
    dependencyName VARCHAR(45) NOT NULL
);

/*(10) Tablas de los clientes*/
CREATE TABLE client (
    clientId INT PRIMARY KEY AUTO_INCREMENT,
    clientName VARCHAR(45) NOT NULL,
    stateId INT NULL,
    dependencyId INT NULL,
    FOREIGN KEY (stateId) REFERENCES state(stateId),
    FOREIGN KEY (dependencyId) REFERENCES dependency(dependencyId)
);

/*(11) Tablas de dependencias de los clientes*/
CREATE TABLE criteria (
    criteriaId INT PRIMARY KEY AUTO_INCREMENT,
    criteriaName VARCHAR(45) NOT NULL
);

/*(12) Tablas del estatus de la participación*/
CREATE TABLE participation_status (
    participationStatusId INT PRIMARY KEY AUTO_INCREMENT,
    participationStatusName VARCHAR(45) NOT NULL
);

/*(13) Tablas de dependencias de los clientes*/
CREATE TABLE tender_status (
    tenderStatusId INT PRIMARY KEY AUTO_INCREMENT,
    tenderStatusName VARCHAR(45) NOT NULL
);

/*(14) Tablas de dependencias de los clientes*/
CREATE TABLE tender (
    tenderId VARCHAR(200) PRIMARY KEY,
    tenderNumber VARCHAR(45) UNIQUE NOT NULL,
    tenderObjective VARCHAR(200) NOT NULL,
    publicationDate DATETIME NULL,
    basePublicationDate DATETIME NULL,
    basePurchaseDate DATETIME NULL,
    visitDate DATETIME NULL,
    sampleDate DATETIME NULL,
    clarificationsMeetingDate DATETIME NULL,
    prequalificationDate DATETIME NULL,
    presentationDate DATETIME NULL,
    awardDate DATETIME NULL,
    userId INT NULL,
    businessUnitId INT NULL,
    tenderTypeId INT NULL,
    procedureTypeId INT NULL,
    characterTypeId INT NULL,
    mediumTypeId INT NULL,
    clientId INT NULL,
    criteriaId INT NULL,
    participationStatusId INT NULL,
    tenderStatusId INT NULL,
    FOREIGN KEY (userId) REFERENCES user(userId),
    FOREIGN KEY (businessUnitId) REFERENCES business_unit(businessUnitId),
    FOREIGN KEY (tenderTypeId) REFERENCES tender_type(tenderTypeId),
    FOREIGN KEY (procedureTypeId) REFERENCES procedure_type(procedureTypeId),
    FOREIGN KEY (characterTypeId) REFERENCES character_type(characterTypeId),
    FOREIGN KEY (mediumTypeId) REFERENCES medium_type(mediumTypeId),
    FOREIGN KEY (clientId) REFERENCES client(clientId),
    FOREIGN KEY (criteriaId) REFERENCES criteria(criteriaId),
    FOREIGN KEY (participationStatusId) REFERENCES participation_status(participationStatusId),
    FOREIGN KEY (tenderStatusId) REFERENCES tender_status(tenderStatusId)
);

/*(15) Tablas de licitaciones adjudicados
CREATE TABLE awarded (
    awardedId INT PRIMARY KEY,
    awardedAmount VARCHAR(45),
    awardedStartDate DATETIME,
    awardedEndDate DATETIME,
    awardedObservations TEXT,
    tenderId INT,
    FOREIGN KEY (tenderId) REFERENCES Tender(tenderId)
);
*/

