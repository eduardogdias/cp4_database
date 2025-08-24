-- Sobre a package:
-- É composta por 3 functions (OPERAR, MOTOR e MOVIMENTAR), sendo que o usuário pode
-- ligar e delisgar o motor manualmente, e operar o veículo caso o motor esteja ligado;
-- Ao operar o veículo e movimenta-lo, o motor será desligado automativamente;
-- MOVIMENTAR só pode ser acessado por OPERAR dentro da package.
---------------------------------------------------------------------------------------

-- Criando a tabela ESTADO
CREATE TABLE ESTADO (ATRIBUTO VARCHAR2(10), VALOR NUMBER(2));
INSERT INTO ESTADO VALUES ('MOTOR',0);
INSERT INTO ESTADO VALUES ('EIXO X',0);
INSERT INTO ESTADO VALUES ('EIXO Y',0);

select * from estado;

-- ATRIBUTO | VALOR
-- MOTOR    | 0
-- EIXO X   | 0
-- EIXO Y   | 0

---------------------------------------------------------------------------------------

-- Testando Operar o veículo com o motor desligado:
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.operar(5,4);  --(x, y)
end;

-- Resultado no console:
-- Motor desligado. Ligue o motor antes de operar

---------------------------------------------------------------------------------------

-- Ligando o motor
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.motor('ligar'); -- parâmetros aceitos: LIGAR/DESLIGAR
end;

-- Resultado no console:
-- Motor Ligado

select * from estado;

-- ATRIBUTO | VALOR
-- MOTOR    | 1
-- EIXO X   | 0
-- EIXO Y   | 0

---------------------------------------------------------------------------------------

-- Passando pelo Ponto 1 (x=1, y=1)
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.operar(1,1);
end;

-- Resultado no console:
-- Veículo movimentado no eixo X para a posição 1
-- Veículo movimentado no eixo Y para a posição 1
-- Operação realizada com sucesso para posição (1,1)
-- Motor Desligado

select * from estado;

-- ATRIBUTO | VALOR
-- MOTOR    | 0
-- EIXO X   | 1
-- EIXO Y   | 1


---------------------------------------------------------------------------------------

-- Passando pelo Ponto 2 (x=2, y=2)
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.motor('ligar'); -- mudou o valor do motor pra 1
    v_result := veiculo_pkg.operar(2,2);    -- mudou o valor do motor pra 0 após a movimentação
end;


-- Resultado no console:
-- Motor Ligado
-- Veículo movimentado no eixo X para a posição 2
-- Veículo movimentado no eixo Y para a posição 2
-- Operação realizada com sucesso para posição (2,2)
-- Motor Desligado

select * from estado;

-- ATRIBUTO | VALOR
-- MOTOR    | 0
-- EIXO X   | 2
-- EIXO Y   | 2


---------------------------------------------------------------------------------------

-- Passando pelo Ponto 3 (x=4, y=3)
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.motor('ligar'); 
    v_result := veiculo_pkg.operar(4,3);  
end;


-- Resultado no console:
-- Motor Ligado
-- Veículo movimentado no eixo X para a posição 4
-- Veículo movimentado no eixo Y para a posição 3
-- Operação realizada com sucesso para posição (4,3)
-- Motor Desligado

select * from estado;

-- ATRIBUTO | VALOR
-- MOTOR    | 0
-- EIXO X   | 4
-- EIXO Y   | 3


---------------------------------------------------------------------------------------

-- Passando pelo Ponto 4 (x=6, y=3)
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.motor('ligar'); 
    v_result := veiculo_pkg.operar(6,3);  
end;


-- Resultado no console:
-- Motor Ligado
-- Veículo movimentado no eixo X para a posição 6
-- Veículo movimentado no eixo Y para a posição 3
-- Operação realizada com sucesso para posição (6,3)
-- Motor Desligado

select * from estado;

-- ATRIBUTO | VALOR
-- MOTOR    | 0
-- EIXO X   | 6
-- EIXO Y   | 3


---------------------------------------------------------------------------------------

-- Passando pelo Ponto 5 (x=4, y=1)
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.motor('ligar'); 
    v_result := veiculo_pkg.operar(4,1);  
end;


-- Resultado no console:
-- Motor Ligado
-- Veículo movimentado no eixo X para a posição 4
-- Veículo movimentado no eixo Y para a posição 1
-- Operação realizada com sucesso para posição (4,1)
-- Motor Desligado

select * from estado;

-- ATRIBUTO | VALOR
-- MOTOR    | 0
-- EIXO X   | 4
-- EIXO Y   | 1