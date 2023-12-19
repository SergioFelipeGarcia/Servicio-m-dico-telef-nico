drop database hito;
create database hito;
use hito;

CREATE TABLE Operador (
    ID_operador INT PRIMARY KEY,
    nombre VARCHAR(255),
    categoria VARCHAR(50),
    turno VARCHAR(50)
);

CREATE TABLE Paciente (
    DNI VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE Llamada (
    ID_llamada INT PRIMARY KEY,
    numero_del_llamante VARCHAR(20),
    Tipo_de_llamada VARCHAR(50),
    Fecha_hora DATETIME,
    ID_operador INT,
    ID_especialista INT,
    DNI_paciente varchar(9),
    consejo_operador TEXT,
    motivo VARCHAR(255),
    consejo_especialista TEXT,
    observacion_llamada_molesta BOOLEAN,
    FOREIGN KEY (ID_operador) REFERENCES Operador(ID_operador),
    FOREIGN KEY (ID_especialista) REFERENCES Operador(ID_operador),
    FOREIGN KEY (DNI_paciente ) REFERENCES Paciente(DNI)
   
);

-- Operadores
INSERT INTO Operador (ID_operador, nombre, categoria, turno) VALUES
(1, 'Juan Perez', 'Operador', 'Lunes a viernes no festivos 7:00 a 15:00'),
(2, 'María García', 'Operador', 'Lunes a viernes no festivos 15:00 a 23:00'),
(3, 'Carlos Rodriguez', 'Operador', 'Lunes a viernes no festivos 23:00 a 7:00'),
(4, 'Sara Lopez', 'Enfermera', 'Sábados, domingos y festivos 7:00 a 15:00'),
(5, 'Roberto Fernández', 'Enfermera', 'Sábados, domingos y festivos 15:00 a 23:00'),
(6, 'Luisa Martín', 'Enfermera', 'Sábados, domingos y festivos 23:00 a 7:00'),
(7, 'David Herrera', 'Médico', 'Lunes a viernes no festivos 7:00 a 15:00'),
(8, 'Ana María Gómez', 'Médico', 'Lunes a viernes no festivos 15:00 a 23:00'),
(9, 'Javier Pérez', 'Médico', 'Lunes a viernes no festivos 23:00 a 7:00'),
(10, 'Isabel Torres', 'Psicólogo', 'Sábados, domingos y festivos 7:00 a 15:00');




-- Pacientes
INSERT INTO Paciente (DNI, Nombre) VALUES
('12345678A', 'Ana Martínez'),
('98765432B', 'Pedro Sánchez'),
('56789012C', 'Laura Ruiz'),
('23456789D', 'Carlos González'),
('34567890E', 'Elena Rodríguez'),
('45678901F', 'Miguel Martínez'),
('56789012G', 'Raquel Pérez'),
('67890123H', 'Francisco Gómez'),
('78901234I', 'Lucía Sánchez'),
('89012345J', 'Diego Fernández');


-- Llamadas (ID de 1 a 10)
INSERT INTO Llamada (ID_llamada, numero_del_llamante, Tipo_de_llamada, Fecha_hora, ID_operador, ID_especialista, DNI_paciente, consejo_operador, motivo, consejo_especialista, observacion_llamada_molesta) VALUES
(1, '555-7777', 'Enfermera', '2023-12-02 14:45:00', 2, 2, '12345678A', 'Aplicar desinfectante en la herida', 'Corte en el dedo', 'Agendar cita con la enfermera para revisión', false),
(2, '555-6666', 'Médica', '2023-12-03 16:30:00', 3, 1, '98765432B', 'Tomar medicamento según prescripción', 'Dolor de cabeza', 'Reposo y tomar agua', false),
(3, '555-5555', 'Psicológica', '2023-12-04 10:15:00', 4, 3, '56789012C', 'Escuchar música relajante', 'Estrés laboral', 'Programar una cita para sesión psicológica', false),
(4, '555-4444', 'Médica', '2023-12-05 08:00:00', 1, NULL, '12345678A', NULL, 'Llamada de broma', NULL, true),
(5, '555-3333', 'Médica', '2023-12-06 11:45:00', 3, 1, '56789012C', 'Descansar y aplicar hielo', 'Lesión en la pierna', 'Visitar a la enfermera para revisión', false),
(6, '555-2222', 'Psicológica', '2023-12-07 14:30:00', 4, 3, '98765432B', 'Practicar técnicas de relajación', 'Estrés laboral', 'Agendar sesión con el psicólogo', false),
(7, '555-1111', 'Enfermera', '2023-12-08 09:15:00', 5, 2, '23456789D', 'Aplicar vendaje en la herida', 'Quemadura leve', 'Agendar revisión con la enfermera', false),
(8, '555-0000', 'Médica', '2023-12-09 15:45:00', 6, 1, '45678901F', 'Descansar y mantener la pierna elevada', 'Torcedura en el tobillo', 'Agendar cita con el médico', false),
(9, '555-9999', 'Enfermera', '2023-12-10 12:30:00', 9, 2, '67890123H', 'Aplicar crema en la picadura', 'Picadura de insecto', 'Agendar revisión con la enfermera', false),
(10, '555-8888', 'Molestia', '2023-12-11 07:00:00', 10, NULL, '89012345J', NULL, 'Llamada de broma', NULL, true);



select * from Llamada where estado != "cerrar";
select * from Llamada;
SELECT * FROM Llamada where estado = "derivarespecialista";
select estado From llamada;
SELECT * FROM Llamada WHERE estado != 'cerrar' OR estado IS NULL;


SELECT * From Paciente;
