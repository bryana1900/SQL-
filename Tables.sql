/*En este Querry se crea la base de datos con sus tablas, con sus campos y respectivas restricciones

Se crea la base de datos*/
Create DATABASE TI412_Proyecto_Grupo4

---Se usa la base de datos---
Use TI412_Proyecto_Grupo4

---Crear Tabla Gimnasio---
Create Table TGimnasio(
Codigo Int PRIMARY KEY,
Nombre_Marca Varchar(max) null,
Contacto_General Numeric not null,
Telefono Numeric null
)

---Crear Tabla Sedes---
Create Table TSedes(
Id Int PRIMARY KEY IDENTITY(1,1),
Nombre Varchar(max) null,
Provincia Varchar(max) null,
Canton Varchar(max) null,
Correo Varchar(max) null,
Telefono1 Numeric not null,
Telefono2 Numeric not null,
Codigo_Gimnasio Int not null,
)

---Crear tabla Personal---
Create Table TPersonal(
ID Int PRIMARY KEY Identity(1,1),
ID_Sede Int not null,
ID_Instructor Int not null,
ID_Funcionarios Int not null,
Datos Varchar(max) null
)

---Crear tabla Instructores---
Create Table TInstructores(
Cedula Int PRIMARY KEY,
Nombre Varchar(max) null,
Telefono Numeric null,
Correo Varchar(max) null,
Fecha_Nacimiento Date,
Salario Money null,
Certificaciones Varchar(max) null,
)

-----Crear Tabla Funcionarios-----
Create Table TFuncionarios(
Cedula Int PRIMARY KEY,
Nombre Varchar(max) null,
Telefono Numeric null,
Correo Varchar(max) null,
FechaNacimiento Date null,
Salario Money null,
Puesto Varchar(max) null,
)

-----Crear Tabla Clientes-----
Create Table TClientes(
Cedula Int PRIMARY KEY,
Nombre Varchar(max) null,
Telefono Numeric null,
Correo Varchar(max) null,
FechaNacimiento Date null,
Estatura Decimal(5,2) null,
Sexo Char(1) null,
AltoRiesgo Char(2) not null,
Codigo_Gimnasio  int not null,
ID_Sede int not null,
ID_Instructor int not null,
)

---Crear Tabla Medicion---
Create Table TMedicion(
Id Int PRIMARY KEY identity(1,1),
Peso Decimal(5,2) null,
PorcentajeGrasa Decimal(5,2) null,
PorcentajeMusculo Decimal(5,2) null,
Edad_Metabolica Decimal(5,2) null,
PorcentajeGrasaViceral Decimal(5,2) null,
Hora time null,
Fecha Date null,
Edad Tinyint null,
Sexo Char(1),
Estatura Decimal(5,2),
Id_Cliente int not null,
ID_Instructor int not null,
Id_Padecimiento int not null,
)

---Crear Tabla Padecimientos---
Create Table TPadecimientos(
Id int PRIMARY KEY identity(1,1),
TipoNombre varchar(max) null,
)

---Crear Tabla Rutina---
Create table TRutina(
Id Int Primary Key Identity(1,1),
Fecha_Inicio Date not null,
Fecha_Fin Date null,
Id_Medicion int not null,
Id_Ejercico int not null,
)

---Crear Tabla Ejercico---
Create table TEjercico(
Id Int Primary Key Identity(1,1),
Nombre varchar(max) null,
Zona_Muscular varchar(max) null,
Tipo varchar(max) null,
)

---Crear Tabla Reporte---
Create table TReporte(
Id Int Primary Key Identity(1,1),
Proteina Varchar(max) not null,
Vaso_Agua Varchar(max) not null,
Id_Rango_GrasaVicera int not null,
Id_Rango_Imc int not null,
Id_Rango_Peso int not null,
Id_Rango_Grasa int not null,
Id_Rango_Musculo int not null,
Id_Medicion int not null,
)

---Crear Tabla Rango_GrasaVicera---
Create table TRango_GrasaVicera(
Id int primary key identity(1,1),
Sexo Char(1) null,
Edad Tinyint null,
Altura Decimal(5,2) null,
PorcentajeIdeal Varchar(max) null,
TipoMalo Varchar(max) null,
)

---Crear Tabla Rango_Imc---
Create table TRango_Imc(
Id Int Primary Key Identity(1,1),
Porcentaje Varchar(max),
Tipo Varchar(max) null
)

---Crear Tabla Rango_Peso---
Create table TRango_Peso(
Id Int primary key identity(1,1),
Estatura Decimal(5,2),
Sexo Char(1),
Edad Tinyint null,
Porcentaje  Varchar(max)
)

---Crear Tabla Rango_Grasa---
Create table TRango_Grasa(
Id int primary key identity(1,1),
Edad Varchar(max) null,
Sexo Char(1) null,
Estatura Decimal(5,2),
Porcentaje Varchar(max)
)

---Crear Tabla Rango_Musculo---
Create table TRango_Musculo(
Id int primary key identity(1,1),
Estatura Decimal(5,2),
Sexo Char(1),
Edad Tinyint null,
Porcent_Musuculo Varchar(max)
)

---Crear FOREIGN KEY DE Sedes---
ALTER TABLE TSedes ADD FOREIGN KEY (Codigo_Gimnasio) REFERENCES TGimnasio(Codigo)
---Crear FOREIGN KEY DE Personal---
ALTER TABLE TPersonal ADD FOREIGN KEY (ID_Sede) REFERENCES TSedes(Id)
ALTER TABLE TPersonal ADD FOREIGN KEY (ID_Instructor) REFERENCES TInstructores(Cedula)
ALTER TABLE TPersonal ADD FOREIGN KEY (ID_Funcionarios) REFERENCES TFuncionarios(Cedula)
---Crear FOREIGN KEY DE Clientes---
ALTER TABLE TClientes ADD FOREIGN KEY (Codigo_Gimnasio) REFERENCES TGimnasio(Codigo)
ALTER TABLE TClientes ADD FOREIGN KEY (ID_Sede) REFERENCES TSedes(ID)
ALTER TABLE TClientes ADD FOREIGN KEY (ID_Instructor) REFERENCES TInstructores(Cedula)
---Crear FOREIGN KEY DE Medicion---
ALTER TABLE TMedicion ADD FOREIGN KEY (Id_Cliente) REFERENCES TClientes(Cedula)
ALTER TABLE TMedicion ADD FOREIGN KEY (ID_Instructor) REFERENCES TInstructores(Cedula)
ALTER TABLE TMedicion ADD FOREIGN KEY (Id_Padecimiento) REFERENCES TPadecimientos(Id)
---Crear FOREIGN KEY DE Rutina---
ALTER TABLE TRutina ADD FOREIGN KEY (Id_Medicion) REFERENCES TMedicion(Id)
ALTER TABLE TRutina ADD FOREIGN KEY (Id_Ejercico) REFERENCES TEjercico(Id)
---Crear FOREIGN KEY DE Reporte---
ALTER TABLE TReporte ADD FOREIGN KEY (Id_Rango_GrasaVicera) REFERENCES TRango_GrasaVicera(Id)
ALTER TABLE TReporte ADD FOREIGN KEY (Id_Rango_Imc) REFERENCES TRango_Imc(Id)
ALTER TABLE TReporte ADD FOREIGN KEY (Id_Rango_Peso) REFERENCES TRango_Peso(Id)
ALTER TABLE TReporte ADD FOREIGN KEY (Id_Rango_Grasa) REFERENCES TRango_Grasa(Id)
ALTER TABLE TReporte ADD FOREIGN KEY (Id_Rango_Musculo) REFERENCES TRango_Musculo(Id)
ALTER TABLE TReporte ADD FOREIGN KEY (Id_Medicion) REFERENCES TMedicion(Id)

---Restricciones TCliente; El Sexo solo puede ser F=Femenino M=Masculino O=Otro y por default es ‘M’---     
Alter table TClientes add constraint CK_Validar CHECK(Sexo in ('F','M','O'))
Alter table TClientes add default 'M' for Sexo
---Restricciones TCliente; El Alto Riesgo solo puede ser SI y NO y por default es ‘No’---   
Alter table TClientes add constraint CK_ValidarRiesgo CHECK(AltoRiesgo in ('SI','NO'))
Alter table TClientes add default 'NO' for AltoRiesgo

---Restricciones TMedicion; Por default es la fecha se tomara el dia que se hace la medicion es decir defualt ‘GETDATE()’---  
Alter table TMedicion add default GETDATE() for Fecha
---Restricciones TMedicion; El Sexo solo puede ser F=Femenino M=Masculino O=Otro y por default es ‘M’---     
Alter table TMedicion add constraint CK_ValidarMedicion CHECK(Sexo in ('F','M','O'))
Alter table TMedicion add default 'M' for Sexo

---Restricciones TRango_GrasaVicera; El Sexo solo puede ser F=Femenino M=Masculino O=Otro y por default es ‘M’---     
Alter table TRango_GrasaVicera add constraint CK_ValidarViceral CHECK(Sexo in ('F','M','O'))
Alter table TRango_GrasaVicera add default 'M' for Sexo

---Restricciones TRango_Peso; El Sexo solo puede ser F=Femenino M=Masculino O=Otro y por default es ‘M’---     
Alter table TRango_Peso add constraint CK_ValidarPeso CHECK(Sexo in ('F','M','O'))
Alter table TRango_Peso add default 'M' for Sexo

---Restricciones TRango_Grasa; El Sexo solo puede ser F=Femenino M=Masculino O=Otro y por default es ‘M’---     
Alter table TRango_Grasa add constraint CK_ValidarGrasa CHECK(Sexo in ('F','M','O'))
Alter table TRango_Grasa add default 'M' for Sexo

---Restricciones TRango_Musculo; El Sexo solo puede ser F=Femenino M=Masculino O=Otro y por default es ‘M’---     
Alter table TRango_Musculo add constraint CK_ValidarMusculo CHECK(Sexo in ('F','M','O'))
Alter table TRango_Musculo add default 'M' for Sexo