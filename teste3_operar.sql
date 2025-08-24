-- teste 3: usar function OPERAR
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.operar(5,4);  --(x, y)
    DBMS_OUTPUT.PUT_LINE(v_result);
end;