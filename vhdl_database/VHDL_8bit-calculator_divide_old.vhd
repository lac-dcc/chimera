library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity divide is
    port (
        clk, rst : in std_logic;
        in1, in2 : in std_logic_vector (0 to 7); 
        output : out std_logic_vector (0 to 7);
        output_valid : out std_logic
    );
end divide;

architecture divide_impl of divide is
begin
    output <= 
        std_logic_vector(
            to_unsigned(conv_integer(in1)/conv_integer(in2), 8))
        when rst = '0' else 
        "00000000";
        
    output_valid <= 
        '1' when rst = '0' else 
        '0';

end divide_impl;

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:
