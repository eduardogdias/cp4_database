-- teste 1: ligar e desligar motor
set SERVEROUTPUT on
declare
    v_result varchar(100);
begin
    v_result := veiculo_pkg.motor('ligar');
    --v_result := veiculo_pkg.motor('DESLIGAR');
    --DBMS_OUTPUT.PUT_LINE(v_result) ;
end;
