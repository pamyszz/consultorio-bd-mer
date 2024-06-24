CREATE DATABASE Bd_Consultorio;
USE Bd_Consultorio;
/* 
DROP DATABASE bd_consultoriomedico;
*/

/*Tabela paciente*/
CREATE TABLE Tb_Paciente(
	Id_Paciente INT NOT NULL AUTO_INCREMENT, /*chave primária*/  
    Nome_Paciente VARCHAR(100) NOT NULL, /*aceita letras, númertos e caracteres especiais*/  
    Data_Nascimento_Paciente DATE NOT NULL, /*segue o modelo americano ano/mes/dia*/  
    Genero_Paciente ENUM('masculino', 'feminino', 'nao-binario', 'transsexual') NOT NULL, 
    Cpf_Paciente VARCHAR(14) NOT NULL, /*campo aceita valores pré determinados*/
    CONSTRAINT Pk_Id_Paciente PRIMARY KEY (Id_Paciente)
);
INSERT INTO Tb_Paciente (Nome_Paciente, Data_Nascimento_Paciente, Genero_Paciente, Cpf_Paciente) VALUES
('Leonardo Marcilino','2002-04-28', 'masculino','464.499.828-10'),
('Pedro Paulo Soares Pereira','1970-04-22', 'masculino','454.599.851-10'),
('Clarisse Linspector','1920-12-10', 'feminino','214.699.831-00'),
('Matue','1990-12-10', 'masculino','001.699.831-00'),
('Carlos','2000-12-10', 'masculino','101.499.851-00')
; /*Inserir dados nos atributos*/

SELECT * FROM Tb_Paciente; /*Apresentar tabela com os dados*/
describe Tb_Paciente; /*Apresentar estrutura das tabelas*/

Create TABLE Tb_Medico(
	Id_Medico INT AUTO_INCREMENT NOT NULL,
    Nome_Medico VARCHAR(100) NOT NULL,
    Data_Nascimento_Medico DATE NOT NULL,
    Genero_Medico ENUM('m', 'f', 'nao-binario', 'transsexual') NOT NULL,
    Cpf_Medico varchar (14) not null, 
	Crm_Medico VARCHAR(13) NOT NULL,
    Especialidade_Medico VARCHAR(30) NOT NULL,
	Turno_Medico ENUM ('manha','tarde','noite','madrugada') NOT NULL,
    Contato_Medico VARCHAR (15) NOT NULL,
    CONSTRAINT Pk_Id_Medico PRIMARY KEY (Id_Medico)
);

INSERT INTO Tb_Medico (Nome_Medico, Data_Nascimento_Medico, Crm_Medico, Genero_Medico, Cpf_Medico, Especialidade_Medico, Turno_Medico, Contato_Medico) values 
('Alicia Rodrigues','1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginecologia', 'manha', '11 99999-9999'),
('Francisco Dantas ', '1975-11-21','CRM/SP 777777','m', '222.222.222-22', 'Fisioterapeuta', 'tarde', '11 99999-9999'),
('Robyn Rihanna Fenty ','1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginicologista','noite', '11 99999-9999'),
('Shaffer Chimere Smith', '1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginicologista', 'madrugada', '11 99999-9999'),
('Beyoncé Giselle Knowles-Carter,', '1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Cirurgião geral', 'madrugada', '11 99999-9999')
;

Create TABLE Tb_Consulta(
	Id_Consulta INT AUTO_INCREMENT NOT NULL,
    Data_Consulta DATE NOT NULL, /*Uma data de 01/01/1000 a 31/12/9999, no formato YYYY-MM-DD*/
    Hora_Consulta TIME NOT NULL,/*Hora apenas, no formato HH:MM:SS*/
    Fk_Id_Medico INT NOT NULL,
    Fk_Id_Paciente INT NOT NULL,
    CONSTRAINT Pk_Id_Consulta PRIMARY KEY (Id_Consulta), 
    
    CONSTRAINT Fk_Id_Medico FOREIGN KEY (Fk_Id_Medico)
    REFERENCES Tb_Medico (Id_Medico),
    
    CONSTRAINT Fk_Id_Paciente FOREIGN KEY (Fk_Id_Paciente)
    REFERENCES Tb_Paciente (Id_Paciente)
);

INSERT INTO Tb_Consulta (Data_Consulta, Hora_Consulta, Fk_Id_Paciente, Fk_Id_Medico) VALUES
('2024-05-01','08:30:10','1','1'),
('2024-04-10','09:30:10','2','1'),
('2024-03-11','07:30:10','3','1'),
('2024-02-15','10:30:10','4','1'),
('2024-01-01','11:30:10','1','2')
;

CREATE TABLE Tb_Receita(
	Id_Receita INT NOT NULL AUTO_INCREMENT,
    Prescricao VARCHAR(200),
    Data_Receita DATE,
    CID VARCHAR(100),
    Fk_Id_Medico INT NOT NULL,
    Fk_Id_Paciente INT NOT NULL,
	Fk_Id_Consulta INT NOT NULL,
    
    CONSTRAINT Fk_Id_Medico FOREIGN KEY (Fk_Id_Medico)
    REFERENCES Tb_Medico (Id_Medico),
    
    CONSTRAINT Fk_Id_Paciente FOREIGN KEY (Fk_Id_Paciente)
    REFERENCES Tb_Paciente (Id_Paciente),
    
	CONSTRAINT Fk_Id_Consulta FOREIGN KEY (Fk_Id_Consulta)
    REFERENCES Tb_Consulta (Id_Consulta)

);

DROP TABLE Tb_Consulta;
DESCRIBE Tb_Consulta;

ALTER TABLE Tb_Paciente
ADD COLUMN Convenio VARCHAR(50) NOT NULL; /*Alteração na estrutura da tabela */

SELECT * FROM Tb_Consulta as c /*Exibir a tabela*/
join Tb_Paciente as p
on c.Id_Consulta = p.Id_Paciente
join Tb_Medico as m
on c.Id_Consulta = m.Id_Medico;

UPDATE Tb_Paciente
SET Convenio = 'Amil' 
WHERE Id_Paciente IN (1, 2, 3);

UPDATE Tb_Paciente
SET Convenio = 'Bradesco Saúde'
WHERE Id_Paciente = 2;

UPDATE Tb_Paciente
SET Convenio = 'Porto Seguro'
WHERE Id_Paciente = 3;

UPDATE Tb_Paciente
SET Convenio = 'Saúde Todos'
WHERE Id_Paciente = 4;

UPDATE Tb_Paciente
SET Convenio = 'Notre Dame'
WHERE Id_Paciente = 5;

/* alter table tb_livro 
	add constraint fk_id_autor foreign key (fk_id_autor)
	references tb_autor(pk_id_autor); */


