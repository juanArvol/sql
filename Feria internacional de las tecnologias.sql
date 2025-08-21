-- Crear tablas

CREATE TABLE stands (
    id_stands INT PRIMARY KEY,
    n_one VARCHAR(50),
    n_two VARCHAR(50),
    n_three VARCHAR(50),
    n_four VARCHAR(50),
    n_five VARCHAR(50)
);

CREATE TABLE charlas (
    id_charlas INT PRIMARY KEY,
    cantidad INT,
    id_charla INT,
    FOREIGN KEY (id_charla) REFERENCES charla(id_charla)
);

CREATE TABLE visitante (
    id_visitante INT PRIMARY KEY,
    nombre VARCHAR(50),
    registro VARCHAR(50),
    t_entrada VARCHAR(50)
);

CREATE TABLE visitantes (
    id_visitantes INT PRIMARY KEY,
    cantidad INT,
    id_visitante INT,
    FOREIGN KEY (id_visitante) REFERENCES visitante(id_visitante)
);

CREATE TABLE charla (
    id_charla INT PRIMARY KEY,
    id_patrocinador INT,
    id_visitantes INT,
    FOREIGN KEY (id_visitantes) REFERENCES visitantes(id_visitantes),
    FOREIGN KEY (id_patrocinador) REFERENCES dominio(id_dominio)
);

CREATE TABLE expositor (
    id_expositor INT PRIMARY KEY,
    n_expositor VARCHAR(50),
    id_charlas INT,
    FOREIGN KEY (id_charlas) REFERENCES charlas(id_charlas)
);

CREATE TABLE objeto (
    id_objeto INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT,
    id_expositor INT,
    FOREIGN KEY (id_expositor) REFERENCES expositor(id_expositor)
);

CREATE TABLE pabellon (
    id_pabellon INT PRIMARY KEY,
    n_pabellon VARCHAR(50),
    ubicacion VARCHAR(50),
    id_stands INT,
    tema VARCHAR(50),
    FOREIGN KEY (id_stands) REFERENCES stands(id_stands)
);

CREATE TABLE dominio (
    id_dominio INT PRIMARY KEY,
    n_dominio VARCHAR(50),
    n_stands INT,
    id_pabellon INT,
    FOREIGN KEY (id_pabellon) REFERENCES pabellon(id_pabellon)
);

CREATE TABLE stand (
    id_stand INT PRIMARY KEY,
    n_stand VARCHAR(50),
    id_dominio INT,
    id_objeto INT,
    c_objetos INT,
    FOREIGN KEY (id_dominio) REFERENCES dominio(id_dominio),
    FOREIGN KEY (id_objeto) REFERENCES objeto(id_objeto)
);

CREATE TABLE evento (
    id_evento INT PRIMARY KEY,
    id_dominio INT,
    id_charlas INT,
    id_stands INT,
    FOREIGN KEY (id_dominio) REFERENCES dominio(id_dominio),
    FOREIGN KEY (id_charlas) REFERENCES charlas(id_charlas),
    FOREIGN KEY (id_stands) REFERENCES stands(id_stands)
);

CREATE TABLE feria (
    id_feria INT PRIMARY KEY,
    n_feria VARCHAR(50),
    id_evento INT,
    F_inicio DATE,
    F_fin DATE,
    ciudad VARCHAR(90),
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

INSERT INTO stands VALUES (1, 'Stand A1', 'Stand A2', 'Stand A3', 'Stand A4', 'Stand A5');
INSERT INTO stands VALUES (2, 'Stand B1', 'Stand B2', 'Stand B3', 'Stand B4', 'Stand B5');
INSERT INTO stands VALUES (3, 'Stand C1', 'Stand C2', 'Stand C3', 'Stand C4', 'Stand C5');
INSERT INTO stands VALUES (4, 'Stand D1', 'Stand D2', 'Stand D3', 'Stand D4', 'Stand D5');
INSERT INTO stands VALUES (5, 'Stand E1', 'Stand E2', 'Stand E3', 'Stand E4', 'Stand E5');

INSERT INTO visitante VALUES (1, 'Carlos Pérez', 'REG001', '10:00');
INSERT INTO visitante VALUES (2, 'Ana López', 'REG002', '10:15');
INSERT INTO visitante VALUES (3, 'Juan Ruiz', 'REG003', '11:00');
INSERT INTO visitante VALUES (4, 'Laura Gómez', 'REG004', '11:30');
INSERT INTO visitante VALUES (5, 'Mario Díaz', 'REG005', '12:00');

INSERT INTO visitantes VALUES (1, 1, 1);
INSERT INTO visitantes VALUES (2, 2, 2);
INSERT INTO visitantes VALUES (3, 1, 3);
INSERT INTO visitantes VALUES (4, 3, 4);
INSERT INTO visitantes VALUES (5, 2, 5);

INSERT INTO charla VALUES (1, 1, 1);
INSERT INTO charla VALUES (2, 2, 2);
INSERT INTO charla VALUES (3, 3, 3);
INSERT INTO charla VALUES (4, 4, 4);
INSERT INTO charla VALUES (5, 5, 5);

INSERT INTO charlas VALUES (1, 2, 1);
INSERT INTO charlas VALUES (2, 3, 2);
INSERT INTO charlas VALUES (3, 1, 3);
INSERT INTO charlas VALUES (4, 5, 4);
INSERT INTO charlas VALUES (5, 4, 5);

INSERT INTO expositor VALUES (1, 'Tech Corp', 1);
INSERT INTO expositor VALUES (2, 'BioLife', 2);
INSERT INTO expositor VALUES (3, 'EcoGreen', 3);
INSERT INTO expositor VALUES (4, 'DataSoft', 4);
INSERT INTO expositor VALUES (5, 'InnovaX', 5);

INSERT INTO objeto VALUES (1, 'Gafas VR', 'Realidad virtual inmersiva', 1);
INSERT INTO objeto VALUES (2, 'Biosensor', 'Sensor de salud corporal', 2);
INSERT INTO objeto VALUES (3, 'Eco Lámpara', 'Lámpara con energía solar', 3);
INSERT INTO objeto VALUES (4, 'Smartwatch', 'Reloj con IA integrada', 4);
INSERT INTO objeto VALUES (5, 'Impresora 3D', 'Impresión de prototipos', 5);

INSERT INTO pabellon VALUES (1, 'Pabellón A', 'Zona 1', 1, 'Tecnología');
INSERT INTO pabellon VALUES (2, 'Pabellón B', 'Zona 2', 2, 'Salud');
INSERT INTO pabellon VALUES (3, 'Pabellón C', 'Zona 3', 3, 'Energía');
INSERT INTO pabellon VALUES (4, 'Pabellón D', 'Zona 4', 4, 'Software');
INSERT INTO pabellon VALUES (5, 'Pabellón E', 'Zona 5', 5, 'Innovación');

INSERT INTO dominio VALUES (1, 'Dom. Tecnología', 2, 1);
INSERT INTO dominio VALUES (2, 'Dom. Salud', 3, 2);
INSERT INTO dominio VALUES (3, 'Dom. Energía', 1, 3);
INSERT INTO dominio VALUES (4, 'Dom. Software', 4, 4);
INSERT INTO dominio VALUES (5, 'Dom. Innovación', 2, 5);

INSERT INTO stand VALUES (1, 'Stand Tech', 1, 1, 1);
INSERT INTO stand VALUES (2, 'Stand Bio', 2, 2, 2);
INSERT INTO stand VALUES (3, 'Stand Eco', 3, 3, 3);
INSERT INTO stand VALUES (4, 'Stand Data', 4, 4, 4);
INSERT INTO stand VALUES (5, 'Stand Innova', 5, 5, 5);

INSERT INTO evento VALUES (1, 1, 1, 1);
INSERT INTO evento VALUES (2, 2, 2, 2);
INSERT INTO evento VALUES (3, 3, 3, 3);
INSERT INTO evento VALUES (4, 4, 4, 4);
INSERT INTO evento VALUES (5, 5, 5, 5);

INSERT INTO feria VALUES (1, 'Feria Tech', 1, '2025-08-20', '2025-08-22', 'Madrid');
INSERT INTO feria VALUES (2, 'Feria Salud', 2, '2025-09-01', '2025-09-03', 'Barcelona');
INSERT INTO feria VALUES (3, 'Feria Verde', 3, '2025-10-05', '2025-10-07', 'Valencia');
INSERT INTO feria VALUES (4, 'Feria Soft', 4, '2025-11-12', '2025-11-14', 'Sevilla');
INSERT INTO feria VALUES (5, 'Feria Innova', 5, '2025-12-01', '2025-12-03', 'Bilbao');

ALTER table stands add column n_six VARCHAR(50);

ALTER table stands drop column n_six;