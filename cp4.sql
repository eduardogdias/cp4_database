create or replace package veiculo_pkg is
    -- função pública para motor, recebe 'LIGAR' ou 'DESLIGAR'
    function motor(p_acao varchar2) return varchar2;

    -- função pública para operar veículo passando as coordenadas: x,y
    function operar(p_x number, p_y number) return varchar;
end veiculo_pkg;


create or replace package body veiculo_pkg is

    function motor(p_acao varchar2) return varchar2;
    function movimentar(p_eixo char, p_posicao number) return varchar;
    --function operar(p_x number, p_y number) return varchar;
    
    
    -- =============================================================
    -- Função motor (pública)
    -- o usuário deve ligar o motor antes de fazer alguma operação
    -- =============================================================
    function motor(p_acao varchar2) 
    return varchar2
    is
        v_msg varchar2(100);
    begin
        if upper(p_acao) = 'LIGAR' then
            update estado set valor = 1 where atributo = 'MOTOR';
            v_msg := 'Motor Ligado';
        elsif upper(p_acao) = 'DESLIGAR' then
            update estado set valor = 0 where atributo = 'MOTOR';
            v_msg := 'Motor Desligado';
        else
            raise_application_error(-20001, 'Ação inválida para motor. Digite LIGAR ou DESLIGAR');
        end if;

        dbms_output.put_line(v_msg);
        return v_msg;
    end motor;

    -- =============================================================
    -- Função movimentar (privada)
    -- recebe o eixo e a posição que se deseja movimentar o veículo
    -- =============================================================
    function movimentar(p_eixo char, p_posicao number) 
    return varchar
    is
        v_msg varchar(100);
    begin
        -- movimenta o veículo para o ponto informado
        if upper(p_eixo) = 'X' then
            update estado set valor = p_posicao where atributo = 'eixo x';
            v_msg := 'Veículo movimentado no eixo X para a posição '|| p_posicao;
        elsif upper(p_eixo) = 'Y' then
            update estado set valor = p_posicao where atributo = 'eixo y';
            v_msg := 'Veículo movimentado no eixo Y para a posição '|| p_posicao;
        else
            raise_application_error(-20002, 'Eixo inválido: '||p_eixo);
        end if;

        dbms_output.put_line(v_msg);
        return v_msg;
    end movimentar;

    -- ====================================================================
    -- Função operar (pública)
    -- recebe os dois eixos, valida motor, chama Movimentar e desliga motor
    -- ====================================================================
    function operar(p_x number, p_y number) 
    return varchar 
    is
        v_motor estado.motor%type;
        v_msg varchar(200);
        v_resultado varchar(200);
    begin
        -- verifica motor
        select valor into v_motor from estado where atributo = 'motor';
        if v_motor = 0 then
            v_msg := 'Motor desligado. Ligue o motor antes de operar';
            dbms_output.put_line(v_msg);
            return v_msg;
        end if;

        -- se o motor estiver ligado:
        v_resultado := movimentar('X', p_x);
        dbms_output.put_line(v_resultado);
        v_resultado := ('Y', p_y);
        dbms_output.put_line(v_resultado);
        
        v_msg := 'Operação realizada com sucesso para posicao ('||p_x||','||p_y||')';
        dbms_output.put_line(v_msg);
        v_msg := motor('DESLIGAR');
        dbms_output.put_line(v_msg);
        
        return v_msg;
    end operar;

end veiculo_pkg;

