create database empresa_joins;
use empresa_joins;

-- Tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    DEPCODIGO integer PRIMARY KEY auto_increment,
    DEPNOME VARCHAR(50)
);

-- Tabela FUNCIONARIO
CREATE TABLE FUNCIONARIO (
    FUNCODIGO integer PRIMARY KEY auto_increment,
    DEPCODIGO integer not null,
    FUNNOME VARCHAR(100) not null,
    FUNNASCIMENTO DATE not null,
    FUNSALARIO decimal(10, 2) not null,
    FOREIGN KEY (DEPCODIGO) REFERENCES DEPARTAMENTO(DEPCODIGO)
);

-- Tabela DEPENDENTE
CREATE TABLE DEPENDENTE (
    DEPENCODIGO INT PRIMARY KEY auto_increment,
    FUNCODIGO INT not null,
    DEPENNOME VARCHAR(100) not null,
    FOREIGN KEY (FUNCODIGO) REFERENCES FUNCIONARIO(FUNCODIGO)
);

-- 1. Inserindo 10 linhas na tabela DEPARTAMENTO
INSERT INTO DEPARTAMENTO (DEPNOME)
VALUES
('Recursos Humanos'),
('Tecnologia da Informação'),
('Financeiro'),
('Marketing'),
('Vendas'),
('Operações'),
('Jurídico'),
('Logística'),
('Produção'),
('Qualidade');

-- 2. Inserindo 10 linhas na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (DEPCODIGO, FUNNOME, FUNNASCIMENTO, FUNSALARIO)
VALUES
(1, 'Ana Silva', '1990-05-15', 5500.00),        -- DEP 1 (RH)
(2, 'Bruno Costa', '1988-11-01', 7200.00),     -- DEP 2 (TI)
(3, 'Carla Dias', '1995-02-20', 4800.00),      -- DEP 3 (Financeiro)
(4, 'Daniel Moreira', '1992-09-30', 6100.00),  -- DEP 4 (Marketing)
(5, 'Elisa Fernandes', '1985-07-12', 8000.00), -- DEP 5 (Vendas)
(1, 'Fábio Guedes', '1998-01-05', 3900.00),      -- DEP 1 (RH)
(2, 'Gabriela Lima', '1983-03-18', 9500.00),   -- DEP 2 (TI)
(8, 'Heitor Bastos', '1993-12-25', 4300.00),    -- DEP 8 (Logística)
(9, 'Isabela Rocha', '1996-06-08', 4100.00),    -- DEP 9 (Produção)
(5, 'Jonas Martins', '1991-04-14', 7600.00);    -- DEP 5 (Vendas)

-- 3. Inserindo 10 linhas na tabela DEPENDENTE
INSERT INTO DEPENDENTE (FUNCODIGO, DEPENNOME)
VALUES
(1, 'Lucas Silva'),   -- Dependente da Ana (Func. 1)
(1, 'Maria Silva'),   -- Dependente da Ana (Func. 1)
(2, 'Sofia Costa'),   -- Dependente do Bruno (Func. 2)
(3, 'Laura Dias'),    -- Dependente da Carla (Func. 3)
(3, 'Marcos Dias'),   -- Dependente da Carla (Func. 3)
(5, 'Arthur Fernandes'), -- Dependente da Elisa (Func. 5)
(5, 'Júlia Fernandes'), -- Dependente da Elisa (Func. 5)
(7, 'Pedro Lima'),    -- Dependente da Gabriela (Func. 7)
(8, 'Beatriz Bastos'), -- Dependente do Heitor (Func. 8)
(10, 'Rafael Martins'); -- Dependente do Jonas (Func. 10)

select * from funcionario;
select * from departamento;
select * from dependente;

#quais são os funcionarios que possuem dependentes
select FUNC.FUNNOME as NOME_FUNCIONARIO, DEP.DEPENNOME as NOME_DEPENDENTE
from FUNCIONARIO FUNC
inner join DEPENDENTE DEP
on FUNC.FUNCODIGO = DEP.FUNCODIGO;

#left join vai trazer da tabela funcionario todos até quem nao tem dependente
select FUNC.FUNNOME as NOME_FUNCIONARIO, DEP.DEPENNOME as NOME_DEPENDENTE
from FUNCIONARIO FUNC
left join DEPENDENTE DEP
on FUNC.FUNCODIGO = DEP.FUNCODIGO;

#retornará os unicos valores que não possuem relação com a outra tabela
select FUNC.FUNNOME as NOME_FUNCIONARIO, DEP.DEPENNOME as NOME_DEPENDENTE
from FUNCIONARIO FUNC
left join DEPENDENTE DEP
on FUNC.FUNCODIGO = DEP.FUNCODIGO
where DEP.FUNCODIGO is null;

#ele retornará a tabela da direita junto das correspondencias da tabela esquerda (chave estrangeira)
select FUNC.FUNNOME as NOME_FUNCIONARIO, DEP.DEPENNOME as NOME_DEPENDENTE
from FUNCIONARIO FUNC
right join DEPENDENTE DEP
on FUNC.FUNCODIGO = DEP.FUNCODIGO;

#vai trazer a tabela depententes junto dos que nao tem dependentes
select FUNC.FUNNOME as NOME_FUNCIONARIO, DEP.DEPENNOME as NOME_DEPENDENTE
from FUNCIONARIO FUNC
right join DEPENDENTE DEP
on FUNC.FUNCODIGO = DEP.FUNCODIGO
where FUNC.FUNCODIGO is null;

#consultará todos os registros correspondentes e não correspondentes
select F.FUNNOME as NOME_FUNCIONARIO, D.DEPENNOME as NOME_DEPENDENTE
from FUNCIONARIO F
left join DEPENDENTE D
on F.FUNCODIGO = D.FUNCODIGO

union all     -- ele uni as duas partes direita e esquerda

select F.FUNNOME as NOME_FUNCIONARIO, D.DEPENNOME as NOME_DEPENDENTE
from FUNCIONARIO F
right join DEPENDENTE D
on F.FUNCODIGO = D.FUNCODIGO
where F.FUNCODIGO is null;

