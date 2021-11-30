-- Create schemas

-- Create tables
IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Dimension_aerolinea'))
BEGIN
  CREATE TABLE Dimension_aerolinea
  (
    id_aerolinea INT NOT NULL,
    empresa VARCHAR(45),
    PRIMARY KEY(id_aerolinea)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Dimension_fecha'))
BEGIN
  CREATE TABLE Dimension_fecha
  (
    id_fecha INT NOT NULL,
    ano INT NOT NULL,
    mes INT,
    trimestre INT,
    PRIMARY KEY(id_fecha)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Dimension_operacion'))
BEGIN
  CREATE TABLE Dimension_operacion
  (
    id_operacion INT NOT NULL,
    tipo_vuelo VARCHAR(1),
    PRIMARY KEY(id_operacion)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Dimension_avion'))
BEGIN
  CREATE TABLE Dimension_avion
  (
    id_avion INT NOT NULL,
    tipo_equipo VARCHAR(4),
    PRIMARY KEY(id_avion)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Dimension_trafico'))
BEGIN
  CREATE TABLE Dimension_trafico
  (
    id_trafico INT NOT NULL,
    trafico VARCHAR(45),
    PRIMARY KEY(id_trafico)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Tabla_Hechos_Vuelos'))
BEGIN
  CREATE TABLE Tabla_Hechos_Vuelos
  (
    vuelos INT NOT NULL,
    sillas INT,
    pasajeros INT,
    carga_ofrecida FLOAT(2),
    carga_bordo FLOAT(2),
    id_fecha INT,
    id_origen INT,
    id_destino INT,
    id_aerolinea INT,
    id_operacion INT,
    id_trafico INT,
    id_avion INT    
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Dimension_aeropuerto'))
BEGIN
  CREATE TABLE Dimension_aeropuerto
  (
    id_aeropuerto INT NOT NULL,
    iata VARCHAR(3) NOT NULL,
    sigla VARCHAR(3) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    latitud INT,
    longitud INT,
    longitud_pista INT,
    ancho_pista INT,
    pbmo INT,
    elevacion INT,
    resolucion INT,
    numero_vuelos_origen INT,
    gcd_municipal INT,
    gcd_departamento INT,
    municipio VARCHAR(45),
    departamento VARCHAR(45),
    fecha_construccion DATE,
    fecha_vigencia DATE,
    clase VARCHAR(2),
    tipo VARCHAR(45),
    categoria VARCHAR(45),
    propietario VARCHAR(45),
    explotador VARCHAR(45),
    Ano INT,
    InicioVigencia DATE,
    FinalVigencia DATE,
    Actual VARCHAR(1),
    PRIMARY KEY(id_aeropuerto)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Tabla_Hechos_Cobertura'))
BEGIN
  CREATE TABLE Tabla_Hechos_Cobertura
  (
    Distacia DOUBLE NOT NULL,
    poblacion_hombres INT,
    poblacion_mujeres INT,
    poblacion INT,
    id_aeropuerto_mas_cercano INT,
    id_centro_poblado INT,
    Ano INT    
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Dimension_lugar'))
BEGIN
  CREATE TABLE Dimension_lugar
  (
    id_centro_poblado INT NOT NULL,
    tipo_cobertura VARCHAR(100),
    departamento VARCHAR(250),
    municipio VARCHAR(250),
    codigo_departamento INT,
    codigo_municipio INT,
    codigo_centro_poblado INT,
    PRIMARY KEY(id_centro_poblado)
  )
END;


-- Create FKs
ALTER TABLE Tabla_Hechos_Vuelos
    ADD    FOREIGN KEY (id_aerolinea)
    REFERENCES Dimension_aerolinea(id_aerolinea)
;
    
ALTER TABLE Tabla_Hechos_Vuelos
    ADD    FOREIGN KEY (id_fecha)
    REFERENCES Dimension_fecha(id_fecha)
;
    
ALTER TABLE Tabla_Hechos_Vuelos
    ADD    FOREIGN KEY (id_operacion)
    REFERENCES Dimension_operacion(id_operacion)
;
    
ALTER TABLE Tabla_Hechos_Vuelos
    ADD    FOREIGN KEY (id_avion)
    REFERENCES Dimension_avion(id_avion)
;
    
ALTER TABLE Tabla_Hechos_Vuelos
    ADD    FOREIGN KEY (id_trafico)
    REFERENCES Dimension_trafico(id_trafico)
;
    
ALTER TABLE Tabla_Hechos_Vuelos
    ADD    FOREIGN KEY (id_destino)
    REFERENCES Dimension_aeropuerto(id_aeropuerto)
;
    
ALTER TABLE Tabla_Hechos_Vuelos
    ADD    FOREIGN KEY (id_origen)
    REFERENCES Dimension_aeropuerto(id_aeropuerto)
;
    
ALTER TABLE Tabla_Hechos_Cobertura
    ADD    FOREIGN KEY (id_aeropuerto_mas_cercano)
    REFERENCES Dimension_aeropuerto(id_aeropuerto)
;
    
ALTER TABLE Tabla_Hechos_Cobertura
    ADD    FOREIGN KEY (id_centro_poblado)
    REFERENCES Dimension_lugar(id_centro_poblado)
;
    

-- Create Indexes

