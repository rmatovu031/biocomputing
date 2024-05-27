##


##creating a biosample database using sqlite3

sqlite3 biosample.db

#### creating tables and their relationships

# creating the disease table
CREATE TABLE disease (
id VARCHAR(3) PRIMARY KEY,
name TEXT,
type TEXT
);

# creating the patient table
CREATE TABLE patient (
id TEXT PRIMARY KEY,
age INTEGER,
sex VARCHAR(1)
);

# creating the patient_disease to emulate the many-to-many relationship between the disease and patient entities
CREATE TABLE patient_disease (
patient_id TEXT,
disease_id VARCHAR(3),
FOREIGN KEY (patient_id) REFERENCES patient(id),
FOREIGN KEY (disease_id) REFERENCES disease(id)
);

# creating the sample table
CREATE TABLE sample (
id VARCHAR(4) PRIMARY KEY ,
type TEXT,
collection_date TEXT,
patient_id TEXT,
FOREIGN KEY (patient_id) REFERENCES patient(id)
);

#creating the dna table
CREATE TABLE dna (
dna_id VARCHAR(3) PRIMARY KEY,
amount INTEGER,
purity FLOAT,
sample_id INTEGER,
squencer_id VARCHAR(3),
FOREIGN KEY (squencer_id) REFERENCES squencer(id),
FOREIGN KEY (sample_id) REFERENCES sample(id)
);

# creating the squencer table
CREATE TABLE squencer(
id VARCHAR(3) PRIMARY KEY,
name TEXT
);


## Inserting records into the tables

# entries for the disease table
INSERT INTO disease (id, name, type) VALUES ("TB1", "Tuberculosis", "Infectious");
INSERT INTO disease (id, name, type) VALUES ("INF", "Influenza", "Infectious");
INSERT INTO disease (id, name, type) VALUES ("SCA", "Sickle Cell Anaemia", "Genetic");

# entries for the patient table
INSERT INTO patient ("id", "age", "sex") VALUES ("ptfred1", 46, "M");
INSERT INTO patient ("id", "age", "sex") VALUES ("exjoan", 13, "F");
INSERT INTO patient ("id", "age", "sex") VALUES ("fjsmith", 35, "M");

# entries for the sample table
INSERT INTO sample ("id", "type", "collection_date") VALUES ("4566","saliva", 20240223);
INSERT INTO sample ("id", "type", "collection_date") VALUES ("6647","blood", 20240412);
INSERT INTO sample ("id", "type", "collection_date") VALUES ("9876","urine", 20240422);

# entries for the dna table
INSERT INTO dna ("dna_id", "amount", "purity") VALUES ("d465",76, 0.79);
INSERT INTO dna ("dna_id", "amount", "purity") VALUES ("d434",56, 0.97);
INSERT INTO dna ("dna_id", "amount", "purity") VALUES ("d347",65, 0.87);

# entries for the squencer table
INSERT INTO squencer ("id", "name") VALUES ("S01","sanger");
INSERT INTO squencer ("id", "name") VALUES ("S02","ilumina");
INSERT INTO squencer ("id", "name") VALUES ("S03","Thermo");

## 5. query to select all the diseases in the database
SELECT * FROM disease;
