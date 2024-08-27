/* REGISTROS DE LAS TABLAS DE LA BASE DE DATOS "Licitacion_v1" */
INSERT INTO department (deptoName, deptoDesc) VALUES 
('Marketing', 'Departamento encargado de la promoción y publicidad de los productos y servicios.'),
('Finanzas', 'Departamento responsable de la gestión financiera y contable de la empresa.'),
('Recursos Humanos', 'Departamento encargado de la gestión del personal y de las políticas laborales.'),
('Tecnología', 'Departamento que se encarga del desarrollo y mantenimiento de sistemas y tecnología.'),
('Ventas', 'Departamento responsable de las ventas y relaciones con los clientes.');

INSERT INTO user (firstName, lastName, username, email, phone, password, creationDate, lastAccessDate, DeptoId) VALUES 
('Juan', 'Pérez', 'juanperez', 'juanperez@example.com', '555-1234', 'contrasena123', '2023-01-01', CURRENT_TIMESTAMP, 1),
('Ana', 'García', 'anagarcia', 'anagarcia@example.com', '555-5678', 'contrasena123', '2023-02-01', CURRENT_TIMESTAMP, 2);

INSERT INTO business_unit (buName, buDescription) VALUES
('Equipamiento', 'Unidad de negocio encargada del equipamiento médico general.'),
('Anestesia', 'Unidad de negocio especializada en equipos y servicios de anestesia.'),
('Terapia de infusión', 'Unidad de negocio dedicada a la terapia de infusión y equipos relacionados.'),
('Mínima invasión', 'Unidad de negocio enfocada en técnicas y equipos de mínima invasión.'),
('Hemodinamia', 'Unidad de negocio que se especializa en procedimientos y equipos de hemodinamia.'),
('Banco de sangre', 'Unidad de negocio que maneja la recolección, almacenamiento y distribución de sangre.'),
('Endoscopía', 'Unidad de negocio dedicada a equipos y procedimientos de endoscopía.'),
('Cardiología', 'Unidad de negocio enfocada en equipos y servicios de cardiología.');

INSERT INTO tender_type (tenderTypeName) VALUES 
('Adquisición'),
('Servicio'),
('Arrendamiento');

/*Esto es refiere al estatus del concurso*/
INSERT INTO procedure_type (procedureTypeName) VALUES 
('Licitación pública'),
('Investigación de Mercado'),
('Proyecto de Convocatoria');

INSERT INTO tender_status (statusTenderName) VALUES 
('Presentación y Apertura'),
('Finalizado'),
('Junta de aclaraciones'),
('Contrato'),
('Diferimento de fallo');

INSERT INTO tender_participation (statusParticipationName) VALUES 
('Desechada por incumplimiento técnico'),
('Presentada'),
('No se participó'),
('Cancelado'),
('Elaborado'),
('Adjudicado'),
('Declinada'),
('Análisis de viabilidad'),
('Finalizado');

INSERT INTO company (companyName) VALUES 
('Comerlat S.A. de C.V.'),
('AUG S.A. de C.V.'),
('LATTICE S.A. de C.V.');

INSERT INTO state (stateName) VALUES
('Aguascalientes'),
('Baja California'),
('Baja California Sur'),
('Campeche'),
('Chiapas'),
('Chihuahua'),
('Coahuila'),
('Colima'),
('Ciudad de México'),
('Durango'),
('Guanajuato'),
('Guerrero'),
('Hidalgo'),
('Jalisco'),
('México'),
('Michoacán'),
('Morelos'),
('Nayarit'),
('Nuevo León'),
('Oaxaca'),
('Puebla'),
('Querétaro'),
('Quintana Roo'),
('San Luis Potosí'),
('Sinaloa'),
('Sonora'),
('Tabasco'),
('Tamaulipas'),
('Tlaxcala'),
('Veracruz'),
('Yucatán'),
('Zacatecas');

INSERT INTO dependency (dependencyName) VALUES
('IMSS Bienestar'),
('IMSS'),
('IMSS Central'),
('INP (Instituto Nacional de Pediatría)'),
('IMSS PTE (Programa de Trabajadores Excluidos)'),
('ISSSTE (Instituto de Seguridad y Servicios Sociales de los Trabajadores del Estado)'),
('SS (Servicios de Salud)'),
('PEMEX (Petróleos Mexicanos)'),
('Secretaría de Salud'),
('SEDENA (Secretaría de la Defensa Nacional)'),
('ISSEMYM (Instituto de Seguridad Social del Estado de México y Municipios)'),
('IMSS Ordinario'),
('HIM (Hospital Infantil de México Federico Gómez)'),
('UNEME (Unidades de Especialidades Médicas)'),
('INCARD (Instituto Nacional de Cardiología Ignacio Chávez)'),
('HOSPITAL GENERAL “DR. MANUEL GEA GONZALEZ”');

SELECT * FROM dependency;

INSERT INTO client (cteName, cteStreet, cteCity, ctePC, stateId, dependencyId) VALUES 
('Cliente A', 'Calle Principal 123', 'Los Ángeles', '90001', 1, 34),
('Cliente B', 'Calle Olmo 456', 'Houston', '77001', 2, 39);

INSERT INTO contract_type (contractTypeName) VALUES
('Servicio'),
('Suministro'),
('Obra Pública'),
('Arrendamiento'),
('Consultoría');

INSERT INTO bond_company (bondCompanyName) VALUES
('Afianzadora A'),
('Afianzadora B'),
('Afianzadora C'),
('Afianzadora D'),
('Afianzadora E');

INSERT INTO bond (bondId, bondName, bondCompanyId) VALUES
('B001', 'Fianza A', 1),
('B002', 'Fianza B', 2),
('B003', 'Fianza C', 3),
('B004', 'Fianza D', 4),
('B005', 'Fianza E', 5);


INSERT INTO contract_status (contractStatusName) VALUES 
INSERT INTO contract_status (contractStatusName) VALUES 
('Activo'),
('Completado'),
('Terminado');

INSERT INTO contract (contractId, contractName, contractNumber, contractAmount, startDate, endDate, currentDate, contractTypeId, bondId, contractStatusId) VALUES
('C001', 'Contrato A', 'CN001', 100000.00, '2024-01-01', '2024-12-31', '2024-12-31', 1, 'B001', 1),
('C002', 'Contrato B', 'CN002', 200000.00, '2024-02-01', '2024-11-30', '2024-11-30', 2, 'B002', 2),
('C003', 'Contrato C', 'CN003', 300000.00, '2024-03-01', '2024-10-31', '2024-10-31', 3, 'B003', 3),
('C004', 'Contrato D', 'CN004', 400000.00, '2024-04-01', '2024-09-30', '2024-09-30', 4, 'B004', 1),
('C005', 'Contrato E', 'CN005', 500000.00, '2024-05-01', '2024-08-31', '2024-08-31', 5, 'B005', 2);

INSERT INTO tender (tenderName, purpose, startDate, endDate, currentDate, publicationDate, contractId, buId, tenderTypeId, procedureTypeId, statusTenderId, statusParticipationId, companyId, cteId) VALUES
('Licitación A', 'Propósito A', '2024-01-01', '2024-06-30', '2024-01-01', '2023-12-15', 'C001', 1, 1, 1, 1,2, 1, 5),
('Licitación B', 'Propósito B', '2024-02-01', '2024-07-31', '2024-02-01', '2024-01-15', 'C002', 2, 2, 2, 2, 1,2, 6),
('Licitación C', 'Propósito C', '2024-03-01', '2024-08-31', '2024-03-01', '2024-02-15', 'C003', 3, 3, 3, 3, 3,3, 5),
('Licitación D', 'Propósito D', '2024-04-01', '2024-09-30', '2024-04-01', '2024-03-15', 'C004', 8, 3, 3, 1, 3,4, 6),
('Licitación E', 'Propósito E', '2024-05-01', '2024-10-31', '2024-05-01', '2024-04-15', 'C005', 5, 1, 2, 3, 5,5, 5);

INSERT INTO tender_company (tenderId, companyId) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(4, 2);























