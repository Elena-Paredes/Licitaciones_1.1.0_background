use licitaciones_v1;
DROP database licitaciones_v1;
CREATE DATABASE licitaciones_v1;
SHOW TABLES;
DROP TABLE users_register;
-- Orden de creación: 2,1,5,6,7,8,9,3,11,12,10,14,16,15,17,13,18,4,19
/*********************************************************************************************************/
/* (1) Tabla de Usuarios */
CREATE TABLE user (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    username VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone VARCHAR(45) NOT NULL,
    password VARCHAR(255) NOT NULL,
    creationDate DATE NOT NULL,
    lastAccessDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deptoId INT NOT NULL,
    FOREIGN KEY (deptoId) REFERENCES department(deptoId)
);

/* (2) Tabla de Departamento */
CREATE TABLE department (
    deptoId INT AUTO_INCREMENT PRIMARY KEY,
    deptoName VARCHAR(45) NOT NULL,
    deptoDesc VARCHAR(200) NOT NULL
);

/* (3) Tabla de Unidad de Negocio */
CREATE TABLE business_unit (
    buId INT AUTO_INCREMENT PRIMARY KEY,
    buName VARCHAR(45) NOT NULL,
    buDescription VARCHAR(100) NOT NULL
);

/* (4) Tabla de Licitación */
CREATE TABLE tender (
    tenderId INT AUTO_INCREMENT PRIMARY KEY,
    tenderName VARCHAR(45) NOT NULL, /*Es el número de la licitación en la documentación*/
    purpose VARCHAR(200) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    currentDate DATE NOT NULL,
    publicationDate DATETIME NULL,
    falloDate DATETIME NULL,
    contractId VARCHAR(45) NOT NULL,
    buId INT NULL,
    tenderTypeId INT NULL,
    procedureTypeId INT NULL,
    statusTenderId INT NULL,
    statusParticipationId INT NULL,
    companyId INT NULL,
    cteId INT NULL,
    FOREIGN KEY (contractId) REFERENCES contract(contractId),
    FOREIGN KEY (buId) REFERENCES business_unit(buId),
    FOREIGN KEY (tenderTypeId) REFERENCES tender_type(tenderTypeId),
    FOREIGN KEY (procedureTypeId) REFERENCES procedure_type(procedureTypeId),
    FOREIGN KEY (statusTenderId) REFERENCES tender_status(statusTenderId),
    FOREIGN KEY (statusParticipationId) REFERENCES tender_participation(statusParticipationId),
    FOREIGN KEY (cteId) REFERENCES client(cteId)
);

/* (5) Tabla de Tipo de Licitación */
CREATE TABLE tender_type (
    tenderTypeId INT AUTO_INCREMENT PRIMARY KEY,
    tenderTypeName VARCHAR(45) NOT NULL
);

/* (6) Tabla de Tipo de Procedimiento */
CREATE TABLE procedure_type (
    procedureTypeId INT AUTO_INCREMENT PRIMARY KEY,
    procedureTypeName VARCHAR(45) NOT NULL
);

/* (7) Tabla de Estatus de Particación */
CREATE TABLE tender_participation (
    statusParticipationId INT AUTO_INCREMENT PRIMARY KEY,
    statusParticipationName VARCHAR(45) NOT NULL
);

/* (8) Tabla de Estatus de Licitación */
CREATE TABLE tender_status (
    statusTenderId INT AUTO_INCREMENT PRIMARY KEY,
    statusTenderName VARCHAR(45) NOT NULL
);

/* (9) Tabla de Compañía */
CREATE TABLE company (
    companyId INT AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(45) NOT NULL
);

/* (10) Tabla de Cliente */
CREATE TABLE client (
    cteId INT AUTO_INCREMENT PRIMARY KEY,
    cteName VARCHAR(45) NOT NULL,
    cteStreet VARCHAR(65) NOT NULL,
    cteCity VARCHAR(45) NOT NULL,
    ctePC VARCHAR(5) NOT NULL,
    stateId INT NULL,
    dependencyId INT NULL,
    FOREIGN KEY (stateId) REFERENCES state(stateId),
    FOREIGN KEY (dependencyId) REFERENCES dependency(dependencyId)
);

/* (11) Tabla de Estado */
CREATE TABLE state (
    stateId INT AUTO_INCREMENT PRIMARY KEY,
    stateName VARCHAR(45) NOT NULL
);

/* (12) Tabla de Dependencia */
CREATE TABLE dependency (
    dependencyId INT AUTO_INCREMENT PRIMARY KEY,
    dependencyName VARCHAR(200) NOT NULL
);

ALTER TABLE dependency
MODIFY COLUMN dependencyName VARCHAR(200); -- Cambia 100 al valor deseado

/* (13) Tabla de Contrato */
CREATE TABLE contract (
    contractId VARCHAR(45) PRIMARY KEY,
    contractName VARCHAR(45) NOT NULL,
    contractNumber VARCHAR(65) NOT NULL,
    contractAmount DECIMAL(10, 2) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    currentDate DATE NOT NULL,
    contractTypeId INT NULL,
    bondId VARCHAR(45) NULL,
    contractStatusId INT NULL,
    FOREIGN KEY (contractTypeId) REFERENCES contract_type(contractTypeId),
    FOREIGN KEY (bondId) REFERENCES bond(bondId),
    FOREIGN KEY (contractStatusId) REFERENCES contract_status(contractStatusId)
);

/* (14) Tabla de Tipo de Contrato */
CREATE TABLE contract_type (
    contractTypeId INT AUTO_INCREMENT PRIMARY KEY,
    contractTypeName VARCHAR(45) NOT NULL
);

/* (15) Tabla de Fianza */
CREATE TABLE bond (
    bondId VARCHAR(45) PRIMARY KEY,
    bondName VARCHAR(45) NOT NULL,
    bondCompanyId INT NOT NULL,
    FOREIGN KEY (bondCompanyId) REFERENCES bond_company(bondCompanyId)
);

/* (16) Tabla de Compañía Afianzadora */
CREATE TABLE bond_company (
    bondCompanyId INT AUTO_INCREMENT PRIMARY KEY,
    bondCompanyName VARCHAR(45) NOT NULL
);

/* (17) Tabla de Estatus de Contrato */
CREATE TABLE contract_status (
    contractStatusId INT AUTO_INCREMENT PRIMARY KEY,
    contractStatusName VARCHAR(45) NOT NULL
);

/* (18) Tabla de Estatus de Participación */
CREATE TABLE participation_status (
    participationStatusId INT AUTO_INCREMENT PRIMARY KEY,
    participationStatusName VARCHAR(45) NOT NULL
);

/* (19) Tabla de Licitación-Compañía para la relación muchos a muchos entre Licitación y Compañía */
CREATE TABLE tender_company (
    tenderId INT NOT NULL,
    companyId INT NOT NULL,
    PRIMARY KEY (tenderId, companyId),
    FOREIGN KEY (tenderId) REFERENCES tender(tenderId),
    FOREIGN KEY (companyId) REFERENCES company(companyId)
);