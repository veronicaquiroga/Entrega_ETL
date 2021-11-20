-- Create schemas

-- Create tables
IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Fecha'))
BEGIN
  CREATE TABLE Fecha
  (
    idFecha INT NOT NULL,
    Año INT,
    Mes INT,
    Trimestre INT,
    PRIMARY KEY(idFecha)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'AeropuertoHistoria'))
BEGIN
  CREATE TABLE AeropuertoHistoria
  (
    idAeropuertoHistoria INT NOT NULL,
    version INT,
    FeVigIni DATE,
    FeVigFin DATE,
    sigla VARCHAR(4),
    iata VARCHAR(4),
    nombre VARCHAR(45),
    municipio VARCHAR(45),
    departamento VARCHAR(45),
    latitud INT,
    longitud BIGINT,
    longitudPista INT,
    anchoPista BINARY(0),
    pbmo INT,
    elevacion INT,
    resolucion INT,
    numero_vuelos_origen INT,
    gcd_departamento INT,
    gcd_municipio INT,
    fecha_construccion DATE,
    fecha_vigencia DATE,
    clase VARCHAR(45),
    tipo VARCHAR(45),
    propietario VARCHAR(45),
    explotador VARCHAR(45),
    PRIMARY KEY(idAeropuertoHistoria)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'HechoRegistroDeVuelos'))
BEGIN
  CREATE TABLE HechoRegistroDeVuelos
  (
    id INT NOT NULL,
    idAeropuertoHistoriaOrigen INT,
    idAeropuertoHistoriaDestino INT,
    idFecha INT,
    idAerolinea INT,
    idOperacion INT,
    idAvion INT,
    idtrafico INT,
    numVuelos INT,
    numSillas INT,
    numPasajeros INT,
    cargaOfrecida INT,
    cargaBordo INT,
    PRIMARY KEY(id)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Aerolínea'))
BEGIN
  CREATE TABLE Aerolínea
  (
    idAerolinea INT NOT NULL,
    empresa VARCHAR(45),
    PRIMARY KEY(idAerolinea)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Operación'))
BEGIN
  CREATE TABLE Operación
  (
    idOperacion INT NOT NULL,
    TipoVuelo VARCHAR(1),
    PRIMARY KEY(idOperacion)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Avion'))
BEGIN
  CREATE TABLE Avion
  (
    idAvion INT NOT NULL,
    tipoEquipo VARCHAR(4),
    PRIMARY KEY(idAvion)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Trafico'))
BEGIN
  CREATE TABLE Trafico
  (
    idTrafico INT NOT NULL,
    Trafico VARCHAR(45),
    PRIMARY KEY(idTrafico)
  )
END;


-- Create FKs
ALTER TABLE HechoRegistroDeVuelos
    ADD    FOREIGN KEY (idFecha)
    REFERENCES Fecha(idFecha)
;
    
ALTER TABLE HechoRegistroDeVuelos
    ADD    FOREIGN KEY (idAeropuertoHistoriaOrigen)
    REFERENCES AeropuertoHistoria(idAeropuertoHistoria)
;
    
ALTER TABLE HechoRegistroDeVuelos
    ADD    FOREIGN KEY (idAeropuertoHistoriaDestino)
    REFERENCES AeropuertoHistoria(idAeropuertoHistoria)
;
    
ALTER TABLE HechoRegistroDeVuelos
    ADD    FOREIGN KEY (idAerolinea)
    REFERENCES Aerolínea(idAerolinea)
;
    
ALTER TABLE HechoRegistroDeVuelos
    ADD    FOREIGN KEY (idOperacion)
    REFERENCES Operación(idOperacion)
;
    
ALTER TABLE HechoRegistroDeVuelos
    ADD    FOREIGN KEY (idAvion)
    REFERENCES Avion(idAvion)
;
    
ALTER TABLE HechoRegistroDeVuelos
    ADD    FOREIGN KEY (idtrafico)
    REFERENCES Trafico(idTrafico)
;
    

-- Create Indexes

