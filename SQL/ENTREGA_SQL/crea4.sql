CREATE TABLE Piezas(
    Cod# VARCHAR2(4) PRIMARY KEY,
    Denominacion VARCHAR2(40) NOT NULL,
    Precio INT
);

CREATE TABLE PiezaSimple(
    Cods# VARCHAR2(4) REFERENCES Piezas(Cod#),
    
    PRIMARY KEY(Cods#)
);

CREATE TABLE PiezaCompuesta(
    CodC# VARCHAR2(4) REFERENCES Piezas(Cod#),
    
    PRIMARY KEY(CodC#)
);

CREATE TABLE ParteDe(
    CodP# VARCHAR2(4) REFERENCES Piezas(Cod#),
    CodC# VARCHAR2(4) REFERENCES PiezaCompuesta(CodC#),
    Cantidad INT,
    
    PRIMARY KEY(CodP#)
);