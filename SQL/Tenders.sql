-- /backend/SQL/Tenders.sql
USE licitaciones_v2;
SHOW TABLES;
DROP DATABASE Licitaciones_v2;
CREATE DATABASE Licitaciones_v2;
SHOW DATABASES;
DESC tender;
SELECT * FROM tender;

/*(1) Tabla de departamentos dentro de la empresa*/
CREATE TABLE department (
    deptoId INT PRIMARY KEY AUTO_INCREMENT,
    deptoName VARCHAR(45) NOT NULL,
    deptoDesc VARCHAR(120) NULL
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
    lastAccessDate TIMESTAMP NOT NULL,
    password VARCHAR(255) NOT NULL,
    userPhoto BLOB NULL,
    deptoId INT NULL,
    FOREIGN KEY (deptoId) REFERENCES department(deptoId)
);
/*******************************INFORMACIÓN GENERAL*****************************/
/*(3) Tabla de lineas de negocio*/
CREATE TABLE business_unit (
    buId INT PRIMARY KEY AUTO_INCREMENT,
    buName VARCHAR(45) NOT NULL,
    buDesc VARCHAR(100) NULL
);
/*(4) Tabla de estados de la républica*/
CREATE TABLE state (
    stateId INT PRIMARY KEY AUTO_INCREMENT,
    stateName VARCHAR(45) NOT NULL
);
/*(5) Tabla de los hospitales registrados*/
CREATE TABLE dependency (
    dependencyId INT PRIMARY KEY AUTO_INCREMENT,
    dependencyName VARCHAR(100) NOT NULL
);
/**********************************TIPOS************************************/
/*(6) Tabla para tipo de contratación*/
CREATE TABLE contract_type (
    contractTypeId INT PRIMARY KEY AUTO_INCREMENT,
    contractTypeName VARCHAR(45) NOT NULL
);
/*(7) Tabla para tipo de procedimiento */
CREATE TABLE procedure_type (
    procedureTypeId INT PRIMARY KEY AUTO_INCREMENT,
    procedureTypeName VARCHAR(45) NOT NULL
);
/*(8) Tabla de tipo de carácter de la licitación*/
CREATE TABLE character_type (
    characterTypeId INT PRIMARY KEY AUTO_INCREMENT,
    characterTypeName VARCHAR(55) NOT NULL
);
/*(9) Tabla de medio por el cual se envia la licitación*/
CREATE TABLE medium_type (
    mediumTypeId INT PRIMARY KEY AUTO_INCREMENT,
    mediumTypeName VARCHAR(45) NOT NULL
);
/*(10) Tabla de criterio de evaluación*/
CREATE TABLE criteria (
    criteriaId INT PRIMARY KEY AUTO_INCREMENT,
    criteriaName VARCHAR(45) NOT NULL
);
/***************************************ESTATUS*******************************************/
/*(11) Tabla del estatus de la participación*/
CREATE TABLE participation_status (
    participationStatusId INT PRIMARY KEY AUTO_INCREMENT,
    participationStatusName VARCHAR(45) NOT NULL
);
/*(12) Tabla del estatus del concurso*/
CREATE TABLE contest_status (
    contestStatusId INT PRIMARY KEY AUTO_INCREMENT,
    contestStatusName VARCHAR(45) NOT NULL
);
/*(13) Tabla de incumplimientos de la licitación*/
CREATE TABLE breach(
    breachStatusId INT PRIMARY KEY AUTO_INCREMENT,
    breachStatusName VARCHAR(45) NOT NULL
);

/*(14) Tablas principal: LICITACIONES*/
CREATE TABLE tender (
    tenderId INT PRIMARY KEY AUTO_INCREMENT,
    tenderNumber VARCHAR(55) UNIQUE NOT NULL,
    purpose VARCHAR(150) NOT NULL,
    publicationDate DATETIME NOT NULL,
    basePublicationDate DATETIME NULL,
    basePurchaseDate DATETIME NULL,
    visitDate DATETIME NULL,
    sampleDate DATETIME NULL,
    clarificationMeetingDate DATETIME NULL,
    prequalificationDate DATETIME NULL,
    presentationDate DATETIME NULL,
    awardDate DATETIME NULL,
    userId INT NOT NULL,
    buId INT NOT NULL,
    stateId INT NULL,
    dependencyId INT NULL,
    contractTypeId INT NULL,
    procedureTypeId INT NULL,
    characterTypeId INT NULL,
    mediumTypeId INT NULL,
    criteriaId INT NULL,
    participationStatusId INT NULL,
    contestStatusId INT NULL,
    breachStatusId INT NULL,
    FOREIGN KEY (userId) REFERENCES user(userId),
    FOREIGN KEY (buId) REFERENCES business_unit(buId),
    FOREIGN KEY (stateId) REFERENCES state(stateId),
    FOREIGN KEY (dependencyId) REFERENCES dependency(dependencyId),
    FOREIGN KEY (contractTypeId) REFERENCES contract_type(contractTypeId),
    FOREIGN KEY (procedureTypeId) REFERENCES procedure_type(procedureTypeId),
    FOREIGN KEY (characterTypeId) REFERENCES character_type(characterTypeId),
    FOREIGN KEY (mediumTypeId) REFERENCES medium_type(mediumTypeId),
    FOREIGN KEY (criteriaId) REFERENCES criteria(criteriaId),
    FOREIGN KEY (participationStatusId) REFERENCES participation_status(participationStatusId),
    FOREIGN KEY (contestStatusId) REFERENCES contest_status(contestStatusId),
	FOREIGN KEY (breachStatusId) REFERENCES breach(breachStatusId)
);
/*(15) Tabla de empresas*/
CREATE TABLE company (
	companyId INT PRIMARY KEY AUTO_INCREMENT,
    companyName VARCHAR (45),
    companyAddress VARCHAR (65)
);
/*(16) Tabla de licitación-empresa*/
CREATE TABLE tender_company (
	tenderId INT, 
    companyId INT,
    PRIMARY KEY (tenderId, companyId),
    FOREIGN KEY (tenderId) REFERENCES tender (tenderId),
    FOREIGN KEY (companyId) REFERENCES company (companyId)
);