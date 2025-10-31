create database empresaJoin2;
use empresaJoin2;

create table departamento(
	id bigint primary key auto_increment,
    nome varchar(255)
);

create table funcionario(
	id int primary key auto_increment,
    salario decimal(10,2),
    nome varchar(100),
    id_departamento bigint,
    foreign key (id_departamento) references departamento(id)
);

create table dependente(
	id int primary key auto_increment,
    nome varchar(100),
    id_funcionario int,
    foreign key (id_funcionario) references funcionario(id)
);

#implementações
insert into departamento(nome)
values('Vendas'),
('Marketing'),
('Financeiro'),
('Logística'),
('Produção');

select * from departamento;

insert into funcionario(salario, nome, id_departamento)
values (5500.00, 'Ana Silva', 1), 
(7200.00, 'Bruno Costa', 2),
(4800.00, 'Carla Dias', 3),
(4100.00, 'Daniel Moreira', 4),
(8000.00, 'Elisa Fernandes', 5);

select * from funcionario;

insert into dependente(nome, id_funcionario)
values ('Rafael Silva', 1),
('Maria Silva', 1),
('Aleff Costa', 1),
('Livia Dias', 3),
('Alexandre Moreira', 3),
('Pedro Fernandes', 5);

select * from dependente;

#mostrar funcionarios que possuem mais 
select func.nome as nome_funcionario,
	   count(dep.id) as qtd_dependentes
from funcionario func
inner join dependente dep 
on func.id = dep.id_funcionario
group by func.nome
having count(dep.id) > 1;

#mostre os departamentosem e seus funcionarios ordem alfabetica
select dep.nome as nome_departamento,
       func.nome as nome_funcionario
from departamento dep
join funcionario func
on dep.id = func.id_departamento
order by dep.nome asc, func.nome asc;

#lista de funcionarios que possuem dependentes e os que não possuem
select func.nome as nome_funcionario, dep.nome as nome_dependente
from funcionario func
left join dependente dep
on func.id = dep.id_funcionario;






