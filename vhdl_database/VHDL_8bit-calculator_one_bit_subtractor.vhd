library IEEE;

use IEEE.std_logic_1164.all;

entity one_bit_subtractor is 
    port(
        x, y, b_in : in std_logic; 
        d, b_out : out std_logic
    );
end one_bit_subtractor;

architecture behavioral of one_bit_subtractor is

begin

    d <= b_in xor (x xor y);
    b_out <= ((not x) and y) or (b_in and (not (x xor y)));
    
end behavioral;
