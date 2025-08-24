-- teste 2: modificar posição no eixo x e y
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.movimentar('y', 8); -- não funciona mais pois MOVIMENTAR foi privado
    DBMS_OUTPUT.PUT_LINE(v_result);
end;