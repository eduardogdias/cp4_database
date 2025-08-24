-- teste 2: modificar posição no eixo x e y
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.movimentar('x', 9);
    
    DBMS_OUTPUT.PUT_LINE(v_result);
end;