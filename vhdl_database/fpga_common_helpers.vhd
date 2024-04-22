library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package helpers is

    function to_std_logic(p: boolean) return std_logic;

    function sum(vector: std_logic_vector) return integer;

    function "+"(a: integer; b: std_logic) return integer;

    function to_integer(a: std_logic) return integer;

    function scanl1_xor(data: std_logic_vector) return std_logic_vector;

end helpers;

package body helpers is

    function to_std_logic(p: boolean)
        return std_logic
    is begin
        if p then
            return '1';
        else
            return '0';
        end if;
    end;
    
        function scanl1_xor(data: std_logic_vector)
        return std_logic_vector
    is
        variable scan : std_logic_vector(0 to data'length-1);
    begin
        scan(0) := data(0);
        for i in 1 to data'length-1 loop
            scan(i) := data(i) xor scan(i-1);
        end loop;
        return scan;
    end;

    function sum(vector: std_logic_vector)
        return integer
    is
        variable acc : integer := 0;
    begin
            for i in vector'range loop
                acc := acc + vector(i);
            end loop;
            return acc;
    end;

    function "+"(a: integer; b: std_logic)
        return integer
    is begin
            return a + to_integer(b);
    end;

    function to_integer(a: std_logic)
        return integer
    is begin
        return std_logic'pos(a);
    end;

end helpers;