library IEEE;

use IEEE.std_logic_1164.all;

entity one_bit_adder is 
    port(
        x, y, c_in : in std_logic; 
        o, c_out : out std_logic
    );
end one_bit_adder;

architecture behavioral of one_bit_adder is
    
begin

    o <= (x xor (y xor c_in));
    c_out <= ((y and c_in) or (x and c_in) or (x and y));

end behavioral;
