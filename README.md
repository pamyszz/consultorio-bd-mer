# 📋 Banco de Dados do Consultório Médico

Este projeto configura um banco de dados para gerenciar informações de pacientes, médicos, consultas e receitas de um consultório médico.

## 🏗️ Estrutura das Tabelas

### Tabela `Tb_Paciente`
- `Id_Paciente`: INT, chave primária, auto-incremento
- `Nome_Paciente`: VARCHAR(100), não nulo
- `Data_Nascimento_Paciente`: DATE, não nulo
- `Genero_Paciente`: ENUM('masculino', 'feminino', 'nao-binario', 'transsexual'), não nulo
- `Cpf_Paciente`: VARCHAR(14), não nulo
- `Convenio`: VARCHAR(50), não nulo

### Tabela `Tb_Medico`
- `Id_Medico`: INT, chave primária, auto-incremento
- `Nome_Medico`: VARCHAR(100), não nulo
- `Data_Nascimento_Medico`: DATE, não nulo
- `Genero_Medico`: ENUM('m', 'f', 'nao-binario', 'transsexual'), não nulo
- `Cpf_Medico`: VARCHAR(14), não nulo
- `Crm_Medico`: VARCHAR(13), não nulo
- `Especialidade_Medico`: VARCHAR(30), não nulo
- `Turno_Medico`: ENUM('manha', 'tarde', 'noite', 'madrugada'), não nulo
- `Contato_Medico`: VARCHAR(15), não nulo

### Tabela `Tb_Consulta`
- `Id_Consulta`: INT, chave primária, auto-incremento
- `Data_Consulta`: DATE, não nulo
- `Hora_Consulta`: TIME, não nulo
- `Fk_Id_Medico`: INT, chave estrangeira referenciando `Tb_Medico(Id_Medico)`
- `Fk_Id_Paciente`: INT, chave estrangeira referenciando `Tb_Paciente(Id_Paciente)`

### Tabela `Tb_Receita`
- `Id_Receita`: INT, chave primária, auto-incremento
- `Prescricao`: VARCHAR(200)
- `Data_Receita`: DATE
- `CID`: VARCHAR(100)
- `Fk_Id_Medico`: INT, chave estrangeira referenciando `Tb_Medico(Id_Medico)`
- `Fk_Id_Paciente`: INT, chave estrangeira referenciando `Tb_Paciente(Id_Paciente)`
- `Fk_Id_Consulta`: INT, chave estrangeira referenciando `Tb_Consulta(Id_Consulta)`

## 🚀 Inserção de Dados

### Tabela `Tb_Paciente`

```sql
INSERT INTO Tb_Paciente (Nome_Paciente, Data_Nascimento_Paciente, Genero_Paciente, Cpf_Paciente) VALUES
('Leonardo Marcilino','2002-04-28', 'masculino','464.499.828-10'),
('Pedro Paulo Soares Pereira','1970-04-22', 'masculino','454.599.851-10'),
('Clarisse Linspector','1920-12-10', 'feminino','214.699.831-00'),
('Matue','1990-12-10', 'masculino','001.699.831-00'),
('Carlos','2000-12-10', 'masculino','101.499.851-00');
```

### Tabela `Tb_Medico`

```sql
INSERT INTO Tb_Medico (Nome_Medico, Data_Nascimento_Medico, Crm_Medico, Genero_Medico, Cpf_Medico, Especialidade_Medico, Turno_Medico, Contato_Medico) values 
('Alicia Rodrigues','1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginecologia', 'manha', '11 99999-9999'),
('Francisco Dantas ', '1975-11-21','CRM/SP 777777','m', '222.222.222-22', 'Fisioterapeuta', 'tarde', '11 99999-9999'),
('Robyn Rihanna Fenty ','1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginicologista','noite', '11 99999-9999'),
('Shaffer Chimere Smith', '1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginicologista', 'madrugada', '11 99999-9999'),
('Beyoncé Giselle Knowles-Carter,', '1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Cirurgião geral', 'madrugada', '11 99999-9999');
```

### Tabela `Tb_Consulta`

```sql
INSERT INTO Tb_Consulta (Data_Consulta, Hora_Consulta, Fk_Id_Paciente, Fk_Id_Medico) VALUES
('2024-05-01','08:30:10','1','1'),
('2024-04-10','09:30:10','2','1'),
('2024-03-11','07:30:10','3','1'),
('2024-02-15','10:30:10','4','1'),
('2024-01-01','11:30:10','1','2');
```

## 📄 Alterações nas Tabelas

### Adição de coluna na tabela `Tb_Paciente`

```sql
ALTER TABLE Tb_Paciente
ADD COLUMN Convenio VARCHAR(50) NOT NULL;
```

### Atualização dos valores da nova coluna `Convenio`

```sql
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
```

## 🗂️ Consultas

### Exibir todos os dados da tabela `Tb_Paciente`

```sql
SELECT * FROM Tb_Paciente;
```

### Exibir a estrutura da tabela `Tb_Paciente`

```sql
DESCRIBE Tb_Paciente;
```

### Exibir dados da tabela `Tb_Consulta` com junção

```sql
SELECT * FROM Tb_Consulta as c
JOIN Tb_Paciente as p
ON c.Id_Consulta = p.Id_Paciente
JOIN Tb_Medico as m
ON c.Id_Consulta = m.Id_Medico;
```

Feito com 💙 por [Pamela](https://github.com/pamyszz)
