USE magnram_db;
CREATE TABLE Treningsøkt (
	TreningsøktID INT NOT NULL AUTO_INCREMENT,
    Datotid DATETIME,
    Varighet TIME,
    Form int,
    CONSTRAINT PRIMARY KEY (TreningsøktID)
);

CREATE TABLE Gruppe (
	GruppeID INT NOT NULL AUTO_INCREMENT,
    Navn VARCHAR(45),
    CONSTRAINT PRIMARY KEY (GruppeID)
);

CREATE TABLE Øvelse (
	ØvelseID INT NOT NULL AUTO_INCREMENT,
	Navn VARCHAR(45),
    CONSTRAINT PRIMARY KEY (ØvelseID)
); 

CREATE TABLE ØvelseIGruppe (
	ØvelseID INT NOT NULL,
    GruppeID INT NOT NULL,
    CONSTRAINT PRIMARY KEY (ØvelseID, GruppeID),
    CONSTRAINT FOREIGN KEY (ØvelseID) REFERENCES Øvelse(ØvelseID),
    CONSTRAINT FOREIGN KEY (GruppeID) REFERENCES Gruppe(GruppeID)
);

CREATE TABLE ØvelseITreningsøkt (
	ØvelseID INT NOT NULL,
    TreningsøktID INT NOT NULL,
    Prestasjon INT,
    CONSTRAINT PRIMARY KEY (ØvelseID, TreningsøktID),
    CONSTRAINT FOREIGN KEY (ØvelseID) REFERENCES Øvelse(ØvelseID),
    CONSTRAINT FOREIGN KEY (TreningsøktID) REFERENCES Treningsøkt(TreningsøktID)
);

CREATE TABLE FriØvelse (
	ØvelseID INT NOT NULL,
    Beskrivelse VARCHAR(255),
    CONSTRAINT PRIMARY KEY (ØvelseID),
    CONSTRAINT FOREIGN KEY (ØvelseID) REFERENCES Øvelse(ØvelseID)
);

CREATE TABLE Apparat (
	ApparatID INT NOT NULL AUTO_INCREMENT,
    Navn VARCHAR(45),
    Beskrivelse VARCHAR(255),
    CONSTRAINT PRIMARY KEY(ApparatID)
);

CREATE TABLE ApparatØvelse (
	ØvelseID INT NOT NULL,
    AntallKilo INT,
    AntallSett INT,
    ApparatID INT NOT NULL,
    CONSTRAINT PRIMARY KEY (ØvelseID),
    CONSTRAINT FOREIGN KEY (ØvelseID) REFERENCES Øvelse(ØvelseID),
    CONSTRAINT FOREIGN KEY (ApparatID) REFERENCES Apparat(ApparatID)
);