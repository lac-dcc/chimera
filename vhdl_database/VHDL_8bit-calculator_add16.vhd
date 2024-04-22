library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity add16 is
    port (
        clk, rst : in std_logic;
        in1, in2 : in std_logic_vector (0 to 15); 
        output : out std_logic_vector (0 to 15);
        start : in std_logic;
        done : out std_logic
    );
end add16;

architecture add_impl of add16 is
        
    component one_bit_adder is 
        port(
            x, y, c_in : in std_logic; 
            o, c_out : out std_logic
        );
    end component;

    signal carry_bus : std_logic_vector (0 to 15);
    signal output_sig : std_logic_vector (0 to 15);
    signal output_valid_sig : std_logic;
    signal clk_count : integer := 0;

begin

    output <= output_sig when rst = '0' else "0000000000000000";
    done <= output_valid_sig when rst = '0' else '0';
    output_valid_sig <= '1' when clk_count = 16 else '0';

    add_first : one_bit_adder port map(
        x => in1(15),
        y => in2(15),
        c_in => '0',
        o => output_sig(15),
        c_out => carry_bus(15)
    );

    addgen : for x in 0 to 14 generate
        adder : one_bit_adder port map(
            x => in1(x),
            y => in2(x),
            o => output_sig(x),
            c_in => carry_bus(x + 1),
            c_out => carry_bus(x)
        );
    end generate;

    assure_valid : process (start, rst, clk) 
    begin
        if (start = '1') then
            clk_count <= 0;
        elsif (rst = '1') then
            clk_count <= 0;
        else
            clk_count <= clk_count + 1;
        end if;
    end process;

end add_impl;

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:
